using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ADSO_Proyect.Models
{
    public class Factura
    {
        [Key]
        public int FacID { get; set; }

        public DateTime? FacFecha { get; set; }

        public int? CliIDFK { get; set; }
        [ForeignKey("CliIDFK")]
        public virtual Cliente Cliente { get; set; }

        public int? CiuIDFK { get; set; }
        [ForeignKey("CiuIDFK")]
        public virtual Ciudad Ciudad { get; set; }

        public bool Eliminado { get; set; } = false;

        public virtual ICollection<FacturaDetalle> FacturaDetalles { get; set; } = new List<FacturaDetalle>();
    }
}
