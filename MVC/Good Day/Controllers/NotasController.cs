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
            Session["ID"] = libretaID; //creo una session para guardar el ID_libreta 

            TagManager manager = new TagManager();
            List<Tag> tags = manager.ConsultarTags(libretaID);
            ViewBag.Tag = tags;

            NotasManager organiza = new NotasManager();
            List<Nota> notas = organiza.ConsultarNotas(libretaID);
            ViewBag.Nota = notas;
            return View();

            LibretaManager admin = new LibretaManager();
            Libreta libreta = admin.ConsultarLibreta(libretaID);
            ViewBag.Libreta = libreta;

            return View();
        }
        public ActionResult ShowNotas(int libretaID)
        {
            NotasManager manager = new NotasManager();
            List<Nota> notas = manager.ConsultarNotas(libretaID);
            ViewBag.Nota = notas;
            return View();
        }
 
        [HttpPost]
        public ActionResult CreateNota(string nameNota)
        {

            Nota nuevaNota = new Nota();
            nuevaNota.NameNota = nameNota;
            //nuevaNota.ID_tag = ;
          

            NotasManager manager = new NotasManager();
            manager.Insertar(nuevaNota);

            return RedirectToAction("Notas", "Notas");

        }
    }
}