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
          margin-bottom: 0;
        }

        name {
          float: left;
          font-size: 75px;
          width: 50%;
        }

        price {
          font-size: 30px;
          right: 0;
          position: absolute;
          margin: 30px;
        }

        descr {
          text-align: justify;
          margin: 20px 0;
        } 

        .minusbutton{
          text-decoration: none;
          border: none;
          background: black;
          color: white;
          font-weight: 400;
        }

        .plusbutton{
          text-decoration: none;
          border: none;
          background: black;
          color: white;
          font-weight: 400;
        }

        #quantity{
          width: 10%;
          text-align: center;
          border: none;
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
              <img src="<c:url value='/media/pound_black.svg'/>" alt="pound">${spice.price}
            </price>
            <p class="quantitylabel">Quantity(g):</p>
            <div>
              <form:form action="/select">
                <button class="minusbutton" id="decrement" type="button">-</button>
                <input id="quantity" type="text" value="0">
                <button class="plusbutton" id="increment" type="button">+</button>
    
              </form:form>
            </div>
            <buy><button type="button">Add to basket</button></buy>
            <descr>Flavours: ${spice.flavours}</descr>
            <descr>${spice.description}</descr>
            <descr>History: ${spice.history}</descr>

          </div>
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
        if (parseInt(quantity.value) > 0) {
          let num = parseInt(quantity.value);
          num -= 5;
          quantity.value = num;
        }
        if (parseInt(quantity.value) < 0) {
          quantity.value = 0;
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