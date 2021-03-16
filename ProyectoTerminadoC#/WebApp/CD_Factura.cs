using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace WebApp
{
    public class CD_Factura
    {

        private CD_Conexion conexion = new CD_Conexion();

        SqlDataReader leer;
        DataTable tabla = new DataTable();
        SqlCommand comando = new SqlCommand();

        

        public DataTable MostrarBuscador()
        {
            comando.Connection = conexion.AbrirConexion();
            comando.CommandText = "spSelectBuscador";
            comando.CommandType = CommandType.StoredProcedure;
            leer = comando.ExecuteReader();
            tabla.Load(leer);
            conexion.CerrarConexion();
            return tabla;

        }

        public void InsertarDetalle(int NumFact, int codigo, Decimal Precio, int Cantidad, Decimal Subtotal, int Impuesto, Decimal Total)
        {
            comando.Connection = conexion.AbrirConexion();
            comando.CommandText = "spInsertDetalleFactura";
            comando.CommandType = CommandType.StoredProcedure;
            comando.Parameters.AddWithValue("@IdFactura", NumFact);
            comando.Parameters.AddWithValue("@IdArticulo", codigo);
            comando.Parameters.AddWithValue("@Precio", Precio);
            comando.Parameters.AddWithValue("@Cantidad", Cantidad);
            comando.Parameters.AddWithValue("@Subtotal", Subtotal);
            comando.Parameters.AddWithValue("@IdImpuesto", Impuesto);
            comando.Parameters.AddWithValue("@Total", Total);

            comando.ExecuteNonQuery();
            comando.Parameters.Clear();
            conexion.CerrarConexion();


        }

        public void InsertarFactura(DateTime Fecha, string Nombre, Decimal Subtotal, int Impuestos, Decimal Total)
        {
            comando.Connection = conexion.AbrirConexion();
            comando.CommandText = "spInsertFactura";
            comando.CommandType = CommandType.StoredProcedure;
            comando.Parameters.Add("@Fecha", SqlDbType.Date).Value = Fecha;
            comando.Parameters.Add("@Nombre", SqlDbType.Char, 40).Value = Nombre;
            comando.Parameters.Add("@Subtotal", SqlDbType.Decimal).Value = Subtotal;
            comando.Parameters.Add("@Impuesto", SqlDbType.Int).Value = Impuestos;
            comando.Parameters.Add("@Total", SqlDbType.Decimal).Value = Total;
            //comando.Parameters.AddWithValue("@Fecha", Fecha);
            //comando.Parameters.AddWithValue("@Nombre", Nombre);
            //comando.Parameters.AddWithValue("@Subtotal", Subtotal);
            //comando.Parameters.AddWithValue("@Impuesto", Impuestos);
            //comando.Parameters.AddWithValue("@Total", Total);

            comando.ExecuteNonQuery();
            comando.Parameters.Clear();
            conexion.CerrarConexion();


        }

        public DataTable NumFactura()
        {
            comando.Connection = conexion.AbrirConexion();
            comando.CommandText = "spSelectNumFactura";
            comando.CommandType = CommandType.StoredProcedure;
            leer = comando.ExecuteReader();
            tabla.Load(leer);
            conexion.CerrarConexion();
            return tabla;

        }


    }

}
