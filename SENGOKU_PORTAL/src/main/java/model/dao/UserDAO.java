package model.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.entity.UserBean;

public class UserDAO{
	
	public String selectUserName(String user_id) throws ClassNotFoundException, SQLException{
		
		String nickname = "";
		
		String sql = "SELECT nickname FROM user WHERE user_id = ?";
		
		try (Connection con = ConnectionManager.getConnection();
				Statement stmt = con.createStatement();
				PreparedStatement pstmt = con.prepareStatement(sql)) {
			
			pstmt.setString(1, user_id);
			
			ResultSet res = pstmt.executeQuery();
			
			while (res.next()) {
				nickname = res.getString("nickname");
			}
		
		}
		
		return nickname;
		
	}
	
	public List<UserBean> selectAllUser() throws ClassNotFoundException, SQLException{
		
		List<UserBean> userList = new ArrayList<UserBean>();
		
		String sql = "SELECT u.user_id AS user_id, u.password AS password, u.nickname AS nickname, u.myself AS myself, u.gender AS gender, u.busho_id AS busho_id, b.busho_name AS busho_name, u.birth_date AS birth_date, u.area AS area, b.busho_img AS busho_img FROM user u LEFT OUTER JOIN busho b ON (u.busho_id = b.busho_id)";
		
		try (Connection con = ConnectionManager.getConnection();
				Statement stmt = con.createStatement();
				PreparedStatement pstmt = con.prepareStatement(sql)) {
			
			ResultSet res = pstmt.executeQuery();

			// 結果の操作
			while (res.next()) {
				String user_id = res.getString("user_id");
				String password = res.getString("password");
				String nickname = res.getString("nickname");
				String myself = res.getString("myself");
				int gender = res.getInt("gender");
				String busho_id = res.getString("busho_id");
				String busho_name = res.getString("busho_name");
				Date birth_date = res.getDate("birth_date");
				String area = res.getString("area");
				String busho_img = res.getString("busho_img");
						
				UserBean user = new UserBean();
				user.setUserID(user_id);
				user.setBushoName(busho_name);
				user.setPassword(password);
				user.setNickname(nickname);
				user.setMyself(myself);
				user.setGender(gender);
				user.setBushoID(busho_id);
				user.setBushoName(busho_name);
				user.setBirthDate(birth_date);
				user.setArea(area);
				user.setBushoImg(busho_img);

				userList.add(user);
			}
		}
		
		return userList;
	}
	

	/**
	 * 
	 * @param sort
	 * @param order
	 * @return
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 */
	public List<UserBean> selectAllUserSort(String sort, String order) throws ClassNotFoundException, SQLException{
		 
		List<UserBean> userList = new ArrayList<UserBean>();
		
		String sql = "SELECT u.user_id AS user_id, u.password AS password, u.nickname AS nickname, u.myself AS myself, u.gender AS gender, u.busho_id AS busho_id, b.busho_name AS busho_name, u.birth_date AS birth_date, u.area AS area, b.busho_img AS busho_img FROM user u LEFT OUTER JOIN busho b ON (u.busho_id = b.busho_id) ORDER BY " + sort + " " + order;
		
		try (Connection con = ConnectionManager.getConnection();
				Statement stmt = con.createStatement();
				PreparedStatement pstmt = con.prepareStatement(sql)) {
			
			ResultSet res = pstmt.executeQuery();

			// 結果の操作
			while (res.next()) {
				String user_id = res.getString("user_id");
				String password = res.getString("password");
				String nickname = res.getString("nickname");
				String myself = res.getString("myself");
				int gender = res.getInt("gender");
				String busho_id = res.getString("busho_id");
				String busho_name = res.getString("busho_name");
				Date birth_date = res.getDate("birth_date");
				String area = res.getString("area");
				String busho_img = res.getString("busho_img");
						
				UserBean user = new UserBean();
				user.setUserID(user_id);
				user.setBushoName(busho_name);
				user.setPassword(password);
				user.setNickname(nickname);
				user.setMyself(myself);
				user.setGender(gender);
				user.setBushoID(busho_id);
				user.setBushoName(busho_name);
				user.setBirthDate(birth_date);
				user.setArea(area);
				user.setBushoImg(busho_img);

				userList.add(user);
			}
		}
		
		return userList;
	}
	
