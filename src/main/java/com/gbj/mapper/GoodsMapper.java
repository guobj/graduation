package com.gbj.mapper;

import java.util.List;
import java.util.Map;

import com.gbj.model.Goods;

public interface GoodsMapper {
    public List<Goods> goodsList(Map<String , Object> map);
    public int count(Map<String , Object> map);
    public int goodsAdd(Goods goods);
    public Goods load(Integer goods_id);
    public int goodsUpdate(Goods goods);
    public int goodsDel(Integer goods_id);
    public int goodsMoreDel(Map<String , Object> map);
    public List<Goods> goodsStockList(Map<String , Object> map);
    public List<Goods> findAllgoods();
    public int goodsStockInUpdateAction(Goods goods);
    //查询单个商品的库存
    public int goodsStock(Integer goods_id);
    //事务回滚  更新商品库存
    public int goodsStockUpdate(Goods goods);
}
