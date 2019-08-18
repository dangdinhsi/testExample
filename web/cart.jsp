<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Sidang
  Date: 8/18/2019
  Time: 3:50 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        div{
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
<div>
    <a href="index.jsp"><button>BACK TO LIST</button></a>
</div>
<div>
    <table border="1">
        <tr>

            <th>Product Id</th>
            <th>Name Product</th>
            <th>Price</th>
            <th>Quantity</th>
            <th>Total</th>
            <c:set var="s" value="0"></c:set>
            <c:forEach var="item" items="${sessionScope.cart}">
                <c:set var="s" value="${s+item.p.price * item.quantity}"></c:set>
        <tr>

            <td>${item.p.id}</td>
            <td>${item.p.nameProduct}</td>
            <td>${item.p.price}</td>
            <td>${item.quantity}</td>
            <td>${item.p.price * item.quantity}</td>
        </tr>
        </c:forEach>
        </tr>
        <tr>
            <th colspan="4" align="center">Total</th>
            <td>${s}</td>
        </tr>
    </table>
</div>

<div>
    <h1>Phiếu Mua Hàng</h1>
    <form action="/order" method="post">
        <div>
            Tên Khách Hàng: <input type="text" name="customerName">
        </div>
        <div>
            Địa Chỉ: <input type="text" name="address">
        </div>
       <div>
           SĐT: <input type="text" name="phone">
       </div>
       <div>
           Tổng số tiền phải trả: <input type="text" value="${s}" name="total" readonly>
       </div>
        <div>
            <input type="submit" value="Mua Hàng">
            <input type="reset" value="Nhập lại thông tin">
        </div>
    </form>
</div>

</body>
</html>
