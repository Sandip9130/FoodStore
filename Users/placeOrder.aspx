<%@ Page Title="" Language="C#" MasterPageFile="~/Users/userMaster.Master" AutoEventWireup="true" CodeBehind="placeOrder.aspx.cs" Inherits="FoodStore.Users.placeOrder" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
    .co{
        padding-top: 10%;
        padding-bottom: 10%;
        width: 100%;
        display: flex;
        justify-content: center;
        align-items:center;
        flex-direction: column;
    }
</style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <center>
    <div class="co">

        <table class=' table table-responsive w-75' style='display: flex; align-items: center; justify-content: center;'>
            <tbody>

                <asp:Literal ID="placeOrderHtml" runat="server"></asp:Literal>

                <tr>
                    <td class='py-5'>
                        <h5>Grand Total :</h5>
                        <h5>Service charge :</h5>
                        <h5>Delivery charge :</h5>
                        <h5>You have to pay :</h5>
                    </td>
                    <td class="py-5 px-5">
                        <h5>--------------------<br /></h5>
                        <h5>--------------------<br /></h5>
                        <h5>--------------------<br /></h5>
                        <h5>--------------------</h5>
                    </td>
                    <td class='py-5 px-5'>
                        <h5>₹<asp:Label runat="server" id="grandTot"></asp:Label>.00</h5>
                        <h5>₹20.00</h5>
                        <h5>₹40.00</h5>
                        <h5 class='bg-warning px-2'>₹<asp:Label runat="server" id="totalPay"></asp:Label>.00</h5>
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        Will be delivered on <b><asp:Label ID="deliveryTime" runat="server"></asp:Label></b>
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        Your Name
                        <asp:TextBox id="name" runat="server" class="form-control" placeholder="Enter your name"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ErrorMessage="please enter your name !" ControlToValidate="name" ForeColor="#990000"></asp:RequiredFieldValidator><br />
                        Your Contact
                        <asp:TextBox id="phone" runat="server" class="form-control" placeholder="Contact No" ></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ErrorMessage="Phone no required !" ControlToValidate="phone" ForeColor="#990000"></asp:RequiredFieldValidator><br />
                        Your Delivery Address
                        <asp:TextBox id="DelAddr" runat="server" class="form-control" placeholder="Delivery address"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ErrorMessage="Address required !" ControlToValidate="DelAddr" ForeColor="#990000"></asp:RequiredFieldValidator><br />
                    </td>
                </tr>
                <tr>
                    <td colspan='3' class='form-controle '><br />
                        <asp:ScriptManager runat="server"></asp:ScriptManager>
                        <asp:UpdatePanel runat="server">
                            <ContentTemplate>
                        <h4>Paymet Section</h4><br />
                        Select Payment mode : <asp:DropDownList id="selecteMethod" placeholder="Payment mode" runat="server" class="dropdown form-controle" AutoPostBack="true" OnSelectedIndexChanged="Unnamed1_SelectedIndexChanged">
                            <asp:ListItem class="dropdown-item"></asp:ListItem>
                            <asp:ListItem class="dropdown-item">Cash on delivery(COD)</asp:ListItem>
                            <asp:ListItem class="dropdown-item">UPI</asp:ListItem>
                            <asp:ListItem class="dropdown-item">Credit Card</asp:ListItem>
                            <asp:ListItem class="dropdown-item">Debit Card</asp:ListItem>
                        </asp:DropDownList>
                                <asp:RequiredFieldValidator runat="server" ErrorMessage="Please select payment method !" ControlToValidate="selecteMethod" Font-Size="Small" ForeColor="#990000"></asp:RequiredFieldValidator>
                                <br /><br />
                        
                        <%--payment field for upi--%>
                            <asp:TextBox id="text_upi" runat="server" Visible="false" class="form-control" placeholder="Please enter your UPI ID"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" id="upi_validate" ErrorMessage="Please enter your UPI Id !" ControlToValidate="text_upi" Font-Size="Smaller" ForeColor="Maroon"></asp:RequiredFieldValidator><br />
                            <asp:Button runat="server" id="upi_pay_btn" Visible="false" Text="Pay Now" class="btn btn-primary" />
                        
                       <%-- payment field for card--%>
                            <asp:TextBox id="card_no" runat="server" Visible="false" class="form-control" placeholder="Please enter your card no." TextMode="Number"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" id="cardNoValidate" ErrorMessage="Please enter card no. !" ControlToValidate="card_no" ForeColor="#990000"></asp:RequiredFieldValidator><br />
                            <asp:TextBox runat="server" id="cvv_txt" class="form-inline form-control" Visible="false" TextMode="Number" placeholder="cvv"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" id="cvvValidate" ErrorMessage="cvv required !" ControlToValidate="cvv_txt" ForeColor="#990000"></asp:RequiredFieldValidator><br />
                            <asp:TextBox runat="server" id="exp_txt" class="form-inline form-control" Visible="false" TextMode="Date" placeholder="mm/yyyy"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" id="expValidate" ErrorMessage="enter expiry !" ControlToValidate="exp_txt" ForeColor="#990000"></asp:RequiredFieldValidator><br />
                            <asp:Button runat="server" id="card_pay_btn" Visible="false" Text="Pay Now" class="btn btn-primary" />
                                
                                </ContentTemplate>
                            </asp:UpdatePanel>
                    </td>
                </tr>
                <tr>
                    <td colspan='3' class='text-center form-controle'>
                        <asp:Button runat="server" Text="Place Order" class="btn btn-warning form-controle w-75 fw-bold" OnClick="Unnamed6_Click" />
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
        </center>


</asp:Content>
