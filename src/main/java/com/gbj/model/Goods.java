package com.gbj.model;

public class Goods {
    private Integer goods_id;
    private String goods_name;
    private Integer fk_gt_id;
    private Double goods_price;
    private Double goods_vipprice;
    private Integer goods_nums;
    private Integer fk_sup_id;
    private String goods_logo;
    private Integer fk_gu_id;
    private Double goods_sumprice;
    private String goods_time;
    private GoodsUnit gu;
    private GoodsType gtype;
    private Supplier supplier;
    //删除状态  0有效  1删除
    private Integer goods_state;

    public Integer getGoods_state() {
        return goods_state;
    }

    public void setGoods_state(Integer goods_state) {
        this.goods_state = goods_state;
    }

    public Supplier getSupplier() {
        return this.supplier;
    }
    public void setSupplier(Supplier supplier ) {
        this.supplier = supplier;
    }
    public Integer getGoods_id() {
        return this.goods_id;
    }
    public void setGoods_id(Integer goods_id ) {
        this.goods_id = goods_id;
    }
    public String getGoods_name() {
        return this.goods_name;
    }
    public void setGoods_name(String goods_name ) {
        this.goods_name = goods_name;
    }
    public Integer getFk_gt_id() {
        return this.fk_gt_id;
    }
    public void setFk_gt_id(Integer fk_gt_id ) {
        this.fk_gt_id = fk_gt_id;
    }
    public Double getGoods_price() {
        return this.goods_price;
    }
    public void setGoods_price(Double goods_price ) {
        this.goods_price = goods_price;
    }
    public Double getGoods_vipprice() {
        return this.goods_vipprice;
    }
    public void setGoods_vipprice(Double goods_vipprice ) {
        this.goods_vipprice = goods_vipprice;
    }
    public Integer getGoods_nums() {
        return this.goods_nums;
    }
    public void setGoods_nums(Integer goods_nums ) {
        this.goods_nums = goods_nums;
    }
    public Integer getFk_sup_id() {
        return this.fk_sup_id;
    }
    public void setFk_sup_id(Integer fk_sup_id ) {
        this.fk_sup_id = fk_sup_id;
    }
    public String getGoods_logo() {
        return this.goods_logo;
    }
    public void setGoods_logo(String goods_logo ) {
        this.goods_logo = goods_logo;
    }
    public Integer getFk_gu_id() {
        return this.fk_gu_id;
    }
    public void setFk_gu_id(Integer fk_gu_id ) {
        this.fk_gu_id = fk_gu_id;
    }
    public GoodsUnit getGu() {
        return this.gu;
    }
    public void setGu(GoodsUnit gu ) {
        this.gu = gu;
    }
    
    public GoodsType getGtype() {
        return this.gtype;
    }
    public void setGtype(GoodsType gtype ) {
        this.gtype = gtype;
    }
    public Double getGoods_sumprice() {
        return this.goods_sumprice;
    }
    public void setGoods_sumprice(Double goods_sumprice ) {
        this.goods_sumprice = goods_sumprice;
    }
    public String getGoods_time() {
        return this.goods_time;
    }
    public void setGoods_time(String goods_time ) {
        this.goods_time = goods_time;
    }
    @Override
    public String toString() {
        return "Goods [goods_id=" + this.goods_id + ", goods_name=" + this.goods_name + ", fk_gt_id=" + this.fk_gt_id
                + ", goods_price=" + this.goods_price + ", goods_vipprice=" + this.goods_vipprice + ", goods_nums="
                + this.goods_nums + ", fk_sup_id=" + this.fk_sup_id + ", goods_logo=" + this.goods_logo + ", fk_gu_id="
                + this.fk_gu_id + ", goods_sumprice=" + this.goods_sumprice + ", goods_time=" + this.goods_time
                + ", gu=" + this.gu + ", gtype=" + this.gtype + ", supplier=" + this.supplier + "]";
    }
    
    
}
