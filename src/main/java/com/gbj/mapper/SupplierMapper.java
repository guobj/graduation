package com.gbj.mapper;

import com.gbj.model.Supplier;

import java.util.List;
import java.util.Map;

public interface SupplierMapper {
	public List<Supplier> supList();

	public List<Supplier> supplierList(Map<String, Object> map);

	public int count(Map<String, Object> map);

	//添加供应商
	public int supplierAddAction(Supplier supplier);

	//修改用户信息
	public Supplier load(Integer sup_id);

	public int supplierUpdateAction(Supplier supplier);

	//逻辑删除
	public int supplierDelAction(Integer sup_id);

	//逻辑删除多条数据
	public int supplierMoreDelAction(Integer[] sup_ids);
}
