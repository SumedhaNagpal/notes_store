<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html;charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*, java.util.*, javax.servlet.*"  %>
<%@ page import="model.Product" %>
<%@ page import="java.util.Date, java.text.DateFormat, java.text.SimpleDateFormat" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
			
			<!-- !PAGE CONTENT! -->
			<div class="w3-main" style="margin-left:300px">
			
			  <!-- Header -->
			  <header id="portfolio">
			    <a href="#"><img src="data:image/jpg;base64,${user.base64Image}" style="width:65px;" class="w3-circle w3-right w3-margin w3-hide-large w3-hover-opacity"></a>
			    <span class="w3-button w3-hide-large w3-xxlarge w3-hover-text-grey" onclick="w3_open()"><i class="fa fa-bars"></i></span>
			    <div class="w3-container">
			   <h2><b>Buy Notes and Books</b></h2>
			    <div class="w3-section w3-bottombar w3-padding-16">
			      <form action="search" style="display:flex;">
      				<input class="form-control" type="text" placeholder="Search.." name="search">
      				<input class="btn btn-default" type="submit" value="Submit" style="margin-left:6px"></button>
    			</form>
			    </div>
			    </div>
			  </header>
			  
			  <%
			  	String spageNo=request.getParameter("page");
			  	int pageNo;
			  	if(spageNo != null){
			  		pageNo =Integer.parseInt(spageNo); 
			  	}
			  	else{
			  		pageNo = 1;
			  	}
			  	int perPageCount = 6;
			  	int itemNo = 1;
			  	if(pageNo != 1){
			  		itemNo = (pageNo - 1) * perPageCount + 1;
			  	}
			  %>
			  
			  <!-- First Photo Grid-->
			  
			  <div class="w3-row-padding" style="text-align: center">
			    <%
			    	
			    	ArrayList<Product> productList = new ArrayList<Product>();
			    	productList = (ArrayList)session.getAttribute("product list");
			    	for(int i = itemNo - 1; i < productList.size() && i < itemNo + 6 - 1; i++){
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
			    <img alt="no image" src="http://via.placeholder.com/350x150" style="width:100%" class="w3-hover-opacity">
			      <%} %>
			      <div class="w3-container w3-white">
			        <p><b><%= product.getTitle() %></b></p>
			        <p><b> ₹ <%= product.getPrice() %></b></p>
			        <div style="margin-bottom: 24px">
			        <button type="button class" class="btn btn-info btn-lg" data-toggle="modal" data-target="#product_<%= product.getProduct_id()%>" style="margin:4px;">View Details</button>
			       	<form method="POST" action="TxnTest.jsp">
			       		<%
			       			HttpSession s=request.getSession();
			       			s.setAttribute("current_product_id",product.getProduct_id());
			       		%>
				      	<button type="submit" class="btn btn-success">Buy Now</button>				       
				     </form>
			     
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
							      <img src="data:image/png;base64,<%= product.getBase64Image() %>"  style="width:100%" class="w3-hover-opacity">
							     <%}
							    	else{
							      %>
							    <img alt="no image" src="http://via.placeholder.com/350x150" style="width:100%" class="w3-hover-opacity">
							      <%} %>								<div>
									<h4>DESCRIPTION</h4>
									<p><%= product.getDescription() %></p>
									<h4>PRODUCT CONDITION</h4>
									<p><%= product.getProductCondition() %></p>
									<h4>POSTED BY</h4>
									<p><%= product.getUser_name() %></p>
									<h4>PRICE</h4>
									<p>₹ <%= product.getPrice() %></p>
								</div>
								<button type="button" class ="btn btn-warning message" >Message <i class="fa fa-envelope" aria-hidden="true"></i></button>
					       		<form class="sendMessage"method="post" action="sendMessage" style="margin-top:6px; display:none">
					       			<%	DateFormat dateFormat = new SimpleDateFormat("yyy/MM/dd HH:mm:ss");
					       				Date date = new Date();
					       			%>
					       			<textarea class="form-control" name="messageText">Hi! I am interested to buy these books/notes</textarea>
					       			<input type="hidden" name ="toId" value="<%= product.getUser_id()%>">
					       			<input type="hidden" name ="type" value="redirect"/>
					       			<input type="hidden" name ="time" value="<%= dateFormat.format(date) %>"/>
					       			<input type="submit" value="Send" class="btn btn-success" style="margin-top:6px">
					       		</form>
					        </div>
					      </div>
					      <div class="modal-footer">
					        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					      </div>
					    </div>
					
					  </div>
					</div>

			      </div>
			    </div>
			    <script>
			    $("#product_" + <%=product.getProduct_id()%>).on('hidden.bs.modal', function(){
			    	$(".sendMessage").css("display", "none");
			    	
			    })
			    </script>
			    <% } %>
			  </div>
	 
			
			  <!-- Pagination -->
			  <div class="w3-center w3-padding-32">
			    <div class="w3-bar">
			    <%
			    	if(pageNo != 1){
			    %>
			     		 <a href="success.jsp?page=<%= (pageNo - 1) %>" class="w3-bar-item w3-button w3-hover-black">«</a>
			      <%
			    	}
			      	int totalProducts = productList.size();
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
			      	<a href="success.jsp?page=<%= i %>" class="w3-bar-item w3-button <%=paginationStyle%>"><%= i %></a>
			      <% } 
			      	
			      	if(pageNo != totalPages){
			      %>
					<a href="success.jsp?page=<%=pageNo+1%>" class="w3-bar-item w3-button w3-hover-black">»</a>
			   	  <% } %>
			    </div>
			  </div>
			
			  
			
			  
			<!-- End page content -->
			</div>
			
			<script>																																																			
			
			
			$(".message").click(function(){
				console.log("here");
				$(".sendMessage").css("display", "block");

			});
			
			</script>
		<% } %>

</body>

</body>
</html>