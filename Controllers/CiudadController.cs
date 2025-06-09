using Microsoft.AspNetCore.Mvc;
using ADSO_Proyect.Models;
using ADSO_Proyect.Interfaces;

namespace ADSO_Proyect.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CiudadController : ControllerBase
    {
        private readonly Interfaz<Ciudad> _repositorio;

        public CiudadController(Interfaz<Ciudad> repositorio)
        {
            _repositorio = repositorio;
        }

        [HttpGet("todos")]
        public async Task<ActionResult<IEnumerable<Ciudad>>> ObtenerTodos()
        {
            var ciudad = await _repositorio.ObtenerTodos();
            return Ok(ciudad);
        }

        [HttpPost("crear")]
        public async Task<ActionResult<Ciudad>> CrearRegistro([FromBody] Ciudad entidad)
        {
            var nuevaCiudad = await _repositorio.CrearRegistro(entidad);
            return CreatedAtAction(nameof(ObtenerPorID), new { id = nuevaCiudad.CiuID }, nuevaCiudad);
        }

        [HttpGet("buscar/{id}")]
        public async Task<ActionResult<Ciudad>> ObtenerPorID(int id)
        {
            var ciudad = await _repositorio.ObtenerPorID(id);
            if (ciudad == null)
                return NotFound();
            return Ok(ciudad);
        }
    }
}
