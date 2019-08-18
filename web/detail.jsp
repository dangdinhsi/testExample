<%@ page import="entity.Customer" %><%--
  Created by IntelliJ IDEA.
  User: Sidang
  Date: 8/18/2019
  Time: 4:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Customer customer= (Customer) request.getAttribute("customer");
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Hóa đơn thanh toán</h1>
<div>Khách hàng: <b><%=customer.getName()%></b></div>
<div>Địa chỉ: <b><%=customer.getAddress()%></b></div>
<div>SĐT: <b><%=customer.getPhone()%></b></div>
<div>
    <%=customer.getMessage()%> <b style="color: red"><%=customer.getTotal()%>$</b>
</div>
</body>
</html>
