using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Good_Day.Models
{
    public class Datos
    {
        public void Conexion(Datos cadcon)
        {
            SqlConnection conexion = new SqlConnection(ConfigurationManager.AppSettings["ConexionBaseDeDatos"]);
            //se compone de tres partes la direccion del servidor, el nombre de la base de datos y la autenticacion

            conexion.Open();

            SqlCommand command = conexion.CreateCommand();


            conexion.Close();
        }
     }

}