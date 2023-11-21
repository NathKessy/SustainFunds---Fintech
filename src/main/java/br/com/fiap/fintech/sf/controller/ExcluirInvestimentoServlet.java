package br.com.fiap.fintech.sf.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.fiap.fintech.sf.dao.InvestimentosDAO;

@WebServlet("/excluir")
public class ExcluirInvestimentoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ExcluirInvestimentoServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		
		InvestimentosDAO investimentosDAO = new InvestimentosDAO();
		try {
			investimentosDAO.remover(id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		response.sendRedirect("investimentos");
	}

}
