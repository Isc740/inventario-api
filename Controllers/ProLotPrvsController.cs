
using ADSO_Proyect.Models;
using Microsoft.AspNetCore.Mvc;

namespace ADSO_Proyect.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProLotPrvsController : GenericController<ProLotPrv>
    {
        public ProLotPrvsController(InvContext context) : base(context)
        {
        }
    }
}
