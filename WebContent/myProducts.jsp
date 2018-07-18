<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*, java.util.*, javax.servlet.*"  %>
<%@ page import="model.Product" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>My notes and books</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
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
		<a href="login.jsp">Please Login</a>
	
	<% 	} else {	%>

		<jsp:include page="sidebar.jsp" />
		
		<div class="w3-main" style="margin-left:300px">
		
		<!-- Header -->
		  <header id="portfolio">
		    <a href=""><img src="/w3images/avatar_g2.jpg" style="width:65px;" class="w3-circle w3-right w3-margin w3-hide-large w3-hover-opacity"></a>
		    <span class="w3-button w3-hide-large w3-xxlarge w3-hover-text-grey" onclick="w3_open()"><i class="fa fa-bars"></i></span>
		    <div class="w3-container">
		    <h1><b>My Notes and Books</b></h1>
		    <div class="w3-section w3-bottombar w3-padding-16">
		    </div>
		    </div>
		  </header>
		  
		  <%
			  	int pageNo = (int) session.getAttribute("page number");
			  	int perPageCount = 6;
			  %>			  
		
		<!--Photo Grid-->
		  <div class="w3-row-padding" style="text-align: center">
		    <%
		    	ArrayList<Product> productList = new ArrayList<Product>();		    
		    	productList = (ArrayList<Product>)session.getAttribute("my product list");		    	
		    	for(int i = 0; i < productList.size() && i < 6; i++){
		    		Product product = productList.get(i);
	   		 %>
		    <div class="w3-third w3-container w3-margin-bottom">
				<%
			    	if(!product.getBase64Image().isEmpty()){
			    		
			    %>
			      <img src="data:image/png;base64,<%= product.getBase64Image() %>"  style="width:100%" class="w3-hover-opacity">
			     <%}
			    	else{
			      %>
			    <img alt="no image" src="images/no-image.png" style="width:100%" class="w3-hover-opacity">
			      <%} %>
			    <div class="w3-container w3-white">
		        <p><b><%= product.getTitle() %></b></p>
		        <p><b> ₹ <%= product.getPrice() %></b></p>
		        <div style="margin-bottom: 24px">
		        <button type="button class" class="btn btn-info " data-toggle="modal" data-target="#product_<%= product.getProduct_id()%>" style="margin:4px;">View Details</button>
		        <button type="button class" class="btn btn-warning" data-toggle="modal" data-target="#product_<%= product.getProduct_id()%>_edit" style="margin:4px;">Edit</button>
		        <button type="button class" class="btn btn-danger" data-toggle="modal" data-target="#product_<%= product.getProduct_id()%>_delete" style="margin:4px;">Delete</button>
		        </div>
			
				
				<!-- Modal -->
				 
				<div id="product_<%= product.getProduct_id()%>" class="modal fade" role="dialog">
				  <div class="modal-dialog">
				
				    <!-- Modal content-->
				    <div class="modal-content">
				      <div class="modal-header">
				        <button type="button" class="close" data-dismiss="modal">&times;</button>
				        <h4 class="modal-title"><b><%= product.getTitle() %></b></h4>
				      </div>
				      <div class="modal-body">
				        <div id="product-details">
						<%
					    	if(!product.getBase64Image().isEmpty()){
					    %>
					      <img src="data:image/png;base64,<%= product.getBase64Image() %>"  alt="N"style="width:100%" class="w3-hover-opacity">
					     <%}
					    	else{
					      %>
					    <img alt="no image" src="http://via.placeholder.com/350x150" style="width:100%" class="w3-hover-opacity">
					      <%} %>
							<div>
								<h4>DESCRIPTION</h4>
								<p><%= product.getDescription() %></p>
								<h4>PRODUCT CONDITION</h4>
								<p><%= product.getProductCondition() %></p>
								<h4>PRICE</h4>
								<p>₹ <%= product.getPrice() %></p>
								<h4>Status</h4>
								<p><%= product.getSoldStatus() %>
							</div>
				        </div>
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				      </div>
				    </div>
				
				  </div>
				</div>




				<!--Modal-edit product-->
				
				<div id="product_<%= product.getProduct_id()%>_edit" class="modal fade" role="dialog">
				  <div class="modal-dialog">


				    <div class="modal-content">
				    	<div class="modal-header">
				        	<button type="button" class="close" data-dismiss="modal">&times;</button>
				        	<h4 class="modal-title"><b><%= product.getTitle() %></b></h4>
				      	</div>				          
				            <div class="modal-body">	                
				                <form  method="POST" action="editProduct">
                				  <div class="form-group">
				                    <label for="title">Title </label>
                				    <input type="text" class="form-control" name="title" placeholder="<%=product.getTitle()%>" value="<%=product.getTitle()%>"/>
				                  </div>
                				  <div class="form-group">
				                    <label for="description">Description </label>
                				    <input type="text" class="form-control" name="description" placeholder="<%=product.getDescription()%>" value="<%=product.getDescription()%>"/>
				                  </div>
                    			  <div class="form-group">
				                    <label for="price">Price </label>
                				    <input type="number" class="form-control" name="price" placeholder="<%=product.getPrice()%>" value="<%=product.getPrice()%>"/>
                  				  </div>
                                  <div class="form-group">
               					     <label for="condition">Condition </label>
                      				 <input type="text" class="form-control" name="product_condition" placeholder="<%=product.getProduct_condition()%>" value="<%=product.getProduct_condition()%>"/>
				                  </div>
				                  <div class="form-group">
               					     <label for="semester">Semester </label>
                      				 <select name="product_semester" value="<%=product.getProduct_semester()%>">
										<option>1 </option>
										<option>2 </option>
										<option>3 </option>
										<option>4 </option>
										<option>5 </option>
										<option>6 </option>
										<option>7 </option>
										<option>8 </option>								
									</select>  
				                  </div>

				                  <div class="form-group">
               					     <label for="type">Type </label>
                      				 <select name="product_type" value = "<%=product.getProduct_type()%>">
										<option>Book</option>
										<option>Notes</option>
										<option>Other</option>								
									</select>  
				                  </div>

				                  <input type="hidden" type="number" value="<%=product.getProduct_id()%>" name="product_id" />
                    
                				  <button type="submit" class="btn btn-primary">Submit</button>
                				</form>
                			</div>         				
		            </div>
				  </div>				
				</div>


				<!-- Modal-delete product -->
				 
				<div id="product_<%= product.getProduct_id()%>_delete" class="modal fade" role="dialog">
				  <div class="modal-dialog">
				
				    <!-- Modal content-->
				    <div class="modal-content">
				      <div class="modal-header">
				        <button type="button" class="close" data-dismiss="modal">&times;</button>
				        <h4 class="modal-title"><b><%= product.getTitle() %></b></h4>
				      </div>
				      <div class="modal-body">
				        <div id="product-details">				        							
							<h4>DESCRIPTION</h4>
							<p><%= product.getDescription() %></p>
							<h4>PRICE</h4>
							<p>₹ <%= product.getPrice() %></p>							
				        </div>
				        <h4><b>ARE YOU SURE YOU WANT TO REMOVE THIS PRODUCT?</b></h4>

				        <button type="button" class="btn btn-danger" data-dismiss="modal">No</button> 
				        <form method="POST" action="deleteProduct" style='display:inline;'>
				        	<input type="hidden" type="number" value="<%=product.getProduct_id()%>" name="product_id"/>
				        	<button type="submit" class="btn btn-success">Yes</button>				       
				        </form>

				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				      </div>
				    </div>
				
				  </div>
				</div>
				

			  </div>
		    </div>

		    <% } %>
		  </div>
		  
		   <!-- Pagination -->
			  <div class="w3-center w3-padding-32">
			    <div class="w3-bar">
			    <%
			    	if(pageNo != 1){
			    %>
			     		 <a href="myProducts?page=<%= (pageNo - 1) %>" class="w3-bar-item w3-button w3-hover-black">«</a>
			      <%
			    	}
			      	int totalProducts = (int)session.getAttribute("total count of my products");
			      	int totalPages = (int)Math.ceil((double)totalProducts/perPageCount);
			      	for(int i = 1; i <= totalPages; i++){
			      		String paginationStyle = "";
			      		if(i == pageNo){
			      			paginationStyle = "w3-black";
			      		}
			      		else{
			      			paginationStyle = "w3-hover-black";
			      		}
			      %>
			      	<a href="myProducts?page=<%= i %>" class="w3-bar-item w3-button <%=paginationStyle%>"><%= i %></a>
			      <% } 
			      	
			      	if(pageNo != totalPages && totalProducts != 0){
			      %>
					<a href="myProducts?page=<%= (pageNo + 1) %>" class="w3-bar-item w3-button w3-hover-black">»</a>
			   	  <% } %>			   	  
			    </div>
			  </div>
			  <%if(totalProducts == 0){ %>
			 	<h3 style="margin-left:30px">You havent sold any book yet. Sell your old books and notes and help someone! :)</h3>
			  <% } %>
		</div>
		  
		  <script>
		  function w3_open() {
			    document.getElementById("mySidebar").style.display = "block";
			    document.getElementById("myOverlay").style.display = "block";
			}
			 
			function w3_close() {
			    document.getElementById("mySidebar").style.display = "none";
			    document.getElementById("myOverlay").style.display = "none";
			}
			</script>
	<% } %>
	
	

</body>
</html>