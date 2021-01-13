<%@ include file= "patronheader.jsp" %>

<div class="container">

	<form action="PatronServlet" method="POST">
		<fieldset>
			<legend>Update Name</legend>
			
			<input type="hidden" id="met" name="met" value="other">
			<input type="hidden" id="ch" name="ch" value="nameC">
			<input type="hidden" id="id" name="id" value="<%= patron.getPatId() %>">
 			<div class="form-row">
 				<div class="col-3">
					<label for="fname">New First Name:</label>
					<input type="text" class="form-control" id="fname" name="fname" value="<%= patron.getfName() %>" required><br>
 				</div>
 			</div>
 			<div class="form-row">
 				<div class="col-3">
					<label for="lname">New Last Name:</label>
					<input type="text" class="form-control" id="lname" name="lname" value="<%= patron.getlName() %>" required><br>
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
