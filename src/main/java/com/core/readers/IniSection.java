/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.core.readers;

import java.util.ArrayList;
import java.util.HashMap;

/**
 *
 * @author oam
 */
public class IniSection {
    
    private HashMap<String,String> keyval = new HashMap<>();
    
    private ArrayList<IniSection> children = new ArrayList<>();
    
    private String header;

    public IniSection(String header) {
        this.header = header;
    }
    
    public void addKV(String key, String val){
        keyval.put(key, val);
    }
    
    public void addChildren(IniSection is){
        children.add(is);
    }

    public ArrayList<IniSection> getChildren() {
        return children;
    }

    public String getHeader() {
        return header;
    }

    public HashMap<String, String> getKeyval() {
        return keyval;
    }

    public void setHeader(String header) {
        this.header = header;
    }

    
    
    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder(4096);
        sb.append(header).append("\n");
        for(String key:keyval.keySet()){
            sb.append(key).append("=").append(keyval.get(key)).append("\n");
        }
        return sb.toString();
    }
    
    
}
