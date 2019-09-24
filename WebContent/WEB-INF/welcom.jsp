<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<link rel="stylesheet" href="bootstrap.min.css">
<link rel="stylesheet" href="style.css">
<title>Insert title here</title>
 <!--icone-->
    <link rel="icon" type="image/png" href="logo.png" />
</head>
<body>

  <!--le menu navbar-->

    <nav class="navbar navbar-expand-lg navbar-dark bg-dark" id="nav-main">
    <a class="navbar-brand" href="#">Navbar</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav mr-auto">
        <li class="nav-item active">
          <a class="nav-link" href="welcom.jsp">Home <span class="sr-only">(current)</span></a>
          
        </li>
        <li class="nav-item">
       
          <a class="nav-link" href="menu.jsp">Commande</a>
   
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            Dropdown
          </a>
          <div class="dropdown-menu" aria-labelledby="navbarDropdown">
            <a class="dropdown-item" href="#">Action</a>
            <a class="dropdown-item" href="#">Another action</a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="#">Something else here</a>
          </div>
        </li>
        <li class="nav-item">
          <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a>
        </li>
      </ul>
      <form class="form-inline my-2 my-lg-0">
        <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
      </form>
    </div>
 
</nav>
    

	<section id="carousel">
  <div id="carousel-home" class="carousel slide" data-ride="carousel">
  <ol class="carousel-indicators">
    <li data-target="#carousel-home" data-slide-to="0" class="active"></li>
    <li data-target="#carousel-home" data-slide-to="1"></li>
    <li data-target="#carousel-home" data-slide-to="2"></li>
  </ol>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="img/woman-camera.jpg"  alt="women taking picture with a camera">

        <div class="carousel-caption">
          <h3>A woman with a camera</h3>

          <p>She is probably taking a picture</p>
        </div>
    </div>

    <div class="carousel-item">
      <img src="img/spiderweb.jpg"  alt="A wet spiderweb">
      <div class="carousel-caption">
          <h3>A spider web</h3>

          <p>She is probably taking a picture</p>
        </div>
    </div>

    <div class="carousel-item">
      <img src="img/hearthand.jpg"  alt="two hands making a heart">

        <div class="carousel-caption">
          <h3>lovely</h3>

          <p>She is probably taking a picture</p>
        </div>
    </div>

  </div>
  <a class="carousel-control-prev" href="#carousel-home" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carousel-home" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
</section>
	

	<section id="cover">
      <div id="cover-caption">
        <div class="container">
          <div class="col-sm-15 col-sm-offset-1">
            <h1 class="display">Welcome to Restaurant 3.0</h1>
            <p>Just like the old Bootstrap, but better. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
                quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
                consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
                cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
                proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
            </p>

      
          </div>
        </div>
      </div>
    </section>
    
   
    
    
	
	

</body>
</html>