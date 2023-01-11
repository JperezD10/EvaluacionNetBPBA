using Entities;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace JulianPerezSolution.Models
{
    public class CreateUpdateEmpleadoViewModel
    {
        [Required(ErrorMessage = "Debe ingresar el codigo")]
        [MaxLength(5, ErrorMessage = "El codigo no puede tener mas de 5 digitos")]
        public string Codigo { get; set; }
        [Required(ErrorMessage = "Debe ingresar el Apellido")]
        [MaxLength(50, ErrorMessage = "El Apellido no puede tener mas de 50 caracteres")]
        public string Apellido { get; set; }
        [Required(ErrorMessage = "Debe ingresar el Nombre")]
        [MaxLength(50, ErrorMessage = "El Nombre no puede tener mas de 50 caracteres")]
        public string Nombre { get; set; }
        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        public DateTime? FechaAlta { get; set; }
        public int TipoDocumento { get; set; }
        public int? NumDocumento { get; set; }
    }
}