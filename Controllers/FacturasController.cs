




using ADSO_Proyect.Models;
using Microsoft.AspNetCore.Mvc;

namespace ADSO_Proyect.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class FacturasController : GenericController<Factura>
    {
        public FacturasController(InvContext context) : base(context)
        {
        }
    }
}