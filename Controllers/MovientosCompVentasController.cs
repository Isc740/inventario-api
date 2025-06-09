


using ADSO_Proyect.Models;
using Microsoft.AspNetCore.Mvc;

namespace ADSO_Proyect.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class MovientosCompVentasController : GenericController<MovimientoCompVenta>
    {
        public MovientosCompVentasController(InvContext context) : base(context)
        {
        }
    }
}
