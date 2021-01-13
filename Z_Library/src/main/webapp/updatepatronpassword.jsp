<%@ include file= "patronheader.jsp" %>

<div class="container">

	<form action="PatronServlet" method="POST">
		<fieldset>
			<legend>Update Password</legend>
			
			<input type="hidden" id="ch" name="ch" value="passC">
			<input type="hidden" id="id" name="id" value="<%= patron.getPatId() %>">
 			<div class="form-row">
 				<div class="col-3">
					<label for="password">New Password:</label>
					<input type="text" class="form-control" id="password" name="password" required><br>
 				</div>
 			</div>
 			
  			<div class="form-row">
				<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Update</button>
				<a class="btn btn-outline-secondary my-2 my-sm-0" href="patronHome.jsp" role="button" style="margin-left: 10px;">Cancel</a>
			</div>
		</fieldset>
	</form>

</div>

<%@ include file= "footer.jsp" %>