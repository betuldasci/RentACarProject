using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using RentACarProject.Areas.Admin.Services.Interfaces;
using RentACarProject.Models;


namespace RentACarProject.Areas.Admin.Controllers
{
    [Area("Admin")]
    [Authorize(Roles = Other.Role_Admin)]
    public class CustomerController : Controller
    {
        ICustomerService customerService;
        public CustomerController(ICustomerService customerService)
        {
            this.customerService = customerService; 
        }
        public async Task<IActionResult> Index()
        {
           var customers = await customerService.GetAllCustomerAsync();
            return View(customers);
        }
    }
}
