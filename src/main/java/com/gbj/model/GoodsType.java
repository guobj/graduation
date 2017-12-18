package com.gbj.model;

public class GoodsType {
    private Integer gt_id;
    private String gt_type;
    public Integer getGt_id() {
        return this.gt_id;
    }
    public void setGt_id(Integer gt_id ) {
        this.gt_id = gt_id;
    }
    public String getGt_type() {
        return this.gt_type;
    }
    public void setGt_type(String gt_type ) {
        this.gt_type = gt_type;
    }
    @Override
    public String toString() {
        return "GoodsType [gt_id=" + this.gt_id + ", gt_type=" + this.gt_type + "]";
    }

}
