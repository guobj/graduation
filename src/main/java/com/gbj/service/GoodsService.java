package com.gbj.service;

import java.util.List;
import java.util.Map;

import com.gbj.model.Goods;

public interface GoodsService {
    public Map<String , Object> goodsMap(Map<String , Object> map);
    public int goodsAddAction(Map<String , Object> map);
    public Map<String , Object> load(Map<String , Object> map,Integer goods_id);
    public int goodsUpdateAction(Map<String , Object> map);
    public int goodsDel(Map<String,Object> map,Integer goods_id);
    public int goodsMoreDel(Map<String , Object> map);
    public Map<String , Object> goodsStockList(Map<String , Object> map);
    public int goodsStockInUpdate(Map<String , Object> map);
    public int goodsStockInUpdateAction(Map<String , Object> map);
    public Map<String , Object> goodsStockOutList(Map<String , Object> map);
    //柱状图X轴data数据
    public List<Goods> stocking(Map<String , Object> map);
    //确认出库 即修改出库单状态及添加出库时间
    public int confirmGoodsOut(Map<String , Object> map);
}
