using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ADSO_Proyect.Models
{
    public class ProLotPrv
    {
        [Key]
        public int PlpID { get; set; }

        public int? ProIDFK { get; set; }
        [ForeignKey("ProIDFK")]
        public virtual Producto Producto { get; set; }

        public int? LotIDFK { get; set; }
        [ForeignKey("LotIDFK")]
        public virtual Lote Lote { get; set; }

        public int? PrvIDFK { get; set; }
        [ForeignKey("PrvIDFK")]
        public virtual Proveedor Proveedor { get; set; }

        public virtual ICollection<FacturaDetalle> FacturaDetalles { get; set; } = new List<FacturaDetalle>();
        public virtual ICollection<MovimientoCompVenta> MovimientoCompVentas { get; set; } = new List<MovimientoCompVenta>();
    }
}
