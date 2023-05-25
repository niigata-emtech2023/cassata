package model.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.entity.UserBean;

public class UserDAO{
	
	public List<UserBean> selectProfile() throws ClassNotFoundException, SQLException{
		
		List<UserBean> profileList = new ArrayList<UserBean>();
		
		String sql = "SELECT * FROM user";
		
		
	}
}