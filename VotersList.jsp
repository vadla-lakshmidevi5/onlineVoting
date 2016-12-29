<%@page session = "true" %>
<%String user1 = (String)session.getAttribute("U");
if(user1 == null)
	response.sendRedirect("index.jsp?msg = Not logged in user,Login to continue&nm = rishika");
%>
<%@page import = "com.bvrit.Pojo.Login"%>
<%@page import = "com.bvrit.DAO.LoginDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <style>
       
    </style>    

</head>


        <body id="index" style="font-family:new century schoolbook;">
        <div class="container">
        <% 
        String user =session.getAttribute("U").toString();
        %>
        <div class="container header-container">
        <h1>Welcome <%=user %>!!!</h1>
        Please cast vote here!!!
        </div>
        <div class="container table-container">
        <table class="table table-border table-hover" id="table">
        <caption>Voters List</caption>  
        <thead>
        <tr>
        <th>Roll No.</th>
        <th>Name</th>
        </tr>
        </thead>  
        <%
        try {
        	LoginDAO cdao = new LoginDAO();
        	Collection<Login> VotersList= cdao.listVoters();
            Iterator<Login> itr = VotersList.iterator();  
        %>
         
        <tbody>
        <%
        //traversing elements of ArrayList object
	    while(itr.hasNext()) {  
  	        Login ct = (Login)itr.next();  
  	         
        %>
        
        <tr>
        <td><%=ct.id %></td>
        <td><%=ct.name %></td>
       
        <td> 
         <form method = "post" action = "incrementScore">     
        <input type = "submit" class="btn btn-primary buttons"  onclick= "return myfunction()" value="Cast Vote"></input>>
        <input type="hidden" name="id" value="<%=ct.id %>" >
        <input type="hidden" name="name" value="<%=ct.name %>">
        <input type="hidden" name="user" value= "<%=user %>" > 
        
        </form> 
        </td>
        </tr>
        <% } %>
        </tbody>
        </table>
        
        
        <%
        }catch(Exception e){
        	
        }
        %>
        <div class="buttons">
        <
        
        <a href="loginView.jsp" class="btn btn-primary">Logout</a>
        </div>
        </div>
       </div> 
       
    <script src="js/jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script>
        function myfunction(){
    	  if(confirm("Do You Want to Vote?"))
    	  {
    	  }
    	  else
    	  {
    	  return false;
    	  }
      }
    </script>
    </body>
</html>