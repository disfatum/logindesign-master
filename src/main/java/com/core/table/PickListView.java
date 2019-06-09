package com.core.table;

import org.primefaces.PrimeFaces;
import org.primefaces.event.SelectEvent;
import org.primefaces.event.TransferEvent;
import org.primefaces.event.UnselectEvent;
import org.primefaces.model.DualListModel;
import org.primefaces.model.chart.Axis;
import org.primefaces.model.chart.AxisType;
import org.primefaces.model.chart.BarChartModel;
import org.primefaces.model.chart.CategoryAxis;
import org.primefaces.model.chart.ChartSeries;
import org.primefaces.model.chart.LineChartModel;
import org.primefaces.model.charts.ChartData;
import org.primefaces.model.charts.optionconfig.elements.Elements;
import org.primefaces.model.charts.optionconfig.elements.ElementsLine;
import org.primefaces.model.charts.radar.RadarChartDataSet;
import org.primefaces.model.charts.radar.RadarChartModel;
import org.primefaces.model.charts.radar.RadarChartOptions;

import com.core.book.TreeBean;

import javax.annotation.PostConstruct;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.context.ExternalContext;
import javax.faces.context.FacesContext;
import javax.servlet.http.HttpServletRequest;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@ManagedBean
public class PickListView implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -1887919223010361713L;
    //модели для всех чартов и их буферы
	private LineChartModel lineModel2; 
	private BarChartModel Bar2; 
	public static BarChartModel Bar;
	public static RadarChartModel Radar;
	private RadarChartModel radar2;
	public static LineChartModel lineModel;
	public static List<ThemeTable> Table;
	
    @ManagedProperty("#{themeService}")
    //private ThemeService service;
    // для таблицы
	private List<ThemeTable> table2;
    // для верхней таблицы 
    private DualListModel<Theme> themes;
    // полные данные из файла
    public List<ThemeFull> Qq;
    public String Filename;
    public String Display;
    @PostConstruct
    public void init()  {
       
        //Themes
    	//Qq = getDat();
        List<Theme> themesSource = readCAT();
        List<Theme> themesTarget = new ArrayList<Theme>();
        themes = new DualListModel<Theme>(themesSource, themesTarget);
    }
    
    public void tableAction() throws IOException {//вызов страницы с таблицей
    	table2 = new ArrayList<ThemeTable>();
    	if(themes.getTarget().size() > -1) {
    	Qq = getDat(themes.getTarget(),TreeBean.Selectfile);
    	for(int i = 0; i < Qq.size();i++) {
    		table2.add(new ThemeTable(Qq.get(i).getId(),Qq.get(i).getName(),Qq.get(i).getIndicators()));
    		System.out.println(table2.get(i).getId()+" id");
    		System.out.println(table2.get(i).getName()+" name");
    		System.out.println(table2.get(i).getJan()+" jan");
    		System.out.println(table2.get(i).getFeb()+"feb");
    	}
    	//Table = new ArrayList<ThemeTable>();
    	Table = table2;
    	Map<String,Object> options = new HashMap<String, Object>();
   	 //options.put("resizable", false);
    	// это настройки для нового окна
    	options.put("resizable", false);
        options.put("draggable", true);
        options.put("modal", true);
        options.put("height", "720px");
        options.put("width", "1250px");
        options.put("contentHeight", "100%");
        options.put("contentWidth", "100%");
   	PrimeFaces.current().dialog().openDynamic("TableData", options, null);
    	}
    	else {
    		Map<String,Object> options = new HashMap<String, Object>();
    	   	 //options.put("resizable", false);
    	    	// это настройки для нового окна
    	    	options.put("resizable", false);
    	        options.put("draggable", true);
    	        options.put("modal", true);
    	        options.put("height", "120px");
    	        options.put("width", "250px");
    	        options.put("contentHeight", "100%");
    	        options.put("contentWidth", "100%");
    	   	PrimeFaces.current().dialog().openDynamic("error", options, null);
    	}
    }
    public void createDataTable() throws  IOException {
    	table2 = new ArrayList<ThemeTable>();
    	Qq = getDat(themes.getTarget(),TreeBean.Selectfile);
    	for(int i = 0; i < Qq.size();i++) {
    		table2.add(new ThemeTable(Qq.get(i).getId(),Qq.get(i).getName(),Qq.get(i).getIndicators()));
    	}
    }
    public void buttonAction() throws IOException {
    	// построение графиков
    	System.out.println("Click");  
    	//cartesianLinerModel = createCartesianLinerModel();
    	Display = TreeBean.display;
    	Filename = TreeBean.Select;
    	System.out.println("dis "+Display);
    	if(Display != null && Display.toLowerCase().contains("l") && themes.getTarget().size() > -1) {
	    	Qq = getDat(themes.getTarget(),TreeBean.Selectfile);
	    	//Filename = TreeBean.Select;
	    	createLineModels();
	    	lineModel = lineModel2;
	    	Map<String,Object> options = new HashMap<String, Object>();
	    	 options.put("resizable", false);
	         options.put("draggable", true);
	         options.put("modal", true);
	         options.put("height", "720px");
	         options.put("width", "1250px");
	         options.put("contentHeight", "100%");
	         options.put("contentWidth", "100%");
	    	PrimeFaces.current().dialog().openDynamic("Chartjs", options, null);
    	}
    	// бар чарт
    	else if (Display != null && Display.toLowerCase().contains("b") && themes.getTarget().size() > -1) {
    		Qq = getDat(themes.getTarget(),TreeBean.Selectfile);
	    	//Filename = TreeBean.Select;
	    	createBarModels();
	    	Bar = Bar2;
	    	Map<String,Object> options = new HashMap<String, Object>();
	    	 //options.put("resizable", false);
	         options.put("draggable", true);
	         options.put("modal", true);
	         options.put("height", "720px");
	         options.put("width", "1250px");
	         options.put("contentHeight", "100%");
	         options.put("contentWidth", "100%");
	    	PrimeFaces.current().dialog().openDynamic("barChart", options, null);
    	}
    	// радио чарт
    	else if (Display != null && Display.toLowerCase().contains("r") && themes.getTarget().size() > -1) {
    		Qq = getDat(themes.getTarget(),TreeBean.Selectfile);
	    	//Filename = TreeBean.Select;
	    	createRadarModel();
	    	Radar = radar2;
	    	Map<String,Object> options = new HashMap<String, Object>();
	    	 //options.put("resizable", false);
	         options.put("draggable", true);
	         options.put("modal", true);
	         options.put("height", "720px");
	         options.put("width", "1250px");
	         options.put("contentHeight", "100%");
	         options.put("contentWidth", "100%");
	    	PrimeFaces.current().dialog().openDynamic("radar", options, null);
    	}
    	//ошибка
    	else {
    		Map<String,Object> options = new HashMap<String, Object>();
       	 //options.put("resizable", false);
            options.put("draggable", true);
            options.put("modal", true);
            options.put("height", "150px");
	        options.put("width", "300px");
            options.put("contentHeight", "100%");
            options.put("contentWidth", "100%");
            PrimeFaces.current().dialog().openDynamic("error", options, null);
    	}
    	
    }
    //получаем данные из ини файлов
    public List<ThemeFull> getDat(List<Theme> df, String name)  {
    	if(name != null) {
    	List<ThemeFull> dat = new ArrayList<ThemeFull>();
    	try {
        String strLine;
        BufferedReader br;
		
			br = new BufferedReader(new FileReader("C:\\wildfly-16.0.0.Final\\standalone\\deployments\\login-10.0.0-SNAPSHOT.war\\resources\\iniFile\\"+name));
		
       
        while ((strLine = br.readLine()) != null) {
            String[] arr = strLine.replaceAll("п»ї", "").split("\\s+");
            double[] ind = new double[arr.length-1];
            for(int i = 0 ; i < themes.getTarget().size();i++) {
            	for(int j = 1 ; j < arr.length;j++) {
            		if(arr[j].equals(".")) {
            			ind[j-1] = 0.0;
            		}
            		else {
            		ind[j-1] = Double.parseDouble(arr[j]);
            		}
            	}
            	 
            	if(themes.getTarget().get(i).getId() == Integer.parseInt(arr[0])) {
            		ThemeFull tf = new ThemeFull(Integer.parseInt(arr[0]),themes.getTarget().get(i).getName(),
            				ind,0);
            		dat.add(tf);
            		i = themes.getTarget().size()+999;
            	}
            }
	        }
	        br.close();
	
	    	return dat;
	    	}
	    	catch(Exception ex) {
	    		Map<String,Object> options = new HashMap<String, Object>();
	      	   	 //options.put("resizable", false);
	      	    	// это настройки для нового окна
	      	    	options.put("resizable", false);
	      	        options.put("draggable", true);
	      	        options.put("modal", true);
	      	        options.put("height", "120px");
	      	        options.put("width", "250px");
	      	        options.put("contentHeight", "100%");
	      	        options.put("contentWidth", "100%");
	      	   	PrimeFaces.current().dialog().openDynamic("error", options, null);
	    	}
    	}
    	else {
    		Map<String,Object> options = new HashMap<String, Object>();
   	   	 //options.put("resizable", false);
   	    	// это настройки для нового окна
   	    	options.put("resizable", false);
   	        options.put("draggable", true);
   	        options.put("modal", true);
   	        options.put("height", "120px");
   	        options.put("width", "250px");
   	        options.put("contentHeight", "100%");
   	        options.put("contentWidth", "100%");
   	   	PrimeFaces.current().dialog().openDynamic("error", options, null);
    	}
		return null;
    }
    public List<Theme> getTarget() {
		return this.getThemes().getTarget();
    }
   //данные  линейный график
        private void createLineModels() {
        	 lineModel2 = new LineChartModel();
             for(int i = 0; i < themes.getTarget().size();i++) {
            	 ChartSeries s = new  ChartSeries();
            	 s.setLabel(themes.getTarget().get(i).getName());
            	 for(int j = 0; j < 12;j++) {
            		 s.set(Qq.get(i).getMonth()[j], Qq.get(i).getIndicators()[j]);
            		 
            		 System.out.print(i+"|"+j+" "+ Qq.get(i).getIndicators()[j]+" ");
            	 }System.out.print("\n");
            	 lineModel2.addSeries(s);
             }

             
             lineModel2.setLegendPosition("e");
             Axis y = lineModel2.getAxis(AxisType.Y);
             //y.setMin(0.0);
            // y.setMax(400);
             y.setLabel("Индикаторы");
             lineModel2.getAxes().put(AxisType.X, new CategoryAxis("Месяц"));

             lineModel2.setShowPointLabels(true);
         }
   //данные  бар     
        private void createBarModels() {
        	Bar2 = new BarChartModel();
            for(int i = 0; i < themes.getTarget().size();i++) {
           	 ChartSeries s = new  ChartSeries();
           	 s.setLabel(themes.getTarget().get(i).getName());
           	 for(int j = 0; j < 12;j++) {
           		 s.set(Qq.get(i).getMonth()[j], Qq.get(i).getIndicators()[j]);
           		 
           		 System.out.print(i+"|"+j+" "+ Qq.get(i).getIndicators()[j]+" ");
           	 }System.out.print("\n");
           	Bar2.addSeries(s);
            }

            
            Bar2.setLegendPosition("e");
            Axis y = Bar2.getAxis(AxisType.Y);
            //y.setMin(0.0);
           // y.setMax(400);
            y.setLabel("Индикаторы");
            Bar2.getAxes().put(AxisType.X, new CategoryAxis("Месяц"));

            Bar2.setShowPointLabels(true);
        }
        // данные для радара, ха назвал радио выше хех
        public void createRadarModel() {
        	radar2 = new RadarChartModel();
            ChartData data = new ChartData();
            for(int i = 0; i < themes.getTarget().size();i++) {
	            RadarChartDataSet radarDataSet = new RadarChartDataSet();
	            radarDataSet.setLabel(themes.getTarget().get(i).getName());
	            List<Number> dataVal = new ArrayList<>();
	            
	            for(int j = 0; j < 8;j++) {
	             dataVal.add(Qq.get(i).getIndicators()[j]);
	            
	            }
	            //radarDataSet.getcolor
	            radarDataSet.setFill(true);
	            radarDataSet.setData(dataVal);
	            radarDataSet.setBackgroundColor("rgba(54, 162, 235, 0.2)");
	            radarDataSet.setBorderColor("rgb(0, 44, "+i*50+")");
	            radarDataSet.setPointBackgroundColor("rgb(0, 44, "+i*50+")");
	            radarDataSet.setPointBorderColor("#fff");
	            radarDataSet.setPointHoverBackgroundColor("#fff");
	            radarDataSet.setPointHoverBorderColor("rgb(0, 44, "+i*50+")");
	            data.addChartDataSet(radarDataSet);
            }
            List<String> labels = new ArrayList<>();
            labels.add("С");
            labels.add("СВ");
            labels.add("В");
            labels.add("ЮВ");
            labels.add("Ю");
            labels.add("ЮЗ");
            labels.add("З");
            labels.add("СЗ");
            data.setLabels(labels);
             
            /* Options */
            RadarChartOptions options = new RadarChartOptions();
            Elements elements = new Elements();
            ElementsLine elementsLine = new ElementsLine();
            elementsLine.setTension(0);
            elementsLine.setBorderWidth(3);
            elements.setLine(elementsLine);
            options.setElements(elements);
             
            radar2.setOptions(options);
            radar2.setData(data);
        }
    // читает кат файл
    public List<Theme> readCAT()  {
    	List<Theme> df = new ArrayList<Theme>();
    	try {
    		
            String strLine;
            BufferedReader br = new BufferedReader(new FileReader("C:\\wildfly-16.0.0.Final\\standalone\\deployments\\login-10.0.0-SNAPSHOT.war\\resources\\iniFile\\T_Cat.txt"));
           
            while ((strLine = br.readLine()) != null) {
                String[] arr = strLine.replaceAll("п»ї", "").split("\\s+");
                Theme obj = new Theme(Integer.parseInt(arr[0]),arr[1]);
                
                df.add(obj);
            }
            br.close();
    	}
    	catch(Exception e) {
    		
    	}
            
        return df;
    }

    public Map<Integer, String> readInfo(String name) {

        BufferedReader br = null;
        Map<Integer, String> sp = null;
        try {
            sp = new HashMap<Integer, String>();
            br = new BufferedReader(new FileReader(name));
            String strLine;
            while ((strLine = br.readLine()) != null) {
                String[] arr = strLine.replaceAll("п»ї", "").split("\\s+");
                sp.put(Integer.parseInt(arr[0]), arr[1]);
            }
        } catch (Exception ex) {
         ex.printStackTrace();
        } 
        return sp;
    }
    public DualListModel<Theme> getThemes() {
        return themes;
    }
 
    public void setThemes(DualListModel<Theme> themes) {
        this.themes = themes;
    }
    
    public void onTransfer(TransferEvent event) {
       
    }  
     
    public void onSelect(SelectEvent event) {
        FacesContext context = FacesContext.getCurrentInstance();
        context.addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO, "Item Selected", event.getObject().toString()));
    }
     
    public void onUnselect(UnselectEvent event) {
        FacesContext context = FacesContext.getCurrentInstance();
        context.addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO, "Item Unselected", event.getObject().toString()));
    }
     
    public void onReorder() {
        FacesContext context = FacesContext.getCurrentInstance();
        context.addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO, "List Reordered", null));
    }
    public void reload() throws IOException {
        ExternalContext ec = FacesContext.getCurrentInstance().getExternalContext();
        ec.redirect(((HttpServletRequest) ec.getRequest()).getRequestURI());
    }
	public LineChartModel getLineModel2() {
		return lineModel2;
	}
	public void setLineModel2(LineChartModel lineModel2) {
		this.lineModel2 = lineModel2;
	}

	public BarChartModel getBar2() {
		return Bar2;
	}

	public void setBar2(BarChartModel bar2) {
		Bar2 = bar2;
	}

	public List<ThemeTable> getTable2() {
		return table2;
	}

	public void setTable2(List<ThemeTable> table) {
		table2 = table;
	}

	public RadarChartModel getRadar2() {
		return radar2;
	}

	public void setRadar2(RadarChartModel radar21) {
		radar2 = radar21;
	}
	
}