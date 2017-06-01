using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ksiazkaKucharska
{
    public partial class SummaryRecip : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;
            nazwaTXT.Text = Request.QueryString["nazwa"];
            ilosc_porcjiTXT.Text = Request.QueryString["ilosc_porcji"];
            czasTXT.Text = Request.QueryString["czas"];
            czas2TXT.Text = Request.QueryString["czas2"];
            wykonanieTXT.Text = Request.QueryString["wykonanie"];
            kategorieTXT.Text = Request.QueryString["Kategorie"];

        }
        protected void Zatwierdz_dane_Click(object sender, EventArgs e)
        {
            Server.Transfer("Summary.aspx", true);
        }
    }
}