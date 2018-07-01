<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
  <head>
    <title>Register</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Site For Buying and Selling Books" />
    <meta name="keywords" content="Site For Buying and Selling Books" />
    <meta name="author" content="uicookies.com" />
    
    <link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="css/icomoon.css">
    <link rel="stylesheet" href="css/style.css">
  </head>
  <body>
  

  
  	 <div class = "modal" >
  <form  method="post" class="modal-content " action="register">
  
    <div class="container">
      <label for="first_name"><b>First Name</b></label>
      <input type="text" placeholder="Enter First Name" name="first_name" required>
      
      <label for="last_name"><b>Last Name</b></label>
      <input type="text" placeholder="Enter Last Name" name="last_name" required>

	   <label for="email"><b>Email</b></label>
      <input type="text" placeholder="Enter Email" name="email" required>
      
      <label for="password"><b>Password</b></label>
      <input type="password" placeholder="Enter Password" name="password" required>
      
      <label for="branch"><b>Branch</b></label>
      <select name="branch">
								<option>Computer Science</option>
								<option>Information Technology</option>
								<option>Mechanical</option>
								<option>Electronics and Communication</option>
							</select>
		
	<label for="current_year"><b>Current Year</b></label>
      <select name="current_year">
								<option>1</option>
								<option>2</option>
								<option>3</option>
								<option>4</option>
							</select>
							
		<label for="password_hash"><b>Password</b></label>
      <input type="password" placeholder="Enter Password" name="password_hash" required>
							
      <button type="submit" value="Submit">Register</button>
    </div>
    
    <div class="container" style="background-color:#f1f1f1">
      <span>New User?<a href="registerpage.jsp">Register Here</a></span>
    </div>

  </form>
  
 </div> 
    
       <!--  <form method="post" action="register">
            <center>
            <table border="1" width="30%" cellpadding="5" bgcolor="pink">
                <thead>
                    <tr>
                        <th colspan="2">Registration Page</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>First Name</td>
                        <td><input type="text" name="first_name" value="" /></td>
                    </tr>
                    <tr>
                        <td>Last Name</td>
                        <td><input type="text" name="last_name" value="" /></td>
                    </tr>
                    <tr>
                        <td>Email</td>
                        <td><input type="text" name="email" value="" /></td>
                    </tr>
                    <tr>
                        <td>Branch</td>
                        <td>
                        	<select name="branch">
								<option>Computer Science</option>
								<option>Information Technology</option>
								<option>Mechanical</option>
								<option>Electronics and Communication</option>
							</select>
                        </td>
                    </tr>
                    <tr>
                        <td>Year</td>
                        <td>
                        	<select name="current_year">
								<option>1</option>
								<option>2</option>
								<option>3</option>
								<option>4</option>
							</select>
                        </td>
                    </tr>
                    <tr>
                        <td>Password</td>
                        <td><input type="password" name="password_hash" value="" /></td>
                    </tr>
                    <tr>
                        <td><input type="submit" value="Submit" /></td>
                        <td><input type="reset" value="Reset" /></td>
                    </tr>
                    <tr>
                        <td colspan="2">Already registered?<a href="index.jsp">Login Here</a></td>
                    </tr>
                </tbody>
            </table>
            </center>
        </form> -->
        
        <br>
        <br><br>
       
       <footer class="probootstrap-footer">
      <div class="container">
          <div class="col-md text-md-right text-left">
            <p><small>&copy; Unlock 2017. All Rights Reserved. <br> Made with <span class="icon-heart"></span> by <a href="https://uicookies.com/">uiCookies</a> Demo Images: Unsplash</small></p>
          </div>
        </div>
    </footer>
        
      <script src="js/jquery-3.2.1.slim.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/main.js"></script>
  </body>
  
</html>