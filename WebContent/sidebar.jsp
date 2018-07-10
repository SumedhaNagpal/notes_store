
<!-- Sidebar/menu -->
<nav class="w3-sidebar w3-collapse w3-white w3-animate-left" style="z-index:3;width:300px;" id="mySidebar"><br>
  <div class="w3-container">
    <a href="#" onclick="w3_close()" class="w3-hide-large w3-right w3-jumbo w3-padding w3-hover-grey" title="close menu">
      <i class="fa fa-remove"></i>
    </a>
    <img src="data:image/png;base64,${user.base64Image}" style="width:45%;" class="w3-round"><br><br>
    
  <p class="w3-text-grey">Template by W3.CSS</p>
  </div>
  <div class="w3-bar-block">
    <a href='success.jsp?page=1' onclick="w3_close()" class="w3-bar-item w3-button w3-padding w3-text-teal"><i class="fa fa-th-large fa-fw w3-margin-right"></i>PORTFOLIO</a> 
    <a href="#about" onclick="w3_close()" class="w3-bar-item w3-button w3-padding"><i class="fa fa-user fa-fw w3-margin-right"></i>ABOUT</a> 
 	<a href='sell.jsp' class="w3-bar-item w3-button w3-padding"><i class="fa fa-plus fa-fw w3-margin-right" aria-hidden="true"></i> SELL NOTES AND BOOKS</a>	
 	<a href='myProducts' class="w3-bar-item w3-button w3-padding"><i class="fa fa-book fa-fw w3-margin-right" aria-hidden="true"></i> MY NOTES AND BOOKS</a>
 	<a href='showChats' class="w3-bar-item w3-button w3-padding"><i class="fa fa-envelope fa-fw w3-margin-right" aria-hidden="true"></i>MESSAGES</a>	
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