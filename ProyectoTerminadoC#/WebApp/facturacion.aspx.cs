using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Drawing;
using System.Text;
using System.Threading.Tasks;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Diagnostics;
using System.Globalization;



namespace WebApp
{
    public partial class facturacion : System.Web.UI.Page
    {
        DataTable dt = new DataTable();
        private CD_Producto objetoCD = new CD_Producto();
        private CD_Factura objetoCD2 = new CD_Factura();
        // ultimo num de factura
        //objetoCD2.NumFactura();
        DataTable tabla = new DataTable();
       

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Page.IsPostBack)
            {
                if (ViewState["Records"] == null)
                {
                    dt.Columns.Add("Codigo");
                    dt.Columns.Add("Descripcion");
                    dt.Columns.Add("Precio");
                    dt.Columns.Add("Cantidad");
                    dt.Columns.Add("Subtotal");
                    dt.Columns.Add("Impuesto");
                    dt.Columns.Add("Total");
                    ViewState["Records"]= dt;
                }
                
                DataTable tabla = new DataTable();
                tabla = objetoCD.MostrarBuscador();
                DdlBuscador3.DataSource = tabla;
                DdlBuscador3.DataTextField = "Descripcion";
                DdlBuscador3.DataValueField = "IdArticulo";
                DdlBuscador3.DataBind();
            }
            
        }

        protected void DdlBuscador3_SelectedIndexChanged(object sender, EventArgs e)
        {
            DdlBuscador3.SelectedValue = DdlBuscador3.SelectedItem.Value;
            int valor = Int32.Parse(DdlBuscador3.SelectedValue);
            MostrarProducto(valor);
        }

        public void MostrarProducto(int cod)
        {
            DataTable tabla = new DataTable();
            tabla = objetoCD.Mostrar(cod);
            TxtDescripcion.Text = tabla.Rows[0][1].ToString();
            TxtPrecio.Text = tabla.Rows[0][2].ToString();
            TxtIdArticulo.Text = tabla.Rows[0][0].ToString();
            
        }

        

        protected void BtnAgregar_Click(object sender, EventArgs e)
        {

            //DataRow row = dt.NewRow();
            //row[0] = TxtDescripcion.Text;
            //dt.Rows.Add(row);
            dt = (DataTable)ViewState["Records"];
            double subtotal = Double.Parse(TxtPrecio.Text) * Double.Parse(TxtCantidad.Text);
            double impuesto = subtotal * 0.15;
            double total = subtotal + impuesto;
            dt.Rows.Add(TxtIdArticulo.Text,TxtDescripcion.Text, TxtPrecio.Text, TxtCantidad.Text, subtotal,impuesto,total);
            //calculo subtotal
            double ssubtotal;
            if (TxtSubtotal.Text == "")
                ssubtotal = subtotal;
            else
                ssubtotal = Double.Parse(TxtSubtotal.Text) + subtotal;
            TxtSubtotal.Text = ssubtotal.ToString();

            //calculo Impuesto
            double iimpuesto;
            if (TxtTotalImp.Text == "")
                iimpuesto = impuesto;
            else
                iimpuesto = Double.Parse(TxtTotalImp.Text) + impuesto;
            TxtTotalImp.Text = iimpuesto.ToString();

            //calculo TOTAL
            double ttotal;
            if (TxtTOTAL.Text == "")
                ttotal = total;
            else

                ttotal = Double.Parse(TxtTOTAL.Text) + total;
            TxtTOTAL.Text = ttotal.ToString();

            GridView1.DataSource = dt;
            GridView1.DataBind();
           
           

            //GridView1.Rows[0].Cells.Add(new TableCell());
            //GridView1.Rows[0].Cells[0].Text = TxtDescripcion.Text;

        }
        public void AgregarFactura()
        {
            //// ultimo num de factura
            ////objetoCD2.NumFactura();
            //DataTable tabla = new DataTable();             
            tabla = objetoCD2.NumFactura();
            TxtNumFactura.Text = tabla.Rows[0][0].ToString();

            // agregar factura
            
            DateTime vfecha = DateTime.Now;
            string vnombre = TxtNomCliente.Text.ToString();
            decimal vsubtotal = decimal.Parse(TxtSubtotal.Text.ToString());
            int vimpuesto = 2005;
            decimal vtotal = decimal.Parse(TxtTOTAL.Text.ToString());

            objetoCD2.InsertarFactura(vfecha, vnombre, vsubtotal, vimpuesto, vtotal);

            // agregar detalle factura
           

            foreach(GridViewRow row in GridView1.Rows)
            {
                int vnumfactura1 = Int32.Parse(TxtNumFactura.Text.ToString());
                int vcodigo1 = Int32.Parse(row.Cells[0].Text);
                decimal vprecio1 = decimal.Parse(row.Cells[2].Text);
                int vcantidad1 = Int32.Parse(row.Cells[3].Text);
                decimal vsubtotal1 = decimal.Parse(row.Cells[4].Text);
                //int vimpuesto1 = decimal.Parse(row.Cells[5].Text);
                int vimpuesto1 = 2005;
                decimal vtotal1 = decimal.Parse(row.Cells[6].Text); 

                objetoCD2.InsertarDetalle(vnumfactura1, vcodigo1, vprecio1, vcantidad1, vsubtotal1, vimpuesto1, vtotal1);

            }





        }
        protected void BtnFacturar_Click(object sender, EventArgs e)
        {
            AgregarFactura();
        }
    }
}