/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.menstore.DAOimpl;

import com.menstore.DAO.IProductDAO;
import com.menstore.model.Product;
import com.menstore.utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author MyPC
 */
public class RunningOutProductDAO implements IProductDAO {

    @Override
    public List<Product> list() {
        ArrayList<Product> list;
        list = new ArrayList<Product>();

        String sql = "select * from Product";

        try {

            Connection conn = DBUtils.getConnection();

            PreparedStatement ps = conn.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Product product = new Product();
                product.setProductId(rs.getString("ProductID"));
                product.setProductName(rs.getString("ProductName"));
                product.setSize(rs.getString("Size"));
                product.setPrice(rs.getInt("Price"));
                product.setStatus(rs.getString("Status"));
                product.setDiscount(rs.getFloat("Discount"));
                product.setQuantity(rs.getInt("Quantity"));
                product.setCategoryId(rs.getString("CategoryID"));
                product.setLinkImage(rs.getString("Link_image"));
                list.add(product);
            }

        } catch (Exception ex) {

            ex.printStackTrace();

        }

        return list;
    }

    @Override
    public int getNoOfRecords() {

        String sql = "SELECT COUNT(ProductID) as noOfRecords FROM Product "
                + " WHERE Quantity <= 10";

        try {

            Connection conn = DBUtils.getConnection();

            PreparedStatement ps = conn.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                return rs.getInt("noOfRecords");
            }

        } catch (Exception ex) {

            ex.printStackTrace();

        }
        return 0;
    }

    @Override
    public List<Product> list(int start, int recordsPerPage) {
        ArrayList<Product> list;
        list = new ArrayList<Product>();

        String sql = "SELECT *\n"
                + " FROM Product\n"
                + " WHERE Quantity <= 10\n"
                + " ORDER BY ProductID\n"
                + " OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

        try {

            Connection conn = DBUtils.getConnection();

            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setInt(1, start);
            ps.setInt(2, recordsPerPage);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Product product = new Product();
                product.setProductId(rs.getString("ProductID"));
                product.setProductName(rs.getString("ProductName"));
                product.setSize(rs.getString("Size"));
                product.setPrice(rs.getInt("Price"));
                product.setStatus(rs.getString("Status"));
                product.setDiscount(rs.getFloat("Discount"));
                product.setQuantity(rs.getInt("Quantity"));
                product.setCategoryId(rs.getString("CategoryID"));
                product.setLinkImage(rs.getString("Link_image"));
                list.add(product);
            }

        } catch (Exception ex) {

            ex.printStackTrace();

        }

        return list;
    }

    @Override
    public List<Product> list(int start, int recordsPerPage, String direction, String by) {
        ArrayList<Product> list;
        list = new ArrayList<Product>();
        String sql = " DECLARE @col as varchar(255) = ?\n";

        String direc = direction.equals("up") ? "ASC" : "DESC";

        if (by.equals("price") || by.equals("quantity")) {
            sql += " SELECT *\n"
                    + " FROM Product\n"
                     + " WHERE Quantity <= 10\n"
                    + " ORDER BY CASE @col\n"
                    + "		WHEN 'price' THEN Price\n"
                    + "		WHEN 'quantity' THEN Quantity\n"
                    + "			END " + direc + "\n"
                    + " OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        } else {
            sql += " SELECT *\n"
                    + " FROM Product\n"
                     + " WHERE Quantity <= 10\n"
                    + " ORDER BY CASE @col\n"
                    + "            WHEN 'ID' THEN ProductID\n"
                    + "            WHEN 'name' THEN ProductName\n"
                    + "			END " + direc + "\n"
                    + " OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        }
        try {

            Connection conn = DBUtils.getConnection();

            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, by);
            ps.setInt(2, start);
            ps.setInt(3, recordsPerPage);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Product product = new Product();
                product.setProductId(rs.getString("ProductID"));
                product.setProductName(rs.getString("ProductName"));
                product.setSize(rs.getString("Size"));
                product.setPrice(rs.getInt("Price"));
                product.setStatus(rs.getString("Status"));
                product.setDiscount(rs.getFloat("Discount"));
                product.setQuantity(rs.getInt("Quantity"));
                product.setCategoryId(rs.getString("CategoryID"));
                product.setLinkImage(rs.getString("Link_image"));
                list.add(product);
            }

        } catch (Exception ex) {

            ex.printStackTrace();

        }

        return list;
    }

    @Override
    public boolean delete(String productId) {

        String sql = "DELETE FROM Product WHERE ProductID = ?;";

        try {

            Connection conn = DBUtils.getConnection();

            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, productId);

            if (ps.execute()) {
                return true;
            }

        } catch (Exception ex) {

            ex.printStackTrace();

        }

        return false;
    }

    @Override
    public boolean add(Product product) {

        String sql = "INSERT INTO Product \n"
                + " VALUES(?,?,?,?,?,?,?,?,?)";

        try {

            Connection conn = DBUtils.getConnection();

            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, product.getProductId());
            ps.setString(2, product.getProductName());
            ps.setString(3, product.getStatus());
            ps.setFloat(4, product.getDiscount());
            ps.setInt(5, product.getPrice());
            ps.setInt(6, product.getQuantity());
            ps.setString(7, product.getSize());
            ps.setString(8, product.getCategoryId());
            ps.setString(9, product.getLinkImage());

            if (ps.execute()) {
                return true;
            }

        } catch (Exception ex) {

            ex.printStackTrace();

        }

        return false;
    }

    @Override
    public boolean edit(Product product) {
        String sql = "UPDATE Product\n"
                + " SET ProductName = ?, Size = ?, Price = ?, Status = ?, Discount = ?, Quantity = ?, CategoryID = ?, Link_image = ?\n"
                + " WHERE ProductID = ?";

        try {

            Connection conn = DBUtils.getConnection();

            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(9, product.getProductId());
            ps.setString(1, product.getProductName());
            ps.setString(2, product.getSize());
            ps.setInt(3, product.getPrice());
            ps.setString(4, product.getStatus());
            ps.setFloat(5, product.getDiscount());
            ps.setInt(6, product.getQuantity());
            ps.setString(7, product.getCategoryId());
            ps.setString(8, product.getLinkImage());

            return ps.execute();

        } catch (Exception ex) {

            ex.printStackTrace();

        }

        return false;
    }

    @Override
    public List<Product> search(int start, int recordsPerPage, String by, String keyword) {

        ArrayList<Product> list;
        list = new ArrayList<Product>();
        String sql = " DECLARE @col as varchar(255) = ?\n"
                + " select * from Product\n"
                + " Where CASE @col\n"
                + "    WHEN  'ProductID' THEN ProductID\n"
                + "    WHEN  'ProductName' THEN ProductName\n"
                + "    WHEN  'CategoryID' THEN CategoryID\n"
                + "    WHEN  'Status' THEN Status\n"
                + "	END like ?\n"
                + " Order by ProductID\n"
                + " OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

        try {

            Connection conn = DBUtils.getConnection();

            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setInt(3, start);
            ps.setInt(4, recordsPerPage);
            ps.setString(1, by);
            ps.setString(2, "%" + keyword + "%");

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Product product = new Product();
                product.setProductId(rs.getString("ProductID"));
                product.setProductName(rs.getString("ProductName"));
                product.setSize(rs.getString("Size"));
                product.setPrice(rs.getInt("Price"));
                product.setStatus(rs.getString("Status"));
                product.setDiscount(rs.getFloat("Discount"));
                product.setQuantity(rs.getInt("Quantity"));
                product.setCategoryId(rs.getString("CategoryID"));
                product.setLinkImage(rs.getString("Link_image"));
                list.add(product);
            }

        } catch (Exception ex) {

            ex.printStackTrace();

        }

        return list;

    }

    @Override
    public List<Product> listBy(int start, int recordsPerPage, String category) {
        ArrayList<Product> list;
        list = new ArrayList<Product>();
        String sql = "SELECT *\n"
                + " FROM Product\n"
                + " JOIN Category ON Product.CategoryID=Category.CategoryID\n"
                + " WHERE Category.CategoryID = ? AND Quantity <= 10 \n"
                + " ORDER BY Category.CategoryID\n"
                + " OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

        try {

            Connection conn = DBUtils.getConnection();

            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, category);
            ps.setInt(2, start);
            ps.setInt(3, recordsPerPage);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Product product = new Product();
                product.setProductId(rs.getString("ProductID"));
                product.setProductName(rs.getString("ProductName"));
                product.setSize(rs.getString("Size"));
                product.setPrice(rs.getInt("Price"));
                product.setStatus(rs.getString("Status"));
                product.setDiscount(rs.getFloat("Discount"));
                product.setQuantity(rs.getInt("Quantity"));
                product.setCategoryId(rs.getString("CategoryID"));
                product.setLinkImage(rs.getString("Link_image"));
                list.add(product);
            }

        } catch (Exception ex) {

            ex.printStackTrace();

        }

        return list;

    }

    @Override
    public Product find(String id) {
        Product product = new Product();
        String sql = "SELECT * FROM Product WHERE ProductID = ?";

        try {

            Connection conn = DBUtils.getConnection();

            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                product.setProductId(rs.getString("ProductID"));
                product.setProductName(rs.getString("ProductName"));
                product.setSize(rs.getString("Size"));
                product.setPrice(rs.getInt("Price"));
                product.setStatus(rs.getString("Status"));
                product.setDiscount(rs.getFloat("Discount"));
                product.setQuantity(rs.getInt("Quantity"));
                product.setCategoryId(rs.getString("CategoryID"));
                product.setLinkImage(rs.getString("Link_image"));

            }

        } catch (Exception ex) {

            ex.printStackTrace();

        }

        return product;
    }

    @Override
    public ArrayList<String> findSizes(String string) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
