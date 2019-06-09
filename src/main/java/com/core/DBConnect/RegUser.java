/**
 * 
 */
package com.core.DBConnect;

import java.io.Serializable;
import java.util.ArrayList;

/**
 *
 * @author oam
 */
public class RegUser implements Serializable {

    /**
	 * 
	 */
	private static final long serialVersionUID = -926172003165410152L;
	private String login;
    private String pwd;
    private String fname;
    private String iname;
    private String email;
    private String country;
    private String city;
    private String org;
    private int aliasid;
    private int uid;
    // УГМС
    private boolean appr;
    private boolean allugms;
    private ArrayList<Integer> ugmsid;
     
    // поле для вывода сообщения об ошибке
    private String errmess;
    
    /*private ArrayList<Countries> countries=new ArrayList<>();

    public ArrayList<Countries> getCountries() {
        return countries;
    }*/
    
    @Override
    public String toString() {
        return login+" "+fname+" "+iname ;
    }

    /**
     * Creates a new instance of RegUser
     */
    public RegUser() {
        //countries = new DBGetter().fetchCountries();
        country="Russia";
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public boolean isAppr() {
        return appr;
    }

    public void setAppr(boolean appr) {
        this.appr = appr;
    }

    public boolean isAllugms() {
        return allugms;
    }

    public void setAllugms(boolean allugms) {
        this.allugms = allugms;
    }

    public ArrayList<Integer> getUgmsid() {
        return ugmsid;
    }

    public void setUgmsid(ArrayList<Integer> ugmsid) {
        this.ugmsid = ugmsid;
    }

    public int getAliasid() {
        return aliasid;
    }

    public void setAliasid(int aliasid) {
        this.aliasid = aliasid;
    }

    public String getErrmess() {
        return errmess;
    }

    public void setErrmess(String errmess) {
        this.errmess = errmess;
    }

    
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public String getFname() {
        return fname;
    }

    public void setFname(String fname) {
        this.fname = fname;
    }

    public String getIname() {
        return iname;
    }

    public void setIname(String iname) {
        this.iname = iname;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getOrg() {
        return org;
    }

    public void setOrg(String org) {
        this.org = org;
    }
    
}
