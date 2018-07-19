package com.restrohub;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Enumeration;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.util.*;

public class Placeorder extends HttpServlet {
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

	  
	  //name
	 //dat
	 // bill
	 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  
		   String url = "jdbc:mysql://localhost:3306/orders";
		   String url2 = "jdbc:mysql://localhost:3306/foodprice";
		   
		  String uname = "root";
		   
		   // date 
		   java.util.Date today = new java.util.Date();
		   SimpleDateFormat df  = new SimpleDateFormat("yyyy-MM-dd");
		   String date = df.format(today);
		   
		    Map<String,Integer> mp = new HashMap<>(); 
			
			//username
			 HttpSession mysess = request.getSession();
			 String email = mysess.getAttribute("email").toString();
	         String arr[] = email.split("@");
	         String username = arr[0];
	         
	         // fetching quary
			   String queary = "select * from "+ username;
	         
	         String cunstomername = "";
	         int bill = 0;
			
			try{
				 Connection con = DriverManager.getConnection(url,uname,uname);
				 Connection con2 = DriverManager.getConnection(url2,uname,uname); 
				 Statement st = con2.createStatement();
				 String queary2 = "insert into "+username+" (custoname,bill,dat) values (?,?,?)";
				 PreparedStatement st1 = con.prepareStatement(queary2); 
				 
				 String custoname = request.getParameter("custoname");
				 ResultSet rt =  st.executeQuery(queary);
				 while(rt.next())
				 {
					 mp.put(rt.getString("foodname"),rt.getInt("bill"));
				 }

		         String[] en = request.getParameterValues("choosenfood@placeorder");
		        		 for (int i = 0; i < en.length; i++) {
		        			    String food = en[i];
		        			    int price = mp.get(en[i]);
		        			    int howmuch = Integer.parseInt(request.getParameter(en[i]+"qunti"));
		        			    bill += price*howmuch;
		        			}
		        		 st1.setString(1, custoname);
		        		 st1.setInt(2, bill);
		        		 st1.setString(3, date);
		        		 st1.executeUpdate();
		        		 
		        		 response.sendRedirect("placeorder.jsp");
				 }
				catch(Exception e)
			    {
					e.printStackTrace();
				}
			}
	}

