

using ADSO_Proyect.Models;
using Microsoft.AspNetCore.Mvc;

namespace ADSO_Proyect.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class RolsController : GenericController<Rol>
    {
        public RolsController(InvContext context) : base(context)
        {
        }
    }
}
