<%@ Page Title="" Language="C#" MasterPageFile="~/Users/userMaster.Master" AutoEventWireup="true" CodeBehind="cartPage.aspx.cs" Inherits="FoodStore.Users.cartPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .co{
            padding-top: 10%;
            padding-bottom: 10%;
            width: 100%;
            display: flex;
            justify-content: center;
      
            flex-direction: column;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="co">
        <div>
            <h1 class="text-center mb-4">Your Shopping Cart</h1>
        </div>
        <div class="px-5">
        
                <asp:Literal ID="cartTable" runat="server"></asp:Literal>
               <!-- <tr>
                    <td>
                        <img src="#" height="100" width="100" />
                        <span>Prodict Name</span>
                    </td>
                    <td>₹200.00</td>
                    <td>
                        qty
                    </td>
                    <td>₹200.00</td>
                    <td>
                        <button type="submit" class="btn btn-danger">Remove</button>
                        
                    </td>
                </tr>  -->
            </div>
        </div>>
            


</asp:Content>
