package comment;

import java.sql.Timestamp;

public class CommentDto {
	
	int comment_no;		// PK
	int board_no;		// FK
	String content;
	String id;			// FK
	Timestamp regDate, modDate;
	
	public CommentDto(int comment_no, int board_no, String content, String id, Timestamp regDate, Timestamp modDate) {
		super();
		this.comment_no = comment_no;
		this.board_no = board_no;
		this.content = content;
		this.id = id;
		this.regDate = regDate;
		this.modDate = modDate;
	}
	
	public int getComment_no() {
		return comment_no;
	}
	
//	public void setComment_no(int comment_no) {
//		this.comment_no = comment_no;
//	}
	
	public int getBoard_no() {
		return board_no;
	}
	
//	public void setBoard_no(int board_no) {
//		this.board_no = board_no;
//	}
	
	public String getContent() {
		return content;
	}
	
	public void setContent(String content) {
		this.content = content;
	}
	
	public String getId() {
		return id;
	}
	
//	public void setId(String id) {
//		this.id = id;
//	}
	
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
