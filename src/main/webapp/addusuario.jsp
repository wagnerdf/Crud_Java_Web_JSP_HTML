<%@page import="com.crudjspjava.dao.UsuarioDAO"%>
<jsp:useBean id="u" class="com.crudjspjava.bean.Usuario"></jsp:useBean>
<jsp:setProperty property="*" name="u"/>

<%
	int i = UsuarioDAO.salvarUsuario(u);
	
	if(i > 0){
		response.sendRedirect("addusuario-success.jsp");
	}else{
		response.sendRedirect("addusuario-erro.jsp");
	}

%>