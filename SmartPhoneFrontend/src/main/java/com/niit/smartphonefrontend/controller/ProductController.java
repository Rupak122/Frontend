package com.niit.smartphonefrontend.controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.niit.smartphonebackend.dao.CategoryRepository;
import com.niit.smartphonebackend.dao.ProductRepository;
import com.niit.smartphonebackend.model.Category;
import com.niit.smartphonebackend.model.Product;

@Controller
public class ProductController 
{
	@Autowired
	ProductRepository productRepository;
	@Autowired
	Product product;
	@Autowired
	CategoryRepository categoryRepository;

	@RequestMapping(value="/adminaddProduct",method=RequestMethod.POST)
	public String productAdd(@ModelAttribute("productOBJ") Product product,HttpSession httpSession)
	{
		if(product.getProductId()==0)
		{
			if(productRepository.addProduct(product))
			{
				MultipartFile file=product.getProductImage();
				
				ServletContext con=httpSession.getServletContext();
				String filelocation=con.getRealPath("/resources/images/");
				System.out.println(filelocation);
				String filename=filelocation+"\\"+product.getProductId()+".jpg";
				System.out.println(filename);
				
				try{
					byte b[]=file.getBytes();
					FileOutputStream fos=new FileOutputStream(filename);
					fos.write(b);
					fos.close();
			    	}
				catch(IOException ex){}
				catch(Exception e){}
				
			}
		}
		else
		{
			productRepository.updateProduct(product);
		}
		
		return "redirect:/adminProduct";
	}
	
	
	@RequestMapping("/admindeleteProduct/{id}")
	
		public String productDelete(@PathVariable("id") int productId)
		{
		productRepository.deleteProduct(productId);
			return "redirect:/adminProduct";
	}
	
	
	@RequestMapping("/admineditProduct/{id}")
	
	public String productUpdate(@PathVariable("id") int productId,Model model)
	{
		Product productData=productRepository.getProductById(productId);
		model.addAttribute("productOBJ",productData);
		List<Product> allProducts= productRepository.getAllProduct();
		List<Category> allCategories= categoryRepository.getAllCategory();
		model.addAttribute("productList",allProducts);
		model.addAttribute("categoryList",allCategories);
		return "Product";
    }
	
	@RequestMapping("getAllProductsBycategory/{categoryId}")
	public String getAllProductByCategory(@PathVariable("categoryId")int categoryId,Model model)
		{
			System.out.println("product by categoryid1");
			
			List<Product>productL=productRepository.getAllProducts(categoryId);
			model.addAttribute("productL",productL);
			return "ShowProduct";
	}

	
	
	
	
	@RequestMapping("ProductDesc/{productId}")
	public String productDescription(@PathVariable("productId")int productId,Model model)
		{
			
			Product productData=productRepository.getProductById(productId);
			model.addAttribute("prdDesc",productData);
			return "ProductDescription";
	    }

}
