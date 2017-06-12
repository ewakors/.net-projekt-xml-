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
        protected void Page_PreRender(object sender, EventArgs e)
        {
            if (GridView1.SelectedRow == null)
            {
                DetailsView1.Visible = false;
            }
            else
            {
                DetailsView1.Visible = true;
            }
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

        protected void GridView2_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = GridView1.SelectedRow;
        }

        protected void ObjectDataSourceRecipe_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
        {

           // e.InputParameters["Id"] = Id;
        }

        protected void ButtonAddUser3_Click(object sender, EventArgs e)
        {
            var parent = ((Control)sender).Parent;
            var name = parent.FindControl("TextBoxName3") as TextBox;
            var portion = parent.FindControl("TextBoxPortion3") as TextBox;
            var time = parent.FindControl("TextBoxTime3") as TextBox;           
            var category = parent.FindControl("DropDownListCategoryAdd3") as DropDownList;
            var ingerdient = parent.FindControl("TextBoxIndredient3") as TextBox;

            ObjectDataSourceRecipe.InsertParameters["Name"].DefaultValue = name.Text;
            ObjectDataSourceRecipe.InsertParameters["Portion"].DefaultValue = portion.Text;
            ObjectDataSourceRecipe.InsertParameters["TimeBuild"].DefaultValue = time.Text;
            ObjectDataSourceRecipe.InsertParameters["Category_Id"].DefaultValue = category.Text;
            ObjectDataSourceRecipe.InsertParameters["Ingredient"].DefaultValue = ingerdient.Text;

            ObjectDataSourceRecipe.Insert();
        }


        protected void DetailsView1_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
        {
            GridView1.DataBind();
            GridView1.SelectRow(-1);
        }

        protected void DetailsView1_ItemDeleted(object sender, DetailsViewDeletedEventArgs e)
        {
            GridView1.DataBind();
            GridView1.SelectRow(-1);
        }

        protected void DetailsView1_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
        {
            GridView1.DataBind();
            GridView1.SelectRow(-1);
        }
        //protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    XmlDataSource2.XPath = "/MainDishes/ Przepis[@ID= " + GridView1.SelectedDataKey.Value.ToString() + "]";
        //    MultiView1.ActiveViewIndex = 0;
        //}
    }
}