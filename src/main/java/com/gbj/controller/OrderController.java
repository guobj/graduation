package com.gbj.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gbj.model.Order;
import com.gbj.service.OrderService;
import com.gbj.utils.PageBean;
import com.google.gson.Gson;

@Controller
public class OrderController {
    @Autowired
    private OrderService orderService;
    //销售订单模糊查询及分页
    @RequestMapping("/salesOrder")
    public String salesOrderList(Map<String , Object> map,Order order,@RequestParam(required=false,defaultValue="1")Integer pages,HttpServletRequest request){
        try{
            map = PageBean.serverMap(map , order , pages);
            map = orderService.salesOrderList(map);
            map = PageBean.clientMap(map , pages , request);
        }catch(Exception e){
            // TODO: handle exception
            map.put("message" , e.getMessage());
        }
        return "order/salesOrderList";
    }
    //弹出添加页面及查询的相关页面
    @RequestMapping("/salesOrderAdd")
    public String salesOrderAdd(Map<String , Object> map){
        map = orderService.salesOrderAdd(map);
        return "order/salesOrderAdd";
    }
    //添加订单基本信息
    @RequestMapping("/salesOrderAdd.action")
    public String salesOrderAddAction(Map<String , Object> map,Order order){
        try{
            map.put("order" , order);
            orderService.salesOrderAddAction(map);
            map.put("or_id" , order.getOr_id());
        }catch(Exception e){
            // TODO: handle exception
            map.put("message" , e.getMessage());
        }
        return "order/salesOrderDetails";
    }
    //直接编辑订单明细
    @RequestMapping("/salesOrderDetails.action")
    public String salesOrderDetailsAction(Map<String , Object> map,Order order){
        try{
            map.put("order" , order);
            orderService.salesOrderDetailsAction(map);
        }catch(Exception e){
            // TODO: handle exception
            map.put("message" , e.getMessage());
        }
        return "main/message";
    }
    //间接编辑订单明细
    //弹出编辑窗
    @RequestMapping("/salesOrderDetails")
    public String salesOrderDetails(Map<String , Object> map,Integer or_id){
        map.put("or_id" , or_id);
        map = orderService.salesOrderDetails(map);
        return "order/salesOrderDetails";
    }
    //确认是否生成出库单
    @RequestMapping("/goodsStockOutConfirm")
    public String goodsStockOut(Map<String , Object> map,Integer or_id){
        map.put("or_id" , or_id);
        map.put("url" , "goodsStockOut.action");
        map.put("message" , "是否确认生成出库单？");
        return "order/confirmOrder";
    }
    
    //确认生成出库单
    @RequestMapping("/goodsStockOut.action")
    public String goodsStockOutAction(Map<String , Object> map,Integer or_id){
        map.put("or_id" , or_id);
        System.out.println(or_id);
        try{
            orderService.goodsStockOut(map,or_id);
        }catch(Exception e){
            // TODO: handle exception
            map.put("message" , e.getMessage());
        }
        return "main/message";
    }
    //销售报表
    @RequestMapping("/salesTable")
    public String salesTable(Map<String , Object> map,Integer or_id){
        return "order/salesTable";
    }
    //饼图的动态数据获取
    @RequestMapping("/salesSumOrder")
    public void salesSumOrder(HttpServletResponse response) throws IOException{
        try{
            List<Map<String , Object>> salesSumOrderList = orderService.salesSumOrder();
            Gson gson = new Gson();
            System.out.println("并图数据"+salesSumOrderList);
            String data = gson.toJson(salesSumOrderList);
            System.out.println(data);
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.print(data);
            out.flush();
            out.close();
        }catch(Exception e){
            // TODO: handle exception
            e.getMessage();
        }
    }
    //弹出确认取消的窗口
    @RequestMapping("/cancelOrder")
    public String cancelOrder(Map<String , Object> map,Integer or_id){
        map.put("or_id" , or_id);
        map.put("url" , "cancelOrder.action");
        map.put("message" , "是否确定取消订单？");
        return "order/cancel";
    }
    //弹出确认已生成出库单的取消的窗口
    @RequestMapping("/cancelGoodsOut")
    public String cancelGoodsOut(Map<String , Object> map,Integer or_id){
        map.put("or_id" , or_id);
        map.put("url" , "cancelGoodsOut.action");
        map.put("message" , "此订单已生成出库单，是否确定取消？");
        return "order/cancel";
    }
    //执行未生成出库单的订单取消动作
    @RequestMapping("/cancelOrder.action")
    public String cancelOrderAction(Map<String , Object> map,Integer or_id){
        try{
            map.put("or_id" , or_id);
            orderService.cancelOrder(map);
        }catch(Exception e){
            // TODO: handle exception
            map.put("message" , e.getMessage());
        }
        return "main/message";
    }
    //执行已生成出库单的订单取消动作
    @RequestMapping("/cancelGoodsOut.action")
    public String cancelGoodsOutAction(Map<String , Object> map,Integer or_id){
        try{
            map.put("or_id" , or_id);
            orderService.cancelGoodsOut(map);
        }catch(Exception e){
            // TODO: handle exception
            map.put("message" , e.getMessage());
        }
        return "main/message";
    }
    //查询订单明细
    @RequestMapping("/orderDetails")
    public String orderDetails(Map<String , Object> map,Integer or_id){
        try{
            map.put("or_id" , or_id);
            orderService.load(map);
        }catch(Exception e){
            // TODO: handle exception
            map.put("message" , e.getMessage());
        }
        return "order/orderDetails";
    }
    
}
