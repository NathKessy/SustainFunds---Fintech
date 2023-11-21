package br.com.fiap.fintech.sf.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import br.com.fiap.fintech.sf.dao.InvestimentosDAO;
import br.com.fiap.fintech.sf.model.ContaEmpresa;
import br.com.fiap.fintech.sf.model.Investimento;
import br.com.fiap.fintech.sf.model.Usuario;
import br.com.fiap.fintech.sf.model.enums.StatusEnum;
import br.com.fiap.fintech.sf.model.enums.TipoInvestimentoEnum;

@WebServlet("/criar-fundo")
public class CriarAcoesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CriarAcoesServlet() {
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
			request.getRequestDispatcher("cadastro-acoes.jsp").forward(request, response);

		} catch (SQLException e) {
			response.sendRedirect("erro.jsp");
		} catch (Exception e) {
			response.sendRedirect("erro.jsp");
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		TipoInvestimentoEnum tipoInvestimento = TipoInvestimentoEnum.valueOf(request.getParameter("tipoInvestimento"));
		String nome = request.getParameter("nome");
		LocalDate dataRegistro = LocalDate.parse(request.getParameter("dataRegistro"));
		LocalDate dataInicio = LocalDate.parse(request.getParameter("dataInicio"));
		LocalDate dataResgate = LocalDate.parse(request.getParameter("dataResgate"));
		Double valorInvestido = Double.parseDouble(request.getParameter("valorInvestido"));

		ContaEmpresa contaEmpresa = new ContaEmpresa(1);

		Investimento investimento = new Investimento(0, contaEmpresa, tipoInvestimento, valorInvestido, dataInicio,
				dataResgate, nome, StatusEnum.PENDENTE, dataRegistro);
		InvestimentosDAO investimentosDAO = new InvestimentosDAO();

		System.out.println("Fundo cadastrado com sucesso!!");

		try {
			investimentosDAO.adicionar(investimento);
		} catch (SQLException erro) {
			erro.printStackTrace();
			response.sendRedirect("erro.jsp?erro=erro ao realizar uma nova ação");
		}
		doGet(request, response);
	}

}
