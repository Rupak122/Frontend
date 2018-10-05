package com.niit.smartphonefrontend.controller;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.niit.smartphonebackend.dao.CategoryRepository;
import com.niit.smartphonebackend.model.Category;
@Controller
public class CategoryController 
{
	@Autowired
	CategoryRepository categoryRepository;
	@Autowired
	Category category;

	@RequestMapping(value="/adminaddCategory",method=RequestMethod.POST)
	public String categoryAdd(@ModelAttribute("cat") Category category)
	{
		if(category.getCategoryId()==0)
		{
		categoryRepository.addCategory(category);
		}
		else
		{
			categoryRepository.updateCategory(category);
		}
		
		return "redirect:/adminCategory";
	}
	
	
	@RequestMapping("/admindeleteCategory/{id}")
	
		public String categoryDelete(@PathVariable("id") int categoryId)
		{
			categoryRepository.deleteCategory(categoryId);
			return "redirect:/adminCategory";
	}
	@RequestMapping("/admineditCategory/{id}")
	
	public String categoryUpdate(@PathVariable("id") int categoryId,Model model)
	{
		Category categoryData=categoryRepository.getCategoryById(categoryId);
		model.addAttribute("cat",categoryData);
		List<Category> allCategories= categoryRepository.getAllCategory();
		model.addAttribute("categoryList",allCategories);
		return "Category";
}
	
	
	
	
	
}
