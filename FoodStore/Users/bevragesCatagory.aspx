<%@ Page Title="" Language="C#" MasterPageFile="~/Users/userMaster.Master" AutoEventWireup="true" CodeBehind="bevragesCatagory.aspx.cs" Inherits="FoodStore.Users.bevragesCatagory" %>
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
            <h2>Bevrages Catagory</h2>
        </div>
        <asp:Literal ID="bevragesProducts" runat="server"></asp:Literal>
    </div>

</asp:Content>
