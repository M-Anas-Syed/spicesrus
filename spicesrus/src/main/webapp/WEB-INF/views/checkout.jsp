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

                .sortsection {
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

                .sortnfilter:hover {
                    opacity: 0.6;
                }

                .sorting {
                    position: relative;
                    display: inline-block;
                }

                .sortoptions {
                    display: none;
                    position: absolute;
                    min-width: 130px;
                    background: ghostwhite;
                    text-decoration: none;
                    color: black;
                    z-index: 5;
                    border-radius: 0 10px 10px 10px;
                }

                .sortbtn {
                    background: white;
                    border-radius: 10px 10px 0 0;
                }

                .sortselect {
                    display: block;
                    padding: 10px;
                    text-decoration: none;
                    color: black;
                    font-weight: 300;
                }

                .sortselect:hover {
                    background: lightgrey;
                }

                .show {
                    display: block;
                }

                .filterbox {
                    display: none;
                    position: fixed;
                    /* Stay in place */
                    z-index: 1;
                    /* Sit on top */
                    padding-top: 100px;
                    /* Location of the box */
                    left: 0;
                    top: 0;
                    width: 100%;
                    /* Full width */
                    height: 100%;
                    /* Full height */
                    overflow: auto;
                    /* Enable scroll if needed */
                    background-color: rgb(0, 0, 0);
                    /* Fallback color */
                    background-color: rgba(0, 0, 0, 0.4);
                    /* Black w/ opacity */
                }

                .filter {
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

                .filterlabels {
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

                prod:hover {
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

                .basketitems {
                    max-width: 1000px;
                    padding: 40px 0;
                    background: white;
                    border-radius: 10px;
                    border-top: 3px solid;
                    border-bottom: 3px solid;
                    padding-top: 0;
                }

                .item {
                    padding: 50px 0px;
                    border-bottom: 1px solid lightgray;
                    margin: 0px 50px;
                    display: flex;
                    justify-content: space-between;
                }

                h2 {
                    font-size: 30px;
                    font-weight: 200;
                }

                .iteminfo {
                    margin: 0 20px;
                }

                .itemquantity {
                    display: flex;
                    font-size: 25px;
                    font-weight: 300;
                    background: #F0F0F0;
                    padding: 7px 0px;
                    border-radius: 5px;
                    box-shadow: rgba(0, 0, 0, 0.16) 0px 1px 4px;
                    height: fit-content;
                }

                .basketitemquantity {
                    display: flex;
                    font-size: 25px;
                    font-weight: 300;
                    background: #F0F0F0;
                    padding: 7px 0px;
                    border-radius: 5px;
                    box-shadow: rgba(0, 0, 0, 0.16) 0px 1px 4px;
                    height: fit-content;
                }

                .minusbutton {
                    text-decoration: none;
                    border: none;
                    background: #F0F0F0;
                    color: black;
                    font-weight: 400;
                    font-size: 22px;
                    border-right: 1px solid lightgrey;
                    padding: 0px 15px;
                }

                .basketminusbtn {
                    text-decoration: none;
                    border: none;
                    background: #F0F0F0;
                    color: black;
                    font-weight: 400;
                    font-size: 18px;
                    border-right: 1px solid lightgrey;
                    padding: 0px 10px;
                }

                .plusbutton {
                    text-decoration: none;
                    border: none;
                    background: #F0F0F0;
                    color: black;
                    font-weight: 400;
                    font-size: 22px;
                    border-left: 1px solid lightgray;
                    padding: 0 15px;
                }

                .basketplusbtn {
                    text-decoration: none;
                    border: none;
                    background: #F0F0F0;
                    color: black;
                    font-weight: 400;
                    font-size: 18px;
                    border-left: 1px solid lightgray;
                    padding: 0 10px;
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

                #quantity {
                    width: 80px;
                    text-align: center;
                    border: none;
                    font-size: 16px;
                    background: #F0F0F0;
                    font-weight: 700;
                }

                .delete {
                    width: 30px;
                }

                .baskettitle {
                    text-align: left;
                    font-size: 50px;
                    font-weight: 200;
                    margin: 20px auto;
                    max-width: 600px;
                    margin-top: 40px;
                }

                .emptybasket {
                    text-align: center;
                    font-weight: 300;
                    font-size: 30px;
                    text-transform: uppercase full-width;
                    color: lightgray;
                    letter-spacing: -5px;
                }

                .checkout {
                    width: 350px;
                    padding: 15px 25px;
                    background: white;
                    border-radius: 10px;
                    border-top: 3px solid;
                    border-bottom: 3px solid;
                }

                .checkoutinfo {
                    display: flex;
                    justify-content: space-between;
                }

                .checkoutbtn {
                    text-decoration: none;
                    color: white;
                    background: black;
                    width: 100%;
                    display: block;
                    text-align: center;
                    padding: 10px;
                    font-weight: 300;
                    text-transform: uppercase;
                    letter-spacing: 3px;
                    font-size: 18px;
                    transition: background-color 300ms ease-in-out;
                }

                .checkoutbtn:hover {
                    color: black;
                    background-color: white;
                }

                .cancelbtn{
                    text-decoration: none;
                    color: black;
                    background: lightgray;
                    width: 100%;
                    display: block;
                    text-align: center;
                    padding: 10px;
                    font-weight: 300;
                    text-transform: uppercase;
                    letter-spacing: 3px;
                    font-size: 18px;
                    transition: background-color 300ms ease-in-out;
                    border-radius: 10px;

                }

                .paybtn{
                    text-decoration: none;
                    color: white;
                    background: black;
                    width: 100%;
                    display: block;
                    text-align: center;
                    padding: 10px;
                    font-weight: 300;
                    text-transform: uppercase;
                    letter-spacing: 3px;
                    font-size: 18px;
                    transition: background-color 300ms ease-in-out;
                    border-radius: 10px;
                    border: none;
                }

                .paybtn:hover {
                    color: black;
                    background-color: white;
                }

                .continueshopbtn {
                    text-decoration: none;
                    color: white;
                    background: #20B2AA;
                    padding: 10px 50px;
                    font-weight: 300;
                    font-size: 20px;
                }

                .accordion {
                    background-color: #eee;
                    color: #444;
                    cursor: pointer;
                    padding: 18px;
                    width: 100%;
                    text-align: left;
                    border: none;
                    outline: none;
                    transition: 0.4s;
                    font-size: 23px;
                }

                .panel {
                    padding: 0 18px;
                    background-color: white;
                    max-height: 0;
                    overflow: hidden;
                    transition: max-height 0.2s ease-out;
                }

                .active, .accordion:hover {
                    background-color: #ccc;
                }

                .custdetails{
                    padding: 10px 30px;
                    font-size: 18px;
                    font-weight: 400;
                    display: flex;
                    flex-direction: column;
                }

                .custinput{
                    width: 100%;
                    padding: 4px;
                    font-size: 17px;
                    font-family: inherit;
                    font-weight: 300;
                }

                .checkoutlabels{
                    margin-bottom: 10px;
                }

                .modal {
                    display: none; /* Hidden by default */
                    position: fixed; /* Stay in place */
                    z-index: 1; /* Sit on top */
                    left: 0;
                    top: 0;
                    width: 100%; /* Full width */
                    height: 100%; /* Full height */
                    overflow: auto; /* Enable scroll if needed */
                    background-color: rgb(0,0,0); /* Fallback color */
                    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
                }

                /* Modal Content/Box */
                .modal-content {
                    background-color: #fefefe;
                    margin: 15% auto;
                    border: 1px solid #888;
                    width: 50%;
                    border-radius: 10px;
                }

                .returnbtn{
                    text-align: center;
                    margin: 50px auto;
                    text-decoration: none;
                    color: black;
                    display: block;
                    padding: 5px 20px;
                    width: fit-content;
                    background: lightgray;
                    border-radius: 5px;
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
                        <a class="loginbutton" href="#">Login</a>
                        <a href="/basket">
                            <img class="basket" src="<c:url value='/media/basket.svg'/>" alt="">
                        </a>
                    </div>
                    <!--
          <a class="logoutbutton" href="#">Logout</a>
        -->
                </nav>
            </header>

            <section>
                <h1 class="baskettitle">Checkout</h1>
                <div style="display: flex;justify-content: space-evenly;">
                    <div style="margin: 40px 0;border-radius: 10px;overflow: hidden;">
                                <button class="accordion">Customer Details</button>
                                <div class="panel" style="max-height:478px;">
                                    <div style="width: 600px;padding:20px;">
                                        <div class="custdetails">
                                            <label class="checkoutlabels">*First Name:</label>
                                            <input class="custinput" type="text"></input>
                                        </div>
                                        <div class="custdetails">
                                            <label class="checkoutlabels">*Last Name:</label>
                                            <input class="custinput" type="text"></input>
                                        </div>
                                        <div class="custdetails">
                                            <label class="checkoutlabels">*Email:</label>
                                            <input class="custinput" type="text"></input>
                                        </div>
                                        <div class="custdetails">
                                            <label class="checkoutlabels">*Phone:</label>
                                            <input class="custinput" type="text"></input>
                                        </div>
                                    </div>
                                </div>
                                <button class="accordion">Delivery Information</button>
                                <div class="panel">
                                    <div style="width: 600px;padding:20px;">
                                        <div class="custdetails">
                                            <label class="checkoutlabels">*Address line 1:</label>
                                            <input class="custinput" type="text"></input>
                                        </div>
                                        <div class="custdetails">
                                            <label class="checkoutlabels">Address line 2:</label>
                                            <input class="custinput" type="text"></input>
                                        </div>
                                        <div class="custdetails">
                                            <label class="checkoutlabels">*City:</label>
                                            <input class="custinput" type="text"></input>
                                        </div>
                                        <div class="custdetails" style="display: flex;justify-content: space-between;flex-direction: row;">
                                            <label>*Postcode:</label>
                                            <input class="custinput" style="width: 35%;" type="text"></input>
                                            <label>*Country:</label>
                                            <input class="custinput" style="width: 35%;" type="text"></input>
                                        </div>
                                    </div>
                                </div>
                                <button class="accordion">Card Details</button>
                                <div class="panel">
                                    <div style="width: 600px;padding:20px;">
                                        <div class="custdetails">
                                            <label class="checkoutlabels">*Card Number:</label>
                                            <input class="custinput" type="text"></input>
                                        </div>
                                        <div class="custdetails">
                                            <label class="checkoutlabels">*Cardholder Name:</label>
                                            <input class="custinput" type="text"></input>
                                        </div>
                                        <div style="display: flex;justify-content: space-between;padding: 10px 30px;font-size: 18px;font-weight: 400;">
                                            <label style="margin-right: 5px;">*Expiry:</label>
                                            <div style="max-width: fit-content;">
                                                <input style="width: 20%;" placeholder="MM" min="1" max="12" type="number">
                                                <input style="width: 30%;" placeholder="YYYY" min="2022" max="2030" type="number"></input>
                                            </div>
                                            <label style="margin-right: 5px;">*CVV:</label>
                                            <input class="custinput" style="width: 35%;padding: 0;font-size: 15px;" type="text"></input>
                                        </div>
                                    </div>
                                </div>
                                <div style="margin: 40px auto;width: 50%;display: flex;justify-content: space-between;gap:20px;">
                                    <a class="cancelbtn" href="/basket">Cancel</a>
                                    <button type="submit" class="paybtn">Pay</button>
                                </div>
                    </div>

                    <div id="checkpanel" style="position: sticky; top: 100px; height: fit-content;margin: 40px 0;">
                        <div class="checkout">
                            <h2 style="text-align: center;border-bottom: 1px solid;padding-bottom: 30px;">Order Summary</h2>
                            <div>
                                <div class="checkoutinfo">
                                    <p style="font-weight: 300;">Items: </p>
                                    <p id="totalitems">${basket.totalitems}</p>
                                </div>
                                <div class="checkoutinfo">
                                    <p style="font-weight: 300;">Subtotal: </p>
                                    <div style="display: flex;">
                                        <img src="<c:url value='/media/pound_black.svg'/>" alt="pound"
                                            style="width: 15px;">
                                        <p id="subtotal">${basket.subtotal}</p>
                                    </div>

                                </div>
                                <div class="checkoutinfo">
                                    <p style="font-weight: 300;">Delivery: </p>
                                    <div style="display: flex;">
                                        <img src="<c:url value='/media/pound_black.svg'/>" alt="pound"
                                            style="width: 15px;">
                                        <p id="delivery">3.50</p>
                                    </div>
                                </div>
                            </div>
                            <div class="checkoutinfo"
                                style="border-top: 1px solid;padding: 30px;padding-bottom: 0;margin: 20px 0;">
                                <h3 style="font-weight: 300;font-size: 25px;margin: 0;">Total</h3>
                                <div style="display: flex;">
                                    <img src="<c:url value='/media/pound_black.svg'/>" alt="pound" style="width: 15px;">
                                    <p id="total" style="margin: 10px 0;">${basket.total}</p>
                                </div>
                            </div>
                        </div>
                        
                    </div>
                </div>

                <div id="myModal" class="modal">
                    <div class="modal-content">
                      <p style="width: 100%; background: green;margin: 0;padding: 20px;color: white;font-size: 25px;border-radius: 10px 10px 0 0;">Payment Successful !</p>
                      <h1 style="text-align: center;font-size: 30px;font-weight: 300;">Your Order has been placed</h1>
                      <h2 style="font-size: 25px;text-align: center;">Thank you for shopping at Spices'R'Us</h2>
                      <a class="returnbtn" href="/reset">Return</a>
                    </div>
                </div>

            </section>
            <footer style="background-color: #f7bf4f;">
                <div
                    style="display: flex;max-width: 1000px;margin: 0 auto;padding: 50px;justify-content: space-between;">
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

            const minus = document.querySelectorAll("#decrement");
            const plus = document.querySelectorAll("#increment");
            const quantity = document.querySelectorAll("#quantity");
            let prodprice = document.getElementsByClassName('productprice');
            const originalprice = document.getElementsByClassName('itemprice');

            //Function to decrement the quantity value
            minus.forEach(mbtn => {
                mbtn.addEventListener('click', function () {
                    let mnumIndex = Object.keys(minus).find(key => minus[key] === mbtn);
                    if (parseInt(quantity[mnumIndex].value) > 0) {
                        let num = parseInt(quantity[mnumIndex].value);
                        num -= 5;
                        quantity[mnumIndex].value = num;
                        prodprice[mnumIndex].innerHTML = (parseFloat(originalprice[mnumIndex].innerHTML) * parseFloat(quantity[mnumIndex].value)) / 100;
                    }
                    if (parseInt(quantity[mnumIndex].value) < 0) {
                        quantity[mnumIndex].value = 0;
                    }
                })
            })

            //Function to increment the quantity value
            plus.forEach(pbtn => {
                pbtn.addEventListener('click', function () {
                    let pnumIndex = Object.keys(plus).find(key => plus[key] === pbtn);
                    let num = parseInt(quantity[pnumIndex].value);
                    num += 5;
                    quantity[pnumIndex].value = num;
                    prodprice[pnumIndex].innerHTML = (parseFloat(originalprice[pnumIndex].innerHTML) * parseFloat(quantity[pnumIndex].value)) / 100;
                })
            })

            //Button to scroll to the top

            var btn = document.querySelector('#totop');

            btn.addEventListener('click', function (e) {
                e.preventDefault();
                $('html, body').animate({ scrollTop: 0 }, '300');
            });

            //Accordion
            var acc = document.getElementsByClassName("accordion");
            var i;

            for (i = 0; i < acc.length; i++) {
                acc[i].addEventListener("click", function() {
                    this.classList.toggle("active");
                    var panel = this.nextElementSibling;
                    if (panel.style.maxHeight) {
                    panel.style.maxHeight = null;
                    } else {
                    panel.style.maxHeight = panel.scrollHeight + "px";
                    } 
                });
            }

            // Get the modal
            var modal = document.getElementById("myModal");

            // Get the button that opens the modal
            var btn = document.querySelector(".paybtn");

            // When the user clicks the button, open the modal 
            btn.onclick = function() {
                modal.style.display = "block";
            }

        </script>

        </html>