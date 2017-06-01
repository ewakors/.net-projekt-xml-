using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ksiazkaKucharska
{
    public partial class VegetarianMainDishes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            XmlDataSource2.XPath = "/VegetarianMainDishes/ Przepis[@ID= " + GridView1.SelectedDataKey.Value.ToString() + "]";
            MultiView1.ActiveViewIndex = 0;
        }
    }
}