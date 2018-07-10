<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*, java.util.*, javax.servlet.*"  %>
<%@ page import="model.Message" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Chats</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/chatList.css">
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
    	
    	<header>
			    <div class="w3-container">
			    <h1><b>Recent Chats</b></h1>
			    <div class="w3-section w3-bottombar w3-padding-16">
			    </div>
	    </header>
	    
	     <div  border="1" width="30%" cellpadding="5" bgcolor="pink">
                	 <%
                	 ArrayList<Message> chatList = new ArrayList<Message>();	
                	 chatList = (ArrayList<Message>)session.getAttribute("chat list");
                	 if(chatList.size() != 0){	    		    	
					    	for(int i = 0; i < chatList.size() && i < 6; i++){
					    		Message chat = chatList.get(i);
				   		 %>
	                        <div class = "first">
						       	<img class="userImage" src="http://via.placeholder.com/150x150">
	                        	<div class="chatDetails">
	                        		<b> <%= chat.getToUserName() %> </b>
	                        	</div>
	                        	<form id="sendMessage"method="post" action="sendMessage" style="margin-top:6px;	">
						       			<input type="hidden" name ="toId" value="<%= chat.getToId()%>">
						       			<input type="hidden" name ="type" value="redirect"/>
						       			<input type="submit" value="Open Chat" class="btn btn-success" style="margin-top:6px">
						       	</form>
	                        </div>
	                    <% } 
                	 }
                	 else{
	                %>
	                <h3 style="text-align: center;">No recent chats!</h3>
	                <%} %>
	                    
          </div>
    	
    	<%} %>

</body>
</html>