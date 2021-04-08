<%@ page  import="com.helper.FactoryProvider" %>
<%@ page  import="org.hibernate.Session" %>
<%@ page  import="org.hibernate.Transaction" %>
<%@ page  import="com.entities.Note" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="all.jsp"%>
<meta charset="ISO-8859-1">
<title>Edit Page</title>
</head>
<body>
	<%@ include file="navbar.jsp"%>

	<%
	int noteId = Integer.parseInt(request.getParameter("note_id").trim());
	Session s = FactoryProvider.getFactory().openSession();
	Transaction tx = s.beginTransaction();
	Note note = (Note)s.get(Note.class,noteId);
	%>
	<br>
	<div class="container col-md-6 offset-md-3 border rounded border-sucess p-3 bbg" >
		<form action="UpdateServlet" method="post">
		<input value="<%=note.getId()%>" name="id" type="hidden" />
			<div class="form-group">
				<label for="title">Note Title</label> <input  required="required"  name="title"
					type="text" class="form-control bgb" id="title"
					 placeholder="Enter note title"
					 value="<%=note.getTitle()%>"
					 />
			</div>
			<div class="form-group">
				<label for="content">Description </label> 
				<textarea id="content" name="content" placeholder="Enter note details here..." class="form-control bgb" style="height: 250px"
				
				> <%=note.getContent()%></textarea>
			</div>

			<div class="text-center">
				<button type="submit" class="btn btn-success">Update</button>
			</div>
		</form>
	</div>
	
	
	
	
	<% 
	tx.commit();
	s.close();
	%>

</body>
</html>