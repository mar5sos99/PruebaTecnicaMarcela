using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace WebApp
{


    public class CD_Conexion
    {
        

        private SqlConnection conexion = new SqlConnection("Data Source=DESKTOP-VAT548G;Initial Catalog=productosBD;Integrated Security=True");
        public CD_Conexion() {    }

        //public void conectar(string tabla)
        //{
        //    string strConnection = ConfigurationManager.ConnectionStrings["productosBDConnectionString"].ConnectionString;
        //    MyConnection.ConnectionString = strConnection;
        //    MyConnection.Open();
        //    //AdaptadorDatos = new SqlDataAdapter("");
        //}

        public SqlConnection AbrirConexion()
        {
            if (conexion.State == ConnectionState.Closed)
                conexion.Open();
            return conexion;
        }

        public SqlConnection CerrarConexion()
        {
            if (conexion.State == ConnectionState.Open)
                conexion.Close();
            return conexion;
        }
    }
}