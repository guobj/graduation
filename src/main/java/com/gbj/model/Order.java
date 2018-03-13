package com.gbj.model;

public class Order {
	private Integer or_id;
	private String or_theme;
	private Integer fk_con_id;
	private Integer fk_pro_id;
	private Integer fk_city_id;
	private Integer fk_country_id;
	private String or_adr;
	private String or_tel;
	private String or_account;
	private String or_signdate;
	private String or_senddate;
	private Integer fk_emp_id;
	private String or_remark;
	private Integer or_status;
	private Integer fk_goods_id;
	private Double or_price;
	private Double or_sumprice;
	private Integer or_nums;
	private Province province;
	private City city;
	private Country country;
	private Consumer consumer;
	private Employee employee;
	private Goods goods;

	public Integer getOr_id() {
		return this.or_id;
	}

	public void setOr_id(Integer or_id) {
		this.or_id = or_id;
	}

	public String getOr_theme() {
		return this.or_theme;
	}

	public void setOr_theme(String or_theme) {
		this.or_theme = or_theme;
	}

	public Integer getFk_con_id() {
		return this.fk_con_id;
	}

	public void setFk_con_id(Integer fk_con_id) {
		this.fk_con_id = fk_con_id;
	}

	public Integer getFk_pro_id() {
		return this.fk_pro_id;
	}

	public void setFk_pro_id(Integer fk_pro_id) {
		this.fk_pro_id = fk_pro_id;
	}

	public Integer getFk_city_id() {
		return this.fk_city_id;
	}

	public void setFk_city_id(Integer fk_city_id) {
		this.fk_city_id = fk_city_id;
	}

	public Integer getFk_country_id() {
		return this.fk_country_id;
	}

	public void setFk_country_id(Integer fk_country_id) {
		this.fk_country_id = fk_country_id;
	}

	public String getOr_adr() {
		return this.or_adr;
	}

	public void setOr_adr(String or_adr) {
		this.or_adr = or_adr;
	}

	public String getOr_tel() {
		return this.or_tel;
	}

	public void setOr_tel(String or_tel) {
		this.or_tel = or_tel;
	}

	public String getOr_account() {
		return this.or_account;
	}

	public void setOr_account(String or_account) {
		this.or_account = or_account;
	}

	public String getOr_signdate() {
		return this.or_signdate;
	}

	public void setOr_signdate(String or_signdate) {
		this.or_signdate = or_signdate;
	}

	public String getOr_senddate() {
		return this.or_senddate;
	}

	public void setOr_senddate(String or_senddate) {
		this.or_senddate = or_senddate;
	}

	public Integer getFk_emp_id() {
		return this.fk_emp_id;
	}

	public void setFk_emp_id(Integer fk_emp_id) {
		this.fk_emp_id = fk_emp_id;
	}

	public String getOr_remark() {
		return this.or_remark;
	}

	public void setOr_remark(String or_remark) {
		this.or_remark = or_remark;
	}

	public Integer getOr_status() {
		return this.or_status;
	}

	public void setOr_status(Integer or_status) {
		this.or_status = or_status;
	}

	public Integer getFk_goods_id() {
		return this.fk_goods_id;
	}

	public void setFk_goods_id(Integer fk_goods_id) {
		this.fk_goods_id = fk_goods_id;
	}

	public Double getOr_price() {
		return this.or_price;
	}

	public void setOr_price(Double or_price) {
		this.or_price = or_price;
	}

	public Double getOr_sumprice() {
		return this.or_sumprice;
	}

	public void setOr_sumprice(Double or_sumprice) {
		this.or_sumprice = or_sumprice;
	}

	public Integer getOr_nums() {
		return this.or_nums;
	}

	public void setOr_nums(Integer or_nums) {
		this.or_nums = or_nums;
	}

	public Province getProvince() {
		return this.province;
	}

	public void setProvince(Province province) {
		this.province = province;
	}

	public City getCity() {
		return this.city;
	}

	public void setCity(City city) {
		this.city = city;
	}

	public Country getCountry() {
		return this.country;
	}

	public void setCountry(Country country) {
		this.country = country;
	}

	public Consumer getConsumer() {
		return this.consumer;
	}

	public void setConsumer(Consumer consumer) {
		this.consumer = consumer;
	}

	public Employee getEmployee() {
		return this.employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}

	public Goods getGoods() {
		return this.goods;
	}

	public void setGoods(Goods goods) {
		this.goods = goods;
	}

	@Override
	public String toString() {
		return "Order [or_id=" + this.or_id + ", or_theme=" + this.or_theme + ", fk_con_id=" + this.fk_con_id
				+ ", fk_pro_id=" + this.fk_pro_id + ", fk_city_id=" + this.fk_city_id + ", fk_country_id="
				+ this.fk_country_id + ", or_adr=" + this.or_adr + ", or_tel=" + this.or_tel + ", or_account="
				+ this.or_account + ", or_signdate=" + this.or_signdate + ", or_senddate=" + this.or_senddate
				+ ", fk_emp_id=" + this.fk_emp_id + ", or_remark=" + this.or_remark + ", or_status=" + this.or_status
				+ ", fk_goods_id=" + this.fk_goods_id + ", or_price=" + this.or_price + ", or_sumprice="
				+ this.or_sumprice + ", or_nums=" + this.or_nums + ", province=" + this.province + ", city=" + this.city
				+ ", country=" + this.country + ", consumer=" + this.consumer + ", employee=" + this.employee
				+ ", goods=" + this.goods + "]";
	}

}
