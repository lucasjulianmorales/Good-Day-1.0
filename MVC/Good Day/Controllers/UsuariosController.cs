using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Good_Day.Models;

namespace Good_Day.Controllers
{
    public class UsuariosController : Controller
    {
        // GET: Usuario
        public ActionResult Index()
        {
            return View();
        }
   

        [HttpPost]
        public ActionResult Register(string nameUsuario, string mail, string password)
        {
            
            Usuario nuevoUsuario = new Usuario();
            nuevoUsuario.NameUsuario = nameUsuario;
            nuevoUsuario.Mail = mail;
            nuevoUsuario.Password = password;
       
            UsuarioManager manager = new UsuarioManager();
            manager.Insertar(nuevoUsuario);
           return DoLogin(mail,password);
            //return RedirectToAction("DoLogin", new { mail, password });

        }
        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public ActionResult DoLogin(string mail, string password)
        {
            UsuarioManager manager = new UsuarioManager();
            Usuario usuario = manager.Validar(mail, password);
            if (usuario != null)
            {
                //ESTÁ BIEN
                Session["UsuarioLogueado"] = usuario;
            }
            else
            {
                //EL USUARIO NO EXISTE O ESTA MAL LA CONTRASEÑA
                TempData["Error"] = "El usuario no existe o está mal la contraseña";
            }

            return RedirectToAction("Home", "Home");
        }

        public ActionResult Logout()
        {
            Session.Clear();
            //Session["UsuarioLogueado"] = null;
            return RedirectToAction("Index", "Home");
        }
    }
}