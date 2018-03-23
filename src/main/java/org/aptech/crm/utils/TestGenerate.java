package org.aptech.crm.utils;

import org.aptech.crm.pojo.Dept;
import org.aptech.crm.pojo.Permission;

public class TestGenerate {

	public static void main(String[] args) {
		Class [] classes = {Permission.class};
		ProjectUtils.setClasses(classes);
		try {
			ProjectUtils.gererateDaoInterface();
			ProjectUtils.generateMappers();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	}

}