	/**
	 * ユーザIDから権限を取得する
	 * @param user_id
	 * @return
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 */
	
	public int selectAuthority(String user_id) throws ClassNotFoundException, SQLException{
	
		int authority = 1;
		
		String sql = "SELECT authority FROM user WHERE user_id = ?";
		
		try (Connection con = ConnectionManager.getConnection();
				Statement stmt = con.createStatement();
				PreparedStatement pstmt = con.prepareStatement(sql)) {
			
			pstmt.setString(1, user_id);
			
			ResultSet res = pstmt.executeQuery();
			
			while (res.next()) {
				authority = res.getInt("authority");
			}
		
		}
		
		return authority;
	}
	
	public List<UserBean> selectProfile(String user_id_temp) throws ClassNotFoundException, SQLException{
		
		List<UserBean> profileList = new ArrayList<UserBean>();
		
		String sql = "SELECT u.user_id AS user_id, u.password AS password, u.nickname AS nickname, u.myself AS myself, u.gender AS gender, u.busho_id AS busho_id, b.busho_name AS busho_name, b.busho_img AS busho_img, u.birth_date AS birth_date, u.area AS area FROM user u LEFT OUTER JOIN busho b ON (u.busho_id = b.busho_id) WHERE user_id = ?";
		
		try (Connection con = ConnectionManager.getConnection();
				Statement stmt = con.createStatement();
				PreparedStatement pstmt = con.prepareStatement(sql)) {
			
			pstmt.setString(1, user_id_temp);
			
			ResultSet res = pstmt.executeQuery();

			// 結果の操作
			while (res.next()) {
				String user_id = res.getString("user_id");
				String password = res.getString("password");
				String nickname = res.getString("nickname");
				String myself = res.getString("myself");
				int gender = res.getInt("gender");
				String busho_id = res.getString("busho_id");
				String busho_name = res.getString("busho_name");
				String busho_img = res.getString("busho_img");
				Date birth_date = res.getDate("birth_date");
				String area = res.getString("area");
						
				UserBean user = new UserBean();
				user.setUserID(user_id);
				user.setBushoName(busho_name);
				user.setPassword(password);
				user.setNickname(nickname);
				user.setMyself(myself);
				user.setGender(gender);
				user.setBushoID(busho_id);
				user.setBushoName(busho_name);
				user.setBushoImg(busho_img);
				user.setBirthDate(birth_date);
				user.setArea(area);

				profileList.add(user);
			}
		}
		
		return profileList;
		
	}
	
	public String selectUserIcon(String user_id) throws ClassNotFoundException, SQLException{
		
		String busho_img = null;
		
		String sql = "SELECT b.busho_img AS busho_img FROM user u LEFT OUTER JOIN busho b ON (u.busho_id = b.busho_id) WHERE user_id = ?";
		
		try (Connection con = ConnectionManager.getConnection();
				Statement stmt = con.createStatement();
				PreparedStatement pstmt = con.prepareStatement(sql)) {
			
			pstmt.setString(1, user_id);
			
			ResultSet res = pstmt.executeQuery();
			
			while (res.next()) {
				busho_img = res.getString("busho_img");
			}
		
		}
		
		return busho_img;
	}
	
