package com.gbj.mapper;

import java.util.List;
import java.util.Map;

import com.gbj.model.GoodsOut;

public interface GoodsOutMapper {
    public List<GoodsOut> goodsStockOutList(Map<String , Object> map);
    public int count(Map<String , Object> map);
    //生成出库单
    public int goodsStockOut(GoodsOut goodsOut);
    //confirmGoodsOut确认出库 即修改出库单状态及添加出库时间
    public int confirmGoodsOut(GoodsOut goodsOut);
    //查询一条数据
    public GoodsOut load(Integer go_id);
    //    取消已生成出库单的订单 改变出库单的状态位-1 即取消执行
    public int cancelGoodsOut(Integer or_id);
}
