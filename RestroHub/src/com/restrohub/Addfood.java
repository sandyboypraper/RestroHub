package com.restrohub;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class Addfood extends HttpServlet {
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
	     
		 String url = "jdbc:mysql://localhost:3306/fooddata";
		 String url4 = "jdbc:mysql://localhost:3306/foodprice";
		 HttpSession mysess = request.getSession();
		 String email = mysess.getAttribute("email").toString();
         String arr[] = email.split("@");
         String username = arr[0];
		 String uname = "root";
		 Connection con;
		 Connection confp;
		 try{
			 con = DriverManager.getConnection(url,uname,uname);
			 confp = DriverManager.getConnection(url4,uname,uname); 
			 String foodname = request.getParameter("foodname");
			 String catname = request.getParameter("catname");
			 String value = catname.replaceAll("\\s+","");
			 String price = request.getParameter("price");
			 String queary = "insert into "+username+value+" (foodname,price) values (?,?)";
			 String queary2 = "insert into "+ username +" (foodname,bill) values (?,?)";
			 PreparedStatement ps = con.prepareStatement(queary);
			 PreparedStatement ps1 = confp.prepareStatement(queary2);
			 ps.setString(1, foodname);
			 ps.setInt(2, Integer.parseInt(price));
			 ps1.setString(1, foodname);
			 ps1.setInt(2, Integer.parseInt(price));
			 ps.executeUpdate();
			 ps1.executeUpdate();
			 ps.close();
			 ps1.close();
			 con.close();
			 confp.close();
			 response.sendRedirect("myFoodmenu.jsp");
//			 System.out.println(email+" => "+username);
//			 System.out.println(catname+" => "+value);
//			 System.out.println(foodname+" => "+foodname);
//			 System.out.println(price+" => "+price);
		 }
		catch(Exception e)
		 {
			e.printStackTrace();
		 }
	}
  
}
