package com.gbj.model;

public class City {
    private Integer c_id;
    private String cityID;
    private String city;
    private String c_father;
    public Integer getC_id() {
        return this.c_id;
    }
    public void setC_id(Integer c_id ) {
        this.c_id = c_id;
    }
    public String getCityID() {
        return this.cityID;
    }
    public void setCityID(String cityID ) {
        this.cityID = cityID;
    }
    public String getCity() {
        return this.city;
    }
    public void setCity(String city ) {
        this.city = city;
    }
    public String getC_father() {
        return this.c_father;
    }
    public void setC_father(String c_father ) {
        this.c_father = c_father;
    }

}
