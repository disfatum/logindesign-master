/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.core.login;

import java.io.IOException;
import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.RequestScoped;
import javax.faces.context.FacesContext;

import org.primefaces.PrimeFaces;

/**
 *
 * @author disfatum
 */
@ManagedBean(name="login")
@RequestScoped
public class LoginBean implements Serializable{
    
    /**
	 * 
	 */
	private static final long serialVersionUID = -1457432413261521055L;
	public String username; 
    public String password;
    
    @PostConstruct
    public void init(){
        username = "";
        password = "";
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    public void access(){
        String dummy_user = "123";
        String dummy_pass = "123";
        FacesContext context = FacesContext.getCurrentInstance();
        //I use JDBC PostgreSQL driver for find the users in table "users"
        System.out.println(username+"\n"+password);
        if (username.equals(dummy_user) && password.equals(dummy_pass)) {
            //Here you must put your code to redirect or do something 
            context.addMessage(null, new FacesMessage("Successful login",  "You are logged in") );
            FacesContext extcon = FacesContext.getCurrentInstance();
            try {
				extcon.getExternalContext().redirect("/login/faces/Chapters.xhtml");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				//e.printStackTrace();
			}
        }
        else{
        	Map<String,Object> options = new HashMap<String, Object>();
         	 //options.put("resizable", false);
              options.put("draggable", true);
              options.put("modal", true);
              options.put("height", "130px");
   	        options.put("width", "300px");
              options.put("contentHeight", "100%");
              options.put("contentWidth", "100%");
              PrimeFaces.current().dialog().openDynamic("loginerror", options, null);
        }
    }
    public void book() {
    	FacesContext extcon = FacesContext.getCurrentInstance();
    	try {
			extcon.getExternalContext().redirect("/login/faces/book.xhtml");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();
		}
    }
    public void reg() {
    	System.out.println("reg");
    	//FacesContext extcon = FacesContext.getCurrentInstance();
    	Map<String,Object> options = new HashMap<String, Object>();
      	 //options.put("resizable", false);
           options.put("draggable", true);
           options.put("modal", true);
           options.put("height", "280px");
	        options.put("width", "300px");
           options.put("contentHeight", "100%");
           options.put("contentWidth", "100%");
           PrimeFaces.current().dialog().openDynamic("reg", options, null);
    }
}
