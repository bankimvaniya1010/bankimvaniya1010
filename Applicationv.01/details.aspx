<%@ Page Language="C#" AutoEventWireup="true" CodeFile="details.aspx.cs" Inherits="details"%>


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

                <div class="card navbar-shadow" style="width:553px;margin-left:-52px">
                    <div class="card-header text-center logn-head positnrel">
                        <div class="frnd-hdr logo-img">
                            <img src="<%=logourl %>" class="logo-img img-fluid"/>
                        </div>
                        <h4 class="card-title">Information</h4>

                    </div>
                    <div class="card-body">
                        <div class="list-group-item" id="Div16" runat="server">
                                <div class="form-group m-0" role="group" aria-labelledby="label-title">
                                    <div class="form-row">
                                        <label runat="server" id="label16" for="title" class="col-md-4 col-form-label form-label">Class</label>
                                        <div class="col-md-7">                                            
                                           <asp:DropDownList runat="server" class="form-control" ID="ddlclass"></asp:DropDownList>
                                            <asp:HiddenField runat="server" ID="HidclassID"/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        <div class="list-group-item" id="Div1" runat="server">
                                <div class="form-group m-0" role="group" aria-labelledby="label-title">
                                    <div class="form-row">
                                        <label runat="server" id="label1" for="title" class="col-md-4 col-form-label form-label">Group</label>
                                        <div class="col-md-7">                                            
                                           <asp:DropDownList runat="server" class="form-control" ID="ddlgroup"></asp:DropDownList>
                                            <asp:HiddenField runat="server" ID="HiddenField1"/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        <div class="list-group-item" id="Div3" runat="server">
                            <div class="card-checkbox-list" id="studentddlDiv" runat="server">
                                <div class="form-group row">
                                    <label for="name" class="col-sm-12 col-form-label form-label">Select Subject</label>
                                </div>
                                <asp:CheckBoxList ID="ddlsubject" runat="server" RepeatDirection="Horizontal" RepeatColumns="2"></asp:CheckBoxList>
                            </div>
                        </div>
                        <div class="list-group-item" id="Div2" runat="server">
                                <div class="form-group m-0" role="group" aria-labelledby="label-title">
                                    <div class="form-row">
                                        <label runat="server" id="label2" for="title" class="col-md-4 col-form-label form-label">Institution Student ID:</label>
                                        <div class="col-md-7">                                            
                                          <input type="text" id="txtstudentid" runat="server" class="form-control">
                                        </div>
                                    </div>
                                </div>
                            </div>
                       <div class="list-group-item" id="employerwebsite" runat="server">
                                <div class="form-group m-0" role="group" aria-labelledby="label-employerwebsite">
                                    <div class="form-row justify-content-between">                                        
                                        <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-primary btn-block mb-3" OnClick="btnSave_Click" />
                                        <div class="col-md-6">
                                           
                                        </div>
                                    </div>
                                </div>
                            </div>
                     </div>
                        
                    </div>
                   <%-- <div class="card-footer text-center text-black-50">Already signed up? <a href="login.aspx">Login</a></div>--%>
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
            $('#btnSave').click(function () {
                var summary = "";
                summary += validclass();
                summary += validategroup();
                summary += validatesubject();
                if (summary != "") {
                    alert(summary);
                    return false;
                }
                else {
                    return true;
                }
            })
        })
        function validclass() {

            if ($("#ddlclass").val() == "0") {
                return ("Please select class" + "\n");
            }
            else {
                return "";
            }
        }
        function validategroup() {

            if ($("#ddlgroup").val() == "0") {
                return ("Please select group" + "\n");
            }
            else {
                return "";
            }
        }
        function validatesubject() {
            if ($("input[type=checkbox]:checked").length == 0)
                return ("Please select subjects"+"\n");
            else {
                return "";
            }
        }
        

    </script>

    <!-- Google Tag Manager (noscript) -->
    <noscript>
        <iframe src="https://www.googletagmanager.com/ns.html?id=<%=universityGTMCode%>" height="0" width="0" style="display: none; visibility: hidden"></iframe>
    </noscript>
    <!-- End Google Tag Manager (noscript) -->

</body>

</html>
