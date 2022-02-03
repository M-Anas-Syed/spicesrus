<!---Jsp which displays the home page of the site and lists products that are sold--->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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

      .pagination {
        /*display: inline-block;*/
        text-align: center;
        max-width: 1000px;
        margin: 0 auto;
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
            <a class="sortnfilter" href="#">Sort</a>
            <a class="sortnfilter" href="#">Filter</a>
          </div>
          <!--<tit>Products</tit>-->
          <!---lists products--->
          <div class="prodlist">
            <c:forEach items="${spices}" var="spice">
              <a href="/product=${spice.id}">
                <prod>
                  <prodimg><img src="<c:url value='/media/${spice.id}.jpg'/>" width="200" height="200"></prodimg>
                  <div class="prodinfo">
                    <prodnm>${spice.name}</prodnm>
                    <prodpr>�${spice.price}</prodpr>
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
    <footer>

    </footer>


  </body>

  </html>