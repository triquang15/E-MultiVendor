package com.aptech.product;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.aptech.ControllerHelper;
import com.aptech.FileUploadUtil;
import com.aptech.brand.BrandService;
import com.aptech.category.CategoryService;
import com.aptech.common.entity.Brand;
import com.aptech.common.entity.Category;
import com.aptech.common.entity.Customer;
import com.aptech.common.entity.Question;
import com.aptech.common.entity.Review;
import com.aptech.common.entity.product.Product;
import com.aptech.common.exception.CategoryNotFoundException;
import com.aptech.common.exception.ProductNotFoundException;
import com.aptech.paging.PagingAndSortingHelper;
import com.aptech.paging.PagingAndSortingParam;
import com.aptech.question.QuestionService;
import com.aptech.question.vote.QuestionVoteService;
import com.aptech.review.ReviewService;
import com.aptech.review.vote.ReviewVoteService;

@Controller
public class ProductController {
	private String defaultRedirectURL = "redirect:/products/page/1?sortField=name&sortDir=asc&categoryId=0";
	@Autowired private ProductService productService;
	@Autowired private CategoryService categoryService;
	@Autowired private ReviewService reviewService;	
	@Autowired private ReviewVoteService reviewVoteService;
	@Autowired private QuestionVoteService questionVoteService;
	@Autowired private ControllerHelper controllerHelper;
	@Autowired private QuestionService questionService;
	@Autowired private BrandService brandService;

	/* FRONT END START */
	@GetMapping("/c/{category_alias}")
	public String viewCategoryFirstPage(@PathVariable("category_alias") String alias,
			Model model) {
		return viewCategoryByPage(alias, 1, model);
	}
	
	@GetMapping("/c/{category_alias}/page/{pageNum}")
	public String viewCategoryByPage(@PathVariable("category_alias") String alias,
			@PathVariable("pageNum") int pageNum,
			Model model) {
		try {
			Category category = categoryService.getCategory(alias);		
			List<Category> listCategoryParents = categoryService.getCategoryParents(category);
			
			Page<Product> pageProducts = productService.listByCategory(pageNum, category.getId());
			List<Product> listProducts = pageProducts.getContent();
			
			long startCount = (pageNum - 1) * ProductService.PRODUCTS_PER_PAGE + 1;
			long endCount = startCount + ProductService.PRODUCTS_PER_PAGE - 1;
			if (endCount > pageProducts.getTotalElements()) {
				endCount = pageProducts.getTotalElements();
			}
			
			
			model.addAttribute("currentPage", pageNum);
			model.addAttribute("totalPages", pageProducts.getTotalPages());
			model.addAttribute("startCount", startCount);
			model.addAttribute("endCount", endCount);
			model.addAttribute("totalItems", pageProducts.getTotalElements());
			model.addAttribute("pageTitle", category.getName());
			model.addAttribute("listCategoryParents", listCategoryParents);
			model.addAttribute("listProducts", listProducts);
			model.addAttribute("category", category);
			
			return "product/products_by_category";
		} catch (CategoryNotFoundException ex) {
			return "error/404";
		}
	}
	
