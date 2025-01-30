<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="landingPage.aspx.cs" Inherits="FoodStore.Users.landingPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
      <!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" />
<!-- FontAwesome for Icons -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet" />
  <!--CSS file links-->
  <link href="../designFiles/css/masterpage.css" rel="stylesheet" />
  <link href="../designFiles/css/default.css" rel="stylesheet" />
    <title></title>
    <style>
        .banner-blocks {
  display: grid;
  grid-template-columns: repeat(12, 1fr);
  grid-template-rows: repeat(2, 1fr);
  grid-gap: 2rem;
}
.block-1 { grid-area: 1 / 1 / 3 / 8; }
.block-2 { grid-area: 1 / 8 / 2 / 13; }
.block-3 { grid-area: 2 / 8 / 3 / 13; }

@media screen and (max-width:1140px) {
  .banner-blocks {
    grid-template-columns: 1fr;
    grid-template-rows: repeat(4, 1fr);
  }
  .block-1 { grid-area: 1 / 1 / 3 / 2; }
  .block-2 { grid-area: 3 / 1 / 4 / 2; }
  .block-3 { grid-area: 4 / 1 / 5 / 2; }
  
}
.navbar{
    background: linear-gradient(to right, rgba(0, 0, 0, 0.7), rgba(0, 0, 0, 0.7));
}
    </style>
