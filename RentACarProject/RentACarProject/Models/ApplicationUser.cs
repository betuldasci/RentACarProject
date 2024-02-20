using Microsoft.AspNetCore.Identity;
using System.ComponentModel.DataAnnotations.Schema;

namespace RentACarProject.Models
{
    public class ApplicationUser:IdentityUser
    {
        [PersonalData]
        public string? Name { get; set; }

        [PersonalData]
        public string? Surname { get; set; }

        public int Age { get; set; }
        public double Balance { get; set; }

        [NotMapped]
        public string Role { get; set; }


    }
}
