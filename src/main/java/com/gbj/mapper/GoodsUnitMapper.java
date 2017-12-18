package com.gbj.mapper;

import java.util.List;
import java.util.Map;

import com.gbj.model.GoodsUnit;

public interface GoodsUnitMapper {
    public List<GoodsUnit> unitList();
    public List<GoodsUnit> goodsUnitList(Map<String , Object> map);
    public int count(Map<String , Object> map);
    public int goodsUnitAddAction(GoodsUnit goodsUnit);
    public int goodsUnitDelAction(Integer gu_id);
}
