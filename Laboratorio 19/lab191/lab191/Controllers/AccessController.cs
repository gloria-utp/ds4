using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using lab191.Models.WS;

namespace lab191.Controllers
{
    public class AccessController : ApiController
    {
        [HttpGet]
        public Reply HelloWorld()
        {
            Reply OR = new Reply();  // ← "OR" con mayúsculas
            OR.result = 1;           // ← "OR" con mayúsculas
            OR.message = "Mi Hello World en API";  // ← "OR" con mayúsculas

            return OR;               // ← "OR" con mayúsculas
        }
    }
}