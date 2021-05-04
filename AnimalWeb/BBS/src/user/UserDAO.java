package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public UserDAO() {
		
		try {
			String dbURL = "jdbc:mysql://localhost:3306/BBS?serverTimezone=UTC";
			String dbID = "root";
			String dbPW = "root";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPW);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public int login(String userID, String userPW) {
		String SQL = "SELECT userPW FROM USER WHERE userID = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString(1).equals(userPW)) {
					return 1;	//	로그인 성공
				}
				else {
					return 0;	//	비밀번호 불일치
				}
			}
			else {
				return -1;	//	아이디가 없음
			}
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2;	
	}
	
	public int join(User user) {
		String SQL = "INSERT INTO USER VALUES (?, ?, ?, ?, ?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserID());
			pstmt.setString(2, user.getUserPW());
			pstmt.setString(3, user.getUserName());
			pstmt.setString(4, user.getUserGender());
			pstmt.setString(5, user.getUserEmail());
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	
	public int userDelete(String userID, String userPW) {
		String SQL1 = "SELECT userPW FROM USER WHERE userID = ?";
		String SQL2 = "DELETE FROM USER WHERE userID = ?";

		try {
			pstmt = conn.prepareStatement(SQL1);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			conn.setAutoCommit(false);	//	자동커밋 false로 설정
			if(rs.next()) {
				if(rs.getString(1).equals(userPW)) {
					pstmt = conn.prepareStatement(SQL2);
					pstmt.setString(1, userID);
					pstmt.executeUpdate();
	                conn.commit(); 
	                return 1;	// 탈퇴 성공
				}
				else {
					return 0;	//	비밀번호 불일치
				}
			}
			else {
				return -1;	//	아이디가 없음
			}
		
		} catch (Exception slqe) {
			try {
				conn.rollback();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			finally {
				try{
					if ( pstmt != null ){ pstmt.close(); pstmt=null; }
					if ( conn != null ){ conn.close(); conn=null;    }
				}catch(Exception e){
					throw new RuntimeException(e.getMessage());
				}
			}
		}
		return -2;	
	}
	
	public int userUpdate(User user) {
		
		String SQL = "UPDATE USER SET userPW = ?, userName = ?, userGender = ?, userEmail = ? WHERE userID = ?";
		
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserPW());
			pstmt.setString(2, user.getUserName());
			pstmt.setString(3, user.getUserGender());
			pstmt.setString(4, user.getUserEmail());
			pstmt.setString(5, user.getUserID());
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
}


