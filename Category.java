package com.psl.KB.DAO;

import java.util.Set;

public interface Category {

	public Category getCategoryById(int CategoryId);

	public Category getCategoryByName(String CategoryName);

	public boolean isCategoryExist(String categoryId);

	public boolean addCategory(Category Category);

	public Set<Category> getAllCategory();

}
