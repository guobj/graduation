package com.gbj.model;

public class Supplier {
    private Integer sup_id;
    private String sup_name;
    private String sup_tel;
    private String sup_bank;
    private String sup_bank_id;
    private String sup_scope;
    private String sup_logo;
    private Integer fk_et_id;
    private Integer fk_cg_id;
    private String fk_pro_id;
    private String fk_city_id;
    private String fk_country_id;
    private Integer sup_status;
    private String sup_time;
    private LicenseType licenseType;
    private EconomicType economicType;
    private ConsumerGrand consumerGrand;
    private Province province;
    private City city;
    private Country country;
    public LicenseType getLicenseType() {
        return this.licenseType;
    }
    public void setLicenseType(LicenseType licenseType ) {
        this.licenseType = licenseType;
    }
    public EconomicType getEconomicType() {
        return this.economicType;
    }
    public void setEconomicType(EconomicType economicType ) {
        this.economicType = economicType;
    }
    public ConsumerGrand getConsumerGrand() {
        return this.consumerGrand;
    }
    public void setConsumerGrand(ConsumerGrand consumerGrand ) {
        this.consumerGrand = consumerGrand;
    }
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
    public Integer getSup_id() {
        return this.sup_id;
    }
    public void setSup_id(Integer sup_id ) {
        this.sup_id = sup_id;
    }
    public String getSup_name() {
        return this.sup_name;
    }
    public void setSup_name(String sup_name ) {
        this.sup_name = sup_name;
    }
    public String getSup_tel() {
        return this.sup_tel;
    }
    public void setSup_tel(String sup_tel ) {
        this.sup_tel = sup_tel;
    }
    public String getSup_bank() {
        return this.sup_bank;
    }
    public void setSup_bank(String sup_bank ) {
        this.sup_bank = sup_bank;
    }
    public String getSup_bank_id() {
        return this.sup_bank_id;
    }
    public void setSup_bank_id(String sup_bank_id ) {
        this.sup_bank_id = sup_bank_id;
    }
    public String getSup_scope() {
        return this.sup_scope;
    }
    public void setSup_scope(String sup_scope ) {
        this.sup_scope = sup_scope;
    }
    public String getSup_logo() {
        return this.sup_logo;
    }
    public void setSup_logo(String sup_logo ) {
        this.sup_logo = sup_logo;
    }
    public Integer getFk_et_id() {
        return this.fk_et_id;
    }
    public void setFk_et_id(Integer fk_et_id ) {
        this.fk_et_id = fk_et_id;
    }
    public Integer getFk_cg_id() {
        return this.fk_cg_id;
    }
    public void setFk_cg_id(Integer fk_cg_id ) {
        this.fk_cg_id = fk_cg_id;
    }
    public String getFk_pro_id() {
        return this.fk_pro_id;
    }
    public void setFk_pro_id(String fk_pro_id ) {
        this.fk_pro_id = fk_pro_id;
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
    public String getSup_time() {
        return this.sup_time;
    }
    public void setSup_time(String sup_time ) {
        this.sup_time = sup_time;
    }
    public Integer getSup_status() {
        return this.sup_status;
    }
    public void setSup_status(Integer sup_status ) {
        this.sup_status = sup_status;
    }
    
}
