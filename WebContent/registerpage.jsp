<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registration Page</title>
</head>
<body>
        <form method="post" action="register">
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
        </form>
    </body>
</html>