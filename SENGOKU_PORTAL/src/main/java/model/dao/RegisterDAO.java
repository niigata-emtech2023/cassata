package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

public class RegisterDAO {

	public int register(String  user_id,String password,String nickname) 
			throws ClassNotFoundException, SQLException{

		String sql="INSERT INTO user(user_id,password,nickname) values(?,?,?)";

		int count = 0;

		//データベースへの値の設定、PreparedStatementの取得
		try(Connection con=ConnectionManager.getConnection();
				Statement stmt = con.createStatement();
				PreparedStatement pstmt=con.prepareStatement(sql)){

			//プレースホルダへの値の設定
			pstmt.setString(1, user_id);
			pstmt.setString(2, password);
			pstmt.setString(3, nickname);

			//SQlステートメントの実行
			count = pstmt.executeUpdate();

			return count;
		}
	}
	
	public int bushoRegister(String  busho_id,String busho_name_img,String busho_name,String period_id,String birth_date,String commentary) 
			throws ClassNotFoundException, SQLException{

		String sql="INSERT INTO busho values(?,?,?,?,?,?)";

		int count = 0;

		//データベースへの値の設定、PreparedStatementの取得
		try(Connection con=ConnectionManager.getConnection();
				Statement stmt = con.createStatement();
				PreparedStatement pstmt=con.prepareStatement(sql)){

			//プレースホルダへの値の設定
			pstmt.setString(1, busho_id);
			pstmt.setString(2, busho_name);
			pstmt.setString(3, period_id);
			pstmt.setString(4, commentary);
			pstmt.setString(5, birth_date);
			pstmt.setString(6, busho_name_img);

			//SQlステートメントの実行
			count = pstmt.executeUpdate();

			return count;
		}
	}
}
