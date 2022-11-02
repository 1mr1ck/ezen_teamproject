package area;

public class AreaDto {
	
	private String code;	// PK
	private String name;

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
