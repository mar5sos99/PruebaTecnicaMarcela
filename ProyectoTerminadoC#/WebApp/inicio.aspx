<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="inicio.aspx.cs" Inherits="WebApp.inicio" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
   
    <title>Mantenimiento</title>
    <style type="text/css">
        body {
            background-color: #F5F2F2;
            box-sizing: border-box;
            font-family: Segoe UI,Geneva,Tahoma, Verdana, sans-serif;
            margin:2%;
        }
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

/***************barra de secciones*****************/
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

    /************cuadro del formulario principal***************/

.borde {
    border: 3px solid #E0B589;
    padding: 2%;
    
}

.div-principal {
    overflow: hidden;
    width: auto;
    
}

/*seccion de arriba */
.div-top #DdlBuscador1{
    position: inherit;
    height: 50px;
    width: 100%;
    padding: 2%;
    display: inline-block;
}
    .div-top label {
        letter-spacing: 1px;
        margin-left:80px;
    }
        .div-top #DdlBuscador1 {
            position: center;
            width: 400px;
            height: 45px;
            border: none;
            border-radius: 15px;
            background-color: #EFE1CE;
            color: #939597;
            text-indent:10px;
            margin-left:50px;
        }
 
         /*seccion de la izquierda*/
.div-izq {
    position:inherit;
    width: 60%;
    float:left;
}

        /* labels */
    .form-izq {
        position: inherit;
        float: left;
        width: 30%;
        margin-top: 10px;
        text-align: right;
        line-height: 40pt;
        letter-spacing:1.5px;
    }
        /* textbox */
    .form-der {
        position: inherit;
        float: right;
        width: 60%;
        margin-top: 9px;
        line-height: 40pt;
            margin-left: 0px;
        }
        .form-der input {
            border: none;
        
            border-bottom: 3px solid #E0B589;
            background-color: #F5F2F2;
            height: 25px;
            width: 300px;
        }
/*seccion de la derecha*/
.div-der {
    position:inherit;
    width:40%;
    float:right;
    
}

    .div-der button {
        border-radius: 10px;
        border: 3px solid #363945;
        color: #363945;
        background-color: #F5f2F2;
        height: 50px;
        width: 120px;
        letter-spacing: 1px;
        float:right;
    }

    
        .div-der button:hover {
            color: #F5f2F2;
            background-color: #363945;
        }

 /***************sub-seccion de porcentaje de impuestos*************/
.div-impuestos {
    overflow: hidden;
    width: auto;
    margin: 20px;
    margin-bottom: 0px;
    padding: 4%;
}
    .div-impuestos label {
        letter-spacing: 1px;
    }

    .div-impuestos input {
        border: none;
        border-bottom: 3px solid #E0B589;
        background-color: #F5F2F2;
        height: 25px;
        width: 60px;
        text-indent:20px;
        margin-left:25%;
    }

    /******************formulario para cambiar el porcentaje de impuesto*************/
.popup-form1 {
    display:none;
    overflow: hidden;
    position: absolute;
    bottom: 0;
    left: 27%;
    top: 25%;
    width: 600px;
    height: 400px;
    background-color: #F5F2F2;
}
.p-f-top {
    position: relative;
    height: 50px;
    width: 100%;
    padding: 2%;
    text-align: center;
    letter-spacing: 1px;
    margin-top:8%;
}

.p-f-izq {
    position: relative;
    float: left;
    width: 45%;
    
    text-align: right;
    line-height: 40pt;
    letter-spacing: 1.5px;
}

.p-f-der {
    position: relative;
    float: right;
    width: 50%;
    text-align: left;
    
    line-height: 40pt;
}

    .p-f-der input {
        border-radius: 10px;
        border: 2px solid #E0B589;
        
        height: 25px;
        width: 200px;
    }

.p-f-bottom {
   
    padding-left: 240px;
    padding-top: 170px;
    
}

.boton {
    border-radius: 10px;
    border: 3px solid #363945;
    color: #363945;
    background-color: #F5f2F2;
    height: 50px;
    width: 120px;
    letter-spacing: 1px;
    
}
    .boton:hover {
        color: #F5f2F2;
        background-color: #363945;
    }

    /************formulario para editar los productos*************/
.popup-form2 {
    display: none;
    overflow: hidden;
    position: absolute;
    
    left: 20%;
    top: 25%;
    width: 800px;
    height: 400px;
    background-color: #F5F2F2;
}

.p-f2-top {
    position: relative;
    height: 30px;
    width: 100%;
    padding: 1%;
    text-align: center;
    letter-spacing: 1px;
    
}

.p-f2-izq {
    position: relative;
    float: left;
    width: 45%;
    text-align: right;
    line-height: 40pt;
    letter-spacing: 1.5px;
   
}

