package br.com.fiap.fintech.sf.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import br.com.fiap.fintech.sf.dao.InvestimentosDAO;
import br.com.fiap.fintech.sf.model.Investimento;
import br.com.fiap.fintech.sf.model.Usuario;

@WebServlet("/investimentos")
public class ListaInvestimentosServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ListaInvestimentosServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {

			HttpSession session = request.getSession();
			Usuario usuario = (Usuario) session.getAttribute("usuarioLogado");
			if (usuario == null) {
				request.setAttribute("erro", "Usuário não autenticado!!");
				request.getRequestDispatcher("login").forward(request, response);
			}

			InvestimentosDAO investimentosDAO = new InvestimentosDAO();
			List<Investimento> investimento;

			investimento = investimentosDAO.getAll();
			request.setAttribute("investimentoLista", investimento);
			request.getRequestDispatcher("pesquisa-investimentos.jsp").forward(request, response);

		} catch (SQLException e) {
			request.getRequestDispatcher("erro.jsp");
		} catch (Exception e) {
			request.getRequestDispatcher("erro.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
