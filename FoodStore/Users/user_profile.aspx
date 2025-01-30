<%@ Page Title="" Language="C#" MasterPageFile="~/Users/userMaster.Master" AutoEventWireup="true" CodeBehind="user_profile.aspx.cs" Inherits="FoodStore.Users.user_profile" %>
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
    <div class="container my-4">
        <div class="card text-center">
            <div class="card-body">
                <img src="../designFiles/images/profile-placeholder.png" alt="Profile Image" class="rounded-circle mb-3" style="width: 100px; height: 100px;">
                <h2 class="card-title"><asp:Label ID="user_name" runat="server"></asp:Label></h2>
                <p class="card-text">Email: <asp:Label ID="email" runat="server" Text="Label"></asp:Label></p>
                <p class="card-text">Contact: <asp:Label ID="contact" runat="server" Text="Label"></asp:Label></p>
                <p class="card-text">Address: <asp:Label ID="address" runat="server" Text="Label"></asp:Label></p>
                <%--<button type="button" class="order-btn ms-3 py-2 px-3" data-bs-toggle="modal" data-bs-target="#signUpModal">Update profile</button>--%>
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                <ContentTemplate>
                <asp:Button ID="updporf" class="order-btn ms-3 py-2 px-3" runat="server" Text="Update profile" OnClick="updporf_Click" />
                </ContentTemplate>           
                </asp:UpdatePanel>
            </div>
        </div>

        
        <!--UPDATE USER -->
        <div class="modal fade" id="signUpModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
         <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="staticBackdropLabel">Update User Profile</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <div class="form-group">
            <label for="name">Name</label>
            <asp:TextBox ID="Text_name" CssClass="form-control mb-2" runat="server" placeholder="Enter your name"></asp:TextBox>
            </div>
            <div class="form-group">
            <label for="name">Email</label>
            <asp:TextBox ID="Text_email" CssClass="form-control mb-2" runat="server" ReadOnly="true" placeholder="Enter your email"></asp:TextBox>
            </div>
            <div class="form-group">
            <label for="name">Phone</label>
            <asp:TextBox ID="Text_phone" CssClass="form-control mb-2" runat="server" placeholder="Enter your phone"></asp:TextBox>
            </div>
            <div class="form-group">
            <label for="name">Password</label>
            <asp:TextBox ID="Text_password" CssClass="form-control mb-2" runat="server" placeholder="Create new password"></asp:TextBox>
            </div>
            <div class="form-group">
            <label for="name">Confirm Password</label>
            <asp:TextBox ID="Text_cPass" CssClass="form-control mb-2" runat="server" placeholder="Confirm password"></asp:TextBox>
            </div>
            <div class="form-group">
            <label for="name">Address</label>
            <asp:TextBox ID="Text_address" CssClass="form-control mb-4" runat="server" placeholder="Enter your address"></asp:TextBox>
            </div>

      </div>
      <div class="modal-footer text-center">
        <asp:Button ID="btn_signUp" runat="server" Text="UPDATE" CssClass="btn btn-primary mb-4 w-100" OnClick="btn_signUp_Click" />
       <div class="w-100 mb-3">
           <asp:Label ID="m_box" runat="server" Text=""></asp:Label>
        </div>
       </div>
        </ContentTemplate>           
    </asp:UpdatePanel>
       
    </div>
  </div>
</div>

        
        <div class="mt-5">
            <h3 class="text-center">Order History</h3>
            <%--<div class='card mb-3'>
                <div class="row g-0 align-items-center">
                    <div class='col-md-2 text-center'>
                        <img src="sample-image.jpg" alt="Product Image" class="img-fluid rounded-start">
                    </div>
                    <div class='col-md-8'>
                        <div class='card-body'>
                            <h5 class='card-title mx-0'>Product Title: Example Product</h5>
                            <p class='card-text'>Quantity: 2</p>
                            <p class='card-text'>Price: $20</p>
                            <p class='card-text'>Total: $40</p>
                        </div>
                    </div>
                    <div class='col-md-2 text-center'>
                        <button class='btn btn-success'>Repeat Order</button>
                    </div>
                </div>
            </div>--%>
            <!-- Add more orders here -->
            <asp:Literal ID="historyList" runat="server"></asp:Literal>
        </div>
    </div>
</div>

</asp:Content>
