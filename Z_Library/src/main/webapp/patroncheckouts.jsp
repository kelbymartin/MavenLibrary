<%@page import="com.cognixia.jump.dao.BookDAO"%>
<%@page import="com.cognixia.jump.model.BookCheckout"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.cognixia.jump.model.Book"%>
<%@page import="java.util.ArrayList"%>
<%@ include file= "patronheader.jsp" %>

<center>

	<% ArrayList<BookCheckout> bk = (ArrayList<BookCheckout>) request.getAttribute("checkedOut"); %>
	<% Iterator<BookCheckout> bkiter = bk.iterator(); %>
	<% boolean flag = true; %><br>

	<h3>Your Books</h3>
	<a class="btn btn-secondary" href="patronHome.jsp" role="button">Back to Home</a><br><br>


	<div class="table-box">
	<table id="CheckoutTable" style="width:100%">
		<tr>
			<th class="searchResultHeader" style="width:10%">ISBN</th>
			<th class="searchResultHeader" style="width:15%"><div class="th-flair">Title</div></th>
			<th class="searchResultHeader" style="width:48%"><div class="th-flair">Description</div></th>
			<th class="searchResultHeader" style="width:10%"><div class="th-flair">Checkout Date</div></th>
			<th class="searchResultHeader" style="width:10%"><div class="th-flair">Due Date</div></th>
			<th class="searchResultHeader" style="width:7%"><div class="th-flair">Return</div>
		</tr>
		
		<% while(bkiter.hasNext()) {  %>
			<% BookCheckout checkout = bkiter.next(); %>
			<% BookDAO bdao = new BookDAO(); Book book = bdao.getBookByISBN(checkout.getIsbn()); %>
			<% String clickable = flag ? "2" : "1";
				flag = !flag;
			%>
			<tr class="outerResult<%=clickable%>">
			<td>
				<%= checkout.getIsbn() %>
			</td>
			<td>
				<%= book.getTitle() %>
			</td>
			<td>
				<%= book.getDescr() %>
			</td>
			<td>
				<%= checkout.getCheckedOut() %>
			</td>
			<td>
				<%= checkout.getDueDate() %>
			</td>
			
			<% if(checkout.getReturned() == null) { %>
				<td>
					<a class="btn btn-danger btn-sm" href="<%= request.getContextPath() %>/return?action&checkoutid=<%=checkout.getCheckId() %>&id=<%=patron.getPatId() %>" role="button">Return</a>
				</td>
			<% } else { %>
				<td>
					<a class="btn btn-success btn-sm" href="#" role="button" aria-disabled="true">Returned</a>
				</td>
			<% } %>
			</tr>
			<% } %>
	</table>
	</div>

</center>

<%@ include file= "footer.jsp" %>