</head>
<body>

    <svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
        <defs>

        <symbol xmlns="http://www.w3.org/2000/svg" id="package" viewBox="0 0 48 48"><path fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" d="m24 13.264l7.288 4.21L24 21.681l-7.288-4.209Z"/><path fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" d="M16.712 17.473v8.418L24 30.101l7.288-4.21v-8.418M24 30.1v-8.418"/><path fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" d="M40.905 21.405a16.905 16.905 0 1 0-23.389 15.611L24 43.5l6.484-6.484a16.906 16.906 0 0 0 10.42-15.611"/></symbol>
        <symbol xmlns="http://www.w3.org/2000/svg" id="secure" viewBox="0 0 48 48"><path fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" d="M14.134 36V20.11h19.732M19.279 36h14.587V25.45"/><path fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" d="m19.246 26.606l4.135 4.135l5.373-5.372m-8.934-9.282a4.087 4.087 0 1 1 8.174 0m0 0v4.023m-8.172-4.108v4.108"/><path fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" d="M30.288 44.566a21.516 21.516 0 1 1 9.69-6.18"/></symbol>
        <symbol xmlns="http://www.w3.org/2000/svg" id="quality" viewBox="0 0 48 48"><path fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" d="m30.59 13.45l4.77 2.94L24 34.68l-10.33-7l3.11-4.6l5.52 3.71l8.26-13.38Z"/><path fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" d="M24 4.5s-11.26 2-15.25 2v20a11.16 11.16 0 0 0 .8 4.1a15 15 0 0 0 2 3.61a22 22 0 0 0 2.81 3.07a34.47 34.47 0 0 0 3 2.48a34 34 0 0 0 2.89 1.86c1 .59 1.71 1 2.13 1.19l1 .49a1.44 1.44 0 0 0 1.24 0l1-.49c.42-.2 1.13-.6 2.13-1.19a34 34 0 0 0 2.89-1.86a34.47 34.47 0 0 0 3-2.48a22 22 0 0 0 2.81-3.07a15 15 0 0 0 2-3.61a11.16 11.16 0 0 0 .8-4.1v-20c-3.99.03-15.25-2-15.25-2"/></symbol>
        <symbol xmlns="http://www.w3.org/2000/svg" id="savings" viewBox="0 0 48 48"><circle cx="24" cy="24" r="21.5" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round"/><path fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" d="M12.5 23.684a3.298 3.298 0 0 1 5.63-2.332l3.212 3.212h0l8.53-8.53a3.298 3.298 0 0 1 5.628 2.333h0c0 .875-.348 1.714-.966 2.333L22.983 32.25a2.321 2.321 0 0 1-3.283 0l-6.234-6.233a3.298 3.298 0 0 1-.966-2.333"/></symbol>
        <symbol xmlns="http://www.w3.org/2000/svg" id="offers" viewBox="0 0 48 48"><path fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" d="m41.556 39.297l-22.022 3.11a1.097 1.097 0 0 1-1.245-.97l-2.352-22.311a1.097 1.097 0 0 1 1.08-1.213l24.238-.229a1.097 1.097 0 0 1 1.108 1.09l.137 19.429c.004.55-.4 1.017-.944 1.094M26.1 25.258v2.579m8.494-2.731v2.175"/><path fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" d="M34.343 32.346c-1.437.828-1.926 1.198-2.774 1.988c-1.19-.457-2.284-1.228-3.797-1.456m-15.953 8.721l-3.49-1.6a1.12 1.12 0 0 1-.643-.863L5.511 23.593c-.056-.4.108-.8.43-1.046l3.15-2.406a1.257 1.257 0 0 1 2.014.874l1.966 19.69a.887.887 0 0 1-1.252.894m11.989-28.112c.214-.456.964-1.716 2.76-3.618c3.108-3.323 4.26-4.288 4.26-4.288s1.42.75 3.27 3.109c1.876 2.358 1.93 3.832 1.93 3.832s.67-.08-4.797 1.688c-3.055.991-4.368 1.152-4.931 1.152"/><path fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" d="M26.97 17.828v-.054c0-.884-.241-1.715-.67-2.412c-.563-.91-1.447-1.608-2.492-1.876a3.58 3.58 0 0 0-1.072-.16c-.429 0-.858.053-1.233.214c-1.152.348-2.063 1.18-2.573 2.278a4.747 4.747 0 0 0-.428 1.956v.134"/><path fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" d="M18.93 15.818c-.562-.107-1.5-.349-3.135-.884c-2.304-.75-3.43-1.528-3.43-1.528s-.456-1.393 1.045-3.296s2.653-2.52 2.653-2.52s.911.778 3.43 3.485c1.26 1.313 1.796 2.09 2.01 2.465h.027"/></symbol>
        
        </defs>
    </svg>

    
        <div>

            <nav class="navbar navbar-expand-lg navbar-dark">
  <div class="container-fluid">
    <!-- Brand Name -->
    <a class="navbar-brand" href="#">Restaurant</a>

    <!-- Toggler for Mobile View -->
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <!-- Navbar Links -->
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" href="#">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Menu</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">About Us</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Contact</a>
        </li>
      </ul>

      <!-- Right-side Icons and Order Button -->
      <div class="d-flex align-items-center">
       
        <!-- login signup Button -->
        <button type="button" class="order-btn ms-3 py-2 px-3" data-bs-toggle="modal" data-bs-target="#signUpModal">Sign Up</button>
          <button class="order-btn ms-3 py-2 px-3" data-bs-toggle="modal" data-bs-target="#logInModal">Log In</button>
      </div>
    </div>
  </div>
</nav>

<form runat="server">

 <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

            
