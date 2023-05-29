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
import model.entity.PeriodBean;

public class BushoDAO{
	
	public List<BushoBean> selectBusho() throws ClassNotFoundException, SQLException{

		List<BushoBean> bushoList=new ArrayList<BushoBean>();

		String sql="SELECT b.busho_name AS busho_name, p.period_name AS period_name, b.busho_img AS busho_img, b.birth_date AS birth_date FROM busho b INNER JOIN period p ON(b.period_id = p.period_id)";

		//データベースへの接続の取得、PreparedStatementの取得
		try(Connection con = ConnectionManager.getConnection();
				Statement stmt = con.createStatement();
				PreparedStatement pstmt = con.prepareStatement(sql)) {


			//SQLステートメントの実行!
			ResultSet res=pstmt.executeQuery();

			//結果の操作
			while(res.next()) {
				String busho_name=res.getString("busho_name");
				String busho_img=res.getString("busho_img");
				String period_name =res.getString("period_name");
				Date birth_date = res.getDate("birth_date");

				BushoBean busho=new BushoBean();
				busho.setBushoName(busho_name);
				busho.setBushoImg(busho_img);
				busho.setPeriodName(period_name);
				busho.setBirthDate(birth_date);

				bushoList.add(busho);
			}

		}
		return bushoList;
	}
	public List<BushoBean> selectBushoAll() throws ClassNotFoundException, SQLException{

		List<BushoBean> bushoList=new ArrayList<BushoBean>();

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

				bushoList.add(busho);
			}

		}
		return bushoList;
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

	public int changeBusho(String busho_id, String busho_name, String period_id, String commentary, String birth_date, String busho_img)
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
			pstmt.setString(4, birth_date);
			pstmt.setString(5, busho_img);
			pstmt.setString(6, busho_id);
			
			//SQLステートメントの実行
			count=pstmt.executeUpdate();

		}
		return count;
	}
	
	public List<BushoBean> selectBushoName(String busho_id) throws ClassNotFoundException, SQLException{
		
		List<BushoBean> bushoList=new ArrayList<BushoBean>();
		
		String sql = "SELECT busho_name FROM busho WHERE busho_id = ?";
		
		//データベースへの値の設定、PreparedStatementの取得
		try(Connection con=ConnectionManager.getConnection();
				PreparedStatement pstmt=con.prepareStatement(sql)){

			//プレースホルダへの値の設定
			pstmt.setString(1, busho_id);

			//SQlステートメントの実行
			ResultSet res = pstmt.executeQuery();
			
			while(res.next()) {
				String busho_name = res.getString("busho_name");

				BushoBean busho=new BushoBean();
				busho.setBushoImg(busho_name);

				bushoList.add(busho);
			}
	
		}
		
		return bushoList;
	}
	
	public List<BushoBean> selectBushoImage(String busho_id) throws ClassNotFoundException, SQLException{
		
		List<BushoBean> bushoList=new ArrayList<BushoBean>();
		
		String sql = "SELECT busho_img FROM busho WHERE busho_id = ?";
		
		//データベースへの値の設定、PreparedStatementの取得
		try(Connection con=ConnectionManager.getConnection();
				PreparedStatement pstmt=con.prepareStatement(sql)){

			//プレースホルダへの値の設定
			pstmt.setString(1, busho_id);

			//SQlステートメントの実行
			ResultSet res = pstmt.executeQuery();
			
			while(res.next()) {
				String busho_img=res.getString("busho_img");

				BushoBean busho=new BushoBean();
				busho.setBushoImg(busho_img);

				bushoList.add(busho);
			}
	
		}
		
		return bushoList;
	}
	
	public List<PeriodBean> selectPeriod(String period_id) throws ClassNotFoundException, SQLException{
		
		List<PeriodBean> periodList=new ArrayList<PeriodBean>();
		
		String sql = "SELECT period_name FROM period WHERE period_id = ?";
		
		//データベースへの値の設定、PreparedStatementの取得
		try(Connection con=ConnectionManager.getConnection();
				PreparedStatement pstmt=con.prepareStatement(sql)){

			//プレースホルダへの値の設定
			pstmt.setString(1, period_id);

			//SQlステートメントの実行
			ResultSet res = pstmt.executeQuery();
			
			while(res.next()) {
				String period_name = res.getString("period_name");

				PeriodBean period = new PeriodBean();
				period.setPeriodName(period_name);

				periodList.add(period);
			}
	
		}
		
		return periodList;
	}
	
	public List<BushoBean> selectBushoNameAll() throws ClassNotFoundException, SQLException{
		
		List<BushoBean> bushoList=new ArrayList<BushoBean>();
		
		String sql = "SELECT busho_id,busho_name FROM busho";
		
		//データベースへの値の設定、PreparedStatementの取得
		try(Connection con=ConnectionManager.getConnection();
			PreparedStatement pstmt=con.prepareStatement(sql)){
			
			//SQlステートメントの実行
			ResultSet res = pstmt.executeQuery();
					
			//結果の操作
			while(res.next()) {
				String busho_id=res.getString("busho_id");
				String busho_name=res.getString("busho_name");
				
				BushoBean busho=new BushoBean();
				busho.setBushoID(busho_id);
				busho.setBushoName(busho_name);

				bushoList.add(busho);
			}
	
		}
		
		return bushoList;
	}
}
