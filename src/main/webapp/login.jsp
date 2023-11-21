<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="zxx">
<head>
<title>SustainFunds</title>
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
<link rel="stylesheet" href="css/flaticon.css" />
<link rel="stylesheet" href="css/slicknav.min.css" />
<link rel="stylesheet" href="css/style.css" />
<link rel="stylesheet" href="css/login.css" />
</head>
<body>
	<header class="header-section">
        <a href="index.html" class="site-logo"> 
            <img src="img/logo.png" alt="Logo Banco">
        </a>
        <nav class="header-nav">
            <ul class="main-menu">
                <li><a href="home" >Home</a></li>
                <li><a href="#">Sobre nós</a></li>
                <li><a href="#">Serviços</a>
                    <ul class="sub-menu">
                        <li><a href="#">Sobre nós</a></li>
                        <li><a href="investimentos">Minhas ações</a></li>
                        <li><a href="criar-fundo">Cadastro ações</a></li>
                        <li><a href="#">Empréstimos</a></li>
                        <li><a href="#">Cliente+</a></li>
                    </ul>
                </li>
                <li><a href="#">Novidades</a></li>
                <li><a href="#">Contato</a></li>
                <li><a href="#" class="active">Login</a></li>
            </ul>
        </nav>
    </header>  

	<div class="hero-section">
		<div class="overlay"></div>
		<div class="container">
			<div class="row">
				<div class="col-lg-6">
					<form class="login-form" method="post" action="login">
						<img src="img/logo.png" alt="Your Image">
						<h2>Login</h2>
						<label>usuario teste: teste@fiap.com</label>
						<input type="email" placeholder="E-mail" name="email" class="form-control">
						<label>senha teste: 123</label>
						<input type="password" placeholder="Senha" name="senha" class="form-control">
						<c:if test="${not empty msg }">
							<br>
							<div class="alert alert-secondary">${msg }</div>
						</c:if>
						<c:if test="${not empty erro }">
							<br>
							<div class="alert alert-danger">${erro }</div>
						</c:if>
						<a href="criar-conta.jsp" class="forgot-password">Não
							tem cadastro? Faça aqui.</a>
						<button class="site-btn">Entrar</button>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>