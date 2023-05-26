package model.entity;

import java.io.Serializable;

public class FollowBean implements Serializable{
	
	//ユーザID
	private String user_id;
	
	//フォローユーザID
	private String follow_user_id;
	
	//ニックネーム
	private String nickname;
	
	//武将画像
	private String busho_img;
	
	/**
	 * コンストラクタ
	 */
	public FollowBean() {
		
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
	 * @return follow_user_id
	 */
	public String getFollowUserID() {
		return follow_user_id;
	}

	/**
	 * @param follow_user_id セットする follow_user_id
	 */
	public void setFollowUserID(String follow_user_id) {
		this.follow_user_id = follow_user_id;
	}
	
	//DAOでの追加
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	
	public String getNickname() {
		return nickname;
	}
	
	public void setBushoImg(String busho_img) {
		this.busho_img = busho_img;
	}
	
	public String getBushoImg() {
		return busho_img;
	}
	

}
