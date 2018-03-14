package com.gbj.mapper;

import com.gbj.model.GoodsUnit;

import java.util.List;
import java.util.Map;

public interface GoodsUnitMapper {
	public List<GoodsUnit> unitList();

	public List<GoodsUnit> goodsUnitList(Map<String, Object> map);

	public int count(Map<String, Object> map);

	public int goodsUnitAddAction(GoodsUnit goodsUnit);

	public int goodsUnitDelAction(Integer gu_id);

	public GoodsUnit load(Integer gu_id);
}
