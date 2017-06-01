<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site2.Master" CodeBehind="AddRecips.aspx.cs" Inherits="ksiazkaKucharska.AddRecips" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <div class="tekst">
    <asp:MultiView ID="WstepneDane" runat="server" ActiveViewIndex="0">
        <asp:View ID="vWstep" runat="server">
            <br /><br />
        <p  style="font-weight: normal; padding-top: 3%; margin:0; margin-left: 5%; font-family: 'Dosis', sans-serif; color:black; font-size: 2em;">Dodaj przepis: </p>
            <br />
            <p>Nazwa: <asp:TextBox ID="nazwaTXT" runat="server" BackColor="#FFFFFF"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="nazwaTXT" Display="Dynamic" ErrorMessage="Wymagane pole" ForeColor="Red">*Wymagane pole</asp:RequiredFieldValidator></p>

            <br />
            <p>Ile porcji: <asp:TextBox ID="iloscPorcjiTXT" runat="server" BackColor="#FFFFFF"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="iloscPorcjiTXT" Display="Dynamic" ErrorMessage="Wymagane pole" ForeColor="Red">*Wymagane pole</asp:RequiredFieldValidator>
            <asp:RangeValidator id="Range1" ControlToValidate="iloscPorcjiTXT"  MinimumValue="1" MaximumValue="100" Type="Integer" Display="Dynamic" ErrorMessage="Pole musi być większe od 0" ForeColor="Red"
                     Text="*Porcje muszą być większe od 0!" runat="server"/>
            </p>
         
           <br />
            <p>Czas przygotowania:  
           <asp:TextBox ID="czasPrzygotowaniaTXT" runat="server" BackColor="#FFFFFF"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="czasPrzygotowaniaTXT" Display="Dynamic" ErrorMessage="Wymagane pole" ForeColor="Red">*Wymagane pole</asp:RequiredFieldValidator>
            <asp:RangeValidator id="RangeValidator1" ControlToValidate="czasPrzygotowaniaTXT"  MinimumValue="1" MaximumValue="100" Type="Integer" Display="Dynamic" ErrorMessage="Pole musi być większe od 0" ForeColor="Red"
                     Text="*Czas musi być większe od 0!" runat="server"/>
                <asp:DropDownList ID="czasPrzygotowaniaDDL" runat="server" BackColor="#FFFFFF" Width="120">
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem>min</asp:ListItem>
                    <asp:ListItem>godz</asp:ListItem>
                    <asp:ListItem>dni</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="czasPrzygotowaniaDDL" Display="Dynamic" ErrorMessage="Wymagane pole" ForeColor="Red">*Wymagane pole</asp:RequiredFieldValidator>

            </p>
            <br />

<p>Wykonanie: <br />
     <asp:TextBox ID="wykonanieTXT" runat="server" BackColor="#FFFFFF" Height="100px" Width="300px" ></asp:TextBox></p>
         <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="wykonanieTXT" Display="Dynamic" ErrorMessage="Wymagane pole" ForeColor="Red">*Wymagane pole</asp:RequiredFieldValidator>

            <br />
            <p>Kategorie <asp:DropDownList ID="kategorieDDL" runat="server" BackColor="#FFFFFF" OnSelectedIndexChanged="kategoria_SelectedIndexChanged" AutoPostBack="True">
                <asp:ListItem></asp:ListItem>
                <asp:ListItem Value="miesne">Dania mięsne</asp:ListItem>
                <asp:ListItem Value="wegetarianskie">Dania wegetariańskie</asp:ListItem>
                <asp:ListItem Value="salatki">Sałatki</asp:ListItem>
                <asp:ListItem Value="zupy">Zupy</asp:ListItem>
                <asp:ListItem Value="deseryZ">Desery na zimno</asp:ListItem>
                <asp:ListItem Value="deseryC">Desery na ciepło</asp:ListItem>
            </asp:DropDownList></p>
            <br />
            </asp:View>
    </asp:MultiView>
       <asp:MultiView ID="mvDane" runat="server">
            <asp:View ID="vDane" runat="server">
                
            <fieldset>
<legend>Składniki</legend>
               

<asp:MultiView ID="mvSkladniki" runat="server">
    <asp:View ID="vSkladniki" runat="server">
        <div id="row1">
           <asp:ListBox ID="listaSkladnikow" runat="server" BackColor="#FFFFFF" Height="36px" Width="125px" ></asp:ListBox>
</div>
         <div id="row1">
           <asp:ListBox ID="listaIlosc" runat="server" BackColor="#FFFFFF" Height="36px" Width="125px" ></asp:ListBox>
</div>
         <div id="row1">
           <asp:ListBox ID="listaJednostka" runat="server" BackColor="#FFFFFF" Height="36px" Width="125px" ></asp:ListBox>
</div>
    </asp:View>
</asp:MultiView>
<div>
    <div id="row1">
         <p>Składnik </p>
            <asp:TextBox ID="skladnikTXT" runat="server" BackColor="#FFFFFF"></asp:TextBox>
            <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="skladnikTXT" Display="Dynamic" ErrorMessage="Wymagane pole" ForeColor="Red">*Wymagane pole</asp:RequiredFieldValidator>--%>

    </div>
    <div id="row1">
        <p>Ilość</p>
             <asp:TextBox ID="ileTXT" runat="server" BackColor="#FFFFFF"></asp:TextBox>
             <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="ileTXT" Display="Dynamic" ErrorMessage="Wymagane pole" ForeColor="Red">*Wymagane pole</asp:RequiredFieldValidator>--%>

    </div>
    <div id="row1" >
         <p>Jednostka</p>
            <asp:TextBox ID="jednostkaTXT" runat="server" BackColor="#FFFFFF"></asp:TextBox>
            <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="jednostkaTXT" Display="Dynamic" ErrorMessage="Wymagane pole" ForeColor="Red">*Wymagane pole</asp:RequiredFieldValidator>--%>

    </div>    
    <div id="text1">
        <br />
         <asp:Button ID="addIngridient" runat="server" OnClick= "Dodaj_skladnik_Click"  Text="Dodaj składnik"/>
    </div> 
 </div>

</fieldset><br />
                <br />
                <p>Filmik do przepisu: 
                <asp:TextBox ID="filmikTXT" runat="server" BackColor="#FFFFFF" Width="300px"></asp:TextBox>
                </p>
                <br/>

            <asp:Button ID="Zatwierdz" runat="server" OnClick="Zatwierdz_Click" Text="Przejdź dalej" />
            <br /><br />
            </asp:View>
        </asp:MultiView>
       
        <asp:MultiView ID="mvPodsumowanie" runat="server">
            <asp:View ID="vPodsumowanie" runat="server">
                <br />
                <p>Czy na pewno chcesz dodać przepis?:</p>
                    <asp:RadioButtonList ID="czyNaPewno" runat="server" TextAlign="Left">
                    <asp:ListItem>Tak</asp:ListItem>
                    <asp:ListItem>Nie</asp:ListItem>
                </asp:RadioButtonList>
                <br />
                <asp:Button ID="Zatwierdz_Dane" runat="server" OnClick="Zatwierdz_Dane_Click" Text="Zatwierdz" />
                <br /><br />
            </asp:View>

        </asp:MultiView>
  </div>
</asp:Content>
