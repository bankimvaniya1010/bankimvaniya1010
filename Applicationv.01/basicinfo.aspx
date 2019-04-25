<%@ Page Language="C#" AutoEventWireup="true" CodeFile="basicinfo.aspx.cs" Inherits="basicinfo" %>

<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Student - Upload Video</title>

    <!-- Prevent the demo from appearing in search engines (REMOVE THIS) -->
    <meta name="robots" content="noindex">

    <!-- Perfect Scrollbar -->
    <link type="text/css" href="assets/vendor/perfect-scrollbar.css" rel="stylesheet">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <!-- Material Design Icons -->
    <link type="text/css" href="assets/css/material-icons.css" rel="stylesheet">
    <link type="text/css" href="assets/css/material-icons.rtl.css" rel="stylesheet">

    <!-- Font Awesome Icons -->
    <link type="text/css" href="assets/css/fontawesome.css" rel="stylesheet">
    <link type="text/css" href="assets/css/fontawesome.rtl.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <!-- App CSS -->
    <link type="text/css" href="assets/css/app.css" rel="stylesheet">
    <link type="text/css" href="assets/css/app.rtl.css" rel="stylesheet">
    <script>
        $(function () {
            $('#dob').datepicker({
                dateFormat: 'yy-mm-dd'  // CHANGE DATE FORMAT.
            });
            $("#durationfrom").datepicker({
                dateFormat: 'yy-mm-dd'  // CHANGE DATE FORMAT.
            });
            $("#durationto").datepicker({
                dateFormat: 'yy-mm-dd'  // CHANGE DATE FORMAT.
            });
            $("#ProfiencyTestDate").datepicker({
                dateFormat: 'yy-mm-dd'  // CHANGE DATE FORMAT.
            });
            $("#txtEnglishTest").datepicker({
                dateFormat: 'yy-mm-dd'  // CHANGE DATE FORMAT.
            });
            $("#txtGapEnd").datepicker({
                dateFormat: 'yy-mm-dd'  // CHANGE DATE FORMAT.
            });
            $("#txtGapFrom").datepicker({
                dateFormat: 'yy-mm-dd'  // CHANGE DATE FORMAT.
            });
            $("#txtEmploymentStart").datepicker({
                dateFormat: 'yy-mm-dd'  // CHANGE DATE FORMAT.
            });
            $("#txtEmploymentEnd").datepicker({
                dateFormat: 'yy-mm-dd'  // CHANGE DATE FORMAT.
            });
            $("#txtSponsersFrom").datepicker({
                dateFormat: 'yy-mm-dd'  // CHANGE DATE FORMAT.
            });
            $("#txtSponsersTo").datepicker({
                dateFormat: 'yy-mm-dd'  // CHANGE DATE FORMAT.
            });
            $("#txtAccountOpeningDate").datepicker({
                dateFormat: 'yy-mm-dd'  // CHANGE DATE FORMAT.
            });
        });
    </script>
</head>

