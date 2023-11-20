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

</body>
</html>