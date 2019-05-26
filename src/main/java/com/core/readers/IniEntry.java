/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.core.readers;

import java.util.HashMap;

import org.primefaces.model.DefaultTreeNode;;
/**
 *
 * @author Anna2
 */
public class IniEntry extends DefaultTreeNode{
    
    /**
	 * 
	 */
	private static final long serialVersionUID = -8916727142179930983L;
	IniSection is;

    public IniEntry(IniSection is) {
        this.is = is;
    }

    public IniSection getIs() {
        return is;
    }

    @Override
    public String toString() {
        return is.getHeader();
    }
    
    public HashMap<String, String> getKey() {
        return is.getKeyval();
    }
    
    
}
