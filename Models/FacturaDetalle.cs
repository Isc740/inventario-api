using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ADSO_Proyect.Models
{
    public class FacturaDetalle
    {
        [Key]
        public int DetID { get; set; }

        public int? FacIDFK { get; set; }
        [ForeignKey("FacIDFK")]
        public virtual Factura Factura { get; set; }

        public int? PlpIDFK { get; set; }
        [ForeignKey("PlpIDFK")]
        public virtual ProLotPrv ProLotPrv { get; set; }

        public bool Eliminado { get; set; } = false;
    }
}
