using RentACarProject.Data;

using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Security.Claims;
using Iyzipay;
using Iyzipay.Model;
using Iyzipay.Request;
using Iyzipay.Model.V2.Subscription;
using RentACarProject.Data;
using RentACarProject.Models;
using Newtonsoft.Json;
using Microsoft.AspNetCore.Authorization;
using RentACarProject.Areas.Admin.Services.Models;

namespace RentACarProject.Areas.Customer.Controllers
{
    [Area("Customer")]
    public class PaymentController : Controller
    {
        private readonly ApplicationDbContext db;
        public Rental rent;
        public double totalPrice;
   
        public RentalDetailVM RentalVM { get; set; }

        public PaymentController(ApplicationDbContext db)
        {
            this.db = db;
            
        }

        public IActionResult Index()
        {

            return View();
        }
        public IActionResult CompleteShopping(int rentalId)
        {
            var rental = db.Rental.Include(r => r.Car).FirstOrDefault(r => r.Id == rentalId);
            if (rental == null)
            {
                return RedirectToAction("Error", "Home");
            }

            var viewModel = new RentalDetailVM
            {
                Rental = rental
            };

            return View(viewModel);
        }

      
        [HttpPost]
        [Authorize]
        public async Task<IActionResult> CompleteShopping(RentalDetailVM viewModel)
        {

            if (viewModel == null || viewModel.Rental == null)
            {
                return RedirectToAction("Error", "Home");
            }

            viewModel.Rental.ApplicationUserId = User.FindFirstValue(ClaimTypes.NameIdentifier);
            viewModel.Rental.IsStatus = false;
         
            db.Rental.Update(viewModel.Rental);
            await db.SaveChangesAsync();



            return RedirectToAction("Payment", "Payment", new { rentalId = viewModel.Rental.Id });
        }

        [Authorize]
        public IActionResult Payment(int rentalId, decimal totalPriceInput)
        {

            var rental = db.Rental.Include(c => c.Car).FirstOrDefault(r => r.Id == rentalId);
            


            Options options = new Options();
                options.ApiKey = "sandbox-sjG9MxcnIe6121vD7TfRHOuJq1IYlWBc";
                options.SecretKey = "sandbox-LpV8Ekxv2iuZmKZs2ROaPmSV1RntzlQJ";
                options.BaseUrl = "Https://sandbox-api.iyzipay.com";

                CreateCheckoutFormInitializeRequest request = new CreateCheckoutFormInitializeRequest();
                request.Locale = Locale.TR.ToString();
                request.ConversationId = "123456789";
                request.Price = Convert.ToInt32(totalPriceInput).ToString(); 
                request.PaidPrice = Convert.ToInt32(totalPriceInput).ToString();
                request.Currency = Currency.TRY.ToString();
                request.BasketId = "B67832";
                request.PaymentGroup = PaymentGroup.PRODUCT.ToString();
                request.CallbackUrl = request.CallbackUrl = "https://localhost:7066/Customer/Payment/Success";



            Buyer buyer = new Buyer();
                buyer.Id = "asdadsada";
                buyer.Name = "Betül";
                buyer.Surname = "Daşçi";
                buyer.GsmNumber = "+905554443322";
                buyer.Email = "email@email.com";
                buyer.IdentityNumber = "74300864791";
                buyer.LastLoginDate = "2015-10-05 12:43:35";
                buyer.RegistrationDate = "2000-12-12 12:00:00";
                buyer.RegistrationAddress = "Nidakule Göztepe, Merdivenköy Mah. Bora Sok. No:1";
                buyer.Ip = "85.34.78.112";
                buyer.City = "Istanbul";
                buyer.Country = "Turkey";
                buyer.ZipCode = "34732";
                request.Buyer = buyer;

                Address shippingAddress = new Address();
                shippingAddress.ContactName = "Betül Daşçi";
                shippingAddress.City = "Istanbul";
                shippingAddress.Country = "Turkey";
                shippingAddress.Description = "Bakırköy İncirli";
                shippingAddress.ZipCode = "34742";
                request.ShippingAddress = shippingAddress;

                Address billingAddress = new Address();
                billingAddress.ContactName = "Betül Daşçi";
                billingAddress.City = "Istanbul";
                billingAddress.Country = "Turkey";
                billingAddress.Description = "Bakırköy İncirli";
                billingAddress.ZipCode = "34742";
                request.BillingAddress = billingAddress;

                List<BasketItem> basketItems = new List<BasketItem>();
                BasketItem basketProduct;
                basketProduct = new BasketItem();
                basketProduct.Id = "1";
                basketProduct.Name = "Araba";
                basketProduct.Category1 = "Bilgisayar";
                basketProduct.Category2 = "";
                basketProduct.ItemType = BasketItemType.PHYSICAL.ToString();

                double price = 1;
                double endPrice = 1;
                basketProduct.Price = Convert.ToInt32(totalPriceInput).ToString();
                basketItems.Add(basketProduct);

                request.BasketItems = basketItems;

                CheckoutFormInitialize checkoutFormInitialize = CheckoutFormInitialize.Create(request, options);
                ViewBag.pay = checkoutFormInitialize.CheckoutFormContent;

           



            return View(rental);


        }




        public async Task<IActionResult> Success(int rentalId)
        {
            return View();
        }

    }
}