<!-- signUp Modal -->
<div class="modal fade" id="signUpModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
         <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="staticBackdropLabel">SIGN UP</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <div class="form-group">
            <label for="name">Name</label>
            <asp:TextBox ID="Text_name" CssClass="form-control mb-2" runat="server" placeholder="Enter your name"></asp:TextBox>
            </div>
            <div class="form-group">
            <label for="name">Email</label>
            <asp:TextBox ID="Text_email" CssClass="form-control mb-2" runat="server" placeholder="Enter your email"></asp:TextBox>
                <div class="form row g-2 align-items-center mb-2">
                <div class="col-auto d-flex flex-row">
                <asp:Button ID="Snd_otp" CssClass="btn btn-primary" runat="server" Text="Send OTP" OnClick="btn_sendOTP_Click" /><asp:TextBox ID="otp" CssClass="form-control mx-5" runat="server" placeholder="Enter OTP"></asp:TextBox>
                </div>
                </div>
            <b><asp:Label ID="otp_sent_mag" runat="server"></asp:Label></b>
            </div>
            <div class="form-group">
            <label for="name">Phone</label>
            <asp:TextBox ID="Text_phone" CssClass="form-control mb-2" runat="server" placeholder="Enter your phone"></asp:TextBox>
            </div>
            <div class="form-group">
            <label for="name">Password</label>
            <asp:TextBox ID="Text_password" CssClass="form-control mb-2" runat="server" placeholder="Create new password" TextMode="Password"></asp:TextBox>
            </div>
            <div class="form-group">
            <label for="name">Confirm Password</label>
            <asp:TextBox ID="Text_cPass" CssClass="form-control mb-2" runat="server" placeholder="Confirm password" TextMode="Password"></asp:TextBox>
            </div>
            <div class="form-group">
            <label for="name">Address</label>
            <asp:TextBox ID="Text_address" CssClass="form-control mb-4" runat="server" placeholder="Enter your address"></asp:TextBox>
            </div>

      </div>
      <div class="modal-footer text-center">
        <asp:Button ID="btn_signUp" runat="server" Text="SIGN UP" CssClass="btn btn-primary mb-4 w-100" OnClick="btn_signUp_Click" />
       <div class="w-100 mb-3">
           <asp:Label ID="m_box" runat="server" Text=""></asp:Label>
        </div>
       </div>
        </ContentTemplate>           
    </asp:UpdatePanel>
       
    </div>
  </div>
</div>


            <!--LogIn Modal -->
<div class="modal fade" id="logInModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
         <asp:UpdatePanel ID="UpdatePanel2" runat="server">
    <ContentTemplate>
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="staticBackdropLabel2">Log In</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <div class="form-group">
            
            <div class="form-group">
            <label for="name">Email</label>
            <asp:TextBox ID="log_email" CssClass="form-control mb-2" runat="server" placeholder="Enter your email"></asp:TextBox>
            </div>
            
            <div class="form-group">
            <label for="name">Password</label>
            <asp:TextBox ID="log_pass" CssClass="form-control mb-2" runat="server" placeholder="Enter password"></asp:TextBox>
            </div>

      </div>
      <div class="modal-footer text-center">
        <asp:Button ID="btn_login" runat="server" Text="LOG IN" CssClass="btn btn-primary mb-4 w-100" OnClick="btn_logIn_Click" />
       <div class="w-100 mb-3">
           <asp:Label ID="logIn_ms_box" runat="server" Text=""></asp:Label>
        </div>
       </div>
        </ContentTemplate>           
    </asp:UpdatePanel>
       
    </div>
  </div>
</div>
 </form>


        </div>


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
    <a href="default.aspx" class="btn-order-now" onclick="alert('You are not logged in please try to login to order some dilecious food...')">Order Now</a>
  </div>
</section>


    <!-- Features section -->
<section class="py-5">
  <div class="container-lg">
    <div class="row row-cols-1 row-cols-sm-3 row-cols-lg-5">
      <div class="col">
        <div class="card mb-3 border border-dark-subtle p-3">
          <div class="text-dark mb-3">
            <svg width="32" height="32"><use xlink:href="#package"></use></svg>
          </div>
          <div class="card-body p-0">
            <h5>Free delivery</h5>
            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipi elit.</p>
          </div>
        </div>
      </div>
      <div class="col">
        <div class="card mb-3 border border-dark-subtle p-3">
          <div class="text-dark mb-3">
            <svg width="32" height="32"><use xlink:href="#secure"></use></svg>
          </div>
          <div class="card-body p-0">
            <h5>100% secure payment</h5>
            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipi elit.</p>
          </div>
        </div>
      </div>
      <div class="col">
        <div class="card mb-3 border border-dark-subtle p-3">
          <div class="text-dark mb-3">
            <svg width="32" height="32"><use xlink:href="#quality"></use></svg>
          </div>
          <div class="card-body p-0">
            <h5>Quality guarantee</h5>
            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipi elit.</p>
          </div>
        </div>
      </div>
      <div class="col">
        <div class="card mb-3 border border-dark-subtle p-3">
          <div class="text-dark mb-3">
            <svg width="32" height="32"><use xlink:href="#savings"></use></svg>
          </div>
          <div class="card-body p-0">
            <h5>guaranteed savings</h5>
            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipi elit.</p>
          </div>
        </div>
      </div>
      <div class="col">
        <div class="card mb-3 border border-dark-subtle p-3">
          <div class="text-dark mb-3">
            <svg width="32" height="32"><use xlink:href="#offers"></use></svg>
          </div>
          <div class="card-body p-0">
            <h5>Daily offers</h5>
            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipi elit.</p>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

