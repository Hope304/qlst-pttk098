package model;

public class Taikhoan {
	private int id;
	private String username;
	private String password;
	
	public Taikhoan(String usename, String password) {
		super();
		this.username = usename;
		this.password = password;
	}

	public Taikhoan(int id, String usename, String password) {
		super();
		this.id = id;
		this.username = usename;
		this.password = password;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String usename) {
		this.username = usename;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}

	
}
