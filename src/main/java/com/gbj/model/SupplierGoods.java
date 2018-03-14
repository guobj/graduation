package com.gbj.model;

public class SupplierGoods {
	private Integer sg_id;
	private Integer fk_sup_id;
	private Integer fk_goods_id;
	private Double sg_price;
	private String sg_date;
	private String sg_remark;
	private Integer sg_status;
	private Supplier supplier;
	private Goods goods;

	public Supplier getSupplier() {
		return this.supplier;
	}

	public void setSupplier(Supplier supplier) {
		this.supplier = supplier;
	}

	public Goods getGoods() {
		return this.goods;
	}

	public void setGoods(Goods goods) {
		this.goods = goods;
	}

	public Integer getSg_id() {
		return this.sg_id;
	}

	public void setSg_id(Integer sg_id) {
		this.sg_id = sg_id;
	}

	public Integer getFk_sup_id() {
		return this.fk_sup_id;
	}

	public void setFk_sup_id(Integer fk_sup_id) {
		this.fk_sup_id = fk_sup_id;
	}

	public Integer getFk_goods_id() {
		return this.fk_goods_id;
	}

	public void setFk_goods_id(Integer fk_goods_id) {
		this.fk_goods_id = fk_goods_id;
	}

	public Double getSg_price() {
		return this.sg_price;
	}

	public void setSg_price(Double sg_price) {
		this.sg_price = sg_price;
	}

	public String getSg_date() {
		return this.sg_date;
	}

	public void setSg_date(String sg_date) {
		this.sg_date = sg_date;
	}

	public String getSg_remark() {
		return this.sg_remark;
	}

	public void setSg_remark(String sg_remark) {
		this.sg_remark = sg_remark;
	}

	public Integer getSg_status() {
		return this.sg_status;
	}

	public void setSg_status(Integer sg_status) {
		this.sg_status = sg_status;
	}
}
