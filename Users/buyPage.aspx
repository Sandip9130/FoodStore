<%@ Page Title="" Language="C#" MasterPageFile="~/Users/userMaster.Master" AutoEventWireup="true" CodeBehind="buyPage.aspx.cs" Inherits="FoodStore.Users.buyPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        .co {
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

    <asp:Literal ID="Literal1" runat="server"></asp:Literal>
        <div class="co">
        <table class="table w-75 table-responsive">
        
            <tr>
                <td class="w-50">
                    <asp:Image runat="server" id="imag" class="rounded" Height="100%" Width="100%" />
                    
                </td>
                <td class="px-5">
                    <div class="d-flex flex-column form-control">
                        
                        <asp:Label runat="server" id="pTitle" Font-Size="Larger" class="fw-bold"></asp:Label>
                        <asp:Label runat="server" id="pName" Font-Size="Medium"></asp:Label>
                       
                        <asp:Label runat="server" id="discription" Font-Size="Small"></asp:Label>
                        <div class="d-flex flex-row">
                            
                            <b>₹</b><asp:Label runat="server" id="price" TextMode="Number" class="fw-bold"></asp:Label><b>.00</b>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                            <asp:Label runat="server" id="priceoff"></asp:Label>
                        </div>
                        <label class="form-control">Quantity</label>
                        <asp:TextBox runat="server" id="quantity" TextMode="Number" class="form-controle mb-2"></asp:TextBox>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="quantity should be more than 0" ControlToValidate="quantity" Font-Size="Small" ForeColor="Maroon" Operator="GreaterThan" ValueToCompare="0"></asp:CompareValidator>
                        <label class="form-control">Your Contact</label>
                        
                        <asp:TextBox runat="server" id="contact" class="form-controle mb-2"></asp:TextBox>
                        <label class="form-control">Devliver to this address</label>
                        
                        <asp:TextBox runat="server" id="addr" class="form-controle mb-2" Rows="2"></asp:TextBox>
                        <asp:Button runat="server" Text="BUY" class="form-controle btn btn-success mb-2" />
                        <asp:Button runat="server" Text="Add to cart" class="form-controle btn btn-warning" OnClick="Unnamed2_Click" />
                    </div>
                </td>
            </tr>
        
    </table>
       <asp:Label runat="server" id="mesgBox"></asp:Label>
        
    </div>

</asp:Content>