	public int changeProfile(String password, String nickname, int gender, String busho_id, Date date, String area, String myself, String user_id) throws ClassNotFoundException, SQLException{
		
		int count = 0;
		
		if(busho_id.equals("null")) {
			
			String sql = "UPDATE user SET password = ?, nickname = ?, gender = ?, busho_id = null, birth_date = ?, area = ?, myself = ? WHERE user_id = ?";
			
			try (Connection con = ConnectionManager.getConnection();
					Statement stmt = con.createStatement();
					PreparedStatement pstmt = con.prepareStatement(sql)) {
				
				pstmt.setString(1, password);
				pstmt.setString(2, nickname);
				pstmt.setInt(3, gender);
				pstmt.setDate(4, date);
				pstmt.setString(5, area);
				pstmt.setString(6, myself);
				pstmt.setString(7, user_id);
				
				count = pstmt.executeUpdate();
	
	
			}

			
		} else {
			
			String sql = "UPDATE user SET password = ?, nickname = ?, gender = ?, busho_id = ?, birth_date = ?, area = ?, myself = ? WHERE user_id = ?";
			
			try (Connection con = ConnectionManager.getConnection();
					Statement stmt = con.createStatement();
					PreparedStatement pstmt = con.prepareStatement(sql)) {
				
				pstmt.setString(1, password);
				pstmt.setString(2, nickname);
				pstmt.setInt(3, gender);
				pstmt.setString(4, busho_id);
				pstmt.setDate(5, date);
				pstmt.setString(6, area);
				pstmt.setString(7, myself);
				pstmt.setString(8, user_id);
				
				count = pstmt.executeUpdate();
	
	
			}
			
		}
			
		return count;
		
	}
	
	public String selectPassword(String user_id) throws ClassNotFoundException, SQLException{
	
		String password = "";
		
		String sql = "SELECT password FROM user WHERE user_id = ?";
		
		try (Connection con = ConnectionManager.getConnection();
				Statement stmt = con.createStatement();
				PreparedStatement pstmt = con.prepareStatement(sql)) {
			
			pstmt.setString(1, user_id);
			
			ResultSet res = pstmt.executeQuery();
			
			while (res.next()) {
				password = res.getString("password");
			}
		
		}
		
		return password;
	}
	
	public int deleteProfile(String user_id) throws ClassNotFoundException, SQLException{
		
		int count = 0;
		
		String sql = "DELETE FROM user WHERE user_id = ?";
		
		try (Connection con = ConnectionManager.getConnection();
				Statement stmt = con.createStatement();
				PreparedStatement pstmt = con.prepareStatement(sql)) {
			
			pstmt.setString(1, user_id);
			
			count = pstmt.executeUpdate();
			
		}
		
		return count;
	}
	
	public List<UserBean> selectOtherUser(String user_id_temp) throws SQLException, ClassNotFoundException {

		List<UserBean> userList = new ArrayList<UserBean>();

		String sql = "SELECT u.user_id AS user_id, u.nickname AS nickname, b.busho_img AS busho_img FROM user u INNER JOIN busho b ON (u.user_id = b.user_id) WHERE user_id = ?";

		try (Connection con = ConnectionManager.getConnection();
				Statement stmt = con.createStatement();
				PreparedStatement pstmt = con.prepareStatement(sql)) {

			pstmt.setString(1, user_id_temp);

			ResultSet res = pstmt.executeQuery();

			while (res.next()) {
				String user_id = res.getString("user_id");
				String nickname = res.getString("nickname");
				String busho_img = res.getString("busho_img");

				UserBean user = new UserBean();
				user.setUserID(user_id);
				user.setNickname(nickname);
				user.setBushoImg(busho_img);

				userList.add(user);
			}

		}

		return userList;
	}
	
