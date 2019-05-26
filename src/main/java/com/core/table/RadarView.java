package com.core.table;

import java.io.Serializable;

import javax.annotation.PostConstruct;
import javax.faces.bean.ManagedBean;

import org.primefaces.model.charts.radar.RadarChartModel;

@ManagedBean
public class RadarView implements Serializable {
		
		/**
	 * 
	 */
	private static final long serialVersionUID = 1805430030968751519L;
	private RadarChartModel radarModel;
		
		@PostConstruct
	    public void init() {
			setRadarModel(PickListView.Radar);
		}

		public RadarChartModel getRadarModel() {
			return radarModel;
		}

		public void setRadarModel(RadarChartModel radarModel) {
			this.radarModel = radarModel;
		}

	}

