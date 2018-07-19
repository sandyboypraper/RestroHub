package com.restrohub;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Addcat extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	
	  @Override
	    public void init(ServletConfig config)
	    {
		  
	    	try{
				 Class.forName("com.mysql.jdbc.Driver");
	    	}
	    	catch(Exception e)
	    	{}
		
	    }
	    

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		    HttpSession mysess = request.getSession();
		   System.out.println(mysess.getAttribute("status"));
		   System.out.println(mysess.getAttribute("email"));
		   
		   String email = mysess.getAttribute("email").toString();
		   
		   String url2 = "jdbc:mysql://localhost:3306/fcat";
		   
		   String url3 = "jdbc:mysql://localhost:3306/fooddata";
			
			String uname = "root";
			 Connection contofooddata;
			 Connection contofcat;
			 
			 try{
				 contofcat = DriverManager.getConnection(url2,uname,uname);
				 contofooddata = DriverManager.getConnection(url3,uname,uname);
				 System.out.println("all set");
				 String catname = request.getParameter("catname").trim();
				 String value = catname.replaceAll("\\s+","");
				 String arr[] = email.split("@");
		         String username = arr[0];
		         String queary = "insert into "+ username +" (tname,count) values (?,?)";
		         String queary1 = "create table "+ username+value + " (foodname varchar(50),price integer)";
		         java.sql.PreparedStatement st = contofcat.prepareStatement(queary);
		         Statement st2 =  contofooddata.createStatement();
		         st.setString(1, catname);
				 st.setInt(2, 0);
				 st.executeUpdate();
				 st2.executeUpdate(queary1);
				 response.sendRedirect("myFoodmenu.jsp");
				 contofcat.close();
				 st.close();
			 }
			 catch(Exception e)
			 {
				 e.printStackTrace();
			 }
		   
	}

}
