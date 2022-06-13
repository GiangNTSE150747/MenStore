
package com.menstore.DAO;

import com.menstore.model.OrderDetail;
import java.util.List;

public interface IOrderDetailDAO {
    
    int getNoOfRecords();
    
    List<OrderDetail> list();
    
    List<OrderDetail> list(String OrderId);
    
    List<OrderDetail> list(int start, int recordsPerPage);
    
    boolean save(OrderDetail orderDetail);
    
    
}