<!-- end features section -->




    <!-- Banner blocks grid -->
    <section class="py-3 mb-4">
      <div class="container-lg">
        <div class="row">
          <div class="col-md-12">

            <div class="banner-blocks">
            
              <div class="banner-ad d-flex align-items-center large bg-info block-1" style="background: url('../designFiles/images/banner-ad-1.jpg') no-repeat; background-size: cover;">
                <div class="banner-content p-5">
                  <div class="content-wrapper text-light">
                    <h3 class="banner-title text-light">Items on SALE</h3>
                    <p>Discounts up to 30%</p>
                    <a href="#" class="btn-link text-white">Shop Now</a>
                  </div>
                </div>
              </div>
              
              <div class="banner-ad bg-success-subtle block-2" style="background:url('../designFiles/images/banner-ad-2.jpg') no-repeat;background-size: cover">
                <div class="banner-content align-items-center p-5">
                  <div class="content-wrapper text-light">
                    <h3 class="banner-title text-light">Combo offers</h3>
                    <p>Discounts up to 50%</p>
                    <a href="#" class="btn-link text-white">Shop Now</a>
                  </div>
                </div>
              </div>

              <div class="banner-ad bg-danger block-3" style="background:url('../designFiles/images/banner-ad-3.jpg') no-repeat;background-size: cover">
                <div class="banner-content align-items-center p-5">
                  <div class="content-wrapper text-light">
                    <h3 class="banner-title text-light">Discount Coupons</h3>
                    <p>Discounts up to 40%</p>
                    <a href="#" class="btn-link text-white">Shop Now</a>
                  </div>
                </div>
              </div>

            </div>
            <!-- / Banner Blocks -->
              
          </div>
        </div>
      </div>
    </section>



                    <!-- Footer Section -->
<footer class="footer">
    <div class="container">
      <div class="row">
        <!-- About Us Section -->
        <div class="col-md-3">
          <h5 class="footer-title">About Us</h5>
          <p class="clr">We offer the best food delivery services to satisfy your hunger. Order online and enjoy fast delivery!</p>
        </div>
  
        <!-- Quick Links Section -->
        <div class="col-md-3">
          <h5 class="footer-title">Quick Links</h5>
          <div class="footer-links">
            <a href="#">Home</a>
            <a href="#">Menu</a>
            <a href="#">About Us</a>
            <a href="#">Contact</a>
          </div>
        </div>
  
        <!-- Contact Info Section -->
        <div class="col-md-3">
          <h5 class="footer-title">Contact Info</h5>
          <p class="clr"><strong>Address:</strong> 123 Food Street, City, Country</p>
          <p class="clr"><strong>Email:</strong> info@fooddelivery.com</p>
          <p class="clr"><strong>Phone:</strong> +123 456 7890</p>
        </div>
  
        <!-- Follow Us Section -->
        <div class="col-md-3">
          <h5 class="footer-title">Follow Us</h5>
          <div class="social-icons">
            <a href="#" class="fab fa-facebook"></a>
            <a href="#" class="fab fa-twitter"></a>
            <a href="#" class="fab fa-instagram"></a>
            <a href="#" class="fab fa-linkedin"></a>
          </div>
        </div>
      </div>
  
      <!-- Footer Bottom -->
      <div class="footer-bottom">
        <p>&copy; 2024 Sandip Babar. All rights reserved.</p>
      </div>
    </div>
  </footer>

        </div>
    

        <!-- Bootstrap JS (optional, for toggler functionality) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

<script src="../designFiles/js/default.js"></script>

</body>
</html>
