package user;

public class UserDto {
	
	private int no;
	private String name;
	private int age;
	private String gender;
	private String id;
	private String address;
	private String phone;
	private String password;
	private String token;

	public UserDto(int no, String name, int age, String gender, String id, String address, String phone, String password, String token) {
		super();
		this.no = no;
		this.id = id;
		this.password = password;
		this.name = name;
		this.age = age;
		this.gender = gender;
		this.address = address;
		this.phone = phone;
		this.token = token;
	}

	// getter & setter
	public int getNo() {
		return no;
	}

//	public void setNo(int no) {
//		this.no = no;
//	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getId() {
		return id;
	}

//	public void setId(String id) {
//		this.id = id;
//	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getToken() {
		return token;
	}

//	public void setToken(String token) {
//		this.token = token;
//	}
	
	
	
	
	
	
}
