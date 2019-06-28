<%@ Page Language="C#" AutoEventWireup="true" CodeFile="applicantvisa.aspx.cs" Inherits="admin_applicantvisa" MasterPageFile="~/admin/admin.master" %>

<asp:Content ID="content1" runat="server" ContentPlaceHolderID="head">
    <title></title>
    <script>
        $(document).ready(function () {

            $('.fa-question-circle').tipso({
                position: 'right',
                background: 'rgba(0,0,0,0.8)',
                useTitle: false,
            });
        });
    </script>
</asp:Content>
<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="container page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">Applicant visa details</li>
        </ol>
        <h1 class="h2">Applicant visa details</h1>
        <div class="card" >

            <div class="list-group list-group-fit">
                <div class="list-group-item" id="applyvisa">
                    <div class="form-group m-0" role="group" aria-labelledby="label-havevisa">
                        <div class="form-row">
                            <label id="label-havevisa" for="havevisa" class="col-md-3 col-form-label form-label">
                                Do you currently have a visa that allows you to study in {insert name of country}

                            </label>
                            <div class="col-md-4">
                                <asp:Label ID="lblHaveVisa" runat="server"></asp:Label>
                                <span class="helpicon"><i id="icHaveVisa" runat="server" class="fa fa-question-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-4">
                                <input id="txtHaveVisa" runat="server" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>
                    </div>
                </div>

                <div class="list-group-item" id="visa">
                    <div class="form-group m-0" role="group" aria-labelledby="label-visa">
                        <div class="form-row">
                            <label id="label-visa" for="visa" class="col-md-3 col-form-label form-label">Which Visa Do You Hold</label>
                            <div class="col-md-4">
                                <asp:Label ID="lblvisa" runat="server"></asp:Label>
                                <span class="helpicon"><i id="icvisa" runat="server" class="fa fa-question-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-4">
                                <input id="txtVisa" runat="server" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="validityFrom">
                    <div class="form-group m-0" role="group" aria-labelledby="label-validityFrom">
                        <div class="form-row">
                            <label id="label-validityFrom" for="EnglishCourse" class="col-md-3 col-form-label form-label">Validity From </label>
                            <div class="col-md-4">
                                <asp:Label ID="lblvalidityFrom" runat="server"></asp:Label>
                                <span class="helpicon"><i id="icvalidityFrom" runat="server" class="fa fa-question-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-4">
                                <input id="txtvalidityFrom" runat="server" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="validityTo">
                    <div class="form-group m-0" role="group" aria-labelledby="label-validityTo">
                        <div class="form-row">
                            <label id="label-validityTo" for="EnglishCourse" class="col-md-3 col-form-label form-label">Validity To </label>
                            <div class="col-md-4">
                                <asp:Label ID="lblvalidityTo" runat="server"></asp:Label>
                                <span class="helpicon"><i id="icvalidityTo" runat="server" class="fa fa-question-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-4">
                                <input id="txtvalidityTo" runat="server" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>
                    </div>
                </div>

                <div class="list-group-item" id="visano">
                    <div class="form-group m-0" role="group" aria-labelledby="label-visano">
                        <div class="form-row">
                            <label id="label-visano" for="visano" class="col-md-3 col-form-label form-label">Visa No</label>
                            <div class="col-md-4">
                                <asp:Label ID="lblvisano" runat="server"></asp:Label>
                                <span class="helpicon"><i id="i4" runat="server" class="fa fa-question-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-4">
                                <input id="txtvisano" runat="server" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="visaappliedCountry">
                    <div class="form-group m-0" role="group" aria-labelledby="label-visaappliedCountry">
                        <div class="form-row">
                            <label id="label-visaappliedCountry" for="visaappliedCountry" class="col-md-3 col-form-label form-label">
                                Where would you be making your Visa application 

                            </label>
                            <div class="col-md-4">
                                <asp:Label ID="lblvisaapplied" runat="server"></asp:Label>
                                <span class="helpicon"><i id="icvisaappliedCountry" runat="server" class="fa fa-question-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-4">
                                <input id="txtvisaappliedCountry" runat="server" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="visacity">
                    <div class="form-group m-0" role="group" aria-labelledby="label-city">
                        <div class="form-row">
                            <label id="label-city" for="city" class="col-md-3 col-form-label form-label">
                                City

                            </label>
                            <div class="col-md-4">
                                <asp:Label ID="lblvisacity" runat="server"></asp:Label>
                                <span class="helpicon"><i id="icvisacity" runat="server" class="fa fa-question-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-4">
                                <input id="txtvisacity" runat="server" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="visacountry">
                    <div class="form-group m-0" role="group" aria-labelledby="label-highschoolCountry">
                        <div class="form-row">
                            <label id="label-highschoolCountry" for="highschoolCountry" class="col-md-3 col-form-label form-label">Visa Application Country</label>
                            <div class="col-md-4">
                                <asp:Label ID="lblvisacountry" runat="server"></asp:Label>
                                <span class="helpicon"><i id="icvisacountry" runat="server" class="fa fa-question-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-4">
                                <input id="txtvisacountry" runat="server" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="firstvisit">
                    <div class="form-group m-0" role="group" aria-labelledby="label-firstvisit">
                        <div class="form-row">
                            <label id="label-firstvisit" for="firstvisit" class="col-md-3 col-form-label form-label">Date of first Visit to Country of Application </label>
                            <div class="col-md-4">
                                <asp:Label ID="lblfirstvisit" runat="server"></asp:Label>
                                <span class="helpicon"><i id="icfirstvisit" runat="server" class="fa fa-question-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-4">
                                <input id="txtfirstvisit" runat="server" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="Previuosstay">
                    <div class="form-group m-0" role="group" aria-labelledby="label-Previuosstay">
                        <div class="form-row">
                            <label id="label-Previuosstay" for="Previuosstay" class="col-md-3 col-form-label form-label">
                                Have you ever, lived, worked, studied in Country of Application before

                            </label>
                            <div class="col-md-4">
                                <asp:Label ID="lblPreviuosstay" runat="server"></asp:Label>
                                <span class="helpicon"><i id="icPreviuosstay" runat="server" class="fa fa-question-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-4">
                                <input id="txtPreviuosstay" runat="server" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="parent">
                    <div class="form-group m-0" role="group" aria-labelledby="label-parent">
                        <div class="form-row">
                            <label id="label-parent" for="parent" class="col-md-3 col-form-label form-label">
                                Do your parents/step parents/spouse/partner/children/step-children live, study, work in Country of Application

                            </label>
                            <div class="col-md-4">
                                <asp:Label ID="lblparent" runat="server"></asp:Label>
                                <span class="helpicon"><i id="icparent" runat="server" class="fa fa-question-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-4">
                                <input id="txtparent" runat="server" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="DeniedVisa">
                    <div class="form-group m-0" role="group" aria-labelledby="label-DeniedVisa">
                        <div class="form-row">
                            <label id="label-DeniedVisa" for="DeniedVisa" class="col-md-3 col-form-label form-label">
                                Have you ever been refused a Visa or Deported by Country of Application
                            </label>
                            <div class="col-md-4">
                                <asp:Label ID="lblDeniedVisa" runat="server"></asp:Label>
                                <span class="helpicon"><i id="icDeniedVisa" runat="server" class="fa fa-question-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-4">
                                <input id="txtDeniedVisa" runat="server" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="parentdeny">
                    <div class="form-group m-0" role="group" aria-labelledby="label-parentdeny">
                        <div class="form-row">
                            <label id="label-parentdeny" for="parentdeny" class="col-md-3 col-form-label form-label">
                                Have your parents/step parents/spouse/partner/children/step-children ever been refused a visa or deported from

                            </label>
                            <div class="col-md-4">
                                <asp:Label ID="lblparentdeny" runat="server"></asp:Label>
                                <span class="helpicon"><i id="icparentdeny" runat="server" class="fa fa-question-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-4">
                                <input id="txtparentdeny" runat="server" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>
                    </div>
                </div>
                <div id="mainDiv" runat="server"></div>
                <div class="list-group-item">
                    <div class="form-group m-0" role="group" aria-labelledby="label-employerwebsite">
                        <div class="form-row">
                            <asp:Button ID="btnSave" runat="server" Text="Save Changes" CssClass="btn btn-success" OnClick="btnSave_Click" />
                          
                            <div class="col-md-6">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


    </div>
</asp:Content>
