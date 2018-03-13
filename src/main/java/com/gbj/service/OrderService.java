package com.gbj.service;

import com.gbj.model.Order;

import java.util.List;
import java.util.Map;

public interface OrderService {
	//销售订单模糊查询及分页
	public Map<String, Object> salesOrderList(Map<String, Object> map);

	//新建订单
	public Map<String, Object> salesOrderAdd(Map<String, Object> map);

	public int salesOrderAddAction(Map<String, Object> map);

	//直接编辑订单明细修改执行状态
	public int salesOrderDetailsAction(Map<String, Object> map);

	//间接编辑订单明细
	public Map<String, Object> salesOrderDetails(Map<String, Object> map);

	//生成出库单
	public Map<String, Object> goodsStockOut(Map<String, Object> map, Integer or_id);

	//查询所有已完成订单的购买的商品ID
	public List<Order> haveOrder();

	//查询所有已完成订单的购买商品的总数
	public List<Map<String, Object>> salesSumOrder();

	//取消订单
	public Order cancelOrder(Integer or_id);

	//取消已生成出库单的订单  修改订单的状态和出库单的状态 订单-1 出库单-1
	public int cancelGoodsOut(Map<String, Object> map);

	//查询订单明细
	public Map<String, Object> load(Map<String, Object> map);
}
