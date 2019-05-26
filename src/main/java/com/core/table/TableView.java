package com.core.table;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;

@ManagedBean (name = "kundenBean")
@ViewScoped
public class TableView implements Serializable {

	private List<ThemeTable> table;
	/**
	 * 
	 */
	private static final long serialVersionUID = -1061279157070894426L;
	
	@PostConstruct
    public void init() {
		table = new ArrayList<ThemeTable>();
		table = PickListView.Table;
    }
	
	public List<ThemeTable> getTable() {
		return table;
	}
	public void setTable(List<ThemeTable> table1) {
		table = table1;
	}

}
