<%@ Page Language="C#" AutoEventWireup="true" CodeFile="personaldetail.aspx.cs" Inherits="admin_personaldetail" MasterPageFile="~/admin/admin.master" %>

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
            <li class="breadcrumb-item active">Applicant Personal details</li>
        </ol>
        <h1 class="h2">Applicant Personal details</h1>
        <div class="card">
            <div class="list-group list-group-fit">


                <div class="list-group-item" id="title" runat="server" style="display: none">
                    <div class="form-group m-0" role="group" aria-labelledby="label-title">
                        <div class="form-row">
                            <label runat="server" id="labeltitle" for="title" class="col-md-3 col-form-label form-label">* Title</label>
                            <div class="col-md-4">
                                <asp:Label ID="lblTitle" runat="server"></asp:Label>
                                <span class="helpicon"><i id="icTitle" runat="server" class="fa fa-question-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-4">
                                <input id="txtTitle" runat="server" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="firstname" runat="server" style="display: none">
                    <div class="form-group m-0" role="group" aria-labelledby="label-firstname">
                        <div class="form-row">
                            <label id="labelfirstname" runat="server" for="firstname" class="col-md-3 col-form-label form-label">First Name *</label>
                            <div class="col-md-4">
                                <asp:Label ID="lblFirstName" runat="server"></asp:Label>
                                <span class="helpicon"><i id="icfirstname" runat="server" class="fa fa-question-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-4">
                                <input id="txtFirstName" runat="server" type="text" class="form-control" placeholder="Admin Comments">
                            </div>

                        </div>

                    </div>
                </div>
                <div class="list-group-item" id="lastname" runat="server" style="display: none">
                    <div class="form-group m-0" role="group" aria-labelledby="label-lastname">
                        <div class="form-row">
                            <label id="labellastname" runat="server" for="lastname" class="col-md-3 col-form-label form-label">Last Name *</label>
                            <div class="col-md-4">
                                <asp:Label ID="lblLastName" runat="server"></asp:Label>
                                <span class="helpicon"><i id="iclastname" runat="server" class="fa fa-question-circle" style="display: none;"></i></span>

                            </div>
                            <div class="col-md-4">
                                <input id="txtLastName" runat="server" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>

                    </div>
                </div>
                <div class="list-group-item" id="preferedname" runat="server" style="display: none">
                    <div class="form-group m-0" role="group" aria-labelledby="label-preferreName">
                        <div class="form-row">
                            <label id="labelpreferreName" runat="server" for="preferreName" class="col-md-3 col-form-label form-label">Preferred Name</label>
                            <div class="col-md-4">
                                <asp:Label ID="lblPrefferedName" runat="server"></asp:Label>
                                <span class="helpicon"><i id="icPreferredname" runat="server" class="fa fa-question-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-4">
                                <input id="txtPrefferedName" runat="server" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="middlename" runat="server" style="display: none">
                    <div class="form-group m-0" role="group" aria-labelledby="label-middlename">
                        <div class="form-row">
                            <label id="labelmiddlename" runat="server" for="middlename" class="col-md-3 col-form-label form-label">Other middle names</label>
                            <div class="col-md-4">
                                <asp:Label ID="lblMiddleName" runat="server"></asp:Label>
                                <span class="helpicon"><i id="icmiddlename" runat="server" class="fa fa-question-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-4">
                                <input id="txtMiddleName" runat="server" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>

                    </div>
                </div>
                <div class="list-group-item" id="dob" runat="server" style="display: none">
                    <div class="form-group m-0" role="group" aria-labelledby="label-dob">
                        <div class="form-row">
                            <label id="labeldob" runat="server" for="dob" class="col-md-3 col-form-label form-label">Date of birth *</label>
                            <div class="col-md-4">
                                <asp:Label ID="lblDOB" runat="server"></asp:Label>
                                <span class="helpicon"><i id="icDoB" runat="server" class="fa fa-question-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-4">
                                <input id="txtDOB" runat="server" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="gender" runat="server" style="display: none">
                    <div class="form-group m-0" role="group" aria-labelledby="label-gender">
                        <div class="form-row">
                            <label id="labelgender" runat="server" for="gender" class="col-md-3 col-form-label form-label">Gender *</label>
                            <div class="col-md-4">
                                <asp:Label ID="lblGender" runat="server"></asp:Label>
                                <span class="helpicon"><i id="icGender" runat="server" class="fa fa-question-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-4">
                                <input id="txtGender" runat="server" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="nationality" runat="server" style="display: none">
                    <div class="form-group m-0" role="group" aria-labelledby="label-Nationality">
                        <div class="form-row">
                            <label id="labelNationality" runat="server" for="Nationality" class="col-md-3 col-form-label form-label">Nationality and citizenship</label>
                            <div class="col-md-4">
                                <asp:Label ID="lblNationality" runat="server"></asp:Label>
                                <span class="helpicon"><i id="icNationality" runat="server" class="fa fa-question-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-4">
                                <input id="txtNationality" runat="server" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>
                    </div>
                    <div class="form-group m-0" id="chineseCode" runat="server" role="group" aria-labelledby="label-chineseCommercialCode" style="display: none">
                        <div class="form-row">
                            <label id="labelChineseCode" runat="server" for="chineseCommercialCode" class="col-md-3 col-form-label form-label">Do you ever use a Chinese Commercial Code Number for your names?</label>
                            <div class="col-md-4">
                                <asp:Label ID="lblchineseCode" runat="server"></asp:Label>
                                <span class="helpicon"><i id="icchineseCode" runat="server" class="fa fa-question-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-4">
                                <input id="txtChineseCode" runat="server" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>
                    </div>

                    <div class="form-group m-0" role="group" runat="server" id="textChineseCodeDiv" style="display: none" aria-labelledby="label-chineseCodeNumber">
                        <div class="form-row">
                            <label id="lblChineseCodeNumber" runat="server" for="chineseCodeNumber" class="col-md-3 col-form-label form-label">Chinese Commercial Code Number</label>
                            <div class="col-md-4">
                                <asp:Label ID="lblChineseCodeNo" runat="server"></asp:Label>
                                <span class="helpicon"><i id="icChineseCodeNo" runat="server" class="fa fa-question-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-4">
                                <input id="txtChineseCodeNo" runat="server" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>
                    </div>

                    <div class="form-group m-0" id="russianName" runat="server" role="group" aria-labelledby="label-russianPatronymicName" style="display: none">
                        <div class="form-row">
                            <label id="labelRussianName" runat="server" for="russianPatronymicName" class="col-md-3 col-form-label form-label">In English, provide your patronymic name</label>
                            <div class="col-md-4">
                                <asp:Label ID="lblrussianName" runat="server"></asp:Label>
                                <span class="helpicon"><i id="icrussianName" runat="server" class="fa fa-question-circle" style="display: none;"></i></span>

                            </div>
                            <div class="col-md-4">
                                <input id="txtRussiaName" runat="server" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="dualNationality" runat="server" style="display: none">
                    <div class="form-group m-0" role="group" aria-labelledby="label-dualNationality">
                        <div class="form-row">
                            <label id="labelDualNationality" runat="server" for="dualNationality" class="col-md-3 col-form-label form-label">Do you have dual Citizenship?</label>
                            <div class="col-md-4">
                                <asp:Label ID="lblDualNationality" runat="server"></asp:Label>
                                <span class="helpicon"><i id="icdualNationality" runat="server" class="fa fa-question-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-4">
                                <input id="txtDualNationlity" runat="server" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="secondNation" runat="server" style="display: none">
                    <div class="form-group m-0" role="group" aria-labelledby="label-SecondNationality">
                        <div class="form-row">
                            <label id="labelSecondNation" runat="server" for="SecondNationality" class="col-md-3 col-form-label form-label">Nationality and citizenship</label>
                            <div class="col-md-4">
                                <asp:Label ID="lblOtherNation" runat="server"></asp:Label>
                                <span class="helpicon"><i id="icOtherNation" runat="server" class="fa fa-question-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-4">
                                <input id="txtOtherNation" runat="server" type="text" class="form-control" placeholder="Admin Comments">
                            </div>

                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="birthcountry" runat="server" style="display: none">
                    <div class="form-group m-0" role="group" aria-labelledby="label-birthcountry">
                        <div class="form-row">
                            <label id="labelbirthcountry" runat="server" for="birthcountry" class="col-md-3 col-form-label form-label">Country of birth</label>
                            <div class="col-md-4">
                                <asp:Label ID="lblBirthCountry" runat="server"></asp:Label>
                                <span class="helpicon"><i id="icBirthCountry" runat="server" class="fa fa-question-circle" style="display: none;"></i></span>

                            </div>
                            <div class="col-md-4">
                                <input id="txtBirthCountry" runat="server" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="marital" runat="server" style="display: none">
                    <div class="form-group m-0" role="group" aria-labelledby="label-Marital">
                        <div class="form-row">
                            <label id="labelMarital" runat="server" for="Marital" class="col-md-3 col-form-label form-label">Marital Status</label>
                            <div class="col-md-4">
                                <asp:Label ID="lblMarital" runat="server"></asp:Label>
                                <span class="helpicon"><i id="icMarital" runat="server" class="fa fa-question-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-4">
                                <input id="txtMarital" runat="server" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="statusMarried" runat="server" role="group" style="display: none">
                    <div class="form-group m-0" role="group" aria-labelledby="label-spouseName">
                        <div class="form-row">
                            <label id="lblSpouseName" runat="server" for="spouseName" class="col-md-3 col-form-label form-label">Spouse Name</label>
                            <div class="col-md-4">
                                <asp:Label ID="labelspouseName" runat="server"></asp:Label>
                                <span class="helpicon"><i id="icspouseName" runat="server" class="fa fa-question-circle" style="display: none;"></i></span>

                            </div>
                            <div class="col-md-4">
                                <input id="txtSpousename" runat="server" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="SpouseNationality" runat="server" role="group" aria-labelledby="label-NationalitySpouse">
                    <div class="form-row">
                        <label id="lblSpouseNatinality" runat="server" for="NationalitySpouse" class="col-md-3 col-form-label form-label">Nationality of Spouse</label>
                        <div class="col-md-4">
                            <asp:Label ID="lblSpouseNationality" runat="server"></asp:Label>
                            <span class="helpicon"><i id="icSpouseNationality" runat="server" class="fa fa-question-circle" style="display: none;"></i></span>

                        </div>

                        <div class="col-md-4">
                            <input id="txtSpouseNationality" runat="server" type="text" class="form-control" placeholder="Admin Comments">
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="SpouseDOB" runat="server" role="group" aria-labelledby="label-spousedob">
                    <div class="form-row">
                        <label id="lblSpouseDOB" runat="server" for="spousedob" class="col-md-3 col-form-label form-label">Spouse Date of birth</label>
                        <div class="col-md-4">
                            <asp:Label ID="labelSpouseDOB" runat="server"></asp:Label>
                            <span class="helpicon"><i id="icSpouseDob" runat="server" class="fa fa-question-circle" style="display: none;"></i></span>
                        </div>
                        <div class="col-md-4">
                            <input id="txtSpouseDOB" runat="server" type="text" class="form-control" placeholder="Admin Comments">
                        </div>
                    </div>
                </div>

                <div class="list-group-item" role="group" id="MarriageDate" runat="server" aria-labelledby="label-marriagedate">
                    <div class="form-row">
                        <label id="lblMarriageDate" runat="server" for="marriagedate" class="col-md-3 col-form-label form-label">Date of Marriage</label>
                        <div class="col-md-4">
                            <asp:Label ID="labelMarriagedate" runat="server"></asp:Label>
                            <span class="helpicon"><i id="icMarriagedate" runat="server" class="fa fa-question-circle" style="display: none;"></i></span>
                        </div>
                        <div class="col-md-4">
                            <input id="txtMarrigeDate" runat="server" type="text" class="form-control" placeholder="Admin Comments">
                        </div>
                    </div>
                </div>

                <div class="list-group-item" id="disability" runat="server" style="display: none">
                    <div class="form-group m-0" role="group" aria-labelledby="label-disability">
                        <div class="form-row">
                            <label id="labeldisability" runat="server" for="disability" class="col-md-3 col-form-label form-label">Do you have any disability, impairment, or a long term condition</label>
                            <div class="col-md-4">
                                <asp:Label ID="lblDisability" runat="server"></asp:Label>
                                <span class="helpicon"><i id="icdisability" runat="server" class="fa fa-question-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-4">
                                <input id="txtDisability" runat="server" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>
                    </div>
                </div>

                <div class="list-group-item" id="disabilitydesc" runat="server" style="display: none">
                    <div class="form-group m-0" role="group" aria-labelledby="label-disabilitydesc">
                        <div class="form-row">
                            <label id="labeldisabilitydesc" runat="server" for="disabilitydesc" class="col-md-3 col-form-label form-label">Disability Description</label>
                            <div class="col-md-4">
                                <asp:Label ID="lbldisabilitydesc" runat="server"></asp:Label>
                                <span class="helpicon"><i id="icdisabilitydescription" runat="server" class="fa fa-question-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-4">
                                <input id="txtDisabilityDescription" runat="server" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="agent" runat="server" style="display: none">
                    <div class="form-group m-0" role="group" aria-labelledby="label-agent">
                        <div class="form-row">
                            <label id="labelagent" runat="server" for="agent" class="col-md-3 col-form-label form-label">Are you reffered by Agent</label>
                            <div class="col-md-4">
                                <asp:Label ID="lblAgent" runat="server"></asp:Label>
                                <span class="helpicon"><i id="icAgent" runat="server" class="fa fa-question-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-4">
                                <input id="txtAgent" runat="server" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="agentList" runat="server" style="display: none">
                    <div class="form-group m-0" role="group" aria-labelledby="label-agentList">
                        <div class="form-row">
                            <label id="labelagentList" runat="server" for="agentList" class="col-md-3 col-form-label form-label">Agent Name</label>
                            <div class="col-md-4">
                                <asp:Label ID="lblAgentList" runat="server"></asp:Label>
                                <span class="helpicon"><i id="icAgentList" runat="server" class="fa fa-question-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-4">
                                <input id="txtAgentList" runat="server" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>
                    </div>
                </div>

                <div id="mainDiv" runat="server"></div>
                <div class="list-group-item" id="employerwebsite">
                    <div class="form-group m-0" role="group" aria-labelledby="label-employerwebsite">
                        <div class="form-row">

                            <asp:Button ID="btnSave" runat="server" Text="Save Changes" CssClass="btn btn-success" OnClick="btnSave_Click" />
                            <div class="col-md-6">
                                <asp:Label ID="lblMessage" runat="server" Visible="false"></asp:Label>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>


