<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*, java.util.*, javax.servlet.*"  %>
<%@ page import="model.Product" %>
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
					<!-- Sidebar/menu -->
			<nav class="w3-sidebar w3-collapse w3-white w3-animate-left" style="z-index:3;width:300px;" id="mySidebar"><br>
			  <div class="w3-container">
			    <a href="#" onclick="w3_close()" class="w3-hide-large w3-right w3-jumbo w3-padding w3-hover-grey" title="close menu">
			      <i class="fa fa-remove"></i>
			    </a>
			    <img src="/w3images/avatar_g2.jpg" style="width:45%;" class="w3-round"><br><br>
			    <h4><b>PORTFOLIO</b></h4>
			    <p class="w3-text-grey">Template by W3.CSS</p>
			  </div>
			  <div class="w3-bar-block">
			    <a href="#portfolio" onclick="w3_close()" class="w3-bar-item w3-button w3-padding w3-text-teal"><i class="fa fa-th-large fa-fw w3-margin-right"></i>PORTFOLIO</a> 
			    <a href="#about" onclick="w3_close()" class="w3-bar-item w3-button w3-padding"><i class="fa fa-user fa-fw w3-margin-right"></i>ABOUT</a> 
			   <!-- <a href="#contact" onclick="w3_close()" class="w3-bar-item w3-button w3-padding"><i class="fa fa-envelope fa-fw w3-margin-right"></i>CONTACT</a>--> 
			 	<a href='sell.jsp' class="w3-bar-item w3-button w3-padding"><i class="fa fa-plus fa-fw w3-margin-right" aria-hidden="true"></i> SELL NOTES AND BOOKS</a>
			 	<a href='logout' class="w3-bar-item w3-button w3-padding"><i class="fa fa-sign-out fa-fw w3-margin-right" aria-hidden="true"></i>LOG OUT</a>	
			  </div>
			  <div class="w3-panel w3-large">
			    <i class="fa fa-facebook-official w3-hover-opacity"></i>
			    <i class="fa fa-instagram w3-hover-opacity"></i>
			    <i class="fa fa-snapchat w3-hover-opacity"></i>
			    <i class="fa fa-pinterest-p w3-hover-opacity"></i>
			    <i class="fa fa-twitter w3-hover-opacity"></i>
			    <i class="fa fa-linkedin w3-hover-opacity"></i>
			  </div>
			</nav>
			
			<!-- Overlay effect when opening sidebar on small screens -->
			<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>
			
			<!-- !PAGE CONTENT! -->
			<div class="w3-main" style="margin-left:300px">
			
			  <!-- Header -->
			  <header id="portfolio">
			    <a href="#"><img src="/w3images/avatar_g2.jpg" style="width:65px;" class="w3-circle w3-right w3-margin w3-hide-large w3-hover-opacity"></a>
			    <span class="w3-button w3-hide-large w3-xxlarge w3-hover-text-grey" onclick="w3_open()"><i class="fa fa-bars"></i></span>
			    <div class="w3-container">
			    <h1><b>My Portfolio</b></h1>
			    <div class="w3-section w3-bottombar w3-padding-16">
			      <span class="w3-margin-right">Filter:</span> 
			      <button class="w3-button w3-black">ALL</button>
			      <button class="w3-button w3-white"><i class="fa fa-diamond w3-margin-right"></i>Design</button>
			      <button class="w3-button w3-white w3-hide-small"><i class="fa fa-photo w3-margin-right"></i>Photos</button>
			      <button class="w3-button w3-white w3-hide-small"><i class="fa fa-map-pin w3-margin-right"></i>Art</button>
			    </div>
			    </div>
			  </header>
			  
			  <!-- First Photo Grid-->
			  <div class="w3-row-padding" style="text-align: center">
			    <%
			    	ArrayList<Product> productList = new ArrayList<Product>();
			    	productList = (ArrayList)session.getAttribute("product list");
			    	for(int i = 0; i < productList.size() && i < 3; i++){
			    		Product product = productList.get(i);
		   		 %>
			    <div class="w3-third w3-container w3-margin-bottom">
			      <img src="http://via.placeholder.com/350x150" alt="Norway" style="width:100%" class="w3-hover-opacity">
			      <div class="w3-container w3-white">
			        <p><b><%= product.getTitle() %></b></p>
			        <p><b> ₹ <%= product.getPrice() %></b></p>
			        <div style="margin-bottom: 24px"><button type="button class" class="btn btn-info btn-lg" data-toggle="modal" data-target="#product_<%= product.getProduct_id()%>">View Details</button></div>

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
					        	<img src="http://via.placeholder.com/350x150" alt="Norway" style="width:100%" class="w3-hover-opacity">
								<div>
									<h4>DESCRIPTION</h4>
									<p><%= product.getDescription() %></p>
									<h4>PRODUCT CONDITION</h4>
									<p><%= product.getProductCondition() %></p>
									<h4>POSTED BY</h4>
									<p><%= product.getUser_name() %></p>
									<h4>PRICE</h4>
									<p>₹ <%= product.getPrice() %></p>
								</div>
								<button type="button" class ="btn btn-warning">BUY <i class="fa fa-shopping-cart" aria-hidden="true"></i></button>
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
			    <% } %>
			  </div>
			  
			  <!-- Second Photo Grid-->
			  <%
			    	for(int i = 2; i < productList.size() && i < 6; i++){
			    		Product product = productList.get(i);
		   	   %>
			  <div class="w3-row-padding">
			    <div class="w3-third w3-container w3-margin-bottom">
			      <img src="http://via.placeholder.com/350x150" alt="Norway" style="width:100%" class="w3-hover-opacity">
			      <div class="w3-container w3-white">
			        <p><b><%= product.getTitle() %></b></p>
			        <p><%= product.getDescription() %></p>
			        <p><b> ₹ <%= product.getPrice() %></b></p>
			      </div>
			    </div>
			  </div>
			  <% } %> 
			  
			
			  <!-- Pagination -->
			  <div class="w3-center w3-padding-32">
			    <div class="w3-bar">
			      <a href="#" class="w3-bar-item w3-button w3-hover-black">«</a>
			      <a href="#" class="w3-bar-item w3-black w3-button">1</a>
			      <a href="#" class="w3-bar-item w3-button w3-hover-black">2</a>
			      <a href="#" class="w3-bar-item w3-button w3-hover-black">3</a>
			      <a href="#" class="w3-bar-item w3-button w3-hover-black">4</a>
			      <a href="#" class="w3-bar-item w3-button w3-hover-black">»</a>
			    </div>
			  </div>
			
			  <!-- Images of Me -->
			  <div class="w3-row-padding w3-padding-16" id="about">
			    <div class="w3-col m6">
			      <img src="/w3images/avatar_g.jpg" alt="Me" style="width:100%">
			    </div>
			    <div class="w3-col m6">
			      <img src="/w3images/me2.jpg" alt="Me" style="width:100%">
			    </div>
			  </div>
			
			  <div class="w3-container w3-padding-large" style="margin-bottom:32px">
			    <h4><b>About Me</b></h4>
			    <p>Just me, myself and I, exploring the universe of unknownment. I have a heart of love and an interest of lorem ipsum and mauris neque quam blog. I want to share my world with you. Praesent tincidunt sed tellus ut rutrum. Sed vitae justo condimentum, porta lectus vitae, ultricies congue gravida diam non fringilla. Praesent tincidunt sed tellus ut rutrum. Sed vitae justo condimentum, porta lectus vitae, ultricies congue gravida diam non fringilla.</p>
			    <hr>
			    
			    <h4>Technical Skills</h4>
			    <!-- Progress bars / Skills -->
			    <p>Photography</p>
			    <div class="w3-grey">
			      <div class="w3-container w3-dark-grey w3-padding w3-center" style="width:95%">95%</div>
			    </div>
			    <p>Web Design</p>
			    <div class="w3-grey">
			      <div class="w3-container w3-dark-grey w3-padding w3-center" style="width:85%">85%</div>
			    </div>
			    <p>Photoshop</p>
			    <div class="w3-grey">
			      <div class="w3-container w3-dark-grey w3-padding w3-center" style="width:80%">80%</div>
			    </div>
			    <p>
			      <button class="w3-button w3-dark-grey w3-padding-large w3-margin-top w3-margin-bottom">
			        <i class="fa fa-download w3-margin-right"></i>Download Resume
			      </button>
			    </p>
			    <hr>
			    
			    <h4>How much I charge</h4>
			    <!-- Pricing Tables -->
			    <div class="w3-row-padding" style="margin:0 -16px">
			      <div class="w3-third w3-margin-bottom">
			        <ul class="w3-ul w3-border w3-white w3-center w3-opacity w3-hover-opacity-off">
			          <li class="w3-black w3-xlarge w3-padding-32">Basic</li>
			          <li class="w3-padding-16">Web Design</li>
			          <li class="w3-padding-16">Photography</li>
			          <li class="w3-padding-16">1GB Storage</li>
			          <li class="w3-padding-16">Mail Support</li>
			          <li class="w3-padding-16">
			            <h2>$ 10</h2>
			            <span class="w3-opacity">per month</span>
			          </li>
			          <li class="w3-light-grey w3-padding-24">
			            <button class="w3-button w3-teal w3-padding-large w3-hover-black">Sign Up</button>
			          </li>
			        </ul>
			      </div>
			      
			      <div class="w3-third w3-margin-bottom">
			        <ul class="w3-ul w3-border w3-white w3-center w3-opacity w3-hover-opacity-off">
			          <li class="w3-teal w3-xlarge w3-padding-32">Pro</li>
			          <li class="w3-padding-16">Web Design</li>
			          <li class="w3-padding-16">Photography</li>
			          <li class="w3-padding-16">50GB Storage</li>
			          <li class="w3-padding-16">Endless Support</li>
			          <li class="w3-padding-16">
			            <h2>$ 25</h2>
			            <span class="w3-opacity">per month</span>
			          </li>
			          <li class="w3-light-grey w3-padding-24">
			            <button class="w3-button w3-teal w3-padding-large w3-hover-black">Sign Up</button>
			          </li>
			        </ul>
			      </div>
			      
			      <div class="w3-third">
			        <ul class="w3-ul w3-border w3-white w3-center w3-opacity w3-hover-opacity-off">
			          <li class="w3-black w3-xlarge w3-padding-32">Premium</li>
			          <li class="w3-padding-16">Web Design</li>
			          <li class="w3-padding-16">Photography</li>
			          <li class="w3-padding-16">Unlimited Storage</li>
			          <li class="w3-padding-16">Endless Support</li>
			          <li class="w3-padding-16">
			            <h2>$ 25</h2>
			            <span class="w3-opacity">per month</span>
			          </li>
			          <li class="w3-light-grey w3-padding-24">
			            <button class="w3-button w3-teal w3-padding-large w3-hover-black">Sign Up</button>
			          </li>
			        </ul>
			      </div>
			    </div>
			  </div>
			  
			  <!-- Contact Section -->
			  <div class="w3-container w3-padding-large w3-grey">
			    <h4 id="contact"><b>Contact Me</b></h4>
			    <div class="w3-row-padding w3-center w3-padding-24" style="margin:0 -16px">
			      <div class="w3-third w3-dark-grey">
			        <p><i class="fa fa-envelope w3-xxlarge w3-text-light-grey"></i></p>
			        <p>email@email.com</p>
			      </div>
			      <div class="w3-third w3-teal">
			        <p><i class="fa fa-map-marker w3-xxlarge w3-text-light-grey"></i></p>
			        <p>Chicago, US</p>
			      </div>
			      <div class="w3-third w3-dark-grey">
			        <p><i class="fa fa-phone w3-xxlarge w3-text-light-grey"></i></p>
			        <p>512312311</p>
			      </div>
			    </div>
			    <hr class="w3-opacity">
			    <form action="/action_page.php" target="_blank">
			      <div class="w3-section">
			        <label>Name</label>
			        <input class="w3-input w3-border" type="text" name="Name" required>
			      </div>
			      <div class="w3-section">
			        <label>Email</label>
			        <input class="w3-input w3-border" type="text" name="Email" required>
			      </div>
			      <div class="w3-section">
			        <label>Message</label>
			        <input class="w3-input w3-border" type="text" name="Message" required>
			      </div>
			      <button type="submit" class="w3-button w3-black w3-margin-bottom"><i class="fa fa-paper-plane w3-margin-right"></i>Send Message</button>
			    </form>
			  </div>
			
			  <!-- Footer -->
			  <footer class="w3-container w3-padding-32 w3-dark-grey">
			  <div class="w3-row-padding">
			    <div class="w3-third">
			      <h3>FOOTER</h3>
			      <p>Praesent tincidunt sed tellus ut rutrum. Sed vitae justo condimentum, porta lectus vitae, ultricies congue gravida diam non fringilla.</p>
			      <p>Powered by <a href="https://www.w3schools.com/w3css/default.asp" target="_blank">w3.css</a></p>
			    </div>
			  
			    <div class="w3-third">
			      <h3>BLOG POSTS</h3>
			      <ul class="w3-ul w3-hoverable">
			        <li class="w3-padding-16">
			          <img src="/w3images/workshop.jpg" class="w3-left w3-margin-right" style="width:50px">
			          <span class="w3-large">Lorem</span><br>
			          <span>Sed mattis nunc</span>
			        </li>
			        <li class="w3-padding-16">
			          <img src="/w3images/gondol.jpg" class="w3-left w3-margin-right" style="width:50px">
			          <span class="w3-large">Ipsum</span><br>
			          <span>Praes tinci sed</span>
			        </li> 
			      </ul>
			    </div>
			
			    <div class="w3-third">
			      <h3>POPULAR TAGS</h3>
			      <p>
			        <span class="w3-tag w3-black w3-margin-bottom">Travel</span> <span class="w3-tag w3-grey w3-small w3-margin-bottom">New York</span> <span class="w3-tag w3-grey w3-small w3-margin-bottom">London</span>
			        <span class="w3-tag w3-grey w3-small w3-margin-bottom">IKEA</span> <span class="w3-tag w3-grey w3-small w3-margin-bottom">NORWAY</span> <span class="w3-tag w3-grey w3-small w3-margin-bottom">DIY</span>
			        <span class="w3-tag w3-grey w3-small w3-margin-bottom">Ideas</span> <span class="w3-tag w3-grey w3-small w3-margin-bottom">Baby</span> <span class="w3-tag w3-grey w3-small w3-margin-bottom">Family</span>
			        <span class="w3-tag w3-grey w3-small w3-margin-bottom">News</span> <span class="w3-tag w3-grey w3-small w3-margin-bottom">Clothing</span> <span class="w3-tag w3-grey w3-small w3-margin-bottom">Shopping</span>
			        <span class="w3-tag w3-grey w3-small w3-margin-bottom">Sports</span> <span class="w3-tag w3-grey w3-small w3-margin-bottom">Games</span>
			      </p>
			    </div>
			
			  </div>
			  </footer>
			  
			  <div class="w3-black w3-center w3-padding-24">Powered by <a href="https://www.w3schools.com/w3css/default.asp" title="W3.CSS" target="_blank" class="w3-hover-opacity">w3.css</a></div>
			
			<!-- End page content -->
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
			</script>
		<% } %>

</body>

</body>
</html>