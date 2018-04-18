using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace DockerCI.Controllers
{
    [Produces("application/json")]
    [Route("api/Gst")]
    public class GstController : Controller
    {
        public decimal GetGstTax(decimal value)
        {
            return 0.06m * value;
        }
    }
}