package com.gbj.mapper;

import java.util.List;
import java.util.Map;

import com.gbj.model.Order;

public interface OrderMapper {
    public Map<String , Object> load(Integer or_id);
    //销售订单模糊查询及分页
    public List<Order> salesOrderList(Map<String , Object> map);
    public int count(Map<String , Object> map);
    //新建订单
    public int salesOrderAddAction(Order order);
    //编辑订单明细修改执行状态
    public int salesOrderDetailsAction(Order order);
    //查询一条数据返回Order
    public Order loadOrder(Integer or_id);
    //修改已生成出库单的标志
    public int updateSignThree(Integer or_id);
    //确认已出库交易完成
    public int updateSignTwo(Integer or_id);
    //查询所有已完成订单的购买的商品ID
    public List<Order> haveOrder();
    //查询所有已完成订单的购买商品的总数
    public List<Map<String , Object>> salesSumOrder();
    //取消订单
    public int cancelOrder(Integer or_id);
}
