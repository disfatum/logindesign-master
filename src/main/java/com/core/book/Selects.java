package com.core.book;

public class Selects {

	private String filename;
	private String filepath;
	
	public Selects(String filename,String filepath) {
		this.filename = filename;
		this.filepath = filepath;
	}

	public String getFilepath() {
		return filepath;
	}

	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}
	
}
