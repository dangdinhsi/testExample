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
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <script>
        function checkBuy() {
           var x= document.getElementById("money").value;
           var name = document.getElementById("name").value;
            var address = document.getElementById("address").value;
            var phone = document.getElementById("phone").value;
           if(name.length==0||address.length==0||phone.length==0){
               alert("Bạn chưa điền đầy đủ thông tin phiếu mua hàng,Vui lòng điền lại!!!");
              return false;
           }else if(parseInt(x)==0){
               alert("Vui lòng nhập số lượng sản phẩm!!!");
               return false;
           }else {
               return true;
           }
        }
    </script>
</head>
<body>
<div class="container">
<div style="margin-top: 20px">
    <a href="index.jsp"><button>BACK TO LIST</button></a>
</div>
<div style="width: 500px">
    <form action="ShoppingCartController?action=update" method="post">
    <table class="table table-bordered text-center">
        <tr>
            <th>ID</th>
            <th>Name</th>
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
            <td><input type="text" name="quantity" value="${item.quantity}" style="width: 60px"></td>
            <td>${item.p.price * item.quantity}$</td>
        </tr>
        </c:forEach>
        </tr>
        <tr>
            <th colspan="4" align="center">Total</th>
            <td>${s}$</td>
        </tr>
        <tr>
            <th colspan="5"><input type="submit" value="Update" style="width: 100px"></th>
        </tr>
    </table>
    </form>
</div>

<div style="width: 500px;border:1px solid gray;border-radius: 10px;padding: 10px" align="center">
    <h1>Phiếu Mua Hàng</h1>
    <form action="/order" method="post">
        <div class="form-group">
            Customer Name <input type="text" name="customerName" id="name" class="form-control">
        </div>
        <div class="form-group">
            Address <input type="text" name="address" id="address" class="form-control">
        </div>
       <div class="form-group">
           Phone <input type="text" name="phone" id="phone" class="form-control">
       </div>
       <div class="form-group">
           Total Cost<input id="money" type="text" value="${s}" name="total" readonly style="width: 60px" class="form-control">
       </div>
        <div class="form-group">
            <input type="submit" value="PAY" onclick="return checkBuy();" class="btn-success form-control">
        </div>
        <div class="form-group">
            <input type="reset" value="Reset" class="btn-secondary form-control">
        </div>
    </form>
</div>
</div>
</body>
</html>
