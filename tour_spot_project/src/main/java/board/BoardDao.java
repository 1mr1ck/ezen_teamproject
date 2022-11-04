package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

import util.DBManager;

public class BoardDao {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private String url;
	private String user;
	private String password;
	
	private BoardDao() {
		this.url = "jdbc:mysql://database-1.cyt1kuyu4cld.ap-northeast-2.rds.amazonaws.com:3306/ezen_project";
        this.user = "admin";
        this.password = "d86L*vzYl7h$";
        
        this.conn = null;
        this.pstmt = null;
        this.rs = null;
	}
	
	private static BoardDao instance = new BoardDao();
	public static BoardDao getInstance() {
		return instance;
	}
	
	// Create
	public void createBoard(BoardDto board) {
		String sql = "insert into boards values(?, ?, ?, ?, ?, ?, ?, ?)";
		int b_no = noGenerator();
		
		try {
			this.conn = DBManager.getConnection(this.url, this.user, this.password);
			this.pstmt = this.conn.prepareStatement(sql);
			Timestamp now = new Timestamp(System.currentTimeMillis());
			this.pstmt.setInt(1, b_no);
			this.pstmt.setString(2, board.getTitle());
			this.pstmt.setString(3, board.getContent());
			this.pstmt.setString(4, board.getUser_id());
			this.pstmt.setTimestamp(5, now);
			this.pstmt.setTimestamp(6, null);
			this.pstmt.setInt(7, board.getViewCnt());
			this.pstmt.setString(8, board.getMap_addr());
			
			this.pstmt.execute();
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
		String sql = "SELECT MAX(`b_no`) FROM boards";
		int b_no = 0;
		
		try {
			this.conn = DBManager.getConnection(this.url, this.user, this.password);
			this.pstmt = this.conn.prepareStatement(sql);
			this.rs = this.pstmt.executeQuery();
			
			if(this.rs.next()) {
				b_no = this.rs.getInt(1);
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
		return ++b_no;
	}
	
	// Read
	// All
	public ArrayList<BoardDto> getBoardAll() {
		ArrayList<BoardDto> list = new ArrayList<BoardDto>();
		String sql = "SELECT * FROM boards ORDER BY `b_no` DESC";
		
		try {
			this.conn = DBManager.getConnection(this.url, this.user, this.password);
			this.pstmt = this.conn.prepareStatement(sql);
			this.rs = this.pstmt.executeQuery();
			
			if(this.rs.next()) {
				do {
					int b_no = this.rs.getInt(1);
					String title = this.rs.getString(2);
					String content = this.rs.getString(3);
					String user_id = this.rs.getString(4);
					Timestamp regDate = this.rs.getTimestamp(5);
					Timestamp modDate = this.rs.getTimestamp(6);
					int viewCnt = this.rs.getInt(7);
					String map_addr = this.rs.getString(8);
					
					BoardDto board = new BoardDto(b_no, title, content, user_id, regDate, modDate, viewCnt, map_addr);
					list.add(board);
						
					} while(this.rs.next());
			} else {
				System.out.println("Empty");
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
		return list;
	}
	
	// One
	public BoardDto getBoardByNo(int b_no) {
		BoardDto board = null;
		String sql = "SELECT * FROM boards WHERE `b_no` = ?";
		
		try {
			this.conn = DBManager.getConnection(this.url, this.user, this.password);
			this.pstmt = this.conn.prepareStatement(sql);
			this.pstmt.setInt(1, b_no);
			this.rs = this.pstmt.executeQuery();
			
			if(this.rs.next()) {
				String title = this.rs.getString(2);
				String content = this.rs.getString(3);
				String user_id = this.rs.getString(4);
				Timestamp regDate = this.rs.getTimestamp(5);
				Timestamp modDate = this.rs.getTimestamp(6);
				int viewCnt = this.rs.getInt(7);
				String map_addr = this.rs.getString(8);
				
				board = new BoardDto(b_no, title, content, user_id, regDate, modDate, viewCnt, map_addr);
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
		return board;
	}
	
	// Search
	public void searchAddr(BoardDto board) {
		String sql = "";
		
		
	}
	
	
	// Update viewCnt
	public void updateViewCnt(int b_no) {
		String sql = "update boards set viewCnt=viewCnt+1 WHERE `b_no` = ?";
		
		try {
			this.conn = DBManager.getConnection(this.url, this.user, this.password);
			this.pstmt = this.conn.prepareStatement(sql);
			
			this.pstmt.setInt(1, b_no);
			
			this.pstmt.executeUpdate();
			
			System.out.println("조회수 1 증가");
			
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
	
	// Update
	public void updateBoard(BoardDto board) {
		String sql = "update boards set title = ?, content = ?, moddate = ?, map_addr = ? WHERE `b_no` = ?";
		
		int b_no = board.getB_no();
		String title = board.getTitle();
		String content = board.getContent();
		Timestamp modDate = board.getModDate();
		String map_addr = board.getMap_addr();
		
		try {
			this.conn = DBManager.getConnection(this.url, this.user, this.password);
			this.pstmt = this.conn.prepareStatement(sql);
			this.pstmt.setString(1, title);
			this.pstmt.setString(2, content);
			modDate = new Timestamp(System.currentTimeMillis());
			this.pstmt.setTimestamp(3, modDate);
			this.pstmt.setString(4, map_addr);
			this.pstmt.setInt(5, b_no);
			
			this.pstmt.execute();
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
	
	// Delete
	public void deleteBoard(BoardDto board) {
		String sql = "DELETE FROM boards WHERE b_no = ?";
		
		try {
			this.conn = DBManager.getConnection(this.url, this.user, this.password);
			this.pstmt = conn.prepareStatement(sql);
			this.pstmt.setInt(1, board.getB_no());
			
			this.pstmt.execute();
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
}
