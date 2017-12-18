package com.gbj.model;

public class SupplierLicenseType {
    private Integer st_id;
    private Integer fk_sup_id;
    private Integer fk_lt_id;
    private String st_startdate;
    private String st_enddate;
    private Integer st_status;
    public Integer getSt_status() {
        return this.st_status;
    }
    public void setSt_status(Integer st_status ) {
        this.st_status = st_status;
    }
    private Supplier supplier;
    private LicenseType licenseType;
    public Integer getSt_id() {
        return this.st_id;
    }
    public void setSt_id(Integer st_id ) {
        this.st_id = st_id;
    }
    public Integer getFk_sup_id() {
        return this.fk_sup_id;
    }
    public void setFk_sup_id(Integer fk_sup_id ) {
        this.fk_sup_id = fk_sup_id;
    }
    public Integer getFk_lt_id() {
        return this.fk_lt_id;
    }
    public void setFk_lt_id(Integer fk_lt_id ) {
        this.fk_lt_id = fk_lt_id;
    }
    public String getSt_startdate() {
        return this.st_startdate;
    }
    public void setSt_startdate(String st_startdate ) {
        this.st_startdate = st_startdate;
    }
    public String getSt_enddate() {
        return this.st_enddate;
    }
    public void setSt_enddate(String st_enddate ) {
        this.st_enddate = st_enddate;
    }
    public Supplier getSupplier() {
        return this.supplier;
    }
    public void setSupplier(Supplier supplier ) {
        this.supplier = supplier;
    }
    public LicenseType getLicenseType() {
        return this.licenseType;
    }
    public void setLicenseType(LicenseType licenseType ) {
        this.licenseType = licenseType;
    }

}
