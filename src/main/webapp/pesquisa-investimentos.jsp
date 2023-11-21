<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="zxx">
<head>
<title>Sua Fintech - Minhas Ações</title>
<meta charset="UTF-8">
<meta name="description" content="loans HTML Template">
<meta name="keywords" content="loans, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="img/favicon.ico" rel="shortcut icon" />
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="css/bootstrap.min.css" />
<link rel="stylesheet" href="css/font-awesome.min.css" />
<link rel="stylesheet" href="css/owl.carousel.min.css" />
<link rel="stylesheet" href="css/flaticon.css" />
<link rel="stylesheet" href="css/slicknav.min.css" />
<link rel="stylesheet" href="css/style.css" />
</head>
<body>

	<header class="header-section">
		<a href="index.html" class="site-logo"> <img src="img/logo.png"
			alt="Logo Banco">
		</a>
		<nav class="header-nav">
			<ul class="main-menu">
				<li><a href="home">Home</a></li>
				<li><a href="#">Sobre nós</a></li>
				<li><a href="#" class="active">Serviços</a>
					<ul class="sub-menu">
						<li><a href="#">Sobre nós</a></li>
						<li><a href="investimentos">Minhas ações</a></li>
						<li><a href="criar-fundo">Cadastro ações</a></li>
						<li><a href="#">Empréstimos</a></li>
						<li><a href="#">Cliente+</a></li>
					</ul></li>
				<li><a href="#">Novidades</a></li>
				<li><a href="#">Contato</a></li>
				<li><a href="logout">Logout</a></li>
			</ul>
		</nav>
	</header>

	<div class="container container-table mt-5 pb-5">
		<h2>Pesquisa de Ações</h2>
		<p>Aqui você pode consultar as suas ações, podendo analisar todas
			as informações necessárias para o seu controle.</p>

		<form class="mb-3 pb-4 pt-4" action="busca-investimento" method="post">
			<div class="form-row align-items-end">
				<div class="col-md-5 col-sm-3">
					<label for="fundoNome">Nome do Fundo</label>
					<div class="input-group">
						<input type="text" class="form-control" id="fundoNome" name="nome"
							placeholder="Digite o nome do fundo">
					</div>
				</div>
				<div class="col-md-5">
					<label for="fundoId">ID do Fundo</label>
					<div class="input-group">
						<div class="input-group-prepend">
							<div class="input-group-text">#</div>
						</div>
						<input type="text" class="form-control" name="id"
							placeholder="Identificação da ação">
					</div>
				</div>
				<div class="col-md-2">
					<input type="submit" value="Buscar"
						class="btn btn-dark btn-block">
				</div>
			</div>
		</form>
		<c:if test="${not empty investimento }">
			<table
				class="table table-striped table-bordered table-responsive text-center">
				<thead>
					<tr>
						<th scope="col">ID</th>
						<th scope="col">Tipo Investimento</th>
						<th scope="col">Nome</th>
						<th scope="col">Data Registro</th>
						<th scope="col">Data Início</th>
						<th scope="col">Data Resgate</th>
						<th scope="col">Valor Investido</th>
						<th scope="col">Status</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class="small">${investimento.id }</td>
						<td class="small">${investimento.tipoInvestimento }</td>
						<td class="small">${investimento.descricaoInvestimento }</td>
						<td class="small">${investimento.dataRegistro}</td>
						<td class="small">${investimento.dataInicio}</td>
						<td class="small">${investimento.dataResgate}</td>
						<td class="small"><fmt:formatNumber
								value="${investimento.valorInvestido}" type="currency" /></td>
						<td class="small">${investimento.status}</td>
						<td><a href="editar-investimento?id=${investimento.id}"
							class="btn btn-success btn-editar">Editar</a></td>
						<td><a href="remover-investimento?id=${investimento.id}"
							class="btn btn-success btn-remover">Remover</a></td>
					</tr>
				</tbody>
			</table>
		</c:if>
		<c:if test="${not empty erro }">
			<br>
			<div class="alert alert-danger">${erro }</div>
		</c:if>
		<c:if test="${not empty naoEncontrado }">
			<br>
			<div class="alert alert-danger">${naoEncontrado }</div>
		</c:if>
	</div>

	<div>
		<table
			class="table table-striped table-bordered table-responsive text-center">
			<thead>
				<tr>
					<th scope="col">ID</th>
					<th scope="col">Tipo Investimento</th>
					<th scope="col">Nome</th>
					<th scope="col">Data Registro</th>
					<th scope="col">Data Início</th>
					<th scope="col">Data Resgate</th>
					<th scope="col">Valor Investido</th>
					<th scope="col">Status</th>
					<th></th>
				</tr>
			</thead>
			<c:forEach items="${investimentoLista}" var="investimento">
				<tbody>
					<tr>
						<td class="small">${investimento.id }</td>
						<td class="small">${investimento.tipoInvestimento }</td>
						<td class="small">${investimento.descricaoInvestimento }</td>
						<td class="small">${investimento.dataRegistro}</td>
						<td class="small">${investimento.dataInicio}</td>
						<td class="small">${investimento.dataResgate}</td>
						<td class="small"><fmt:formatNumber
								value="${investimento.valorInvestido}" type="currency" /></td>
						<td class="small">${investimento.status}</td>
						<td><a href="editar-investimento?id=${investimento.id}"
							class="btn btn-success btn-editar">Editar</a></td>
						<td><a href="excluir?id=${investimento.id}"
							class="btn btn-success btn-remover">Remover</a></td>
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

	<script src="js/jquery-3.2.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.slicknav.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/jquery-ui.min.js"></script>
	<script src="js/main.js"></script>
</body>
</html>