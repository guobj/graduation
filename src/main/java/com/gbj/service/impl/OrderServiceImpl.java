package com.gbj.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gbj.mapper.ConsumerMapper;
import com.gbj.mapper.EmployeeMapper;
import com.gbj.mapper.GoodsMapper;
import com.gbj.mapper.GoodsOutMapper;
import com.gbj.mapper.OrderMapper;
import com.gbj.model.Consumer;
import com.gbj.model.Employee;
import com.gbj.model.Goods;
import com.gbj.model.GoodsOut;
import com.gbj.model.Order;
import com.gbj.service.OrderService;
import com.gbj.utils.TimeDemo;
@Service
public class OrderServiceImpl implements OrderService {
    @Autowired
    private OrderMapper orderMapper;
    @Autowired
    private ConsumerMapper consumerMapper;
    @Autowired
    private EmployeeMapper employeeMapper;
    @Autowired
    private GoodsMapper goodsMapper;
    @Autowired
    private GoodsOutMapper goodsOutMapper;
    @Override
    public Map<String , Object> salesOrderList(Map<String , Object> map ) {
        // TODO Auto-generated method stub
        List<Order> salesOrderList = orderMapper.salesOrderList(map);
        int count = orderMapper.count(map);
        if(salesOrderList!=null&&salesOrderList.size()>0){
            map.put("salesOrderList" , salesOrderList);
            System.out.println(salesOrderList);
            map.put("count" , count);
            return  map;
        }else{
            throw new RuntimeException("没有数据");
        }
    }
    @Override
    public Map<String , Object> salesOrderAdd(Map<String , Object> map ) {
        // TODO Auto-generated method stub
        List<Consumer> consumerList = consumerMapper.findAllList();
        List<Employee> employeeList = employeeMapper.findAllList();
        map.put("consumerList" , consumerList);
        map.put("employeeList" , employeeList);
        return map;
    }
    @Override
    public int salesOrderAddAction(Map<String , Object> map ) {
        // TODO Auto-generated method stub
        Order order = (Order) map.get("order");
        List<Goods> goodsList = goodsMapper.findAllgoods();
        int result = orderMapper.salesOrderAddAction(order);
        if(result>0){
            map.put("goodsList" , goodsList);
            map.put("message" , "新建成功");
            return result;
        }else{
            throw new RuntimeException("新建失败");
        }
    }


    //编辑订单明细并修改订单状态
    //事务回滚
    @Override
    public int salesOrderDetailsAction(Map<String , Object> map ) {
        // TODO Auto-generated method stub
        Order order = (Order) map.get("order");
        Integer goodsStock = goodsMapper.goodsStock(order.getFk_goods_id());
        if(goodsStock==0){
            throw new RuntimeException("库存不足");
        }
        Integer or_nums = order.getOr_nums();
        if(or_nums>goodsStock){
            throw new RuntimeException("库存不足");
        }
        //更新库存
        Goods goods = new Goods();
        goods.setGoods_id(order.getFk_goods_id());
        goods.setGoods_nums(or_nums);
        goodsMapper.goodsStockUpdate(goods);
        int result = orderMapper.salesOrderDetailsAction(order);
        if(result>0){
            map.put("message" , "订单创建成功");
            return result;
        }else{
            throw new RuntimeException("订单创建失败");
        }
    }

    //间接编辑订单明细
    @Override
    public Map<String , Object> salesOrderDetails(Map<String , Object> map ) {
        // TODO Auto-generated method stub
        List<Goods> goodsList = goodsMapper.findAllgoods();
        map.put("goodsList" , goodsList);
        return map;
    }
    //生成出库单
    @Override
    public Map<String , Object> goodsStockOut(Map<String , Object> map,Integer or_id ) {
        // TODO Auto-generated method stub
        Order order = orderMapper.loadOrder(or_id);
        GoodsOut goodsOut = new GoodsOut();
        goodsOut.setFk_con_id(order.getFk_con_id());
        goodsOut.setFk_emp_id(order.getFk_emp_id());
        goodsOut.setFk_goods_id(order.getFk_goods_id());
        goodsOut.setFk_or_id(order.getOr_id());
        goodsOut.setGo_ctime(TimeDemo.dateTime());
        goodsOut.setGo_name(order.getGoods().getGoods_name());
        goodsOut.setGo_nums(order.getOr_nums());
        goodsOut.setGo_sumprice(order.getOr_sumprice());
        int result = goodsOutMapper.goodsStockOut(goodsOut);
        if(result>0){
            orderMapper.updateSignThree(or_id);
            map.put("goodsOut" , goodsOut);
            map.put("message" , "出库单已生成");
            return map;
        }else{
            throw new RuntimeException("生成失败");
        }
    }
    @Override
    public List<Order> haveOrder() {
        // TODO Auto-generated method stub
        return orderMapper.haveOrder();
    }
    //查询饼图上的信息
    @Override
    public List<Map<String , Object>> salesSumOrder() {
        // TODO Auto-generated method stub
        return orderMapper.salesSumOrder();
    }
    //取消未生成出库单的订单  只修改订单的状态位-1并将库存数改回原库存
    @Override
    public int cancelOrder(Map<String , Object> map ) {
        // TODO Auto-generated method stub
        Order order = orderMapper.loadOrder(Integer.parseInt(map.get("or_id").toString()));
        int result = orderMapper.cancelOrder(Integer.parseInt(map.get("or_id").toString()));
        System.out.println("得到的状态职位"+order.getOr_status());
        if(order.getOr_status()==1){
            if(result>0){
                //执行库存回加
                Goods goods = new Goods();
                goods.setGoods_nums(order.getOr_nums());
                goods.setGoods_id(order.getFk_goods_id());
                System.out.println("商品ID"+order.getFk_goods_id());
                goodsMapper.goodsStockInUpdateAction(goods);
                map.put("message" , "订单已取消");
                return result;
            }else{
                throw new RuntimeException("取消失败");
            }
        }else{
            if(result>0){
                map.put("message" , "订单已取消");
                return result;
            }else{
                throw new RuntimeException("取消失败");
            }
        }

    }
    //取消已生成出库单的订单  修改订单的状态和出库单的状态 订单-1 出库单-1

    @Override
    public int cancelGoodsOut(Map<String , Object> map ) {
        // TODO Auto-generated method stub
        Order order = orderMapper.loadOrder(Integer.parseInt(map.get("or_id").toString()));
        int result = orderMapper.cancelOrder(Integer.parseInt(map.get("or_id").toString()));
        int res = goodsOutMapper.cancelGoodsOut(Integer.parseInt(map.get("or_id").toString()));
        if(result>0){
            if(res>0){
                //执行库存回加
                Goods goods = new Goods();
                goods.setGoods_nums(order.getOr_nums());
                goods.setGoods_id(order.getFk_goods_id());
                goodsMapper.goodsStockInUpdateAction(goods);
                map.put("message" , "订单已取消");
                return result;
            }else{
                throw new RuntimeException("取消失败");
            }
        }else{
            throw new RuntimeException("取消失败");
        }
    }
    //查询订单的详细信息
    @Override
    public Map<String , Object> load(Map<String , Object> map ) {
        // TODO Auto-generated method stub
        Order order = orderMapper.loadOrder(Integer.parseInt(map.get("or_id").toString()));
        if(order!=null){
            map.put("order" , order);
            return map;
        }else{
            throw new RuntimeException("没有数据");
        }
    }
    
}
