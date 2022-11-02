package comment;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

public class CommentDao {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private String url;
	private String user;
	private String password;
	
	private CommentDao() {
		this.url = "jdbc:mysql://database-1.cyt1kuyu4cld.ap-northeast-2.rds.amazonaws.com:3306/ezen_project";
        this.user = "admin";
        this.password = "d86L*vzYl7h$";
        
        this.conn = null;
        this.pstmt = null;
        this.rs = null;
	}
	private static CommentDao instance = new CommentDao();
	public static CommentDao getInstance() {
		return instance;
	}
	
	// Create
	private void createComment(CommentDto comment) {
		String sql = "insert into comments values(?, ?, ?, ?, ?, ?);";
		int no = noGenerator();
	}
	
	private int noGenerator() {
		String sql = "";
		return ;
	}
	
	// Read
	public ArrayList<CommentDto> getCommentAll(int no){
		ArrayList<CommentDto> list = new ArrayList<CommentDto>();
		String sql = "SELECT * FROM boards WHERE board_no=?;";
		try {
			this.conn = DBManager.getConnection(this.url, this.user, this.password);
			this.pstmt = this.conn.prepareStatement(sql);
			this.pstmt.setInt(1, no);
			this.rs = this.pstmt.executeQuery();
			
			while(this.rs.next()) {
				int comment_no = this.rs.getInt(1);
				int board_no = this.rs.getInt(2);
				String content = this.rs.getString(3);
				String id = this.rs.getString(4);
				Timestamp regDate = this.rs.getTimestamp(5);
				Timestamp modDate = this.rs.getTimestamp(6);
				
				CommentDto comment = new CommentDto(comment_no, board_no, content, id, regDate, modDate);
				list.add(comment);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				this.rs.close();
				this.pstmt.close();
				this.conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}
	
	// Update
	// Delete
	
}
