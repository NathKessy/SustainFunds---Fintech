package br.com.fiap.fintech.sf.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.fiap.fintech.sf.dao.InvestimentosDAO;
import br.com.fiap.fintech.sf.model.Investimento;
import br.com.fiap.fintech.sf.model.enums.StatusEnum;
import br.com.fiap.fintech.sf.model.enums.TipoInvestimentoEnum;

@WebServlet("/editar-investimento")
public class EditarInvestimentoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public EditarInvestimentoServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int id = Integer.parseInt(request.getParameter("id"));
		
		Investimento investimento = null;
		
		try {
			InvestimentosDAO investimentosDAO = new InvestimentosDAO();
			investimento = investimentosDAO.buscaPorId(id);
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		
		System.out.println("----> " + investimento.getDescricaoInvestimento());
		
		request.setAttribute("investimento", investimento);
		request.getRequestDispatcher("editar-investimento.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		int id = Integer.parseInt(request.getParameter("id"));
		TipoInvestimentoEnum tipoInvestimento = TipoInvestimentoEnum.valueOf(request.getParameter("tipoInvestimento"));
		Double valorInvestido = Double.parseDouble(request.getParameter("valorInvestido"));
		LocalDate dataInicio = LocalDate.parse(request.getParameter("dataInicio"));
		LocalDate dataResgate = LocalDate.parse(request.getParameter("dataResgate"));
		String nome = request.getParameter("descricaoInvestimento");
		StatusEnum status = StatusEnum.valueOf(request.getParameter("status"));
		LocalDate dataRegistro = LocalDate.parse(request.getParameter("dataRegistro"));
		
		System.out.println("INFO: Realizando update no ID: " + id);

		Investimento investimento = new Investimento(id, null, tipoInvestimento, valorInvestido, dataInicio, dataResgate, nome, status, dataRegistro);
		InvestimentosDAO investimentosDAO = new InvestimentosDAO();
		
		try {
			investimentosDAO.updateInvestimento(investimento);
		} catch (SQLException erro) {
			erro.printStackTrace();
			response.sendRedirect("erro.jsp?erro=erro ao realizar o uptade do usuário");
		} 
		response.sendRedirect("erro.jsp?erro=Funcionou!!");
		//Validar direcionamento da pagina. 
		
	}

}
