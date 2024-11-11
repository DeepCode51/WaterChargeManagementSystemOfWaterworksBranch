package com.entity;

/**
 * 水表
 */
public class Shuibiao {


    private Integer id;  // ID
    private Integer userId;  // 用户Id
    private String biaono;  // 水表编号
    private String jiesuantype;  // 结算方式
    private Integer biaovalue;  // 水表度数
    private String beizhu;  // 备注
    private Integer status;  // 水表状态
	

	public Shuibiao() {
	}
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public String getBiaono() {
		return biaono;
	}

	public void setBiaono(String biaono) {
		this.biaono = biaono;
	}
	public String getJiesuantype() {
		return jiesuantype;
	}

	public void setJiesuantype(String jiesuantype) {
		this.jiesuantype = jiesuantype;
	}
	public Integer getBiaovalue() {
		return biaovalue;
	}

	public void setBiaovalue(Integer biaovalue) {
		this.biaovalue = biaovalue;
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