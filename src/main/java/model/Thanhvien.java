package model;

public class Thanhvien {
	private int id;
	private String sdt;
	private String gmail;
	private String mota;
	private String vaitro;
	private int taikhoan_id;
	private int hoten_id;
	private int diachi_id;
	
	
	public Thanhvien(int id, String sdt, String gmail, String mota, String vaitro, int taikhoan_id, int hoten_id,
			int diachi_id) {
		super();
		this.id = id;
		this.sdt = sdt;
		this.gmail = gmail;
		this.mota = mota;
		this.vaitro = vaitro;
		this.taikhoan_id = taikhoan_id;
		this.hoten_id = hoten_id;
		this.diachi_id = diachi_id;
	}
	


	public Thanhvien(String sdt, String gmail, int taikhoan_id, int hoten_id, int diachi_id) {
		super();
		this.sdt = sdt;
		this.gmail = gmail;
		this.taikhoan_id = taikhoan_id;
		this.hoten_id = hoten_id;
		this.diachi_id = diachi_id;
	}



	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getSdt() {
		return sdt;
	}
	public void setSdt(String sdt) {
		this.sdt = sdt;
	}
	public String getGmail() {
		return gmail;
	}
	public void setGmail(String gmail) {
		this.gmail = gmail;
	}
	public String getMota() {
		return mota;
	}
	public void setMota(String mota) {
		this.mota = mota;
	}
	public String getVaitro() {
		return vaitro;
	}
	public void setVaitro(String vaitro) {
		this.vaitro = vaitro;
	}
	public int getTaikhoan_id() {
		return taikhoan_id;
	}
	public void setTaikhoan_id(int taikhoan_id) {
		this.taikhoan_id = taikhoan_id;
	}
	public int getHoten_id() {
		return hoten_id;
	}
	public void setHoten_id(int hoten_id) {
		this.hoten_id = hoten_id;
	}
	public int getDiachi_id() {
		return diachi_id;
	}
	public void setDiachi_id(int diachi_id) {
		this.diachi_id = diachi_id;
	}
	
	
}
