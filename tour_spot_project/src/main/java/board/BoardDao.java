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
		String sql = "insert into board values(?, ?, ?, ?, ?, ?, ?, ?);";
		int no = noGenerator();
		
		try {
			this.conn = DBManager.getConnection(this.url, this.user, this.password);
			this.pstmt = this.conn.prepareStatement(sql);
			this.pstmt.setInt(1, no);
			this.pstmt.setInt(2, 0);
			this.pstmt.setString(3, board.getTitle());
			this.pstmt.setString(4, board.getContent());
			this.pstmt.setString(5, board.getId());
			this.pstmt.setString(6, board.getMap_url());
			
			Timestamp now = new Timestamp(System.currentTimeMillis());
			this.pstmt.setTimestamp(7, now);
			this.pstmt.setTimestamp(8, now);
			
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
		String sql = "SELECT MAX(`no`) FROM board;";
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
	// All
	public ArrayList<BoardDto> getBoardAll() {
		ArrayList<BoardDto> list = new ArrayList<BoardDto>();
		String sql = "SELECT * FROM board ORDER BY `no` DESC;";
		
		try {
			this.conn = DBManager.getConnection(this.url, this.user, this.password);
			this.pstmt = this.conn.prepareStatement(sql);
			this.rs = this.pstmt.executeQuery();
			
			while(this.rs.next()) {
				int no = this.rs.getInt(1);
				int viewCnt = this.rs.getInt(2);
				String title = this.rs.getString(3);
				String content = this.rs.getString(4);
				String id = this.rs.getString(5);
				String map_url = this.rs.getString(6);
				Timestamp regDate = this.rs.getTimestamp(7);
				Timestamp modDate = this.rs.getTimestamp(8);
				
				BoardDto board = new BoardDto(no, viewCnt, title, content, id, map_url, regDate, modDate);
				list.add(board);
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
	public BoardDto getBoardByNo(int no) {
		BoardDto board = null;
		String sql = "SELECT * FROM board WHERE `no` = ?;";
		
		try {
			this.conn = DBManager.getConnection(this.url, this.user, this.password);
			this.pstmt = this.conn.prepareStatement(sql);
			this.pstmt.setInt(1, no);
			this.rs = this.pstmt.executeQuery();
			
			if(this.rs.next()) {
				int viewCnt = this.rs.getInt(2);
				String title = this.rs.getString(3);
				String content = this.rs.getString(4);
				String id = this.rs.getString(5);
				String map_url = this.rs.getString(6);
				Timestamp regDate = this.rs.getTimestamp(7);
				Timestamp modDate = this.rs.getTimestamp(8);
				
				board = new BoardDto(no, viewCnt, title, content, id, map_url, regDate, modDate);
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
	
	// Update
	public void updateBoard(BoardDto board) {
		String sql = "";
		
		
		
	}
	
	// Delete
	
	
}
