using Good_Day.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Good_Day.Controllers
{
    public class NotasController : Controller
    {
        // GET: Notas   
        public ActionResult Notas (int libretaID)
        {
            TagManager manager = new TagManager();
            List<Tag> libretas = manager.ConsultarTags(libretaID);
            ViewBag.Libreta = libretas;
            return View();
        }

        [HttpPost]
        public ActionResult CreateNota(string nameNota)
        {

            Nota nuevaNota = new Nota();
            nuevaNota.NameNota = nameNota;
            nuevaNota.ID_tag = ;
          

            NotasManager manager = new NotasManager();
            manager.Insertar(nuevaNota);

            return RedirectToAction("Notas", "Notas");

        }


    }
}