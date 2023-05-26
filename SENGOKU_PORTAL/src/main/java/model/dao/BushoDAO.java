package model.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.entity.BushoBean;

public class BushoDAO{

	public List<BushoBean> selectBusho() throws ClassNotFoundException, SQLException{

		List<BushoBean> BushoList=new ArrayList<BushoBean>();

		String sql="SELECT * FROM busho";

		//データベースへの接続の取得、PreparedStatementの取得
		try(Connection con = ConnectionManager.getConnection();
				Statement stmt = con.createStatement();
				PreparedStatement pstmt = con.prepareStatement(sql)) {


			//SQLステートメントの実行
			ResultSet res=pstmt.executeQuery();

			//結果の操作
			while(res.next()) {
				String busho_id=res.getString("busho_id");
				String busho_name=res.getString("busho_name");
				String period_id=res.getString("period_id");
				String commentary=res.getString("commentary");
				Date birth_date=res.getDate("birth_date");
				String busho_img=res.getString("busho_img");

				BushoBean busho=new BushoBean();
				busho.setBushoID(busho_id);
				busho.setBushoName(busho_name);
				busho.setPeriodID(period_id);
				busho.setCommentary(commentary);
				busho.setBirthDate(birth_date);
				busho.setBushoImg(busho_img);

				BushoList.add(busho);
			}

		}
		return BushoList;
	}

	public int deleteBusho(String busho_id) 
			throws ClassNotFoundException, SQLException{

		int count = 0;

		String sql="DELETE FROM busho WHERE busho_id=?";

		//データベースへの値の設定、PreparedStatementの取得
		try(Connection con=ConnectionManager.getConnection();
				PreparedStatement pstmt=con.prepareStatement(sql)){

			//プレースホルダへの値の設定
			pstmt.setString(1, busho_id);

			//SQlステートメントの実行
			count = pstmt.executeUpdate();

			return count;
		}

	}

	public int changeBusho(String busho_id, String busho_name, String period_id, String commentary, Date birth_date, String busho_img)
			throws ClassNotFoundException, SQLException{

		int count = 0;

		String sql="UPDATE busho SET busho_name=?,period_id=?,commentery=?,birth_date=?,busho_img=? WHERE busho_id = ?";

		//データベースへの値の設定、PreparedStatementの取得
		try(Connection con=ConnectionManager.getConnection();
				PreparedStatement pstmt=con.prepareStatement(sql)){
		
			//プレースホルダへの値の設定
			pstmt.setString(1, busho_name);
			pstmt.setString(2, period_id);
			pstmt.setString(3, commentary);
			pstmt.setDate(4, birth_date);
			pstmt.setString(5, busho_img);
			pstmt.setString(6, busho_id);
			
			//SQLステートメントの実行
			count=pstmt.executeUpdate();

		}
		return count;


	}
}


