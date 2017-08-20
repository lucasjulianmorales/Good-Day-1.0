using System;
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
        public ActionResult CreateTag(string nameTag)
        {
            int libID = (int)Session["ID"]; //le paso la session de ID_libreta

            Tag nuevatag = new Tag();
            nuevatag.NameTag = nameTag;
                        
            TagManager manager = new TagManager();

            manager.Insertar(nuevatag, libID);


            return RedirectToAction("Notas", "Notas",libID);

        }


    }
}