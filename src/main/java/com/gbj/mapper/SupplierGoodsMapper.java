package com.gbj.mapper;

import com.gbj.model.SupplierGoods;

import java.util.List;
import java.util.Map;

public interface SupplierGoodsMapper {
	//查询供应商报价
	public List<Map<String, Object>> supplierGoodsList(Map<String, Object> map);

	public int count(Map<String, Object> map);

	//新增供应商报价
	public int supplierGoodsAddAction(SupplierGoods supplierGoods);

	//逻辑删除一条数据byid
	public int supplierGoodsDelAction(Integer sg_id);

	//    /逻辑删除多条数据BYIDs
	public int supplierGoodsMoreDelAction(Integer[] sg_ids);

	//load放法
	public SupplierGoods load(Integer sg_id);

	//查询删除语句
	public List findAll(Integer[] sg_ids);
}
