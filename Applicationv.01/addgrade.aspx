<%@ Page Language="C#" AutoEventWireup="true" CodeFile="addgrade.aspx.cs" Inherits="addgrade" %>

<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Student - Dashboard</title>

    <!-- Prevent the demo from appearing in search engines (REMOVE THIS) -->
    <meta name="robots" content="noindex">

    <!-- Perfect Scrollbar -->
    <link type="text/css" href="assets/vendor/perfect-scrollbar.css" rel="stylesheet">
    <!-- Flatpickr -->
    <link type="text/css" href="assets/css/flatpickr.css" rel="stylesheet">
    <link type="text/css" href="assets/css/flatpickr.rtl.css" rel="stylesheet">
    <link type="text/css" href="assets/css/flatpickr-airbnb.css" rel="stylesheet">
    <link type="text/css" href="assets/css/flatpickr-airbnb.rtl.css" rel="stylesheet">
    <!-- Material Design Icons -->
    <link type="text/css" href="assets/css/material-icons.css" rel="stylesheet">
    <link type="text/css" href="assets/css/material-icons.rtl.css" rel="stylesheet">

    <!-- Font Awesome Icons -->
    <link type="text/css" href="assets/css/fontawesome.css" rel="stylesheet">
    <link type="text/css" href="assets/css/fontawesome.rtl.css" rel="stylesheet">
    <script src="assets/vendor/jquery.min.js"></script>

    <!-- Flatpickr -->
    <script src="assets/vendor/flatpickr/flatpickr.min.js"></script>
    <script src="assets/js/flatpickr.js"></script>
    <!-- App CSS -->
    <link type="text/css" href="assets/css/app.css" rel="stylesheet">
    <link type="text/css" href="assets/css/app.rtl.css" rel="stylesheet">
</head>
<body>
    <form id="form1" runat="server">
        <div class="page ">
            <div class="container page__container p-0">
                <div class="row m-0">
                    <div class="col-lg container-fluid page__container">

                        <div class="card" style="width: 650px;">

                            <div class="list-group list-group-fit">
                                <div class="list-group-item">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-email">
                                        <div class="form-row">
                                            <label id="label-email" for="email" class="col-md-3 col-form-label form-label">Qualification</label>
                                            <div class="col-md-6">
                                                <asp:DropDownList ID="ddlCourse" CssClass="form-control" runat="server">
                                                    <asp:ListItem Value="" Text="Select Course"></asp:ListItem>
                                                    <asp:ListItem Value="tenth" Text="10Th"></asp:ListItem>
                                                    <asp:ListItem Value="twelth" Text="12th"></asp:ListItem>
                                                    <asp:ListItem Value="UG" Text="Under Graduate"></asp:ListItem>
                                                    <asp:ListItem Value="PG" Text="Post Graduate"></asp:ListItem>
                                                    <asp:ListItem Value="Phd" Text="Phd"></asp:ListItem>
                                                    <asp:ListItem Value="diploma" Text="Diploma"></asp:ListItem>
                                                    <asp:ListItem Value="Other" Text="Other"></asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-Mobile">
                                        <div class="form-row">
                                            <label id="label-Mobile" for="Mobile" class="col-md-3 col-form-label form-label">Subject</label>
                                            <div class="col-md-6">
                                                <asp:DropDownList ID="ddlsubjects" CssClass="form-control" runat="server"></asp:DropDownList>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item" id="other" style="display: none;">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-Others">
                                        <div class="form-row">
                                            <label id="label-others" for="Mobile" class="col-md-3 col-form-label form-label">Other Subject</label>
                                            <div class="col-md-6">
                                                <input id="txtOther" runat="server" type="text" placeholder="Subject" value="" class="form-control" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-phone">
                                        <div class="form-row">
                                            <label id="label-phone" for="phone" class="col-md-3 col-form-label form-label">Grade Type</label>
                                            <div class="col-md-6">
                                                <asp:DropDownList ID="ddlGradeType" CssClass="form-control" runat="server"></asp:DropDownList>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-skype">
                                        <div class="form-row">
                                            <label id="label-skype" for="skype" class="col-md-3 col-form-label form-label">Grade</label>
                                            <div class="col-md-6">
                                                <input id="txtGrade" runat="server" type="text" placeholder="Grade" value="" class="form-control" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="page-nav__content" style="margin: 20px">
                                    <asp:Button ID="btn_login" runat="server" Text="Save Changes" CssClass="btn btn-success" OnClick="btn_login_Click" />

                                </div>

                            </div>


                        </div>
                    </div>


                </div>
            </div>


            <div class="container page__container">
                <div class="footer">
                </div>

            </div>
        </div>
    </form>
    <script src="assets/vendor/jquery.min.js"></script>
    <script type="text/javascript">
        function RefreshParent() {
            if (window.opener != null && !window.opener.closed) {
                window.opener.location.reload();
            }
        }
        window.onbeforeunload = RefreshParent;
        $(document).ready(function () {
            $('#<%=ddlsubjects.ClientID%>').change(function () {
               
                if ($('#<%=ddlsubjects.ClientID%> option:selected').text() == 'Others') {
                    $('#other').css({ 'display': 'block' });
                }
                else {
                    $('#other').css({ 'display': 'none' });
                }

            });
        });
    </script>
</body>
</html>
