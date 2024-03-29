<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!-- Tags a�adidas para jsp en las librerias jstl, 
el prefijo "c" es para tagas de tipo "core"  -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Products List</title>

<!-- Estilos css: -->
<style type="text/css">
	.cabecera{
		font-size: 1.2em;
		font-weight: bold;
		color: #FFFFFF;
		background-color: #08088A;
		text-align: center;
	}
	.filas{
		text-align: center;
		background-color: #5882FA;
	}
	table{
		/* Tabla queda flotante a la izquierda,
		lo que se encuentre a continuaci�n ira 
		a la derecha de la tabla */
		float: left;
	}
	#button_cont{
		margin-left: 540px;
	}
</style>

</head>


<body>
	<table>
		<tr>
			<td class="cabecera"> C�digo Art�culo </td>
			<td class="cabecera"> Nombre Art�culo </td>
			<td class="cabecera"> Secci�n </td>
			<td class="cabecera"> Precio </td>
			<td class="cabecera"> Fecha </td>
			<td class="cabecera"> Pa�s de Origen </td>
			<td class="cabecera"> Accion </td>
		</tr>
		<c:forEach var="prod" items="${product_list}">
		
			<!-- Link para actualizar cada producto con su campo clave -->
			<!-- En value va el nombre del servlet segun la web o mapping 
			configurado, en este caso el ProductController es products -->
			<c:url var="tmpLinkUpdate" value="/products">
				<c:param name="instruction" value="loadUpdate"></c:param>
				<c:param name="codproduct" value="${prod.codProduct}"></c:param>
			</c:url>
			
			<!-- Link para cada producto con su campo clave -->
			<c:url var="tmpLinkDelete" value="/products">
				<c:param name="instruction" value="productDelete"></c:param>
				<c:param name="codproduct" value="${prod.codProduct}"></c:param>
			</c:url>
			
			<tr>
				<!-- Nota: los atributos los obtiene de los metodos
				getters, por ejemplo para getCodProduct el atributo 
				es codProduct, quitando get y el primer caracter en
				minusculas  -->
				<td class="filas">${prod.codProduct}</td>
				<td class="filas">${prod.productName}</td>
				<td class="filas">${prod.section}</td>
				<td class="filas">${prod.price}</td>
				<td class="filas">${prod.originDate}</td>
				<td class="filas">${prod.originCountry}</td>
				<!-- Nota: Desde tomcat 8.5 no se pueden poner '[' y ']' en las urls
				o saldara error de "Invalid character" -->
				<td class="filas">
					<a href="${tmpLinkUpdate}">[actualizar]</a>
					&nbsp; <!-- Espacio horizontal -->
					<a href="${tmpLinkDelete}">[eliminar]</a>
				</td>
			</tr>
		</c:forEach>
	</table>
	
	<div id="button_cont">
		<input type="button" value="Insertar Registro"
			onclick="window.location.href='jsps/product_insert.jsp'"/>
	</div>
</body>
</html>