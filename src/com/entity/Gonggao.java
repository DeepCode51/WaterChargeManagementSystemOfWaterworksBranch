package com.entity;

/**
 * 公告信息
 */
public class Gonggao {


    private Integer id;  // ID
    private String biaoti;  // 标题
    private String neirong;  // 内容
    private String shijian;  // 发布时间
    private Integer type;  // 公告类型
	

	public Gonggao() {
	}
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}
	public String getBiaoti() {
		return biaoti;
	}

	public void setBiaoti(String biaoti) {
		this.biaoti = biaoti;
	}
	public String getNeirong() {
		return neirong;
	}

	public void setNeirong(String neirong) {
		this.neirong = neirong;
	}
	public String getShijian() {
		return shijian;
	}

	public void setShijian(String shijian) {
		this.shijian = shijian;
	}
	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}
	
		
}