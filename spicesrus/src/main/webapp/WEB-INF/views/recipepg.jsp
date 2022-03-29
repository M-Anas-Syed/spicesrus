<!---Jsp which displays the home page of the site and lists products that are sold--->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>



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

      .registerbutton{
          text-decoration: none;
          color: white;
          text-transform: uppercase;
          padding: 3px 13px;
          font-size: 18px;
          border-radius: 7px;
          font-weight: 300;
          background-image: linear-gradient( 115.7deg,  rgba(3,79,135,1) 6.2%, rgba(0,184,214,1) 112.9% );
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
      
      recipeimage{
		float: left;
      	display: block;
		width: 40%;
		height: auto;
		margin: 20px 0;
		text-align: center;
      }
      .recipeimg{
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
      	margin: 20px;
      	float: left;
        width: auto;
        background-color: white;
        padding: 20px 20px;
        border: 10px;
      }
      
      ingredients{
      	margin-top: 20px;
        float: left;
        width: auto;
        background-color: white;
        padding: 5px 20px;
        border: 10px
      }
      	
      sectiontitle{
      	text-decoration: underline;
      	float:left;
      	width:100%;
      	font-size: 18px;
      	padding: 0px 20px 0px 0px;
      }

      .basket{
        width: 30px;
      }

      .totalitems{
          margin: 0;
          position: absolute;
          top: -12px;
          right: -12px;
          color: white;
          background: black;
          border-radius: 50%;
          width: 18px;
          height: 18px;
          font-size: 12px;
          text-align: center;
      }
      
      products{
      float:left;
      padding:20px;
      text-align:center;
      text-decoration:underline;
      font-size:30px;
      width:100%;
      }
      
              /*container to hold products*/
        .prod {
          float: left;
          display: block;
          width: 250px;
          height: auto;
          background-color: white;
          margin: 20px 0;
          text-align: center;
          box-shadow: rgba(0, 0, 0, 0.15) 0px 2px 8px;
          transition: all .15s ease-in-out;
          display: inline-block;
        }

        .prod:hover {
          transform: scale(1.08);
        }

        .prodlist {
          margin: 35px 0;
          display: flex;
          flex-direction: row;
          justify-content: space-between;
          flex-wrap: wrap;
          gap: 60px;
        }

        .prodinfo {
          background: #e9ecef;
          padding: 5px;
          color: black;
          text-decoration: none;
        }

        /*product image*/
        prodimg {
          /*float: left;*/
          display: block;
          text-align: center;
          /*margin: 20px 20px 0px 20px;*/
          padding: 30px;
        }

        /*product name*/
        prodnm {
          /*float: left;*/
          width: 100%;
          text-align: center;
          font-size: 20px;
        }

        /*product price*/
        prodpr {
          font-size: 20px;
          display: flex;
          justify-content: center;
          font-weight: 300;
        }

        prodflav {
          text-align: center;
          width: 80%;
          font-size: 12px;
          display: block;
          margin: 10px auto;
          font-weight: 300;
        }

        .welcomeuser{
          margin: 6px 0px;
          font-size: 14px;
          font-weight: 300;
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
        <div style="display: flex;gap: 20px;">
          <sec:authorize access="!isAuthenticated()">
            <a class="loginbutton" href="/login-form">Login</a>
            <a class="registerbutton" href="/register">Register</a>
          </sec:authorize>
          <sec:authorize access="isAuthenticated()">
            <p class="welcomeuser">Welcome, ${customer.firstname}</p>
            <a class="logoutbutton" href="/logout-form">Logout</a>
          </sec:authorize>
          <a style="position: relative;" href="/basket">
            <img class="basket" src="<c:url value='/media/basket.svg'/>" alt="">
            <p class="totalitems">${totalitems}</p>
          </a>
        </div>
      </nav>
    </header>

    <section>
        <recipeimage>  
	       <img class = recipeimg src="<c:url value='/media/r${recipe.id}.jpg'/>" width="400" height="400">
	    </recipeimage>
	       <name>${recipe.name}</name>
	       <time>${recipe.time}<br></time>
	       <serving>Serves: ${recipe.serving}</serving>
	       <ingredients>
	       <sectiontitle>Ingredients</sectiontitle>
	       	<c:forEach items="${recipe.ingredients}" var="ingredient">
             	<item><br><input type="checkbox"> ${ingredient.ingredient}</item>
           </c:forEach>

           </ingredients>        
        
		   <steps>
		   <sectiontitle>Steps</sectiontitle>
		   <c:forEach items="${recipe.steps}" var="step">
             	<item><br>${step.step}<br></item>
           </c:forEach>
           </steps>
           <products>
           Links to the spices in this recipe
           <c:forEach items="${recipe.ingredients}" var="ingredient">
           		<c:if test="${not empty ingredient.product}">
             	<div>
                	<a href="/product=${ingredient.product.id}">
                  	<div class="prod">
                    	<prodimg><img src="<c:url value='/media/${ingredient.product.id}.png'/>" width="200" height="200"></prodimg>
                    	<form action="quickBuy" method="POST">
                      	<input type="hidden" value="${ingredient.product.id}" path="id" name="id">
                      	<input type="hidden" value="100" path="quantity" name="quantity">
                      	<button class="quickbuy" type="submit">
                        	<img src="<c:url value='/media/add_cart.svg'/>" alt="Add to cart" width="20" height="20">
                      	</button>
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                    	</form>
                    	<div class="prodinfo">
                      	<div>
                        	<prodnm>${ingredient.product.name}</prodnm>
                        	<prodpr>
                          	<img src="<c:url value='/media/pound_black.svg'/>" width="15" height="20"
                            	style="margin: 5px 0;">
                          	${ingredient.product.price}
                        	</prodpr>
                      	</div>
                    	</div>
                  	</div>
                	</a>
               	</div>	
           	 </c:if>
        </c:forEach>
        </products>  
    </section>
    <footer>

    </footer>


  </body>

  
  </html>