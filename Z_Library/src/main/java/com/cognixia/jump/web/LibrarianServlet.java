package com.cognixia.jump.web;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cognixia.jump.connection.ConnectionManager;
import com.cognixia.jump.dao.BookDAO;
import com.cognixia.jump.dao.LibrarianDAO;
import com.cognixia.jump.model.Book;

/**
 * Servlet implementation class Librarian
 */
public class LibrarianServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	//include feature about who is logged in
	private LibrarianDAO librarianDAO;
	private BookDAO bookDAO;

	@Override
	public void init() throws ServletException {
		bookDAO = new BookDAO();
		librarianDAO = new LibrarianDAO();
	}

	public void destroy() {
		try {
			ConnectionManager.getConnection().close();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
	}

//	protected void service(HttpServletRequest request, HttpServletResponse response)
//			throws ServletException, IOException {
//		// TODO Auto-generated method stub
//	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String action = request.getParameter("met");
		
		switch (action) {
		case "view":
			viewBooks(request, response);
			break;
		case "new":
			addBook(request, response);
			break;
		case "title":
			updateBookTitle(request, response);
			break;
		case "descr":
			updateBookDescription(request, response);
			break;
		case "userC":
			changeUsername(request, response);
			break;
		case "passC":
			changePassword(request, response);
			break;
		default:
			response.sendRedirect("librarianHome.jsp");
			break;
		}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
	
	private void viewBooks(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		List<Book> allBooks = bookDAO.getAllBooks(false);
		System.out.println("called, bookDAO = " + allBooks);
		
		request.setAttribute("allBooks", allBooks);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("libbookview.jsp");
		
		dispatcher.forward(request, response);
	}
	
	private void changePassword(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int patronId = Integer.parseInt(request.getParameter("id"));
		String password = request.getParameter("password");
		librarianDAO.updatePassword(patronId, password);
		
		response.sendRedirect("librarianHome.jsp");
	}
	
	private void changeUsername(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int patronId = Integer.parseInt(request.getParameter("id"));
		String username = request.getParameter("username");
		librarianDAO.updateUsername(patronId, username);
		
		response.sendRedirect("librarianHome.jsp");
	}
		
//		private void profile(HttpServletRequest request, HttpServletResponse response) 
//				throws ServletException, IOException {
//			
//			RequestDispatcher dispatcher = request.getRequestDispatcher("librarianHome.jsp");
//			
//			dispatcher.forward(request, response);
//		}
		
		private void addBook(HttpServletRequest request, HttpServletResponse response) 
				throws ServletException, IOException {
			
			String isbn = request.getParameter("isbn");
			String title = request.getParameter("title");
			String descr = request.getParameter("descr");
//			boolean rented = Boolean.parseBoolean(request.getParameter("rented"));
//			String dateAdded = request.getParameter("dateAdded");
			
			Book newBook = new Book(isbn, title, descr, false, LocalDate.now().toString());
			
			BookDAO.createNewBook(newBook);
			
			response.sendRedirect("librarianHome.jsp");
		}
		
		private void updateBookTitle(HttpServletRequest request, HttpServletResponse response) 
				throws ServletException, IOException {
			
			String isbn = request.getParameter("isbn");
			String title = request.getParameter("title");
			Book updateBook = bookDAO.getBookByISBN(isbn);
			
			BookDAO.updateTitle(updateBook, title);
			
			response.sendRedirect("librarianHome.jsp");
		}
		
		private void updateBookDescription(HttpServletRequest request, HttpServletResponse response) 
				throws ServletException, IOException {
			
			String isbn = request.getParameter("isbn");
			String descr = request.getParameter("descr");
			Book updateBook = bookDAO.getBookByISBN(isbn);
			
			BookDAO.updateDescription(updateBook, descr);
			
			response.sendRedirect("librarianHome.jsp");
		}
		
		private void logoutLibrarian(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("librarianHome.jsp");
			
			dispatcher.forward(request, response);
		}

}
