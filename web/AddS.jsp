<%-- 
    Document   : AddS
    Created on : 13 Mar, 2019, 3:31:57 PM
    Author     : Abhiraj
--%>

<%@page import="Controller.Display"%>
<%@page import="java.util.*"%>
<%@page import="Model.schedules"%>
<%@page import="org.hibernate.*"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>ADD</title>
	<link rel="stylesheet" href="CSS/bootstrap.min.css" >
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="stylesheet" type="text/css" href="CSS/homeBoot.css">
</head>
<body>


<nav class="navbar navbar-expand-lg bg-dark justify-content-between ">

	<div class="navbar-nav ">

	<a class="navbar-brand text-white ">Welcome Admin</a>
	
		<a class="nav-item nav-link text-white mx-2" href="Home.html">Home</a>
		<a class="nav-item nav-link text-white mx-2" href="DelS.jsp" >Delete Schedule</a>
		<a class="nav-item nav-link text-white mx-2" href="Update.jsp" >Edit Schedule</a>
                <a class="nav-item nav-link text-white mx-2" href="Admin.jsp">Search</a>
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
		<tbody>
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

<div class="container display-4 my-3 p-3 text-white text-center">Add Schedule</div>

<div class="jumbotron p-3 mt-4">
	<form class="form-inline" action="Add">
		<div class="form-group mx-1">
			<label for="busno" class="lead">Bus Number</label>
			<input type="text" name="busno" class="form-control" placeholder="Bus Number">
		</div>

		<div class="form-group mx-1">
			<label for="route" class="lead">Route</label>
			<input type="text" name="route" class="form-control" placeholder="Route">
		</div>

		<div class="form-group mx-1">
			<label for="dp" class="lead">Drop Point</label>
			<input type="text" name="dp" class="form-control" placeholder="Drop Point">
		</div>

		<div class="form-group mx-1">
			<label for="pp" class="lead">Pickup Point</label>
			<input type="text" name="pp" class="form-control" placeholder="Pickup Point">
		</div>

		<div class="form-group mx-1">
			<label for="time" class="lead">Time</label>
			<input type="text" name="time" class="form-control" placeholder="Time">
		</div>

		<div class="col text-center mt-3">
			<button class="btn btn-outline-dark" type="submit">Confirm</button>
		</div>
	</form>
</div>



<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>

<script src="JS/bootstrap.min.js"></script>

</body>
</html>