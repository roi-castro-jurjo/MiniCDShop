<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <script src="https://code.jquery.com/jquery-3.3.1.js" integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60=" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <link rel="stylesheet" href="css/header.css">
    <title>.music</title>
</head>
<body>
<div id="header" style ="min-height: 105px;"></div>
<script src = "js/header-loader.js"></script>
<div class = "form-container">
    <form action="Controller" method="post">
        <input type="hidden" name="page" value="CD-selection">
        <b>CD:</b>
        <label for="dropdown">
            <select id = "dropdown" name = "title">
                <option>Yuan | The Guo Brothers | China | $14.95</option>
                <option>Drums of Passion | Babatunde Olatunji | Nigeria | $16.95</option>
                <option>Kaira | Tounami Diabate| Mali | $16.95</option>
                <option>The Lion is Loose | Eliades Ochoa | Cuba | $13.95</option>
                <option>Dance the Devil Away | Outback | Australia | $14.95</option>
                <option>Record of Changes | Samulnori | Korea | $12.95</option>
                <option>Djelika | Tounami Diabate | Mali | $14.95</option>
                <option>Rapture | Nusrat Fateh Ali Khan | Pakistan | $12.95</option>
                <option>Cesaria Evora | Cesaria Evora | Cape Verde | $16.95</option>
                <option>DAA | GSTIC | Spain | $50.00</option>
            </select>
        </label>
        <b>Cantidad:</b>
        <label>
            <input type="text" name="cantidad" value="1">
        </label>
        <p>
        <div style="text-align: center;">
            <button type="submit" value="Selecciona Producto">Añadir al carrito</button>
        </div>
    </form>
</div>
</body>

</html>