	@GetMapping("/p/{product_alias}")
	public String viewProductDetail(@PathVariable("product_alias") String alias, Model model,
			HttpServletRequest request) {
		
		try {
			Product product = productService.getProduct(alias);
			List<Category> listCategoryParents = categoryService.getCategoryParents(product.getCategory());
			List<Question> listQuestions = questionService.getTop3VotedQuestions(product.getId());
			Page<Review> listReviews = reviewService.list3MostVotedReviewsByProduct(product);
			
			Customer customer = controllerHelper.getAuthenticatedCustomer(request);
			
			if (customer != null) {
				boolean customerReviewed = reviewService.didCustomerReviewProduct(customer, product.getId());
				reviewVoteService.markReviewsVotedForProductByCustomer(listReviews.getContent(), product.getId(), customer.getId());
				questionVoteService.markQuestionsVotedForProductByCustomer(listQuestions, product.getId(), customer.getId());
				
				if (customerReviewed) {
					model.addAttribute("customerReviewed", customerReviewed);
				} else {
					boolean customerCanReview = reviewService.canCustomerReviewProduct(customer, product.getId());
					model.addAttribute("customerCanReview", customerCanReview);
				}
			}
			
			int numberOfQuestions = questionService.getNumberOfQuestions(product.getId());
			int numberOfAnsweredQuestions = questionService.getNumberOfAnsweredQuestions(product.getId());
			
			model.addAttribute("listQuestions", listQuestions);			
			model.addAttribute("numberOfQuestions", numberOfQuestions);
			model.addAttribute("numberOfAnsweredQuestions", numberOfAnsweredQuestions);
			
			model.addAttribute("listCategoryParents", listCategoryParents);
			model.addAttribute("product", product);
			model.addAttribute("listReviews", listReviews);
			model.addAttribute("pageTitle", product.getShortName());
			
			return "product/product_detail";
		} catch (ProductNotFoundException e) {
			return "error/404";
		}
	}
	
	@GetMapping("/search")
	public String searchFirstPage(String keyword, Model model) {
		return searchByPage(keyword, 1, model);
	}
	
	@GetMapping("/search/page/{pageNum}")
	public String searchByPage(String keyword,
			@PathVariable("pageNum") int pageNum,
			Model model) {
		Page<Product> pageProducts = productService.search(keyword, pageNum);
		List<Product> listResult = pageProducts.getContent();
		
		long startCount = (pageNum - 1) * ProductService.SEARCH_RESULTS_PER_PAGE + 1;
		long endCount = startCount + ProductService.SEARCH_RESULTS_PER_PAGE - 1;
		if (endCount > pageProducts.getTotalElements()) {
			endCount = pageProducts.getTotalElements();
		}
		
		model.addAttribute("currentPage", pageNum);
		model.addAttribute("totalPages", pageProducts.getTotalPages());
		model.addAttribute("startCount", startCount);
		model.addAttribute("endCount", endCount);
		model.addAttribute("totalItems", pageProducts.getTotalElements());
		model.addAttribute("pageTitle", keyword + " - Search Result");
		
		model.addAttribute("keyword", keyword);
		model.addAttribute("searchKeyword", keyword);
		model.addAttribute("listResult", listResult);
		
		return "product/search_result";
	}	
	/* FRONT END END */
	