.p-f2-der {
    position: relative;
    float: right;
    width: 50%;
    text-align: left;
    line-height: 40pt;
    
}

    .p-f2-der input {
        border-radius: 10px;
        border: 2px solid #E0B589;
        height: 25px;
        width: 200px;
    }

    .content-select select {
        border-radius: 10px;
        border: 2px solid #E0B589;
        background-color: #F5F2F2;
        height: 33px;
        width: 210px;
    }


   .p-f2-bottom{
       margin-left:43%;
       margin-top:4%;
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


        <div class="div-top">
            <label>Buscar Producto</label>
            <%--<input list="browsers" type="text" placeholder="Ingrese el código del producto" />--%>
            <asp:DropDownList ID="DdlBuscador1" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DdlBuscador1_SelectedIndexChanged"></asp:DropDownList>
        </div>
    

        <div class="div-izq">

            <div class="form-izq">
                <label>Código</label> <br />
                <label>Descripción</label> <br />
                <label>Precio del producto</label> <br />
                <label>Costo de producción</label> <br />
                <label>Estado</label> <br />
            </div>
            <div class="form-der">
                <%--<input id="codigo" /><br />
                <input id="decripcion" /><br />
                <input id="precio" /><br />
                <input id="costo" /><br />
                <input id="estado" /><br />--%>
                 <asp:TextBox ID="TxtCodigo" runat="server"></asp:TextBox><br />
                <asp:TextBox ID="TxtDescripcion" runat="server"></asp:TextBox><br />
                <asp:TextBox ID="TxtPrecio" runat="server"></asp:TextBox><br />
                <asp:TextBox ID="TxtCosto" runat="server"></asp:TextBox><br />
                <asp:DropDownList ID="DdlEstado" runat="server">
                    <asp:ListItem Value="1">Activo</asp:ListItem>
                    <asp:ListItem Value="0">Inactivo</asp:ListItem>
                </asp:DropDownList><br />
                <%--<button class="boton" style="float:right;" onclick="openForm2()">Editar Datos</button>--%>
               
                
            </div>
            <asp:Button ID="BtnEditar" runat="server" Text="Editar Datos" class="boton" style="float:right;" OnClick="BtnEditar_Click" /> 
        </div>

        <div class="div-der">
            <div class="div-impuestos borde">
                <label>Porcentaje de impuesto actual</label><br /><br />
                <input id="impuesto" /><br />
                <button onclick="openForm1()">Actualizar % de Impuestos</button>
<%--                <asp:Button ID="BtnActPorcentaje" CssClass="boton" runat="server" Text="Actualizar % de Impuestos" OnClick="BtnActPorcentaje_Click"/>  --%>

            </div>
            <br /><br /><br />
            
        </div>

   
    </div>
    <div class="popup-form1 borde" id="popup1" runat="server">
        <div class="p-f-top">
            <label>Ingresar nuevo porcentaje de impuestos</label>
        </div>

        <div class="p-f-izq">
            <label>Fecha</label><br />
            <label>Porcentaje Nuevo</label>
        </div>

        <div class="p-f-der">
            <input id="fecha" type="date" /><br />
            <input id="porcentaje" />
            <%--<asp:TextBox ID="Txtfecha" type="date" runat="server"></asp:TextBox><br />
            <asp:TextBox ID="Txtporcentaje" runat="server"></asp:TextBox>--%>
               
        </div>

        <div class="p-f-bottom">
            <button class="boton" onclick="closeForm1()">Actualizar Porcentaje</button>
            <%--<asp:Button ID="BtnPorcentaje" runat="server" Text="Actualizar Porcentaje" class="boton" OnClick="BtnPorcentaje_Click"/>  
      --%>  <br />  
        </div>
    </div>

    <div class="popup-form2 borde" id="popup2" runat="server">
        <div class="p-f2-top">
            <label>Ingrese los datos actualizados del Producto</label>
        </div>
        
        <div class="p-f2-izq">
            <label>Código</label> <br />
            <label>Descripción</label> <br />
            <label>Precio del producto</label> <br />
            <label>Costo de producción</label> <br />
            <label>Estado</label> <br />
        </div>

        <div class="p-f2-der">
            <%--<input id="codigo" /><br />
            <input id="decripcion" /><br />
            <input id="precio" /><br />
            <input id="costo" /><br />
            <div class="content-select">
                <select id="estado">
                    <option value="0">Activo</option>
                    <option value="1">Inactivo</option>
                </select>
            </div>--%>
             <asp:TextBox ID="TxtCodigo2" runat="server"></asp:TextBox><br />
                <asp:TextBox ID="TxtDescripcion2" runat="server"></asp:TextBox><br />
                <asp:TextBox ID="TxtPrecio2" runat="server"></asp:TextBox><br />
                <asp:TextBox ID="TxtCosto2" runat="server"></asp:TextBox><br />
                <asp:DropDownList ID="DdlEstado2" runat="server">
                    <asp:ListItem Value="1">Activo</asp:ListItem>
                    <asp:ListItem Value="0">Inactivo</asp:ListItem>
                </asp:DropDownList>
        </div>
        <%--<button id="Button1" runat="server"  class="boton p-f2-bottom" onclick="closeForm2()">Guardar Cambios</button>--%>
        <asp:Button ID="BtnGuardar" runat="server" Text="Guardar Cambios" class="boton p-f2-bottom" OnClick="BtnGuardar_Click"/>  
        <br />                                                               
 </div><br /><br />
        
        <%--<script type="javascript" runat="server">
            function openForm1() {
                document.getElementById("popup1").style.display = "block";
            }
            
            function closeForm1() {
                document.getElementById("popup1").style.display = "none";
            }

            function openForm2() {
                document.getElementById("popup2").style.display = "block";
            }

            function closeForm2() {
                document.getElementById("popup2").style.display = "none";
            }
        </script>--%>
    </form>
    
    

           
</body>
</html>
