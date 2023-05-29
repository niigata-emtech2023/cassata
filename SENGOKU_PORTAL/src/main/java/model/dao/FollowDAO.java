package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.entity.FollowBean;

public class FollowDAO {
	
	public boolean checkFollow(String user_id_temp, String follow_user_id_temp) throws SQLException, ClassNotFoundException {

		String sql = "SELECT user_id, follow_user_id FROM follow WHERE user_id = ? AND follow_user_id = ?";

		try (Connection con = ConnectionManager.getConnection();
				Statement stmt = con.createStatement();
				PreparedStatement pstmt = con.prepareStatement(sql)) {

			pstmt.setString(1, user_id_temp);
			pstmt.setString(2, follow_user_id_temp);

			ResultSet res = pstmt.executeQuery();

			//結果の操作
			if(res.next()) {
				return true;
			}

		}

		return false;
	}

	public List<FollowBean> selectFollow(String user_id_temp) throws SQLException, ClassNotFoundException {

		List<FollowBean> followList = new ArrayList<FollowBean>();

		String sql = "SELECT f.user_id AS user_id, u.nickname AS nickname, b.busho_img AS busho_img FROM follow f INNER JOIN user u ON (f.user_id = u.user_id) INNER JOIN busho b ON (u.busho_id = b.busho_id) WHERE user_id = ?";

		try (Connection con = ConnectionManager.getConnection();
				Statement stmt = con.createStatement();
				PreparedStatement pstmt = con.prepareStatement(sql)) {

			pstmt.setString(1, user_id_temp);

			ResultSet res = pstmt.executeQuery();

			while (res.next()) {
				String user_id = res.getString("user_id");
				String nickname = res.getString("nickname");
				String busho_img = res.getString("busho_img");

				FollowBean follow = new FollowBean();
				follow.setUserID(user_id);
				follow.setNickname(nickname);
				follow.setBushoImg(busho_img);

				followList.add(follow);
			}

		}

		return followList;
	}

	public List<FollowBean> selectFollower(String user_id_temp) throws SQLException, ClassNotFoundException {

		List<FollowBean> followList = new ArrayList<FollowBean>();

		String sql = "SELECT f.follow_user_id AS user_id, u.nickname AS nickname, b.busho_img AS busho_img FROM follow f INNER JOIN user u ON (f.user_id = u.user_id) INNER JOIN busho b ON (u.busho_id = b.busho_id) WHERE follow_user_id = ?";

		try (Connection con = ConnectionManager.getConnection();
				Statement stmt = con.createStatement();
				PreparedStatement pstmt = con.prepareStatement(sql)) {

			pstmt.setString(1, user_id_temp);

			ResultSet res = pstmt.executeQuery();

			while (res.next()) {
				String follow_user_id = res.getString("follow_user_id");
				String nickname = res.getString("nickname");
				String busho_img = res.getString("busho_img");

				FollowBean follow = new FollowBean();
				follow.setFollowUserID(follow_user_id);
				follow.setNickname(nickname);
				follow.setBushoImg(busho_img);

				followList.add(follow);
			}

		}

		return followList;
	}

	public int follow(String user_id, String follow_user_id) throws SQLException, ClassNotFoundException{
		
		int count = 0;
		
		String sql="INSERT INTO follow(user_id, follow_user_id) VALUES (?,?)";


		//データベースへの値の設定
		try(Connection con=ConnectionManager.getConnection();
				PreparedStatement pstmt=con.prepareStatement(sql)){
		
			//プレースホルダへの値の設定
			pstmt.setString(1, user_id);
			pstmt.setString(2, follow_user_id);
			//SQlステートメントの実行
			count = pstmt.executeUpdate();
				
		}
		
		return count;
	}
	
	public int removeFollow(String user_id, String follow_user_id) throws SQLException, ClassNotFoundException{
		
		int count = 0;
		
		String sql="DELETE FROM follow WHERE user_id = ? AND follow_user_id = ?";


		//データベースへの値の設定
		try(Connection con=ConnectionManager.getConnection();
				PreparedStatement pstmt=con.prepareStatement(sql)){
		
			//プレースホルダへの値の設定
			pstmt.setString(1, user_id);
			pstmt.setString(2, follow_user_id);
			
			//SQlステートメントの実行
			count = pstmt.executeUpdate();
				
		}
		
		return count;
	}
}
			
	