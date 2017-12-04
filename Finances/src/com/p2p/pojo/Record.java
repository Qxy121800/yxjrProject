package com.p2p.pojo;

import java.io.Serializable;

import com.baomidou.mybatisplus.annotations.TableField;
/**
 * 管理员操作记录表
 * 2017-11-14
 * 操作人:宋泰伟
 * */
public class Record implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@TableField("rd_id")
	private Integer rdid; //主键

	@TableField("rd_name")
	private String rdname; //操作名称
	
	@TableField("re_id")
	private Integer reid; //操作员工id
	
	@TableField("rd_status")
	private String rdstatus; //成功状态
	
	@TableField("rd_time")
	private String rdtime; //操作时间
	
	@TableField("rd_remark")
	private String rdremark; //备注

	public Record() {
	}

	public Record(Integer rdid, String rdname, Integer reid, String rdstatus, String rdtime, String rdremark) {
		super();
		this.rdid = rdid;
		this.rdname = rdname;
		this.reid = reid;
		this.rdstatus = rdstatus;
		this.rdtime = rdtime;
		this.rdremark = rdremark;
	}

	public Integer getRdid() {
		return rdid;
	}

	public void setRdid(Integer rdid) {
		this.rdid = rdid;
	}

	public String getRdname() {
		return rdname;
	}

	public void setRdname(String rdname) {
		this.rdname = rdname;
	}

	public Integer getReid() {
		return reid;
	}

	public void setReid(Integer reid) {
		this.reid = reid;
	}

	public String getRdstatus() {
		return rdstatus;
	}

	public void setRdstatus(String rdstatus) {
		this.rdstatus = rdstatus;
	}

	public String getRdtime() {
		return rdtime;
	}

	public void setRdtime(String rdtime) {
		this.rdtime = rdtime;
	}

	public String getRdremark() {
		return rdremark;
	}

	public void setRdremark(String rdremark) {
		this.rdremark = rdremark;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Record [rdid=" + rdid + ", rdname=" + rdname + ", reid=" + reid + ", rdstatus=" + rdstatus + ", rdtime="
				+ rdtime + ", rdremark=" + rdremark + "]";
	}

}
