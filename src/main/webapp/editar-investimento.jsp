<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="zxx">
<head>
<title>SustainFunds - Editar Investimento</title>
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
				<li><a href="investimentos" class="active">Voltar</a></li>
			</ul>
		</nav>
	</header>
	
	<div class="container texto-cadastro mt-3">
		<h2 class="pb-4">Editar Ações</h2>
		<p class="pb-3">Bem-vindo à página de atualização de uma ação, um espaço
			dedicado ao gerenciamento e registro preciso das suas operações
			financeiras.</p>
			
		<div
			class=" formulario-acao form-and-table-container d-flex align-items-center justify-content-center flex-column pt-4">
			<h3 class="my-4">Formulário cadastro de ações</h3>
			<!--        <form id="bankForm" class="mx-auto col-md-6 pt-4" action="criar-fundo" method="post">  -->
			<form class="mx-auto col-md-6 pt-4" action="editar-investimento"
				method="post">

				<div class="form-group pt-3">
					<label for="tipoInvestimento">Tipo de Investimento</label> 
					<select	id="tipoInvestimento" name="tipoInvestimento" class="form-control"
						required>
						<option value="RENDA_FIXA">RENDA FIXA</option>
						<option value="RENDA_VARIAVEL">RENDA VARIAVEL</option>
						<option value="FUNDOS">FUNDOS</option>
						<option value="ATIVOS">ATIVOS</option>
						<option value="DERIVATIVOS">DERIVATIVOS</option>
						<option value="FII">FII</option>
					</select>
				</div>
				
				<input type="hidden" name="id" value="${investimento.id }"> 

				<div class="form-group">
					<label for="nome">Nome</label> 
					<input type="text" id="nome"
						name="nome" class="form-control" 
						value="${investimento.descricaoInvestimento}" required>
				</div>

				<div class="form-row">
					<div class="form-group col-md-4 pr-3">
						<label for="dataRegistro">Data Registro</label> <input type="date"
							id="dataRegistro" name="dataRegistro" class="form-control"
							value="${investimento.dataInicio}" required>
					</div>

					<div class="form-group col-md-4 pr-3">
						<label for="dataInicio">Data Início</label> 
						<input type="date" id="dataInicio" name="dataInicio" 
						value="${investimento.dataInicio}" class="form-control" required>
					</div>

					<div class="form-group col-md-4">
						<label for="dataResgate">Data Resgate</label> <input type="date"
							id="dataResgate" name="dataResgate" 
							value="${investimento.dataResgate}" class="form-control" required>
					</div>
				</div>

				<label for="valorInvestido">Valor Investido</label> 
				<input type="number" id="valorInvestido" name="valorInvestido"
					class="form-control" value="${investimento.valorInvestido}" required> 
				<input type="hidden" id="editIndex" name="editIndex" value="-1">

				<div class="btn-container botao-acao pt-3 pb-5">
					<input type="submit" value="Registrar Ação"
						class="col-md-6 mx-auto btn btn-dark btn-block btn mt-4 btn-registrar-acao">
				</div>
			</form>
		</div>
	
	</div>
	
	Retorna todos os dados de investimento dentro da label
	
	 <h1>Editar Produto</h1>
    <form action="editar-investimento" method="post">
    
    	<input type="hidden" name="id" value="${investimento.id }">      
        Tipo investimento: <input type="text" name="tipoInvestimento" value="${investimento.tipoInvestimento}"><br>
      	Valor (R$): <input type="text" name="valorInvestido" value="${investimento.valorInvestido}"><br>
        Data inicio (dd/MM/aaaa): <input type="text" name="dataInicio" value="${investimento.dataInicio}"> <br>
        Data resgate (dd/MM/aaaa): <input type="text" name="dataResgate" value="${investimento.dataResgate}"> <br>
        Descricao investimento: <input type="text" name="descricaoInvestimento" value="${investimento.descricaoInvestimento}"><br>
        Status: <input type="text" name="status" value="${investimento.status}"><br>
        Data registro (dd/MM/aaaa): <input type="text" name="dataRegistro" value="${investimento.dataRegistro}"> <br>
        <br>
        
        <input type="submit" value="Alterar">
    </form>
    
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

</body>
</html>