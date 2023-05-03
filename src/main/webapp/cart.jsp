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
          <a class="navbar-brand nav-item" href="Controller?page=index">
            <img src="assets/images/logo.png" alt="Logo" width="80px" height="80px" class="d-inline-block">
            .music
          </a>
          <ul class="nav-item">
            <li class="navbar-text hoverable"><a class="nav-link" href="Controller?page=index">HOME</a></li>
            <c:choose>
              <c:when test="${items < 1}">
                <li class="navbar-text hoverable"><a class="nav-link" href="Controller?page=cart">CART</a></li>
              </c:when>
              <c:otherwise>
                <li class="navbar-text hoverable"><a class="nav-link" href="Controller?page=cart">CART (<c:out value="${items}"></c:out>)</a></li>
              </c:otherwise>
            </c:choose>
          </ul>
          <div class="nav_item account-manage">
            <ul class="nav-item">
              <c:choose>
                <c:when test="${username == null}">
                  <li class="navbar-text hoverable manage-account"><a class="nav-link" href="Controller?page=login">Login</a></li>
                  <li class="navbar-text manage-account"> / </li>
                  <li class="navbar-text hoverable manage-account"><a class="nav-link" href="Controller?page=signup">Sign-up</a></li>
                </c:when>
                <c:otherwise>
                  <li class="navbar-text hoverable manage-account"><a class="nav-link" href="#"><c:out value="${username}"></c:out></a></li>
                </c:otherwise>
              </c:choose>
            </ul>
            <a href="Controller?page=login" class="profile-link">
              <img src="assets/images/user.png" width="50px" height="50px" alt="notificaciones">
            </a>
          </div>
        </div>
      </nav>
    </header>
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
              <th>Remove Item</th>
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
                <td style="width: 100px;">
                  <div>
                    <a href="Controller?page=decreaseQuantity&name=<c:out value="${mapItem.key.getName()}"/>"><span class="btn">-</span></a>
                    <span class="quantity-text"><c:out value="${mapItem.value}"/></span>
                    <a href="Controller?page=increaseQuantity&name=<c:out value="${mapItem.key.getName()}"/>"><span class="btn">+</span></a>
                  </div>
                </td>
                <td style="width: 100px;"><a href="Controller?page=removeItem&name=<c:out value="${mapItem.key.getName()}"/>"><span class="btn">X</span></a></td>
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
      <c:choose>
        <c:when test="${items > 0}">
          <a href="Controller?page=checkout"><input type="submit" value="Proceed to Checkout" class="btn btn-success" style="width:100%;padding:8px;font-size:16px;"></a><br>
        </c:when>
      </c:choose>
      <a href="Controller?page=index"><input type="button" value="Continue Shopping" class="btn btn-warning" style="width:100%;padding:8px;font-size:16px;"></a>
    </div>
  </body>
</html>