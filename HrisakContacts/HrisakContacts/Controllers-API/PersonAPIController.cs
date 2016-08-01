using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using HrisakContacts.Models;

namespace HrisakContacts.Controllers_API
{
    public class PersonAPIController : ApiController
    {
        // GET: api/PersonAPI
        public IEnumerable<string> Get()
        {
            return new string[] { "value1", "value2" };
        }
        

        [HttpGet]
        [Route("api/PersonAPI/GetCityStateFromZip")]
        public IHttpActionResult GetCityStateFromZip(string zip)
        {
            IHttpActionResult ret = null;
          
            using (HrisakDBEntities context = new HrisakDBEntities())
            {
                List<prGetCityStateFromZip_Result> result = context.prGetCityStateFromZip(zip).ToList();
                if (result.Count > 0)
                {
                    ret = Ok(result);
                }
                else
                {
                    ret = NotFound();
                }
            }

            return ret;
        }

        // POST: api/PersonAPI
        [Route("api/PersonAPI")]
        public IHttpActionResult Post(PersonAddressAdd person)
        {
            IHttpActionResult ret = null;
            PersonAddressAdd addEntity= new PersonAddressAdd();
            using (HrisakDBEntities context = new HrisakDBEntities())
            {
                addEntity.LastName = person.LastName;
                addEntity.FirstName = person.FirstName;
                addEntity.BirthDate = Convert.ToDateTime(person.BirthDate).ToShortDateString();
                addEntity.EmailAddress = person.EmailAddress;
                addEntity.City = person.City;
                addEntity.State = person.State;
                addEntity.Street = person.Street;
                addEntity.ZipCode = person.ZipCode;
                addEntity.CellPhone = person.CellPhone;

                context.prAddPersonAddress(addEntity.LastName, addEntity.FirstName, addEntity.BirthDate, addEntity.CellPhone, addEntity.EmailAddress,
                    addEntity.Street, addEntity.City, addEntity.State, addEntity.ZipCode);
                context.SaveChanges();
            }

            ret = Created<PersonAddressAdd>(Request.RequestUri + addEntity.LastName.ToString(), addEntity);
            
            return ret;

        }

        // PUT: api/PersonAPI/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE: api/PersonAPI/5
        [HttpGet()]
       [Route("api/PersonAPI/DeletePerson")]
        public IHttpActionResult DeletePerson(int personID)
        {
            IHttpActionResult ret = null;
            using (HrisakDBEntities context = new HrisakDBEntities())
            {
                context.prDeletePerson(personID);
                context.SaveChanges();
            }

            ret = Ok(true);
            return ret;
        }
    }
}
