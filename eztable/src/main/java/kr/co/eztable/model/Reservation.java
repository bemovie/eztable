package kr.co.eztable.model;

import java.util.Date;

public class Reservation {
	
	private String custCode;
	private String shopCode;
	private Date resDate;
	private Date resTime;
	private int resNop;
	
	public String getCustCode() {
		return custCode;
	}
	public void setCustCode(String custCode) {
		this.custCode = custCode;
	}
	public String getShopCode() {
		return shopCode;
	}
	public void setShopCode(String shopCode) {
		this.shopCode = shopCode;
	}
	public Date getResDate() {
		return resDate;
	}
	public void setResDate(Date resDate) {
		this.resDate = resDate;
	}
	public Date getResTime() {
		return resTime;
	}
	public void setResTime(Date resTime) {
		this.resTime = resTime;
	}
	public int getResNop() {
		return resNop;
	}
	public void setResNop(int resNop) {
		this.resNop = resNop;
	}
	
}
