<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="pt-BR">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="img/favicon.ico" rel="shortcut icon"/>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/style.css"/>
    <title>Sua Fintech - Cadastro de Ações</title>
</head>

<body>
	<header class="header-section">
		<a href="index.html" class="site-logo"> <img src="img/logo.png"
			alt="Logo Banco">
		</a>
		<nav class="header-nav">
			<ul class="main-menu">
				<li><a href="index.jsp">Home</a></li>
				<li><a href="#">Sobre nós</a></li>
				<li><a href="#" class="active">Serviços</a>
					<ul class="sub-menu">
						<li><a href="#">Sobre nós</a></li>
						<li><a href="investimentos">Minhas ações</a></li>
						<li><a href="#">Cadastro ações</a></li>
						<li><a href="#">Empréstimos</a></li>
						<li><a href="#">Cliente+</a></li>
					</ul></li>
				<li><a href="#">Novidades</a></li>
				<li><a href="#">Contato</a></li>
				<li><a href="logout">Logout</a></li>
			</ul>
		</nav>
	</header>

	<div class="container texto-cadastro mt-3">
		<h2 class="pb-4">Cadastro de Ações</h2>
		<p class="pb-3">Bem-vindo à página de Cadastro de Ações, um espaço
			dedicado ao gerenciamento e registro preciso das suas operações
			financeiras. Aqui, oferecemos a você a possibilidade de consultar
			detalhadamente suas ações, proporcionando uma visão abrangente para
			uma gestão financeira eficaz. Para garantir uma experiência
			transparente, recomendamos atenção especial aos detalhes ao preencher
			o formulário de registro abaixo.</p>

		<div
			class=" formulario-acao form-and-table-container d-flex align-items-center justify-content-center flex-column pt-4">
			<h3 class="my-4">Formulário cadastro de ações</h3>
			<!--        <form id="bankForm" class="mx-auto col-md-6 pt-4" action="criar-fundo" method="post">  -->
			<form class="mx-auto col-md-6 pt-4" action="criar-fundo"
				method="post">

				<label for="transacao">Transação</label> <select id="transacao"
					name="transacao" class="form-control" required>
					<option value="deposito">Depósito</option>
					<option value="retirada">Retirada</option>
					<option value="debito">Débito em conta</option>
					<option value="juros">Juros automático</option>
					<option value="pontos">Pontos do cartão</option>
					<option value="pix">Pix</option>
				</select>

				<div class="form-group pt-3">
					<label for="tipoInvestimento">Tipo de Investimento</label> <select
						id="tipoInvestimento" name="tipoInvestimento" class="form-control"
						required>
						<option value="RENDA_FIXA">RENDA FIXA</option>
						<option value="RENDA_VARIAVEL">RENDA VARIAVEL</option>
						<option value="FUNDOS">FUNDOS</option>
						<option value="ATIVOS">ATIVOS</option>
						<option value="DERIVATIVOS">DERIVATIVOS</option>
						<option value="FII">FII</option>
					</select>
				</div>

				<div class="form-group">
					<label for="nome">Nome</label> <input type="text" id="nome"
						name="nome" class="form-control" required>
				</div>

				<div class="form-row">
					<div class="form-group col-md-4 pr-3">
						<label for="dataRegistro">Data Registro</label> <input type="date"
							id="dataRegistro" name="dataRegistro" class="form-control"
							required>
					</div>

					<div class="form-group col-md-4 pr-3">
						<label for="dataInicio">Data Início</label> <input type="date"
							id="dataInicio" name="dataInicio" class="form-control" required>
					</div>

					<div class="form-group col-md-4">
						<label for="dataResgate">Data Resgate</label> <input type="date"
							id="dataResgate" name="dataResgate" class="form-control" required>
					</div>
				</div>

				<label for="valorInvestido">Valor Investido</label> <input
					type="number" id="valorInvestido" name="valorInvestido"
					class="form-control" required> <input type="hidden"
					id="editIndex" name="editIndex" value="-1">

				<div class="btn-container botao-acao pt-3 pb-5">
					<input type="submit" value="Registrar Ação"
						class="col-md-6 mx-auto btn btn-dark btn-block btn mt-4 btn-registrar-acao">
				</div>
			</form>
		</div>


		<table id="bankTable"  class="table table-bordered table-responsive text-center mt-5">
			<thead class="table-colored">
				<tr>
					<th>ID</th>
					<th>Tipo Investimento</th>
					<th>Nome</th>
					<th>Data Registro</th>
					<th>Data Início</th>
					<th>Data Resgate</th>
					<th>Valor Investido</th>
					<th>Status</th>
				</tr>
			</thead>
			<c:forEach items="${investimentoLista}" var="investimento">
				<tbody>
					<tr>
						<td class="small">${investimento.id}</td>
						<td class="small">${investimento.tipoInvestimento}</td>
						<td class="small">${investimento.descricaoInvestimento}</td>
						<td class="small">${investimento.dataRegistro}</td>
						<td class="small">${investimento.dataInicio}</td>
						<td class="small">${investimento.dataResgate}</td>
						<td class="small"><fmt:formatNumber value="${investimento.valorInvestido}" type="currency" /></td>
						<td class="small">${investimento.status}</td>
					</tr>
				</tbody>
			</c:forEach>
		</table>
	</div>

	<footer class="footer-section">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-sm-6">
					<div class="footer-widget">
						<h2>O que fazemos</h2>
						<ul>
							<li><a href="#">Empréstimos</a></li>
							<li><a href="#">Administração de constas</a></li>
							<li><a href="#">Débito bancário</a></li>
							<li><a href="#">Inovação em finanças</a></li>
							<li><a href="#">Investimentos sustentáveis</a></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-3 col-sm-6">
					<div class="footer-widget">
						<h2>Sobre Nós</h2>
						<ul>
							<li><a href="#">Sobre nós</a></li>
							<li><a href="#">Encontre uma equipe/a></li>
							<li><a href="#">Carreira</a></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-3 col-sm-6">
					<div class="footer-widget new-column">
						<h2>Sustentabilidade</h2>
						<ul>
							<li><a href="#">Finanças Verdes</a></li>
							<li><a href="#">Impacto Social</a></li>
							<li><a href="#">Projetos Sustentáveis</a></li>
							<li><a href="#">Eficiência Energética</a></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-3 col-sm-6">
					<div class="footer-widget">
						<h2>Assuntos Legais</h2>
						<ul>
							<li><a href="#">Politica de privacidade</a></li>
							<li><a href="#">Princípios SustainFunds</a></li>
							<li><a href="#">Código de ética</a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="copyright">
				Copyright &copy;
				<script>
					document.write(new Date().getFullYear());
				</script>
				All rights reserved <i class="fa fa-heart-o"></i>
			</div>
		</div>
	</footer>

	<script src="js/cadastro.acoes.js"></script>
</body>

</html>
