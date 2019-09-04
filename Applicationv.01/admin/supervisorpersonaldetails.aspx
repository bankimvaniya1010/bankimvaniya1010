<%@ Page Language="C#" AutoEventWireup="true" CodeFile="supervisorpersonaldetails.aspx.cs" Inherits="admin_supervisorpersonaldetails" MasterPageFile="~/admin/admin.master" %>

<asp:Content ID="content1" runat="server" ContentPlaceHolderID="head">
    <title></title>

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
                            </div>
                            <div class="col-md-4">
                                <asp:RadioButton ID="rblTitleYes" GroupName="Title" Text="Yes" runat="server" />
                                <asp:RadioButton ID="rblTitleNo" GroupName="Title" Text="No" runat="server" />
                                <asp:Label ID="lblTitleComments" runat="server"></asp:Label>
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
                            </div>
                            <div class="col-md-4">
                                <asp:RadioButton ID="rblFirstNameYes" GroupName="FirstName" Text="Yes" runat="server" />
                                <asp:RadioButton ID="rblFirstNameNo" GroupName="FirstName" Text="No" runat="server" />
                                <asp:Label ID="lblFirstNameComments" runat="server"></asp:Label>
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

                            </div>
                            <div class="col-md-4">
                                <asp:RadioButton ID="rblLastNameYes" GroupName="LastName" Text="Yes" runat="server" />
                                <asp:RadioButton ID="rblLastNameNo" GroupName="LastName" Text="No" runat="server" />
                                <asp:Label ID="lblLastNameComments" runat="server"></asp:Label>
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
                            </div>
                            <div class="col-md-4">
                                <asp:RadioButton ID="rblPrefferedNameYes" GroupName="PrefferedName" Text="Yes" runat="server" />
                                <asp:RadioButton ID="rblPrefferedNameNo" GroupName="PrefferedName" Text="No" runat="server" />
                                <asp:Label ID="lblPrefferedNameComments" runat="server"></asp:Label>
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
                            </div>
                            <div class="col-md-4">
                                <asp:RadioButton ID="rblMiddleNameYes" GroupName="MiddleName" Text="Yes" runat="server" />
                                <asp:RadioButton ID="rblMiddleNameNo" GroupName="MiddleName" Text="No" runat="server" />
                                <asp:Label ID="lblMiddleNameComments" runat="server"></asp:Label>
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
                            </div>
                            <div class="col-md-4">
                                <asp:RadioButton ID="rblDOBYes" GroupName="DOB" Text="Yes" runat="server" />
                                <asp:RadioButton ID="rblDOBNo" GroupName="DOB" Text="No" runat="server" />
                                <asp:Label ID="lblDOBComments" runat="server"></asp:Label>
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
                            </div>
                            <div class="col-md-4">
                                <asp:RadioButton ID="rblGenderYes" GroupName="Gender" Text="Yes" runat="server" />
                                <asp:RadioButton ID="rblGenderNo" GroupName="Gender" Text="No" runat="server" />
                                <asp:Label ID="lblGenderComments" runat="server"></asp:Label>
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
                            </div>
                            <div class="col-md-4">
                                <asp:RadioButton ID="rblNationalityYes" GroupName="Nationality" Text="Yes" runat="server" />
                                <asp:RadioButton ID="rblNationalityNo" GroupName="Nationality" Text="No" runat="server" />
                                <asp:Label ID="lblNationalityComments" runat="server"></asp:Label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group m-0" id="chineseCode" runat="server" role="group" aria-labelledby="label-chineseCommercialCode" style="display: none">
                        <div class="form-row">
                            <label id="labelChineseCode" runat="server" for="chineseCommercialCode" class="col-md-3 col-form-label form-label">Do you ever use a Chinese Commercial Code Number for your names?</label>
                            <div class="col-md-4">
                                <asp:Label ID="lblchineseCode" runat="server"></asp:Label>
                            </div>
                            <div class="col-md-4">
                                <asp:RadioButton ID="rblChineseCodeYes" GroupName="ChineseCode" Text="Yes" runat="server" />
                                <asp:RadioButton ID="rblChineseCodeNo" GroupName="ChineseCode" Text="No" runat="server" />
                                <asp:Label ID="lblchineseCodeComments" runat="server"></asp:Label>
                            </div>
                        </div>
                    </div>

                    <div class="form-group m-0" role="group" runat="server" id="textChineseCodeDiv" style="display: none" aria-labelledby="label-chineseCodeNumber">
                        <div class="form-row">
                            <label id="lblChineseCodeNumber" runat="server" for="chineseCodeNumber" class="col-md-3 col-form-label form-label">Chinese Commercial Code Number</label>
                            <div class="col-md-4">
                                <asp:Label ID="lblChineseCodeNo" runat="server"></asp:Label>
                            </div>
                            <div class="col-md-4">
                                <asp:RadioButton ID="rblChineseCodeNoYes" GroupName="ChineseCodeNo" Text="Yes" runat="server" />
                                <asp:RadioButton ID="rblChineseCodeNoNo" GroupName="ChineseCodeNo" Text="No" runat="server" />
                                <asp:Label ID="lblChineseCodeNoComments" runat="server"></asp:Label>
                            </div>
                        </div>
                    </div>

                    <div class="form-group m-0" id="russianName" runat="server" role="group" aria-labelledby="label-russianPatronymicName" style="display: none">
                        <div class="form-row">
                            <label id="labelRussianName" runat="server" for="russianPatronymicName" class="col-md-3 col-form-label form-label">In English, provide your patronymic name</label>
                            <div class="col-md-4">
                                <asp:Label ID="lblrussianName" runat="server"></asp:Label>

                            </div>
                            <div class="col-md-4">
                                <asp:RadioButton ID="rblRussianNameYes" GroupName="RussianName" Text="Yes" runat="server" />
                                <asp:RadioButton ID="rblRussianNameNo" GroupName="RussianName" Text="No" runat="server" />
                                <asp:Label ID="lblrussianNameComments" runat="server"></asp:Label>
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
                            </div>
                            <div class="col-md-4">
                                <asp:RadioButton ID="rblDualNationalityYes" GroupName="DualNationality" Text="Yes" runat="server" />
                                <asp:RadioButton ID="rblDualNationalityNo" GroupName="DualNationality" Text="No" runat="server" />
                                <asp:Label ID="lblDualNationalityComments" runat="server"></asp:Label>
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
                            </div>
                            <div class="col-md-4">
                                <asp:RadioButton ID="rblSecondNationYes" GroupName="SecondNation" Text="Yes" runat="server" />
                                <asp:RadioButton ID="rblSecondNationNo" GroupName="SecondNation" Text="No" runat="server" />
                                <asp:Label ID="lblOtherNationComments" runat="server"></asp:Label>
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
                            </div>
                            <div class="col-md-4">
                                <asp:RadioButton ID="rblBirthCountryYes" GroupName="BirthCountry" Text="Yes" runat="server" />
                                <asp:RadioButton ID="rblBirthCountryNo" GroupName="BirthCountry" Text="No" runat="server" />
                                <asp:Label ID="lblBirthCountryComments" runat="server"></asp:Label>
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
                            </div>
                            <div class="col-md-4">
                                <asp:RadioButton ID="rblMaritalYes" GroupName="Marital" Text="Yes" runat="server" />
                                <asp:RadioButton ID="rblMaritalNo" GroupName="Marital" Text="No" runat="server" />
                                <asp:Label ID="lblMaritalComments" runat="server"></asp:Label>
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
                            </div>
                            <div class="col-md-4">
                                <asp:RadioButton ID="rblspouseNameYes" GroupName="spouseName" Text="Yes" runat="server" />
                                <asp:RadioButton ID="rblspouseNameNo" GroupName="spouseName" Text="No" runat="server" />
                                <asp:Label ID="labelspouseNameComments" runat="server"></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="SpouseNationality" runat="server" role="group" aria-labelledby="label-NationalitySpouse" style="display: none">
                    <div class="form-row">
                        <label id="lblSpouseNatinality" runat="server" for="NationalitySpouse" class="col-md-3 col-form-label form-label">Nationality of Spouse</label>
                        <div class="col-md-4">
                            <asp:Label ID="lblSpouseNationality" runat="server"></asp:Label>
                        </div>

                        <div class="col-md-4">
                            <asp:RadioButton ID="rblSpouseNatinalityYes" GroupName="SpouseNatinality" Text="Yes" runat="server" />
                            <asp:RadioButton ID="rblSpouseNatinalityNo" GroupName="SpouseNatinality" Text="No" runat="server" />
                            <asp:Label ID="lblSpouseNationalityComments" runat="server"></asp:Label>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="SpouseDOB" runat="server" role="group" aria-labelledby="label-spousedob" style="display: none">
                    <div class="form-row">
                        <label id="lblSpouseDOB" runat="server" for="spousedob" class="col-md-3 col-form-label form-label">Spouse Date of birth</label>
                        <div class="col-md-4">
                            <asp:Label ID="labelSpouseDOB" runat="server"></asp:Label>
                        </div>
                        <div class="col-md-4">
                            <asp:RadioButton ID="rblSpouseDobYes" GroupName="SpouseDob" Text="Yes" runat="server" />
                            <asp:RadioButton ID="rblSpouseDobNo" GroupName="SpouseDob" Text="No" runat="server" />
                            <asp:Label ID="labelSpouseDOBComments" runat="server"></asp:Label>
                        </div>
                    </div>
                </div>

                <div class="list-group-item" role="group" id="MarriageDate" runat="server" aria-labelledby="label-marriagedate" style="display: none">
                    <div class="form-row">
                        <label id="lblMarriageDate" runat="server" for="marriagedate" class="col-md-3 col-form-label form-label">Date of Marriage</label>
                        <div class="col-md-4">
                            <asp:Label ID="labelMarriagedate" runat="server"></asp:Label>
                        </div>
                        <div class="col-md-4">
                            <asp:RadioButton ID="rblMarriagedateYes" GroupName="Marriagedate" Text="Yes" runat="server" />
                            <asp:RadioButton ID="rblMarriagedateNo" GroupName="Marriagedate" Text="No" runat="server" />
                            <asp:Label ID="labelMarriagedateComments" runat="server"></asp:Label>
                        </div>
                    </div>
                </div>

                <div class="list-group-item" id="disability" runat="server" style="display: none">
                    <div class="form-group m-0" role="group" aria-labelledby="label-disability">
                        <div class="form-row">
                            <label id="labeldisability" runat="server" for="disability" class="col-md-3 col-form-label form-label">Do you have any disability, impairment, or a long term condition</label>
                            <div class="col-md-4">
                                <asp:Label ID="lblDisability" runat="server"></asp:Label>
                            </div>
                            <div class="col-md-4">
                                <asp:RadioButton ID="rblDisabilityYes" GroupName="Disability" Text="Yes" runat="server" />
                                <asp:RadioButton ID="rblDisabilityNo" GroupName="Disability" Text="No" runat="server" />
                                <asp:Label ID="lblDisabilityComments" runat="server"></asp:Label>
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
                            </div>
                            <div class="col-md-4">
                                <asp:RadioButton ID="rbldisabilitydescYes" GroupName="disabilitydesc" Text="Yes" runat="server" />
                                <asp:RadioButton ID="rbldisabilitydescNo" GroupName="disabilitydesc" Text="No" runat="server" />
                                <asp:Label ID="lbldisabilitydescComments" runat="server"></asp:Label>
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
                            </div>
                            <div class="col-md-4">
                                <asp:RadioButton ID="rblAgentYes" GroupName="Agent" Text="Yes" runat="server" />
                                <asp:RadioButton ID="rblAgentNo" GroupName="Agent" Text="No" runat="server" />
                                <asp:Label ID="lblAgentComments" runat="server"></asp:Label>
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
                            </div>
                            <div class="col-md-4">
                                <asp:RadioButton ID="rblAgentListYes" GroupName="AgentList" Text="Yes" runat="server" />
                                <asp:RadioButton ID="rblAgentListNo" GroupName="AgentList" Text="No" runat="server" />
                                <asp:Label ID="lblAgentListComments" runat="server"></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="mainDiv" runat="server"></div>
                <div class="list-group-item">
                    <div class="form-group m-0" role="group" aria-labelledby="label-agentList">
                        <div class="form-row">
                            <label for="agentList" class="col-md-3 col-form-label form-label">Superviosr Action</label>
                            <div class="col-md-4">
                                <input type="radio" id="rbApproved" runat="server" name="supervisorAction">
                                Approved
                                <input type="radio" id="rbDenied" runat="server" name="supervisorAction">Further Review</input>
                            </div>
                            <div class="col-md-4">
                                <asp:TextBox ID="txtComments" TextMode="MultiLine" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                </div>

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


