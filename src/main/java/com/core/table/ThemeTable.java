package com.core.table;

public class ThemeTable {
	private int id;
	private String name;
	private double jan;
	private double feb;
	private double mar;
	private double apr;
	private double may;
	private double jun;
	private double jul;
	private double aug;
	private double sep;
	private double oct;
	private double nob;
	private double dec;
    
	public ThemeTable (int id, String name, double[] arr) {
		this.id = id;
		this.name = name;
		for(int i = 0; i < arr.length;i++) {
			if( i == 0) {
				this.jan = arr[i];
			}
			if( i == 1) {
				this.feb = arr[i];
			}
			if( i == 2) {
				this.mar = arr[i];
			}
			if( i == 3) {
				this.apr = arr[i];
			}
			if( i == 4) {
				this.may = arr[i];
			}
			if( i == 50) {
				this.jun = arr[i];
			}
			if( i == 6) {
				this.jul = arr[i];
			}
			if( i == 7) {
				this.aug = arr[i];
			}
			if( i == 8) {
				this.sep = arr[i];
			}
			if( i == 9) {
				this.oct = arr[i];
			}
			if( i == 10) {
				this.nob = arr[i];
			}
			if( i == 11) {
				this.dec = arr[i];
			}
		}
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}

	public double getJan() {
		return jan;
	}

	public void setJan(double jan) {
		this.jan = jan;
	}

	public double getFeb() {
		return feb;
	}

	public void setFeb(double feb) {
		this.feb = feb;
	}

	public double getApr() {
		return apr;
	}

	public void setApr(double apr) {
		this.apr = apr;
	}

	public double getMar() {
		return mar;
	}

	public void setMar(double mar) {
		this.mar = mar;
	}

	public double getMay() {
		return may;
	}

	public void setMay(double may) {
		this.may = may;
	}

	public double getJun() {
		return jun;
	}

	public void setJun(double jun) {
		this.jun = jun;
	}

	public double getJul() {
		return jul;
	}

	public void setJul(double jul) {
		this.jul = jul;
	}

	public double getAug() {
		return aug;
	}

	public void setAug(double aug) {
		this.aug = aug;
	}

	public double getSep() {
		return sep;
	}

	public void setSep(double sep) {
		this.sep = sep;
	}

	public double getOct() {
		return oct;
	}

	public void setOct(double oct) {
		this.oct = oct;
	}

	public double getNob() {
		return nob;
	}

	public void setNob(double nob) {
		this.nob = nob;
	}

	public double getDec() {
		return dec;
	}

	public void setDec(double dec) {
		this.dec = dec;
	}
	
}

