<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Resetpassword.aspx.cs" Inherits="Resetpassword" %>

<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Signup</title>

    <!-- Prevent the demo from appearing in search engines (REMOVE THIS) -->
    <meta name="robots" content="noindex">

    <!-- Perfect Scrollbar -->
    <link type="text/css" href="assets/vendor/perfect-scrollbar.css" rel="stylesheet">

    <!-- Material Design Icons -->
    <link type="text/css" href="assets/css/material-icons.css" rel="stylesheet">
    <link type="text/css" href="assets/css/material-icons.rtl.css" rel="stylesheet">

    <!-- Font Awesome Icons -->
    <link type="text/css" href="assets/css/fontawesome.css" rel="stylesheet">
    <link type="text/css" href="assets/css/fontawesome.rtl.css" rel="stylesheet">

    <!-- App CSS -->
    <link type="text/css" href="assets/css/app.css" rel="stylesheet">
    <link type="text/css" href="assets/css/app.rtl.css" rel="stylesheet">
</head>

<body class="login">
    <form runat="server" id="form1">
        <div class="d-flex align-items-center" style="min-height: 100vh">
            <div class="col-sm-8 col-md-6 col-lg-4 mx-auto" style="min-width: 300px;">

                <div class="card navbar-shadow">
                    <div class="card-header text-center">
                        <h4 class="card-title">Password Reset</h4>

                    </div>
                    <div class="card-body">
                        <asp:Label ID="lblMessage" runat="server" Visible="false"></asp:Label>
                        <div class="form-group">
                            <label class="form-label" for="password">Old Password:</label>
                            <div class="input-group input-group-merge">
                                <input id="oldpassword" type="password" runat="server" class="form-control form-control-prepended" placeholder="Choose a password">
                                <div class="input-group-prepend">
                                    <div class="input-group-text">
                                        <span class="far fa-key"></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="form-label" for="password">Password:</label>
                            <div class="input-group input-group-merge">
                                <input id="newpassword" type="password" runat="server" class="form-control form-control-prepended" placeholder="Choose a password">
                                <div class="input-group-prepend">
                                    <div class="input-group-text">
                                        <span class="far fa-key"></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="form-label" for="password">Confirm Password:</label>
                            <div class="input-group input-group-merge">
                                <input id="confirmpassword" type="password" runat="server" class="form-control form-control-prepended" placeholder="Choose a password">
                                <div class="input-group-prepend">
                                    <div class="input-group-text">
                                        <span class="far fa-key"></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <asp:Button ID="btnSignUp" runat="server" Text="Reset password" CssClass="btn btn-primary btn-block mb-3" OnClick="btnSignUp_Click" />
                    </div>
                    <div class="card-footer text-center text-black-50">Already signed up? <a href="login.aspx">Login</a></div>
                </div>
            </div>
        </div>
    </form>
    <!-- jQuery -->
    <script src="assets/vendor/jquery.min.js"></script>
    <script src="assets/vendor/jquery.validate.js"></script>
    <!-- Bootstrap -->
    <script src="assets/vendor/popper.min.js"></script>
    <script src="assets/vendor/bootstrap.min.js"></script>

    <!-- Perfect Scrollbar -->
    <script src="assets/vendor/perfect-scrollbar.min.js"></script>

    <!-- MDK -->
    <script src="assets/vendor/dom-factory.js"></script>
    <script src="assets/vendor/material-design-kit.js"></script>

    <!-- App JS -->
    <script src="assets/js/app.js"></script>

    <!-- Highlight.js -->
    <script src="assets/js/hljs.js"></script>

    <!-- App Settings (safe to remove) -->
    <script src="assets/js/app-settings.js"></script>


    <script language="javascript" type="text/javascript">
        $(function () {
            $('#btnSignUp').click(function () {
                var summary = "";
                summary += isvalidoldpassword();
                summary += isvalidpassword();
                summary += isvalidconfirmpass();


                if (summary != "") {
                    alert(summary);
                    return false;
                }
                else {
                    return true;
                }
            })
        })
        function isvalidoldpassword() {

            if ($("#oldpassword").val() == "") {
                return ("Please enter old  password" + "\n");
            }
            else {
                return "";
            }
        }
        function isvalidpassword() {

            if ($("#newpassword").val() == "") {
                return ("Please enter password" + "\n");
            }
            else {
                return "";
            }
        }
        function isvalidconfirmpass() {

            if ($("#confirmpassword").val() == "") {
                return ("Please enter confirm password" + "\n");
            }
            else {
                if ($("#confirmpassword").val() == $("#newpassword").val()) {
                    return "";
                }
                else { return ("Please enter same password" + "\n"); }
            }
        }



    //do something

    </script>



</body>

</html>
