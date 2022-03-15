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
       /*Search bar*/
      S.search {padding: 30px 0;}

        form {
            position: relative;
            width: 300px;
            margin: 0 auto;
        }

        input, button {
            border: none;
            outline: none;
        }

        input {
            width: 100%;
            height: 42px;
            padding-left: 13px;
        }

        button {
            height: 42px;
            width: 42px;
            cursor: pointer;
            position: absolute;
        }

        .bar input, .bar2 button {
            border-radius: 3px;
        }
        .bar input {
            background: #F9F0DA;
        }
        .bar button {
            height: 26px;
            width: 50px;
            top: 8px;
            right: 8px;
            background: #F15B42;
        }
        .bar button:before {
            content: "Search";
            font-size: 13px;
            color: #F9F0DA;
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
		width: 50%;
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
      	width: 50%;
      }
      price{
        float: left;
        font-size: 30px;
        width: 50%;
      }
      	
      descr{
        float: left;
        width: 30%;
      }
      
      buy{
      	float:left;
      	width:50%
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
        <S class="bar">
       		<form:form action="/products/PSearch={NAME}" method="GET">
       			<input type="text" name="NAME">
       			<input type="submit" />
       		</form:form>
        </S>
        </div>
        <a class="loginbutton" href="#">Login</a>
        <!--
          <a class="logoutbutton" href="#">Logout</a>
        -->
      </nav>
    </header>

    <section>
        <productimage>  
	       <img class = productimg src="<c:url value='/media/${spice.id}.png'/>" width="500" height="500">
	    </productimage>
	       <name>${spice.name}</name>
	       <price>�${spice.price}</price>
	       <descr>${spice.description}</descr>
	       <buy><button type="button">Add to basket</button></buy>
    </section>
    <footer>

    </footer>


  </body>

  
  </html>