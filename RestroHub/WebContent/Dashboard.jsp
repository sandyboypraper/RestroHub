      <%
          HttpSession mysess = request.getSession();
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

 <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css" integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt"
    crossorigin="anonymous">
   <link rel="stylesheet" href="css/main.css">
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
          <a href="#home" class="brand-logo left sizing">Myrestro
          </a>
          <a href=" # " data-activates="mobile-nav " class="button-collapse right show-on-large">
            <i class="material-icons ">menu</i>
          </a>
          <ul class="right hide-on-med-and-down ">
            <li>
              <a class="" href="maindash.jsp">Orders</a>
            </li>
             <li>
              <a class="" href="placeorder.jsp">New Order</a>
            </li>
            <li>
              <a action="" class="btn waves-effect teal lighten-2 black-text waves-light "  href="Logout">Log-Out</a>
            </li>
          </ul>
        </div>
      </div>
    </nav>
  </div>
  <ul class="side-nav" id="mobile-nav">
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
      <a class="waves-effect waves-teal" href="maindash.jsp">
        <i class="material-icons">dashboard</i> Orders</a>
    </li>
     <li>
      <a class="" href="placeorder.jsp">palceorder</a>
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


  <!-- NO below nav bar -->

  <section class="section section-stats center">
    <div class="row">
      <div class="col s12 m6 l3">
        <div class="card-panel cardhover teal lighten-1 white-text center" style="padding: 10px !important;">
          <i class="material-icons">insert_emoticon</i>
          <h5>XYZ</h5>
          <h4 class="count">24000</h4>
          <div class="progress grey lighten-1">
            <div class="determinate white" style="width: 40%;"></div>
          </div>
        </div>
      </div>
      <div class="col s12 m6 l3">
        <div class="card-panel cardhover white black-text center" style="padding: 10px !important;">
          <i class="material-icons">insert_emoticon</i>
          <h5>XYZ</h5>
          <h4 class="count">24000</h4>
          <div class="progress grey lighten-1">
            <div class="determinate teal" style="width: 40%;"></div>
          </div>
        </div>
      </div>
      <div class="col s12 m6 l3">
        <div class="card-panel cardhover teal lighten-1 white-text center" style="padding: 10px !important;">
          <i class="material-icons">insert_emoticon</i>
          <h5>XYZ</h5>
          <h4 class="count">24000</h4>
          <div class="progress grey lighten-1">
            <div class="determinate white" style="width: 40%;"></div>
          </div>
        </div>
      </div>
      <div class="col s12 m6 l3">
        <div class="card-panel cardhover black-text center" style="padding: 10px !important;">
          <i class="material-icons">insert_emoticon</i>
          <h5>XYZ</h5>
          <h4 class="count">24000</h4>
          <div class="progress grey lighten-1">
            <div class="determinate teal" style="width: 40%;"></div>
          </div>
        </div>
      </div>
    </div>
  </section>




  <!--chart-->

  <section class="section section-visitors teal lighten-4">
    <div class="row">
      <div class="col s12 m6 l8">
        <div class="card-panel">
          <div id="chartContainer" style="height: 200px;
          width: 100%"></div>
        </div>
      </div>
      <div class="col s12 m6 l4">
        <!-- Latest Comments -->
      </div>
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







  <!-- FOOTER -->
  <br>
  <br>
  <footer class="section teal darken-2 white-text center " style="height: 50px !important;padding: auto 0 !important;">
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

        // counter

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