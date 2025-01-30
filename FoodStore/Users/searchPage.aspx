<%@ Page Title="" Language="C#" MasterPageFile="~/Users/userMaster.Master" AutoEventWireup="true" CodeBehind="searchPage.aspx.cs" Inherits="FoodStore.Users.searchPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        .search-bar {
            position: relative;
            width: 100%;
            max-width: 450px; /* Adjust width */
            
        }

        .search-bar input {
            width: 100%;
            padding: 10px 15px; /* Padding for text */
            padding-right: 40px; /* Space for the icon */
            border: 2px solid #ccc; /* Border color */
            border-radius: 25px; /* Rounded corners */
            font-size: 16px;
            outline: none;
            transition: border-color 0.3s ease;
        }

        .search-bar input:focus {
            border-color: #007bff; /* Change border color on focus */
        }

        .search-bar .search-icon {
            position: absolute;
            top: 50%;
            right: 10px; /* Adjust icon position */
            transform: translateY(-50%);
            color: #666; /* Icon color */
            font-size: 18px;
            cursor: pointer;
        }

        .search-bar input::placeholder {
            color: #aaa; /* Placeholder text color */
        }
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

    <div class="co">
     <div class="search-bar">
        <input type="text" placeholder="Search..." onkeyup="searchProduct()" id="searchName" />
        <i class="fas fa-search search-icon"></i>
    </div>

        <div>
            <asp:Literal ID="productSearch" runat="server"> </asp:Literal>
        </div>

    </div>

    

</asp:Content>
