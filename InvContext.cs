using Microsoft.EntityFrameworkCore;

namespace ADSO_Proyect.Models
{
    public class InvContext : DbContext
    {
        public InvContext(DbContextOptions<InvContext> options) : base(options) { }

        public DbSet<CategoriaProducto> CategoriaProductos { get; set; }
        public DbSet<Ciudad> Ciudad { get; set; }
        public DbSet<Cliente> Clientes { get; set; }
        public DbSet<Factura> Facturas { get; set; }
        public DbSet<FacturaDetalle> FacturaDetalles { get; set; }
        public DbSet<Iva> Ivas { get; set; }
        public DbSet<Lote> Lotes { get; set; }
        public DbSet<Marca> Marcas { get; set; }
        public DbSet<Modelo> Modelos { get; set; }
        public DbSet<MovimientoCompVenta> MovimientosCompVentas { get; set; }
        public DbSet<Producto> Productos { get; set; }
        public DbSet<ProLotPrv> ProLotPrvs { get; set; }
        public DbSet<Proveedor> Proveedores { get; set; }
        public DbSet<Rol> Rols { get; set; }

       
    }
}




