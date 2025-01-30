<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adminMaster.Master" AutoEventWireup="true" CodeBehind="AddProduct.aspx.cs" Inherits="FoodStore.admin.AddProduct" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <!-- Main Content -->
    <div id="mainContent" class="main-content">
        <div class="container p-4">


            <div class="container">
                <div class="form-group">
                    <h2 class="text-center mb-4">Add New Product</h2>
                    <form runat="server">
                        <div class="form-group mb-3">
                            <label for="productName" class="form-label">Product Name</label>
                            <asp:TextBox runat="server" class="form-control" id="productName" placeholder="Enter product name"></asp:TextBox>
                        </div>
                        <div class="mb-3">
                            <label for="productTitle" class="form-label">Product Title</label>
                            <asp:TextBox runat="server" class="form-control" id="productTitle" placeholder="Enter product title"></asp:TextBox>
                        </div>
                        <div class="mb-3">
                            <label for="productDescription" class="form-label">Product Description</label>
                            <asp:TextBox runat="server" class="form-control" id="productDescription" rows="4"
                                placeholder="Enter product description"></asp:TextBox>
                        </div>
                        <div class="mb-3">
                            <label for="productCategory" class="form-label">Product Category</label>
                            <asp:DropDownList class="form-select" id="productCategory" runat="server">
                                <asp:ListItem Selected="True">Select Catagory</asp:ListItem>
                                <asp:ListItem>Vegetables</asp:ListItem>
                                <asp:ListItem>Beakery</asp:ListItem>
                                <asp:ListItem>Fruits</asp:ListItem>
                                <asp:ListItem>Fast food</asp:ListItem>
                                <asp:ListItem>Bevrages</asp:ListItem>
                                <asp:ListItem>Snacks</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="mb-3">
                            <label for="productPrice" class="form-label">Product Price</label>
                            <asp:TextBox class="form-control" id="productPrice" placeholder="Enter product price" runat="server"></asp:TextBox>
                        </div>
                        <div class="mb-3">
                            <label for="priceOff" class="form-label">Price Off (%)</label>
                            <asp:TextBox class="form-control" id="priceOff" placeholder="Enter discount percentage" runat="server"></asp:TextBox>
                        </div>
                        <div class="mb-3">
                            <label for="productImage" class="form-label">Product Image</label>
                            <asp:FileUpload class="form-control" id="productImage" runat="server" />
                        </div>
                        <div class="text-center">
                            <asp:Button type="submit" id="add_btn" text="Add product" runat="server" class="btn btn-primary" OnClick="add_btn_Click"></asp:button>
                        </div>
                        <asp:Label ID="Message_box" runat="server" BackColor="#CCCCFF" BorderStyle="Solid" BorderWidth="2px" ForeColor="#FF3300"></asp:Label>
                    </form>
                </div>
            </div>

        </div>
    </div>

</asp:Content>
