package com.gbj.mapper;

import com.gbj.model.GoodsType;

import java.util.List;
import java.util.Map;

public interface GoodsTypeMapper {
	public List<GoodsType> typeList();

	public List<GoodsType> typeLikeList(Map<String, Object> map);

	public int count(Map<String, Object> map);

	public int goodsTypeAddAction(GoodsType goodsType);

	public int goodsTypeDelAction(Integer gt_id);

	public GoodsType load(Integer gt_id);
}
