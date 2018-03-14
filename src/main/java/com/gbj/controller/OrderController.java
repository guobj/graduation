package com.gbj.controller;

import com.gbj.model.Order;
import com.gbj.service.OrderService;
import com.gbj.utils.JacksonData;
import com.gbj.utils.PageBean;
import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

@Controller
public class OrderController {
	@Autowired
	private OrderService orderService;

	//销售订单模糊查询及分页
	@RequestMapping("/salesOrder")
	public String salesOrderList(Map<String, Object> map, Order order, @RequestParam(required = false, defaultValue = "1") Integer pages, HttpServletRequest request) {
		try {
			map = PageBean.serverMap(map, order, pages);
			map = orderService.salesOrderList(map);
			map = PageBean.clientMap(map, pages, request);
		} catch (Exception e) {
			// TODO: handle exception
			map.put("message", e.getMessage());
		}
		return "order/salesOrderList";
	}

	//弹出添加页面及查询的相关页面
	@RequestMapping("/salesOrderAdd")
	public String salesOrderAdd(Map<String, Object> map) {
		map = orderService.salesOrderAdd(map);
		return "order/salesOrderAdd";
	}

	//添加订单基本信息
	@RequestMapping("/salesOrderAdd.action")
	public String salesOrderAddAction(Map<String, Object> map, Order order) {
		try {
			map.put("order", order);
			orderService.salesOrderAddAction(map);
			map.put("or_id", order.getOr_id());
		} catch (Exception e) {
			// TODO: handle exception
			map.put("message", e.getMessage());
		}
		return "order/salesOrderDetails";
	}

	//直接编辑订单明细
	@RequestMapping("/salesOrderDetails.action")
	public String salesOrderDetailsAction(Map<String, Object> map, Order order) {
		try {
			map.put("order", order);
			orderService.salesOrderDetailsAction(map);
		} catch (Exception e) {
			// TODO: handle exception
			map.put("message", e.getMessage());
		}
		return "main/message";
	}

	//间接编辑订单明细
	//弹出编辑窗
	@RequestMapping("/salesOrderDetails")
	public String salesOrderDetails(Map<String, Object> map, Integer or_id) {
		map.put("or_id", or_id);
		map = orderService.salesOrderDetails(map);
		return "order/salesOrderDetails";
	}

	//确认生成出库单
	@RequestMapping("/orderGoodsStockOut")
	@ResponseBody
	public JacksonData goodsStockOutAction(@RequestParam Integer id) {
		JacksonData backData = new JacksonData();
		Map<String, Object> map = orderService.goodsStockOut(id);
		backData.success(map);
		return backData;
	}

	//销售报表
	@RequestMapping("/salesTable")
	public String salesTable(Map<String, Object> map, Integer or_id) {
		return "order/salesTable";
	}

	//饼图的动态数据获取
	@RequestMapping("/salesSumOrder")
	public void salesSumOrder(HttpServletResponse response) throws IOException {
		try {
			List<Map<String, Object>> salesSumOrderList = orderService.salesSumOrder();
			Gson gson = new Gson();
			System.out.println("并图数据" + salesSumOrderList);
			String data = gson.toJson(salesSumOrderList);
			System.out.println(data);
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.print(data);
			out.flush();
			out.close();
		} catch (Exception e) {
			// TODO: handle exception
			e.getMessage();
		}
	}

//	    // //执行未生成出库单的订单取消动作
//    @RequestMapping("/cancelOrder")
//    public String cancelOrder(Map<String , Object> map,Integer or_id){
//        map.put("or_id" , or_id);
//        map.put("url" , "cancelOrder.action");
//        map.put("message" , "是否确定取消订单？");
//        return "order/cancel";
//    }

	//执行未生成出库单的订单取消动作
	@RequestMapping("/cancelOrder")
	@ResponseBody
	public JacksonData cancelOrderAction(@RequestParam Integer id) {
		JacksonData backData = new JacksonData();
		Order order = orderService.cancelOrder(id);
		backData.success(order);
		return backData;
	}

	//执行已生成出库单的订单取消动作
	@RequestMapping("/cancelGoodsOut")
	@ResponseBody
	public JacksonData cancelGoodsOutAction(@RequestParam Integer id) {
		JacksonData backData = new JacksonData();
		int i = orderService.cancelGoodsOut(id);
		backData.success(i);
		return backData;
	}

	//查询订单明细
	@RequestMapping("/orderDetails")
	public String orderDetails(Map<String, Object> map, Integer or_id) {
		try {
			map.put("or_id", or_id);
			orderService.load(map);
		} catch (Exception e) {
			// TODO: handle exception
			map.put("message", e.getMessage());
		}
		return "order/orderDetails";
	}

//    @RequestMapping(value = "/orderDel")
//    @ResponseBody
//    public JacksonData orderDel(@RequestParam Integer id){
//        JacksonData backData = new JacksonData();
//
//    }
}
