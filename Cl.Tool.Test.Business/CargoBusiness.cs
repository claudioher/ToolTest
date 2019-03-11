
namespace Cl.Tool.Test.Business
{
    using Cl.Tool.Test.Business.Entity;
    using Cl.Tool.Test.DataAccess;    
    using System.Collections.Generic;    

    public class CargoBusiness
    {
        /// <summary>
        /// Método para obtener la lista de cargos
        /// </summary>
        /// <returns></returns>
        public List<CargoEntity> Cargo_Lst()
        {
            var cargo = new CargoDataAccess();
            return cargo.Cargo_Lst();
        }
    }
}
