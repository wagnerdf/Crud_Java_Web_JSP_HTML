<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Visualização de Usuários</title>

<script type="text/javascript">

	function confirmaExclusao(id){
		var resposta = confirm("Deseja remover esse registro? "+id);
		
		if(resposta == true){
			location.href = "deleteusuario.jsp?id="+id;
		}
	}

</script>

</head>
<body>
	<%@ page import="com.crudjspjava.dao.UsuarioDAO, com.crudjspjava.bean.*, java.util.*"%>
	
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	
	<h1>Listagem de Usuários</h1>
	
	<% 
	
	String pageid = request.getParameter("page");
	if(pageid == null){
		pageid = "1";
	}
	int id = Integer.parseInt(pageid);
	int total = 5;
	
	if(id==1){}
	else{
		id = id -1;
		id = id * total + 1;
	}
	
	//List<Usuario> list = UsuarioDAO.getAllUsuarios();
	List<Usuario> list = UsuarioDAO.getRecords(id, total);
	request.setAttribute("list", list);
	%>  
	
	<table border="1">
		<tr>
			<th>ID</th>
			<th>Nome</th>
			<th>Password</th>
			<th>Email</th>
			<th>Sexo</th>
			<th>País</th>
			<th>Editar</th>
			<th>Excluir</th>
		</tr>
		<c:forEach items="${list}" var="usuario"> 
		<tr>
		
			<td>${usuario.getId()}</td>
			<td>${usuario.getNome()}</td>
			<td>${usuario.getPassword()}</td>
			<td>${usuario.getEmail()}</td> 
			<td>${usuario.getSexo()}</td>
			<td>${usuario.getPais()}</td>
			<td><a href="editform.jsp?id=${usuario.getId()}">Editar</a></td>
			<td><a href="javascript:func(${usuario.getId()})" onclick="confirmaExclusao(${usuario.getId()})">Excluir</a></td>
			
		</tr>
		</c:forEach>	
	</table>
	<br>
	<a href="viewusuarios.jsp?page=1">1</a>
	<a href="viewusuarios.jsp?page=2">2</a>
	<a href="viewusuarios.jsp?page=3">3</a>
	
	<br>
	<a href="addusuarioform.jsp">Adicionar novo Usuário</a>
		
	
</body>
</html>