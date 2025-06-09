using ADSO_Proyect.Interfaces;
using ADSO_Proyect.Models;
using Microsoft.EntityFrameworkCore;

namespace ADSO_Proyect.Repositorios
{
    public class CiudadRepositorio : Interfaz<Ciudad>
    {
        private readonly InvContext _context;

        public CiudadRepositorio(InvContext context)
        {
            _context = context;
        }

        public async Task<IEnumerable<Ciudad>> ObtenerTodos()
        {
            return await _context.Set<Ciudad>().ToListAsync();
        }

        public async Task<Ciudad> CrearRegistro(Ciudad entidad)
        {
            _context.Set<Ciudad>().Add(entidad);
            await _context.SaveChangesAsync();
            return entidad;
        }

        public async Task<Ciudad> ObtenerPorID(int id)
        {
            return await _context.Set<Ciudad>().FindAsync(id);
        }
    }
}
