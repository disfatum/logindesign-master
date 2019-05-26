package com.core.table;

public class ThemeFull {
	private int id;
	private String name;
    private double[] indicators = new double[12];
    private String [] month =   {"Январь",
                                "Февраль",
                                "Март",
                                "Апрель",
                                "Май",
                                "Июнь",
                                "Июль",
                                "Август",
                                "Сентябрь",
                                "Октбярь",
                                "Ноябрь", 
                                "Декабрь"};
    private int year;
	public ThemeFull (int id, String name, double[] indicators, int year) {
		this.id = id;
		this.name = name;
		this.indicators = indicators;
		this.year = year;
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

	public double[] getIndicators() {
		return indicators;
	}

	public void setIndicators(double[] indicators) {
		this.indicators = indicators;
	}

	public String [] getMonth() {
		return month;
	}

	public void setMonth(String [] month) {
		this.month = month;
	}

	public int getYear() {
		return year;
	}

	public void setYear(int year) {
		this.year = year;
	}
	
	
}
