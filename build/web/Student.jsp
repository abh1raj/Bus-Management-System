<%-- 
    Document   : Student
    Created on : 6 Mar, 2019, 12:59:01 AM
    Author     : Abhiraj
--%>

<%@page import="java.util.Iterator"%>
<%@page import="Model.schedules"%>
<%@page import="org.hibernate.*"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Student/Faculty</title>
	<link rel="stylesheet" href="CSS/bootstrap.min.css">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="stylesheet" type="text/css" href="CSS/homeBoot.css">
</head>
<body>


<nav class="navbar navbar-expand-lg bg-dark justify-content-between ">

	<div class="navbar-nav ">

	<a class="navbar-brand text-white ">Welcome User!</a>
	
		<a class="nav-item nav-link text-white mx-2" href="Home.html">Home</a>
		<a class="nav-item nav-link text-white mx-2" href="About.html">About</a>
                <a class="nav-item nav-link text-white mx-2" href="Search.jsp">Search</a>

	</div>

	<a type="button"  class="btn btn-outline-light" href="Home.html" >Logout</a>


</nav>

<div class="container text-center text-white display-3 p-2 mt-3">Schedules</div>
<div class="container text-center text-white border border-light">
	<table class="table stripped-table">
		<thead class="h4 text-warning">
			<tr>
				<th>Bus Number</th>
				<th>Bus Route</th>
				<th>Drop Point</th>
				<th>Pickup Point</th>
				<th>Time</th>
			</tr>
			
		</thead>
		 <% 
                    String number,pick,drop,route,time;
                    Configuration cf = null;
                    SessionFactory sf = null;
                    Session s = null;
                    schedules sch = null;
                    try{
                        cf = new Configuration();
                        cf.configure();
                        sf = cf.buildSessionFactory();
                        s = sf.openSession();
                        Query q = s.createQuery("from schedules");
                        Iterator it = q.iterate();
                        while (it.hasNext()){
                            
                            sch = (schedules)it.next();
                            number = sch.getNumber();
                            pick = sch.getPickupp();
                            drop = sch.getDropp();
                            route = sch.getRoute();
                            time = sch.getTime();
                            System.out.println(number);
                            
                %>        
                
			<tr>
                            <td><%=number%></td>
                            <td><%=route%></td>
                            <td><%=drop%></td>
                            <td><%=pick%></td>
                            <td><%=time%></td>

			</tr>
                        
                        <%
                            }
                    }catch(Exception e){
                        e.printStackTrace();
                    }
                    
                %>
			
		</tbody>
	</table>
</div>
<!--
</div>-->



<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

</body>
</html>
