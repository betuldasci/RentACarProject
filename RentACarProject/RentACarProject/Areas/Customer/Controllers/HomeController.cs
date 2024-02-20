using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;
using RentACarProject.Areas.Admin.Services.Interfaces;
using RentACarProject.Data;
using RentACarProject.Models;
using System.Diagnostics;
using System.Drawing.Drawing2D;
using System.Security.Claims;

namespace RentACarProject.Areas.Customer.Controllers
{

    [Area("Customer")]
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        private readonly ICarService carService;
        private readonly ApplicationDbContext db;
        public int totalPrice;

        public HomeController(ILogger<HomeController> logger, ICarService carService, ApplicationDbContext db)
        {
            _logger = logger;
            this.carService = carService;
            this.db = db;
        }

        public async Task<IActionResult> Index(string brand)
        {
            ViewData["CurrentFilter"] = brand;

            var cars = from c in db.Car.Include(c => c.Brand)
                       select c;

            if (!String.IsNullOrEmpty(brand))
            {
                cars = cars.Where(c => c.Brand.Name.Contains(brand));
            }

            return View(await cars.ToListAsync());
        }

        public async Task<IActionResult> Detail(int id)
        {
            var car = await carService.GetCarByIdAsync(id);
            if (car == null)
            {
                return RedirectToAction("Error");
            }

            var viewModel = new RentalDetailVM
            {
                Rental = new Rental()
                {
                    CarId = car.Id,
                    Car = car,
                    RentalStartDate = DateTime.Now,
                    RentalEndDate = DateTime.Now
                }
            };

            return View(viewModel);

        }

        [HttpPost]
        [Authorize]

        public async Task<IActionResult> Detail(RentalDetailVM viewModel)
        {

            var car = await carService.GetCarByIdAsync(viewModel.Rental.CarId);
            if (car == null || !car.IsStatus)
            {
                return RedirectToAction("Error");
            }

            if (viewModel.Rental.RentalEndDate <= viewModel.Rental.RentalStartDate)
            {
                ModelState.AddModelError("", "The end date must be after the start date.");
                viewModel.Rental.Car = car;
                return View(viewModel);
            }

            var rentalDays = (viewModel.Rental.RentalEndDate - viewModel.Rental.RentalStartDate).Days + 1;
            totalPrice = rentalDays * Convert.ToInt32(car.Price);

            viewModel.Rental.TotalPrice = totalPrice;


            viewModel.Rental.ApplicationUserId = User.FindFirstValue(ClaimTypes.NameIdentifier);
            viewModel.Rental.IsStatus = false;
            viewModel.Rental.Car = car;
            viewModel.Rental.Address = "Bakırköy";
            viewModel.Rental.City = "Istanbul";
            viewModel.Rental.PostalCode = "34000";
            viewModel.Rental.Country = "Turkiye";

            await db.AddAsync(viewModel.Rental);
            await db.SaveChangesAsync();

            car.IsStatus = false;
            db.Car.Update(car);
            await db.SaveChangesAsync();

            return RedirectToAction("CompleteShopping", "Payment", new { rentalId = viewModel.Rental.Id });
        }

       
    }
}
