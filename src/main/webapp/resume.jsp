<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Home</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
  <link rel="stylesheet" type="text/css" href="css/header.css">
  <link rel="stylesheet" type="text/css" href="css/cart_style.css">
</head>
<body>

<c:set var="items" value="${cart.getCart().keySet().size()}"></c:set>
<header>
  <nav class="navbar navbar-expand-sm navbar-dark">
    <div class="container-fluid">
      <a class="navbar-brand nav-item" href="Controller?page=resume">
        <img src="assets/images/logo.png" alt="Logo" width="80px" height="80px" class="d-inline-block">
        .music
      </a>
      <ul class="nav-item">
        <li class="navbar-text hoverable"><a class="nav-link" href="Controller?page=resume">HOME</a></li>
        <li class="navbar-text hoverable"><a class="nav-link" href="Controller?page=cart-resume">CART</a></li>
      </ul>
      <div class="nav_item account-manage">
        <ul class="nav-item">
            <li class="navbar-text hoverable manage-account"><a class="nav-link" href="#"><c:out value="${username}"></c:out></a></li>
        </ul>
        <a href="#" class="profile-link">
          <img src="assets/images/user.png" width="50px" height="50px" alt="notificaciones">
        </a>
      </div>
    </div>
  </nav>
</header>

<c:set var="items" value="${cart.getCart().keySet().size()}"></c:set>
<div class="container">
  <c:choose>
    <c:when test="${items > 0}">
      <table>
        <thead>
        <tr>
          <th>Title</th>
          <th>Author</th>
          <th>Country</th>
          <th>Price</th>
          <th>Quantity</th>
        </tr>
        </thead>
        <tbody>
        <c:set var="total" value="0"></c:set>
        <c:forEach items="${cart.getCart()}" var="mapItem" varStatus="i">
          <c:set var="total" value="${total + mapItem.key.getPrice() * mapItem.value}"></c:set>
          <tr>
            <td style="width: 100px;"><c:out value="${mapItem.key.getName()}"/></td>
            <td style="width: 50px;"><c:out value="${mapItem.key.getAuthor()}"/></td>
            <td style="width: 100px;"><c:out value="${mapItem.key.getCountry()}"/></td>
            <td style="width: 100px;"><c:out value="${mapItem.key.getPrice()} €"/></td>
            <td style="width: 100px;"><c:out value="${mapItem.value}"/></td>
          </tr>
        </c:forEach>
        </tbody>
      </table>
    </c:when>
  </c:choose>
  <c:choose>
    <c:when test="${total > 0}">
      <h4 style="margin-top: 40px;margin-bottom: 40px;">Order Total: <c:out value="${String.format(\"%.02f\", total)}"></c:out>€</h4>
    </c:when>
    <c:otherwise>
      <h4 style="margin-top: 40px;margin-bottom: 40px;">Order Total: 0€</h4>
    </c:otherwise>
  </c:choose>
  <a href="Controller?page=resume"><input type="button" value="Continue Shopping" class="btn btn-warning" style="width:100%;padding:8px;font-size:16px;"></a>
</div>
</body>
</html>