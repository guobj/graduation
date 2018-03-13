package com.gbj.service;

import com.gbj.model.Supplier;
import com.gbj.model.SupplierLicenseType;

import java.util.List;
import java.util.Map;

public interface SupplierService {
	public Map<String, Object> supList(Map<String, Object> map);

	public Map<String, Object> supplierList(Map<String, Object> map);

	//添加供应商
	public Map<String, Object> supplierAdd(Map<String, Object> map);

	public int supplierAddAction(Map<String, Object> map);

	//通过ID查询将要修改用户
	public Map<String, Object> load(Map<String, Object> map, Integer sup_id);

	//提交保存修改的客户信息
	public int supplierUpdateAction(Map<String, Object> map);

	//逻辑删除用户
	public Supplier supplierDelAction(Integer sup_id);

	//逻辑删除多个用户
	public List supplierMoreDelAction(Integer[] sup_ids);

	/*
	 *
	 *
	 *
	 *
	 * 供应商报价管理
	 *
	 *
	 *
	 *
	 *
	 * */
	//报价分页
	public Map<String, Object> supplierGoodsList(Map<String, Object> map);

	//新增供应商报价
	public Map<String, Object> supplierGoodsAdd(Map<String, Object> map);

	public int supplierGoodsAddAction(Map<String, Object> map);

	//逻辑删除报价
	public int supplierGoodsDelAction(Map<String, Object> map, Integer sg_id);

	//逻辑删除多个报价
	public int supplierGoodsMoreDelAction(Map<String, Object> map);

	/*
	 *
	 *
	 *
	 *
	 * 供应商证照管理
	 *
	 *
	 *
	 *
	 *
	 * */
	//报价分页
	public Map<String, Object> supplierLicenseList(Map<String, Object> map);

	//新增供应商证照
	public Map<String, Object> supplierLicenseAdd(Map<String, Object> map);

	public Map<String, Object> supplierLicenseAddAction(Map<String, Object> map);

	//逻辑删除证照
	public SupplierLicenseType supplierLicenseDelAction(Integer st_id);

	//逻辑删除多个证照
	public List supplierLicenseMoreDelAction(Integer[] st_ids);
}
