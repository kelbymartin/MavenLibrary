<%@ include file= "librarianheader.jsp" %>

<div class="container">

	<form action="LibrarianServlet" method="POST">
		<fieldset>
			<legend>Update Username</legend>
			
			<input type="hidden" id="met" name="met" value="userC">
			<input type="hidden" id="id" name="id" value="<%= librarian.getLibId() %>">
 			<div class="form-row">
 				<div class="col-3">
					<label for="username">New Username:</label>
					<input type="text" class="form-control" id="username" name="username" required><br>
 				</div>
 			</div>
 			
  			<div class="form-row">
				<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Update</button>
				<a class="btn btn-outline-secondary my-2 my-sm-0" href="librarianHome.jsp" role="button" style="margin-left: 10px;">Cancel</a>
			</div>
		</fieldset>
	</form>

</div>

<%@ include file= "footer.jsp" %>
