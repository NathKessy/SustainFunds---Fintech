<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">
<head>
	<title>SustainFunds</title>
	<meta charset="UTF-8">
	<meta name="description" content="loans HTML Template">
	<meta name="keywords" content="loans, html">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link href="img/favicon.ico" rel="shortcut icon"/>
	<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="css/bootstrap.min.css"/>
	<link rel="stylesheet" href="css/font-awesome.min.css"/>
	<link rel="stylesheet" href="css/owl.carousel.min.css"/>
	<link rel="stylesheet" href="css/flaticon.css"/>
	<link rel="stylesheet" href="css/slicknav.min.css"/>
	<link rel="stylesheet" href="css/style.css"/>
</head>
<body>

	<header class="header-section">
		<a href="index.html" class="site-logo"> 
			<img src="img/logo.sustainfunds.png" alt="Logo Banco">
		</a>
		<nav class="header-nav">
			<ul class="main-menu">
				<li><a href="index.html">Home</a></li>
				<li><a href="about-us.html">Sobre nós</a></li>
				<li><a href="#">Serviços</a>
					<ul class="sub-menu">
						<li><a href="about-us.html">Sobre nós</a></li>
						<li><a href="loans.html">Empréstimos</a></li>
						<li><a href="elements.html">Cliente+</a></li>
					</ul></li>
				<li><a href="news.html">Novidades</a></li>
				<li><a href="contact.html">Contato</a></li>
				<li><a href="login.jsp" class="active">Login</a></li>
			</ul>
			<!-- Repensar essa parte do código 
				<div class="header-right">
				<a href="#" class="hr-btn"><i class="flaticon-029-telephone-1"></i>Fale com a gente!</a>
				<div class="hr-btn hr-btn-2">+55 11 5426-95410 </div>
			</div>-->
		</nav>
	</header>

	<div class="container">
		<div class="row d-flex justify-content-center">
			<div class="col-md-6" style="top:170px">
				<form class="hero-form" action="usuario" method="post">
					<div class="hs-text">
						<h2>Login</h2>
					</div>
					<label for="email">Email:</label> 
						<input type="email"	placeholder="E-mail" id="email" name="email" required> <br>
					<label for="senha">Senha:</label> 
						<input type="password" placeholder="Senha" id="senha" name="senha" required> <br>
						<input type="submit" class="site-btn" value="Conectar"> 
						<a class=trocaSenha href="#">Esqueci minha senha!</a>
				</form>
			</div>
		</div>
	</div>

</body>
</html>