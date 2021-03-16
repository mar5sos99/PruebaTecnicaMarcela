using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace WebApp
{
    public class CD_Producto
    {
        private CD_Conexion conexion = new CD_Conexion();

        SqlDataReader leer;
        DataTable tabla = new DataTable();
        SqlCommand comando = new SqlCommand();

        public DataTable Mostrar(int codigo)
        {
            comando.Connection = conexion.AbrirConexion();
            comando.CommandText = "spSelectProducto";
            comando.CommandType = CommandType.StoredProcedure;
            comando.Parameters.AddWithValue("@codigo", codigo);
            leer = comando.ExecuteReader();
            tabla.Load(leer);
            conexion.CerrarConexion();
            return tabla;

        }

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

        public void Insertar(string Descripcion, double Precio, double Costo, bool Estado)
        {
            comando.Connection = conexion.AbrirConexion();
            comando.CommandText = "spInsertProducto";
            comando.CommandType = CommandType.StoredProcedure;
            comando.Parameters.AddWithValue("@Descripcion", Descripcion);
            comando.Parameters.AddWithValue("@Precio", Precio);
            comando.Parameters.AddWithValue("@Costo", Costo);
            comando.Parameters.AddWithValue("@Estado", Estado);

            comando.ExecuteNonQuery();
            comando.Parameters.Clear();
            conexion.CerrarConexion();
            

        }

        public void Editar(int codigo, string Descripcion, double Precio, double Costo, bool Estado)
        {
            comando.Connection = conexion.AbrirConexion();
            comando.CommandText = "spUpdateProducto";
            comando.CommandType = CommandType.StoredProcedure;
            comando.Parameters.AddWithValue("@codigo", codigo);
            comando.Parameters.AddWithValue("@Descripcion", Descripcion);
            comando.Parameters.AddWithValue("@Precio", Precio);
            comando.Parameters.AddWithValue("@Costo", Costo);
            comando.Parameters.AddWithValue("@Estado", Estado);

            comando.ExecuteNonQuery();
            comando.Parameters.Clear();
            conexion.CerrarConexion();


        }

        public void EdPorcentaje()
        {
            comando.Connection = conexion.AbrirConexion();
            comando.CommandText = "spUpdateImpuesto";
            comando.CommandType = CommandType.StoredProcedure;
            comando.ExecuteNonQuery();
            comando.Parameters.Clear();
            conexion.CerrarConexion();
        }

        public void InsPorcentaje(double Porcentaje, DateTime Fecha, bool Estado)
        {
            comando.Connection = conexion.AbrirConexion();
            comando.CommandText = "spInsertImpuesto";
            comando.CommandType = CommandType.StoredProcedure;
            comando.Parameters.AddWithValue("@Porcentaje", Porcentaje);
            comando.Parameters.AddWithValue("@Fecha", Fecha);
            comando.Parameters.AddWithValue("@Estado", Estado);

            comando.ExecuteNonQuery();
            comando.Parameters.Clear();
            conexion.CerrarConexion();
        }

        public double MostrarImpuesto()
        {
            comando.Connection = conexion.AbrirConexion();
            comando.CommandText = "spSelectImpuesto";
            comando.CommandType = CommandType.StoredProcedure;
            leer = comando.ExecuteReader();
            tabla.Load(leer);
            conexion.CerrarConexion();
            double val = double.Parse(tabla.Rows[0][0].ToString());
            return val;
        }
    }
}