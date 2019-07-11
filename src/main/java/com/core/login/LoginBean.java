/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.core.login;

import java.io.IOException;
import java.io.Serializable;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.RequestScoped;
import javax.faces.context.FacesContext;

import org.primefaces.PrimeFaces;

import com.core.DBConnect.DBGetter;

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
    //вход или ошибка
    public void access(){
        String dummy_user = "123";
        String dummy_pass = "123";
        FacesContext context = FacesContext.getCurrentInstance();
        //I use JDBC PostgreSQL driver for find the users in table "users"
        DBGetter dbget = new DBGetter();
        int aliasid = 2;
        //получаем айди пользователя или -1 , если такого нет
        int connect =  dbget.checkLogin(username, password, aliasid);
        
        System.out.println(connect);
       // if (username.equals(dummy_user) && password.equals(dummy_pass)) {
        if(connect > -1) {
        	//LocalDate date = LocalDate.now();
        	//LocalTime time = LocalTime.now();
        	//String dt = date+" "+time;
        	
        	String ip = org.omnifaces.util.Faces.getRemoteAddr();
        	System.out.println(ip+" ip");
        	//добавляем лог в базу данных об успешном
        	dbget.logUserLogin(dbget.lastlg+1, connect, ip);
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
        // если пользователя нет, то выводит страничку ошибки
        else{
        	Map<String,Object> options = new HashMap<String, Object>();
         	 //options.put("resizable", false);
              options.put("draggable", true);
              options.put("modal", true);
              options.put("height", "330px");
   	          options.put("width", "350px");
              options.put("contentHeight", "100%");
              options.put("contentWidth", "100%");
              PrimeFaces.current().dialog().openDynamic("loginerror", options, null);
        }
    }
    //редирект на справочник
    public void book() {
    	FacesContext extcon = FacesContext.getCurrentInstance();
    	try {
			extcon.getExternalContext().redirect("/login/faces/book.xhtml");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();
		}
    }
    //окно регастрации
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
    public void registration() {
    	
    }
}