<body class=" fixed-layout">

    <div class="preloader">
        <div class="sk-double-bounce">
            <div class="sk-child sk-double-bounce1"></div>
            <div class="sk-child sk-double-bounce2"></div>
        </div>
    </div>

    <!-- Header Layout -->
    <div class="mdk-header-layout js-mdk-header-layout">

        <!-- Header -->

        <div id="header" class="mdk-header bg-dark js-mdk-header m-0" data-fixed data-effects="waterfall">
            <div class="mdk-header__content">

                <!-- Navbar -->
                <nav id="default-navbar" class="navbar navbar-expand navbar-dark bg-primary m-0">
                    <div class="container">
                        <!-- Toggle sidebar -->
                        <button class="navbar-toggler d-block" data-toggle="sidebar" type="button">
                            <span class="material-icons">menu</span>
                        </button>

                        <!-- Brand -->
                        <a href="fixed-student-dashboard.html" class="navbar-brand">

                            <span class="d-none d-xs-md-block">GTE</span>
                        </a>


                        <ul class="nav navbar-nav flex-nowrap">








                            <!-- User dropdown -->
                            <li class="nav-item dropdown ml-1 ml-md-3">
                                <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button">
                                    <img src="assets/images/people/50/guy-6.jpg" alt="Avatar" class="rounded-circle" width="40"></a>
                                <div class="dropdown-menu dropdown-menu-right">
                                    <a class="dropdown-item" href="fixed-student-account-edit.html">
                                        <i class="material-icons">edit</i> Edit Account
                                    </a>
                                    <a class="dropdown-item" href="fixed-student-profile.html">
                                        <i class="material-icons">person</i> Public Profile
                                    </a>
                                    <a class="dropdown-item" href="login.aspx">
                                        <i class="material-icons">lock</i> Logout
                                    </a>
                                </div>
                            </li>
                            <!-- // END User dropdown -->

                        </ul>
                        <!-- // END Menu -->
                    </div>
                </nav>
                <!-- // END Navbar -->

            </div>
        </div>

        <!-- // END Header -->

        <!-- Header Layout Content -->
        <div class="mdk-header-layout__content d-flex flex-column">

            <div class="page__header">
                <div class="navbar bg-dark navbar-dark navbar-expand-sm d-none2 d-md-flex2">
                    <div class="container">

                        <div class="navbar-collapse collapse" id="navbarsExample03">
                            <ul class="nav navbar-nav">
                                <li class="nav-item dropdown">
                                    <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">Student</a>
                                    <div class="dropdown-menu">
                                        <a class="dropdown-item active" href="Default.aspx">Dashboard</a>

                                        <a class="dropdown-item" href="fixed-student-view-course.html">View Course</a>
                                        <a class="dropdown-item" href="questions.aspx">Answer Qeustions</a>
                                        <a class="dropdown-item" href="uploadvideo.aspx">Upload Video Interview</a>
                                        <a class="dropdown-item" href="uploaddocuments.aspx">Upload Documents</a>
                                    </div>
                                </li>

                                <li class="nav-item dropdown active">
                                    <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">Account</a>
                                    <div class="dropdown-menu">
                                        <a class="dropdown-item active" href="fixed-student-account-edit.html">Edit Account</a>
                                        <a class="dropdown-item" href="basicinfo.aspx">Basic Information</a>
                                        <a class="dropdown-item" href="fixed-student-account-edit-profile.html">Profile &amp; Privacy</a>
                                        <a class="dropdown-item" href="fixed-student-account-billing-subscription.html">Subscription</a>
                                        <a class="dropdown-item" href="fixed-student-account-billing-upgrade.html">Upgrade Account</a>
                                        <a class="dropdown-item" href="fixed-student-account-billing-payment-information.html">Payment Information</a>
                                        <a class="dropdown-item" href="fixed-student-billing.html">Payment History</a>
                                        <a class="dropdown-item" href="fixed-student-invoice.html">Student Invoice</a>
                                        <a class="dropdown-item" href="fixed-instructor-invoice.html">Instructor Invoice</a>
                                        <a class="dropdown-item" href="fixed-instructor-edit-invoice.html">Edit Invoice</a>
                                        <a class="dropdown-item" href="fixed-student-messages.html">Messages</a>
                                        <div class="dropdown-divider"></div>
                                        <a class="dropdown-item" href="login.aspx">Login</a>
                                        <a class="dropdown-item" href="guest-signup.html">Signup</a>
                                        <a class="dropdown-item" href="forgetpassword.aspx">Forgot Password</a>
                                    </div>
                                </li>
                                <li class="nav-item dropdown">
                                    <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">Instructions</a>
                                    <div class="dropdown-menu">
                                        <a class="dropdown-item" href="fixed-student-forum.html">Forum</a>
                                        <a class="dropdown-item" href="fixed-student-forum-thread.html">Discussion</a>
                                        <a class="dropdown-item" href="fixed-student-forum-ask.html">Ask Question</a>
                                        <div class="dropdown-divider"></div>
                                        <a class="dropdown-item" href="fixed-student-profile.html">Student Profile - Courses</a>
                                        <a class="dropdown-item" href="fixed-student-profile-posts.html">Student Profile - Posts</a>
                                        <a class="dropdown-item" href="fixed-instructor-profile.html">Instructor Profile</a>
                                        <div class="dropdown-divider"></div>
                                        <a class="dropdown-item" href="fixed-student-help-center.html">Help Center</a>
                                    </div>
                                </li>



                            </ul>
                        </div>

                        <button class="navbar-toggler" data-toggle="collapse" data-target="#navbarsExample03" type="button">
                            <span class="material-icons">menu</span>
                        </button>

                    </div>
                </div>
            </div>

            <div class="page ">
                <form runat="server">
                    <div class="container page__container">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="fixed-student-dashboard.html">Home</a></li>
                            <li class="breadcrumb-item active">Basic Info</li>
                        </ol>
                        <h1 class="h2">Basic Info</h1>
                        <div class="card">
                            <ul class="nav nav-tabs nav-tabs-card">
                                <li class="nav-item">
                                    <a class="nav-link active" href="#first" data-toggle="tab">Basic Info</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#second" data-toggle="tab">Education Detail</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#third" data-toggle="tab">Lanuague Test Detail</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#four" data-toggle="tab">Back Log</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#five" data-toggle="tab">Employment Details</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#six" data-toggle="tab">Sponsor Details</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#seven" data-toggle="tab">Financial Details</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#eight" data-toggle="tab">Self Assesment</a>
                                </li>
                            </ul>
                            <div class="tab-content card-body">
                                <div class="tab-pane active" id="first">

                                    <div class="form-group row">
                                        <label for="name" class="col-sm-3 col-form-label form-label">Name</label>
                                        <div class="col-sm-8">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <input id="txtName" type="text" runat="server" class="form-control" placeholder="Name" value="">
                                                </div>

                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <label for="dob" class="col-sm-3 col-form-label form-label">Date Of Birth</label>
                                        <div class="col-sm-8">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <input id="dob" type="text" runat="server" class="form-control" placeholder="dob" value="">
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="Passport" class="col-sm-3 col-form-label form-label">Passport No</label>
                                        <div class="col-sm-8">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <input id="txtPaasportno" type="text" runat="server" class="form-control" placeholder="Passport No" value="">
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="Passport" class="col-sm-3 col-form-label form-label">Pan No</label>
                                        <div class="col-sm-8">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <input id="txtPanNo" type="text" runat="server" class="form-control" placeholder="Pan No" value="">
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="Passport" class="col-sm-3 col-form-label form-label">Adhar No</label>
                                        <div class="col-sm-8">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <input id="txtAdhar" type="text" runat="server" class="form-control" placeholder="Adhar No" value="">
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="Passport" class="col-sm-3 col-form-label form-label">Voter Card No</label>
                                        <div class="col-sm-8">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <input id="txtVoter" type="text" runat="server" class="form-control" placeholder="Voter No" value="">
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="Passport" class="col-sm-3 col-form-label form-label">Gender</label>
                                        <div class="col-sm-8">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <asp:RadioButton ID="rbtnMale" runat="server" GroupName="gender" Text="Male" />
                                                    <asp:RadioButton ID="rbtnFemale" runat="server" GroupName="gender" Text="Female" />
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="Passport" class="col-sm-3 col-form-label form-label">Mobile</label>
                                        <div class="col-sm-8">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <input id="txtMobile" type="text" runat="server" class="form-control" placeholder="Mobile" value="">
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="Passport" class="col-sm-3 col-form-label form-label">Email</label>
                                        <div class="col-sm-8">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <input id="txtEmail" type="text" runat="server" class="form-control" placeholder="Email" value="">
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="Passport" class="col-sm-3 col-form-label form-label">University</label>
                                        <div class="col-sm-8">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <input id="txtUniversity" type="text" runat="server" class="form-control" placeholder="University" value="">
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="Passport" class="col-sm-3 col-form-label form-label">Course Applied For</label>
                                        <div class="col-sm-8">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <input id="txtCourse" type="text" runat="server" class="form-control" placeholder="Course" value="">
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="Passport" class="col-sm-3 col-form-label form-label">Intake For Which Applied</label>
                                        <div class="col-sm-8">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <input id="txtIntake" type="text" runat="server" class="form-control" placeholder="Intake For Which Applied" value="">
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-sm-8 offset-sm-3">
                                            <div class="media align-items-center">
                                                <div class="media-left">
                                                    <asp:Button ID="btn_login" runat="server" Text="Save Info" CssClass="btnbtn-successk" OnClick="btn_login_Click" />

                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </div>

                                <div class="tab-pane" id="second">

                                    <div class="form-group row">
                                        <label for="name" class="col-sm-3 col-form-label form-label">Course Name</label>
                                        <div class="col-sm-8">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <asp:DropDownList ID="ddlCourse" runat="server" CssClass="form-control" AutoPostBack="false" OnSelectedIndexChanged="ddlCourse_SelectedIndexChanged">
                                                        <asp:ListItem Text="10Th" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="12Th" Value="2"></asp:ListItem>
                                                        <asp:ListItem Text="Diploma" Value="3"></asp:ListItem>
                                                        <asp:ListItem Text="UG" Value="4"></asp:ListItem>
                                                        <asp:ListItem Text="PG" Value="5"></asp:ListItem>
                                                        <asp:ListItem Text="Others" Value="6"></asp:ListItem>
                                                    </asp:DropDownList>
                                                    <asp:TextBox ID="txtOtherCourse" runat="server" CssClass="form-control" Visible="false"></asp:TextBox>

                                                </div>

                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <label for="dob" class="col-sm-3 col-form-label form-label">Board/University</label>
                                        <div class="col-sm-8">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <input id="txtBoardUniversity" type="text" runat="server" class="form-control" placeholder="Board/University" value="">
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="Passport" class="col-sm-3 col-form-label form-label">Institute</label>
                                        <div class="col-sm-8">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <input id="txtInstitute" type="Text" runat="server" class="form-control" placeholder="Institute" value="">
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="Passport" class="col-sm-3 col-form-label form-label">Percentage</label>
                                        <div class="col-sm-8">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <input id="txtPercentage" type="text" runat="server" class="form-control" placeholder="Percentage" value="">
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="Passport" class="col-sm-3 col-form-label form-label">Duration From</label>
                                        <div class="col-sm-8">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <input id="durationfrom" type="text" runat="server" class="form-control" placeholder="Duration From" value="">
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="Passport" class="col-sm-3 col-form-label form-label">Durationto</label>
                                        <div class="col-sm-8">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <input id="durationto" type="text" runat="server" class="form-control" placeholder="Durationto" value="">
                                                </div>

                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <label for="Passport" class="col-sm-3 col-form-label form-label">Reapats/Backlog</label>
                                        <div class="col-sm-8">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <input id="txtRepeats" type="text" runat="server" class="form-control" placeholder="Reapats/Backlog" value="">
                                                </div>

                                            </div>
                                        </div>
                                    </div>


                                    <div class="form-group row">
                                        <div class="col-sm-8 offset-sm-3">
                                            <div class="media align-items-center">
                                                <div class="media-left">
                                                    <asp:Button ID="btnEducation" runat="server" Text="Save" CssClass="btnbtn-successk" OnClick="btnEducation_Click" />

                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group row">

                                        <div class="col-sm-8">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <asp:GridView ID="grdEducation" runat="server" CssClass="table" AutoGenerateColumns="false" OnRowDataBound="grdEducation_RowDataBound">
                                                        <Columns>
                                                            <asp:TemplateField ItemStyle-Width="30px" HeaderText="Course Name">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblCourse" runat="server"
                                                                        Text='<%#Eval("courseId")%>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Board/Univercities">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblBoard" runat="server" Text='<%#Eval("board_universityname")%>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Institute">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblInstitute" runat="server" Text='<%#Eval("Institute")%>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Percentage">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblpercentage" runat="server" Text='<%#Eval("percentage")%>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Start Date">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblStart" runat="server" Text='<%#Eval("course_startdate", "{0:dd/MM/yyyy}") %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="End Date">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblEnd" runat="server" Text='<%#Eval("course_enddate", "{0:dd/MM/yyyy}") %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Repeats/Backlog">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblBacklog" runat="server" Text='<%#Eval("repeats_backlog")%>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Other Course Name">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblOther" runat="server" Text='<%#Eval("othercourse_name")%>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                        </Columns>
                                                    </asp:GridView>

                                                </div>

                                            </div>
                                        </div>
                                    </div>


                                </div>
                                <div class="tab-pane" id="third">

                                    <div class="form-group row">
                                        <label for="name" class="col-sm-3 col-form-label form-label">Has the Student Taken English Proeficiency Test?</label>
                                        <div class="col-sm-8">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <asp:RadioButton ID="rdoYes" runat="server" GroupName="English" Text="Yes" />
                                                    <asp:RadioButton ID="rdoNo" runat="server" GroupName="English" Text="No" />
                                                </div>

                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <label for="dob" class="col-sm-3 col-form-label form-label">Date of Exam booked</label>
                                        <div class="col-sm-8">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <input id="txtEnglishTest" type="text" runat="server" class="form-control" placeholder="Date of Exam booked" value="">
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="Passport" class="col-sm-3 col-form-label form-label">Test Name</label>
                                        <div class="col-sm-8">
                                            <div class="row">
                                                <div class="col-md-12">

                                                    <asp:DropDownList ID="ddlEnglish" CssClass="form-control" runat="server">
                                                        <asp:ListItem Value="1" Text="IELTS"></asp:ListItem>
                                                        <asp:ListItem Value="2" Text="PTE"></asp:ListItem>
                                                        <asp:ListItem Value="3" Text="TOFEL"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="Passport" class="col-sm-3 col-form-label form-label">Overall score</label>
                                        <div class="col-sm-8">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <input id="txtOverAll" type="text" runat="server" class="form-control" placeholder="Overall score" value="">
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="Passport" class="col-sm-3 col-form-label form-label">Speaking</label>
                                        <div class="col-sm-8">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <input id="txtSpeaking" type="text" runat="server" class="form-control" placeholder="Speaking" value="">
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="Passport" class="col-sm-3 col-form-label form-label">Listening</label>
                                        <div class="col-sm-8">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <input id="txtListening" type="text" runat="server" class="form-control" placeholder="Listening" value="">
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="Passport" class="col-sm-3 col-form-label form-label">Reading</label>
                                        <div class="col-sm-8">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <input id="txtReading" type="text" runat="server" class="form-control" placeholder="Reading" value="">
                                                </div>

                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <label for="Passport" class="col-sm-3 col-form-label form-label">Writing</label>
                                        <div class="col-sm-8">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <input id="txtWriting" type="text" runat="server" class="form-control" placeholder="Writing" value="">
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="Passport" class="col-sm-3 col-form-label form-label">Test Date</label>
                                        <div class="col-sm-8">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <input id="ProfiencyTestDate" type="text" runat="server" class="form-control" placeholder="Test Date" value="">
                                                </div>

                                            </div>
                                        </div>
                                    </div>


                                    <div class="form-group row">
                                        <div class="col-sm-8 offset-sm-3">
                                            <div class="media align-items-center">
                                                <div class="media-left">
                                                    <asp:Button ID="btnProeficiency" runat="server" Text="Add English Test" CssClass="btnbtn-successk" OnClick="btnProeficiency_Click" />

                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group row">

                                        <div class="col-sm-8">
                                            <div class="row">
                                                <div class="col-md-12">

                                                    <div class="col-md-12">
                                                        <asp:GridView ID="grdEnglish" runat="server" CssClass="table" AutoGenerateColumns="false" OnRowDataBound="grdEnglish_RowDataBound">
                                                            <Columns>
                                                                <asp:TemplateField ItemStyle-Width="30px" HeaderText="Test Name">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblName" runat="server"
                                                                            Text='<%#Eval("testId")%>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Overallscore">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lbloverallscore" runat="server" Text='<%#Eval("overallscore")%>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Speaking">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblSpeaking" runat="server" Text='<%#Eval("Speaking")%>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Reading">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblreading" runat="server" Text='<%#Eval("reading")%>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Listening">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lbllistening" runat="server" Text='<%#Eval("listening")%>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Writing">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblwriting" runat="server" Text='<%#Eval("writing")%>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Test Date">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblStart" runat="server" Text='<%#Eval("examDate", "{0:dd/MM/yyyy}") %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                            </Columns>
                                                        </asp:GridView>

                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                    </div>


                                </div>
                                <div class="tab-pane" id="four">

                                    <div class="form-group row">
                                        <label for="name" class="col-sm-3 col-form-label form-label">Gap Start From</label>
                                        <div class="col-sm-8">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <input id="txtGapFrom" type="text" runat="server" class="form-control" placeholder="Gap Start From" value="">
                                                </div>

                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <label for="dob" class="col-sm-3 col-form-label form-label">Gap End To</label>
                                        <div class="col-sm-8">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <input id="txtGapEnd" type="text" runat="server" class="form-control" placeholder="Gap End To" value="">
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="Passport" class="col-sm-3 col-form-label form-label">Explanation</label>
                                        <div class="col-sm-8">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <input id="txtExplanation" type="text" runat="server" class="form-control" placeholder="Explanation" value="">
                                                </div>

                                            </div>
                                        </div>
                                    </div>


                                    <div class="form-group row">
                                        <div class="col-sm-8 offset-sm-3">
                                            <div class="media align-items-center">
                                                <div class="media-left">
                                                    <asp:Button ID="btnGapDetails" runat="server" Text="Save Gap Details" CssClass="btnbtn-successk" OnClick="btnGapDetails_Click" />

                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group row">

                                        <div class="col-sm-8">
                                            <div class="row">
                                                <div class="col-md-12">
                                                   
                                                    <asp:GridView ID="grdGaps" runat="server" CssClass="table" AutoGenerateColumns="false" >
                                                            <Columns>
                                                                <asp:TemplateField ItemStyle-Width="30px" HeaderText="Explanation">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblName" runat="server"
                                                                            Text='<%#Eval("explanation")%>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                               
                                                                <asp:TemplateField HeaderText="Gap From">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblStart" runat="server" Text='<%#Eval("gap_from", "{0:dd/MM/yyyy}") %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                  <asp:TemplateField HeaderText="Gap To">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblStart" runat="server" Text='<%#Eval("gap_To", "{0:dd/MM/yyyy}") %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                            </Columns>
                                                        </asp:GridView>
                                                </div>

                                            </div>
                                        </div>
                                    </div>


                                </div>
                                <div class="tab-pane" id="five">

                                    <div class="form-group row">
                                        <label for="name" class="col-sm-3 col-form-label form-label">Designation</label>
                                        <div class="col-sm-8">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <input id="txtDesignation" type="text" runat="server" class="form-control" placeholder="Designation" value="">
                                                </div>

                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <label for="dob" class="col-sm-3 col-form-label form-label">Organisation</label>
                                        <div class="col-sm-8">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <input id="txtOrganisation" type="text" runat="server" class="form-control" placeholder="Organisation" value="">
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="Passport" class="col-sm-3 col-form-label form-label">Contant Person</label>
                                        <div class="col-sm-8">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <input id="txtContactPerson" type="text" runat="server" class="form-control" placeholder="Contant Person" value="">
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="Passport" class="col-sm-3 col-form-label form-label">Salary</label>
                                        <div class="col-sm-8">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <input id="txtSalary" type="text" runat="server" class="form-control" placeholder="Salary" value="">
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="Passport" class="col-sm-3 col-form-label form-label">Duration From</label>
                                        <div class="col-sm-8">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <input id="txtEmploymentStart" type="text" runat="server" class="form-control" placeholder="Duration From" value="">
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="Passport" class="col-sm-3 col-form-label form-label">Duration To</label>
                                        <div class="col-sm-8">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <input id="txtEmploymentEnd" type="text" runat="server" class="form-control" placeholder="Duration To" value="">
                                                </div>

                                            </div>
                                        </div>
                                    </div>


                                    <div class="form-group row">
                                        <div class="col-sm-8 offset-sm-3">
                                            <div class="media align-items-center">
                                                <div class="media-left">
                                                    <asp:Button ID="btnEmployment" runat="server" Text="Add Employment Details" CssClass="btnbtn-successk" OnClick="btnEmployment_Click" />

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group row">

                                        <div class="col-sm-8">
                                            <div class="row">
                                                <div class="col-md-12">
                                                  
                                                     <asp:GridView ID="grdEmployment" runat="server" CssClass="table" AutoGenerateColumns="false" >
                                                            <Columns>
                                                                <asp:TemplateField ItemStyle-Width="30px" HeaderText="Designation">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lbldesignation" runat="server"
                                                                            Text='<%#Eval("designation")%>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField ItemStyle-Width="30px" HeaderText="Organization">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblorganization" runat="server"
                                                                            Text='<%#Eval("organization")%>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                 <asp:TemplateField ItemStyle-Width="30px" HeaderText="Contact Person">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblcontactpersonwithdetails" runat="server"
                                                                            Text='<%#Eval("contactpersonwithdetails")%>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField ItemStyle-Width="30px" HeaderText="Salary">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblSalary" runat="server"
                                                                            Text='<%#Eval("salary")%>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="From">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblStart" runat="server" Text='<%#Eval("durationfrom", "{0:dd/MM/yyyy}") %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                  <asp:TemplateField HeaderText="To">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lbldurationto" runat="server" Text='<%#Eval("durationto", "{0:dd/MM/yyyy}") %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                            </Columns>
                                                        </asp:GridView>
                                                </div>

                                            </div>
                                        </div>
                                    </div>


                                </div>
                                <div class="tab-pane" id="six">

                                    <div class="form-group row">
                                        <label for="name" class="col-sm-3 col-form-label form-label">Name of Sponsor</label>
                                        <div class="col-sm-8">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <input id="txtSponsor" type="text" runat="server" class="form-control" placeholder="Name of Sponsor" value="">
                                                </div>

                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <label for="dob" class="col-sm-3 col-form-label form-label">Relationship</label>
                                        <div class="col-sm-8">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <input id="txtRelationship" type="text" runat="server" class="form-control" placeholder="Relationship" value="">
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="Passport" class="col-sm-3 col-form-label form-label">Designation</label>
                                        <div class="col-sm-8">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <input id="txtSponsarDesignation" type="text" runat="server" class="form-control" placeholder="Designation" value="">
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="Passport" class="col-sm-3 col-form-label form-label">Employers details</label>
                                        <div class="col-sm-8">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <input id="txtEmployers" type="text" runat="server" class="form-control" placeholder="Employers details" value="">
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="Passport" class="col-sm-3 col-form-label form-label">Annual Income</label>
                                        <div class="col-sm-8">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <input id="txtAnnual" type="text" runat="server" class="form-control" placeholder="Annual Income" value="">
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="Passport" class="col-sm-3 col-form-label form-label">Last 3 Years ITR’s available</label>
                                        <div class="col-sm-8">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <asp:RadioButton ID="rdITRYes" runat="server" GroupName="ITR" Text="Yes" />
                                                    <asp:RadioButton ID="rdITRNo" runat="server" GroupName="ITR" Text="No" />
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="Passport" class="col-sm-3 col-form-label form-label">Duration From</label>
                                        <div class="col-sm-8">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <input id="txtSponsersFrom" type="text" runat="server" class="form-control" placeholder="Duration From" value="">
                                                </div>

                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <label for="Passport" class="col-sm-3 col-form-label form-label">Duration To</label>
                                        <div class="col-sm-8">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <input id="txtSponsersTo" type="text" runat="server" class="form-control" placeholder="Duration From" value="">
                                                </div>

                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <div class="col-sm-8 offset-sm-3">
                                            <div class="media align-items-center">
                                                <div class="media-left">
                                                    <asp:Button ID="btnSponsors" runat="server" Text="Add Sponsers Details" OnClick="btnSponsers_Click" CssClass="btnbtn-successk" />

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group row">

                                        <div class="col-sm-8">
                                            <div class="row">
                                                <div class="col-md-12">
                                                  
                                                     <asp:GridView ID="grdSponsers" runat="server" CssClass="table" AutoGenerateColumns="false" >
                                                            <Columns>
                                                                <asp:TemplateField ItemStyle-Width="30px" HeaderText="Name">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblname" runat="server"
                                                                            Text='<%#Eval("name")%>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField ItemStyle-Width="30px" HeaderText="Employment Details">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblemployment_details" runat="server"
                                                                            Text='<%#Eval("employment_details")%>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                 <asp:TemplateField ItemStyle-Width="30px" HeaderText="Designation">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lbldesignation" runat="server"
                                                                            Text='<%#Eval("designation")%>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField ItemStyle-Width="30px" HeaderText="Relationship">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblrelationship" runat="server"
                                                                            Text='<%#Eval("relationship")%>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField ItemStyle-Width="30px" HeaderText="Annual Income">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblannualincome" runat="server"
                                                                            Text='<%#Eval("annualincome")%>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                 <asp:TemplateField ItemStyle-Width="30px" HeaderText="FiledITR">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblisfiledItr" runat="server"
                                                                            Text='<%#Eval("isfiledItr").ToString() == "0" ? "NO" : "YES"%>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="From">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblStart" runat="server" Text='<%#Eval("durationfrom", "{0:dd/MM/yyyy}") %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                  <asp:TemplateField HeaderText="To">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lbldurationto" runat="server" Text='<%#Eval("durationto", "{0:dd/MM/yyyy}") %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                            </Columns>
                                                        </asp:GridView>
                                                </div>

                                            </div>
                                        </div>
                                    </div>

                                </div>
                                <div class="tab-pane" id="seven">

                                    <div class="form-group row">
                                        <label for="name" class="col-sm-3 col-form-label form-label">Name of Financial Institution</label>
                                        <div class="col-sm-8">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <input id="txtFinancialName" type="text" runat="server" class="form-control" placeholder="Name of Financial Institution" value="">
                                                </div>

                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <label for="dob" class="col-sm-3 col-form-label form-label">Branch Address</label>
                                        <div class="col-sm-8">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <input id="txtBranchAddress" type="text" runat="server" class="form-control" placeholder="Branch Address" value="">
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="Passport" class="col-sm-3 col-form-label form-label">Phone number</label>
                                        <div class="col-sm-8">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <input id="txtBranchPhone" type="text" runat="server" class="form-control" placeholder="Phone number" value="">
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="Passport" class="col-sm-3 col-form-label form-label">Branch Managers Name</label>
                                        <div class="col-sm-8">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <input id="txtManagerName" type="text" runat="server" class="form-control" placeholder="Branch Managers Name" value="">
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="Passport" class="col-sm-3 col-form-label form-label">Mobile</label>
                                        <div class="col-sm-8">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <input id="txtManagerMobile" type="text" runat="server" class="form-control" placeholder="Mobile" value="">
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="Passport" class="col-sm-3 col-form-label form-label">Manager Phone number</label>
                                        <div class="col-sm-8">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <input id="txtManagerPhoneNo" type="text" runat="server" class="form-control" placeholder="Manager Phone number" value="">
                                                </div>

                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <label for="Passport" class="col-sm-3 col-form-label form-label">Type of Funds</label>
                                        <div class="col-sm-8">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <input id="txtFundType" type="text" runat="server" class="form-control" placeholder="Type of Funds" value="">
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="Passport" class="col-sm-3 col-form-label form-label">Account Holder Name</label>
                                        <div class="col-sm-8">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <input id="txtAccountHolderName" type="text" runat="server" class="form-control" placeholder="Account Holder Name" value="">
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="Passport" class="col-sm-3 col-form-label form-label">Relationship to the Applicant</label>
                                        <div class="col-sm-8">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <input id="txtRelationshipWithApplicant" type="text" runat="server" class="form-control" placeholder="Relationship to the Applicant" value="">
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="Passport" class="col-sm-3 col-form-label form-label">Account Number</label>
                                        <div class="col-sm-8">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <input id="txtAccountNo" type="text" runat="server" class="form-control" placeholder="Account Number" value="">
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="Passport" class="col-sm-3 col-form-label form-label">Account Opening Date</label>
                                        <div class="col-sm-8">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <input id="txtAccountOpeningDate" type="text" runat="server" class="form-control" placeholder="Account Opening Date" value="">
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="Passport" class="col-sm-3 col-form-label form-label">Account Balance in INR</label>
                                        <div class="col-sm-8">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <input id="txtBalanceAmount" type="text" runat="server" class="form-control" placeholder="Account Balance in INR" value="">
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-sm-8 offset-sm-3">
                                            <div class="media align-items-center">
                                                <div class="media-left">
                                                    <asp:Button ID="Button1" runat="server" Text="Add Financial Details" OnClick="btnFinancial_Click" CssClass="btnbtn-successk" />

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group row">

                                        <div class="col-sm-8">
                                            <div class="row">
                                                <div class="col-md-12">
                                                  
                                                     <asp:GridView ID="grdLoans" runat="server" CssClass="table" AutoGenerateColumns="false" >
                                                            <Columns>
                                                                <asp:TemplateField ItemStyle-Width="30px" HeaderText="Name">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblfinancial_intstitue_name" runat="server"
                                                                            Text='<%#Eval("financial_intstitue_name")%>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField ItemStyle-Width="30px" HeaderText="Address">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lbladdress" runat="server"
                                                                            Text='<%#Eval("address")%>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                 <asp:TemplateField ItemStyle-Width="30px" HeaderText="Contact No">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblcontact_no" runat="server"
                                                                            Text='<%#Eval("contact_no")%>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField ItemStyle-Width="30px" HeaderText="Manager Name">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblbranch_manager_name" runat="server"
                                                                            Text='<%#Eval("branch_manager_name")%>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField ItemStyle-Width="30px" HeaderText="Manager Contactno">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblbranch_manager_contactno" runat="server"
                                                                            Text='<%#Eval("branch_manager_contactno")%>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                 <asp:TemplateField ItemStyle-Width="30px" HeaderText="Manager Mobile">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblbranch_manager_mobile" runat="server"
                                                                            Text='<%#Eval("branch_manager_mobile")%>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                  <asp:TemplateField ItemStyle-Width="30px" HeaderText="Fund Type">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lbltypeoffunds" runat="server"
                                                                            Text='<%#Eval("typeoffunds")%>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField ItemStyle-Width="30px" HeaderText="Account Holder Name">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblaccountholdername" runat="server" Text='<%#Eval("accountholdername") %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                 <asp:TemplateField ItemStyle-Width="30px" HeaderText="Relationship">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblrelationship" runat="server" Text='<%#Eval("relationship") %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                 <asp:TemplateField ItemStyle-Width="30px" HeaderText="Accountno">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblaccountno" runat="server" Text='<%#Eval("accountno") %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                 <asp:TemplateField ItemStyle-Width="30px" HeaderText="Balance">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblaccountbalance" runat="server" Text='<%#Eval("accountbalance") %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                  <asp:TemplateField HeaderText="Account Opening Date">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblaccountopeningDate" runat="server" Text='<%#Eval("accountopeningDate", "{0:dd/MM/yyyy}") %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                            </Columns>
                                                        </asp:GridView>
                                                </div>

                                            </div>
                                        </div>
                                    </div>

                                </div>
                                <div class="tab-pane" id="eight">

                                    <div class="form-group row">
                                        <label for="name" class="col-sm-3 col-form-label form-label">Personal Details</label>
                                        <div class="col-sm-8">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <asp:RadioButton ID="rdPersonal1" runat="server" GroupName="Personal" Text="1" />
                                                    <asp:RadioButton ID="rdPersonal2" runat="server" GroupName="Personal" Text="2" />
                                                    <asp:RadioButton ID="rdPersonal3" runat="server" GroupName="Personal" Text="3" />
                                                    <asp:RadioButton ID="rdPersonal4" runat="server" GroupName="Personal" Text="4" />
                                                    <asp:RadioButton ID="rdPersonal5" runat="server" GroupName="Personal" Text="5" />
                                                </div>

                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <label for="dob" class="col-sm-3 col-form-label form-label">Academic details</label>
                                        <div class="col-sm-8">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <asp:RadioButton ID="rdAcademic1" runat="server" GroupName="Academic" Text="1" />
                                                    <asp:RadioButton ID="rdAcademic2" runat="server" GroupName="Academic" Text="2" />
                                                    <asp:RadioButton ID="rdAcademic3" runat="server" GroupName="Academic" Text="3" />
                                                    <asp:RadioButton ID="rdAcademic4" runat="server" GroupName="Academic" Text="4" />
                                                    <asp:RadioButton ID="rdAcademic5" runat="server" GroupName="Academic" Text="5" />
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="Passport" class="col-sm-3 col-form-label form-label">English proficiency</label>
                                        <div class="col-sm-8">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <asp:RadioButton ID="rdEnglish1" runat="server" GroupName="English" Text="1" />
                                                    <asp:RadioButton ID="rdEnglish2" runat="server" GroupName="English" Text="2" />
                                                    <asp:RadioButton ID="rdEnglish3" runat="server" GroupName="English" Text="3" />
                                                    <asp:RadioButton ID="rdEnglish4" runat="server" GroupName="English" Text="4" />
                                                    <asp:RadioButton ID="rdEnglish5" runat="server" GroupName="English" Text="5" />
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="Passport" class="col-sm-3 col-form-label form-label">Age requirements</label>
                                        <div class="col-sm-8">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <asp:RadioButton ID="rdAge1" runat="server" GroupName="Age" Text="1" />
                                                    <asp:RadioButton ID="rdAge2" runat="server" GroupName="Age" Text="2" />
                                                    <asp:RadioButton ID="rdAge3" runat="server" GroupName="Age" Text="3" />
                                                    <asp:RadioButton ID="rdAge4" runat="server" GroupName="Age" Text="4" />
                                                    <asp:RadioButton ID="rdAge5" runat="server" GroupName="Age" Text="5" />
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="Passport" class="col-sm-3 col-form-label form-label">Financial capacity</label>
                                        <div class="col-sm-8">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <asp:RadioButton ID="rdFinancial1" runat="server" GroupName="Financial" Text="1" />
                                                    <asp:RadioButton ID="rdFinancial2" runat="server" GroupName="Financial" Text="2" />
                                                    <asp:RadioButton ID="rdFinancial3" runat="server" GroupName="Financial" Text="3" />
                                                    <asp:RadioButton ID="rdFinancial4" runat="server" GroupName="Financial" Text="4" />
                                                    <asp:RadioButton ID="rdFinancial5" runat="server" GroupName="Financial" Text="5" />
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-sm-8 offset-sm-3">
                                            <div class="media align-items-center">
                                                <div class="media-left">
                                                    <asp:Button ID="Button2" runat="server" Text="Self Assesment" OnClick="btnSelfAssesment_Click" CssClass="btnbtn-successk" />

                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                </form>


                <div class="container page__container">
                    <div class="footer">
                    </div>
                </div>
            </div>
        </div>
        <!-- // END Header Layout Content -->


        <!-- // END Header Layout -->





        <div class="mdk-drawer js-mdk-drawer" id="default-drawer">
            <div class="mdk-drawer__content ">
                <div class="sidebar sidebar-left sidebar-dark bg-dark o-hidden" data-perfect-scrollbar>
                    <div class="sidebar-p-y">

                        <!-- Account menu -->
                        <div class="sidebar-heading">Account</div>
                        <ul class="sidebar-menu">
                            <li class="sidebar-menu-item open">
                                <a class="sidebar-menu-button sidebar-js-collapse" data-toggle="collapse" href="#account_menu">
                                    <i class="sidebar-menu-icon sidebar-menu-icon--left material-icons">person_outline</i>
                                    Account
                                <span class="ml-auto sidebar-menu-toggle-icon"></span>
                                </a>
                                <ul class="sidebar-submenu sm-indent collapse show" id="account_menu">
                                    <li class="sidebar-menu-item">
                                        <a class="sidebar-menu-button" href="login.aspx">
                                            <span class="sidebar-menu-text">Login</span>
                                        </a>
                                    </li>
                                    <li class="sidebar-menu-item">
                                        <a class="sidebar-menu-button" href="guest-signup.html">
                                            <span class="sidebar-menu-text">Sign Up</span>
                                        </a>
                                    </li>
                                    <li class="sidebar-menu-item">
                                        <a class="sidebar-menu-button" href="forgetpassword.aspx">
                                            <span class="sidebar-menu-text">Forgot Password</span>
                                        </a>
                                    </li>
                                    <li class="sidebar-menu-item active">
                                        <a class="sidebar-menu-button" href="fixed-student-account-edit.html">
                                            <span class="sidebar-menu-text">Edit Account</span>
                                        </a>
                                    </li>
                                    <li class="sidebar-menu-item">
                                        <a class="sidebar-menu-button" href="basicinfo.aspx">
                                            <span class="sidebar-menu-text">Basic Information</span>
                                        </a>
                                    </li>

                                </ul>
                            </li>

                        </ul>
                        <div class="sidebar-heading">Student</div>
                        <ul class="sidebar-menu sm-active-button-bg">
                            <li class="sidebar-menu-item">
                                <a class="sidebar-menu-button" href="fixed-student-browse-courses.html">
                                    <i class="sidebar-menu-icon sidebar-menu-icon--left material-icons">search</i> Browse Courses
                                </a>
                            </li>
                            <li class="sidebar-menu-item">
                                <a class="sidebar-menu-button" href="fixed-student-view-course.html">
                                    <i class="sidebar-menu-icon sidebar-menu-icon--left material-icons">import_contacts</i> View Course
                                </a>
                            </li>
                            <li class="sidebar-menu-item">
                                <a class="sidebar-menu-button" href="questions.aspx">
                                    <i class="sidebar-menu-icon sidebar-menu-icon--left material-icons">class</i> Take Course
                                <span class="sidebar-menu-badge badge badge-primary ml-auto">PRO</span>
                                </a>
                            </li>
                            <li class="sidebar-menu-item">
                                <a class="sidebar-menu-button" href="fixed-student-take-quiz.html">
                                    <i class="sidebar-menu-icon sidebar-menu-icon--left material-icons">dvr</i> Take a Quiz
                                </a>
                            </li>
                            <li class="sidebar-menu-item">
                                <a class="sidebar-menu-button" href="fixed-student-quiz-results.html">
                                    <i class="sidebar-menu-icon sidebar-menu-icon--left material-icons">poll</i> Quiz Results
                                </a>
                            </li>
                            <li class="sidebar-menu-item">
                                <a class="sidebar-menu-button" href="fixed-student-my-courses.html">
                                    <i class="sidebar-menu-icon sidebar-menu-icon--left material-icons">school</i> My Courses
                                </a>
                            </li>
                            <li class="sidebar-menu-item">
                                <a class="sidebar-menu-button" data-toggle="collapse" href="#forum_menu">
                                    <i class="sidebar-menu-icon sidebar-menu-icon--left material-icons">chat_bubble_outline</i>
                                    Community
                                <span class="ml-auto sidebar-menu-toggle-icon"></span>
                                </a>
                                <ul class="sidebar-submenu sm-indent collapse" id="forum_menu">
                                    <li class="sidebar-menu-item">
                                        <a class="sidebar-menu-button" href="fixed-student-forum.html">
                                            <span class="sidebar-menu-text">Forum</span>
                                        </a>
                                    </li>
                                    <li class="sidebar-menu-item">
                                        <a class="sidebar-menu-button" href="fixed-student-forum-thread.html">
                                            <span class="sidebar-menu-text">Discussion</span>
                                        </a>
                                    </li>
                                    <li class="sidebar-menu-item">
                                        <a class="sidebar-menu-button" href="fixed-student-forum-ask.html">
                                            <span class="sidebar-menu-text">Ask Question</span>
                                        </a>
                                    </li>
                                    <li class="sidebar-menu-item">
                                        <a class="sidebar-menu-button" href="fixed-student-profile.html">
                                            <span class="sidebar-menu-text">Student Profile - Courses</span>
                                        </a>
                                    </li>
                                    <li class="sidebar-menu-item">
                                        <a class="sidebar-menu-button" href="fixed-student-profile-posts.html">
                                            <span class="sidebar-menu-text">Student Profile - Posts</span>
                                        </a>
                                    </li>
                                    <li class="sidebar-menu-item">
                                        <a class="sidebar-menu-button" href="fixed-instructor-profile.html">
                                            <span class="sidebar-menu-text">Instructor Profile</span>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <li class="sidebar-menu-item">
                                <a class="sidebar-menu-button" href="fixed-student-help-center.html">
                                    <i class="sidebar-menu-icon sidebar-menu-icon--left material-icons">live_help</i> Get Help
                                </a>
                            </li>
                            <li class="sidebar-menu-item">
                                <a class="sidebar-menu-button" href="login.aspx">
                                    <i class="sidebar-menu-icon sidebar-menu-icon--left material-icons">lock_open</i> Logout
                                </a>
                            </li>
                        </ul>



                    </div>
                </div>
            </div>
        </div>
        <!-- jQuery -->


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
</body>

</html>
