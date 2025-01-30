<%@ Page Title="" Language="C#" MasterPageFile="~/Users/userMaster.Master" AutoEventWireup="true" CodeBehind="snacksCatagory.aspx.cs" Inherits="FoodStore.Users.snacks" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        .co {
            padding-top: 8%;
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
        <div class="text-centered d-flex justify-content-center py-2 bg-warning">
            <h2>Snacks Catagory</h2>
        </div>
        <asp:Literal ID="snacksProducts" runat="server"></asp:Literal>
    </div>

</asp:Content>
