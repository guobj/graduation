package com.gbj.model;

public class Employee {
    private Integer emp_id;
    private String emp_name;
    private String account;
    private String password;
    private String emp_email;
    private String emp_tel;
    private String emp_age;
    private String emp_sex;
    private String emp_card;
    private String emp_status;
    private String emp_time;
    private String emp_logo;
    private Integer fk_role_id;
    private String fk_city_id;
    private String fk_country_id;;
    private String fk_pro_id;
    private Integer fk_edu_id;;
    private Integer fk_dep_id;
    private Education education;
    private Department dep;
    private Province province;
    private City city;
    private Country country;
    private Role role;
    public Integer getEmp_id() {
        return this.emp_id;
    }
    public void setEmp_id(Integer emp_id ) {
        this.emp_id = emp_id;
    }
    public String getEmp_name() {
        return this.emp_name;
    }
    public void setEmp_name(String emp_name ) {
        this.emp_name = emp_name;
    }
    public String getAccount() {
        return this.account;
    }
    public void setAccount(String account ) {
        this.account = account;
    }
    public String getPassword() {
        return this.password;
    }
    public void setPassword(String password ) {
        this.password = password;
    }
    public String getEmp_email() {
        return this.emp_email;
    }
    public void setEmp_email(String emp_email ) {
        this.emp_email = emp_email;
    }
    public String getEmp_tel() {
        return this.emp_tel;
    }
    public void setEmp_tel(String emp_tel ) {
        this.emp_tel = emp_tel;
    }
    public String getEmp_age() {
        return this.emp_age;
    }
    public void setEmp_age(String emp_age ) {
        this.emp_age = emp_age;
    }
    public String getEmp_sex() {
        return this.emp_sex;
    }
    public void setEmp_sex(String emp_sex ) {
        this.emp_sex = emp_sex;
    }
    public String getEmp_card() {
        return this.emp_card;
    }
    public void setEmp_card(String emp_card ) {
        this.emp_card = emp_card;
    }
    public String getEmp_status() {
        return this.emp_status;
    }
    public void setEmp_status(String emp_status ) {
        this.emp_status = emp_status;
    }
    public Integer getFk_role_id() {
        return this.fk_role_id;
    }
    public void setFk_role_id(Integer fk_role_id ) {
        this.fk_role_id = fk_role_id;
    }
    public Role getRole() {
        return this.role;
    }
    public void setRole(Role role ) {
        this.role = role;
    }
    public String getEmp_time() {
        return this.emp_time;
    }
    public void setEmp_time(String emp_time ) {
        this.emp_time = emp_time;
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
    public String getEmp_logo() {
        return this.emp_logo;
    }
    public void setEmp_logo(String emp_logo ) {
        this.emp_logo = emp_logo;
    }
    public Integer getFk_edu_id() {
        return this.fk_edu_id;
    }
    public void setFk_edu_id(Integer fk_edu_id ) {
        this.fk_edu_id = fk_edu_id;
    }
    public Integer getFk_dep_id() {
        return this.fk_dep_id;
    }
    public void setFk_dep_id(Integer fk_dep_id ) {
        this.fk_dep_id = fk_dep_id;
    }
    public Education getEducation() {
        return this.education;
    }
    public void setEducation(Education education ) {
        this.education = education;
    }
    public Department getDep() {
        return this.dep;
    }
    public void setDep(Department dep ) {
        this.dep = dep;
    }
    @Override
    public String toString() {
        return "Employee [emp_id=" + this.emp_id + ", emp_name=" + this.emp_name + ", account=" + this.account
                + ", password=" + this.password + ", emp_email=" + this.emp_email + ", emp_tel=" + this.emp_tel
                + ", emp_age=" + this.emp_age + ", emp_sex=" + this.emp_sex + ", emp_card=" + this.emp_card
                + ", emp_status=" + this.emp_status + ", emp_time=" + this.emp_time + ", emp_logo=" + this.emp_logo
                + ", fk_role_id=" + this.fk_role_id + ", fk_city_id=" + this.fk_city_id + ", fk_country_id="
                + this.fk_country_id + ", fk_pro_id=" + this.fk_pro_id + ", fk_edu_id=" + this.fk_edu_id
                + ", fk_dep_id=" + this.fk_dep_id + ", education=" + this.education + ", dep=" + this.dep
                + ", province=" + this.province + ", city=" + this.city + ", country=" + this.country + ", role="
                + this.role + "]";
    }

}
