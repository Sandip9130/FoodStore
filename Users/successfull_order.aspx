<%@ Page Title="" Language="C#" MasterPageFile="~/Users/userMaster.Master" AutoEventWireup="true" CodeBehind="successfull_order.aspx.cs" Inherits="FoodStore.Users.successfull_order" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="bg-light d-flex align-items-center justify-content-center" style="min-height: 100vh;">
    <div class="container">
        <div class="card shadow text-center mx-auto" style="max-width: 500px;">
            <div class="card-body">
                <img src="https://cdn-icons-png.flaticon.com/512/190/190411.png" alt="Thank You Icon" class="img-fluid mb-3" style="width: 100px;">
                <h1 class="card-title">Thank You!</h1>
                <p class="card-text">Your order has been placed successfully. We appreciate your trust in us and look forward to serving you again!</p>
                <div class="d-flex justify-content-center gap-2 mt-3">
                    <a href="searchPage.aspx" class="btn btn-primary">Continue Shopping</a>
                    <a href="user_profile.aspx" class="btn btn-outline-secondary">View Orders</a>
                </div>
            </div>
        </div>
    </div>
</div>
    

</asp:Content>
