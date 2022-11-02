package user;

public class UserDto {
	
	int no;
	int age;
	String name;
	String gender;
	String mail;
	String address;
	String phone;
	String id;			// PK
	String password;
	
	public UserDto(int no, int age, String name, String gender, String mail, String address, String phone, String id, String password) {
		super();
		this.no = no;
		this.age = age;
		this.name = name;
		this.gender = gender;
		this.mail = mail;
		this.address = address;
		this.phone = phone;
		this.id = id;
		this.password = password;
	}
	
	public UserDto(String id) {
		super();
		this.id = id;
	}
	
	public int getNo() {
		return no;
	}
	
	public void setNo(int no) {
		this.no = no;
	}
	
	public int getAge() {
		return age;
	}
	
	public void setAge(int age) {
		this.age = age;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getGender() {
		return gender;
	}
	
	public void setGender(String gender) {
		this.gender = gender;
	}
	
	public String getMail() {
		return mail;
	}
	
	public void setMail(String mail) {
		this.mail = mail;
	}
	
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
	
	public String getId() {
		return id;
	}
	
//	public void setId(String id) {
//		this.id = id;
//	}
	
	public String getPassword() {
		return password;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}
}
