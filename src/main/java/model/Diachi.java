package model;

public class Diachi {
	private int id;
	private String tinh;
	private String huyen;
	private String ghichu;
	
	public Diachi(String tinh, String huyen, String ghichu) {
		super();
		this.tinh = tinh;
		this.huyen = huyen;
		this.ghichu = ghichu;
	}
	
	public Diachi(int id, String tinh, String huyen, String ghichu) {
		super();
		this.id = id;
		this.tinh = tinh;
		this.huyen = huyen;
		this.ghichu = ghichu;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTinh() {
		return tinh;
	}
	public void setTinh(String tinh) {
		this.tinh = tinh;
	}
	public String getHuyen() {
		return huyen;
	}
	public void setHuyen(String huyen) {
		this.huyen = huyen;
	}
	public String getGhichu() {
		return ghichu;
	}
	public void setGhichu(String ghichu) {
		this.ghichu = ghichu;
	}

	
}
