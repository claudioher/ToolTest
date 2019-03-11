using Cl.Tool.Test.Business;
using Cl.Tool.Test.Business.Entity;
using System;
using System.Collections.Generic;
using System.Web.Services;


namespace Cl.Tool.Test.AspNet.WebForm
{
    public partial class index : System.Web.UI.Page
    {

        public List<CargoEntity> Cargos { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            var cargo = new CargoBusiness();
            Cargos = cargo.Cargo_Lst();
        }

        /// <summary>
        /// Método para agregar una persona
        /// </summary>
        /// <param name="cedula"></param>
        /// <param name="nombres"></param>
        /// <param name="email"></param>
        /// <param name="idCargo"></param>
        [WebMethod]
        public static void Persona_Add(int cedula, string nombres, string email, int idCargo)
        {
            var persona = new PersonaBusiness();
            persona.Persona_Add(cedula, nombres, email, idCargo);
        }

        /// <summary>
        /// Método para actualizar una persona
        /// </summary>
        /// <param name="id"></param>
        /// <param name="cedula"></param>
        /// <param name="nombres"></param>
        /// <param name="email"></param>
        /// <param name="idCargo"></param>
        [WebMethod]
        public static void Persona_Upd(int id, int cedula, string nombres, string email, int idCargo)
        {
            var persona = new PersonaBusiness();
            persona.Persona_Upd(id, cedula, nombres, email, idCargo);
        }

        /// <summary>
        /// Método para buscar por cedula
        /// </summary>
        /// <param name="cedula"></param>
        /// <returns></returns>
        [WebMethod]
        public static string Persona_Fnd_Cedula(int cedula)
        {
            var persona = new PersonaBusiness();
            return persona.Persona_Fnd_Cedula(cedula).ToString();
        }

        /// <summary>
        /// Método para eliminar una persona
        /// </summary>
        /// <param name="id"></param>
        [WebMethod]
        public static void Persona_Era(int id)
        {
            var persona = new PersonaBusiness();
            persona.Persona_Era(id);

        }
    }
}