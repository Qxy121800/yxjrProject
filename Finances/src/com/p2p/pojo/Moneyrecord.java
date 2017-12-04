package com.p2p.pojo;

import java.io.Serializable;

import com.baomidou.mybatisplus.annotations.TableField;

/**
 * 资金记录表
 * 2017年11月14日16:55:52
 * 操作人：朱勇峰
 * */

public class Moneyrecord implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@TableField("mr_id")
	private Integer mrid; //主键
	
	@TableField("u_id")
	private Integer uid; //用户id
	
	@TableField("mr_detail")
	private String mrdetail; //资金明细
	
	@TableField("mr_wastemoney")
	private double mrwastemoney; //消费金额
	
	@TableField("mr_wasttime")
	private String mrwasttime; //消费时间

	public Moneyrecord(Integer mrid, Integer uid, String mrdetail, double mrwastemoney, String mrwasttime) {
		super();
		this.mrid = mrid;
		this.uid = uid;
		this.mrdetail = mrdetail;
		this.mrwastemoney = mrwastemoney;
		this.mrwasttime = mrwasttime;
	}

	public Moneyrecord() {
		super();
	}

	public Integer getMrid() {
		return mrid;
	}

	public void setMrid(Integer mrid) {
		this.mrid = mrid;
	}

	public Integer getUid() {
		return uid;
	}

	public void setUid(Integer uid) {
		this.uid = uid;
	}

	public String getMrdetail() {
		return mrdetail;
	}

	public void setMrdetail(String mrdetail) {
		this.mrdetail = mrdetail;
	}

	public double getMrwastemoney() {
		return mrwastemoney;
	}

	public void setMrwastemoney(double mrwastemoney) {
		this.mrwastemoney = mrwastemoney;
	}

	public String getMrwasttime() {
		return mrwasttime;
	}

	public void setMrwasttime(String mrwasttime) {
		this.mrwasttime = mrwasttime;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Moneyrecord [mrid=" + mrid + ", uid=" + uid + ", mrdetail=" + mrdetail + ", mrwastemoney="
				+ mrwastemoney + ", mrwasttime=" + mrwasttime + "]";
	}
	
	
	
}
