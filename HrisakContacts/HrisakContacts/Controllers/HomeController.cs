using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using HrisakContacts.Models;

namespace HrisakContacts.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            var context = new HrisakDBEntities();

            var personList = context.vwPersonMainLists.OrderBy(x => x.PersonID).ToList();
            return View(personList);
        }
    }
}
