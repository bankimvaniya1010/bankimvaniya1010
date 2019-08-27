<%@ Page Language="C#" AutoEventWireup="true" CodeFile="verifystudent.aspx.cs" Inherits="verifystudent" %>

<!DOCTYPE html>

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
<body>
    <form id="form1" runat="server">
        <div class="d-flex align-items-center" style="min-height: 100vh">
            <div class="col-sm-8 col-md-6 col-lg-4 mx-auto" style="min-width: 300px;">

                <div class="card navbar-shadow">
                    <div class="card-header text-center">
                        <h4 class="card-title">Activatation Page</h4>

                    </div>
                    <div class="card-body">
                        <div runat="server" id="afterVerfication">
                            Thank you for verifying details. Please <a href="<%=LoginURL %>">click here</a> to login
                        </div>
                        <div runat="server" id="verified">
                            Details already verified. Please <a href="login.aspx">click here</a> to login
                        </div>





                    </div>
                  
                </div>
            </div>
        </div>

    </form>
</body>
</html>

