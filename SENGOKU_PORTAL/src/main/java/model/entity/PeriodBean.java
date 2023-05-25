package model.entity;

import java.io.Serializable;

public class PeriodBean implements Serializable{
	
	//時代ID
	private String period_id;
	
	//時代名
	private String period_name;
	
	//開始年
	private int start_period;
	
	//終了年
	private int end_period;
	
	/**
	 * コンストラクタ
	 */
	public PeriodBean(){
		
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
	 * @return period_name
	 */
	public String getPeriodName() {
		return period_name;
	}

	/**
	 * @param period_name セットする period_name
	 */
	public void setPeriodName(String period_name) {
		this.period_name = period_name;
	}

	/**
	 * @return start_period
	 */
	public int getStartPeriod() {
		return start_period;
	}

	/**
	 * @param start_period セットする start_period
	 */
	public void setStartPeriod(int start_period) {
		this.start_period = start_period;
	}

	/**
	 * @return end_period
	 */
	public int getEndPeriod() {
		return end_period;
	}

	/**
	 * @param end_period セットする end_period
	 */
	public void setEndPeriod(int end_period) {
		this.end_period = end_period;
	}

}
