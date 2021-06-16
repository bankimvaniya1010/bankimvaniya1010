﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="register.aspx.cs" Inherits="register" %>

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

    <!-- Google Tag Manager -->
    <script>
        (function (w, d, s, l, i) {
            w[l] = w[l] || [];
            w[l].push({ 'gtm.start': new Date().getTime(), event: 'gtm.js' });
            var f = d.getElementsByTagName(s)[0], j = d.createElement(s), dl = l != 'dataLayer' ? '&l=' + l : '';
            j.async = true;
            j.src = 'https://www.googletagmanager.com/gtm.js?id=' + i + dl;
            f.parentNode.insertBefore(j, f);
        })(window, document, 'script', 'dataLayer', '<%=universityGTMCode%>');
    </script>
    <!-- End Google Tag Manager -->

</head>

<body class="login">
    <form runat="server" id="form1">
        <div class="d-flex align-items-center" style="min-height: 100vh">
            <div class="col-sm-8 col-md-6 col-lg-4 mx-auto" style="min-width: 300px;">

                <div class="card navbar-shadow">
                    <div class="card-header text-center" style="position: relative;">
                        <div class="frnd-hdr logo-img">
                            <img src="<%=logourl %>" class="logo-img img-fluid" />
                        </div>
                        <h4 class="card-title">Student Sign Up</h4>
                        <p class="card-subtitle" style="color: black">Create your account</p>
                    </div>
                    <div class="card-body">

                        <div class="form-group" runat="server" visible="false" id="lblerror">
                            <label class="form-label badge-danger" for="course">User is already registered with entered email address</label>

                        </div>

                        <div class="">
                            <label class="form-label" for="name">Name:</label>
                            <div class="input-group input-group-merge">
                                <input id="name" type="text" runat="server" class="form-control form-control-prepended" placeholder="Enter your full name">
                                <div class="input-group-prepend">
                                    <div class="input-group-text">
                                        <span class="far fa-user"></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="form-label" for="email">Email address:</label>
                            <div class="input-group input-group-merge">
                                <input id="email" type="text" runat="server" class="form-control form-control-prepended" placeholder="Your personal email address">
                                <div class="input-group-prepend">
                                    <div class="input-group-text">
                                        <span class="far fa-envelope"></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <asp:Button ID="buttonlogin" runat="server" Text="Sign Up" CssClass="btn btn-primary btn-block mb-3" OnClick="btnSignUp_Click" target="_blank" />

                        <div class="form-group text-center" style="margin-bottom: -36px;">

                            <div class="custom-control custom-checkbox">
<asp:CheckBox runat="server" ID="chk1" /><label class="label text-black-70" id="lblterms" runat="server"><a href="assets/Privacy Policy_Final_v20210430.pdf" target="_blank">Terms of Use</a></label>
                                <br />
                                <asp:CheckBox runat="server" ID="chk2" /><label class="label text-black-70" id="gtehandbook" runat="server">I have read the <a href="https://www.gtedirect.com/student-handbook" target="_blank">Student Handbook</a><%--<Label class="text-black-70" style="text-decoration: underline;" id="lblterms">Terms of Use</Label>--%></label>
                            </div>
                            <br>
                            <%--<div style="font-size: small;">
                                <label> * Please use your personal email address rather than your work or school email address because this is the email address we will use to communicate with you. So, your email address needs to be one that you will always have access to even when you leave your current employer or school.</label>
                            </div>--%>
                        </div>

                    </div>
                    <div class="card-footer text-center text-black-50" style="color: black">Already signed up? <a href="login.aspx" target="_blank">Login</a></div>
                </div>
            </div>
        </div>
        <div style="display: none;" runat="server">
            <div class="modal" id="IELTS-modal" tabindex="-1" role="dialog">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="faq-modal-header modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        </div>
                        <div class="modal-body">
                            <div class="">
                                <span>NOT SET </span>
                            </div>
                        </div>
                    </div>
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

    <!-- Google Tag Manager (noscript) -->
    <noscript>
        <iframe src="https://www.googletagmanager.com/ns.html?id=<%=universityGTMCode%>" height="0" width="0" style="display: none; visibility: hidden"></iframe>
    </noscript>
    <!-- End Google Tag Manager (noscript) -->

    <script language="javascript" type="text/javascript">
        $(document).ready(function () {
            //$('#lblterms').click(function () {
            //    var IELTSModal = $('#IELTS-modal');
            //    $('body').append(IELTSModal);
            //    $('#IELTS-modal').modal('show');


            //});
        });

        //$('#lblterms').click(function () {
        //    var IELTSModal = $('#IELTS-modal');
        //    $('body').append(IELTSModal);
        //    $('#IELTS-modal').modal('show');
        //});

        $(function () {
            $('#buttonlogin').click(function () {
                var summary = "";
                summary += isvalidname();
                summary += isvalidemail();
                summary += isvalidterms();
                if (<%=fullservice%> == "0")
                    summary += isvalidtermsgte();   
                

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
        function isvalidemail() {

            if ($("#email").val() == "") {
                return ("Please enter  e-mail address" + "\n");
            }
            else {

                var userinput = $("#email").val();
                var pattern = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;

                if (!pattern.test(userinput)) {
                    return ("Please enter a valid e-mail address" + "\n");
                }
                else {
                    return "";
                }
            }
        }
        function isvalidterms() {

            if ($("#chk1").prop('checked') == true) {
                return "";
            }
            else {
                return ("Please confirm that you agree to the Terms of Use" + "\n");               
            }

        }

        function isvalidtermsgte() {
            if ($("#chk2").prop('checked') == true) {
                        return "";
                    }
                    else {
                        return ("Please confirm that you agree to the Terms of Use and have read the Student Handbook " + "\n");
                    } 
               
        }

        var uniheadercolor = '<%=Session["headercolor"]%>';
        // setter header color
        document.documentElement.style.setProperty('--header-color', uniheadercolor);
        // getter
        document.documentElement.style.getPropertyValue('--header-color');

    </script>

</body>

</html>
