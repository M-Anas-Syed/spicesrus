<!---Copy of browse jsp without product information, which will need to be updated when recipes are added to project--->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>Spice R Us</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!---CSS--->
<style>
* {
  box-sizing: border-box;
}

body {
  font-family: "Lucida Console", "Courier New", monospace;
}
/*header*/
header {
  background-color: orange;
  padding: 5px;
  text-align: center;
  font-size: 40px;
  color: red;
}

/*navigation bar*/
nav {
  float: left;
  width: 70%;
  background: #ccc;
  padding: 10px;
}

ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
  overflow: hidden;
  background-color: chocolate;
}

li {
  float: left;
}

li a {
  display: block;
  color: white;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}

li a:hover {
  background-color: green;
}
login{  
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
/*title (product/recipes etc)*/
tit {
float: left;
width: 55%;
background-color: grey;
padding: 20px;
}
/*container to hold products*/
prod {
float: left;
width: 250px;
height: auto;
background-color: grey;
margin: 20px 20px 20px 20px;
text-align: center;
}
/*product image*/
prodimg {
float: left;
text-align: center;
margin: 20px 20px 0px 20px;
}
/*product name*/
prodnm {
float: left;
width: 100%;
text-align: center;
font-size: 20px;
}
/*product price*/
prodpr {
float: left;
text-align: center;
width: 100%;
font-size: 10px;
}

/*sort and filter*/
find {
float:left;
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
  display: inline-block;
text-align: center;
}

.pagination a {
  color: black;
  float: left;
  padding: 8px 16px;
  text-decoration: none;
  bottom: 0;
}

.pagination a.active {
  background-color: #4CAF50;
  color: white;
}

.pagination a:hover:not(.active) {background-color: #ddd;}

section::after {
  content: "";
  display: table;
  clear: both;
}



</style>
</head>
<body>

<header>
  <h2>Spices 'R' Us</h2>
</header>

<section>
  <nav>
    <ul>
      <li><a href="/products">Products</a></li><!---link to products page--->
      <li><a href="/recipes">Recipes</a></li><!---link to recipe page (current page)--->
    </ul>
  </nav>
  <login><ul><li><a href="#">Login</a></li></ul></login><!---link to login (doesn't exist yet)--->
  <article>
    <find><!---will be used to sort and filter (might need to be changed from link)--->
      <li><a href="#">Sort</a></li>
      <li><a href="#">Filter</a></li>
    </find>

  </article>
  <footer><!---pagination (just an idea needs to be implemented)--->
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
  </footer>

</section>


</body>
</html>

