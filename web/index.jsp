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
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
  </head>
  <body>
  <div class="container">
    <h1>Mặt hàng</h1>
    <div class="row">
      <div class="col-4">
        <table class="table table-bordered">
          <tr>
            <th>Id</th>
            <th>Name</th>
            <th>Price</th>
            <th>Order</th>
          </tr>
          <c:forEach var="p" items="<%=pm.findAll()%>">
            <tr>
              <td>${p.id}</td>
              <td>${p.nameProduct}</td>
              <td>${p.price}$</td>
              <td><a href="ShoppingCartController?id=${p.id}&action=ordernow">ADD</a></td>
            </tr>
          </c:forEach>
        </table>
      </div>
    </div>

  </div>
  </body>
</html>
