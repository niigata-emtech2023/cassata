package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.entity.PeriodBean;

public class PeriodDAO {
	
	public List<PeriodBean> selectPeriodAll() throws ClassNotFoundException, SQLException{

		List<PeriodBean> periodList=new ArrayList<PeriodBean>();

		String sql="SELECT period_name FROM period";

		//データベースへの接続の取得、PreparedStatementの取得
		try(Connection con = ConnectionManager.getConnection();
				Statement stmt = con.createStatement();
				PreparedStatement pstmt = con.prepareStatement(sql)) {


			//SQLステートメントの実行!
			ResultSet res=pstmt.executeQuery();

			//結果の操作
			while(res.next()) {
				String period_name=res.getString("period_name");

				PeriodBean period=new PeriodBean();
				period.setPeriodName(period_name);

				periodList.add(period);
			}

		}
		return periodList;
	}
	
	public String selectPeriodID(String period_name) throws ClassNotFoundException, SQLException{
		
		String period_id = "";
		
		String sql="SELECT period_id FROM period WHERE period_name = ?";
		
		//データベースへの接続の取得、PreparedStatementの取得
		try(Connection con = ConnectionManager.getConnection();
				Statement stmt = con.createStatement();
				PreparedStatement pstmt = con.prepareStatement(sql)) {
			
			pstmt.setString(1, period_name);

			//SQLステートメントの実行!
			ResultSet res=pstmt.executeQuery();

			//結果の操作
			while(res.next()) {
				period_id = res.getString("period_id");
			}

		}
		return period_id;
	}
	
}
