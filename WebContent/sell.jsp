<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>Sell</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
body,h1,h2,h3,h4,h5,h6 {font-family: "Raleway", sans-serif}
#product-details h4 {text-decoration: underline; font-weight: bold;}
</style>
</head>
<body class="w3-light-grey w3-content" style="max-width:1600px">

	<%
		HttpServletResponse httpResponse = (HttpServletResponse) response;
		httpResponse.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); 
    	if ((session.getAttribute("email") == null) || (session.getAttribute("email") == "")) {
	%>
		You are not logged in<br/>
		<a href="index.jsp">Please Login</a>
	
	<% } 
    	
    	else
    		
    	{ %>
    	<jsp:include page="sidebar.jsp" />
    	
    	<div class="w3-main" style="margin-left:300px">
    	
    	<header id="portfolio">
			    <a href="#"><img src="/w3images/avatar_g2.jpg" style="width:65px;" class="w3-circle w3-right w3-margin w3-hide-large w3-hover-opacity"></a>
			    <span class="w3-button w3-hide-large w3-xxlarge w3-hover-text-grey" onclick="w3_open()"><i class="fa fa-bars"></i></span>
			    <div class="w3-container">
			    <h1><b>Sell Notes and Books</b></h1>
			    <div class="w3-section w3-bottombar w3-padding-16">
			    </div>
	    </header>
	
	<form method="post" action="addProduct" enctype="multipart/form-data" style="margin-left:20px">
            <center>
            <table class="table table-responsive" border="1" width="30%" cellpadding="5" bgcolor="pink">
                <thead>
                    <tr>
                        <th colspan="2">Add a product to sell</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Title</td>
                        <td><input class="form-control" type="text" name="title" value="" /></td>
                    </tr>
                    
                    <tr>
                        <td>Description</td>
                        <td><input class="form-control" type="text" name="description" value="" /></td>
                    </tr>
                    
                    <tr>
                        <td>Price</td>
                        <td><input class="form-control" type="number" name="price" value="" /></td>
                    </tr>
                                        
                    <tr>
                        <td>Condition</td>
                        <td><input class="form-control" type="text" name="product_condition" value="" /></td>
                    </tr>
                    
                    <tr>
                        <td>Semester</td>
                        <td>
                        	<select name="product_semester">
								<option>1</option>
								<option>2</option>
								<option>3</option>	
								<option>4</option>	
								<option>5</option>	
								<option>6</option>	
								<option>7</option>	
								<option>8</option>								
							</select>
                        </td>
                    </tr>
                    
                    <tr>
                        <td>Type</td>
                        <td>
                        	<select name="product_type">
								<option>Book</option>
								<option>Notes</option>
								<option>Other</option>								
							</select>
                        </td>
                    </tr>
                    
                    <tr>
                        <td>Upload image</td>
                        <td><input type="file" name="pic" accept="image/*"></td>
                    </tr>
                    
                    <tr>
                    	<td style="text-align:center"><input class="btn btn-info" type="reset" value="Reset" /></td>
                        <td style="text-align:center"><input class="btn btn-info" type="submit" value="Submit" /></td>                        
                    </tr>
                   

                </tbody>
            </table>
            </center>
        </form>
        </div>
        
        <script>
		// Script to open and close sidebar																																																					
		
		function w3_open() {
		    document.getElementById("mySidebar").style.display = "block";
		    document.getElementById("myOverlay").style.display = "block";
		}
		 
		function w3_close() {
		    document.getElementById("mySidebar").style.display = "none";
		    document.getElementById("myOverlay").style.display = "none";
		}
		document.getElementById("message").addEventListener("click", displayTextBox)
		function displayTextBox(){
			document.getElementById("sendMessage").style.display ="block";
		}
		</script>
        
        <% } %>
</body>
</html>