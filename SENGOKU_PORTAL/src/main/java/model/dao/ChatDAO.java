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

public class ChatDAO {

	public List<ChatBean> selectChat() throws ClassNotFoundException, SQLException{

		List<ChatBean> chatList = new ArrayList<ChatBean>();

		//データベースへの接続の取得、Statementの取得、SQLステートメントの実行
		try(Connection con=ConnectionManager.getConnection();
				Statement stmt=con.createStatement();
				ResultSet res=stmt.executeQuery("SELECT u.nickname AS nickname, c.chat_id AS chat_id, c.user_id AS user_id, c.message AS message, c.created_at AS created_at, b.busho_img AS busho_img FROM chat c LEFT OUTER JOIN user u ON (c.user_id = u.user_id) LEFT OUTER JOIN busho b ON (u.busho_id = b.busho_id) ORDER BY created_at DESC")){

			//結果の操作
			while(res.next()) {
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
				
				chatList.add(chat);
			}
		}
		return chatList;

	}

	public int sendChat(String user_id,String message) 
			throws ClassNotFoundException, SQLException{

		String sql="INSERT INTO chat(user_id,message) values(?,?)";

		int count = 0;

		//データベースへの値の設定
		try(Connection con=ConnectionManager.getConnection();
				PreparedStatement pstmt=con.prepareStatement(sql)){

			//プレースホルダへの値の設定
			pstmt.setString(1, user_id);
			pstmt.setString(2, message);

			//SQlステートメントの実行
			count = pstmt.executeUpdate();			
		}

		return count;
	}

}
