package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import model.entity.ChatBean;
import model.entity.UserBean;

public class TopPageDAO{
	
	public List<UserBean> selectRanking() throws SQLException, ClassNotFoundException{
		
		List<UserBean> rankingList = new ArrayList<UserBean>();
		
		String sql = "SELECT b.busho_name AS busho_name, COUNT(*) AS count FROM user u INNER JOIN busho b ON (u.busho_id = b.busho_id) GROUP BY b.busho_name ORDER BY COUNT(*) DESC";

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
		
		List<ChatBean> Chat10List = new ArrayList<ChatBean>();

		String sql = "SELECT c.chat_id AS chat_id, u.nickname AS nickname, c.created_at AS created_at, c.message AS message FROM chat c INNER JOIN user u ON (c.user_id = u.user_id) LIMIT 10 ORDER BY c.created_at DESC";
		
		try (Connection con = ConnectionManager.getConnection();
				Statement stmt = con.createStatement();
				PreparedStatement pstmt = con.prepareStatement(sql)) {
			
			ResultSet res = pstmt.executeQuery();

			// 結果の操作
			while (res.next()) {
				int chat_id = res.getInt("chat_id");
				String nickname = res.getString("nickname");
				Date created_at = res.getDate("created_at");
				String message = res.getString("message");
				
				ChatBean chat = new ChatBean();
				chat.setChatID(chat_id);
				chat.setNickname(nickname);
				chat.setCreatedAt(created_at);
				chat.setMessage(message);

				Chat10List.add(chat);
			}
		}
		return Chat10List;
	}
}