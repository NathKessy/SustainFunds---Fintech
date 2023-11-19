package br.com.fiap.fintech.sf.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.fiap.fintech.sf.dao.EmpresaDAO;
import br.com.fiap.fintech.sf.dao.EnderecoDAO;
import br.com.fiap.fintech.sf.dao.UsuarioDAO;
import br.com.fiap.fintech.sf.model.Cidade;
import br.com.fiap.fintech.sf.model.Empresa;
import br.com.fiap.fintech.sf.model.Endereco;
import br.com.fiap.fintech.sf.model.Estado;
import br.com.fiap.fintech.sf.model.Pais;
import br.com.fiap.fintech.sf.model.Usuario;

@WebServlet("/criar-conta")
public class CriarContaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CriarContaServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Conta criada com sucesso! ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//doGet(request, response);
		
		try {
			
			String razaoSocial = request.getParameter("razaoSocial");
			String nomeFantasia = request.getParameter("nomeFantasia");
			String cnpj = request.getParameter("cnpj");
			Double capitalEmpresa = Double.parseDouble(converteNumeroDecimal(request.getParameter("capitalEmpresa")));
			String cep = request.getParameter("cep");
			String telefone = request.getParameter("telefone");
			String email = request.getParameter("email");
			Double faturamento = Double.parseDouble(converteNumeroDecimal(request.getParameter("faturamento")));
			
			String pais = request.getParameter("pais");
			String estado = request.getParameter("estado");
			String cidade = request.getParameter("cidade");
			String rua = request.getParameter("rua");
			String numeroEndereco = request.getParameter("numeroEndereco");
			String bairro = request.getParameter("bairro");
			
			String loginEmpresa = request.getParameter("login");
			String senha = request.getParameter("senha");
			
			Pais paisEntity = new Pais(1, pais);
			Estado estadoEntity = new Estado(1, estado);
			Cidade cidadeEntity = new Cidade(1, cidade);
			
			Endereco endereco = new Endereco(0, estadoEntity, cidadeEntity, paisEntity, rua, bairro, numeroEndereco, cep);
			EnderecoDAO enderecoDao = new EnderecoDAO();
			enderecoDao.adicionar(endereco);
			
			Empresa empresa = new Empresa(0, razaoSocial, nomeFantasia, cnpj, capitalEmpresa, cep, telefone, email, enderecoDao.buscarUltimoRegistro(), faturamento);
			EmpresaDAO empresaDao = new EmpresaDAO();
			empresaDao.adicionar(empresa);
			
			Usuario usuario = new Usuario(0, empresaDao.buscarUltimoRegistro(), loginEmpresa, email, senha);
			UsuarioDAO usuarioDao = new UsuarioDAO();
			usuarioDao.adicionar(usuario);
 			
			request.setAttribute("msg" , "Usuário cadastrado com sucesso!");
			
		} catch(SQLException erro) {
			erro.printStackTrace();
			request.setAttribute("erro", "Erro ao tentar realizar cadastro!");
		} catch(Exception erro) {
			erro.printStackTrace();
			request.setAttribute("erro", "Ocorreu um erro inesperado, favor valide com o suporte!");
		}
		
		request.getRequestDispatcher("login.jsp").forward(request, response);
		
	}
	
	public String converteNumeroDecimal(String numero) {
		if (numero != null) {
			return numero.replace(",", ".");			
		} 
		return "0";
	}
}
