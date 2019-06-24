<%@ Page Language="C#" AutoEventWireup="true" CodeFile="applicantworkexperince.aspx.cs" Inherits="admin_applicantworkexperince" MasterPageFile="~/admin/admin.master" %>

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
            <li class="breadcrumb-item active">Applicant Work Experince</li>
        </ol>
        <h1 class="h2">Applicant Work Experince</h1>

        <div class="card">
            <div id="employment" runat="server" >
                <div class="list-group-item" id="employmentInfo" runat="server" style="display: none">
                    <div class="form-group m-0" role="group" aria-labelledby="label-employment">
                        <div class="form-row">
                            <label id="labelemployment" runat="server" for="employment" class="col-md-3 col-form-label form-label">Do you wish to record any work experience that may be relevant to the course you are applying for?</label>
                            <div class="col-md-4">
                                <asp:Label ID="lblemploymentInfo" runat="server"></asp:Label>
                                <span class="helpicon"><i id="icemploymentInfo" runat="server" class="fa fa-question-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-4">
                                <input id="txtemploymentInfo" runat="server" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>
                    </div>
                </div>

                <div id="fieldContainer" runat="server">
                    <div class="list-group-item" id="employer" runat="server" style="display: none;">
                        <div class="form-group m-0" role="group" aria-labelledby="label-employer">
                            <div class="form-row">
                                <label id="labelemployer" runat="server" for="employer" class="col-md-3 col-form-label form-label">Name of Organization </label>
                                <div class="col-md-4">
                                    <asp:Label ID="lblemployer" runat="server"></asp:Label>
                                    <span class="helpicon"><i id="icemployer" runat="server" class="fa fa-question-circle" style="display: none"></i></span>
                                </div>
                                <div class="col-md-4">
                                    <input id="txtemployer" runat="server" type="text" class="form-control" placeholder="Admin Comments">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="list-group-item" id="employerwebsite" runat="server" style="display: none">
                        <div class="form-group m-0" role="group" aria-labelledby="label-employerwebsite">
                            <div class="form-row">
                                <label id="labelemployerwebsite" runat="server" for="employerwebsite" class="col-md-3 col-form-label form-label">Website of the Organization</label>
                                <div class="col-md-4">
                                    <asp:Label ID="lblemployerwebsite" runat="server"></asp:Label>
                                    <span class="helpicon"><i id="icemployerwebsite" runat="server" class="fa fa-question-circle" style="display: none"></i></span>
                                </div>
                                <div class="col-md-4">
                                    <input id="txtemployerwebsite" runat="server" type="text" class="form-control" placeholder="Admin Comments">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="list-group-item" id="employercity" runat="server" style="display: none">
                        <div class="form-group m-0" role="group" aria-labelledby="label-employercity">
                            <div class="form-row">
                                <label id="labelemployercity" runat="server" for="employercity" class="col-md-3 col-form-label form-label">City</label>
                                <div class="col-md-4">
                                    <asp:Label ID="lblemployercity" runat="server"></asp:Label>
                                    <span class="helpicon"><i id="icemployercity" runat="server" class="fa fa-question-circle" style="display: none"></i></span>
                                </div>
                                <div class="col-md-4">
                                    <input id="txtemployercity" runat="server" type="text" class="form-control" placeholder="Admin Comments">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="list-group-item" id="employercountry" runat="server" style="display: none">
                        <div class="form-group m-0" role="group" aria-labelledby="label-employercountry">
                            <div class="form-row">
                                <label id="labelemployercountry" runat="server" for="employercountry" class="col-md-3 col-form-label form-label">Country</label>
                                <div class="col-md-4">
                                    <asp:Label ID="lblemployercountry" runat="server"></asp:Label>
                                    <span class="helpicon"><i id="icemployercountry" runat="server" class="fa fa-question-circle" style="display: none"></i></span>
                                </div>
                                <div class="col-md-4">
                                    <input id="txtemployercountry" runat="server" type="text" class="form-control" placeholder="Admin Comments">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="list-group-item" id="position" runat="server" style="display: none">
                        <div class="form-group m-0" role="group" aria-labelledby="label-position">
                            <div class="form-row">
                                <label id="labelposition" runat="server" for="position" class="col-md-3 col-form-label form-label">Position/Role in</label>
                                <div class="col-md-4">
                                    <asp:Label ID="lblposition" runat="server"></asp:Label>
                                    <span class="helpicon"><i id="icposition" runat="server" class="fa fa-question-circle" style="display: none"></i></span>
                                </div>
                                <div class="col-md-4">
                                    <input id="txtposition" runat="server" type="text" class="form-control" placeholder="Admin Comments">
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="list-group-item" id="startdate" runat="server" style="display: none">
                        <div class="form-group m-0" role="group" aria-labelledby="label-startdate">
                            <div class="form-row">
                                <label id="labelstartdate" runat="server" for="startdate" class="col-md-3 col-form-label form-label">Start Date</label>
                                <div class="col-md-4">
                                    <asp:Label ID="lblstartdate" runat="server"></asp:Label>
                                    <span class="helpicon"><i id="icstartdate" runat="server" class="fa fa-question-circle" style="display: none"></i></span>
                                </div>
                                <div class="col-md-4">
                                    <input id="txtstartdate" runat="server" type="text" class="form-control" placeholder="Admin Comments">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="list-group-item" id="endate" runat="server" style="display: none">
                        <div class="form-group m-0" role="group" aria-labelledby="label-endate">
                            <div class="form-row">
                                <label id="labelendate" runat="server" for="endate" class="col-md-3 col-form-label form-label">End Date</label>
                                <div class="col-md-4">
                                    <asp:Label ID="lblendate" runat="server"></asp:Label>
                                    <span class="helpicon"><i id="icenddate" runat="server" class="fa fa-question-circle" style="display: none"></i></span>
                                </div>
                                <div class="col-md-4">
                                    <input id="txtendate" runat="server" type="text" class="form-control" placeholder="Admin Comments">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="list-group-item" id="briefDescription" runat="server" style="display: none">
                        <div class="form-group m-0" role="group" aria-labelledby="label-briefDescription">
                            <div class="form-row">
                                <label id="labelbriefDescription" runat="server" for="briefDescription" class="col-md-3 col-form-label form-label">Brief Description of what you did</label>
                                <div class="col-md-4">
                                    <asp:Label ID="lblbriefDescription" runat="server"></asp:Label>
                                    <span class="helpicon"><i id="icbriefDescription" runat="server" class="fa fa-question-circle" style="display: none"></i></span>
                                </div>
                                <div class="col-md-4">
                                    <input id="txtbriefDescription" runat="server" type="text" class="form-control" placeholder="Admin Comments">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="list-group-item" id="reportingmanger" runat="server" style="display: none">
                        <div class="form-group m-0" role="group" aria-labelledby="label-reportingmanger">
                            <div class="form-row">
                                <label id="labelreportingmanger" runat="server" for="reportingmanger" class="col-md-3 col-form-label form-label">Name of your reporting Manager</label>
                                <div class="col-md-4">
                                    <asp:Label ID="lblreportingmanger" runat="server"></asp:Label>
                                    <span class="helpicon"><i id="icreportingmanger" runat="server" class="fa fa-question-circle" style="display: none"></i></span>
                                </div>
                                <div class="col-md-4">
                                    <input id="txtreportingmanger" runat="server" type="text" class="form-control" placeholder="Admin Comments">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="list-group-item" id="employmentverification" runat="server" style="display: none">
                        <div class="form-group m-0" role="group" aria-labelledby="label-employmentverification">
                            <div class="form-row">
                                <label id="labelemploymentverification" runat="server" for="employmentverification" class="col-md-3 col-form-label form-label">Name of Contact who can verify your employment </label>
                                <div class="col-md-4">
                                    <asp:Label ID="lblemploymentverification" runat="server"></asp:Label>
                                    <span class="helpicon"><i id="icemploymentverification" runat="server" class="fa fa-question-circle" style="display: none"></i></span>
                                </div>
                                <div class="col-md-4">
                                    <input id="txtemploymentverification" runat="server" type="text" class="form-control" placeholder="Admin Comments">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="list-group-item" id="relationship" runat="server" style="display: none">
                        <div class="form-group m-0" role="group" aria-labelledby="label-relationship">
                            <div class="form-row">
                                <label id="labelrelationship" runat="server" for="relationship" class="col-md-3 col-form-label form-label">Relationship with the Contact  </label>
                                <div class="col-md-4">
                                    <asp:Label ID="lblrelationship" runat="server"></asp:Label>
                                    <span class="helpicon"><i id="icrelationship" runat="server" class="fa fa-question-circle" style="display: none"></i></span>
                                </div>
                                <div class="col-md-4">
                                    <input id="txtrelationship" runat="server" type="text" class="form-control" placeholder="Admin Comments">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="list-group-item" id="email" runat="server" style="display: none">
                        <div class="form-group m-0" role="group" aria-labelledby="label-email">
                            <div class="form-row">
                                <label id="labelemail" runat="server" for="email" class="col-md-3 col-form-label form-label">Email ID of Contact who can verify your employment  </label>
                                <div class="col-md-4">
                                    <asp:Label ID="lblemail" runat="server"></asp:Label>
                                    <span class="helpicon"><i id="icemail" runat="server" class="fa fa-question-circle" style="display: none"></i></span>
                                </div>
                                <div class="col-md-4">
                                    <input id="txtemail" runat="server" type="text" class="form-control" placeholder="Admin Comments">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="list-group-item" id="linkedin" runat="server" style="display: none">
                        <div class="form-group m-0" role="group" aria-labelledby="label-linkedin">
                            <div class="form-row">
                                <label id="labellinkedin" runat="server" for="linkedin" class="col-md-3 col-form-label form-label">LinkedIn Profile Link of the contact  </label>
                                <div class="col-md-4">
                                    <asp:Label ID="lbllinkedin" runat="server"></asp:Label>
                                    <span class="helpicon"><i id="iclinkedin" runat="server" class="fa fa-question-circle" style="display: none"></i></span>
                                </div>
                                <div class="col-md-4">
                                    <input id="txtlinkedin" runat="server" type="text" class="form-control" placeholder="Admin Comments">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="mainDiv" runat="server"></div>
                <div class="list-group-item">
                    <div class="form-group m-0" role="group" aria-labelledby="label-employerwebsite">
                        <div class="form-row">

                            <asp:Button ID="btn_login" runat="server" Text="Save Changes" CssClass="btn btn-success" />
                            <div class="col-md-4">
                                <asp:Label ID="lblMessage" runat="server" Visible="false"></asp:Label>
                                <asp:Label ID="lblSaveTime" runat="server"></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


    </div>
</asp:Content>
