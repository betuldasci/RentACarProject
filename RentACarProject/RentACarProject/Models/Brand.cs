namespace RentACarProject.Models
{
    public class Brand
    {
        public int Id { get; set; }
        public string? Name { get; set; }
        public string? Image { get; set; } = "empty.jpg";
        public bool IsStatus { get; set; }
        public bool IsDelete { get; set; }

        public List<Car>? Cars { get; set; }
    }
}
