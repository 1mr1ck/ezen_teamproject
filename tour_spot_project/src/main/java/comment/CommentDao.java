package comment;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

import util.DBManager;

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
		
		try {
			this.conn = DBManager.getConnection(this.url, this.user, this.password);
			this.pstmt = this.conn.prepareStatement(sql);
			this.pstmt.setInt(1, no);
			this.pstmt.setInt(2, comment.getBoard_no());
			this.pstmt.setString(3, comment.getContent());
			this.pstmt.setString(4, comment.getId());
			
			Timestamp now = new Timestamp(System.currentTimeMillis());
			this.pstmt.setTimestamp(5, now);
			this.pstmt.setTimestamp(6, now);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				this.pstmt.close();
				this.conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	private int noGenerator() {
		String sql = "SELECT MAX(`no`) FROM comments;";
		int no = 0;
		
		try {
			this.conn = DBManager.getConnection(this.url, this.user, this.password);
			this.pstmt = this.conn.prepareStatement(sql);
			this.rs = this.pstmt.executeQuery();
			
			if(this.rs.next()) {
				no = this.rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				this.rs.close();
				this.pstmt.close();
				this.conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return ++no;
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
	public void updateComment(CommentDto comment) {
		String sql = "update board set comment = ? WHERE comment_no = ? AND board_no = ?;";
		int c_no = comment.getComment_no();
		int b_no = comment.getBoard_no();
		String content = comment.getContent();
		
		try {
			this.conn = DBManager.getConnection(this.url, this.user, this.password);
			this.pstmt = this.conn.prepareStatement(sql);
			this.pstmt.setString(1, content);
			this.pstmt.setInt(2, c_no);
			this.pstmt.setInt(3, b_no);
			this.pstmt.execute();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				this.pstmt.close();
				this.conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	// Delete
	public void deleteComment(CommentDto comment) {
		int c_no = comment.getComment_no();
		int b_no = comment.getBoard_no();
		
		String sql = "DELETE FROM comments WHERE cmoment_no = ? AND board_no = ?;";
		try {
			this.conn = DBManager.getConnection(this.url, this.user, this.password);
			this.pstmt = this.conn.prepareStatement(sql);
			this.pstmt.setInt(1, c_no);
			this.pstmt.setInt(2, b_no);
			this.pstmt.execute();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				this.conn.close();
				this.pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
