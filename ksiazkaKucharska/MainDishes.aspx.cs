using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ksiazkaKucharska
{
    public partial class MainDishes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            ObjectDataSourceRecipe.UpdateParameters["Id"].DefaultValue = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox1")).Text;
            ObjectDataSourceRecipe.UpdateParameters["Name"].DefaultValue = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBoxEditName")).Text;
            ObjectDataSourceRecipe.UpdateParameters["TimeBuild"].DefaultValue = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBoxEditTime")).Text;
            ObjectDataSourceRecipe.UpdateParameters["Ingredient"].DefaultValue = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBoxEditIngredient")).Text;
            ObjectDataSourceRecipe.UpdateParameters["Category_Id"].DefaultValue = ((DropDownList)GridView1.Rows[e.RowIndex].FindControl("DropDownListEditCategory")).Text;
            ObjectDataSourceRecipe.UpdateParameters["Portion"].DefaultValue = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBoxEditPortion")).Text;
            ObjectDataSourceRecipe.Update();
        }

        protected void ButtonUserAdd2_Click(object sender, EventArgs e)
        {
            ObjectDataSourceRecipe.InsertParameters["Name"].DefaultValue = ((TextBox)GridView1.FooterRow.FindControl("TextBoxName")).Text;
            ObjectDataSourceRecipe.InsertParameters["Portion"].DefaultValue = ((TextBox)GridView1.FooterRow.FindControl("TextBoxPortion")).Text;
            ObjectDataSourceRecipe.InsertParameters["TimeBuild"].DefaultValue = ((TextBox)GridView1.FooterRow.FindControl("TextBoxTime")).Text;
            ObjectDataSourceRecipe.InsertParameters["Category_Id"].DefaultValue = ((DropDownList)GridView1.FooterRow.FindControl("DropDownListCategoryAdd")).Text;
            ObjectDataSourceRecipe.InsertParameters["Ingredient"].DefaultValue = ((TextBox)GridView1.FooterRow.FindControl("TextBoxIndredient")).Text;

            ObjectDataSourceRecipe.Insert();
        }
        //protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    XmlDataSource2.XPath = "/MainDishes/ Przepis[@ID= " + GridView1.SelectedDataKey.Value.ToString() + "]";
        //    MultiView1.ActiveViewIndex = 0;
        //}
    }
}