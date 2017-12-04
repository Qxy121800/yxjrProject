package com.p2p.pojo;

import java.io.Serializable;

import com.baomidou.mybatisplus.annotations.TableField;

/**
 * 发标表
 * 2017年11月14日09:57:20
 * 操作人：朱勇峰
 * 
 * */

public class Fabiao implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@TableField("f_id")
	private Integer fid; //主键
	
	@TableField("f_title")
	private Integer ftitle; //标名
	
	@TableField("u_id")
	private Integer uid; //用户id
	
	@TableField("f_money")
	private double fmoney; //投标金额
	
	@TableField("f_endmoney")
	private double fendmoney; //已投金额
	
	@TableField("f_endtime")
	private String fendtime; //结束时间
	
	@TableField("f_minmoney")
	private double fminmoney; //最小金额
	
	@TableField("f_maxmoney")
	private double fmaxmoney; //最大金额
	
	@TableField("f_Rate")
	private String fRate; //收益率
	
	@TableField("f_image")
	private String fimage; //代表图
	
	@TableField("f_bidstatus")
	private Integer fbidstatus; //发标状态
	
	@TableField("f_status")
	private Integer fstatus;//发布状态
	
	@TableField("f_content")
	private String fcontent;//发布内容

	public Fabiao(Integer fid, Integer ftitle, Integer uid, double fmoney, double fendmoney, String fendtime,
			double fminmoney, double fmaxmoney, String fRate, String fimage, Integer fbidstatus, Integer fstatus,
			String fcontent) {
		super();
		this.fid = fid;
		this.ftitle = ftitle;
		this.uid = uid;
		this.fmoney = fmoney;
		this.fendmoney = fendmoney;
		this.fendtime = fendtime;
		this.fminmoney = fminmoney;
		this.fmaxmoney = fmaxmoney;
		this.fRate = fRate;
		this.fimage = fimage;
		this.fbidstatus = fbidstatus;
		this.fstatus = fstatus;
		this.fcontent = fcontent;
	}

	public Fabiao() {
		super();
	}

	public Integer getFid() {
		return fid;
	}

	public void setFid(Integer fid) {
		this.fid = fid;
	}

	public Integer getFtitle() {
		return ftitle;
	}

	public void setFtitle(Integer ftitle) {
		this.ftitle = ftitle;
	}

	public Integer getUid() {
		return uid;
	}

	public void setUid(Integer uid) {
		this.uid = uid;
	}

	public double getFmoney() {
		return fmoney;
	}

	public void setFmoney(double fmoney) {
		this.fmoney = fmoney;
	}

	public double getFendmoney() {
		return fendmoney;
	}

	public void setFendmoney(double fendmoney) {
		this.fendmoney = fendmoney;
	}

	public String getFendtime() {
		return fendtime;
	}

	public void setFendtime(String fendtime) {
		this.fendtime = fendtime;
	}

	public double getFminmoney() {
		return fminmoney;
	}

	public void setFminmoney(double fminmoney) {
		this.fminmoney = fminmoney;
	}

	public double getFmaxmoney() {
		return fmaxmoney;
	}

	public void setFmaxmoney(double fmaxmoney) {
		this.fmaxmoney = fmaxmoney;
	}

	public String getfRate() {
		return fRate;
	}

	public void setfRate(String fRate) {
		this.fRate = fRate;
	}

	public String getFimage() {
		return fimage;
	}

	public void setFimage(String fimage) {
		this.fimage = fimage;
	}

	public Integer getFbidstatus() {
		return fbidstatus;
	}

	public void setFbidstatus(Integer fbidstatus) {
		this.fbidstatus = fbidstatus;
	}

	public Integer getFstatus() {
		return fstatus;
	}

	public void setFstatus(Integer fstatus) {
		this.fstatus = fstatus;
	}

	public String getFcontent() {
		return fcontent;
	}

	public void setFcontent(String fcontent) {
		this.fcontent = fcontent;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Fabiao [fid=" + fid + ", ftitle=" + ftitle + ", uid=" + uid + ", fmoney=" + fmoney + ", fendmoney="
				+ fendmoney + ", fendtime=" + fendtime + ", fminmoney=" + fminmoney + ", fmaxmoney=" + fmaxmoney
				+ ", fRate=" + fRate + ", fimage=" + fimage + ", fbidstatus=" + fbidstatus + ", fstatus=" + fstatus
				+ ", fcontent=" + fcontent + "]";
	}

	
	
	

}
