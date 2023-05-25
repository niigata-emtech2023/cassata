package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.entity.UserBean;

public class TopPageDAO{
	
	public List<UserBean> selectRanking() throws SQLException, ClassNotFoundException{
		
		List<UserBean> rankingList = new ArrayList<UserBean>();
		
		String sql = "SELECT b.busho_name, COUNT(*) AS count FROM user u INNER JOIN busho b ON (u.busho_id = b.busho_id) GROUP BY b.busho_name ORDER BY COUNT(*) DESC";

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
}