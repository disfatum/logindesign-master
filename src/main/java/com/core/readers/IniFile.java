/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.core.readers;

import java.util.ArrayList;

/**
 *
 * @author oam
 */
public class IniFile {
    private ArrayList<IniSection> sections = new ArrayList<>();
    
    public void addSection(IniSection is){
        sections.add(is);
    }
    
    public void printSections(){
        sections.stream()
                .forEach(s -> {System.out.println(s);
                System.out.println(sections.indexOf(s));
                });
    }
    public IniSection getSection(int index) {
		return sections.get(index);
    	
    }

    public ArrayList<IniSection> getSections() {
        return sections;
    }

    public void setSections(ArrayList<IniSection> sections) {
        this.sections = sections;
    }
    
}
