package com.core.table;

import java.io.Serializable;

import javax.annotation.PostConstruct;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;

import org.primefaces.model.chart.LineChartModel;

import com.core.book.TreeBean;

@ManagedBean
@ViewScoped
public class LineChartBean implements Serializable{
    /**
	 * 
	 */
	private static final long serialVersionUID = 1826700917969821415L;
	private LineChartModel lineModel;
	private String filename;
    @PostConstruct
    public void init() {
    	filename = new String();
        lineModel = new LineChartModel();
        lineModel = PickListView.lineModel;
        setFilename(TreeBean.Select);
    }

    public LineChartModel getLineModel() {
        return lineModel;
    }

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}
}
