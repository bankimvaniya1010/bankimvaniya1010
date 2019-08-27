<%@ Page Language="C#" AutoEventWireup="true" CodeFile="register.aspx.cs" Inherits="register" %>

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
                        <h4 class="card-title">Sign Up</h4>
                        <p class="card-subtitle">Create a new account</p>
                    </div>
                    <div class="card-body">



                         <div class="form-group" runat="server" visible="false" id="lblerror" >
                            <label class="form-label badge-danger" for="course" >User is already registered with entered email address</label>
                            
                        </div>


                        <div class="form-group">
                            <label class="form-label" for="name">Name:</label>
                            <div class="input-group input-group-merge">
                                <input id="name" type="text" runat="server" class="form-control form-control-prepended" placeholder="name">
                                <div class="input-group-prepend">
                                    <div class="input-group-text">
                                        <span class="far fa-user"></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                       <%--  <div class="form-group">
                            <label class="form-label" for="mname">Middle Name:</label>
                            <div class="input-group input-group-merge">
                                <input id="mname" type="text" runat="server" class="form-control form-control-prepended" placeholder="Middle name">
                                <div class="input-group-prepend">
                                    <div class="input-group-text">
                                        <span class="far fa-user"></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                         <div class="form-group">
                            <label class="form-label" for="lname">Last Name:</label>
                            <div class="input-group input-group-merge">
                                <input id="lname" type="text" runat="server" class="form-control form-control-prepended" placeholder="last name">
                                <div class="input-group-prepend">
                                    <div class="input-group-text">
                                        <span class="far fa-user"></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="form-label" for="email">UserName:</label>
                            <div class="input-group input-group-merge">
                                <input id="username" runat="server" type="text" class="form-control form-control-prepended" placeholder="Your username">
                                <div class="input-group-prepend">
                                    <div class="input-group-text">
                                        <span class="far fa-envelope"></span>
                                    </div>
                                </div>
                            </div>
                        </div>--%>
                        <div class="form-group">
                            <label class="form-label" for="email">Email address:</label>
                            <div class="input-group input-group-merge">
                                <input id="email" type="text" runat="server" class="form-control form-control-prepended" placeholder="Your email address">
                                <div class="input-group-prepend">
                                    <div class="input-group-text">
                                        <span class="far fa-envelope"></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%--<div class="form-group">
                            <label class="form-label" for="password">Password:</label>
                            <div class="input-group input-group-merge">
                                <input id="password" type="password" runat="server" class="form-control form-control-prepended" placeholder="Choose a password">
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
                                <input id="confirmpassword" type="password" runat="server" class="form-control form-control-prepended" placeholder="Choose a password">
                                <div class="input-group-prepend">
                                    <div class="input-group-text">
                                        <span class="far fa-key"></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="form-label" for="enrollmentyear">When you want to enrol:</label>
                            <div class="input-group input-group-merge">
                                <div class="col-md-9">
                                    <asp:RadioButton ID="rblYear1" runat="server" GroupName="enrollmentyear" />
                                    <asp:RadioButton ID="rblYear2" runat="server" GroupName="enrollmentyear" />
                                    <asp:RadioButton ID="rblYear3" runat="server" GroupName="enrollmentyear" />
                                </div>

                            </div>
                        </div>
                        <div class="form-group">
                            <label class="form-label" for="studylevel">Study Level:</label>
                            <div class="input-group input-group-merge">
                                <div class="col-md-9">
                                    <asp:RadioButtonList ID="rblstudyLevel" RepeatColumns="2" runat="server"></asp:RadioButtonList>
                                </div>

                            </div>
                        </div>
                        <div class="form-group" >
                            <label class="form-label" for="course">Course:</label>
                            <div class="input-group input-group-merge">
                                <div class="col-md-9">
                                    <asp:ListBox ID="lstCourse" SelectionMode="Multiple" CssClass="form-control" runat="server"></asp:ListBox>
                                </div>

                            </div>
                        </div>--%>
                        <asp:Button ID="btnSignUp" runat="server" Text="Sign Up" CssClass="btn btn-primary btn-block mb-3" OnClick="btnSignUp_Click" />
                         
                        <div class="form-group text-center mb-0">
                            <div class="custom-control custom-checkbox">
                                <input id="terms" type="checkbox" class="custom-control-input" checked required="">
                                <label for="terms" class="custom-control-label text-black-70">I agree to the <a href="#" class="text-black-70" style="text-decoration: underline;">Terms of Use</a></label>
                            </div>
                        </div>

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
                summary += isvalidname();
                //summary += isvalidmname();
                //summary += isvalidlname();
                //summary += isvaliduser();
                summary += isvalidemail();
                //summary += isvalidpassword();
                //summary += isvalidconfirmpass();
                //summary += isvalidenrollmentyear();
                //summary += isvalidStudyLevel();
                //summary += isvalidCourse();
                summary += isvalidterms();
                if (summary != "") {
                    alert(summary);
                    return false;
                }
                else {
                    return true;
                }
            })
        })
        function isvalidname() {
            if ($("#name").val() == "") {
                return ("Please enter name" + "\n");
            }
            else {
                return "";
            }
        }
         function isvalidmname() {
            if ($("#mname").val() == "") {
                return ("Please enter middle name" + "\n");
            }
            else {
                return "";
            }
        }

         function isvalidlname() {
            if ($("#lname").val() == "") {
                return ("Please enter last name" + "\n");
            }
            else {
                return "";
            }
        }
        function isvaliduser() {

            if ($("#username").val() == "") {
                return ("Please enter username" + "\n");
            }
            else {
                return "";
            }
        }
        function isvalidemail() {

            if ($("#email").val() == "") {
                return ("Please enter  e-mail address" + "\n");
            }
            else {

                var userinput = $("#email").val();
                var pattern =/^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;

                if (!pattern.test(userinput)) {
                    return ("Please enter a valid e-mail address" + "\n");
                }
                else {
                    return "";
                }
            }
        }
        function isvalidpassword() {

            if ($("#password").val() == "") {
                return ("Please enter password" + "\n");
            }
            else {
                return "";
            }
        }
        function isvalidconfirmpass() {

            if ($("#confirmpassword").val() == "") {
                return ("Please enter eonfirm password" + "\n");
            }
            else {
                if ($("#confirmpassword").val() == $("#password").val()) {
                    return "";
                }
                else { return ("Please enter same password" + "\n"); }
            }
        }
        function isvalidenrollmentyear() {
            if ($('input[name="enrollmentyear"]:checked').length > 0) {
                // if ($('#enrollmentyear :radio:checked').length > 0) {
                return "";
            }
            else {
                return ("Please select enrollment year" + "\n");

            }
        }
        function isvalidStudyLevel() {
            if ($('#rblstudyLevel :radio:checked').length > 0) {
                return "";
            }
            else {
                return ("Please select study level" + "\n");

            }

        }
        function isvalidCourse() {

            if ($('#lstCourse').val().length == 0) {
                return ("Please select course" + "\n");
            }
            else {
                return "";
            }
        }
        function isvalidterms() {

            if ($("#terms").prop('checked') == true) {
                return "";
            }
            else {
                return ("Please check terms & conditions " + "\n");
            }
        }


    //do something

    </script>



</body>

</html>
