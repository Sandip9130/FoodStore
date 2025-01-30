<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adminMaster.Master" AutoEventWireup="true" CodeBehind="orders.aspx.cs" Inherits="FoodStore.admin.orders" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

   

    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        
        /* Styling for the dropdown container */
        .dropdown {
            position: relative;
            display: inline-block;
            
            
        }
        .dropdown:hover{
            cursor: pointer;
        }

        /* Dropdown content */
        .dropdown-content {
            display: none;
            position: absolute;
            background-color: #f9f9f9;
            min-width: 160px;
            box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
            z-index: 1;

        }

        /* Anchor tag styling inside dropdown */
        .dropdown-content a {
            color: black;
            padding: 10px 15px;
            text-decoration: none;
            display: block;
        }

        /* Hover effect for links */
        .dropdown-content a:hover {
            background-color: #f1f1f1;
        }

        /* Show the dropdown on hover */
        .dropdown:hover .dropdown-content {
            display: block;
        }
    
    </style>

   

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    
    <!-- Main Content -->
    <div id="mainContent" class="main-content p-0">
        <div class="container p-4">


            <div class="container mt-5">
                <h2 class="text-center mb-4">Order Table</h2>
                <div class="mb-3">
                    <label for="filterStatus" class="form-label">Filter by Order Status:</label>
                    <select id="filterStatus" class="form-select" oninput="comp()">
                        <option value="all">All</option>
                        <option value="pending">Pending</option>
                        <option value="dispatched">Dispatched</option>
                        <option value="delivered">Delivered</option>
                    </select>
                    <input type="text" id="searchName" placeholder="Search by product name..." onkeyup="searchRec()" class="form-control mt-3 w-100">
                </div>
                <div class="table-responsive" style="position:absolute; z-index: -1;">
                    <table class="table table-striped">
                        <thead class="table-dark">
                            <tr>
                                <th>Order ID</th>
                                <th>Product Image</th>
                                <th>Product Name</th>
                                <th>Product Price</th>
                                <th>Quantity</th>
                                <th>Order value</th>
                                <th>Customer Name</th>
                                <th>Address</th>
                                <th>Customer Contact</th>
                                <th>Order Status</th>
                                <th>Change Status</th>
                                <th>Order Date</th>
                            </tr>
                        </thead>
                        <tbody id="orderTableBody">
                            <%--<tr>
                                <td>001</td>
                                <td>ht</td>
                                <td>Product A</td>
                                <td>$20</td>
                                <td>2</td>
                                <td>Electronics</td>
                                <td>John Doe</td>
                                <td>123 Street, City</td>
                                <td>0987654321</td>
                                <td>dispatched</td>
                                <td>2024-12-01</td>
                                <td class="text-center">
                                    <select class="form-select" id="chval"  oninput="changeStatus()">
                                        <option value="pending">Pending</option>
                                        <option value="dispatched">Dispatched</option>
                                        <option value="delivered">Delivered</option>
                                    </select>   
                                </td>
                            </tr>--%>
                            <asp:Literal ID="ordrTblDt" runat="server"></asp:Literal>
                        </tbody>
                    </table>
                </div>
            </div>


        </div>
    </div>

</asp:Content>