	/* MAPPING DATA BACKEND START */
	
	
	@GetMapping("/products")
	public String listFirstPage(Model model) {
		return "shops/shop_product";
	}
	
//	@GetMapping("/products/page/{pageNum}")
//	public String listByPage(
//			@PagingAndSortingParam(listName = "listProducts", moduleURL = "/products") PagingAndSortingHelper helper,
//			@PathVariable(name = "pageNum") int pageNum, Model model,
//			Integer categoryId
//			) {
//		
//		productService.listByPage(pageNum, helper, categoryId);
//		
//		List<Category> listCategories = categoryService.listCategoriesUsedInForm();
//		
//		if (categoryId != null) model.addAttribute("categoryId", categoryId);
//		model.addAttribute("listCategories", listCategories);
//		
//		return "shops/shop_product";		
//	}
//	
//	@GetMapping("/products/new")
//	public String newProduct(Model model) {
//		List<Brand> listBrands = brandService.listAll();
//		
//		Product product = new Product();
//		product.setEnabled(true);
//		product.setInStock(true);
//		
//		model.addAttribute("product", product);
//		model.addAttribute("listBrands", listBrands);
//		model.addAttribute("pageTitle", "Create New Product");
//		model.addAttribute("numberOfExistingExtraImages", 0);
//		
//		return "shops/shop_product_form";
//	}
//	
//	@PostMapping("/products/save")
//	public String saveProduct(Product product, RedirectAttributes ra,
//			@RequestParam(value = "fileImage", required = false) MultipartFile mainImageMultipart,			
//			@RequestParam(value = "extraImage", required = false) MultipartFile[] extraImageMultiparts,
//			@RequestParam(name = "detailIDs", required = false) String[] detailIDs,
//			@RequestParam(name = "detailNames", required = false) String[] detailNames,
//			@RequestParam(name = "detailValues", required = false) String[] detailValues,
//			@RequestParam(name = "imageIDs", required = false) String[] imageIDs,
//			@RequestParam(name = "imageNames", required = false) String[] imageNames
//			
//			) throws IOException {
//		
//		
//		
//		ProductSaveHelper.setMainImageName(mainImageMultipart, product);
//		ProductSaveHelper.setExistingExtraImageNames(imageIDs, imageNames, product);
//		ProductSaveHelper.setNewExtraImageNames(extraImageMultiparts, product);
//		ProductSaveHelper.setProductDetails(detailIDs, detailNames, detailValues, product);
//			
//		Product savedProduct = productService.save(product);
//		
//		ProductSaveHelper.saveUploadedImages(mainImageMultipart, extraImageMultiparts, savedProduct);
//		
//		ProductSaveHelper.deleteExtraImagesWeredRemovedOnForm(product);
//		
//		ra.addFlashAttribute("message", "The product has been saved successfully.");
//		
//		return defaultRedirectURL;
//	}
//
//	
//	@GetMapping("/products/{id}/enabled/{status}")
//	public String updateProductEnabledStatus(@PathVariable("id") Integer id,
//			@PathVariable("status") boolean enabled, RedirectAttributes redirectAttributes) {
//		productService.updateProductEnabledStatus(id, enabled);
//		String status = enabled ? "enabled" : "disabled";
//		String message = "The Product ID " + id + " has been " + status;
//		redirectAttributes.addFlashAttribute("message", message);
//		
//		return defaultRedirectURL;
//	}
//	
//	@GetMapping("/products/delete/{id}")
//	public String deleteProduct(@PathVariable(name = "id") Integer id, 
//			Model model, RedirectAttributes redirectAttributes) {
//		try {
//			productService.delete(id);
//			String productExtraImagesDir = "../product-images/" + id + "/extras";
//			String productImagesDir = "../product-images/" + id;
//			
//			FileUploadUtil.removeDir(productExtraImagesDir);
//			FileUploadUtil.removeDir(productImagesDir);
//			
//			redirectAttributes.addFlashAttribute("message", 
//					"The product ID " + id + " has been deleted successfully");
//		} catch (ProductNotFoundException ex) {
//			redirectAttributes.addFlashAttribute("message", ex.getMessage());
//		}
//		
//		return defaultRedirectURL;
//	}
//	
//	@GetMapping("/products/edit/{id}")
//	public String editProduct(@PathVariable("id") Integer id, Model model,
//			RedirectAttributes ra) {
//		try {
//			Product product = productService.get(id);
//			List<Brand> listBrands = brandService.listAll();
//			Integer numberOfExistingExtraImages = product.getImages().size();
//			
//			boolean isReadOnlyForSalesperson = false;
//						
//			model.addAttribute("isReadOnlyForSalesperson", isReadOnlyForSalesperson);
//			model.addAttribute("product", product);
//			model.addAttribute("listBrands", listBrands);
//			model.addAttribute("pageTitle", "Edit Product (ID: " + id + ")");
//			model.addAttribute("numberOfExistingExtraImages", numberOfExistingExtraImages);
//			
//			return "shops/shop_product_form";
//			
//		} catch (ProductNotFoundException e) {
//			ra.addFlashAttribute("message", e.getMessage());
//			
//			return defaultRedirectURL;
//		}
//	}
//	
//	@GetMapping("/products/detail/{id}")
//	public String viewProductDetails(@PathVariable("id") Integer id, Model model,
//			RedirectAttributes ra) {
//		try {
//			Product product = productService.get(id);			
//			model.addAttribute("product", product);		
//			
//			return "shops/shop_product_detail_modal";
//			
//		} catch (ProductNotFoundException e) {
//			ra.addFlashAttribute("message", e.getMessage());
//			
//			return defaultRedirectURL;
//		}
//	}	
	
	/* MAPPING DATA BACKEND END */
}
