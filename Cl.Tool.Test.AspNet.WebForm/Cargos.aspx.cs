
namespace Cl.Tool.Test.AspNet.WebForm
{
    using Cl.Tool.Test.Business;
    using Cl.Tool.Test.Business.Entity;
    using System;
    using System.Collections.Generic;


    public partial class Cargos : System.Web.UI.Page
    {
        public List<CargoEntity> CargosLst { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            var cargo = new CargoBusiness();
            CargosLst = cargo.Cargo_Lst();
        }
    }
}