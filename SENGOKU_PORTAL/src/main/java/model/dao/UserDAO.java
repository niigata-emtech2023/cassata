package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import model.entity.UserBean;

public class UserDAO{
	
	public List<UserBean> selectProfile(String user_id_temp) throws ClassNotFoundException, SQLException{
		
		List<UserBean> profileList = new ArrayList<UserBean>();
		
		String sql = "SELECT u.user_id AS user_id, u.password AS password, u.nickname AS nickname, u.myself AS myself, u.gender AS gender, u.busho_id AS busho_id, b.busho_name AS busho_name, u.birth_date AS birth_date, u.area AS area FROM user u INNER JOIN busho b ON (u.busho_id = b.busho_id) WHERE user_id = ?";
		
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
				user.setBirthDate(birth_date);
				user.setArea(area);

				profileList.add(user);
			}
		}
		
		return profileList;
		
	}
	
	public int changeProfile(String user_id_temp) throws ClassNotFoundException, SQLException{
		
		int count = 0;
		
		String sql = "UPDATE user SET ";
		
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
				user.setBirthDate(birth_date);
				user.setArea(area);

				profileList.add(user);
			}
		}
		
		return profileList;
		
	}
	
	
	

}