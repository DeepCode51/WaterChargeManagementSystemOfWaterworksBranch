package com.entity;

/**
 * 社区区域
 */
public class Quyu {


    private Integer id;  // ID
    private String no;  // 社区区域编号
    private String name;  // 社区区域名称
    private String detail;  // 社区区域说明
	

	public Quyu() {
	}
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}
	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}
	
		
}