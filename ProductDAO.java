package com.psl.KB.DAO;

import java.util.Set;

import com.psl.KB.model.Product;

public interface ProductDAO {

	public Product getProductById(int ProductId);

	public Product getProductByName(String ProductName);

	public boolean isProductExist(String ProductName);

	public boolean addProduct(Product Product);

	public Set<Product> getAllProduct();
}
