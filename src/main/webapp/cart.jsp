<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Home</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
  <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>


<div class="container">

  <c:choose>
    <c:when test="${x == 1}">
      <h4 style="margin-top: 40px;">My shopping bag(<c:out value="${x}"/> item)</h4>
    </c:when>
    <c:when test="${x > 1}">
      <h4 style="margin-top: 40px;">My shopping bag(<c:out value="${x}"/> items)</h4>
    </c:when>
    <c:otherwise >
      <h4 style="margin-top: 40px;">Your Shopping Bag is Empty</h4>
    </c:otherwise>

  </c:choose>
  <table style="table-layout: fixed;width: 100%;">
    <tr>
      <th>Item Name</th>
      <th>Author</th>
      <th>Country</th>
      <th>Price</th>
      <th>Remove Item</th>
    </tr>

  <c:set var="total" value="0"></c:set>
  <c:forEach items="${cart.getCart() }" var="product" varStatus="i">
      <c:set var="total" value="${total + product.getPrice()}"></c:set>

        <tr>
          <td style="width: 100px;"><c:out value="${product.getName()}"/></td>
          <td style="width: 50px;"><c:out value="${product.getAuthor()}"/></td>
          <td style="width: 100px;"><c:out value="${product.getCountry()}"/></td>
          <td style="width: 100px;"><c:out value="${product.getPrice()}"/></td>
          <td style="width: 100px;"><a href="Controller?page=removeItem&name=<c:out value="${product.getName()}"/>"><span class="btn btn-danger">X</span></a></td>
        </tr>

  </c:forEach>

  </table>
  <c:choose>
    <c:when test="${total > 0}">
      <h4 style="margin-top: 40px;margin-bottom: 40px;">Order Total: <c:out value="${String.format(\"%.02f\", total)}"></c:out>€</h4>
    </c:when>
    <c:otherwise>
      <h4 style="margin-top: 40px;margin-bottom: 40px;">Order Total: 0€</h4>
    </c:otherwise>
  </c:choose>

  <a href="Controller?page=checkout"><input type="submit" value="Proceed to Checkout" class="btn btn-success" style="width:100%;padding:8px;font-size:16px;"></a><br>
  <a href="Controller?page=index"><input type="button" value="Continue Shopping" class="btn btn-warning" style="width:100%;padding:8px;font-size:16px;"></a>


</div>
</body>
</html>