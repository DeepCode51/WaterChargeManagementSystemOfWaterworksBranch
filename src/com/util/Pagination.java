package com.util;

import java.util.List;

/**
 * @author 分页对象
 * 
 */
public class Pagination {

	private int totle;// 总共数据行数

	private int pageSize;// 每页显示数据

	private int totlePage;// 总共页数

	private int currPage;// 当前第几页

	private List data; // 数据集合

	private String path;// 跳转路径

	public Pagination() {

	}

	/**
	 * 构造函数
	 * 
	 * @param totle
	 * @param pageSize
	 * @param totlePage
	 * @param index
	 * @param data
	 * @param path
	 */
	public Pagination(int totle, int pageSize, int totlePage, int currPage,
			List data, String path) {
		this.totle = totle;
		this.pageSize = pageSize;
		this.totlePage = totlePage;
		this.currPage = currPage;
		this.data = data;
		this.path = path;
	}

	public void setTotle(int totle) {
		this.totle = totle;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public int getTotle() {
		return totle;
	}

	public int getPageSize() {
		return pageSize;
	}

	public int getTotlePage() {
		return (this.totle + this.pageSize - 1) / this.pageSize;
	}

	public int getCurrPage() {
		return currPage;
	}

	public void setCurrPage(int currPage) {
		this.currPage = currPage;
	}

	public String getPath() {
		return path;
	}

	public void setTotlePage(int totlePage) {
		this.totlePage = totlePage;
	}

	public List getData() {
		return data;
	}

	public void setData(List data) {
		this.data = data;
	}

	/**
	 * 获取分页代码
	 * 
	 * @param targetUrl
	 *            目标地址
	 * @param totalNum
	 *            总记录数
	 * @param currentPage
	 *            当前页
	 * @param pageSize
	 *            每页大小
	 * @return
	 */
	public static String getPagation(String targetUrl, int totalNum,
			int currentPage, int pageSize) {
		int totalPage = totalNum % pageSize == 0 ? totalNum / pageSize
				: totalNum / pageSize + 1;
		if (totalPage == 0) {
			return "<font color=red>未查询到数据！</font>";
		}
		StringBuffer pageCode = new StringBuffer();
		pageCode.append("<li><a href='" + targetUrl + "&page=1'>首页</a></li>");
		if (currentPage == 1) {
			pageCode.append("<li class='disabled'><a href='#'>上一页</a></li>");
		} else {
			pageCode.append("<li><a href='" + targetUrl + "&page="
					+ (currentPage - 1) + "'>上一页</a></li>");
		}

		for (int i = currentPage - 2; i <= currentPage + 2; i++) {
			if (i < 1 || i > totalPage) {
				continue;
			}
			if (i == currentPage) {
				pageCode.append("<li class='active'><a href='#'>" + i
						+ "</a></li>");
			} else {
				pageCode.append("<li><a href='" + targetUrl + "&page=" + i
						+ "'>" + i + "</a></li>");
			}

		}

		if (currentPage == totalPage) {
			pageCode.append("<li class='disabled'><a href='#'>下一页</a></li>");
		} else {
			pageCode.append("<li><a href='" + targetUrl + "&page="
					+ (currentPage + 1) + "'>下一页</a></li>");
		}
		pageCode.append("<li><a href='" + targetUrl + "&page=" + totalPage
				+ "'>尾页</a></li>");
		return pageCode.toString();
	}
}
