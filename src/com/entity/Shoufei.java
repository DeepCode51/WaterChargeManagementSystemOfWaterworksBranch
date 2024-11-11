package com.entity;

/**
 * 收费信息
 */
public class Shoufei {

	private Integer id; // ID
	private String userno; // 用户编号
	private String shuibiaono; // 水表编号
	private String shijian; // 创建时间
	private Integer shuijia; // 水费价格
	private String jiesuantype; // 结算方式
	private Integer shuifeimoney; // 水费金额
	private String beizhu; // 备注信息
	private Integer status; // 缴费状态(0未缴费 1已缴费)

	private Integer shuifeivalue; // 水费度数

	public Integer getShuifeivalue() {
		return shuifeivalue;
	}

	public void setShuifeivalue(Integer shuifeivalue) {
		this.shuifeivalue = shuifeivalue;
	}

	public Shoufei() {
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUserno() {
		return userno;
	}

	public void setUserno(String userno) {
		this.userno = userno;
	}

	public String getShuibiaono() {
		return shuibiaono;
	}

	public void setShuibiaono(String shuibiaono) {
		this.shuibiaono = shuibiaono;
	}

	public String getShijian() {
		return shijian;
	}

	public void setShijian(String shijian) {
		this.shijian = shijian;
	}

	public Integer getShuijia() {
		return shuijia;
	}

	public void setShuijia(Integer shuijia) {
		this.shuijia = shuijia;
	}

	public String getJiesuantype() {
		return jiesuantype;
	}

	public void setJiesuantype(String jiesuantype) {
		this.jiesuantype = jiesuantype;
	}

	public Integer getShuifeimoney() {
		return shuifeimoney;
	}

	public void setShuifeimoney(Integer shuifeimoney) {
		this.shuifeimoney = shuifeimoney;
	}

	public String getBeizhu() {
		return beizhu;
	}

	public void setBeizhu(String beizhu) {
		this.beizhu = beizhu;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

}