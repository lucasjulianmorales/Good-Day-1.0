using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Good_Day.Models
{
    public class TagManager
    {
        public Tag Insertar (Tag tag, int libretaID)
        {
            

            SqlConnection conexion = new SqlConnection(ConfigurationManager.AppSettings["ConexionBaseDeDatos"]);
            conexion.Open();
            SqlCommand query = conexion.CreateCommand();

            query.CommandText = "insert into Tag (NameTag, ID_libreta) OUTPUT INSERTED.ID_Tag values (@NameTag, @ID_libreta)";
            query.Parameters.AddWithValue("@NameTag", tag.NameTag);
            query.Parameters.AddWithValue("@ID_libreta", libretaID);

            tag.ID_tag = (int)query.ExecuteScalar();

            conexion.Close();

            return tag;
        }
        public List<Tag> ConsultarTags(int libreta)
        {
            List<Tag> tags = new List<Tag>();

            SqlConnection conexion = new SqlConnection(ConfigurationManager.AppSettings["ConexionBaseDeDatos"]);

            conexion.Open();

            SqlCommand query = conexion.CreateCommand();

            query.CommandText = "SELECT Tag.NameTag, Tag.ID_tag, Tag.ID_libreta FROM Libreta INNER JOIN Tag ON Libreta.ID_libreta = Tag.ID_libreta WHERE Libreta.ID_libreta = @ID_libreta";
            query.Parameters.AddWithValue("@ID_libreta", libreta);

            SqlDataReader reader = query.ExecuteReader();

            while (reader.Read()) //mientras haya un registro para leer
            {
                //creo tag, le completo los datos 
                Tag tag = new Tag();
                tag.ID_tag = (int)reader["ID_tag"];
                tag.NameTag = reader["NameTag"].ToString();

                tags.Add(tag);
            }
            reader.Close();

            conexion.Close();

            return tags;
        }
    }
}