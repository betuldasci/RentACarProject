
using Microsoft.EntityFrameworkCore.Metadata.Internal;
using Newtonsoft.Json;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text.Json.Serialization;

namespace RentACarProject.Models
{
    public class Car
    {
        [Key]
        public int Id { get; set; }
        public string? Image { get; set; } = "empty.jpg";
        public string? Description { get; set; }
       
        public string? Model { get; set; }
        public string? Year { get; set; }
        public int DoorNumber { get; set; }
        public double Price { get; set; }

        public List<Rental>? Rentals { get; set; }
        public int? BrandId { get; set; }
        [ForeignKey("BrandId")]
        public Brand? Brand { get; set; }
        public bool IsStatus { get; set; }
        public bool IsDelete { get; set; }



    }
}
