using DataAccess;
using Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Business
{
    public class EmpleadoBusiness
    {
        EmpleadoDataAccess EmpleadoDataAccess;

        public EmpleadoBusiness()
        {
            EmpleadoDataAccess = new EmpleadoDataAccess();
        }

        public IList<Empleado> GetEmpleados(string apellido = null)
        {
            if (apellido == null)
            {
                return EmpleadoDataAccess.GetEmpleados();
            }
            return EmpleadoDataAccess.GetEmpleadosByApellido(apellido);
        }

        public void CrearEmpleado(Empleado empleado)
        {
            var result = EmpleadoDataAccess.CrearEmpleado(empleado);
            if (result == null)
            {
                throw new Exception("Error al crear el empleado. Hable con el administrador");
            }
        }
        public void EditarEmpleado(Empleado empleado)
        {
            var result = EmpleadoDataAccess.EditarEmpleado(empleado);
            if(result == false)
            {
                throw new Exception("Error al editar el empleado. Hable con el administrador");
            }
        }
        public void EliminarEmpleado(int id) => EmpleadoDataAccess.EliminarEmpleado(id);
    }
}
