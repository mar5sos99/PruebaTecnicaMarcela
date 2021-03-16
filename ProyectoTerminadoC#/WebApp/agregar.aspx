<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="agregar.aspx.cs" Inherits="WebApp.agregar" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style>
        body {
    background-color: #F5F2F2;
    box-sizing: border-box;
    font-family: Segoe UI,Geneva,Tahoma, Verdana, sans-serif;
    margin:2%;
    margin-left:6%;
}

/*barra de navegación*/

.topnav {
    
    padding: 20px;
    text-align: right;

}

    .topnav a {
        padding: 14px 16px;
        color: #363945;
        font-size: 20px;
        display: inline-block;
        text-decoration: none;
        
    }
        .topnav a:hover {
            border-bottom: 2px solid #E0B589;
            letter-spacing: 1px;
        }

/*barra de secciones*/
.seccion a {
    padding: 10px 15px 0px;
    color: #9A8B4F;
    font-size: 18px;
    display: inline-block;
    border-bottom: none;
    text-decoration: none;
    margin-right:0%;
}

    .seccion a:hover {
        font-size: 19px;
    }

    /*cuadro principal*/

.borde {
    border: 3px solid #E0B589;
    padding: 2%;
    
}

.div-principal {
    overflow: hidden;
    width: 90%;
    
}

        /*seccion de la izquierda*/
.div-izq {
    position:inherit;
    width: 80%;
    float:left;
}

        /* labels */
    .form-izq {
        position: inherit;
        float: left;
        width: 47%;
        margin-top: 10px;
        text-align: right;
        line-height: 40pt;
        letter-spacing:1.5px;
    }
        /* textbox */
    .form-der, .form-der-sol {
        position: inherit;
        float: right;
        width: 50%;
        margin-top: 9px;
        line-height: 40pt;
    
    }
        .form-der input .form-der-sol-2{      
            border-radius:10px;
            border: 2px solid #E0B589;
            
            height: 25px;
            width: 300px;
        }

.content-select select {
    border-radius: 10px;
    border: 2px solid #E0B589;
    background-color: #F5F2F2;
    height: 33px;
    width: 308px;
}

/*seccion de la derecha*/
.div-der {
    position: inherit;
    width: 20%;
    float: right;
}

    .boton {
        border-radius: 10px;
        border: 3px solid #363945;
        color: #363945;
        background-color: #F5f2F2;
        height: 50px;
        width: 130px;
        letter-spacing: 1px;
        float:right;
        margin-top:95%;
        margin-right:30%;
    }

        .boton:hover {
            color: #F5f2F2;
            background-color: #363945;
        }

   



.forder input {
    border: none;
    border-radius: 10px;
    border-bottom: 2px solid #E0B589;
    background-color: #F5F2F2;
    height: 25px;
    width: 300px;
}

    </style>
</head>
<body>
    <form id="form1" runat="server">
       <div class="topnav">
        <a href="facturacion.aspx">Facturación</a>
        <a href="inicio.aspx">Mantenimiento de producto</a>
        </div>
        
        <div class="seccion">
        <a class="borde" href="inicio.aspx">Actualizar Producto</a>
        <a href="agregar.aspx">Agregar Producto</a>
        </div>
    
    <div class="div-principal borde">
        <div class="div-izq">
            <br />
            <label>Ingrese los datos del nuevo Producto</label><br /><br />
            <div class="form-izq">
                <label>Código</label> <br />
                <label>Descripción</label> <br />
                <label>Precio del producto</label> <br />
                <label>Costo de producción</label> <br />
                <label>Estado</label> <br />
            </div>
            <div class="form-der form-der-sol " >
                <%--<input id="codigo" />--%>
                <asp:TextBox ID="TxtCodigo" class="form-der-sol-2" runat="server"></asp:TextBox><br />
                <asp:TextBox ID="TxtDescripcion" class="form-der-sol-2" runat="server"></asp:TextBox><br />
                <asp:TextBox ID="TxtPrecio" class="form-der-sol-2" runat="server"></asp:TextBox><br />
                <asp:TextBox ID="TxtCosto"  class="form-der-sol-2" runat="server"></asp:TextBox><br />
                <%--<input id="decripcion" /><br />
                <input id="precio" /><br />
                <input id="costo" /><br />--%>
                <asp:DropDownList ID="DdlEstado" class="form-der-sol-2" runat="server">
                    <asp:ListItem Value="1">Activo</asp:ListItem>
                    <asp:ListItem Value="0">Inactivo</asp:ListItem>
                </asp:DropDownList>
                <%--<div class="content-select">
                    <select id="estado">
                        <option value="0">Activo</option>
                        <option value="1">Inactivo</option>
                    </select>
                </div>--%>                 
            </div>
        </div>
        
        <div class="div-der">
            
            <br /><br /><br /><br />
            <asp:Button ID="BtnAgregar" runat="server" CssClass="boton" Text="Agregar Producto" OnClick="BtnAgregar_Click" />
        </div>
            
            
        
    </div>
    </form>
</body>
</html>
