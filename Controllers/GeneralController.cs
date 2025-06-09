using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using ADSO_Proyect.Models;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace ADSO_Proyect.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class GenericController<TEntity> : ControllerBase where TEntity : class
    {
        private readonly InvContext _context;
        private readonly DbSet<TEntity> _dbSet;

        public GenericController(InvContext context)
        {
            _context = context;
            _dbSet = _context.Set<TEntity>();
        }

        // GET: api/[controller]
        [HttpGet]
        public async Task<ActionResult<IEnumerable<TEntity>>> Get()
        {
            return await _dbSet.ToListAsync();
        }

        // GET: api/[controller]/5
        [HttpGet("{id}")]
        public async Task<ActionResult<TEntity>> Get(int id)
        {
            var entity = await _dbSet.FindAsync(id);

            if (entity == null)
                return NotFound();

            return entity;
        }

        // POST: api/[controller]
        [HttpPost]
        public async Task<ActionResult<TEntity>> Post(TEntity entity)
        {
            _dbSet.Add(entity);
            await _context.SaveChangesAsync();

            return CreatedAtAction(nameof(Get), new { id = GetPrimaryKeyValue(entity) }, entity);
        }

        // PUT: api/[controller]/5
        [HttpPut("{id}")]
        public async Task<IActionResult> Put(int id, TEntity entity)
        {
            var key = GetPrimaryKeyValue(entity);
            if (!id.Equals(key))
                return BadRequest();

            _context.Entry(entity).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!EntityExists(id))
                    return NotFound();
                else
                    throw;
            }

            return NoContent();
        }

        // DELETE: api/[controller]/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(int id)
        {
            var entity = await _dbSet.FindAsync(id);
            if (entity == null)
                return NotFound();

            _dbSet.Remove(entity);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool EntityExists(int id)
        {
            return _dbSet.Find(id) != null;
        }

        private object GetPrimaryKeyValue(TEntity entity)
        {
            var keyName = _context.Model.FindEntityType(typeof(TEntity)).FindPrimaryKey().Properties[0].Name;
            return entity.GetType().GetProperty(keyName).GetValue(entity, null);
        }
    }
}
