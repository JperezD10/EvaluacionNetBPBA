using Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace JulianPerezSolution.Models
{
    public class EmpleadoListViewModel
    {
        public IList<Empleado> Empleados { get; set; }

        public string Busqueda { get; set; }
    }
}