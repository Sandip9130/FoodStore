<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adminMaster.Master" AutoEventWireup="true" CodeBehind="menuManage.aspx.cs" Inherits="FoodStore.admin.menuManage" %>
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
    <form runat="server">
    <!-- Main Content -->
  <div id="mainContent" class="main-content">
    <div class="container p-4">
      
      <h2 class="text-center mb-4">Manage Product</h2>

    <div class="mb-3">
    <label for="filterStatus" class="form-label">Filter by product catagory</label>
    <select id="filterCatagory" class="form-select" oninput="dropDawnFilter()">
        <option value="all">All</option>
        <option value="Snacks">Snacks</option>
        <option value="Bevrages">Bevrages</option>
        <option value="Fast food">Fast food</option>
        <option value="Vegetables">Vegetables</option>
        <option value="Fruits">Fruits</option>
        <option value="Beakery">Beakery</option>
    </select>
    <input type="text" id="searchItem" placeholder="Search by product name..." onkeyup="searchItem()" class="form-control mt-3 w-100">
    </div>

        <div class="table-responsive">
            <table class="table table-striped">
                <thead class="table-dark">
                    <tr>
                        <th>Product image</th>
                        <th>Product name</th>
                        <th>Product title</th>
                        <th>Product description</th>
                        <th>Product catagory</th>
                        <th>Price</th>
                        <th>Price off %</th>
                        <th>Menu manage </th>
                    </tr>
                </thead>
                <tbody id="menuManTbody">

                    <asp:Literal ID="tblBody" runat="server"></asp:Literal>

            <!-- ***CODE INSIDE TEMPLATE LITRAL*** -->
                    <%--<tr>
                        <td>french fries</td>
                        <td>ht</td>
                        <td>Product A</td>
                        <td>Snacks</td>
                        <td>2</td>
                        <td>Electronics</td>
                        <td>John Doe</td>
                        <td>
                            <a href='UpdateProduct.aspx?pid=' class='btn btn-warning'>Update</a>
                            <!--<input type="button" value="Delete" class="btn btn-danger">-->
                            <a href='deleteProduct.aspx?pid=' Class='btn btn-danger' OnClick="return confirm('Are you sure you want to delete this item ?');">Delete</a>
                        </td>
                        
                    </tr>--%>
                </tbody>
            </table>
        </div>


    </div>
  </div>
        </form>
</asp:Content>
