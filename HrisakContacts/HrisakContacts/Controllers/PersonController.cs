using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using HrisakContacts.Models;

namespace HrisakContacts.Controllers
{
    public class PersonController : Controller
    {
        public int addressid;
        // GET: Person
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Create()
        {
            return View();
        }
        public ActionResult Edit()
        {
            return View();
        }
       

        public ActionResult View(int personID, int personAddressID)
        {
            var context = new HrisakDBEntities();
            HrisakContacts.Models.PersonAddress2 tbl = new PersonAddress2();
            var personList = context.tblPeoples.Where(x => x.PersonID == personID).FirstOrDefault();
            var findAddressPerson = context.tblPersonToAddresses.Where(x => x.PersonToAddressID == personAddressID).FirstOrDefault();
            var address = context.tblAddresses.Where(x => x.AddressID == findAddressPerson.AddressID).FirstOrDefault();

            tbl.PersonAddressID = personAddressID;
            tbl.CellPhone = personList.CellPhone;
            tbl.EmailAddress = personList.EmailAddress;
            tbl.FirstName = personList.FirstName;
            tbl.LastName = personList.LastName;
            tbl.BirthDate = personList.BirthDate;

            tbl.Street = address.Street;
            tbl.ZipCode = address.ZipCode;
            tbl.State = address.State;
            tbl.City = address.City;
            addressid = personAddressID;
            ViewBag.testAddressID = personAddressID;
            return View(tbl);
        }

        public ActionResult Address(int personAddressID)
        {
            var context = new HrisakDBEntities();
            tblAddress tbl = new tblAddress();
            var findAddressPerson = context.tblPersonToAddresses.Where(x => x.PersonToAddressID == personAddressID).FirstOrDefault();
            var address = context.tblAddresses.Where(x => x.AddressID == findAddressPerson.AddressID).FirstOrDefault();
            return PartialView(address);
        }

        // POST: People/Edit/5
        [HttpPost]
        
        public ActionResult Update(PersonAddress2 entity)
        {
            var context = new HrisakDBEntities();
            var findAddressPerson = context.tblPersonToAddresses.Where(x => x.PersonToAddressID == entity.PersonAddressID).FirstOrDefault();
            var address = context.tblAddresses.FirstOrDefault(x => x.AddressID == findAddressPerson.AddressID);
            var person2 = context.tblPeoples.FirstOrDefault(x => x.PersonID == findAddressPerson.PersonID);

           if (address != null)
            {
                address.City = entity.City;
                address.State = entity.State;
                address.Street = entity.Street;
                address.ZipCode = entity.ZipCode;
            }

           if (person2 != null)
            {
                person2.BirthDate = entity.BirthDate;
                person2.CellPhone = entity.CellPhone;
                person2.EmailAddress = entity.EmailAddress;
                person2.FirstName = entity.FirstName;
                person2.LastName = entity.LastName;
            }
            context.SaveChanges();
            return RedirectToAction("Index","Home");
        }

    }
}