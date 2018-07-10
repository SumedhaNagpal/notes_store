<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*, java.util.*, javax.servlet.*"  %>
<%@ page import="model.Message" %>
<%@ page import="java.util.Date, java.text.DateFormat, java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
<title>Chat</title>
<link rel="stylesheet" href="css/message.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>
<div id = "main">
<%	String messageText = (String) request.getAttribute("message text");
	if(messageText != null){
%>
	<div class="container">
  		<p id="messages"><%= messageText %></p>
	</div> 
<% }
	ArrayList<Message> messageList = new ArrayList<Message>();
 	messageList = (ArrayList)request.getAttribute("message list");
 	for(int i = 0; i < messageList.size(); i++){
 		Message message = messageList.get(i);
 		if(session.getAttribute("user_id").equals(message.getFromId())){
 %>
 	<div class="container">
  		<p id="messages"><%= message.getMessageText() %></p>
	</div>  
	<%	}else{ %>
		<div class="container darker">
  		<p id="messages"><%= message.getMessageText() %></p>
	</div>  
	<%} %>
<%  } %>
</div>
<div id="sendMessageDisplay">
   <input name="messageText" class="form-control" id="inputmessage" type="text" autocomplete="off"/>
   <button id="sendMessage" class="btn btn-success" value="" onclick="send()" /><i class="fa fa-paper-plane" aria-hidden="true"></i></button>
 </div>
 <script>window.scrollTo(0,document.body.scrollHeight);</script>
 
  <script type="text/javascript">
    var webSocket = 
      new WebSocket('ws://localhost:8080/NotesStore/websocket/' + '<%= (String)request.getAttribute("roomId")%>');
	
    webSocket.onerror = function(event) {
      onError(event)
    };

    webSocket.onopen = function(event) {
      onOpen(event)
    };

    webSocket.onmessage = function(event) {
      onMessage(event)
    };

    function onMessage(event) {
      //document.getElementById('messages').innerHTML 
      //  += '<br />Received message: ' + event.data;
      var mainDiv = document.getElementById("main");
      var containerDiv = document.createElement('div');
      containerDiv.className = 'container darker';
      mainDiv.appendChild(containerDiv);
      
      var messagePara = document.createElement('p');
      messagePara.id = 'messages';
      messagePara.innerHTML = event.data;
      containerDiv.appendChild(messagePara);
    }

    function onOpen(event) {
    	//console.log(event)
     // document.getElementById('messages').innerHTML 
     //   = 'Connection established';
    }

    function onError(event) {
      alert(event.data);
    }

    function send() {
      var txt = document.getElementById('inputmessage').value;
      webSocket.send(txt);
      
      var mainDiv = document.getElementById("main");
      var containerDiv = document.createElement('div');
      containerDiv.className = 'container';
      
      var messagePara = document.createElement('p');
      messagePara.id = 'messages';
      messagePara.innerHTML = txt;
      containerDiv.appendChild(messagePara);
     
      mainDiv.appendChild(containerDiv);
      
      <%	 DateFormat dateFormat = new SimpleDateFormat("yyy/MM/dd HH:mm:ss");
			 Date date = new Date();
		%>
		$.ajax({
            url: 'sendMessage',
            type: 'POST',
            data: {
            	messageText : txt,
            	time: '<%= dateFormat.format(date) %>',
            	toId: '<%= request.getAttribute("toId")%>'
            },             
        });
      return false;
    }
    
   
    
  </script>
</body>
</html>