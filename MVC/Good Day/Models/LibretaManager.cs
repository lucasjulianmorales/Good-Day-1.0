using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Good_Day.Models
{
    public class LibretaManager
    {
        public Libreta Insertar(Libreta libreta, int usuario)
        {
          
            SqlConnection conexion = new SqlConnection(ConfigurationManager.AppSettings["ConexionBaseDeDatos"]);
            conexion.Open();
            SqlCommand query = conexion.CreateCommand();
         
            query.CommandText = "insert into Libreta (NameLibreta) OUTPUT INSERTED.ID_libreta VALUES (@NameLibreta)";
            query.Parameters.AddWithValue("@NameLibreta", libreta.NameLibreta);

            libreta.ID_libreta = (int) query.ExecuteScalar();

            SqlCommand sentencia = conexion.CreateCommand();
    
            sentencia.CommandText = "insert into Usuario_Libreta (ID_usuario, ID_libreta) OUTPUT INSERTED.ID_libreta values (@ID_usuario, @ID_libreta)";
            sentencia.Parameters.AddWithValue("@ID_usuario", usuario);
            sentencia.Parameters.AddWithValue("@ID_libreta", libreta.ID_libreta);

            sentencia.ExecuteNonQuery();

            conexion.Close();

            return libreta;          
        }

        public void Eliminar(Libreta libreta)
        {
            this.Eliminar(libreta.ID_libreta);
        }

        public void Eliminar(int libretaID)
        {
            SqlConnection conexion = new SqlConnection(ConfigurationManager.AppSettings["ConexionBaseDeDatos"]);
            conexion.Open();
            SqlCommand query = conexion.CreateCommand();

            query.CommandText = "delete from Libreta where ID_libreta = @ID_libreta";
            query.Parameters.AddWithValue("@ID_libreta", libretaID);

            query.ExecuteNonQuery();

            conexion.Close();
        }
        public Libreta ConsultarLibreta(int id)
            {
            Libreta libreta = new Libreta();

            SqlConnection conexion = new SqlConnection(ConfigurationManager.AppSettings["ConexionBaseDeDatos"]);

            conexion.Open();
            SqlCommand query = conexion.CreateCommand();
            query.CommandText = "Select Libreta.NameLibreta From Libreta Where Libreta.ID_libreta = @ID_libreta";
            query.Parameters.AddWithValue("@ID_libreta", id);

            SqlDataReader reader = query.ExecuteReader();
            if (reader.Read())
            { 
                libreta.NameLibreta = reader["NameLibreta"].ToString();
            }
            reader.Close();

            conexion.Close();
            
            return libreta;
        }

        public List<Libreta> ConsultarLibretas(int usuario)
        {
            List<Libreta> libretas = new List<Libreta>();

            SqlConnection conexion = new SqlConnection(ConfigurationManager.AppSettings["ConexionBaseDeDatos"]);

            conexion.Open();

            SqlCommand query = conexion.CreateCommand();

            query.CommandText = "SELECT Libreta.ID_libreta, Libreta.NameLibreta, Libreta.ID_color FROM Usuario_Libreta INNER JOIN Libreta ON Usuario_Libreta.ID_libreta = Libreta.ID_libreta INNER JOIN Usuario ON Usuario_Libreta.ID_usuario = Usuario.ID_usuario WHERE Usuario.ID_usuario = @ID_usuario";
            query.Parameters.AddWithValue("@ID_usuario", usuario);

            //5-ejecutamos la consulta
            SqlDataReader reader = query.ExecuteReader();
            while (reader.Read()) //mientras haya un registro para leer
            {
                //creo libreta, le completo los datos 
                Libreta libreta = new Libreta();
                libreta.ID_libreta = (int)reader["ID_libreta"];
                libreta.NameLibreta = reader["NameLibreta"].ToString();

                libretas.Add(libreta);
            }

            //CERRAR EL READER AL TERMINAR DE LEER LOS REGISTROS
            reader.Close();
            //CERRAR LA CONEXION AL TERMINAR!!!!
            conexion.Close();

            return libretas;
        }
        public List<Libreta> Consultar(Usuario autor)
        {
            return new List<Libreta>();
        }
    }
}