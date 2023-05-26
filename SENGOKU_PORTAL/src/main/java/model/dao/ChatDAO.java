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

public class ChatDAO {

	public List<ChatBean> selectChat()
			throws ClassNotFoundException, SQLException{

		List<ChatBean> chatList=new ArrayList<ChatBean>();

		//データベースへの接続の取得、Statementの取得、SQLステートメントの実行
		try(Connection con=ConnectionManager.getConnection();
				Statement stmt=con.createStatement();
				ResultSet res=stmt.executeQuery("SELECT * FROM chat")){

			//結果の操作
			while(res.next()) {
				int chat_id=res.getInt("chat_id");
				String user_id=res.getString("user_id");
				String message=res.getString("message");
				Date created_at=res.getDate("created_at");

				ChatBean chat=new ChatBean();
				chat.setChatID(chat_id);
				chat.setUserID(user_id);
				chat.setMessage(message);
				chat.setCreatedAt(created_at);
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
