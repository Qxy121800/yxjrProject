package com.p2p.pojo;

import java.io.Serializable;

/**
 * 还款服务端字段
 * 
 * @author  lxj
 * */
@SuppressWarnings("serial")
public class RepayService implements Serializable{
	private Integer rid;
	private Integer rsuid;  //用户id
	private Double rmoney;  //还款金额
	private Double rhandmoney;  //额外手续费
	private String rtime;  //还款时间
	private Integer rstate;  //还款状态
	private String rorder;  //订单号
	private String rsuname;
	
	private User user;

	
	public RepayService() {
		super();
	}
	public RepayService(Integer rid, Integer rsuid, Double rmoney, Double rhandmoney, String rtime, Integer rstate, String rorder,
			String rsuname, User user) {
		super();
		this.rid = rid;
		this.rsuid = rsuid;
		this.rmoney = rmoney;
		this.rhandmoney = rhandmoney;
		this.rtime = rtime;
		this.rstate = rstate;
		this.rorder = rorder;
		this.rsuname = rsuname;
		this.user = user;
	}
	
	@Override
	public String toString() {
		return "RepayService [rid=" + rid + ", rsuid=" + rsuid + ", rmoney=" + rmoney + ", rhandmoney=" + rhandmoney
				+ ", rtime=" + rtime + ", rstate=" + rstate + ", rorder=" + rorder + ", rsuname=" + rsuname + ", user="
				+ user + "]";
	}
	public Integer getRid() {
		return rid;
	}
	public void setRid(Integer rid) {
		this.rid = rid;
	}
	public String getRsuname() {
		return rsuname;
	}
	public void setRsuname(String rsuname) {
		this.rsuname = rsuname;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Integer getRsuid() {
		return rsuid;
	}
	public void setRsuid(Integer rsuid) {
		this.rsuid = rsuid;
	}
	public Double getRmoney() {
		return rmoney;
	}
	public void setRmoney(Double rmoney) {
		this.rmoney = rmoney;
	}
	public Double getRhandmoney() {
		return rhandmoney;
	}
	public void setRhandmoney(Double rhandmoney) {
		this.rhandmoney = rhandmoney;
	}
	public String getRtime() {
		return rtime;
	}
	public void setRtime(String rtime) {
		this.rtime = rtime;
	}
	public String getRorder() {
		return rorder;
	}
	public void setRorder(String rorder) {
		this.rorder = rorder;
	}
	public Integer getRstate() {
		return rstate;
	}
	public void setRstate(Integer rstate) {
		this.rstate = rstate;
	}
	
}
