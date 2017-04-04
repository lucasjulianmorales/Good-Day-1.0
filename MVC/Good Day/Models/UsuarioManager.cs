using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Good_Day.Models
{
    public class UsuarioManager
    {
        internal Usuario ConsultarMail(string Mail)
        {
            Usuario usuario = new Usuario();

            SqlConnection conexion = new SqlConnection(ConfigurationManager.AppSettings["ConexionBaseDeDatos"]);
            conexion.Open();
            SqlCommand query = conexion.CreateCommand();

            query.CommandText = "Select Mail From Usuario Where Mail = @Mail";
            query.Parameters.AddWithValue("@Mail", Mail);

            SqlDataReader reader = query.ExecuteReader();

            usuario.Mail = reader["Mail"].ToString();

            reader.Close();

            conexion.Close();

            return usuario;
        }

        public void Insertar(Usuario usuario)
        {
            SqlConnection conexion = new SqlConnection(ConfigurationManager.AppSettings["ConexionBaseDeDatos"]);
            conexion.Open();
            SqlCommand query = conexion.CreateCommand();
            query.CommandText = "insert into Usuario (NameUsuario, Mail, Password) VALUES (@NameUsuario, @Mail, @Password)";

            query.Parameters.AddWithValue("@NameUsuario", usuario.NameUsuario);
            query.Parameters.AddWithValue("@Mail", usuario.Mail);
            query.Parameters.AddWithValue("@Password", usuario.Password);
            
            query.ExecuteNonQuery();
    
            conexion.Close();
        }
        internal Usuario Validar(string Mail , string Password)
        {
            Usuario usuario = new Models.Usuario();

            //1-Conexión.. a qué BBDD
            SqlConnection conexion = new SqlConnection(ConfigurationManager.AppSettings["ConexionBaseDeDatos"]);
            //2-nos conectamos
            conexion.Open();
            //3-creamos el objeto que nos permite escribir la sentencia
            SqlCommand query = conexion.CreateCommand();
            //4-escribrimos la sentencia
            query.CommandText = "SELECT * FROM Usuario WHERE Mail = @Mail AND Password = @Password";
            query.Parameters.AddWithValue("@Mail", Mail );
            query.Parameters.AddWithValue("@Password", Password);

            //5-ejecutamos la consulta
            SqlDataReader reader = query.ExecuteReader();
            if (reader.Read()) //mientras haya un registro para leer
            {
                usuario.ID_usuario = (int) reader["ID_usuario"];
                usuario.NameUsuario = reader["NameUsuario"].ToString();
                usuario.Mail = reader["Mail"].ToString();
                usuario.Password = reader["Password"].ToString();
            }
            else
            {
                usuario = null;
            }

            //CERRAR EL READER AL TERMINAR DE LEER LOS REGISTROS
            reader.Close();
            //CERRAR LA CONEXION AL TERMINAR!!!!
            conexion.Close();

            return usuario;
        }
    }
}