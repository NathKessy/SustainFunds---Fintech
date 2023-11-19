package br.com.fiap.fintech.sf.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;

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

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			buscarInvestimentoPorIdOuNome(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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
				Date dataInicio = asDate(investimento.getDataInicio());
				Date dataResgate = asDate(investimento.getDataResgate());
				Date dataRegistro = asDate(investimento.getDataRegistro());

				request.setAttribute("dataInicio", dataInicio);
				request.setAttribute("dataResgate", dataResgate);
				request.setAttribute("dataRegistro", dataRegistro);
				request.setAttribute("investimento", investimento);
			}
		}

		request.getRequestDispatcher("tela-investimentos-teste.jsp").forward(request, response);

	}
	
	public Date asDate(LocalDate localDate) {
	    return Date.from(localDate.atStartOfDay().atZone(ZoneId.systemDefault()).toInstant());
	  }

}
