<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">
<head>
<title>SustainFunds - Cadastro de conta</title>
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
	<section class="hero-section"  style="background-color: #74757b">
		<div class="container">
			<div class="row">
				<div class="col-md-6">
					<form class="hero-form" action="criar-conta" method="post">
						<div class="hs-text">
							<h2>Cadastro de empresa</h2>
						</div>
						<label for="razao-social" style="color: aliceblue;">Razão Social</label>
						<input type="text" placeholder="Razão Social" id="razao-social" name="razaoSocial" required> <br>
						<input type="text" placeholder="Nome Fantasia" id="nome-fantasia" name="nomeFantasia" required> <br>
						<input type="text" placeholder="cnpj" id="cnpj" name="cnpj" required> <br>
						<input type="text" placeholder="Capital Empresa" id="capital-empresa" name="capitalEmpresa"> <br>
						<input type="text" placeholder="(00) 0000-0000" id="telefone" name="telefone" required> <br>
						<input type="text" placeholder="Faturamento" id="faturamento" name="faturamento" required> <br>
						<h3 style="color: aliceblue;">Cadastro de Endereço</h3> <br>
						<input type="text" placeholder="País" id="pais" name="pais" required> <br>
						<input type="text" placeholder="Estado" id="estado" name="estado" required> <br>
						<input type="text" placeholder="Cidade" id="cidade" name="cidade" required> <br>
						<input type="text" placeholder="Rua" id="rua" name="rua" required> <br>
						<input type="text" placeholder="Número" id="numero" name="numeroEndereco" required> <br>
						<input type="text" placeholder="cep" id="cep" name="cep" required> <br>
						<input type="text" placeholder="Bairro" id="bairro" name="bairro" required> <br>
						<h3 style="color: aliceblue;">Cadastro de Usuário</h3> <br>
						<input type="email"	placeholder="E-mail" id="email" name="email" required> <br>
						<input type="text" placeholder="Login" id="login" name="login" required> <br>
						<input type="password" placeholder="Senha" id="senha" name="senha" required> <br>
						<div class="d-flex flex-row bd-highlight">
							<button class="site-btn d-flex justify-content-center">Criar</button>						
						</div>
					</form>
				</div>
				<div class="col-md-6">
					<img src="img/logo.sustainfunds.png" alt="Logo Banco">
				</div>
			</div>
		</div>
		<div class="hero-slider owl-carousel">
			<div class="hs-item set-bg" data-setbg="img/hero-slider/3.jpg"></div>
			<div class="hs-item set-bg" data-setbg="img/hero-slider/2.jpg"></div>
			<div class="hs-item set-bg" data-setbg="img/hero-slider/1.jpg"></div>
		</div>
	</section>
</body>
</html>