<!---Jsp which displays the home page of the site and lists products that are sold--->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


  <!DOCTYPE html>
  <html lang="en">

  <head>
    <title>Spice R Us</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@200;300;500&display=swap" rel="stylesheet">

    <!---CSS--->
    <style>
      * {
        box-sizing: border-box;
      }

      body {
        font-family: 'Oswald', sans-serif;
        margin: 0;
        padding: 0;
        background: #fff7d8;
      }

      /*header*/
      header {
        /*background-color: orange;
        padding: 5px;
        text-align: center;
        font-size: 40px;
        color: red;*/
        overflow: auto;
        background: #ffa500;
        position: sticky;
        top: 0;
        border-bottom: 1px goldenrod solid;
        z-index: 2;
      }

      .headerlinks {
        position: absolute;
        width: 200px;
        left: 0;
        right: 0;
        margin-left: auto;
        margin-right: auto;
      }

      .logo {
        width: 100%;
      }

      .logotag {
        width: 15%;
      }

      /*navigation bar*/
      nav {
        /*float: left;
        width: 70%;
        background: #ccc;
        padding: 10px;*/
        max-width: 1100px;
        padding: 12px 10px;
        display: flex;
        justify-content: space-between;
        margin: 0 auto;
        align-items: center;
      }

      ul {
        list-style-type: none;
        margin: 0;
        padding: 0;
        overflow: hidden;
        /*background-color: chocolate;*/
        font-size: 20px;
        font-weight: 300;
      }

      li {
        /*float: left;*/
        display: inline-block;
      }

      li a {
        display: block;
        color: white;
        text-align: center;
        /*padding: 14px 16px;*/
        text-decoration: none;
        padding: 3px 10px;
        border-radius: 7px;
      }

      .navoptions a {
        text-transform: uppercase;
        transition: background-color 300ms ease-in-out;
      }

      .navoptions a:hover {
        background-color: white;
        color: #ffa500;
      }

      .loginbutton {
        text-decoration: none;
        color: white;
        text-transform: uppercase;
        padding: 3px 13px;
        font-size: 18px;
        border-radius: 7px;
        font-weight: 300;
        background: radial-gradient(circle at -1% 57.5%, rgb(19, 170, 82) 0%, rgb(0, 102, 43) 90%);
        box-shadow: rgba(0, 0, 0, 0.15) 0px 2px 8px;
      }

      .logoutbutton {
        text-decoration: none;
        color: white;
        text-transform: uppercase;
        padding: 3px 13px;
        font-size: 18px;
        border-radius: 7px;
        font-weight: 300;
        background: #D31027;
        /* fallback for old browsers */
        background: -webkit-linear-gradient(to right, #EA384D, #D31027);
        /* Chrome 10-25, Safari 5.1-6 */
        background: linear-gradient(to right, #EA384D, #D31027);
        /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
        box-shadow: rgba(0, 0, 0, 0.15) 0px 2px 8px;
      }

      login {
        float: right;
        width: 30%;
        background: #ccc;
        padding: 10px;
      }
      
      section {
      	padding: 50px
      	}
      
      productimage{
		float: left;
      	display: block;
		width: 40%;
		height: auto;
		margin: 20px 0;
		text-align: center;
      }
      .productimg{
      	border-style: solid;
      	border-width: 2px;
      	border-color: black;
      }	
      name{
        float: left;
      	font-size:75px;
      	width: 60%;
      }
      time{
        float: left;
        font-size: 20px;
        width: 60%;
      }
      serving{
        float: left;
        font-size: 20px;
        width: 60%;
      }
      	
      item{
        <!-- float: left; -->
        width: auto;
        font-size: 15px;
      }
      
      steps{
      	float: left;
        width: auto;
        background-color: white;
        padding: 10px;
        border: 10px;
      }
      
      ingredients{
        float: left;
        width: auto;
        background-color: white;
        padding: 10px;
        border: 10px
      }
      	
      sectiontitle{
      	text-decoration: underline;
      	float:left;
      	width:auto;
      	min-width:60%;
      	font-size: 18px;
      	padding: 20px 0px 0px 0px;
      }

      /*footer with pagination*/
      footer {
        text-align: center;
      }

      section::after {
        content: "";
        display: table;
        clear: both;
      }
    </style>
  </head>

  <body>

    <header>
      <nav>
        <a class="logotag" href="/">
          <img class="logo" src="<c:url value='/media/spicesrus.png'/>" alt="spiceruslogo">
        </a>
        <div class="headerlinks">
          <ul>
            <li class="navoptions"><a href="/products">Products</a></li>
            <li class="navoptions"><a href="/recipes">Recipes</a></li>
          </ul>
        </div>
        <a class="loginbutton" href="#">Login</a>
        <!--
          <a class="logoutbutton" href="#">Logout</a>
        -->
      </nav>
    </header>

    <section>
        <productimage>  
	       <img class = productimg src="<c:url value='/media/r${recipe.id}.jpg'/>" width="400" height="400">
	    </productimage>
	       <name>${recipe.name}</name>
	       <time>${recipe.time}<br></time>
	       <serving>Serves: ${recipe.serving}</serving>
	       <ingredients>
	       <sectiontitle>Ingredients</sectiontitle>
	       	<c:forEach items="${recipe.ingredients}" var="ingredient">
             	<item><br>${ingredient.ingredient}</item>
           </c:forEach>
           </ingredients>        
        
		   <steps>
		   <sectiontitle>Steps</sectiontitle>
		   <c:forEach items="${recipe.steps}" var="step">
             	<item><br>${step.step}<br></item>
           </c:forEach>
           </steps>
    </section>
    <footer>

    </footer>


  </body>

  
  </html>