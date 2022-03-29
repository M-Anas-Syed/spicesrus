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

        a {
          text-decoration: none;
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
	  margin: 50px;
        }


        .logoutbutton {
          text-decoration: none;
          color: white;
          text-transform: uppercase;
          padding: 3px 13px;
          font-size: 30px;
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

        .formholder{
	  margin: 50px auto;
	  border: 1px solid black;
	  outline-style: solid;
  	  outline-color: #ffa500;
 	  outline-width: thick;
	  width: 400px;
	  padding: 20px;
	  text-align:center;
	  background-color:white;
	}
	
	formheader{
	  font-size: 40px;
	  text-align:center;
	}

	input,
	.btn {
	  width: 100%;
	  padding: 12px;
	  border: none;
	  border-radius: 4px;
	  margin: 5px 0;
	  opacity: 0.85;
	  display: inline-block;
	  font-size: 17px;
	  line-height: 20px;
	  text-decoration: none; /* remove underline from anchors */
	}

	input:hover,
	.btn:hover {
	  opacity: 1;
	}

	input[type=submit] {
  	  background-color: #04AA6D;
	  color: white;
	  cursor: pointer;
	}

	input[type=submit]:hover {
	  background-color: #45a049;
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

        .pagination {
          /*display: inline-block;*/
          text-align: center;
          max-width: 1000px;
          margin: 0 auto;
          padding: 50px;
        }

        .pagination a {
          color: black;
          /*float: left;*/
          padding: 8px 16px;
          text-decoration: none;
          /*bottom: 0;*/
          display: inline-block;
        }

        .pagination a.active {
          background-color: #4CAF50;
          color: white;
        }

        .pagination a:hover:not(.active) {
          background-color: #ddd;
        }

        iframe {
          position: absolute;
          left: 0;
          top: 0;
        }

        .basket {
          width: 30px;
        }

        .quickbuy{
          position: absolute;
          top: 0;
          right: 0;
          margin: 10px;
          background: none;
          border: none;
          cursor: copy;
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
            <a style="position: relative;" href="/basket">
              <img class="basket" src="<c:url value='/media/basket.svg'/>" alt="">
              <p class="totalitems">${totalitems}</p>
            </a>
          </div>
        </nav>
      </header>

      <section>
	<div class="formholder">
	    <formheader>Logout</formheader>
		<p style="font-size:20px;">Are you sure you want to logout?</p>
    	    <a class="logoutbutton" href="/logout">Logout</a>
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

      //Button to scroll to the top

      var btn = document.querySelector('#totop');

      btn.addEventListener('click', function (e) {
        e.preventDefault();
        $('html, body').animate({ scrollTop: 0 }, '300');
      });

    </script>

    </html>