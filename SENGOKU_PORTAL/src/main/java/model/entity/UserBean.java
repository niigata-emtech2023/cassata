package model.entity;

import java.io.Serializable;
import java.sql.Date;

public class UserBean implements Serializable{
	
	
	//ユーザID
	private String user_id;
	
	//パスワード
	private String password;
	
	//ニックネーム
	private String nickname;
	
	//作成日時
	private Date created_at;
	
	//更新日時
	private Date updated_at;
	
	//権限
	private int authority;
	
	//性別
	private int gender;
	
	//自己紹介
	private String myself;
	
	//武将ID
	private String busho_id;
	
	//生年月日
	private Date birth_date;
	
	//出身地
	private String area;
	
	/*
	 * コンストラクタ
	 */
	public UserBean() {
		
	}

	/**
	 * @return user_id
	 */
	public String getUserID() {
		return user_id;
	}

	/**
	 * @param user_id セットする user_id
	 */
	public void setUserID(String user_id) {
		this.user_id = user_id;
	}

	/**
	 * @return password
	 */
	public String getPassword() {
		return password;
	}

	/**
	 * @param password セットする password
	 */
	public void setPassword(String password) {
		this.password = password;
	}

	/**
	 * @return nickname
	 */
	public String getNickname() {
		return nickname;
	}

	/**
	 * @param nickname セットする nickname
	 */
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	/**
	 * @return created_at
	 */
	public Date getCreatedAt() {
		return created_at;
	}

	/**
	 * @param created_at セットする created_at
	 */
	public void setCreatedAt(Date created_at) {
		this.created_at = created_at;
	}

	/**
	 * @return updated_at
	 */
	public Date getUpdatedAt() {
		return updated_at;
	}

	/**
	 * @param updated_at セットする updated_at
	 */
	public void setUpdatedAt(Date updated_at) {
		this.updated_at = updated_at;
	}

	/**
	 * @return authority
	 */
	public int getAuthority() {
		return authority;
	}

	/**
	 * @param authority セットする authority
	 */
	public void setAuthority(int authority) {
		this.authority = authority;
	}

	/**
	 * @return gender
	 */
	public int getGender() {
		return gender;
	}

	/**
	 * @param gender セットする gender
	 */
	public void setGender(int gender) {
		this.gender = gender;
	}

	/**
	 * @return myself
	 */
	public String getMyself() {
		return myself;
	}

	/**
	 * @param myself セットする myself
	 */
	public void setMyself(String myself) {
		this.myself = myself;
	}

	/**
	 * @return busho_id
	 */
	public String getBushoID() {
		return busho_id;
	}

	/**
	 * @param busho_id セットする busho_id
	 */
	public void setBushoID(String busho_id) {
		this.busho_id = busho_id;
	}

	/**
	 * @return birth_date
	 */
	public Date getBirthDate() {
		return birth_date;
	}

	/**
	 * @param birth_date セットする birth_date
	 */
	public void setBirthDate(Date birth_date) {
		this.birth_date = birth_date;
	}

	/**
	 * @return area
	 */
	public String getArea() {
		return area;
	}

	/**
	 * @param area セットする area
	 */
	public void setArea(String area) {
		this.area = area;
	}
	
	
	

	
	
}