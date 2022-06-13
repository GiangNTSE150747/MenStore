/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.menstore.DAO;

import com.menstore.model.Voucher;
import java.util.List;

/**
 *
 * @author MyPC
 */
public interface IVoucherDAO {
    int loadDiscountedPercent(String voucherId);
    
    Voucher find(String voucherId);

    int getNoOfRecords();

    List<Voucher> list(int i, int recordsPerPage);

    List<Voucher> list(int i, int recordsPerPage, String direction, String by);

    boolean delete(String id);

    boolean add(Voucher voucher);

    boolean edit(Voucher voucher);
}
