using Good_Day.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Good_Day.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Home()
        {
            LibretaManager manager = new LibretaManager();
            List<Libreta> libretas = manager.ConsultarLibretas(((Usuario)Session["UsuarioLogueado"]).ID_usuario);
            ViewBag.Libreta = libretas;

            return View();
        }
      

       


    
    }
}
