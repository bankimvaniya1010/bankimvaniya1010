<%@ Page Language="C#" AutoEventWireup="true" CodeFile="visadetail.aspx.cs" Inherits="visadetail" MasterPageFile="~/student.master" %>

<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">


    <div class="container-fluid page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">Citizenship and Visa Details</li>
        </ol>
        <h1 class="h2">Citizenship and Visa Details</h1>

    </div>
    <div class="page ">
        <div class="container page__container p-0">
            <div class="row m-0">
                <div class="col-lg container-fluid page__container">

                    <div class="card" style="width: 650px;">
                        <div class="list-group list-group-fit">
                            <div class="list-group-item">
                                <div class="form-group m-0" role="postal" aria-labelledby="label-postal">
                                    <div class="form-row">
                                        <label id="label-postal" for="title" class="col-md-3 col-form-label form-label">
                                            Do you currently have a visa that allows you to study in {insert name of country}

                                        </label>
                                        <div class="col-md-6">
                                            <asp:RadioButton ID="rbtnYes" runat="server" GroupName="Visa" Text="Yes" />
                                            <asp:RadioButton ID="rbtnNo" runat="server" GroupName="Visa" Text="No - I will need to apply for an international student visa" />
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="list-group-item" id="visa">
                                <div class="form-group m-0" role="group" aria-labelledby="label-firstname">
                                    <div class="form-row">
                                        <label id="label-firstname" for="firstname" class="col-md-3 col-form-label form-label">Visa</label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlVisa" runat="server">
                                                <asp:ListItem Text="International Student Visa" Value="International Student Visa"></asp:ListItem>
                                                <asp:ListItem Text="Permanent Humanitarian Visa" Value="Permanent Humanitarian Visa"></asp:ListItem>
                                                <asp:ListItem Text=" Permanent Resisdency Visa" Value=" Permanent Resisdency Visa"></asp:ListItem>
                                                <asp:ListItem Text="Work Permit" Value="Work Permit"></asp:ListItem>
                                                <asp:ListItem Text="Other" Value="Other"></asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                            </div>




                        </div>
                    </div>
                </div>

                <div id="page-nav" class="col-lg-auto page-nav">
                    <div data-perfect-scrollbar>
                        <div class="page-section pt-lg-32pt">
                            <ul class="nav page-nav__menu">
                                <li class="nav-item" runat="server" id="basic">
                                    <a href="personaldetails.aspx" class="nav-link">Applicant Personal Details</a>
                                </li>
                                <li class="nav-item" runat="server" id="education">
                                    <a href="applicantcontactdetail.aspx" class="nav-link">Applicant Contact Details</a>
                                </li>
                                <li class="nav-item" runat="server" id="language">
                                    <a href="visadetail.aspx" class="nav-link active">Citizenship and Visa Details</a>
                                </li>
                                <li class="nav-item" runat="server" id="backlog">
                                    <a href="applicantcourse.aspx" class="nav-link">Course Selection</a>
                                </li>
                                <li class="nav-item" runat="server" id="employer">
                                    <a href="applicanteducation.aspx" class="nav-link ">Education Details</a>
                                </li>
                                <li class="nav-item" runat="server" id="sponsors">
                                    <a href="applicantlanguage.aspx" class="nav-link">English Language Competency</a>
                                </li>
                                <li class="nav-item" runat="server" id="financial">
                                    <a href="applicantworkexperience.aspx" class="nav-link ">Work Experience/Employment Details</a>
                                </li>
                                <li class="nav-item" runat="server" id="self">
                                    <a href="applicantreview.aspx" class="nav-link">Review</a>
                                </li>
                            </ul>
                            <div class="page-nav__content">
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
    <script>
        $("#visa").hide();
        $(function () {
            $("input[name='ctl00$ContentPlaceHolder1$Visa']").click(function () {
                if ($("#ContentPlaceHolder1_rbtnYes").is(":checked")) {
                    $("#visa").show();

                } else {
                    $("#visa").hide();

                }
            });
        });
        $('#ContentPlaceHolder1_dob').flatpickr({

            dateFormat: 'Y-m-d'
        });



        //document.getElementById("ContentPlaceHolder1_dob").flatpickr({
        //    wrap: true,
        //    weekNumbers: true,
        //    enableTime: true, // enables timepicker default is false    
        //    time_24hr: true, // set to false for AM PM default is false
        //    onChange: function (selectedDates, dateStr, instance) {
        //        console.log("changed");
        //    }
        //});



    </script>


</asp:Content>
