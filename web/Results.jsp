
<%@page import="java.util.*"%>
<%@page import="Model.schedules"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
	<title>Search Results</title>
	<link rel="stylesheet" href="CSS/bootstrap.min.css">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="stylesheet" type="text/css" href="CSS/homeBoot.css">
</head>

<body>


<nav class="navbar navbar-expand-lg bg-dark justify-content-between ">

	<div class="navbar-nav ">

	<a class="navbar-brand text-white ">Search Results</a>
	
		<a class="nav-item nav-link text-white mx-2" href="Home.html">Home</a>
		<a class="nav-item nav-link text-white mx-2" href="AddS.jsp" >Add Schedule</a>
		<a class="nav-item nav-link text-white mx-2" href="DelS.jsp" >Delete Schedule</a>
		<a class="nav-item nav-link text-white mx-2" href="EditS.html" >Edit Schedule</a>
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
                        List<schedules> list = (List)request.getAttribute("res");
                        Iterator<schedules> it = list.iterator();
                        while(it.hasNext()){
                            schedules s = it.next();
                    %>        
                    <tr>
                        <td><%=s.getNumber()%></td>
                        <td><%=s.getRoute()%></td>
                        <td><%=s.getDropp()%></td>
                        <td><%=s.getPickupp()%></td>
                        <td><%=s.getTime()%></td>
                        <td></td>
                    </tr>
                    <%  
                        }
                    %>
                    <tr>
                        
                    </tr>
			
		</tbody>
	</table>
</div>
