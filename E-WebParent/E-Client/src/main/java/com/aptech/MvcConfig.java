package com.aptech;

import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Locale;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.i18n.LocaleChangeInterceptor;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

//@Configuration
public class MvcConfig implements WebMvcConfigurer {

//	@Override
//	public void addResourceHandlers(ResourceHandlerRegistry registry) {
//		exposeDirectory("../category-images", registry);
//		exposeDirectory("../product-images", registry);
//		exposeDirectory("../brand-logos", registry);
//		exposeDirectory("../banner-images", registry);
//		exposeDirectory("../site-logo", registry);
//		exposeDirectory("../shop-images", registry);
//	}
//	
//	private void exposeDirectory(String pathPattern, ResourceHandlerRegistry registry) {
//		Path path = Paths.get(pathPattern);
//		String absolutePath = path.toFile().getAbsolutePath();
//		
//		String logicalPath = pathPattern.replace("../", "") + "/**";
//				
//		registry.addResourceHandler(logicalPath)
//			.addResourceLocations("file:/" + absolutePath + "/");		
//	}
	
	
}