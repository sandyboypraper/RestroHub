<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%!
       
       public void jspInit(){

        	try{
			         Class.forName("com.mysql.jdbc.Driver");
 	           }
 	       catch(Exception e)
 	        {}
        }
 
 %>
 <%
          HttpSession mysess = request.getSession();
 
          String url = "jdbc:mysql://localhost:3306/orders";
          String uname = "root";
 	      Connection con;
 	      ResultSet rt;
      /*
          if(mysess.getAttribute("status")==null)
          {
        	  response.sendRedirect("Login.jsp");
          }
          else if(mysess.getAttribute("status").equals("Loggedin"))
          {
        	  response.sendRedirect("Login.jsp");
          }
      */
          // OR 
          try{
        	  if(mysess.getAttribute("status").equals("Loggedout"))
              {
        		   request.setAttribute("errorname", "loginf");
		    	   RequestDispatcher rd = request.getRequestDispatcher("Login.jsp");
		    	   rd.forward(request, response);
              }
          }
      catch (NullPointerException e){
    	  response.sendRedirect("Login.jsp");
      }
     
      %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>
  <!--Import Google Icon Font-->
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  <!--Import materialize.css-->
  <link type="text/css" rel="stylesheet" href="css/materialize.min.css" media="screen,projection" />
  <link type="text/css" rel="stylesheet" href="css/main.css" />
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css" integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt"
    crossorigin="anonymous">
  <!--Let browser know website is optimized for mobile-->
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>RestroHub</title>
</head>

<body id="home" class="scrollspy">

  <!-- NAV BAR -->
 
 <div class="navbar-fixed mynav sizing">
    <nav class="teal sizing">
      <div class="mybox">
        <div class="nav-wrapper">
          <a href="#" class="brand-logo left">Orders</a>
          <a href="#" data-activates="mobile-demo" class="button-collapse show-on-large right">
            <i class="material-icons">menu</i>
          </a>
          <ul id="nav-mobile" class="hide-on-med-and-down right">
            <li>
              <a class="" href="myFoodmenu.jsp">MyFoodmenu</a>
            </li>
              <li>
              <a class="" href="placeorder.jsp">New Order</a>
            </li>
             <li>
              <a class="" href="Dashboard.jsp">MyRestro</a>
            </li>
            <li>
              <a class="" href="">MyStaff</a>
            </li>
           
            <li>
              <a class="" href="">Analytics</a>
            </li>
           
            <li>
              <a class="btn waves-effect teal lighten-2 black-text waves-light " href="#contact ">Log-Out</a>
            </li>
          </ul>
        </div>
      </div>
    </nav>
  </div>
  <ul class="side-nav" id="mobile-demo">
    <li>
      <div class="user-view">
        <div class="background teal">
          <img src="">
        </div>
        <a href="#">
          <img src="img/person2.jpg" alt="" class="circle">
        </a>
        <a href="#" class="name white-text">
          sandy
        </a>
        <a href="#" class="email white-text">
          sandyboyraper@gmail.com
        </a>
      </div>
    </li>
    <li>
      <a class="waves-effect waves-teal" href="Dashboard.jsp">
        <i class="material-icons">home</i> Myrestro</a>
    </li>
    <li>
      <a class="" href="">
        <i class="material-icons">restaurant</i>MyFoodmenu</a>
    </li>
    <li>
      <a class="" href="">
        <i class="material-icons">people</i> MyStaff</a>
    </li>
    <li>
      <a class="" href="">
        <i class="material-icons">data_usage</i>Analytics</a>
    </li>
    <li>
      <div class="divider"></div>
    </li>
    <li class="hide-on-med-and-up">
      <a class="subheader">Account Controls</a>
    </li>
    <li class="hide-on-med-and-up">
      <a class="btn waves-effect teal lighten-2 black-text waves-light" href="#contact">Log-Out</a>
    </li>
  </ul>

  <!-- Controls -->

    <section class="section">
    <div class="mybox">
      <div class="row">
        <div class="col s8 offset-s2 m6 offset-m3 center">
          <form action="https://www.google.com">
            <input type="text" class="datepicker" placeholder="choose date for search records">
            <button type="submit" class="btn darken-2 waves-effect waves-light right">Search</button>
          </form>
        </div>
      </div>
    </div>
  </section>
   
   
   <section class="section">
    <div class="container">
      <table class="centered striped">
        <thead>
          <tr>
            <th>Date</th>
            <th>Name</th>
            <th>Bill</th>
          </tr>
        </thead>

        <tbody>
          <% 
          String email = mysess.getAttribute("email").toString();
          String arr[] = email.split("@");
          String username = arr[0];
          con = DriverManager.getConnection(url,uname,uname);
          String queary = "select * from "+username;
          Statement st = con.createStatement();
          rt = st.executeQuery(queary);
          while(rt.next())
          {
        	  out.println("<tr>");
        	  out.println("<td>"+ rt.getString("dat") +"</td>");
        	  out.println("<td>"+ rt.getString("custoname") +"</td>");
        	  out.println("<td>"+ rt.getInt("bill") +"</td>");
        	  out.println("</tr>");
          }
          %>
        </tbody>
      </table>
    </div>
  </section>

  <!-- Preloder -->


  <div class="preloader-wrapper big active loader">
    <div class="spinner-layer spinner-teal-only">
      <div class="circle-clipper left">
        <div class="circle"></div>
      </div>
      <div class="gap-patch">
        <div class="circle"></div>
      </div>
      <div class="circle-clipper right">
        <div class="circle"></div>
      </div>
    </div>
  </div>

  

<!--  <footer class="section teal darken-2 white-text center " style="height: 50px !important;padding: auto 0 !important;">
    <p class="flow-text " style="margin: 0px !important;font-size: 12px !important;">RestroHub &copy; 2018</p>
  </footer> -->
 
  <!--Import jQuery before materialize.js-->
  <script type="text/javascript " src="https://code.jquery.com/jquery-3.2.1.min.js "></script>
  <script type="text/javascript " src="js/materialize.min.js "></script>
  <script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
  <script>
    // hide sections

    $('.section').hide();

    setTimeout(function () {
      $(document).ready(function () {

        $('.section').fadeIn();

        $('.loader').fadeOut();
        // init side nav
        $('.button-collapse').sideNav();

        $('.tooltipped').tooltip();
        // counter

         $('.datepicker').pickadate({
          selectMonths: true, // Creates a dropdown to control month
          selectYears: 15, // Creates a dropdown of 15 years to control year,
          today: 'Today',
          clear: 'Clear',
          close: 'Ok',
          closeOnSelect: false, // Close upon selecting a date,
          container: undefined, // ex. 'body' will append picker to body
        });
        
        $('.count').each(function () {
          $(this).prop('Counter', 0).animate({
            Counter: $(this).text()
          }, {
              duration: 1000,
              easing: 'swing',
              step: function (now) {
                $(this).text(Math.ceil(now));
              }
            });
        });

        $('.cardhover').mouseover(function () {
          $(this).addClass('z-depth-4');
          // $(this).addClass('white-text');
        }).mouseout(function () {
          $(this).removeClass('z-depth-4');
        });

        $('.scrollspy').scrollSpy();
      });
    }, 1000);




  </script>
  <script src="js/chart.js"></script>
</body>

</html>