using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace HrisakContacts.Models
{
    public class PersonAddress2
    {
        public int PersonAddressID { get; set; }
        public string LastName { get; set; }
        public string FirstName { get; set; }
        public string Street { get; set; }
        public string City { get; set; }
        public string ZipCode { get; set; }
        public string BirthDate { get; set; }
       
        public string CellPhone { get; set; }
        public string EmailAddress { get; set; }
        
        public string State { get; set; }
        public int AddressID { get; set; }
        public int PersonID { get; set; }
    }
}