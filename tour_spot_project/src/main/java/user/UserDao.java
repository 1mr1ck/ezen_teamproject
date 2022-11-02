package user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import util.DBManager;

public class UserDao {
	private String url;
	private String user;
	private String password;
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private UserDao() {
		this.url = "jdbc:mysql://database-1.cyt1kuyu4cld.ap-northeast-2.rds.amazonaws.com:3306/ezen_project";
        this.user = "admin";
        this.password = "d86L*vzYl7h$";
        
        this.conn = null;
        this.pstmt = null;
        this.rs = null;
	}
	
	private static UserDao instance = new UserDao();
	
	public static UserDao getInstance() {
		return instance;
	}
	
	// C R U D
	// 1. C
	
	// 회원 생성
	public void createUser(UserDto dto) {
		// no, name, age, gender, id, address, phone, password, token
		String sql = "INSERT INTO users VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?)";
		int no = noGenerator();
		
		try {
			this.conn = DBManager.getConnection(this.url, this.user, this.password);
			this.pstmt = this.conn.prepareStatement(sql);
			this.pstmt.setInt(1, no);
			this.pstmt.setString(2, dto.getName());
			this.pstmt.setInt(3, dto.getAge());
			this.pstmt.setString(4, dto.getGender());
			this.pstmt.setString(5, dto.getId());
			this.pstmt.setString(6, dto.getAddress());
			this.pstmt.setString(7, dto.getPhone());
			this.pstmt.setString(8, dto.getPassword());
			this.pstmt.setString(9, dto.getToken());
			
			this.pstmt.execute();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				this.conn.close();
				this.pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	// 회원코드 자동생성
	public int noGenerator() {
		String sql = "SELECT MAX(`no`) FROM users;";
		int no = 0;
		
		try {
			this.conn = DBManager.getConnection(this.url, this.user, this.password);
			this.pstmt = this.conn.prepareStatement(sql);
			this.rs = this.pstmt.executeQuery();
			
			if(rs.next()) {
				no = this.rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				this.conn.close();
				this.pstmt.close();
				this.rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return ++no;
	}
	
	// R
	// 유저 한명의 정보 가져오기
	public UserDto getUserByNo(int no) {
		UserDto user = null;
		String sql = "SELECT * FROM users WHERE `no` = ?";
		
		try {
			this.conn = DBManager.getConnection(this.url, this.user, this.password);
			this.pstmt = this.conn.prepareStatement(sql);
			this.pstmt.setInt(1, no);
			this.rs = this.pstmt.executeQuery();
			
			if(rs.next()) {
				String name = this.rs.getString(2);
				int age = this.rs.getInt(3);
				String gender = this.rs.getString(4);
				String id = this.rs.getString(5);
				String address = this.rs.getString(6);
				String phone = this.rs.getString(7);
				String password = this.rs.getString(8);
				String token = this.rs.getString(9);
				
				user = new UserDto(no, name, age, gender, id, address, phone, password, token);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				this.conn.close();
				this.pstmt.close();
				this.rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		
		return user;
	}
	
	// U
	// 유저 정보 수정
	public void updateUserInfo(UserDto dto) {
		String name = dto.getName();
		int age = dto.getAge();
		String gender = dto.getGender();
		String id = dto.getId();
		String address = dto.getAddress();
		String phone = dto.getPhone();
		String password = dto.getPassword();
		String token = dto.getToken();
		
		String sql  = "UPDATE users SET `name` = ?, age = ?, gender = ?, address = ?, phone = ?, password = ?, token = ?";
		
		try {
			this.conn = DBManager.getConnection(this.url, this.user, this.password);
			this.pstmt = this.conn.prepareStatement(sql);
			this.pstmt.setString(1, name);
			this.pstmt.setInt(2, age);
			this.pstmt.setString(3, gender);
			this.pstmt.setString(4, id);
			this.pstmt.setString(5, address);
			this.pstmt.setString(6, phone);
			this.pstmt.setString(7, password);
			this.pstmt.setString(8, token);
			
			this.pstmt.execute();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				this.conn.close();
				this.pstmt.close();
				this.rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	// D
	public void deleteUser(UserDto dto) {
		int no = dto.getNo();
		
		String sql = "DELETE FROM users where `no` = ?";
		
		try {
			this.conn = DBManager.getConnection(this.url, this.user, this.password);
			this.pstmt = this.conn.prepareStatement(sql);
			this.pstmt.setInt(1, no);
			
			this.pstmt.execute();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				this.conn.close();
				this.pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
