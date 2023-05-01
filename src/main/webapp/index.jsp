<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Musica para DAA</title>
</head>
<body style="background-color: #FDF5E6">
<table align="center" border="0">
    <tr>
        <th><img src="" ALIGN="CENTER" alt="imagen"></th>
        <th><font face="Times New Roman,Times" size="+3">Música para DAA</font></th>
        <th><img SRC="" ALIGN="CENTER" alt="imagen"></th>
    </tr>
</table>
<hr>
<p>
<div style="text-align: center;">
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
<hr>
</body>
</html>