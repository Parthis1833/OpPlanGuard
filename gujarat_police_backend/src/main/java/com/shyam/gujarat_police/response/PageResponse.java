package com.shyam.gujarat_police.response;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;

@JsonIgnoreProperties(ignoreUnknown = true)
public class PageResponse {

	@JsonProperty("current_page")
	private int currentPage = 0;

	@JsonProperty("total_pages")
	private int totalPages = 0;

	@JsonProperty("total_records")
	private int totalRecords = 0;

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getTotalPages() {
		return totalPages;
	}

	public void setTotalPages(int totalPages) {
		this.totalPages = totalPages;
	}

	public int getTotalRecords() {
		return totalRecords;
	}

	public void setTotalRecords(int totalRecords) {
		this.totalRecords = totalRecords;
	}

	public PageResponse(int currentPage, int totalPages, int totalRecords) {
		super();
		this.currentPage = currentPage;
		this.totalPages = totalPages;
		this.totalRecords = totalRecords;
	}

}
