
namespace Cl.Tool.Test.AspNet.WebForm
{
    using Cl.Tool.Test.Business;
    using Cl.Tool.Test.Business.Entity;
    using System;
    using System.Collections.Generic;

    public partial class GrillaPersona : System.Web.UI.Page
    {
        public List<PersonaEntity> PersonaLst { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            var lstPersona = new PersonaBusiness();
            PersonaLst = lstPersona.Personas_Lst();
        }
    }
}