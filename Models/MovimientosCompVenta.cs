using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ADSO_Proyect.Models
{
    public class MovimientoCompVenta
    {
        [Key]
        public int MovID { get; set; }

        public string MovTipoMovimiento { get; set; }

        public DateTime? MovFecha { get; set; }

        public int? CompCantidad { get; set; }

        public int? PlpIDFK { get; set; }
        [ForeignKey("PlpIDFK")]
        public virtual ProLotPrv ProLotPrv { get; set; }

        public bool Eliminado { get; set; } = false;
    }
}
