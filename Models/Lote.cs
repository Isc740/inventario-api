using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace ADSO_Proyect.Models
{
    public class Lote
    {
        [Key]
        public int LotID { get; set; }

        public string LotNumero { get; set; }

        public string LotDescripcion { get; set; }

        public DateTime? LotFecVence { get; set; }

        public bool Eliminado { get; set; } = false;

        public virtual ICollection<ProLotPrv> ProLotPrvs { get; set; } = new List<ProLotPrv>();
    }
}
