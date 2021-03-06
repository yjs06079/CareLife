package com.care.util;

import lombok.Getter;

public class PageNation {

	@Getter
	private int currPage;
	private int totalCount;
	private int pageSize;
	private int blockSize;
	@Getter
	private int startRow;
	@Getter
	private int endRow;
	@Getter
	private int startBlock;
	@Getter
	private int endBlock;
	@Getter
	private boolean next;
	@Getter
	private boolean prev;
	
	public PageNation(int currPage, int totalCount, int pageSize, int blockSize) {
		// TODO Auto-generated constructor stub
		this.currPage = currPage;
		this.totalCount = totalCount;
		this.pageSize = pageSize;
		this.blockSize = blockSize;
		
		calRow();
		calBlock();
	}
	
	private void calRow() {
		startRow = (currPage-1) * pageSize;
	}
	
	private void calBlock() {
		startBlock = (((currPage-1) / blockSize) * blockSize) + 1;
		endBlock = startBlock + blockSize - 1;
		
		int totalPage = (int)Math.ceil(totalCount/(float)pageSize);
		
		if(endBlock > totalPage)
			endBlock = totalPage;
		
		prev = (startBlock == 1)? false:true;
		next = (endBlock < totalPage)? true:false;
	}
	
}

