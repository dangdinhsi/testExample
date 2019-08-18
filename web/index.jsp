<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="model.ProductModel" %><%--
  Created by IntelliJ IDEA.
  User: Sidang
  Date: 8/18/2019
  Time: 10:40 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  ProductModel pm = new ProductModel();
%>
<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>
  <table border="1" cellpadding="1" cellspacing="2">
    <tr>
      <th>ID</th>
      <th>Name</th>
      <th>Price</th>
      <th>Buy</th>
    </tr>
    <c:forEach var="p" items="<%=pm.findAll()%>">
      <tr>
        <td>${p.id}</td>
        <td>${p.nameProduct}</td>
        <td>${p.price}</td>
        <td><a href="ShoppingCartController?id=${p.id}&action=ordernow">Order</a></td>
      </tr>
    </c:forEach>
  </table>
  </body>
</html>
