
using System.ComponentModel.DataAnnotations.Schema;

namespace RentACarProject.Models
{
    public class Payment
    {
        public int Id { get; set; }
        [ForeignKey("Rental")]
        public int RentalId { get; set; }
        public double PaymentTotal { get; set; }
        public DateTime PaymentDate { get; set; }
    
        public bool IsDelete { get; set; }
        public bool IsStatus { get; set; }

        public virtual Rental? Rental { get; set; }
    }
}
