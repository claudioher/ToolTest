
namespace Cl.Tool.Test.Business
{
    using Cl.Tool.Test.Business.Entity;
    using Cl.Tool.Test.DataAccess;    
    using System.Collections.Generic;
    
    public class PersonaBusiness
    {
        /// <summary>
        /// Método para listar las personas
        /// </summary>
        /// <returns></returns>
        public List<PersonaEntity> Personas_Lst()
        {
            var persona = new PersonaDataAccess();
            return persona.Personas_Lst();
        }


        /// <summary>
        /// Método para buscar la cedula
        /// </summary>
        /// <param name="cedula"></param>
        /// <returns></returns>
        public int Persona_Fnd_Cedula(int cedula)
        {
            var persona = new PersonaDataAccess();
            return persona.Persona_Fnd_Cedula(cedula);
        }

        /// <summary>
        /// Método para eliminar una persona
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public int Persona_Era(int id)
        {
            var persona = new PersonaDataAccess();
            return persona.Persona_Era(id);
        }

        /// <summary>
        /// Método para agregar una persona
        /// </summary>
        /// <param name="cedula"></param>
        /// <param name="nombres"></param>
        /// <param name="email"></param>
        /// <param name="idCargo"></param>
        public void Persona_Add(int cedula, string nombres, string email, int idCargo)
        {
            var persona = new PersonaDataAccess();
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
        public void Persona_Upd(int id, int cedula, string nombres, string email, int idCargo)
        {
            var persona = new PersonaDataAccess();
            persona.Persona_Upd(id, cedula, nombres, email, idCargo);
        }
    }
}
