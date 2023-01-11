using Business;
using Entities;
using JulianPerezSolution.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace JulianPerezSolution.Controllers
{
    public class EmpleadoController : Controller
    {
        private EmpleadoBusiness EmpleadoBusiness;
        private DocumentosBusiness DocumentosBusiness;
        private IList<Empleado> Empleados;

        public EmpleadoController()
        {
            EmpleadoBusiness = new EmpleadoBusiness();
            DocumentosBusiness = new DocumentosBusiness();
            Empleados = new List<Empleado>();
        }

        // GET: Empleado
        public ActionResult Index()
        {
            Empleados = EmpleadoBusiness.GetEmpleados();
            return View(Empleados);
        }


        // GET: Empleado/Create
        public ActionResult Create()
        {
            setDocumentos();
            return View();
        }

        // POST: Empleado/Create
        [HttpPost]
        public ActionResult Create(CreateUpdateEmpleadoViewModel empleadoModel )
        {
            try
            {
                // TODO: Add insert logic here
                Empleado empleado = new Empleado()
                {
                    Apellido = empleadoModel.Apellido,
                    Nombre = empleadoModel.Nombre,
                    Codigo = empleadoModel.Codigo,
                    FechaAlta = empleadoModel.FechaAlta,
                    IdTipoDto = empleadoModel.TipoDocumento,
                    NumDocumento = empleadoModel.NumDocumento,
                };
                EmpleadoBusiness.CrearEmpleado(empleado);
                return RedirectToAction(nameof(Index));
            }
            catch(Exception e)
            {
                return View("Error", e.Message);
            }
        }

        // GET: Empleado/Edit/5
        public ActionResult Edit(int id)
        {
            Empleado empleado = EmpleadoBusiness.GetEmpleados().FirstOrDefault(emp => emp.Id == id);
            CreateUpdateEmpleadoViewModel model = new CreateUpdateEmpleadoViewModel()
            {
                Apellido = empleado.Apellido,
                Codigo = empleado.Codigo,
                FechaAlta = empleado.FechaAlta,
                NumDocumento = empleado.NumDocumento,
                Nombre = empleado.Nombre,
                TipoDocumento = empleado.IdTipoDto.Value,
            };
            setDocumentos();
            return View(model);
        }

        // POST: Empleado/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, CreateUpdateEmpleadoViewModel empleadoModel)
        {
            try
            {
                // TODO: Add update logic here
                Empleado empleado = new Empleado()
                {
                    Id = id,
                    Apellido = empleadoModel.Apellido,
                    Nombre = empleadoModel.Nombre,
                    Codigo = empleadoModel.Codigo,
                    FechaAlta = empleadoModel.FechaAlta,
                    IdTipoDto = empleadoModel.TipoDocumento,
                    NumDocumento = empleadoModel.NumDocumento,
                };
                EmpleadoBusiness.EditarEmpleado(empleado);
                return RedirectToAction(nameof(Index));
            }
            catch (Exception ex)
            {
                return View("Error", ex.Message);
            }
        }

        // GET: Empleado/Delete/5
        public ActionResult Delete(int id)
        {
            Empleado empleado = EmpleadoBusiness.GetEmpleados().FirstOrDefault(emp => emp.Id == id);
            return View(empleado);
        }

        // POST: Empleado/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here
                EmpleadoBusiness.EliminarEmpleado(id);
                return RedirectToAction(nameof(Index));
            }
            catch(Exception e)
            {
                return View("Error",e.Message);
            }
        }

        private void setDocumentos()
        {
            var documentos = DocumentosBusiness.GetDocumentos();
            ViewData["TipoDocumento"] = documentos;
        }
    }
}
