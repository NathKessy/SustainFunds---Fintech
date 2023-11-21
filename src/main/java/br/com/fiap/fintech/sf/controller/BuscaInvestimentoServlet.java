package br.com.fiap.fintech.sf.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.fiap.fintech.sf.dao.InvestimentosDAO;
import br.com.fiap.fintech.sf.model.Investimento;

@WebServlet("/busca-investimento")
public class BuscaInvestimentoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public BuscaInvestimentoServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		request.getRequestDispatcher("investimentos").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			buscarInvestimentoPorIdOuNome(request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (NumberFormatException e) {
			request.getRequestDispatcher("erro.jsp").forward(request, response);
		}
	}

	private void buscarInvestimentoPorIdOuNome(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {

		Integer id = Integer.parseInt(request.getParameter("id") != "" ? request.getParameter("id") : "0");
		String nome = request.getParameter("nome");

		if (id == 0 && nome == "") {
			request.setAttribute("erro", "Insira algum valor válido!");
		} else {
			InvestimentosDAO investimentoDAO = new InvestimentosDAO();
			Investimento investimento = investimentoDAO.buscarInvestimentoPorIdNome(id, nome);
						
			if (investimento == null) {				
				request.setAttribute("naoEncontrado", "Não localizado registro no banco");
			} else {
				request.setAttribute("investimento", investimento);
			}
		}

		request.getRequestDispatcher("investimentos").forward(request, response);

	}
}
