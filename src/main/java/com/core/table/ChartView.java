package com.core.table;

import java.io.Serializable;

import javax.annotation.PostConstruct;
import javax.faces.bean.ManagedBean;

import org.primefaces.model.chart.BarChartModel;

@ManagedBean
public class ChartView implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 7484646784781587396L;
	
	private BarChartModel barModel;
	
	@PostConstruct
    public void init() {
		barModel = PickListView.Bar;
	}

	public BarChartModel getBarModel() {
		return barModel;
	}

	public void setBarModel(BarChartModel barModel) {
		this.barModel = barModel;
	}
}
