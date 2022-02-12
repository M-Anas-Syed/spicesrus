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

      /*container to hold the rest of the page*/
      article {
        float: left;
        padding: 20px;
        width: 100%;
        background-color: #f1f1f1;

      }

      

      .products {
        max-width: 1000px;
        margin: 0 auto;
        padding: 60px 0;
      }

      .sortsection{
        display: flex;
        border-top: 1px #e1e1e1 solid;
        border-bottom: 1px #e1e1e1 solid;
        padding: 5px 0;
      }

      .sortnfilter {
        color: black;
        text-decoration: none;
        transition: opacity 200ms ease-in-out;
        font-size: 20px;
        font-weight: 400;
        margin: 0 10px;
      }

      .sortnfilter:hover{
        opacity: 0.6;
      }

      .sorting{
        position: relative;
        display: inline-block;
      }

      .sortoptions{
        display: none;
        position: absolute;
        min-width: 130px;
        background: ghostwhite;
        text-decoration: none;
        color: black;
        z-index: 5;
        border-radius: 0 10px 10px 10px;
      }

      .sortbtn{
        background: white;
        border-radius: 10px 10px 0 0;
      }

      .sortselect{
        display: block;
        padding: 10px;
        text-decoration: none;
        color: black;
        font-weight: 300;
      }

      .sortselect:hover{
        background: lightgrey;
      }

      .show{
        display:block;
      }

      .filterbox{
        display: none; 
        position: fixed; /* Stay in place */
        z-index: 1; /* Sit on top */
        padding-top: 100px; /* Location of the box */
        left: 0;
        top: 0;
        width: 100%; /* Full width */
        height: 100%; /* Full height */
        overflow: auto; /* Enable scroll if needed */
        background-color: rgb(0,0,0); /* Fallback color */
        background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
      }

      .filter{
        background-color: #fefefe;
        margin: auto;
        padding: 20px;
        border: 1px solid #888;
        width: 40%;
      }

      .close {
        color: #aaaaaa;
        float: right;
        font-size: 28px;
        font-weight: bold;
      }

      .close:hover,
      .close:focus {
        color: #000;
        text-decoration: none;
        cursor: pointer;
      }

      .filterlabels{
        display: flex;
        flex-direction: row;
        flex-wrap: wrap;
        gap: 35px;
        justify-content: space-between;
        font-weight: 300;
      }

      /*title (product/recipes etc)*/
      tit {
        float: left;
        width: 55%;
        background-color: grey;
        padding: 20px;
      }

      /*container to hold products*/
      prod {
        /*float: left;*/
        display: block;
        width: 250px;
        height: auto;
        background-color: white;
        margin: 20px 0;
        text-align: center;
        box-shadow: rgba(0, 0, 0, 0.15) 0px 2px 8px;
        transition: all .15s ease-in-out;
      }

      prod:hover{
        transform: scale(1.08);
      }
      
      .prodlist{
        margin: 35px 0;
        display: flex;
        flex-direction: row;
        justify-content: space-between;
        flex-wrap: wrap;
        gap: 60px;
      }

      .prodinfo{
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
        /*float: left;*/
        text-align: center;
        width: 100%;
        font-size: 10px;
      }

      /*sort and filter*/
      find {
        float: left;
        width: 45%;
        background-color: grey;
        list-style-type: none;
        padding: 6px;
      }

      /*footer with pagination*/
      footer {
        text-align: center;
      }

      .footertext{
        color: black;
        text-decoration: none;
        font-size: 20px;
        font-weight: 300;
        padding: 5px;
      }

      .footertext:hover{
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

      iframe{
        position: absolute;
        left: 0;
        top: 0;
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
      <!--
  <nav>
    <ul>
      <li><a href="/products">Products</a></li>
      <li><a href="/recipes">Recipes</a></li>
    </ul>
  </nav>-->

      <!--<login>
        <ul>
          <li><a href="#">Login</a></li>
        </ul>
      </login>-->

      <!---link to login (doesn't exist yet)--->
        <div class="products">
          <div class="sortsection">
            <!---will be used to sort and filter (might need to be changed from link)--->
            <div class="sorting">
              <a id="sort" class="sortnfilter" href="#">Sort</a>
              <div id="sortoptions" class="sortoptions">
                <a class="sortselect" href="/">Name: Ascending</a>
                <a class="sortselect" href="/products/descending">Name: Descending</a>
                <a class="sortselect" href="/products/hl">Price: High to Low</a>
                <a class="sortselect" href="/products/lh">Price: Low to High</a>
              </div>
            </div>

            <a id="filter" class="sortnfilter" href="#">Filter</a>
            <div class="filterbox">
              <div class="filter">
                <span class="close">&times;</span>
                <p style="font-size: 25px; font-weight: 400;">Filter by Region</p>
                <form:form action="/products" method="GET">
                  <div class="filterlabels">
                    <div ><input class="filteroptions" type="checkbox" name="asia" ><label>Asia</label></div>
                    <div ><input class="filteroptions" type="checkbox" name="africa" ><label>Africa</label></div>
                    <div ><input class="filteroptions" type="checkbox" name="europe" ><label>Europe</label></div>
                    <div ><input class="filteroptions" type="checkbox" name="oceania" ><label>Oceania</label></div>
                    <div ><input class="filteroptions" type="checkbox" name="northamerica" ><label>North America</label></div>
                    <div ><input class="filteroptions" type="checkbox" name="southamerica" ><label>South America</label></div>
                    <input type="submit" value="Apply"/>
                  </div>
                </form:form>
              </div>

            </div>
          </div>
          <!--<tit>Products</tit>-->
          <!---lists products--->
          <div class="prodlist">
            <c:forEach items="${spices}" var="spice">
              <a href="/product=${spice.id}">
                <prod>
                  <prodimg><img src="<c:url value='/media/${spice.id}.png'/>" width="200" height="200"></prodimg>
                  <div class="prodinfo">
                    <prodnm>${spice.name}</prodnm>
                    <prodpr>£${spice.price}</prodpr>
                  </div>
                </prod>
              </a>
            </c:forEach>
          </div>

        </div>

        <!---pagination (just an idea needs to be implemented)--->
        <div class="pagination">
          <a href="#">&laquo;</a>
          <a href="#">1</a>
          <a class="active" href="#">2</a>
          <a href="#">3</a>
          <a href="#">4</a>
          <a href="#">5</a>
          <a href="#">6</a>
          <a href="#">&raquo;</a>
        </div>
      

    </section>
    <footer style="background-color: #f7bf4f;">
      <div style="display: flex;max-width: 1000px;margin: 0 auto;padding: 50px;justify-content: space-between;">
        <div>
          <a style="display: block;width: 25%;" href="/">
            <img class="logo" src="<c:url value='/media/footerlogo.png'/>" alt="spiceruslogo">
          </a>
        </div>
        <div style="display: flex;flex-direction: column;position: absolute;width: 200px;left: 0;right: 0;margin-left: auto;margin-right: auto;">
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
          <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d77482.18830696869!2d-1.201139813366151!3d52.636160630891354!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x487742ab49b76c73%3A0x9a151d2a6fb49cb8!2sLeicester!5e0!3m2!1sen!2suk!4v1644351844085!5m2!1sen!2suk" width="100%" height="300" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
        </div>
      </div>
    </footer>



  </body>

  <script>

    const opt = document.querySelector(".sorting");

    opt.addEventListener("click", function(){
      document.getElementById("sortoptions").classList.add("show");
      opt.classList.add("sortbtn");
    });
    //document.getElementById("sortoptions").classList.toggle("show");
    
    const sortlist = document.getElementById("sort");
    // Close the dropdown menu if the user clicks outside of it
    // window.onclick = function(event) {
    //   if (!event.target.matches('#sort')) {
    //     var dropdowns = document.querySelector("#sortoptions");
    //     if (dropdowns.classList.contains('show')) {
    //         dropdowns.classList.remove('show');
    //         opt.classList.remove("sortbtn");
    //     }
    //   }
    // }
    


    var modal = document.querySelector(".filterbox");

    // Get the button that opens the modal
    var btn = document.querySelector("#filter");

    // Get the <span> element that closes the modal
    var span = document.querySelector(".close");

    // When the user clicks the button, open the modal 
     btn.onclick = function() {
       modal.style.display = "block";
     }

    // When the user clicks on <span> (x), close the modal
    span.onclick = function() {
      modal.style.display = "none";
    }

    //When the user clicks anywhere outside of the modal, close it

    window.onclick = function(event) {
      if (event.target == modal) {
        modal.style.display = "none";
      }
      if (!event.target.matches('#sort')) {
        var dropdowns = document.querySelector("#sortoptions");
        if (dropdowns.classList.contains('show')) {
            dropdowns.classList.remove('show');
            opt.classList.remove("sortbtn");
        }
      }
    }


    //Button to scroll to the top

    var btn = document.querySelector('#totop');

    btn.addEventListener('click', function(e) {
      e.preventDefault();
      $('html, body').animate({scrollTop:0}, '300');
    });

  </script>
  </html>