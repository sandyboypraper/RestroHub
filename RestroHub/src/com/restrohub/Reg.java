package com.restrohub;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



public class Reg extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Reg() {
        super();
        // TODO Auto-generated constructor stub
    }
    

    
  
    
    @Override
    public void init(ServletConfig config)
    {
    	
    	try{
			 Class.forName("com.mysql.jdbc.Driver");
    	}
    	catch(Exception e)
    	{}
	
    }
    
    @Override
    public void destroy()
    {
//    	try{
//    	con.close();
//    	}
//    	catch(Exception e)
//    	{}
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String url1 = "jdbc:mysql://localhost:3306/restrohub";
        String url2 = "jdbc:mysql://localhost:3306/fcat";
        String url3 = "jdbc:mysql://localhost:3306/orders";
        String url4 = "jdbc:mysql://localhost:3306/foodprice";
		String uname = "root";
		 Connection con;
		 Connection contofcat;
		 Connection confo;
		 Connection confp;
		try{
			con = DriverManager.getConnection(url1,uname,uname);
			contofcat = DriverManager.getConnection(url2,uname,uname);
			confo = DriverManager.getConnection(url3,uname,uname);
			confp = DriverManager.getConnection(url4,uname,uname); 
			 System.out.println("all set");
			     String fname = request.getParameter("fname").trim();
		         String lname = request.getParameter("lname").trim();
		         String pass  =  request.getParameter("pass").trim();
		         String email = request.getParameter("email").trim();
		         String arr[] = email.split("@");
		         String username = arr[0];
		         String phone = request.getParameter("phone").trim();
		         
			 String queary = "INSERT INTO reg (fname,lname,email,pass,phone) VALUES (?,?,?,?,?)";
			 String queary2 = "create table "+ username +" (tname varchar(50),count integer)";
			 String queary4 = "create table "+ username +" (foodname varchar(50),bill integer)";
			 String queary3 = "create table "+ username +" (custoname varchar(20) not null,bill integer not null,dat date not null)";
			 java.sql.PreparedStatement st = con.prepareStatement(queary);
			 Statement st1 = contofcat.createStatement();
			 Statement st2 = confo.createStatement();
			 Statement st4 = confp.createStatement();
			 System.out.println("all set 2");
			  st.setString(1, fname);
			  st.setString(2, lname);
			  st.setString(3, email);
			  st.setString(4, pass);
			  st.setString(5, phone);
			  st.executeUpdate();
			  st1.executeUpdate(queary2);
			  st4.executeUpdate(queary4);
			  st2.executeUpdate(queary3);
			 response.sendRedirect("Login.jsp");
			 con.close();
			 st.close();
			 contofcat.close();
			 st1.close();
			 confp.close();
			 st4.close();
			 confo.close();
			 st2.close();
			 }
			catch(Exception e){
				e.printStackTrace();
			}
		
		}
		
	

}
