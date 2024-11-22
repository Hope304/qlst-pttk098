package model;

import java.sql.Date;

public class Hoadonon {
	private int id;
	private Date ngaymua;
	private String trangthai;
	private Date ngaygiao;
	private float phigiao;
	private int NVKho_id;
	private int NVGiaohang_id;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Date getNgaydat() {
		return ngaymua;
	}
	public void setNgaydat(Date ngaydat) {
		this.ngaymua = ngaydat;
	}
	public String getTrangthai() {
		return trangthai;
	}
	public void setTrangthai(String trangthai) {
		this.trangthai = trangthai;
	}
	public Date getNgaygiao() {
		return ngaygiao;
	}
	public void setNgaygiao(Date ngaygiao) {
		this.ngaygiao = ngaygiao;
	}
	public float getPhigiao() {
		return phigiao;
	}
	public void setPhigiao(float phigiao) {
		this.phigiao = phigiao;
	}
	public int getNVKho_id() {
		return NVKho_id;
	}
	public void setNVKho_id(int nVKho_id) {
		NVKho_id = nVKho_id;
	}
	public int getNVGiaohang_id() {
		return NVGiaohang_id;
	}
	public void setNVGiaohang_id(int nVGiaohang_id) {
		NVGiaohang_id = nVGiaohang_id;
	}
	
	

}
