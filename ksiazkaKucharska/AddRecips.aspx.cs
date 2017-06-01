using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ksiazkaKucharska
{
    public partial class AddRecips : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;
        }
        protected void kategoria_SelectedIndexChanged(object sender, EventArgs e)
        {
            if(kategorieDDL.SelectedValue=="miesne" || kategorieDDL.SelectedValue == "wegetarianskie" || kategorieDDL.SelectedValue == "salatki" || kategorieDDL.SelectedValue == "zupy" || kategorieDDL.SelectedValue == "deseryC" || kategorieDDL.SelectedValue == "deseryZ")
            {
                mvDane.SetActiveView(vDane);
            }
            else
            {
                mvDane.ActiveViewIndex = -1;
            }
        }
        protected void Dodaj_skladnik_Click(object sender, EventArgs e)
        {
            if(skladnikTXT.Text!= "" && ileTXT.Text != "" && jednostkaTXT.Text != "")
            {
                listaSkladnikow.Items.Add(skladnikTXT.Text);
                listaIlosc.Items.Add(ileTXT.Text);
                listaJednostka.Items.Add(jednostkaTXT.Text);
                mvSkladniki.SetActiveView(vSkladniki);
            }
            else
            {
                mvSkladniki.ActiveViewIndex = -1;
            }
        }
        protected void Zatwierdz_Click(object sender, EventArgs e)
        {
            mvDane.ActiveViewIndex = -1;
            mvPodsumowanie.SetActiveView(vPodsumowanie);
        }

        
        protected void Zatwierdz_Dane_Click(object sender, EventArgs e)
        {
            Response.Redirect("SummaryRecip.aspx?nazwa=" + nazwaTXT.Text + "&ilosc_porcji=" + iloscPorcjiTXT.Text + "&czas=" + czasPrzygotowaniaTXT.Text + "&czas2=" + czasPrzygotowaniaDDL.Text + "&wykonanie="+ wykonanieTXT.Text + "&kategorie=" + kategorieDDL.Text);
        }
    }
}