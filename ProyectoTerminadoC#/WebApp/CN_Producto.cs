using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


namespace WebApp
{
    public class CN_Producto
    {
        private CD_Producto objetoCD = new CD_Producto();
        public DataTable MostrarProducto()
        {
            DataTable tabla = new DataTable();
            tabla = objetoCD.Mostrar();
            return tabla;
        }

        public void InsertarProducto(string Descripcion, double Precio, double Costo, bool Estado)
        {
            objetoCD.Insertar(Descripcion,Convert.ToDouble(Precio), Convert.ToDouble(Costo),Estado);

        }

        public void EditarProducto(int codigo, string Descripcion, double Precio, double Costo, bool Estado)
        {
            objetoCD.Editar(Convert.ToInt32(codigo),Descripcion, Convert.ToDouble(Precio), Convert.ToDouble(Costo), Estado);
        }
    }
}