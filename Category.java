package com.psl.KB.DAO;

import java.util.Set;

public interface Category {

	public Category getCategoryById(int CategoryId);

	public Category getCategoryByName(String CategoryName);

	public boolean isCategoryExist(String CategoryName);

	public boolean addCategory(Category Category);

	public Set<Category> getAllCategory();

}
