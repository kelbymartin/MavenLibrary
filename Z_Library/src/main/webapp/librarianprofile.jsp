<%@ include file= "librarianheader.jsp" %>

<div class="container">

	<h1>Librarian: <em><%=librarian.getUser() %></em></h1>

 	<div class="btn-group-vertical">
		<a class="btn btn-dark" href="updatelibrarianusername.jsp" role="button">Change Username</a>
		<a class="btn btn-dark" href="updatelibrarianpassword.jsp" role="button">Change Password</a>
		<a class="btn btn-dark" href="<%= request.getContextPath() %>" role="button">Logout</a>
	</div>

</div>

<%@ include file= "footer.jsp" %>