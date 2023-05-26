package model.entity;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Date;

public class ChatBean implements Serializable{
	
	//チャットID
	private int chat_id;
	
	//ユーザID
	private String user_id;
	
	//日付
	private Timestamp created_at;
	
	//メッセージ
	private String message;
	
	//ニックネーム
	private String nickname;
	
	/**
	 * コンストラクタ
	 */
	public ChatBean() {
		
	}
	
	/**
	 * @return chat_id
	 */
	public int getChatID() {
		return chat_id;
	}

	/**
	 * @param chat_id セットする chat_id
	 */
	public void setChatID(int chat_id) {
		this.chat_id = chat_id;
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
	 * @return created_at
	 */
	public Date getCreatedAt() {
		return created_at;
	}

	/**
	 * @param created_at セットする created_at
	 */
	public void setCreatedAt(Timestamp created_at) {
		this.created_at = created_at;
	}

	/**
	 * @return message
	 */
	public String getMessage() {
		return message;
	}

	/**
	 * @param message セットする message
	 */
	public void setMessage(String message) {
		this.message = message;
	}
	
	//チャットのニックネーム設定
	
	/**
	 * 
	 * @return
	 */
	public String getNickname() {
		return nickname;
	}
	
	/**
	 * 
	 * @param nickname 
	 */
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

}
