<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method="post" action="addProduct">
            <center>
            <table border="1" width="30%" cellpadding="5" bgcolor="pink">
                <thead>
                    <tr>
                        <th colspan="2">Add a product to sell</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Title</td>
                        <td><input type="text" name="title" value="" /></td>
                    </tr>
                    
                    <tr>
                        <td>Description</td>
                        <td><input type="text" name="description" value="" /></td>
                    </tr>
                    
                    <tr>
                        <td>Price</td>
                        <td><input type="number" name="price" value="" /></td>
                    </tr>
                                        
                    <tr>
                        <td>Condition</td>
                        <td><input type="text" name="condition" value="" /></td>
                    </tr>
                    
                    <tr>
                    	<td><input type="reset" value="Reset" /></td>
                        <td><input type="submit" value="Submit" /></td>                        
                    </tr>

                </tbody>
            </table>
            </center>
        </form>
</body>
</html>