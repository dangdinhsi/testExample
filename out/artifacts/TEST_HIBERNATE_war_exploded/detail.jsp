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
<div>Tổng giá trị đơn hàng là: <b><%=customer.getTotal()%></b>$</div>
<br>
<div>
    <%
        if(customer.getTotal()>=5000){
            %>
            <b style="color: gray">Do tổng giá trị đơn hàng của bạn >=5000$ nên bạn được giảm giá 30%</b>
            <br>
            <b style="color: gray">Số tiền bạn phải trả: <%=customer.getTotal()*0.7%>$</b>
             <%
        }
    %>
</div>
</body>
</html>
