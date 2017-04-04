using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Good_Day.Models
{
    public class Nota
    {
        public int ID_notas { get; set; }
        public Tag ID_tag { get; set; }
        public string NameNota { get; set; }
        public DateTime Fecha { get; set; }
    }
}