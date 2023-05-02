<header>
    <nav class="navbar navbar-expand-sm navbar-dark">
        <div class="container-fluid">
            <a class="navbar-brand nav-item" href="Controller?page=index">
                <img src="assets/images/logo.png" alt="Logo" width="80px" height="80px" class="d-inline-block">
                .music
            </a>
            <ul class="nav-item">
                <li class="navbar-text hoverable"><a class="nav-link" href="index.html">INICIO</a></li>
                <li class="navbar-text hoverable"><a class="nav-link" href="play.html">CARRITO</a></li>
            </ul>
            <div class="nav_item">
                <c:when test="${session == null}">
                    <li><a href="Controller?page=login">Login</a></li>
                    <li> / </li>
                    <li><a href="Controller?page=sign-up">Sign-up</a></li>
                </c:when>
                <c:when test="${session != null}">
                    <li><a href="#">My Account(<c:out value="${username }"></c:out>)</a></li>
                </c:when>
                <a href="Controller?page=login" class="profile-link">
                    <img src="assets/images/user.png" width="50px" height="50px" alt="notificaciones">
                </a>
            </div>
        </div>
    </nav>
</header>