	public List<UserBean> searchUser(String keyword) throws SQLException, ClassNotFoundException {
		List<UserBean> userList = new ArrayList<UserBean>();
		
		String sql = "SELECT b.busho_img AS busho_img, u.nickname AS nickname, u.user_id AS user_id, b.busho_name AS busho_name FROM user u LEFT OUTER JOIN busho b ON (u.busho_id = b.busho_id) WHERE u.user_id LIKE ? OR u.nickname LIKE ? OR b.busho_name LIKE ?";

		try (Connection con = ConnectionManager.getConnection();
				Statement stmt = con.createStatement();
				PreparedStatement pstmt = con.prepareStatement(sql)) {
			
			pstmt.setString(1, "%" + keyword + "%");
			pstmt.setString(2, "%" + keyword + "%");
			pstmt.setString(3, "%" + keyword + "%");
			
			ResultSet res = pstmt.executeQuery();
			
			
			while (res.next()) {
				String busho_img = res.getString("busho_img");
				String nickname = res.getString("nickname");
				String user_id = res.getString("user_id");
				String busho_name = res.getString("busho_name");							

				UserBean user = new UserBean();
				user.setBushoImg(busho_img);
				user.setUserID(user_id);
				user.setNickname(nickname);
				user.setBushoName(busho_name);

				userList.add(user);
			}
			
		}
		
		return userList;
	}
	
	public List<UserBean> searchUserSort(String keyword, String sort, String order) throws SQLException, ClassNotFoundException {
		List<UserBean> userList = new ArrayList<UserBean>();
		
		String sql = "SELECT  b.busho_img AS busho_img, u.nickname AS nickname, u.user_id AS user_id, b.busho_name AS busho_name FROM user u LEFT OUTER JOIN busho b ON (u.busho_id = b.busho_id) WHERE u.user_id LIKE ? OR u.nickname LIKE ? OR b.busho_name LIKE ? ORDER BY " + sort + " " + order;

		try (Connection con = ConnectionManager.getConnection();
				Statement stmt = con.createStatement();
				PreparedStatement pstmt = con.prepareStatement(sql)) {
			
			pstmt.setString(1, "%" + keyword + "%");
			pstmt.setString(2, "%" + keyword + "%");
			pstmt.setString(3, "%" + keyword + "%");
			
			ResultSet res = pstmt.executeQuery();
			
			
			while (res.next()) {
				String busho_img = res.getString("busho_img");
				String nickname = res.getString("nickname");
				String user_id = res.getString("user_id");
				String busho_name = res.getString("busho_name");							

				UserBean user = new UserBean();
				user.setBushoImg(busho_img);
				user.setUserID(user_id);
				user.setNickname(nickname);
				user.setBushoName(busho_name);

				userList.add(user);
			}
			
		}
		
		return userList;
	}
	
	//ProfileSendServletのため
	public List<UserBean> selectProfileSend(String busho_img,String nickname,String user_id,String myself,int gender,Date birth_date,String busho_id,String area) throws ClassNotFoundException, SQLException{
		
		List<UserBean> selectProfileSendList = new ArrayList<UserBean>();
		
		String sql = "SELECT user_id,nickname,myself,gender,busho_img,birth_date,busho_id,area FROM user";
		
		try (Connection con = ConnectionManager.getConnection();
				Statement stmt = con.createStatement();
				PreparedStatement pstmt = con.prepareStatement(sql)) {
				
				
			pstmt.setString(1, user_id);
			pstmt.setString(2, nickname);
			pstmt.setString(3, myself);
			pstmt.setInt(4, gender);
			pstmt.setString(5, busho_img);
			pstmt.setDate(6, birth_date);
			pstmt.setString(7, busho_id);
			pstmt.setString(8, area);
			
			ResultSet res = pstmt.executeQuery();

			// 結果の操作
			while (res.next()) {
				user_id = res.getString("user_id");
				nickname = res.getString("nickname");
				myself = res.getString("myself");
				gender = res.getInt("gender");
				busho_id = res.getString("busho_id");
				busho_img = res.getString("busho_img");
				birth_date = res.getDate("birth_date");
				area = res.getString("area");
				
				UserBean user = new UserBean();
				user.setUserID(user_id);
				user.setNickname(nickname);
				user.setMyself(myself);
				user.setGender(gender);
				user.setBushoID(busho_id);
				user.setBushoImg(busho_img);
				user.setBirthDate(birth_date);
				user.setArea(area);
				
				selectProfileSendList.add(user);
			}
		}
		
		return selectProfileSendList;
	}

}