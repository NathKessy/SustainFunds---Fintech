package br.com.fiap.fintech.sf.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LoginServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		response.getWriter().append("USUÁRIO NÃO AUTENTICADO!!").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String email = request.getParameter("email");
		String senha = request.getParameter("senha");
		
		if (email == null || senha == null) {
//			doGet(request, response);			
		}
		
		// Validador do login 
		
		request.setAttribute( "email", email);
		request.setAttribute( "senha", senha);
		
		request.getRequestDispatcher("logado.jsp").forward(request, response);
		
	}

}
