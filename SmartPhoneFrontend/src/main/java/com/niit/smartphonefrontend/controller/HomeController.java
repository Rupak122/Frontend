package com.niit.smartphonefrontend.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.niit.smartphonebackend.dao.CategoryRepository;
import com.niit.smartphonebackend.dao.ProductRepository;
import com.niit.smartphonebackend.model.Category;
import com.niit.smartphonebackend.model.Customer;
import com.niit.smartphonebackend.model.Product;
@Controller
public class HomeController 
{
	@Autowired
	private Category category;
	@Autowired
	private Customer customer;
	@Autowired
	private Product product;
	@Autowired
	private CategoryRepository categoryRepository;
	@Autowired
	private ProductRepository productRepository;
	@RequestMapping("/")
	public String RootPage()
	{
		return "index";
	}
	
	@RequestMapping("/index")
	public String homePage()
	{
		return "index";
	}
	
	@RequestMapping("/AboutUs")
	public String aboutUsPage()
	{
		return "AboutUs";
	}
	
	@RequestMapping("/adminHome")
	public String adminPage()
	{
		return "AdminHome";
	}
	
	@RequestMapping("/logOut")
	public String logoutPage()
	{
		return "login";
	}
	
	@RequestMapping("/login")
	public String loginPage()
	{
		return "login";
	}
	@RequestMapping("/Signup")
	public String signupPage(Model model)
	{
		model.addAttribute("user",customer);
		return "SignUp";
	}
	
	@RequestMapping("/adminCategory")
	public String categoryPage(Model model)
	{  
		List<Category> allCategories= categoryRepository.getAllCategory();
		model.addAttribute("cat",category);
		model.addAttribute("categoryList",allCategories);
		return "Category";
		
	}
	
	@RequestMapping("/adminProduct")
	public String productPage(Model model)
	{  
		List<Product> allProducts= productRepository.getAllProduct();
		List<Category> allCategories= categoryRepository.getAllCategory();
		model.addAttribute("productOBJ",product);
		model.addAttribute("productList",allProducts);
		model.addAttribute("categoryList",allCategories);
		return "Product";
		
	}

}
