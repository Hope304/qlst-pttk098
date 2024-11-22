package model;

public class TKKHtheoDT {
	
	private int KH_id;
	private int HD_id;
	private String tongtien;
	private String loai;
	private String ho;
	private String tendem;
	private String ten;
	
	public TKKHtheoDT() {
		super();
	}
	
	public TKKHtheoDT(int kH_id, int hD_id, String tongtien, String loai, String ho, String tendem, String ten) {
		super();
		KH_id = kH_id;
		HD_id = hD_id;
		this.tongtien = tongtien;
		this.loai = loai;
		this.ho = ho;
		this.tendem = tendem;
		this.ten = ten;
	}

	public int getKH_id() {
		return KH_id;
	}
	public void setKH_id(int kH_id) {
		KH_id = kH_id;
	}
	public int getHD_id() {
		return HD_id;
	}
	public void setHD_id(int hD_id) {
		HD_id = hD_id;
	}
	public String getTongtien() {
		return tongtien;
	}
	public void setTongtien(String tongtien) {
		this.tongtien = tongtien;
	}
	public String getLoai() {
		return loai;
	}
	public void setLoai(String loai) {
		this.loai = loai;
	}
	public String getHo() {
		return ho;
	}
	public void setHo(String ho) {
		this.ho = ho;
	}
	public String getTendem() {
		return tendem;
	}
	public void setTendem(String tendem) {
		this.tendem = tendem;
	}
	public String getTen() {
		return ten;
	}
	public void setTen(String ten) {
		this.ten = ten;
	}
	

}
