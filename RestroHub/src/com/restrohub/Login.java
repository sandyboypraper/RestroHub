package com.restrohub;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.jdbc.PreparedStatement;


public class Login extends HttpServlet {
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
 

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{

		 
	        
	        String url = "jdbc:mysql://localhost:3306/restrohub";
			
			String uname = "root";
			try{
				 Connection con = DriverManager.getConnection(url,uname,uname);
				 Enumeration en = request.getParameterNames();
			       
			        String email = request.getParameter("email").trim();
			       String pass = request.getParameter("pass").trim();
			       if(email.equals("")||pass.equals(""))
			       {
			    	   request.setAttribute("errorname", "emptyfields");
			    	   RequestDispatcher rd = request.getRequestDispatcher("Login.jsp");
			    	   rd.forward(request, response);
			       }
			       else
			       {
			    	  
			    	   String Queary = "select * from reg where email = (?)";
			    	   java.sql.PreparedStatement ps = con.prepareStatement(Queary);
			    	   ps.setString(1, email);
			    	   ResultSet rs  =  ps.executeQuery();
			    	   while(rs.next())
			    	   {
			    		   if(rs.getString("pass").equals(pass))
			    		   {
			    			   response.sendRedirect("Dashboard.jsp");
			    			   HttpSession mysess = request.getSession();
			    			   mysess.setAttribute("status", "Loggedin");
			    			   mysess.setAttribute("email",email);
			    			   System.out.println("logedin");
			    			   return;
			    		   }
			    	   }
			    	   request.setAttribute("errorname", "wrong");
			    	   RequestDispatcher rd = request.getRequestDispatcher("Login.jsp");
			    	   rd.forward(request, response);
			       }
				 }
				catch(Exception e)
			    {
					e.printStackTrace();
				}
			}
	        
		
	}

