package com.gbj.service;

import com.gbj.model.GoodsUnit;

import java.util.Map;

public interface GoodsUnitService {
	public Map<String, Object> unitList(Map<String, Object> map);

	public Map<String, Object> goodsUnitList(Map<String, Object> map);

	public int goodsUnitAddAction(Map<String, Object> map);

	public GoodsUnit goodsUnitDelAction(Integer gu_id);
}
