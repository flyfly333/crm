package org.aptech.crm.utils;

import org.aptech.crm.pojo.Accessory;
import org.aptech.crm.pojo.Complain;
import org.aptech.crm.pojo.ContactRecord;

import com.mysql.jdbc.log.Log;

public class TestGenerate {

	public static void main(String[] args) {
		Class [] classes = {Accessory.class};
		ProjectUtils.setClasses(classes);
		try {
			ProjectUtils.gererateDaoInterface();
			ProjectUtils.generateMappers();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	}

}
