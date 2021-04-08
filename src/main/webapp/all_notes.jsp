<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.helper.FactoryProvider"%>
<%@ page import="org.hibernate.*"%>
<%@ page import="java.util.*,java.text.SimpleDateFormat"%>
<%@ page import="com.entities.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@ include file="all.jsp"%>
<title>All notes | NoteTaker</title>
</head>
<body class="bgb">
	<%@include file="navbar.jsp"%>
	<br>
	<div class="container bbg rounded">
		<h1 class="text-uppercase">All notes:</h1>
		<div class="row">
			<div class="col-12">

				<%
				Session s = FactoryProvider.getFactory().openSession();
				Transaction tr = s.beginTransaction();
				Criteria cr = s.createCriteria(Note.class);
				java.util.List<Note> list = cr.list();
				for (Note n : list) {
				%>
				<div class="card mt-3 bgb" >
					
					<div class="card-body">
						
						<h5 class="card-title"><span><img class="card-img-top p-1" src="img/notes.png" style="width:4rem" alt="Card image cap">
					</span><%=n.getTitle() %></h5>
					<%
					 SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");  
				    String strDate= formatter.format(n.getAddedDate());  
					%>
					 <span class="font-italic">Added Date: <%=strDate%></span>
						<hr>
						<h6>Note Details: </h6>
						<p class="card-text"><%=n.getContent() %></p><hr>
						<div class="text-center">
						<a href="DeleteServlet?note_id=<%=n.getId() %>" class="btn btn-danger">Delete</a>
						<a href="edit.jsp?note_id=<%=n.getId() %>" class="btn btn-success">Update</a></div>
					</div>
				</div>

				<%
				}
				s.close();
				%>
			</div>
		</div>
	</div>
</body>
</html>