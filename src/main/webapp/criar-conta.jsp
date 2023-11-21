<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">
<head>
 <title>Sua Fintech - Cadastro de Ações</title>
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
        <a href="index.html" class="site-logo"> 
            <img src="img/logo.png" alt="Logo Banco">
        </a>
        <nav class="header-nav">
            <ul class="main-menu">
                <li><a href="login" class="active">Voltar</a></li>
            </ul>
        </nav>
    </header>  
    
    	<div class="hero-section-bg">
        <div class="overlay-bg"></div>
		<div class="container texto-cadastro mt-3 pb-5 pt-3">
			<div class=" formulario-acao form-and-table-container d-flex align-items-center justify-content-center flex-column pt-4">
				<h3 class="my-4">Formulário cadastro de ações</h3>
				<form id="bankForm" class="mx-auto col-md-6 pt-4" action="criar-conta" method="post">
					
					<div class="form-group">
						<label for="razao-social" style="color: aliceblue;">Razão Social</label>
						<input type="text" id="razao-social" name="razaoSocial" class="form-control" required placeholder="Digite a Razão Social">
					</div>
					
					<div class="form-group">
						<label for="nome-fantasia" style="color: aliceblue;">Nome Fantasia</label>
						<input type="text" id="nome-fantasia" name="nomeFantasia" class="form-control" required placeholder="Digite o Nome Fantasia">
					</div>
					
					<div class="form-group">
						<label for="cnpj" style="color: aliceblue;">CNPJ</label>
						<input type="text" id="cnpj" name="cnpj" class="form-control" required placeholder="Digite o CNPJ">
					</div>
					
					<div class="form-group">
						<label for="capital-empresa" style="color: aliceblue;">Capital Empresa</label>
						<input type="text" id="capital-empresa" name="capitalEmpresa" class="form-control" placeholder="Digite o Capital da Empresa">
					</div>
					
					<div class="form-group">
						<label for="telefone" style="color: aliceblue;">Telefone</label>
						<input type="text" id="telefone" name="telefone" class="form-control" required placeholder="Digite o Telefone">
					</div>
					
					<div class="form-group">
						<label for="faturamento" style="color: aliceblue;">Faturamento</label>
						<input type="text" id="faturamento" name="faturamento" class="form-control" required placeholder="Digite o Faturamento">
					</div>

					<div class="hr linha"></div>
					
					<h3 style="color: aliceblue;">Cadastro de Endereço</h3>
					
					<div class="form-group">
						<label for="pais" style="color: aliceblue;">País</label>
						<input type="text" id="pais" name="pais" class="form-control" required placeholder="Digite o País">
					</div>
					
					<div class="form-group">
						<label for="estado" style="color: aliceblue;">Estado</label>
						<input type="text" id="estado" name="estado" class="form-control" required placeholder="Digite o Estado">
					</div>
					
					<div class="form-group">
						<label for="cidade" style="color: aliceblue;">Cidade</label>
						<input type="text" id="cidade" name="cidade" class="form-control" required placeholder="Digite a Cidade">
					</div>
					
					<div class="form-group">
						<label for="rua" style="color: aliceblue;">Rua</label>
						<input type="text" id="rua" name="rua" class="form-control" required placeholder="Digite a Rua">
					</div>
					
					<div class="form-group">
						<label for="numero" style="color: aliceblue;">Número</label>
						<input type="text" id="numero" name="numeroEndereco" class="form-control" required placeholder="Digite o Número">
					</div>
					
					<div class="form-group">
						<label for="cep" style="color: aliceblue;">CEP</label>
						<input type="text" id="cep" name="cep" class="form-control" required placeholder="Digite o CEP">
					</div>
					
					<div class="form-group">
						<label for="bairro" style="color: aliceblue;">Bairro</label>
						<input type="text" id="bairro" name="bairro" class="form-control" required placeholder="Digite o Bairro">
					</div>

					<div class="hr linha"></div>
					
					<h3 style="color: aliceblue;">Cadastro de Usuário</h3>
					
					<div class="form-group">
						<label for="email" style="color: aliceblue;">E-mail</label>
						<input type="email" id="email" name="email" class="form-control" required placeholder="Digite o E-mail">
					</div>
					
					<div class="form-group">
						<label for="login" style="color: aliceblue;">Login</label>
						<input type="text" id="login" name="login" class="form-control" required placeholder="Digite o Login">
					</div>
					
					<div class="form-group">
						<label for="senha" style="color: aliceblue;">Senha</label>
						<input type="password" id="senha" name="senha" class="form-control" required placeholder="Digite a Senha">
					</div>
					
		
					<div class="btn-container botao-acao pt-3 pb-5">
						<input type="submit" value="Cadastrar" class="col-md-6 mx-auto btn btn-dark btn-block btn mt-4 btn-registrar-acao">
					</div>
				</form>
			</div>  
		</div>
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
			<div class="copyright"> Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved <i class="fa fa-heart-o"></i>
			</div> 
		</div>
	</footer>



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