package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class RegisterDAO {

	public int register(String  user_id,String password,String nickname) 
			throws ClassNotFoundException, SQLException{

		String sql="INSERT INTO user(user_id,password,nickname) values(?,?,?)";

		int count = 0;

		//データベースへの値の設定
		try(Connection con=ConnectionManager.getConnection();
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
}
