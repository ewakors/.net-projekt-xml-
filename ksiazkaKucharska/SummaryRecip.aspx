<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site2.Master" CodeBehind="SummaryRecip.aspx.cs" Inherits="ksiazkaKucharska.SummaryRecip" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="tekst">
    <br /><br />
        <p style="font-weight: normal; padding-top: 3%; margin:0; margin-left: 5%; font-family: 'Dosis', sans-serif; color:black; font-size: 2em;">Twój przepis: </p>
            <br />
            <p>Nazwa: <asp:TextBox ID="nazwaTXT" runat="server" BackColor="#FFFFFF"></asp:TextBox></p>
            <br />
            <p>Ilość porcji: <asp:TextBox ID="ilosc_porcjiTXT" runat="server" BackColor="#FFFFFF"></asp:TextBox></p>
           <br />
            <p>Czas przygotowania: <asp:TextBox ID="czasTXT" runat="server" BackColor="#FFFFFF"></asp:TextBox></p> 
             <asp:TextBox ID="czas2TXT" runat="server" BackColor="#FFFFFF"></asp:TextBox>
            <br />
            <p>Wykonanie: <br /> <asp:TextBox ID="wykonanieTXT" runat="server" BackColor="#FFFFFF" Height="100px" Width="350px"></asp:TextBox></p>
            <br />
            <p>Kategorie: <asp:TextBox ID="kategorieTXT" runat="server" BackColor="#FFFFFF"></asp:TextBox></p>
       
            <br /><br />
                <asp:Button ID="Zatwierdz_dane" runat="server" OnClick="Zatwierdz_dane_Click" Text="Prześlij przepis" />

         </div>

</asp:Content>
