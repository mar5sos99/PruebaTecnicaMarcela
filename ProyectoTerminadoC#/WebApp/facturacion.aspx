<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="facturacion.aspx.cs" Inherits="WebApp.facturacion" %>

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
    margin: 2%;
    
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

/************cuadro del formulario principal***************/
.borde {
    border: 3px solid #E0B589;
    /*padding: 1%;*/
}

.div-principal {
    overflow: hidden;
    width: auto;
    height:500px;
}

/**************seccion izquierda del formulario***************/
.lado-izq {
    position: inherit;
    width: 60%;
    float: left;
    height:100%;
}

 /********* parte de arriba************/
.lado-izq-top {
    padding: 10px;
    height: 20%;
    border: 3px solid #E0B589;
    border-top:none;
    border-left:none;
}

    .lado-izq-top div {
        display: inline-block;
        
        line-height: 30pt;
        text-align: right;
        
    }

    .lado-izq-top input {
        border-radius: 10px;
        border: 2px solid #E0B589;
        background-color: #F5F2F2;
        height: 25px;
        width: 90%;
        margin: 4px;
        text-indent: 20px;
        float: left;
    }

.parte1 {    
    width:24%
}

.parte2 {
    width:25%;
}

/*********parte del medio***********/
.lado-izq-medio {
    height: 50%;
    border: 3px solid #E0B589;
    border-left:none;
    border-top:none;
}

table, td, th {
    border: 1px solid #E0B589;
}

table {
    border-collapse: collapse;
}

/***************parte de abajo**********/
.lado-izq-bottom {
    height: 30%;
    float: right;
    border: 3px solid #E0B589;
    border-top:none;
    width:35%;
   
    padding-left:50px;
    
}

    .lado-izq-bottom div {
        display: inline-block;
        line-height: 30pt;
        text-align: right;
    }

    .lado-izq-bottom input {
        border-radius: 10px;
        border: 2px solid #E0B589;
        background-color: #F5F2F2;
        height: 25px;
        width: 50%;
        margin: 4px;
        text-indent: 20px;
        float: left;
    }

.bot1 {

    width:20%;
}

.bot2 {
    width: 30%;
}
/**************seccion izquierda del formulario***************/
.lado-der {
    position: inherit;
    width: 40%;
    float: right;

}

/********* parte de arriba************/
.lado-der-top {
    padding: 30px;
    padding-left:20%;
    height: 100px;
    border: 3px solid #E0B589;
    border-top: none;
    border-left: none;
    border-right: none;
    
}

    .ddl {
        border-radius: 10px;
        border: 2px solid #E0B589;
        background-color: #F5F2F2;
        height: 25px;
        width: 70%;
        margin: 4px;
        text-indent: 20px;
        float: left;
        
    }

/********* parte del medio************/
.lado-der-medio {
    padding: 10px;
    height: 200px;
    border: 3px solid #E0B589;
    border-top: none;
    border-left: none;
    border-right: none;
}
.med-part1 {
    
   
    /*text-align: right;*/
    height: 50%;
    
    width: 100%;
}

    .div1 {
        display: inline-block;
        width: 30%;
        height: 100%;
        text-align: right;
        line-height: 40pt;
    }
    .div2 {
        display: inline-block;
        width: 30%;
        height: 100%;
        text-align: left;
        line-height: 40pt;
    }

        .div2 input {
            border: none;
            border-bottom: 3px solid #E0B589;
            background-color: #F5F2F2;
            height: 25px;
            width: 80%;
            margin-left: 15px;
        }
    .div3 {
        display: inline-block;
        width: 30%;
        float:right;
        height:100%;
        padding:10px;
    }
        .div3 input {
            margin-left: 45px;
            margin-top: 20px;
            border: 3px solid #E0B589;
            background-color: #F5F2F2;
            height: 25px;
        }


.boton {
    border-radius: 10px;
    border: 3px solid #363945;
    color: #363945;
    background-color: #F5f2F2;
    height: 30px;
    width: 120px;
    letter-spacing: 1px;
    margin-left:200px;
}

    .boton:hover {
        color: #F5f2F2;
        background-color: #363945;
    }


    </style>

