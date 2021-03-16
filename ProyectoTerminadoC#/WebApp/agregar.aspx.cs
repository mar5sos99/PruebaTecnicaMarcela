using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace WebApp
{
    
    public partial class agregar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

       
        private CD_Producto objetoCD = new CD_Producto();
        public void AgregarProducto()
        {
            
            string Descripcion = TxtDescripcion.Text;
            double Precio = double.Parse(TxtPrecio.Text);
            double Costo = double.Parse(TxtCosto.Text);
            Boolean Estado;
            if (DdlEstado.SelectedItem.Value == "1")
                Estado = true;
            else
                Estado = false;




            objetoCD.Insertar(Descripcion, Precio, Costo, Estado);
        }
    

        protected void BtnAgregar_Click(object sender, EventArgs e)
        {
            AgregarProducto();
               
        }
    }
}