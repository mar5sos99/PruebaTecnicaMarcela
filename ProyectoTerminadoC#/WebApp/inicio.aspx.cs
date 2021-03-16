using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace WebApp
{
    public partial class inicio : System.Web.UI.Page
    {
        private CD_Producto objetoCD = new CD_Producto();
        protected void Page_Load(object sender, EventArgs e)
        {
           
            if (!IsPostBack)
            {
               
                    DataTable tabla = new DataTable();
                    tabla = objetoCD.MostrarBuscador();
                    DdlBuscador1.DataSource = tabla;
                    DdlBuscador1.DataTextField = "Descripcion";
                    DdlBuscador1.DataValueField = "IdArticulo";
                    DdlBuscador1.DataBind();
                   
            }
        }

        protected void DdlBuscador1_SelectedIndexChanged(object sender, EventArgs e)
        {
            DdlBuscador1.SelectedValue = DdlBuscador1.SelectedItem.Value;
            int valor = Int32.Parse(DdlBuscador1.SelectedValue);
            MostrarProducto(valor);
        }

        public void MostrarProducto(int cod)
        {
            DataTable tabla = new DataTable();
            tabla = objetoCD.Mostrar(cod);
            TxtCodigo.Text = tabla.Rows[0][0].ToString();
            TxtDescripcion.Text = tabla.Rows[0][1].ToString();
            TxtPrecio.Text = tabla.Rows[0][2].ToString();
            TxtCosto.Text = tabla.Rows[0][3].ToString();
            DdlEstado.SelectedItem.Value = tabla.Rows[0][4].ToString();
            //string estado = tabla.Rows[0][4].ToString();
            //if (estado == "1")
            //    DdlEstado. = 1;
            //else
            //    DdlEstado.SelectedItem.Value = 0;
        }

        protected void BtnEditar_Click(object sender, EventArgs e)
        {
            popup2.Style.Add("display", "block");
            
            TxtCodigo2.Text = TxtCodigo.Text;
            TxtDescripcion2.Text = TxtDescripcion.Text;
            TxtPrecio2.Text = TxtPrecio.Text;
            TxtCosto2.Text = TxtCosto.Text;
            DdlEstado2.SelectedItem.Value = DdlEstado.SelectedItem.Value;
        }

        protected void BtnGuardar_Click(object sender, EventArgs e)
        {
            popup2.Style.Add("display", "none");

            EditarProducto();
           

        }
        public void EditarProducto()
        {
            int codigo = Int32.Parse(TxtCodigo.Text);
            string Descripcion = TxtDescripcion2.Text;
            double Precio = double.Parse(TxtPrecio2.Text);
            double Costo = double.Parse(TxtCosto2.Text);
            Boolean Estado;
            if (DdlEstado2.SelectedItem.Value == "1")
                Estado = true;
            else
                Estado = false;
            
                 

            
            objetoCD.Editar(codigo, Descripcion, Precio, Costo, Estado);

           
        }
        //protected void BtnActPorcentaje_Click(object sender, EventArgs e)
        //{
        //    popup1.Style.Add("display", "block");

         
        //}
        //protected void BtnPorcentaje_Click(object sender, EventArgs e)
        //{
        //    popup1.Style.Add("display", "none");

        //    EditarPorcentaje();
        //    InsertarPorcentaje();


        }
        //public void EditarPorcentaje()
        //{
        //    objetoCD.EdPorcentaje();
        //}

        //public void InsertarPorcentaje()
        //{
        //    double Porcentaje = double.Parse(Txtporcentaje.Text);
        //    DateTime Fecha = DateTime.Now; 
            
        //    objetoCD.InsPorcentaje(Porcentaje,Fecha,true);
        //}

        //public void MostrarPorcentaje()
        //{
        //    Txtporcentaje.Text = objetoCD.MostrarImpuesto().ToString();
        //}
        

    }
