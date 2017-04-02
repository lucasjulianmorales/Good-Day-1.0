using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Good_Day.Models
{
    public class NotasManager
    {
        public Nota Insertar(Nota nota)
        {
            SqlConnection conexion = new SqlConnection(ConfigurationManager.AppSettings["ConexionBaseDeDatos"]);
            conexion.Open();
            SqlCommand query = conexion.CreateCommand();

            query.CommandText = "insert into Nota (NameNota) values (@NameNota)";

            query.ExecuteNonQuery();

            conexion.Close();

            return nota;
        }
        public List<Nota> ConsultarNotas()
        {
            List<Nota> notas = new List<Nota>();

            SqlConnection conexion = new SqlConnection(ConfigurationManager.AppSettings["ConexionBaseDeDatos"]);

            conexion.Open();

            SqlCommand query = conexion.CreateCommand();

            query.CommandText = "Select * from Nota";

            SqlDataReader reader = query.ExecuteReader();
            while (reader.Read()) //mientras haya un registro para leer
            {
                //creo nota, le completo los datos 
                Nota nota = new Nota();
                nota.ID_notas = (int)reader["ID_nota"];
                nota.NameNota = reader["NameNota"].ToString();


            }
            reader.Close();

            conexion.Close();

            return notas;
        }
    }
}