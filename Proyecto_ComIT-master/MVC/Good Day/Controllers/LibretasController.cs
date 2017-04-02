using Good_Day.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Good_Day.Controllers
{
    public class LibretasController : Controller
    {
        // GET: Libreta
        public ActionResult Index()
        {
            return View();
        }
      
        [HttpPost]
        public ActionResult CreateLibreta(string nameLibreta)
        {
            
            Libreta nuevaLibreta = new Libreta();
            nuevaLibreta.NameLibreta = nameLibreta;

            LibretaManager manager = new LibretaManager();
            manager.Insertar(nuevaLibreta,((Usuario)Session["UsuarioLogueado"]).ID_usuario);

            return RedirectToAction("Home", "Home");

        }
        public ActionResult Eliminar(int ID_libreta)
        {
            Libreta eliminarLibreta = new Libreta();
            eliminarLibreta.ID_libreta = ID_libreta;

            LibretaManager manager = new LibretaManager();
            manager.Eliminar(ID_libreta);

            return RedirectToAction("Home", "Home");
        }
    }
}