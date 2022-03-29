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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


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

        .projectsection{
          display: flex;
          flex-direction: row;
        }

        .productinfo{
          display: flex;
          flex-direction: column;
          width: 500px;
          position: relative;
        }

        productimage {
          float: left;
          display: block;
          width: 50%;
          height: auto;
          margin: 20px 0;
          text-align: center;
        }

        .productimg {
          border-radius: 10px;
          box-shadow: rgba(149, 157, 165, 0.2) 0px 8px 24px;
        }

        .quantitylabel{
          font-size: 25px;
          margin: 0;
          font-weight: 300;
        }

        name {
          float: left;
          font-size: 75px;
          width: 50%;
          font-weight: 300;
        }

        price {
          font-size: 30px;
          right: 0;
          position: absolute;
          margin: 30px;
          font-weight: 300;
        }

        descr {
          text-align: justify;
          margin: 20px 0px 0px 0px;
        } 

        .minusbutton{
          text-decoration: none;
          border: none;
          background: #F0F0F0;
          color: black;
          font-weight: 400;
          font-size: 22px;
          border-right: 1px solid lightgrey;
          padding: 0px 15px;
        }

        .plusbutton{
          text-decoration: none;
          border: none;
          background: #F0F0F0;
          color: black;
          font-weight: 400;
          font-size: 22px;
          border-left: 1px solid lightgray;
          padding: 0 15px;
        }

        /* Chrome, Safari, Edge, Opera */
        #quantity::-webkit-outer-spin-button,
        #quantity::-webkit-inner-spin-button {
          -webkit-appearance: none;
          margin: 0;
        }

        /* Firefox */
        #quantity[type=number] {
          -moz-appearance: textfield;
        }

        #quantity{
          width: 80px;
          text-align: center;
          border: none;
          font-size: 16px;
          background: #F0F0F0;
          font-weight: 700;
        }

        .quantitydiv{
          width: fit-content;
          margin: 0 auto;
          background: #F0F0F0;
          padding: 7px 0px;
          display: flex;
          border-radius: 5px;
          box-shadow: rgba(0, 0, 0, 0.16) 0px 1px 4px;
        }

        /* #addtobasket{
          border: none;
          color: white;
          padding: 10px 20px;
          font-size: 18px;
          border-radius: 5px;
          text-transform: capitalize;
          letter-spacing: -1px;
          background: green;
        } */

              /*container to hold recipes*/
      rec {
        /*float: left;*/
        display: block;
        width: 250px;
        height: auto;
        background-color: black;
        margin: 20px 0;
        text-align: center;
        box-shadow: rgba(0, 0, 0, 0.15) 0px 2px 8px;
        transition: all .15s ease-in-out;
      }

      rec:hover {
        transform: scale(1.08);
      }

      .reclist {
        margin: 35px 0;
        display: flex;
        flex-direction: row;
        justify-content: space-between;
      }

      .recinfo {
        background: #e9ecef;
        padding: 5px;
        color: black;
        text-decoration: none;
      }

      /*recipe image*/
      recimg {
        /*float: left;*/
        display: block;
        text-align: center;
        /*margin: 20px 20px 0px 20px;*/
      }


      /*title (product/recipes etc)*/
      tit {
        float: left;
        width: 55%;
        background-color: grey;
        padding: 20px;
      }

      /*container to hold recipes*/
      rec {
        /*float: left;*/
        display: block;
        width: 250px;
        height: auto;
        background-color: black;
        margin: 20px 0;
        text-align: center;
        box-shadow: rgba(0, 0, 0, 0.15) 0px 2px 8px;
        transition: all .15s ease-in-out;
      }

      rec:hover {
        transform: scale(1.08);
      }

      .reclist {
        margin: 35px 0;
        display: flex;
        flex-direction: row;
        justify-content: space-between;
      }

      .recinfo {
        background: #e9ecef;
        padding: 5px;
        color: black;
        text-decoration: none;
      }

      /*recipe image*/
      recimg {
        /*float: left;*/
        display: block;
        text-align: center;
        /*margin: 20px 20px 0px 20px;*/
      }

      /*recipe name*/
      recnm {
        /*float: left;*/
        width: 100%;
        text-align: center;
        font-size: 20px;
      }
        
        
        
        #addtobasket {background-image: linear-gradient(to right, #06beb6 0%, #48b1bf  51%, #06beb6  100%)}
        #addtobasket {
            padding: 15px 25px;
            text-align: center;
            text-transform: uppercase;
            transition: 0.5s;
            background-size: 200% auto;
            color: white;            
            box-shadow: 0 0 20px #eee;
            border-radius: 10px;
            display: block;
            border: none;
            box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;
          }

          #addtobasket:hover {
            background-position: right center; /* change the direction of the change here */
            color: #fff;
            text-decoration: none;
          }
         
         
         
         
        buy {
          float: left;
          width: 50%
        }

        /*footer with pagination*/
        footer {
          text-align: center;
        }

        .footertext {
          color: black;
          text-decoration: none;
          font-size: 20px;
          font-weight: 300;
          padding: 5px;
        }

        .footertext:hover {
          color: white;
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

      .welcomeuser{
          margin: 6px 0px;
          font-size: 14px;
          font-weight: 300;
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
        <div class="projectsection">
          <productimage>
            <img class=productimg src="<c:url value='/media/${spice.id}.png'/>" width="500" height="500">
          </productimage>
  
          <div class="productinfo">
            <name>${spice.name}</name>

            <div>
              <c:forEach begin="1" end="${spice.spicelvl}" varStatus="loop">
                <img src="<c:url value='/media/spice.png'/>" width="20" height="50">
              </c:forEach>
            </div>

            <price>
              <img src="<c:url value='/media/pound_black.svg'/>" alt="pound">${spice.price} <span style="font-size: 15px;">(per 100g)</span>
            </price>

            <descr>Flavours: ${spice.flavours}</descr>
            <descr>History: ${spice.history}</descr>
            
            <div style="margin: 40px 0;">
              <form action="/addToBasket" method="POST" >
                <div style="display: flex; justify-content: space-evenly;">
                  <p class="quantitylabel">Qty(grams):</p>
                  <div class="quantitydiv">
                    <button class="minusbutton" id="decrement" type="button">-</button>
                    <input type="hidden" value="${spice.id}" path="id" name="id">
                    <input id="quantity" type="number" value="100" min="50" path="quantity" name="quantity"></input>
                    <button class="plusbutton" id="increment" type="button">+</button>
                  </div>
                  <button id="addtobasket" type="submit">Add to basket</button>
                </div>
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
              </form> 
            </div>
			

          </div>
        </div>
        <div class="reclist">
          <c:forEach items="${recipes}" var="dish">
            <a href="/recipe=${dish.id}">
              <rec>
                <recimg><img src="<c:url value='/media/r${dish.id}.jpg'/>" width="250" height="220"></recimg>
                <div class="recinfo">
                  <recnm>${dish.name}</recnm>
                </div>
              </rec>
          </c:forEach>
        </div>
      </section>
             
      <footer style="background-color: #f7bf4f;">
        <div style="display: flex;max-width: 1000px;margin: 0 auto;padding: 50px;justify-content: space-between;">
          <div>
            <a style="display: block;width: 25%;" href="/">
              <img class="logo" src="<c:url value='/media/footerlogo.png'/>" alt="spiceruslogo">
            </a>
          </div>
          <div
            style="display: flex;flex-direction: column;position: absolute;width: 200px;left: 0;right: 0;margin-left: auto;margin-right: auto;">
            <a class="footertext" href="/products">Products</a>
            <a class="footertext" href="/recipes">Recipes</a>
          </div>
          <div style="border-radius: 50%;background: lightgoldenrodyellow;height: fit-content;">
            <a id="totop" style="padding: 5px;" href="/">
              <img style="width: 35px;" src="<c:url value='/media/arrowup.svg'/>" alt="back to top">
            </a>
          </div>
        </div>
        <div>
          <p style="font-size: 25px;margin-bottom: 0px;padding-bottom: 20px;">Based in Leicester</p>
          <div style="position: relative;">
            <iframe
              src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d77482.18830696869!2d-1.201139813366151!3d52.636160630891354!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x487742ab49b76c73%3A0x9a151d2a6fb49cb8!2sLeicester!5e0!3m2!1sen!2suk!4v1644351844085!5m2!1sen!2suk"
              width="100%" height="300" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
          </div>
        </div>
      </footer>

    </body>
    <script>
      const minus = document.querySelector("#decrement");
      const plus = document.querySelector("#increment");
      const quantity = document.querySelector("#quantity");

      //Function to decrement the quantity value
      minus.addEventListener('click', function () {
        if (parseInt(quantity.value) > 50) {
          let num = parseInt(quantity.value);
          num -= 5;
          quantity.value = num;
        }
        if (parseInt(quantity.value) < 50) {
          quantity.value = 50;
        }
      })

      //Function to increment the quantity value
      plus.addEventListener('click', function () {

        let num = parseInt(quantity.value);
        num += 5;
        quantity.value = num;

      })

      //Button to scroll to the top
      var btn = document.querySelector('#totop');

      btn.addEventListener('click', function (e) {
        e.preventDefault();
        $('html, body').animate({ scrollTop: 0 }, '300');
      });

    </script>

    </html>