</head>
<body>
    <form id="form1" runat="server">
        <div class="topnav">
        <a href="facturacion.aspx">Facturación</a>
        <a href="inicio.aspx">Mantenimiento de producto</a>
        </div>
    
    <div class="div-principal borde">


        <div class="lado-izq ">
            
            <div class="lado-izq-top">
                <div class="parte1">
                    <label>N° de factura</label> <br />
                    <label>Nombre del cliente</label><br />
                </div>
                <div class="parte2">
                    <%--<input id="NumFactura" /><br />
                    <input id="NomCliente" /><br />--%>
                    <asp:TextBox ID="TxtNumFactura" runat="server"></asp:TextBox><br />
                <asp:TextBox ID="TxtNomCliente" runat="server"></asp:TextBox><br />
                </div>
                <div class="parte1">
                    <label>Fecha</label><br />
                    <label>% de Impuesto</label><br />
                </div>
                <div class="parte2">
                    <%--<input type="date" /><br />
                    <input id="Impuesto" /><br />--%>
                     <asp:TextBox ID="TxtDate" runat="server"></asp:TextBox><br />
                <asp:TextBox ID="TxtImpuesto" runat="server"></asp:TextBox><br />
                </div>
            </div>
            
            <div class="lado-izq-medio">
                <%--<table style="width:100%">
                    <tr>
                        <th>Código</th>
                        <th>Descripción</th>
                        <th>Precio</th>
                        <th>Cantidad</th>
                        <th>Subtotal</th>
                        <th>Impuesto</th>
                        <th>Total</th>
                    </tr>
                    <tr>
                        <td>000</td>
                        <td>cocoa</td>
                        <td>100</td>
                        <td>3</td>
                        <td>300</td>
                        <td>36</td>
                        <td>336</td>
                    </tr>
                </table>--%>
                <asp:GridView ID="GridView1" runat="server" ></asp:GridView>
                <%--<Columns>
                    <%--<asp:DynamicField HeaderText="jj" />
                     <asp:DynamicField HeaderText="Código" />
                        <asp:DynamicField HeaderText="Descripción" />
                        <asp:DynamicField HeaderText="Precio" />
                        <asp:DynamicField HeaderText="Cantidad" />
                        <asp:DynamicField HeaderText="Subtotal" />
                        <asp:DynamicField HeaderText="Impuesto" />
                        <asp:DynamicField HeaderText="Total" />
                </Columns>--%>
                       
            
          
            </div>
           
            <div class="lado-izq-bottom">
                <div class="bot-1">
                    <label>Subtotal</label><br />
                    <label>Impuestos</label><br />
                    <label>TOTAL</label><br />
                </div>
                <div class="bot-2">
                    <%--<input id="subtotal" /><br />
                    <input id="totalImp"/><br />
                    <input id="TOTAL"/><br />--%>
                    <asp:TextBox ID="TxtSubtotal" runat="server"></asp:TextBox><br />
                    <asp:TextBox ID="TxtTotalImp" runat="server"></asp:TextBox><br />
                    <asp:TextBox ID="TxtTOTAL" runat="server"></asp:TextBox><br />
                </div>
            </div>
        </div>
        
       
        <div class="lado-der">

            <div class="lado-der-top">

                <label>Agregar Producto</label><br /><br />
                <label>
                    <%--<input list="browsers" type="text" placeholder="Ingrese el código" />--%>
                  
                      <asp:DropDownList ID="DdlBuscador3" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DdlBuscador3_SelectedIndexChanged"></asp:DropDownList>

                </label>
                

            </div>
            <div class="lado-der-medio">
                <div class="med-part1">
                    <div class="div1">
                        <label>Producto</label><br />
                        <label>Precio</label><br />
                        <label>Código</label><br />
                    </div>
                    <div class="div2">
                       <%-- <input id="descripcion" /><br />
                        <input id="precio" /><br />--%>
                        <asp:TextBox ID="TxtDescripcion" runat="server"></asp:TextBox><br />
                        <asp:TextBox ID="TxtPrecio" runat="server"></asp:TextBox><br />
                        <asp:TextBox ID="TxtIdArticulo" runat="server"></asp:TextBox><br />
                        <%--<asp:TextBox ID="TxtCantidad" runat="server"></asp:TextBox><br />--%>
                    </div>
                    <div class="div3">
                        <label>Cantidad</label><br />
                        <%--<input type="number" min="1" max="100" /><br />--%>
                        <asp:TextBox ID="TxtCantidad" runat="server"></asp:TextBox><br />
                    </div>
                </div>

               <br /><br />                
                        <%--<button class="boton">Agregar</button>--%><br />      
                 <asp:Button ID="BtnAgregar" runat="server" Text="Agregar" class="boton" OnClick="BtnAgregar_Click"  />


            </div>
            
            <div >
                <br /><br />
                <%--<button class="boton">Facturar</button>--%>
                 <asp:Button ID="BtnFacturar" runat="server"  Text="Facturar" Class="boton" OnClick="BtnFacturar_Click"  />
            </div>

        </div>

    </div>



    </form>
</body>
</html>
