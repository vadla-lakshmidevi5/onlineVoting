<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form method = "post" action = "SignUpUser">
Enter id<input type = "text" name = "id">
Enter Name<input type = "text" name = "name">
Enter Password<input type = "password" name = "password">
<input type = "submit" value = "SignUp"> 


</form>
<p>Message:${param.message}</p>
 <c:remove var="message" scope="session" />
  <a href = "SignUp.jsp" >Go Back</a>
</body>
</html>