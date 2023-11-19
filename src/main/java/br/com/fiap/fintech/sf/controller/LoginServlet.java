package br.com.fiap.fintech.sf.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import br.com.fiap.fintech.sf.dao.UsuarioDAO;
import br.com.fiap.fintech.sf.model.Usuario;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LoginServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, IllegalStateException {
		
		HttpSession session = request.getSession();
		
//		session.invalidate(); Para matar a sessão 
		
		Usuario usuario = (Usuario) session.getAttribute("usuarioLogado");
		if (usuario != null) {
			request.getRequestDispatcher("home").forward(request, response);
		}
		
		request.getRequestDispatcher("login.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		Usuario usuario = null;

		String email = request.getParameter("email");
		String senha = request.getParameter("senha");

		UsuarioDAO usuarioDAO = new UsuarioDAO();

		try {
			usuario = usuarioDAO.validarUsuario(email, senha);
		} catch (SQLException e) {
			response.sendRedirect("error.jsp?erro=Problemas técnicos");
		}

		if (usuario != null) {
			session.setAttribute("usuarioLogado", usuario);
			request.getRequestDispatcher("home").forward(request, response);
		} else {
			request.setAttribute("erro", "Usuário não identificado no banco de dados!");
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
	}
}