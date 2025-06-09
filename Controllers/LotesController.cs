


using ADSO_Proyect.Models;
using Microsoft.AspNetCore.Mvc;

namespace ADSO_Proyect.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class LotesController : GenericController<Lote>
    {
        public LotesController(InvContext context) : base(context)
        {
        }
    }
}
