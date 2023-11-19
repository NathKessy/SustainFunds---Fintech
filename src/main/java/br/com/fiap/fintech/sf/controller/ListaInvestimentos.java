package br.com.fiap.fintech.sf.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.fiap.fintech.sf.dao.InvestimentosDAO;
import br.com.fiap.fintech.sf.model.Investimento;

@WebServlet("/investimentos")
public class ListaInvestimentos extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ListaInvestimentos() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {

//		ValidateLogin.validarLogin(request);

			InvestimentosDAO investimentosDAO = new InvestimentosDAO();
			List<Investimento> investimento;

			investimento = investimentosDAO.getAll();
			request.setAttribute("investimentoLista", investimento);
			request.getRequestDispatcher("tela-investimentos-teste.jsp").forward(request, response);

		} catch (SQLException e) {
			response.sendRedirect("error.jsp?erro=Problemas técnicos");
		} catch (Exception e) {
			response.sendRedirect("error.jsp?erro=" + e.getMessage());
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
