package com.gbj.model;


public class GoodsOut {
    private Integer go_id;
    private String go_ctime;
    private Integer go_nums;
    private Integer fk_goods_id;
    private Double go_sumprice;
    private String go_name;
    private Integer go_status;
    private String go_stime;
    private Integer fk_emp_id;
    private Integer fk_or_id;
    private Integer fk_con_id;
    private Order order;
    private Employee employee;
    private Goods goods;
    private Consumer consumer;
    public Consumer getConsumer() {
        return this.consumer;
    }
    public void setConsumer(Consumer consumer ) {
        this.consumer = consumer;
    }
    public Integer getGo_id() {
        return this.go_id;
    }
    public void setGo_id(Integer go_id ) {
        this.go_id = go_id;
    }
    public String getGo_ctime() {
        return this.go_ctime;
    }
    public Integer getGo_nums() {
        return this.go_nums;
    }
    public void setGo_nums(Integer go_nums ) {
        this.go_nums = go_nums;
    }
    public Integer getFk_goods_id() {
        return this.fk_goods_id;
    }
    public void setFk_goods_id(Integer fk_goods_id ) {
        this.fk_goods_id = fk_goods_id;
    }
    public Goods getGoods() {
        return this.goods;
    }
    public void setGoods(Goods goods ) {
        this.goods = goods;
    }
    public Double getGo_sumprice() {
        return this.go_sumprice;
    }
    public void setGo_sumprice(Double go_sumprice ) {
        this.go_sumprice = go_sumprice;
    }
    public String getGo_name() {
        return this.go_name;
    }
    public void setGo_name(String go_name ) {
        this.go_name = go_name;
    }
    public Integer getGo_status() {
        return this.go_status;
    }
    public void setGo_status(Integer go_status ) {
        this.go_status = go_status;
    }
    public String getGo_stime() {
        return this.go_stime;
    }
    public void setGo_stime(String go_stime ) {
        this.go_stime = go_stime;
    }
    public Integer getFk_emp_id() {
        return this.fk_emp_id;
    }
    public void setFk_emp_id(Integer fk_emp_id ) {
        this.fk_emp_id = fk_emp_id;
    }
    
    public Employee getEmployee() {
        return this.employee;
    }
    public void setEmployee(Employee employee ) {
        this.employee = employee;
    }
    public void setGo_ctime(String go_ctime ) {
        this.go_ctime = go_ctime;
    }
    public Integer getFk_or_id() {
        return this.fk_or_id;
    }
    public void setFk_or_id(Integer fk_or_id ) {
        this.fk_or_id = fk_or_id;
    }
    public Order getOrder() {
        return this.order;
    }
    public void setOrder(Order order ) {
        this.order = order;
    }
    public Integer getFk_con_id() {
        return this.fk_con_id;
    }
    public void setFk_con_id(Integer fk_con_id ) {
        this.fk_con_id = fk_con_id;
    }
    @Override
    public String toString() {
        return "GoodsOut [go_id=" + this.go_id + ", go_ctime=" + this.go_ctime + ", go_nums=" + this.go_nums
                + ", fk_goods_id=" + this.fk_goods_id + ", go_sumprice=" + this.go_sumprice + ", go_name="
                + this.go_name + ", go_status=" + this.go_status + ", go_stime=" + this.go_stime + ", fk_emp_id="
                + this.fk_emp_id + ", fk_or_id=" + this.fk_or_id + ", fk_con_id=" + this.fk_con_id + ", order="
                + this.order + ", employee=" + this.employee + ", goods=" + this.goods + ", consumer=" + this.consumer
                + "]";
    }

    
}
