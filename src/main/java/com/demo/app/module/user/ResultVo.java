package com.demo.app.module.user;

public class ResultVo {
	
	private String code;
	private String msg;
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	
	public static ResultVo success() {
		ResultVo vo=new ResultVo();
		vo.setCode("0");
		vo.setMsg("成功");
		return vo;
	}
	public static ResultVo msg(String code,String msg) {
		ResultVo vo=new ResultVo();
		vo.setCode(code);
		vo.setMsg(msg);
		return vo;
	}

}
