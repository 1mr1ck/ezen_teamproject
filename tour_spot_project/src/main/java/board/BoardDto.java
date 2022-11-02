package board;

import java.sql.Timestamp;

public class BoardDto {
	
	private int b_no;			// PK
	private String title;
	private String content;
	private String user_id;		// FK
	private Timestamp regDate;
	private Timestamp modDate;
	private int viewCnt;
	private String map_url;
	
	public BoardDto(int b_no, String title, String content, String user_id, Timestamp regDate, Timestamp modDate, int viewCnt, String map_url) {
		super();
		this.b_no = b_no;
		this.title = title;
		this.content = content;
		this.user_id = user_id;
		this.regDate = regDate;
		this.modDate = modDate;
		this.viewCnt = viewCnt;
		this.map_url = map_url;
	}
	
	public BoardDto(int b_no, String title, String content, String user_id, Timestamp regDate, int viewCnt, String map_url) {
		super();
		this.b_no = b_no;
		this.title = title;
		this.content = content;
		this.user_id = user_id;
		this.regDate = regDate;
		this.viewCnt = viewCnt;
		this.map_url = map_url;
	}
	
	public BoardDto(int b_no, String title, String content) {
		super();
		this.b_no = b_no;
		this.title = title;
		this.content = content;
	}
	
	public int getB_no() {
		return b_no;
	}
	
//	public void setB_no(int b_no) {
//		this.b_no = b_no;
//	}
	
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
	
	public String getUser_id() {
		return user_id;
	}
	
	public void setUser_id(String user_id) {
		this.user_id = user_id;
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
	
//	public void setModDate(Timestamp modDate) {
//		this.modDate = modDate;
//	}
	
	public int getViewCnt() {
		return viewCnt;
	}
	
	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}
	
	public String getMap_url() {
		return map_url;
	}
	
	public void setMap_url(String map_url) {
		this.map_url = map_url;
	}
}
