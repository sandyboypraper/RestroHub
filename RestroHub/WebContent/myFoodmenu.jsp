 <%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
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
      
       String url2 = "jdbc:mysql://localhost:3306/fcat";
       String url3 = "jdbc:mysql://localhost:3306/fooddata";
	    String uname = "root";
	     Connection contofcat;
	     Connection confood;
	     ResultSet rt;
	     ResultSet rt1;
	     ArrayList<String> al = new ArrayList<String>();
	 
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

  <div class="navbar-fixed mynav sizing">
    <nav class="teal sizing">
      <div class="mybox">
        <div class="nav-wrapper">
          <a href="#" class="brand-logo left">MyFoodmenu</a>
          <a href="#" data-activates="mobile-demo" class="button-collapse show-on-large right">
            <i class="material-icons">menu</i>
          </a>
          <ul id="nav-mobile" class="hide-on-med-and-down right">
            <li>
              <a class="" href="">MyStaff</a>
            </li>
            <li>
              <a class="" href="">Analytics</a>
            </li>
            <li>
              <a class="" href="maindash.jsp">Dashboard</a>
            </li>
            <li>
              <a class="" href="Dashboard.jsp">MyrestroHOME</a>
            </li>
            <li>
              <a class="btn waves-effect teal lighten-2 black-text waves-light " href="Logout">Log-Out</a>
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
      <a class="" href="maindash.html">
        <i class="material-icons">dashboard</i> Dashboard</a>
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
      <a class="btn waves-effect teal lighten-2 black-text waves-light" href="Logout">Log-Out</a>
    </li>
  </ul>

  <!-- Controls -->

  <div class="fixed-action-btn  click-to-toggle">
    <a class="btn-floating btn-large red waves-effect waves-light">
      <i class="large material-icons">mode_edit</i>
    </a>
    <ul>
      <li>
        <a href="#post-modal" class="btn-floating blue tooltipped waves-effect waves-light modal-trigger" data-position="left" data-tooltip="Add-Food">
          <i class="material-icons">add</i>
        </a>
      </li>
      <li>
        <a href="#post-modal1" class="btn-floating cyan tooltipped waves-effect waves-light modal-trigger" data-position="left" data-tooltip="Add-Food-Catagori">
          <i class="material-icons">restaurant_menu</i>
        </a>
      </li>
    </ul>
  </div>

  <!-- Food Content -->
 
  <section class="section">
    <div class="mybox">
     <!--  <ul class="collapsible popout" data-collapsible="accordion">
        <li>
          <div class="collapsible-header">
            <i class="material-icons">restaurant</i> Food-Type 1</div>
          <div class="collapsible-body">
            <ul class="collection">
               
                <li class="collection-item">
                <p>First Line
                  <br> Second Line
                </p>
                <a href="#!" class="secondary-content">
                  <i class="material-icons">cancel</i>
                </a>
              </li>
                <li class="collection-item">
                <span class="title">Title</span>
                <a href="#!" class="secondary-content">
                  <i class="material-icons">cancel</i>
                </a>
              </li>

            </ul>
          </div>
        </li>
        
      </ul>
       <li class="collection-item avatar">
                <p>First Line
                  <br> Second Line
                </p>
                <a href="#!" class="secondary-content">
                  <i class="material-icons">cancel</i>
                </a>
              </li>-->
      <%
      try{  
    	   String email = mysess.getAttribute("email").toString();
           String arr[] = email.split("@");
           String username = arr[0];
           confood = DriverManager.getConnection(url3,uname,uname);
	       contofcat = DriverManager.getConnection(url2,uname,uname);
	       String queary = "select * from "+username;
	       Statement st = contofcat.createStatement(); 
	       rt = st.executeQuery(queary);
	       while(rt.next())
	       {
	    	   al.add(rt.getString("tname"));
	    	   out.println(" <ul class='collapsible popout' data-collapsible='accordion'> "
	    		       + "<li>"
	           + "<div class='collapsible-header'>");
	    	   out.println(" <i class='material-icons'>restaurant</i>"+rt.getString("tname")+"</div>");
	    	   out.println(" <div class='collapsible-body'> "
	    	            + "<ul class='collection'>");
	    	   %><%
	    	   String qu = "select * from "+username + rt.getString("tname");
	    	   Statement st1 = confood.createStatement();
	    	   rt1 = st1.executeQuery(qu);
	    	   while(rt1.next())
	    	   {
	    		   out.println("<li class='collection-item avatar'>");
	    		   out.println(" <p>"+rt1.getString("foodname"));
	    		   out.println("<br> price - "+rt1.getString("price")+"/-</p>");
	    		   out.println(" <a href='#!' class='secondary-content'>");
	    		   out.println("<i class='material-icons'>cancel</i>");
	    		   out.println("</a>");
	    		   out.println("</li>");
	    	   }
	    	    out.println("</ul>"
	    	            +"</div>"
	    	            +"</li>"
	    	            + "</ul>" );
	       }
      }
      catch(Exception e){
    	  e.printStackTrace();
      }
      %>  
    </div>
  </section>





  <!-- add food modal  -->

  <div class="modal" id="post-modal">
    <div class="modal-content">
      <h4 style="margin-bottom: 30px !important;">Add Food</h4>
      <form action="addfood" method="POST">
        <div class="input-field">
          <input type="text" name="foodname" id="title">
          <label for="title">Name</label>
        </div>
        <div class="input-field">
          <select name="catname" id="">
            <option value="" disabled selected>Select Catagori</option>
            <%
                 for (int x=0; x<al.size(); x++)
                 {
                   out.println("<option value="+ al.get(x) +">"+ al.get(x) +"</option>");
                 }
            %>
          </select>
        </div>
        <div class="input-field" style="margin-top: 40px;">
          <input type="text" name="price" id="body">
          <label for="body">Price</label>
        </div>
        <div class="modal-footer input-field">
          <input type="submit" class="modal-action modal-close btn blue white-text" value="Submit">
        </div>
      </form>
    </div>
  </div>


  <!-- Add food catagory -->

  <div class="modal" id="post-modal1">
    <div class="modal-content">
      <h4 style="margin-bottom: 30px !important;">Add Food Catagory</h4>
      <form action="addcat" method="POST">
        <div class="input-field" style="margin-top: 50px;">
          <input type="text" name="catname" id="title">
          <label for="title">Name</label>
        </div>
        <div class="modal-footer input-field">
          <input type="submit" class="modal-action modal-close btn blue white-text" value="Submit">
        </div>
      </form>
    </div>
  </div>

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





  <!-- 
  <div style="min-height: 100vh;"></div> -->
  <footer class="section teal darken-2 white-text center " style="height: 50px !important;">
    <p class="flow-text " style="margin: 0px !important;font-size: 12px !important;">RestroHub &copy; 2018</p>
  </footer>
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

        $('.modal').modal();

        $(document).ready(function () {
          $('.collapsible').collapsible();
        });

        $('select').material_select();

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