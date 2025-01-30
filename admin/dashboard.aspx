<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adminMaster.Master" AutoEventWireup="true" CodeBehind="dashboard.aspx.cs" Inherits="FoodStore.admin.dashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
    body {
        background-color: #f8f9fa;
        font-family: Arial, sans-serif;
    }

    .form-container {
        margin: 50px auto;
        padding: 20px;
        background: #ffffff;
        border-radius: 8px;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        max-width: 600px;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <!-- Main Content -->
  <div id="mainContent" class="main-content">
    <div class="container p-4">
      <h1>Admin Dashboard</h1>
      <div class="container">
        <div class="row">
          <div class="col-md-3 bg-muted ms-3 my-3 rounded py-3 shadow">
                <h4 class="bg-warning w-50 text-center rounded py-2 px-2 fw-bold">Sales</h4>
                <div class="mt-4 text-center">
                    <h4><asp:Label ID="Sales" runat="server" Text="Label"></asp:Label></h4>
                    
                </div>
          </div>
          <div class="col-md-4 bg-muted ms-3 my-3 rounded py-3 shadow text-light">
            <h4 class="bg-danger w-75 text-center rounded py-2 px-2 fw-bold">Pending Orders</h4>
            <div class="mt-4 text-center">
              <h4 class="text-dark"><asp:Label ID="pendingOrd" runat="server" Text="Label"></asp:Label></h4>
          </div>
          </div>
          <div class="col-md-4 bg-muted ms-3 my-3 rounded py-3 shadow text-light">
            <h4 class="bg-success w-75 text-center rounded py-2 px-2 fw-bold">Completed Orders</h4>
            <div class="mt-4 text-center">
              <h4 class="text-dark"><asp:Label ID="completedOrd" runat="server" Text="Label"></asp:Label></h4>
          </div>
          </div>
          <div class="col-md-6 bg-muted ms-4 my-3 rounded py-3 shadow text-light"><h4></h4>
            <h4 class="bg-primary w-50 text-center rounded py-2 px-2 fw-bold">Listed Products</h4>
            <div class="mt-4 text-center">
              <h4 class="text-dark">Total Listed Products: 178</h4>
          </div>
          <table class="table table-striped table-responsive">
            <thead>
              <tr>
                <th>Catagory</th>
                <th>Product Count</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>Snacks</td>
                <td><asp:Label ID="SnacksC" runat="server" ></asp:Label></td>
              </tr>
              <tr>
                <td>Bevrages</td>
                <td><asp:Label ID="Bevrages" runat="server" ></asp:Label></td>
              </tr>
              <tr>
                <td>Fast Food</td>
                <td><asp:Label ID="FastFood" runat="server" ></asp:Label></td>
              </tr>
              <tr>
                <td>Beakery</td>
                <td><asp:Label ID="Beakery" runat="server" ></asp:Label></td>
              </tr>
              <tr>
                <td>Vegitables</td>
                <td><asp:Label ID="Vegitables" runat="server" ></asp:Label></td>
              </tr>
              <tr>
                <td>Fruits</td>
                <td><asp:Label ID="Fruits" runat="server" ></asp:Label></td>
              </tr>
            </tbody>
          </table>
          <div>
          </div>
          </div>
          <div class="col-md-5 bg-muted ms-4 my-3 rounded py-3 shadow h-50">
            <h4 class="bg-secondary w-75 text-center rounded py-2 px-2 fw-bold text-light">Inquiries</h4>
          <div class="table-responsive">
          <table class="table table">
            <thead>
              <tr>
                <th>Inquiries</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>
                  <h6>From: <span class="fw-bold">Sandip Babar</span></h6>
                  <h7>Sandip@gmail.com</h7>
                </td>
              </tr>
            </tbody>
          </table>
          </div>
        </div>
      </div>
      </div>
    </div>
  </div>

</asp:Content>
