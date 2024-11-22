package model;

import java.sql.Date;

public class Hodonoff {
	private int id;
	private Date ngaymua;
	private float thue;
	private int NVBH_id;
	private int giohang_id;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Date getNgaymua() {
		return ngaymua;
	}
	public void setNgaymua(Date ngaymua) {
		this.ngaymua = ngaymua;
	}
	public float getThue() {
		return thue;
	}
	public void setThue(float thue) {
		this.thue = thue;
	}
	public int getNVBH_id() {
		return NVBH_id;
	}
	public void setNVBH_id(int nVBH_id) {
		NVBH_id = nVBH_id;
	}
	public int getGiohang_id() {
		return giohang_id;
	}
	public void setGiohang_id(int giohang_id) {
		this.giohang_id = giohang_id;
	}
	
	

}
