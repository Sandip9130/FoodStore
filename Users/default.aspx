<%@ Page Title="" Language="C#" MasterPageFile="~/Users/userMaster.Master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="FoodStore.Users._default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="search-bar bg-dark">
    <asp:TextBox ID="TextBox1" runat="server" placeholder="Search..." CssClass="input"></asp:TextBox>
    <i class="fas fa-search search-icon"></i>
</div>

    <asp:Literal ID="defaultBody" runat="server">
   <!-- Hero Section -->
  <section class="hero-section">
    <!-- Sliding Background Images and Gradients -->
    <div class="hero-background" id="hero-background">
      <div class="slide-1"></div>
      <div class="slide-2"></div>
      <div class="slide-3"></div>
    </div>

    <!-- Hero Content -->
    <div class="hero-content">
      <h1>Delicious Food, Delivered Fast</h1>
      <p>Order your favorite meals and get them delivered to your doorstep in no time!</p>
      <a href="searchPage.aspx" class="btn-order-now mx-2">Order Now</a>
         
    </div>
  </section>

    <!-- Catagory section -->
  <div class="container mt-5 mb-5 w-100">
  <div class="row">
  <div class="col-md-12 d-flex justify-content-center">
      <span class="bg-warning px-3 py-3 rounded fs-2 mb-5 fw-bold">Explore by catagories</span><br />
   </div>
      </div>
  <div class="row">
    <div class="col-md-4 d-flex justify-content-center">
        <div class="card" style="width: 18rem;">
            <img src="../designFiles/images/beakery.jpg" class="card-img-top" alt="...">
            <div class="card-body">
                <h5 class="card-title">Beckry</h5>
                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                <a href="beakeryCatagory.aspx" class="btn btn-primary">Explore products</a>
            </div>
        </div>
    </div>
    <div class="col-md-4 d-flex justify-content-center">
        <div class="card" style="width: 18rem;">
            <img src="../designFiles/images/bevrages.jpg" class="card-img-top" alt="...">
            <div class="card-body">
                <h5 class="card-title">Beverages</h5>
                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                <a href="bevragesCatagory.aspx" class="btn btn-primary">Explore products</a>
            </div>
        </div>
    </div>
    <div class="col-md-4 d-flex justify-content-center">
        <div class="card" style="width: 18rem;">
            <img src="../designFiles/images/fast food.jpg" class="card-img-top" alt="...">
            <div class="card-body">
                <h5 class="card-title">Fast Food</h5>
                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                <a href="fastFoodCatagory.aspx" class="btn btn-primary">Explore products</a>
            </div>
        </div>
    </div>
  </div>


  <div class="row mt-5">
    <div class="col-md-4 d-flex justify-content-center">
        <div class="card" style="width: 18rem;">
            <img src="../designFiles/images/fruits.jpg" class="card-img-top bg-dark" alt="...">
            <div class="card-body">
                <h5 class="card-title">Fruits</h5>
                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                <a href="fruitsCatagory.aspx" class="btn btn-primary">Explore products</a>
            </div>
        </div>
    </div>
    <div class="col-md-4 d-flex justify-content-center">
        <div class="card" style="width: 18rem;">
            <img src="../designFiles/images/snacks.jpg" class="card-img-top" alt="...">
            <div class="card-body">
                <h5 class="card-title">Snacks</h5>
                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                <a href="snacksCatagory.aspx" class="btn btn-primary">Explore products</a>
            </div>
        </div>
    </div>
    <div class="col-md-4 d-flex justify-content-center">
        <div class="card" style="width: 18rem;">
            <img src="../designFiles/images/vegitables.jpg" class="card-img-top" alt="...">
            <div class="card-body">
                <h5 class="card-title">Vegetables</h5>
                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                <a href="vegetablesCatagory.aspx" class="btn btn-primary">Explore products</a>
            </div>
        </div>
    </div>
  </div>
  </div>

    <!-- catagory end -->
    </asp:Literal>
        
    <div>
    <asp:Literal ID="TableLiteral" runat="server"></asp:Literal>
        </div>
    
    

</asp:Content>
