package com.aptech.shop;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.aptech.ControllerHelper;
import com.aptech.Utility;
import com.aptech.category.CategoryService;
import com.aptech.common.entity.Category;
import com.aptech.common.entity.Customer;
import com.aptech.common.entity.Shop;
import com.aptech.common.entity.section.Section;
import com.aptech.common.entity.section.SectionType;
import com.aptech.common.exception.ShopNotFoundException;
import com.aptech.section.SectionService;


@Controller
public class ShopController {
	@Autowired private ShopService shopService;
	@Autowired private ControllerHelper controllerHelper;
	@Autowired private CategoryService categoryService;
	@Autowired private SectionService sectionService;
	
	@GetMapping("/shops")
	public String listFirstPage(Model model, HttpServletRequest request) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		if (authentication == null || authentication instanceof AnonymousAuthenticationToken) {
			
			return "login";
		}
		
		return listShopsByPage(model, request, 1, "createdTime", "desc", null);	
		
	}

	@GetMapping("/shops/page/{pageNum}")
	public String listShopsByPage(Model model, HttpServletRequest request,
						@PathVariable(name = "pageNum") int pageNum,
						String sortField, String sortDir, String keyword
			) {
		
		List<Section> listSections = sectionService.listEnabledSections();
		model.addAttribute("listSections", listSections);
		
		
		
		if (hasAllCategoriesSection(listSections)) {
			List<Category> listCategories = categoryService.listNoChildrenCategories();
			model.addAttribute("listCategories", listCategories);
		}
		Customer customer = controllerHelper.getAuthenticatedCustomer(request);
		
		Page<Shop> page = shopService.listForCustomerByPage(customer, pageNum, sortField, sortDir, keyword);
		List<Shop> listShops = page.getContent();
		
		model.addAttribute("totalPages", page.getTotalPages());
		model.addAttribute("totalItems", page.getTotalElements());
		model.addAttribute("currentPage", pageNum);
		model.addAttribute("listShops", listShops);
		model.addAttribute("sortField", sortField);
		model.addAttribute("sortDir", sortDir);
		model.addAttribute("keyword", keyword);
		model.addAttribute("moduleURL", "/shops");
		model.addAttribute("reverseSortDir", sortDir.equals("asc") ? "desc" : "asc");
		
		long startCount = (pageNum - 1) * ShopService.SHOPS_PER_PAGE + 1;
		model.addAttribute("startCount", startCount);
		
		long endCount = startCount + ShopService.SHOPS_PER_PAGE - 1;
		if (endCount > page.getTotalElements()) {
			endCount = page.getTotalElements();
		}
		
		model.addAttribute("endCount", endCount);
		model.addAttribute("shop", new Shop());
		
		return "shops/shop_customer";		
	}
	
	private boolean hasAllCategoriesSection(List<Section> listSections) {
		for (Section section : listSections) {
			if (section.getType().equals(SectionType.ALL_CATEGORIES)) {
				return true;
			}
		}
		
		return false;
	}
	
	
	@PostMapping("/shops/save")
	public String createShop(RedirectAttributes redirectAttributes, HttpServletRequest request, Shop shop) {	
		Customer customer = controllerHelper.getAuthenticatedCustomer(request);
		shopService.createShop(shop, customer);
		
		redirectAttributes.addFlashAttribute("message", "The shop has been create successfully.");
		return "redirect:/shops";
		
	}
	
	@GetMapping("/shops/edit/{id}")
	public String editUser(@PathVariable(name = "id") Integer id, 
			Model model,
			RedirectAttributes redirectAttributes) {
		try {
			Shop shop = shopService.get(id);
			
			List<Section> listSections = sectionService.listEnabledSections();
			model.addAttribute("listSections", listSections);
			
			if (hasAllCategoriesSection(listSections)) {
				List<Category> listCategories = categoryService.listNoChildrenCategories();
				model.addAttribute("listCategories", listCategories);
			}
			
			model.addAttribute("shop", shop);
			model.addAttribute("pageTitle", "Edit Shop (ID: " + id + ")");
			
			return "shops/shop_form";
		} catch (ShopNotFoundException ex) {
			redirectAttributes.addFlashAttribute("message", ex.getMessage());
			return "redirect:/shops";
		}
	}
	
	@PostMapping("/update_shop")
	public String updateShopDetails(Model model, Shop shop, RedirectAttributes ra,
			HttpServletRequest request) throws ShopNotFoundException {
		Customer customer = controllerHelper.getAuthenticatedCustomer(request);
		shopService.updateShop(shop, customer);
		ra.addFlashAttribute("message", "Your shop details have been updated.");
			
		return "redirect:/shops";
		
	}
	
	@GetMapping("/shops/delete/{id}")
	public String deleteShop(@PathVariable(name = "id") Integer id,
			Model model, RedirectAttributes ra) {
		try {
			shopService.delete(id);
			ra.addFlashAttribute("message", "The shop ID " + id + " has been deleted.");
		} catch (ShopNotFoundException ex) {
			ra.addFlashAttribute("message", ex.getMessage());
		}
		return "redirect:/shops";
	}	
	
}
