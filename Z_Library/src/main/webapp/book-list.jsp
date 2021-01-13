<%@page import="java.util.Iterator"%>
<%@page import="com.cognixia.jump.model.Book"%>
<%@page import="java.util.ArrayList"%>
<%@ include file= "patronheader.jsp" %>
<center>
	<% ArrayList<Book> al = (ArrayList<Book>) request.getAttribute("allBooks"); %>
	<% Iterator<Book> iterator = al.iterator(); %>
	<% boolean flag = true; %><br>
	<h3>Books at the Library!</h3>
	<a class="btn btn-secondary" href="patronHome.jsp" role="button">Back to Home</a><br><br>
	
	<div class="table-box">
	<table id="BookTable" style="width:100%">
		<tr>
			<th class="searchResultHeader" style="width:10%">ISBN</th>
			<th class="searchResultHeader" style="width:25%"><div class="th-flair">Title</div></th>
			<th class="searchResultHeader" style="width:55%"><div class="th-flair">Description</div></th>
			<% if ((int) request.getAttribute("canCheckout") == 1) { %>
			<th class="searchResultHeader" style="width:10%"><div class="th-flair">Checkout</div>
			<% } %>
		</tr>
		<% while(iterator.hasNext()) {  %>
			<% String clickable = flag ? "2" : "1";
				flag = !flag;
			%>
			<tr class="outerResult<%=clickable%>">
				<% Book book = iterator.next(); %>
			<td>
				<%= book.getIsbn() %>
			</td>
			<td>
				<%= book.getTitle() %>
			</td>
			<td>
				<%= book.getDescr() %>
			</td>
			
			<% if((int) request.getAttribute("canCheckout") == 1) {  %>
			<td>
				<a class="btn btn-success btn-sm" href="<%= request.getContextPath() %>/checkout?action=post&id=<%=patron.getPatId() %>&isbn=<%=book.getIsbn() %>" role="button">Checkout</a><br>
			</td>
				<% } %>
	
			</tr>
			<% } %>
	</table>
	</div>

</center>

<%@ include file= "footer.jsp" %>