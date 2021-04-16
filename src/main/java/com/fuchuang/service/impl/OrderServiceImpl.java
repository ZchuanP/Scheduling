package com.fuchuang.service.impl;

import com.fuchuang.mapper.OrderMapper;
import com.fuchuang.mapper.RealProductMapper;
import com.fuchuang.pojo.Order;
import com.fuchuang.pojo.RealProduct;
import com.fuchuang.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class OrderServiceImpl implements OrderService {
    @Autowired
    private OrderMapper orderMapper;

    @Autowired
    private RealProductMapper realProductMapper;

    public List<Order> selectAllOrder() {
        return orderMapper.selectAllOrder();
    }


    @Override
    public Boolean insertOneOrder(Order order) {
        try {
            orderMapper.insertOneOrder(order);
            realProductMapper.insertProducts(order.getProducts());
        }catch (Exception e){
            return false;
        }

        return true;
    }

    @Override
    public Boolean deleteOrderById(int order_id) {
        try {
            realProductMapper.deleteProductByOrderId(order_id);
            orderMapper.deleteOneOrderById(order_id);
        }catch (Exception e){
            return false;
        }

        return true;
    }

    @Override
    public Boolean updateOrder(Order order) {
        try {
            orderMapper.updataOrderById(order);
            realProductMapper.deleteProductByOrderId(order.getOrder_id());
            realProductMapper.insertProducts(order.getProducts());
        }catch (Exception e){
            return false;
        }
        return true;
    }


}