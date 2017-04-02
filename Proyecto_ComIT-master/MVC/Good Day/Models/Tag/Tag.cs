using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Good_Day.Models
{
    public class Tag
    {
        public int ID_tag { get; set; }
        public Libreta ID_Libreta { get; set; }
        public string NameTag { get; set; }
       
    }
}