package board;

import java.sql.Timestamp;

public class BoardDto {
	
	int no;				// PK
	int viewCnt;
	String title;
	String content;
	String id;			// FK
	String code;		// FK
	Timestamp regDate;
	Timestamp modDate;
	
	public BoardDto(int no, int viewCnt, String title, String content, String id, String code, Timestamp regDate, Timestamp modDate) {
		super();
		this.no = no;
		this.viewCnt = viewCnt;
		this.title = title;
		this.content = content;
		this.id = id;
		this.code = code;
		this.regDate = regDate;
		this.modDate = modDate;
	}
	
	public BoardDto(int no) {
		super();
		this.no = no;
	}
	
	public int getNo() {
		return no;
	}
	
//	public void setNo(int no) {
//		this.no = no;
//	}
	
	public int getViewCnt() {
		return viewCnt;
	}
	
	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}
	
	public String getTitle() {
		return title;
	}
	
	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getContent() {
		return content;
	}
	
	public void setContent(String content) {
		this.content = content;
	}
	
	public String getId() {
		return id;
	}
	
	public void setId(String id) {
		this.id = id;
	}
	
	public String getCode() {
		return code;
	}
	
	public void setCode(String code) {
		this.code = code;
	}
	
	public Timestamp getRegDate() {
		return regDate;
	}
	
	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}
	
	public Timestamp getModDate() {
		return modDate;
	}
	
	public void setModDate(Timestamp modDate) {
		this.modDate = modDate;
	}
}
