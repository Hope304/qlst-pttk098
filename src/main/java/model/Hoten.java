package model;

public class Hoten {
	private int id;
	private String ho;
	private String tendem;
	private String ten;
	
	public Hoten(String ho, String tendem, String ten) {
		super();
		this.ho = ho;
		this.tendem = tendem;
		this.ten = ten;
	}
	
	public Hoten(int id, String ho, String tendem, String ten) {
		super();
		this.id = id;
		this.ho = ho;
		this.tendem = tendem;
		this.ten = ten;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
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
