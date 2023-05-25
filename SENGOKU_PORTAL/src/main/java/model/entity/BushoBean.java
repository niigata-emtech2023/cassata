package model.entity;

import java.io.Serializable;
import java.util.Date;

public class BushoBean implements Serializable{
	
	//武将ID
	private String busho_id;
	
	//武将名
	private String busho_name;
	
	//時代ID
	private String period_id;
	
	//説明文
	private String commentary;
	
	//生年月日
	private Date birth_date;
	
	//武将画像
	private String busho_img;
	
	/**
	 * コンストラクタ
	 */
	public BushoBean() {
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
	 * @return busho_name
	 */
	public String getBushoName() {
		return busho_name;
	}

	/**
	 * @param busho_name セットする busho_name
	 */
	public void setBushoName(String busho_name) {
		this.busho_name = busho_name;
	}

	/**
	 * @return period_id
	 */
	public String getPeriodID() {
		return period_id;
	}

	/**
	 * @param period_id セットする period_id
	 */
	public void setPeriodID(String period_id) {
		this.period_id = period_id;
	}

	/**
	 * @return commentary
	 */
	public String getCommentary() {
		return commentary;
	}

	/**
	 * @param commentary セットする commentary
	 */
	public void setCommentary(String commentary) {
		this.commentary = commentary;
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
	 * @return busho_img
	 */
	public String getBushoImg() {
		return busho_img;
	}

	/**
	 * @param busho_img セットする busho_img
	 */
	public void setBushoImg(String busho_img) {
		this.busho_img = busho_img;
	}
	
	
	
}
