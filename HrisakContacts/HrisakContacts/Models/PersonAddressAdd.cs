using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HrisakContacts.Models
{
    public class PersonAddressAdd
    {
        public string Street { get; set; }
        public string City { get; set; }
        public string State { get; set; }
        public string ZipCode { get; set; }
        public string LastName { get; set; }
        public string FirstName { get; set; }
        public string BirthDate { get; set; }
        public string CellPhone { get; set; }
        public string EmailAddress { get; set; }
    }
}