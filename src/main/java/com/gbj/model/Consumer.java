package com.gbj.model;

public class Consumer {
    private Integer con_id;
    private String con_name;
    private String con_tel;
    private String con_email;
    private String con_points;
    private Integer fk_et_id;
    private Integer fk_in_id;
    private String con_time;
    private Double con_price;
    private String con_remark;
    private String con_logo;
    private Integer fk_sm_id;
    private Integer fk_cs_id;
    private String fk_city_id;
    private String fk_country_id;;
    private String fk_pro_id;
    private Integer con_status;
    private Integer fk_cg_id;
    private ConsumerGrand consumerGrand;
    private EconomicType economicType;
    private Industry industry;
    private SaleModel saleModel;
    private ConsumerSource consumerSource;
    private Province province;
    private City city;
    private Country country;
    public Province getProvince() {
        return this.province;
    }
    public void setProvince(Province province ) {
        this.province = province;
    }
    public City getCity() {
        return this.city;
    }
    public void setCity(City city ) {
        this.city = city;
    }
    public Country getCountry() {
        return this.country;
    }
    public void setCountry(Country country ) {
        this.country = country;
    }
    public Integer getCon_id() {
        return this.con_id;
    }
    public void setCon_id(Integer con_id ) {
        this.con_id = con_id;
    }
    public String getCon_name() {
        return this.con_name;
    }
    public void setCon_name(String con_name ) {
        this.con_name = con_name;
    }
    public String getCon_tel() {
        return this.con_tel;
    }
    public void setCon_tel(String con_tel ) {
        this.con_tel = con_tel;
    }
    public String getCon_email() {
        return this.con_email;
    }
    public void setCon_email(String con_email ) {
        this.con_email = con_email;
    }
    public String getCon_points() {
        return this.con_points;
    }
    public void setCon_points(String con_points ) {
        this.con_points = con_points;
    }
    public Integer getFk_et_id() {
        return this.fk_et_id;
    }
    public void setFk_et_id(Integer fk_et_id ) {
        this.fk_et_id = fk_et_id;
    }
    public Integer getFk_in_id() {
        return this.fk_in_id;
    }
    public void setFk_in_id(Integer fk_in_id ) {
        this.fk_in_id = fk_in_id;
    }
    public String getCon_time() {
        return this.con_time;
    }
    public void setCon_time(String con_time ) {
        this.con_time = con_time;
    }
    public Double getCon_price() {
        return this.con_price;
    }
    public void setCon_price(Double con_price ) {
        this.con_price = con_price;
    }
    public String getCon_remark() {
        return this.con_remark;
    }
    public void setCon_remark(String con_remark ) {
        this.con_remark = con_remark;
    }
    public String getCon_logo() {
        return this.con_logo;
    }
    public void setCon_logo(String con_logo ) {
        this.con_logo = con_logo;
    }
    public Integer getFk_sm_id() {
        return this.fk_sm_id;
    }
    public void setFk_sm_id(Integer fk_sm_id ) {
        this.fk_sm_id = fk_sm_id;
    }
    public Integer getFk_cs_id() {
        return this.fk_cs_id;
    }
    public void setFk_cs_id(Integer fk_cs_id ) {
        this.fk_cs_id = fk_cs_id;
    }
    public EconomicType getEconomicType() {
        return this.economicType;
    }
    public void setEconomicType(EconomicType economicType ) {
        this.economicType = economicType;
    }
    public Industry getIndustry() {
        return this.industry;
    }
    public void setIndustry(Industry industry ) {
        this.industry = industry;
    }
    public SaleModel getSaleModel() {
        return this.saleModel;
    }
    public void setSaleModel(SaleModel saleModel ) {
        this.saleModel = saleModel;
    }
    public ConsumerSource getConsumerSource() {
        return this.consumerSource;
    }
    public void setConsumerSource(ConsumerSource consumerSource ) {
        this.consumerSource = consumerSource;
    }
    public Integer getCon_status() {
        return this.con_status;
    }
    public void setCon_status(Integer con_status ) {
        this.con_status = con_status;
    }
    public String getFk_city_id() {
        return this.fk_city_id;
    }
    public void setFk_city_id(String fk_city_id ) {
        this.fk_city_id = fk_city_id;
    }
    public String getFk_country_id() {
        return this.fk_country_id;
    }
    public void setFk_country_id(String fk_country_id ) {
        this.fk_country_id = fk_country_id;
    }
    public String getFk_pro_id() {
        return this.fk_pro_id;
    }
    public void setFk_pro_id(String fk_pro_id ) {
        this.fk_pro_id = fk_pro_id;
    }
    public Integer getFk_cg_id() {
        return this.fk_cg_id;
    }
    public void setFk_cg_id(Integer fk_cg_id ) {
        this.fk_cg_id = fk_cg_id;
    }
    public ConsumerGrand getConsumerGrand() {
        return this.consumerGrand;
    }
    public void setConsumerGrand(ConsumerGrand consumerGrand ) {
        this.consumerGrand = consumerGrand;
    }
    



    
}
