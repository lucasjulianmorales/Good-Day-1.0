﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Good_Day.Models;

namespace Good_Day.Controllers
{
    public class TagsController : Controller
    {
        // GET: Tag
        public ActionResult Index()
        {
            return View();
        }
        [HttpPost]
        public ActionResult CreateTag (string nameTag)
        {

            Tag nuevatag = new Tag();
            nuevatag.NameTag = nameTag;
            nuevatag.ID_Libreta = ;
           

            TagManager manager = new TagManager();
            manager.Insertar(nuevatag);

            return RedirectToAction("Notas", "Notas");

        }
        
    }
}