<%@ Page Language="C#" AutoEventWireup="true" CodeFile="basicprofile.aspx.cs" Inherits="basicprofile" MasterPageFile="~/student.master" %>


<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <div class="page ">
        <div class="container-fluid page__container">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
                <li class="breadcrumb-item active">Edit Account</li>
            </ol>
            <h1 class="h2">Basic Information</h1>

        </div>
        <div class="container page__container p-0">
            <div class="row m-0">
                <div class="col-lg container-fluid page__container">

                    <div class="card">
                        <div class="list-group list-group-fit">
                            <div class="list-group-item">
                                <div class="form-group m-0" role="group" aria-labelledby="label-firstname">
                                    <div class="form-row">
                                        <label id="label-firstname" for="firstname" class="col-md-3 col-form-label form-label"><%=Name %></label>
                                        <div class="col-md-9">
                                            <input id="txtName" runat="server" type="text" placeholder="Name" value="" class="form-control">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item">
                                <div class="form-group m-0" role="group" aria-labelledby="label-lastname">
                                    <div class="form-row">
                                        <label id="label-lastname" for="lastname" class="col-md-3 col-form-label form-label"><%=DateOFBirth %></label>
                                        <div class="col-md-9">
                                            <input id="dob" runat="server" type="text" class="form-control" placeholder="DOB" data-toggle="flatpickr" value="today">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item">
                                <div class="form-group m-0" role="group" aria-labelledby="label-lastname">
                                    <div class="form-row">
                                        <label id="label-lastname" for="lastname" class="col-md-3 col-form-label form-label"><%=Passport %></label>
                                        <div class="col-md-9">
                                            <input id="txtPaasportno" runat="server" type="text" placeholder="Date Of Birth" value="" class="form-control">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item">
                                <div class="form-group m-0" role="group" aria-labelledby="label-lastname">
                                    <div class="form-row">
                                        <label id="label-lastname" for="lastname" class="col-md-3 col-form-label form-label"><%=PanNo %></label>
                                        <div class="col-md-9">
                                            <input id="txtPanNo" runat="server" type="text" placeholder="Pan No" value="" class="form-control">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item">
                                <div class="form-group m-0" role="group" aria-labelledby="label-lastname">
                                    <div class="form-row">
                                        <label id="label-lastname" for="lastname" class="col-md-3 col-form-label form-label"><%=AdharNo %></label>
                                        <div class="col-md-9">
                                            <input id="txtAdhar" runat="server" type="text" placeholder="Adhar No" value="" class="form-control">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item">
                                <div class="form-group m-0" role="group" aria-labelledby="label-lastname">
                                    <div class="form-row">
                                        <label id="label-lastname" for="lastname" class="col-md-3 col-form-label form-label"><%=Voter %></label>
                                        <div class="col-md-9">
                                            <input id="txtVoter" runat="server" type="text" placeholder="Voter Card No" value="" class="form-control">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item">
                                <div class="form-group m-0" role="group" aria-labelledby="label-lastname">
                                    <div class="form-row">
                                        <label id="label-lastname" for="lastname" class="col-md-3 col-form-label form-label"><%=Gender %></label>
                                        <div class="col-md-9">
                                            <asp:RadioButton ID="rbtnMale" runat="server" GroupName="gender" Text="Male" />
                                            <asp:RadioButton ID="rbtnFemale" runat="server" GroupName="gender" Text="Female" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item">
                                <div class="form-group m-0" role="group" aria-labelledby="label-lastname">
                                    <div class="form-row">
                                        <label id="label-lastname" for="lastname" class="col-md-3 col-form-label form-label"><%=MobileNo %></label>
                                        <div class="col-md-9">
                                            <input id="txtMobile" runat="server" type="text" placeholder="Voter Card No" value="" class="form-control">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item">
                                <div class="form-group m-0" role="group" aria-labelledby="label-email">
                                    <div class="form-row">
                                        <label id="label-email" for="email" class="col-md-3 col-form-label form-label"><%=Email %></label>
                                        <div class="col-md-9">
                                            <div role="group" class="input-group input-group-merge">
                                                <input id="txtEmail" runat="server" type="email" placeholder="Your email address" value="" class="form-control form-control-prepended">
                                                <div class="input-group-prepend">
                                                    <div class="input-group-text">
                                                        <i class="material-icons">email</i>
                                                    </div>
                                                </div>
                                            </div>
                                            <small class="form-text text-muted"><%=EmailInstructions %>.</small>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="list-group-item">
                                <div class="form-group m-0" role="group" aria-labelledby="label-lastname">
                                    <div class="form-row">
                                        <label id="label-lastname" for="lastname" class="col-md-3 col-form-label form-label"><%=University %></label>
                                        <div class="col-md-9">
                                            <input id="txtUniversity" runat="server" type="text" placeholder="University" value="" class="form-control">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item">
                                <div class="form-group m-0" role="group" aria-labelledby="label-lastname">
                                    <div class="form-row">
                                        <label id="label-lastname" for="lastname" class="col-md-3 col-form-label form-label"><%=Course %></label>
                                        <div class="col-md-9">
                                            <input id="txtCourse" runat="server" type="text" placeholder="Course Applied For" value="" class="form-control">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item">
                                <div class="form-group m-0" role="group" aria-labelledby="label-lastname">
                                    <div class="form-row">
                                        <label id="label-lastname" for="lastname" class="col-md-3 col-form-label form-label"><%=Intake %></label>
                                        <div class="col-md-9">
                                            <input id="txtIntake" runat="server" type="text" placeholder=">Intake For Which Applied" value="" class="form-control">
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
                                <li class="nav-item" runat="server" id="basic" visible="false">
                                    <a href="basicprofile.aspx" class="nav-link active">Basic Information</a>
                                </li>
                                <li class="nav-item" runat="server" id="education" visible="false">
                                    <a href="educationinfo.aspx" class="nav-link">Education Information</a>
                                </li>
                                <li class="nav-item" runat="server" id="language" visible="false">
                                    <a href="languageproficiency.aspx" class="nav-link ">Language Proficiency</a>
                                </li>
                                <li class="nav-item" runat="server" id="backlog" visible="false">
                                    <a href="backlog.aspx" class="nav-link">Backlog</a>
                                </li>
                                <li class="nav-item" runat="server" id="employer" visible="false">
                                    <a href="employerinfo.aspx" class="nav-link ">Employers Info</a>
                                </li>
                                <li class="nav-item" runat="server" id="sponsors" visible="false">
                                    <a href="sponsor.aspx" class="nav-link">Sponsors Info</a>
                                </li>
                                <li class="nav-item" runat="server" id="financial" visible="false">
                                    <a href="financial.aspx" class="nav-link ">Financial Info</a>
                                </li>
                                <li class="nav-item" runat="server" id="self" visible="false">
                                    <a href="selfassesment.aspx" class="nav-link">Self Assesement</a>
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
