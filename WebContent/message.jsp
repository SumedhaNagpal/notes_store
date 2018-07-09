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
</head>
<body>
<div id = "main">
<%
	Date date = new Date();
	DateFormat dateFormat = new SimpleDateFormat("yyy/MM/dd HH:mm:ss");
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
<div>
	<form id = "inputMessage" action="sendMessage" method="POST">
    <input name="messageText" class="form-control" id="inputmessage" type="text" autocomplete="off"/>
	<input type="hidden" name ="toId" value="<%= request.getAttribute("toId")%>">
	<input type="hidden" name ="time" value="<%= dateFormat.format(date) %>"/>
    <button id="sendMessage" class="btn btn-success" value="" onclick="send()" /><i class="fa fa-paper-plane" aria-hidden="true"></i></button>
 	</form>
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
      console.log(mainDiv);
      var containerDiv = document.createElement('div');
      containerDiv.className = 'container';
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
      <%	 dateFormat = new SimpleDateFormat("yyy/MM/dd HH:mm:ss");
			 date = new Date();
		%>
      return false;
    }
   
    
  </script>
</body>
</html>