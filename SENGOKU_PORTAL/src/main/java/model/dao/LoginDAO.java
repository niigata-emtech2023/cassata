package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LoginDAO {
	
	public boolean login(String user_id, String password) throws ClassNotFoundException, SQLException{
		
		String sql="SELECT * FROM user WHERE user_id = ? AND password = ?";
		
		//データベースへの接続の取得、PreparedStatementの取得
		try (Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)) {
			
			//プレースホルダへの値の設定
			pstmt.setString(1, user_id);
			pstmt.setString(2, password);
			
			//SQLステートメントの実行
			ResultSet res = pstmt.executeQuery();
			
			//結果の操作
			if(res.next()) {
				return true;
			}
		}
		
		return false;
		
	}
	
	public boolean registerCheck(String user_id) throws ClassNotFoundException, SQLException{
		
		String sql="SELECT * FROM user WHERE user_id = ?";
		
		//データベースへの接続の取得、PreparedStatementの取得
		try (Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)) {
			
			//プレースホルダへの値の設定
			pstmt.setString(1, user_id);
			
			//SQLステートメントの実行
			ResultSet res = pstmt.executeQuery();
			
			//結果の操作
			if(res.next()) {
				return false;
			}
		}
		
		return true;
		
	}
	
}
