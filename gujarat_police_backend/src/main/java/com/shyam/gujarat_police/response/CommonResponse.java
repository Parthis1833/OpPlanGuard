package com.shyam.gujarat_police.response;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@JsonIgnoreProperties(ignoreUnknown = true)
public class CommonResponse {

	private int error = 0;
	private String message = "Success";

	private boolean web;

	public int getError() {
		return error;
	}

	public void setError(int error) {
		this.error = error;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public boolean isWeb() {
		return web;
	}

	public void setWeb(boolean web) {
		this.web = web;
	}

}
