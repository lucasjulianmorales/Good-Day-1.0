using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Good_Day.Models
{
    public class Usuario
    {
        public int ID_usuario { get; set; }
        public string NameUsuario { get; set; }
        public string Mail { get; set; }
        public string Password { get; set; }
    }
}