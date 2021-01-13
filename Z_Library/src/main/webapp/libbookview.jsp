<%@page import="com.cognixia.jump.dao.BookDAO"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.cognixia.jump.model.Book"%>
<%@page import="java.util.ArrayList"%>
<%@ include file= "librarianheader.jsp" %>
<center>
	<% BookDAO bookDAO = new BookDAO(); %>
	<% ArrayList<Book> al = (ArrayList) bookDAO.getAllBooks(false); %>
	<% Iterator<Book> iterator = al.iterator(); %>
	<% boolean flag = true; %><br>
	<h3>Books at the Library!</h3>
	<a class="btn btn-secondary" href="librarianHome.jsp" role="button">Back to Home</a><br><br>
	
	<div class="table-box">
	<table id="BookTable" style="width:100%">
		<tr>
			<th class="searchResultHeader" style="width:10%;">ISBN</th>
			<th class="searchResultHeader" style="width:25%;"><div class="th-flair">Title</div></th>
			<th class="searchResultHeader" style="width:55%;"><div class="th-flair">Description</div></th>
			<th class="searchResultHeader" style="width:10%; text-align: center;"><div class="th-flair">Status</div>
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
			<% if(book.isRented()) { %>
				<td style="text-align: center; color: red;">
					Out
				</td>
			<% } else { %>
				<td style="text-align: center; color: green;">
					In
				</td>
			<% } %>
	
			</tr>
			<% } %>
	</table>
	</div>

</center>

<%@ include file= "footer.jsp" %>