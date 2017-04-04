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
        public List<Nota> ConsultarNotas(int libreta)
        {
            List<Nota> notas = new List<Nota>();

            SqlConnection conexion = new SqlConnection(ConfigurationManager.AppSettings["ConexionBaseDeDatos"]);

            conexion.Open();

            SqlCommand query = conexion.CreateCommand();

            query.CommandText = "SELECT Nota.ID_nota, Nota.NameNota FROM Libreta INNER JOIN Tag ON Libreta.ID_libreta = Tag.ID_libreta INNER JOIN Nota ON Tag.ID_tag = Nota.ID_tag WHERE Libreta.ID_libreta = @ID_libreta";
            query.Parameters.AddWithValue("@ID_libreta", libreta);

            SqlDataReader reader = query.ExecuteReader();

            while (reader.Read()) //mientras haya un registro para leer
            {
                //creo nota, le completo los datos 
                Nota nota = new Nota();
                nota.ID_notas = (int)reader["ID_nota"];
                nota.NameNota = reader["NameNota"].ToString();
                //nota.Fecha = (DateTime)reader["Fecha"];

                notas.Add(nota);
            }
            reader.Close();

            conexion.Close();

            return notas;
        }
    }
}