package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import model.entity.ChatBean;
import model.entity.UserBean;

public class TopPageDAO{
	
	public List<UserBean> selectRanking() throws SQLException, ClassNotFoundException{
		
		/**
		 * ランキングを取得する
		 */
		
		List<UserBean> rankingList = new ArrayList<UserBean>();
		
		String sql = "SELECT b.busho_name AS busho_name, COUNT(*) AS count FROM user u INNER JOIN busho b ON (u.busho_id = b.busho_id) GROUP BY b.busho_name ORDER BY COUNT(*) DESC LIMIT 3;";

		// データベースへの接続の取得、Statementの取得、SQLステートメントの実行
		try (Connection con = ConnectionManager.getConnection();
				Statement stmt = con.createStatement();
				PreparedStatement pstmt = con.prepareStatement(sql)) {
			
			ResultSet res = pstmt.executeQuery();

			// 結果の操作
			while (res.next()) {
				String busho_name = res.getString("busho_name");
				int count = res.getInt("count");

				UserBean user = new UserBean();
				user.setBushoName(busho_name);
				user.setCount(count);

				rankingList.add(user);
			}
		}
		return rankingList;
		
	}
	
	public List<ChatBean> select10Chat() throws SQLException, ClassNotFoundException{
		
		/**
		 * チャットの最新10件を表示する
		 */
		
		List<ChatBean> Chat10List = new ArrayList<ChatBean>();

		String sql = "SELECT u.nickname AS nickname, c.chat_id AS chat_id, c.user_id AS user_id, c.message AS message, c.created_at AS created_at, b.busho_img AS busho_img FROM chat c LEFT OUTER JOIN user u ON (c.user_id = u.user_id) LEFT OUTER JOIN busho b ON (u.busho_id = b.busho_id) ORDER BY created_at DESC LIMIT 10";
		
		try (Connection con = ConnectionManager.getConnection();
				Statement stmt = con.createStatement();
				PreparedStatement pstmt = con.prepareStatement(sql)) {
			
			ResultSet res = pstmt.executeQuery();

			// 結果の操作
			while (res.next()) {
				String nickname = res.getString("nickname");
				int chat_id=res.getInt("chat_id");
				String user_id=res.getString("user_id");
				String message=res.getString("message");
				Timestamp created_at=res.getTimestamp("created_at");
				String busho_img = res.getString("busho_img");

				ChatBean chat=new ChatBean();
				chat.setNickname(nickname);
				chat.setChatID(chat_id);
				chat.setUserID(user_id);
				chat.setMessage(message);
				chat.setCreatedAt(created_at);
				chat.setBushoImg(busho_img);

				Chat10List.add(chat);
			}
		}
		return Chat10List;
	}
}