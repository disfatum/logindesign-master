package com.core.tabbed;

import javax.annotation.PostConstruct;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;

import java.io.Serializable;
import java.util.Arrays;
import java.util.List;

@ManagedBean
@ViewScoped
public class TabBean implements Serializable{
    /**
	 * 
	 */
	private static final long serialVersionUID = 1691186587645443923L;
	private List<TabInfo> tabs;

    @PostConstruct
    public void init() {
          tabs = Arrays.asList(new TabInfo("Содержание", "book"),
                  new TabInfo("Таблицы", "tables")
                  );
    }

    public List<TabInfo> getTabs() {
        return tabs;
    }
}
