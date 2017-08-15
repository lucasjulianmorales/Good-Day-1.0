﻿using Good_Day.Models;
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

            //se nesecita hacer una consulta para traer Tags al controlador y despues pasarselos a la viewbag de la vista

            TagManager manager = new TagManager();
            List<Tag> tags = manager.ConsultarTags(libretaID);
            ViewBag.Tag = tags;


            //se nesecita hacer una consulta para traer el nombre de la librta al controlador y despues pasarselos a la viewbag de la vista
            LibretaManager admin = new LibretaManager();
            Libreta libreta = admin.ConsultarLibreta(libretaID);
            ViewBag.Libreta = libreta;


            NotasManager organiza = new NotasManager();
            List<Nota> notas = organiza.ConsultarNotas(libretaID);
            ViewBag.Nota = notas;

            return View();

        }
 
        [HttpPost]
        public ActionResult CreateNota(string nameNota)
        {
            int tagID = (int)Session["ID"];

            Nota nuevaNota = new Nota();
            nuevaNota.NameNota = nameNota;

            NotasManager manager = new NotasManager();
            manager.Insertar(nuevaNota, tagID);

            return Notas(tagID);

        

        }
    }
}