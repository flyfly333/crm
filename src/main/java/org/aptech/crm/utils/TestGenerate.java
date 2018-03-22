package org.aptech.crm.utils;

import org.aptech.crm.pojo.Dept;
import org.aptech.crm.pojo.Post;

public class TestGenerate {

	public static void main(String[] args) {
		Class [] classes = {Post.class};
		ProjectUtils.setClasses(classes);
		try {
			ProjectUtils.gererateDaoInterface();
			ProjectUtils.generateMappers();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
