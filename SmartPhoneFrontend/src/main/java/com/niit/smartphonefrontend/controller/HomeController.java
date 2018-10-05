package com.niit.smartphonefrontend.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

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
	public String RootPage(HttpSession httpSession,Model model)
	{
		model.addAttribute("title","GalaxyWorld");
		return "index";
	}
	
	@RequestMapping("/index")
	public String homePage(Model model)
	{
		model.addAttribute("title","GalaxyWorld");
		return "index";
	}
	
	@RequestMapping("/AboutUs")
	public String aboutUsPage(Model model)
	{
		model.addAttribute("title","About Us");
		return "AboutUs";
	}
	
	@RequestMapping("/adminHome")
	public String adminPage(Model model)
	{
		model.addAttribute("title","GalaxyWorld");
		return "AdminHome";
	}
	
	@RequestMapping("/logOut")
	public String logoutPage(Model model)
	{
		model.addAttribute("title","Login Page");
		return "login";
	}
	
	@RequestMapping("/login")
	public String loginPage(Model model)
	{
		model.addAttribute("title","Login Page");
		return "login";
	}
	
	@RequestMapping("/Cart")
	public String CartPage(Model model)
	{
		model.addAttribute("title","Cart Page");
		return "Cart";
	}
	
	@RequestMapping("/Signup")
	public String signupPage(Model model)
	{
		model.addAttribute("title","SignUp Page");
		model.addAttribute("user",customer);
		return "SignUp";
	}
	
	@RequestMapping("/adminCategory")
	public String categoryPage(Model model)
	{  
		model.addAttribute("title","Category Page");
		List<Category> allCategories= categoryRepository.getAllCategory();
		model.addAttribute("cat",category);
		model.addAttribute("categoryList",allCategories);
		return "Category";
		
	}
	
	@RequestMapping("/adminProduct")
	public String productPage(Model model)
	{  
		model.addAttribute("title","Product Page");
		List<Product> allProducts= productRepository.getAllProduct();
		List<Category> allCategories= categoryRepository.getAllCategory();
		model.addAttribute("productOBJ",product);
		model.addAttribute("productList",allProducts);
		model.addAttribute("categoryList",allCategories);
		return "Product";
		
	}

}
