package com.core.table;

import org.primefaces.component.picklist.PickList;
import org.primefaces.model.DualListModel;

import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import javax.faces.convert.FacesConverter;
// тут у них баг был при конвертации, почему то у них индекс коллекции стрингом был, переопределил
@FacesConverter(value = "empConverter")
public class PickListEmpConverter implements Converter {
    @Override
    public Object getAsObject(FacesContext fc, UIComponent comp, String value) {
        DualListModel<Theme> model = (DualListModel<Theme>) ((PickList) comp).getValue();
        for (Theme employee : model.getSource()) {
            if (employee.getId()==(Integer.valueOf(value))) {
                return employee;
            }
        }
        for (Theme employee : model.getTarget()) {
            if (employee.getId()==(Integer.valueOf(value))) {
                return employee;
            }
        }
        return null;
    }

    @Override
    public  String getAsString(FacesContext fc, UIComponent comp, Object value) {
        return ((Theme) value).getId()+"";
    }
}