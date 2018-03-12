package com.gbj.utils;

/**
 * Created by guobj on 2018/3/9.
 */
public class JacksonData {

	private static final String OK = "ok";
	private static final String ERROR = "error";

	private Meta meta;     // 元数据
	private Object data;   // 响应内容

	public JacksonData success() {
		this.meta = new Meta(true, OK);
		return this;
	}

	public JacksonData success(Object data) {
		this.meta = new Meta(true, OK);
		this.data = data;
		return this;
	}

	public JacksonData failure() {
		this.meta = new Meta(false, ERROR);
		return this;
	}

	public JacksonData failure(String message) {
		this.meta = new Meta(false, message);
		return this;
	}

	public Meta getMeta() {
		return meta;
	}

	public Object getData() {
		return data;
	}

	/**
	 * Title: 请求元数据
	 * @author guobj
	 * @created 2018/3/9
	 */
	public class Meta {

		private boolean success;
		private String message;

		public Meta(boolean success) {
			this.success = success;
		}

		public Meta(boolean success, String message) {
			this.success = success;
			this.message = message;
		}

		public boolean isSuccess() {
			return success;
		}

		public String getMessage() {
			return message;
		}
	}
}
