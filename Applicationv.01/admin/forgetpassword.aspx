<%@ Page Language="C#" AutoEventWireup="true" CodeFile="forgetpassword.aspx.cs" Inherits="admin_forgetpassword" %>

<!DOCTYPE html>

<html lang="en" dir="ltr">
<head runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Login</title>

    <!-- Prevent the demo from appearing in search engines (REMOVE THIS) -->
    <meta name="robots" content="noindex">

    <!-- Perfect Scrollbar -->
    <link type="text/css" href="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/vendor/perfect-scrollbar.css" rel="stylesheet">

    <!-- Material Design Icons -->
    <link type="text/css" href="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/css/material-icons.css" rel="stylesheet">
    <link type="text/css" href="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/css/material-icons.rtl.css" rel="stylesheet">

    <!-- Font Awesome Icons -->
    <link type="text/css" href="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/css/fontawesome.css" rel="stylesheet">
    <link type="text/css" href="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/css/fontawesome.rtl.css" rel="stylesheet">

    <!-- App CSS -->
    <link type="text/css" href="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/css/app.css" rel="stylesheet">
    <link type="text/css" href="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/css/app.rtl.css" rel="stylesheet">
</head>
<body class="login">
<form runat="server">
        <div class="d-flex align-items-center" style="min-height: 100vh">
            <div class="col-sm-8 col-md-6 col-lg-4 mx-auto" style="min-width: 300px;">               
                <div class="card navbar-shadow">
                    <div class="card-header text-center positnrel">
                         <div class="frnd-hdr logo-img">
                            <img src="<%=logourl %>" class="logo-img img-fluid"/>
                        </div>
                        <h4 class="card-title">Forgot Password</h4>
                        <p class="card-subtitle">Recover your account password</p>
                    </div>
                    <div class="card-body">
                        <form action="default.aspx" novalidate method="get">
                            <div class="form-group">
                                <label class="form-label" for="email">Email address:</label>
                                <div class="input-group input-group-merge">
                                    <input id="email" type="email" runat="server" required="" class="form-control form-control-prepended" placeholder="Your email address">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text">
                                            <span class="far fa-envelope"></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="form-label" for="email">Select Your Role:</label>
                                <div class="input-group input-group-merge">
                                    <asp:DropDownList ID="ddlrole" runat="server" CssClass="form-control"></asp:DropDownList>
                                    <div class="input-group-prepend">                                        
                                    </div>
                                </div>
                            </div>
                            <asp:Button ID="btn_login" runat="server" Text="Send Password" CssClass="btn btn-primary btn-block" OnClick="btn_login_Click"  />
                            <asp:Label ID="lblMessage" runat="server" Visible="false"></asp:Label>
                        </form>
                    </div>
                    <div class="card-footer text-center text-black-50">Remember your password? <a href="login.aspx">Login</a></div>
                    <%--<div class="card-footer text-center text-black-50">
                    Not yet a student? <a href="login.aspx">Sign Up</a>
                </div>--%>
                </div>
            </div>
        </div>
</form>

        <!-- jQuery -->
        <script src="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/vendor/jquery.min.js"></script>

        <!-- Bootstrap -->
        <script src="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/vendor/popper.min.js"></script>
        <script src="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/vendor/bootstrap.min.js"></script>

        <!-- Perfect Scrollbar -->
        <script src="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/vendor/perfect-scrollbar.min.js"></script>

        <!-- MDK -->
        <script src="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/vendor/dom-factory.js"></script>
        <script src="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/vendor/material-design-kit.js"></script>

        <!-- App JS -->
        <script src="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/js/app.js"></script>

        <!-- Highlight.js -->
        <script src="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/js/hljs.js"></script>

        <!-- App Settings (safe to remove) -->
        <script src="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/js/app-settings.js"></script>

    </body>
</html>

