<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="zxx">
<head>
<title>SustainFunds - Investimentos</title>
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

	<div>
		<form action="busca-investimento" method="post">

			<input type="text" id="id" name="id" placeholder="id"> <input
				type="text" id="nome" name="nome" placeholder="nome">
			<button class="d-flex justify-content-center">Buscar</button>

		</form>

		<c:if test="${not empty investimento }">
			<br>
			<table border="1">
				<tr>
					<th>ID</th>
					<th>Tipo Investimento</th>
					<th>Valor Investido</th>
					<th>Data Inicio</th>
					<th>Data Resgate</th>
					<th>Nome Investimento</th>
					<th>Status</th>
					<th>Data Resgistro</th>
					<th></th>
				</tr>
				<tr>
					<td>${investimento.id }</td>
					<td>${investimento.tipoInvestimento }</td>
					<td><fmt:formatNumber value="${investimento.valorInvestido}"
							type="currency" /></td>
					<td>${investimento.dataInicio}</td>
					<td>${investimento.dataResgate}</td>
					<td>${investimento.descricaoInvestimento}</td>
					<td>${investimento.status}</td>
					<td>${investimento.dataRegistro}</td>
					<td><a href="InvestimentoEditar?id=${investimento.id}">Editar</a></td>
				</tr>
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

	<br>
	
	 <a href="#" class="create btn btn-dark">Adicionar novo Investimento</a>
	 <br>

	<div>
		<table border="1">
			<tr>
				<th>ID</th>
				<th>Tipo Investimento</th>
				<th>Valor Investido</th>
				<th>Data Inicio</th>
				<th>Data Resgate</th>
				<th>Nome Investimento</th>
				<th>Status</th>
				<th>Data Resgistro</th>
				<th></th>
			</tr>

			<c:forEach items="${investimentoLista}" var="investimento">
				<tr>
					<td>${investimento.id }</td>
					<td>${investimento.tipoInvestimento }</td>
					<td><fmt:formatNumber value="${investimento.valorInvestido}"
							type="currency" /></td>
					<td>${investimento.dataInicio}</td>
					<td>${investimento.dataResgate}</td>
					<td>${investimento.descricaoInvestimento}</td>
					<td>${investimento.status}</td>
					<td>${investimento.dataRegistro}</td>
					<td><a href="InvestimentoEditar?id=${investimento.id}">Editar</a></td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>