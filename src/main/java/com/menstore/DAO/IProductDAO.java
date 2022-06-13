
package com.menstore.DAO;

import com.menstore.model.Product;
import java.util.ArrayList;
import java.util.List;

public interface IProductDAO {
    List<Product> list();
    
    int getNoOfRecords();
    
    List<Product> list(int start, int recordsPerPage, String direction, String by);
    
    List<Product> list(int start, int recordsPerPage);
    
    boolean delete(String productId);
    
    boolean add(Product product);
    
    boolean edit(Product product);
    
    List<Product> search(int start, int recordsPerPage, String by, String keyword);
    
    List<Product> listBy(int start, int recordsPerPage, String category);
    
    Product find(String id);
    
    ArrayList<String> findSizes(String name);

}
