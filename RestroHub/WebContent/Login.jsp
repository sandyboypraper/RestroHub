<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
  <!--Import Google Icon Font-->
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  <!--Import materialize.css-->
     <link type="text/css" rel="stylesheet" href="css/animate.css" />
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

  <div class="navbar-fixed mynav" style=" height: 50px !important;">
    <nav class="teal" style="height: 50px !important;line-height: 50px !important;">
      <div class="mybox">
        <div class="nav-wrapper">
          <a href="#home" class="brand-logo">RestroHub</a>
          <a href="#" data-activates="mobile-nav" class="button-collapse">
            <i class="material-icons">menu</i>
          </a>
          <ul class="right hide-on-med-and-down">
            <li>
              <a href="Registration.jsp">HOME</a>
            </li>
            <li>
              <a class="btn waves-effect teal lighten-2 black-text waves-light" href="Registration.jsp">SIGN-UP</a>
            </li>
          </ul>
        </div>
      </div>
    </nav>
  </div>
  <ul class="side-nav" id="mobile-nav">
    <li>
      <a href="Registration.jsp">HOME</a>
    </li>
    <li>
      <a class="btn waves-effect teal lighten-2 black-text waves-light" href="Registration.jsp">SIGN-UP</a>
    </li>
  </ul>


  <!-- SIGN IN FORM -->

  <section id="contact" class="section section-contact scrollspy" style="margin-top:22px;">
    <div class="container">
      <div class="row">
        <div class="col s8 offset-s2 m6 offset-m3">
          <div class="card-panel grey lighten-3">
            <h5>Log-In</h5>
            <br>
            <form action="Login" method="POST">
              <div class="input-field">
                <input type="email" placeholder="email" id="email" name="email">
                <label for="email">Email</label>
              </div>
              <div class="input-field">
                <input type="Password" placeholder="" id="pass" name="pass">
                <label for="pass">PassWord</label>
              </div>
              <input type="submit" value="Log-In" class="btn">
            </form>
          </div>
            
            <%
           
             try{
              if(request.getAttribute("errorname").equals("emptyfields"))
              {
            	  out.println("<div class='card-panel red white-text flash'>");
            	  out.println("Plz enter all the fields");
            	  out.println("</div>");
              }
              if(request.getAttribute("errorname").equals("wrong"))
              {
            	  out.println("<div class='card-panel red white-text animated flash'>");
            	  out.println("enter the right password");
            	  out.println("</div>");
              }
              if(request.getAttribute("errorname").equals("loginf"))
              {
            	  out.println("<div class='card-panel red white-text animated flash'>");
            	  out.println("plz login first");
            	  out.println("</div>");
              }
             }
          catch(Exception e)
          {
        	  // if errorname attribute ho hi na wha pr toh uske lie try catch lgaya hua h
          }
            
          %>
          
        </div>
      </div>
    </div>
  </section>

  <!-- SOCIAL MEDIA -->
 <footer >
    <section id="circle" class="section section-follow teal darken-2 white-text center scrollspy" style="min-height:200px;">
      <div class="container">
        <div class="row">
          <div class="col s12 m6"  style="padding-top:20px;">
            <h4>
              Follow RestroHub
            </h4>
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Totam, ut?</p>
            <p class="flow-text" style="font-size: 12px !important;">RestroHub &copy; 2018</p>
          </div>
          <div class="col s12 m6"  style="padding-top:50px;">
           <a href="https://facebook.com" target="_blank" class="white-text ficons">
              <i class="fab fa-facebook fa-4x"></i>
            </a>
            <a href="https://twitter.com" target="_blank" class="white-text ficons">
              <i class="fab fa-twitter fa-4x"></i>
            </a>
            <a href="https://linkedin.com" target="_blank" class="white-text ficons">
              <i class="fab fa-linkedin fa-4x"></i>
            </a>
            <a href="https://googleplus.com" target="_blank" class="white-text ficons">
              <i class="fab fa-google-plus fa-4x"></i>
            </a>
          </div>
        </div>
      </div>
    </section>
  </footer>


  <!-- FOOTER -->
  <!-- 
  <footer class="section teal darken-2 white-text center">
    <p class="flow-text">RestroHub &copy; 2018</p>
  </footer> -->
  <!--Import jQuery before materialize.js-->
  <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
  <script type="text/javascript" src="js/materialize.min.js"></script>
  <script>
    $(document).ready(function () {
      // init side nav
      $('.button-collapse').sideNav();

      // now init slider
      $('.slider').slider({
        indicators: false,
        height: 450,
        transition: 1500,
        interval: 2000
      });

      //autocomplete
      $('.autocomplete').autocomplete({
        data: {
          sandy: null
        }
      });

      $('.cardhover').mouseover(function () {
        $(this).addClass('z-depth-4');
        // $(this).addClass('white-text');
      }).mouseout(function () {
        $(this).removeClass('z-depth-4');
      });

      $('.scrollspy').scrollSpy();
    });
     //AIzaSyBv-PWpy-Jut3cT0kouqd8jSwDMKyPpHhg
  </script>

</body>

</html>