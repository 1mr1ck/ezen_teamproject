package area;

public class AreaDto {
	
	String code;	// PK
	String name;

	public AreaDto(String code, String name) {
		this.code = code;
		this.name = name;
	}
	
	public String getCode() {
		return code;
	}
	
//	public void setCode(String code) {
//		this.code = code;
//	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
}
