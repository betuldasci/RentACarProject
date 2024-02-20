using Microsoft.AspNetCore.Identity;

using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace RentACarProject.Models
{
    public class Rental 
    {
        [Key]
        public int Id { get; set; }
        [ForeignKey("ApplicationUserId")]
        public string? ApplicationUserId { get; set; }

        [ForeignKey("Car")]
        public int CarId { get; set; }

        public DateTime RentalStartDate { get; set; }
        public DateTime RentalEndDate { get; set; }
        public double TotalPrice { get; set; }

        public string? Name { get; set; }

        public string? Surname { get; set; }
        public string? Address { get; set; }
        public string? City { get; set; }
        public string? PostalCode { get; set; }
        public string? Country { get; set; }
        public virtual ApplicationUser? ApplicationUser { get; set; }
        public Car? Car { get; set; }
        public bool IsStatus { get; set; }


    }
}
