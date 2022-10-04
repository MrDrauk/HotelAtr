﻿using Hotel.Atr.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Localization;
using System.Diagnostics;
using System.Globalization;

namespace Hotel.Atr.Controllers
{
    [TypeFilter(typeof(TimeElapsed), Order = 2)]
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        private readonly IStringLocalizer<HomeController> _localizer;

        public HomeController(ILogger<HomeController> logger,
            IStringLocalizer<HomeController> localizer)
        {
            _logger = logger;
            _localizer = localizer;
        }

        // [IEFilter]
        [TypeFilter(typeof(CatchError), Order = 1)]
        public IActionResult Index()
        {
            //throw new Exception("Error test exception");


            ViewBag.Title = _localizer["Title"];

            var cultureName = CultureInfo.CurrentCulture.Name;
            return View();
        }

        public IActionResult Contact()
        {
            return View();
        }

        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}