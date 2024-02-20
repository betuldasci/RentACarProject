using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.ChangeTracking;
using RentACarProject.Areas.Admin.Services.Interfaces;
using RentACarProject.Data;
using RentACarProject.GenericModels;
using RentACarProject.Models;

namespace RentACarProject.Areas.Admin.Controllers
{
    [Area("Admin")]
    [Authorize(Roles = Other.Role_Admin)]
    public class CarController : Controller
    {
        private readonly ICarService carService;
        private readonly IBrandService brandService;
        private readonly UploadImage uploadImage;
        public CarController(ICarService carService, UploadImage uploadImage, IBrandService brandService)
        {
            this.carService = carService;
            this.uploadImage = uploadImage;
            this.brandService = brandService;
        }

        // GET: Admin/Cars
        public async Task<IActionResult> Index()
        {
             var list = await carService.GetAllCarsAsync();
            return View(list);
        }

        public IActionResult Create()
        {
            ViewData["BrandId"] = new SelectList(brandService.GetAllBrandAsync().Result, "Id", "Name");
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]

        public async Task<IActionResult> Create(Car car)
        {
            if (ModelState.IsValid)
            {
                var files = HttpContext.Request.Form.Files;
                string image = uploadImage.Image(files, "car");
                car.Image = image == null ? "empty.jpg" : image;
                car.BrandId = car.BrandId;
                TempData["Message"] = await carService.AddCarAsync(car) ? "Car added successfully":"";
            }
            ViewData["BrandId"] = new SelectList(brandService.GetAllBrandAsync().Result, "Id", "Name", car.BrandId);
            return View(car);
        }

        public async Task<IActionResult> Edit(int id = 0)
        {
            var car = await carService.GetCarByIdAsync(id);
            if(car== null)
            {
                return NotFound();
            }
            ViewData["BrandId"] = new SelectList(await brandService.GetAllBrandAsync(), "Id", "Name", car.BrandId);
            return View(car);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(Car car)
        {
            if(ModelState.IsValid) 
            {
                var files = HttpContext.Request.Form.Files;
                string image = uploadImage.Image(files, "car");
                if(image != null)
                {
                    car.Image = image;
                }
                car.BrandId=car.BrandId;
                var result = await carService.UpdateCarAsync(car);

                TempData["Message"] = result?"Car Edited Successfully":"";
            }
            ViewData["BrandId"] = new SelectList(await brandService.GetAllBrandAsync(), "Id", "Name", car.BrandId);
            return View(car);
        }
       
        public async Task<IActionResult> Delete(int id = 0)
        {
            var result = await carService.DeleteCarAsync(id);
            TempData["Message"] = result ? "Car Deleted Successfully" : "Not Found Car";
            return RedirectToAction("Index");
        }
    }
}
