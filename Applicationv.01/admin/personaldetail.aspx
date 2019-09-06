<%@ Page Language="C#" AutoEventWireup="true" CodeFile="personaldetail.aspx.cs" Inherits="admin_personaldetail" MasterPageFile="~/admin/admin.master" %>

<asp:Content ID="content1" runat="server" ContentPlaceHolderID="head">
    <title></title>
    <script>
        $(document).ready(function () {

            $('.fa-info-circle').tipso({
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
                                <asp:RadioButton ID="rblTitleYes" GroupName="Title" Text="Yes" runat="server" />
                                <asp:RadioButton ID="rblTitleNo" GroupName="Title" Text="No" runat="server" />
                                <span class="helpicon"><i id="icTitle" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-4">
                                <input type="button" value="Add Remarks" id="btnTitle" />
                                <input id="txtTitle" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
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
                                <asp:RadioButton ID="rblFirstNameYes" GroupName="FirstName" Text="Yes" runat="server" />
                                <asp:RadioButton ID="rblFirstNameNo" GroupName="FirstName" Text="No" runat="server" />
                                <span class="helpicon"><i id="icfirstname" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-4">
                                <input type="button" value="Add Remarks" id="btnFirstName" />
                                <input id="txtFirstName" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="passportsameasFirstName" runat="server" style="display: none">
                    <div class="form-group m-0" role="group" aria-labelledby="label-firstname">
                        <div class="form-row">
                            <label id="labelpassportsameasFirstName" runat="server" for="firstname" class="col-md-3 col-form-label form-label">Passport First Name same as Above </label>
                            <div class="col-md-4">
                                <asp:Label ID="lblpassportsameasFirstName" runat="server"></asp:Label>
                                <asp:RadioButton ID="rblpassportsameasFirstNameYes" GroupName="passportsameasFirstName" Text="Yes" runat="server" />
                                <asp:RadioButton ID="rblpassportsameasFirstNameNo" GroupName="passportsameasFirstName" Text="No" runat="server" />
                                <span class="helpicon"><i id="icpassportsameasFirstName" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-4">
                                <input type="button" value="Add Remarks" id="btnpassportsameasFirstName" />
                                <input id="txtpassportsameasFirstName" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
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
                                <asp:RadioButton ID="rblLastNameYes" GroupName="LastName" Text="Yes" runat="server" />
                                <asp:RadioButton ID="rblLastNameNo" GroupName="LastName" Text="No" runat="server" />
                                <span class="helpicon"><i id="iclastname" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>

                            </div>
                            <div class="col-md-4">
                                <input type="button" value="Add Remarks" id="btnLastName" />
                                <input id="txtLastName" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>

                    </div>
                </div>
                <div class="list-group-item" id="passportsameasLastName" runat="server" style="display: none">
                    <div class="form-group m-0" role="group" aria-labelledby="label-firstname">
                        <div class="form-row">
                            <label id="labelpassportsameasLastName" runat="server" for="firstname" class="col-md-3 col-form-label form-label">Passport Last Name same as Above</label>
                            <div class="col-md-4">
                                <asp:Label ID="lblpassportsameasLastName" runat="server"></asp:Label>
                                <asp:RadioButton ID="rblpassportsameasLastNameYes" GroupName="passportsameasLastName" Text="Yes" runat="server" />
                                <asp:RadioButton ID="rblpassportsameasLastNameNo" GroupName="passportsameasLastName" Text="No" runat="server" />
                                <span class="helpicon"><i id="icpassportsameasLastName" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-4">
                                <input type="button" value="Add Remarks" id="btnpassportsameasLastName" />
                                <input id="txtpassportsameasLastName" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
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
                                <asp:RadioButton ID="rblPrefferedNameYes" GroupName="PrefferedName" Text="Yes" runat="server" />
                                <asp:RadioButton ID="rblPrefferedNameNo" GroupName="PrefferedName" Text="No" runat="server" />
                                <span class="helpicon"><i id="icPreferredname" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-4">
                                <input type="button" value="Add Remarks" id="btnPrefferedName" />
                                <input id="txtPrefferedName" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
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
                                <asp:RadioButton ID="rblMiddleNameYes" GroupName="MiddleName" Text="Yes" runat="server" />
                                <asp:RadioButton ID="rblMiddleNameNo" GroupName="MiddleName" Text="No" runat="server" />
                                <span class="helpicon"><i id="icmiddlename" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-4">
                                <input type="button" value="Add Remarks" id="btnMiddleName" />
                                <input id="txtMiddleName" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>

                    </div>
                </div>
                <div class="list-group-item" id="passportsameasmiddlename" runat="server" style="display: none">
                    <div class="form-group m-0" role="group" aria-labelledby="label-firstname">
                        <div class="form-row">
                            <label id="labelpassportsameasmiddlename" runat="server" for="firstname" class="col-md-3 col-form-label form-label">Passport Middle Name same as Above</label>
                            <div class="col-md-4">
                                <asp:Label ID="lblpassportsameasmiddlename" runat="server"></asp:Label>
                                <asp:RadioButton ID="rblpassportsameasmiddlenameYes" GroupName="passportsameasmiddlename" Text="Yes" runat="server" />
                                <asp:RadioButton ID="rblpassportsameasmiddlenameNo" GroupName="passportsameasmiddlename" Text="No" runat="server" />
                                <span class="helpicon"><i id="icpassportsameasmiddlename" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-4">
                                <input type="button" value="Add Remarks" id="btnpassportsameasmiddlename" />
                                <input id="txtpassportsameasmiddlename" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
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
                                <asp:RadioButton ID="rblDOBYes" GroupName="DOB" Text="Yes" runat="server" />
                                <asp:RadioButton ID="rblDOBNo" GroupName="DOB" Text="No" runat="server" />
                                <span class="helpicon"><i id="icDoB" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-4">
                                <input type="button" value="Add Remarks" id="btnDOB" />
                                <input id="txtDOB" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
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
                                <asp:RadioButton ID="rblGenderYes" GroupName="Gender" Text="Yes" runat="server" />
                                <asp:RadioButton ID="rblGenderNo" GroupName="Gender" Text="No" runat="server" />
                                <span class="helpicon"><i id="icGender" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-4">
                                <input type="button" value="Add Remarks" id="btnGender" />
                                <input id="txtGender" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
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
                                <asp:RadioButton ID="rblNationalityYes" GroupName="Nationality" Text="Yes" runat="server" />
                                <asp:RadioButton ID="rblNationalityNo" GroupName="Nationality" Text="No" runat="server" />
                                <span class="helpicon"><i id="icNationality" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-4">
                                <input type="button" value="Add Remarks" id="btnNationality" />
                                <input id="txtNationality" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>
                    </div>
                    <div class="form-group m-0" id="chineseCode" runat="server" role="group" aria-labelledby="label-chineseCommercialCode" style="display: none">
                        <div class="form-row">
                            <label id="labelChineseCode" runat="server" for="chineseCommercialCode" class="col-md-3 col-form-label form-label">Do you ever use a Chinese Commercial Code Number for your names?</label>
                            <div class="col-md-4">
                                <asp:Label ID="lblchineseCode" runat="server"></asp:Label>
                                <asp:RadioButton ID="rblChineseCodeYes" GroupName="ChineseCode" Text="Yes" runat="server" />
                                <asp:RadioButton ID="rblChineseCodeNo" GroupName="ChineseCode" Text="No" runat="server" />
                                <span class="helpicon"><i id="icchineseCode" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-4">
                                <input type="button" value="Add Remarks" id="btnChineseCode" />
                                <input id="txtChineseCode" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>
                    </div>

                    <div class="form-group m-0" role="group" runat="server" id="textChineseCodeDiv" style="display: none" aria-labelledby="label-chineseCodeNumber">
                        <div class="form-row">
                            <label id="lblChineseCodeNumber" runat="server" for="chineseCodeNumber" class="col-md-3 col-form-label form-label">Chinese Commercial Code Number</label>
                            <div class="col-md-4">
                                <asp:Label ID="lblChineseCodeNo" runat="server"></asp:Label>
                                <asp:RadioButton ID="rblChineseCodeNoYes" GroupName="ChineseCodeNo" Text="Yes" runat="server" />
                                <asp:RadioButton ID="rblChineseCodeNoNo" GroupName="ChineseCodeNo" Text="No" runat="server" />
                                <span class="helpicon"><i id="icChineseCodeNo" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-4">
                                <input type="button" value="Add Remarks" id="btnChineseCodeNo" />
                                <input id="txtChineseCodeNo" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>
                    </div>

                    <div class="form-group m-0" id="russianName" runat="server" role="group" aria-labelledby="label-russianPatronymicName" style="display: none">
                        <div class="form-row">
                            <label id="labelRussianName" runat="server" for="russianPatronymicName" class="col-md-3 col-form-label form-label">In English, provide your patronymic name</label>
                            <div class="col-md-4">
                                <asp:Label ID="lblrussianName" runat="server"></asp:Label>
                                <asp:RadioButton ID="rblRussianNameYes" GroupName="RussianName" Text="Yes" runat="server" />
                                <asp:RadioButton ID="rblRussianNameNo" GroupName="RussianName" Text="No" runat="server" />
                                <span class="helpicon"><i id="icrussianName" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>

                            </div>
                            <div class="col-md-4">
                                <input type="button" value="Add Remarks" id="btnRussianName" />
                                <input id="txtRussiaName" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
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
                                <asp:RadioButton ID="rblDualNationalityYes" GroupName="DualNationality" Text="Yes" runat="server" />
                                <asp:RadioButton ID="rblDualNationalityNo" GroupName="DualNationality" Text="No" runat="server" />
                                <span class="helpicon"><i id="icdualNationality" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-4">
                                <input type="button" value="Add Remarks" id="btnDualNationality" />
                                <input id="txtDualNationlity" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
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
                                <asp:RadioButton ID="rblSecondNationYes" GroupName="SecondNation" Text="Yes" runat="server" />
                                <asp:RadioButton ID="rblSecondNationNo" GroupName="SecondNation" Text="No" runat="server" />
                                <span class="helpicon"><i id="icOtherNation" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-4">
                                <input type="button" value="Add Remarks" id="btnSecondNation" />
                                <input id="txtOtherNation" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
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
                                <asp:RadioButton ID="rblBirthCountryYes" GroupName="BirthCountry" Text="Yes" runat="server" />
                                <asp:RadioButton ID="rblBirthCountryNo" GroupName="BirthCountry" Text="No" runat="server" />
                                <span class="helpicon"><i id="icBirthCountry" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>

                            </div>
                            <div class="col-md-4">
                                <input type="button" value="Add Remarks" id="btnBirthCountry" />
                                <input id="txtBirthCountry" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
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
                                <asp:RadioButton ID="rblMaritalYes" GroupName="Marital" Text="Yes" runat="server" />
                                <asp:RadioButton ID="rblMaritalNo" GroupName="Marital" Text="No" runat="server" />
                                <span class="helpicon"><i id="icMarital" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-4">
                                <input type="button" value="Add Remarks" id="btnMarital" />
                                <input id="txtMarital" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
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
                                <asp:RadioButton ID="rblspouseNameYes" GroupName="spouseName" Text="Yes" runat="server" />
                                <asp:RadioButton ID="rblspouseNameNo" GroupName="spouseName" Text="No" runat="server" />
                                <span class="helpicon"><i id="icspouseName" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>

                            </div>
                            <div class="col-md-4">
                                <input type="button" value="Add Remarks" id="btnspouseName" />
                                <input id="txtSpousename" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="SpouseNationality" runat="server" role="group" aria-labelledby="label-NationalitySpouse" style="display: none">
                    <div class="form-row">
                        <label id="lblSpouseNatinality" runat="server" for="NationalitySpouse" class="col-md-3 col-form-label form-label">Nationality of Spouse</label>
                        <div class="col-md-4">
                            <asp:Label ID="lblSpouseNationality" runat="server"></asp:Label>
                            <asp:RadioButton ID="rblSpouseNatinalityYes" GroupName="SpouseNatinality" Text="Yes" runat="server" />
                            <asp:RadioButton ID="rblSpouseNatinalityNo" GroupName="SpouseNatinality" Text="No" runat="server" />
                            <span class="helpicon"><i id="icSpouseNationality" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>

                        </div>

                        <div class="col-md-4">
                            <input type="button" value="Add Remarks" id="btnSpouseNatinality" />
                            <input id="txtSpouseNationality" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="SpouseDOB" runat="server" role="group" aria-labelledby="label-spousedob" style="display: none">
                    <div class="form-row">
                        <label id="lblSpouseDOB" runat="server" for="spousedob" class="col-md-3 col-form-label form-label">Spouse Date of birth</label>
                        <div class="col-md-4">
                            <asp:Label ID="labelSpouseDOB" runat="server"></asp:Label>
                            <asp:RadioButton ID="rblSpouseDobYes" GroupName="SpouseDob" Text="Yes" runat="server" />
                            <asp:RadioButton ID="rblSpouseDobNo" GroupName="SpouseDob" Text="No" runat="server" />
                            <span class="helpicon"><i id="icSpouseDob" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                        </div>
                        <div class="col-md-4">
                            <input type="button" value="Add Remarks" id="btnSpouseDob" />
                            <input id="txtSpouseDOB" runat="server" type="text" style="display: none" class="form-control" placeholder="Admin Comments">
                        </div>
                    </div>
                </div>

                <div class="list-group-item" role="group" id="MarriageDate" runat="server" aria-labelledby="label-marriagedate" style="display: none">
                    <div class="form-row">
                        <label id="lblMarriageDate" runat="server" for="marriagedate" class="col-md-3 col-form-label form-label">Date of Marriage</label>
                        <div class="col-md-4">
                            <asp:Label ID="labelMarriagedate" runat="server"></asp:Label>
                            <asp:RadioButton ID="rblMarriagedateYes" GroupName="Marriagedate" Text="Yes" runat="server" />
                            <asp:RadioButton ID="rblMarriagedateNo" GroupName="Marriagedate" Text="No" runat="server" />
                            <span class="helpicon"><i id="icMarriagedate" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                        </div>
                        <div class="col-md-4">
                            <input type="button" value="Add Remarks" id="btnMarriagedate" />
                            <input id="txtMarrigeDate" runat="server" type="text" style="display: none" class="form-control" placeholder="Admin Comments">
                        </div>
                    </div>
                </div>

                <div class="list-group-item" id="disability" runat="server" style="display: none">
                    <div class="form-group m-0" role="group" aria-labelledby="label-disability">
                        <div class="form-row">
                            <label id="labeldisability" runat="server" for="disability" class="col-md-3 col-form-label form-label">Do you have any disability, impairment, or a long term condition</label>
                            <div class="col-md-4">
                                <asp:Label ID="lblDisability" runat="server"></asp:Label>
                                <asp:RadioButton ID="rblDisabilityYes" GroupName="Disability" Text="Yes" runat="server" />
                                <asp:RadioButton ID="rblDisabilityNo" GroupName="Disability" Text="No" runat="server" />
                                <span class="helpicon"><i id="icdisability" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-4">
                                <input type="button" value="Add Remarks" id="btnDisability" />
                                <input id="txtDisability" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
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
                                <asp:RadioButton ID="rbldisabilitydescYes" GroupName="disabilitydesc" Text="Yes" runat="server" />
                                <asp:RadioButton ID="rbldisabilitydescNo" GroupName="disabilitydesc" Text="No" runat="server" />
                                <span class="helpicon"><i id="icdisabilitydescription" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-4">
                                <input type="button" value="Add Remarks" id="btndisabilitydesc" />
                                <input id="txtDisabilityDescription" style="display: none" runat="server" type="text" class="form-control" placeholder="Admin Comments">
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
                                <asp:RadioButton ID="rblAgentYes" GroupName="Agent" Text="Yes" runat="server" />
                                <asp:RadioButton ID="rblAgentNo" GroupName="Agent" Text="No" runat="server" />
                                <span class="helpicon"><i id="icAgent" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-4">
                                <input type="button" value="Add Remarks" id="btnAgent" />
                                <input id="txtAgent" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
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
                                <asp:RadioButton ID="rblAgentListYes" GroupName="AgentList" Text="Yes" runat="server" />
                                <asp:RadioButton ID="rblAgentListNo" GroupName="AgentList" Text="No" runat="server" />
                                <span class="helpicon"><i id="icAgentList" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-4">
                                <input type="button" value="Add Remarks" id="btnAgentList" />
                                <input id="txtAgentList" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
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
    <script type="text/javascript">
        $(document).ready(function () {
              <%    for (int n = 0; n < CustomControls.Count; n++)
        {
            string btnName = "ContentPlaceHolder1_btn" + CustomControls[n].customfieldid.ToString();
            string txtName = "ContentPlaceHolder1_txt" + CustomControls[n].customfieldid.ToString();
            string rblName = "ContentPlaceHolder1_rblNo" + CustomControls[n].customfieldid.ToString();
        %>

            $("#<%=btnName%>").click(function () {
                ManageRemarks('<%=txtName%>', '<%=btnName%>');
            });
            $("#<%=rblName%>").click(function () {
                ManageRemarks('<%=txtName%>', '<%=btnName%>');
            });
            if ($('#<%=rblName%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtName%>', '<%=btnName%>');

         <%  }%>
            if ($('#<%=rblAgentListNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtAgentList.ClientID%>', 'btnAgentList');
            if ($('#<%=rblAgentNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtAgent.ClientID%>', 'btnAgent');
            if ($('#<%=rbldisabilitydescNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtDisabilityDescription.ClientID%>', 'btndisabilitydesc');
            if ($('#<%=rblDisabilityNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtDisability.ClientID%>', 'btnDisability');
            if ($('#<%=rblMarriagedateNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtMarrigeDate.ClientID%>', 'btnMarriagedate');
            if ($('#<%=rblSpouseDobNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtSpouseDOB.ClientID%>', 'btnSpouseDob');
            if ($('#<%=rblSpouseNatinalityNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtSpouseNationality.ClientID%>', 'btnSpouseNatinality');
            if ($('#<%=rblspouseNameNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtSpousename.ClientID%>', 'btnspouseName');
            if ($('#<%=rblMaritalNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtMarital.ClientID%>', 'btnMarital');
            if ($('#<%=rblBirthCountryNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtBirthCountry.ClientID%>', 'btnBirthCountry');
            if ($('#<%=rblSecondNationNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtOtherNation.ClientID%>', 'btnSecondNation');
            if ($('#<%=rblChineseCodeNoNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtDualNationlity.ClientID%>', 'btnDualNationality');
            if ($('#<%=rblSpouseNatinalityNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtRussiaName.ClientID%>', 'btnRussianName');
            if ($('#<%=rblSpouseNatinalityNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtChineseCodeNo.ClientID%>', 'btnChineseCodeNo');
            if ($('#<%=rblChineseCodeNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtChineseCode.ClientID%>', 'btnChineseCode');
            if ($('#<%=rblNationalityNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtNationality.ClientID%>', 'btnNationality');
            if ($('#<%=rblGenderNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtGender.ClientID%>', 'btnGender');
            if ($('#<%=rblDOBNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtDOB.ClientID%>', 'btnDOB');
            if ($('#<%=rblMiddleNameNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtMiddleName.ClientID%>', 'btnMiddleName');
            if ($('#<%=rblPrefferedNameNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtPrefferedName.ClientID%>', 'btnPrefferedName');
            if ($('#<%=rblLastNameNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtLastName.ClientID%>', 'btnLastName');
            if ($('#<%=rblFirstNameNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtFirstName.ClientID%>', 'btnFirstName');
            if ($('#<%=rblTitleNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtTitle.ClientID%>', 'btnTitle');
            if ($('#<%=rblpassportsameasLastNameNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtpassportsameasLastName.ClientID%>', 'btnpassportsameasLastName');
            if ($('#<%=rblpassportsameasFirstNameNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtpassportsameasFirstName.ClientID%>', 'btnpassportsameasFirstName');
            if ($('#<%=rblpassportsameasmiddlenameNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtpassportsameasmiddlename.ClientID%>', 'btnpassportsameasmiddlename');
            $("#btnAgentList").click(function () {
                ManageRemarks('<%=txtAgentList.ClientID%>', 'btnAgentList');
            });
            $("#<%=rblAgentListNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtAgentList.ClientID%>', 'btnAgentList');
            });
            $("#btnAgent").click(function () {
                ManageRemarks('<%=txtAgent.ClientID%>', 'btnAgent');
            });
            $("#<%=rblAgentNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtAgent.ClientID%>', 'btnAgent');
            });
            $("#btndisabilitydesc").click(function () {
                ManageRemarks('<%=txtDisabilityDescription.ClientID%>', 'btndisabilitydesc');
            });
            $("#<%=rbldisabilitydescNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtDisabilityDescription.ClientID%>', 'btndisabilitydesc');
            });

            $("#btnDisability").click(function () {
                ManageRemarks('<%=txtDisability.ClientID%>', 'btnDisability');
            });
            $("#<%=rblDisabilityNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtDisability.ClientID%>', 'btnDisability');
            });
            $("#btnMarriagedate").click(function () {
                ManageRemarks('<%=txtMarrigeDate.ClientID%>', 'btnMarriagedate');
            });
            $("#<%=rblMarriagedateNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtMarrigeDate.ClientID%>', 'btnMarriagedate');
            });
            $("#btnSpouseDob").click(function () {
                ManageRemarks('<%=txtSpouseDOB.ClientID%>', 'btnSpouseDob');
            });
            $("#<%=rblSpouseDobNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtSpouseDOB.ClientID%>', 'btnSpouseDob');
            });
            $("#btnSpouseNatinality").click(function () {
                ManageRemarks('<%=txtSpouseNationality.ClientID%>', 'btnSpouseNatinality');
            });
            $("#<%=rblSpouseNatinalityNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtSpouseNationality.ClientID%>', 'btnSpouseNatinality');
            });
            $("#btnspouseName").click(function () {
                ManageRemarks('<%=txtSpousename.ClientID%>', 'btnspouseName');
            });
            $("#<%=rblspouseNameNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtSpousename.ClientID%>', 'btnspouseName');
            });
            $("#btnMarital").click(function () {
                ManageRemarks('<%=txtMarital.ClientID%>', 'btnMarital');
            });
            $("#<%=rblMaritalNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtMarital.ClientID%>', 'btnMarital');
            });
            $("#btnBirthCountry").click(function () {
                ManageRemarks('<%=txtBirthCountry.ClientID%>', 'btnBirthCountry');
            });
            $("#<%=rblBirthCountryNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtBirthCountry.ClientID%>', 'btnBirthCountry');
            });
            $("#btnSecondNation").click(function () {
                ManageRemarks('<%=txtOtherNation.ClientID%>', 'btnSecondNation');
            });
            $("#<%=rblSecondNationNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtOtherNation.ClientID%>', 'btnSecondNation');
            });
            $("#btnDualNationality").click(function () {
                ManageRemarks('<%=txtDualNationlity.ClientID%>', 'btnDualNationality');
            });
            $("#<%=rblDualNationalityNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtDualNationlity.ClientID%>', 'btnDualNationality');
            });
            $("#btnRussianName").click(function () {
                ManageRemarks('<%=txtRussiaName.ClientID%>', 'btnRussianName');
            });
            $("#<%=rblRussianNameNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtRussiaName.ClientID%>', 'btnRussianName');
            });
            $("#btnChineseCodeNo").click(function () {
                ManageRemarks('<%=txtChineseCodeNo.ClientID%>', 'btnChineseCodeNo');
            });
            $("#<%=rblChineseCodeNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtChineseCodeNo.ClientID%>', 'btnChineseCodeNo');
            });
            $("#btnChineseCode").click(function () {
                ManageRemarks('<%=txtChineseCode.ClientID%>', 'btnChineseCode');
            });
            $("#<%=rblChineseCodeNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtChineseCode.ClientID%>', 'btnChineseCode');
            });
            $("#btnNationality").click(function () {
                ManageRemarks('<%=txtNationality.ClientID%>', 'btnNationality');
            });
            $("#<%=rblNationalityNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtNationality.ClientID%>', 'btnNationality');
            });
            $("#btnGender").click(function () {
                ManageRemarks('<%=txtGender.ClientID%>', 'btnGender');
            });
            $("#<%=rblGenderNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtGender.ClientID%>', 'btnGender');
            });


            $("#btnDOB").click(function () {
                ManageRemarks('<%=txtDOB.ClientID%>', 'btnDOB');
            });
            $("#<%=rblDOBNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtDOB.ClientID%>', 'btnDOB');
            });
            $("#btnMiddleName").click(function () {
                ManageRemarks('<%=txtMiddleName.ClientID%>', 'btnMiddleName');
            });
            $("#<%=rblMiddleNameNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtMiddleName.ClientID%>', 'btnMiddleName');
            });
            $("#btnPrefferedName").click(function () {
                ManageRemarks('<%=txtPrefferedName.ClientID%>', 'btnPrefferedName');
            });
            $("#<%=rblPrefferedNameNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtPrefferedName.ClientID%>', 'btnPrefferedName');
            });
            $("#btnLastName").click(function () {
                ManageRemarks('<%=txtLastName.ClientID%>', 'btnLastName');
            });
            $("#<%=rblLastNameNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtLastName.ClientID%>', 'btnLastName');
            });
            $("#btnFirstName").click(function () {
                ManageRemarks('<%=txtFirstName.ClientID%>', 'btnFirstName');
            });
            $("#<%=rblFirstNameNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtFirstName.ClientID%>', 'btnFirstName');
            });
            $("#btnTitle").click(function () {
                ManageRemarks('<%=txtTitle.ClientID%>', 'btnTitle');
            });
            $("#<%=rblTitleNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtTitle.ClientID%>', 'btnTitle');
            });
            $("#btnpassportsameasFirstName").click(function () {
                ManageRemarks('<%=txtpassportsameasFirstName.ClientID%>', 'btnpassportsameasFirstName');
            });
            $("#<%=rblpassportsameasFirstNameNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtpassportsameasFirstName.ClientID%>', 'btnpassportsameasFirstName');
            });
            $("#btnpassportsameasmiddlename").click(function () {
                ManageRemarks('<%=txtpassportsameasmiddlename.ClientID%>', 'btnpassportsameasmiddlename');
            });
            $("#<%=rblpassportsameasmiddlenameNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtpassportsameasmiddlename.ClientID%>', 'btnpassportsameasmiddlename');
            });
            $("#btnpassportsameasLastName").click(function () {
                ManageRemarks('<%=txtpassportsameasLastName.ClientID%>', 'btnpassportsameasLastName');
            });
            $("#<%=rblpassportsameasLastNameNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtpassportsameasLastName.ClientID%>', 'btnpassportsameasLastName');
            });
            function ManageRemarks(cntrol1, control2) {
                if ($("#" + cntrol1 + "").is(':hidden')) {
                    $("#" + cntrol1 + "").css('display', 'block');
                    $("#" + control2 + "").prop('value', 'Hide Comments');
                    // $("#btnTwitter").html("Hide Comments");
                }
                else {
                    $("#" + cntrol1 + "").css('display', 'none');
                    // $("#btnTwitter").html("Add Comments")
                    $("#" + control2 + "").prop('value', 'Add Comments');
                }
            }
            function ManageRemarksIfNoCheked(cntrol, control2) {
                $("#" + cntrol + "").css('display', 'block');
                $("#" + control2 + "").prop('value', 'Hide Comments');
            }
        });</script>
</asp:Content>


