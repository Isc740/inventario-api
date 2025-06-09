using ADSO_Proyect.Models;
using Microsoft.AspNetCore.Mvc;

namespace ADSO_Proyect.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class FacturaDetallesController : GenericController<FacturaDetalle>
    {
        public FacturaDetallesController(InvContext context) : base(context)
        {
        }
    }
}
