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
                            <label runat="server" id="labeltitle" for="title" class="col-md-2 col-form-label form-label">* Title</label>
                            <div class="col-md-6">
                                <div class="prdtl-ans">
                                    <asp:Label ID="lblTitle" runat="server"></asp:Label></div>                                
                                <div class="prdtl-vrfy">
                                    <asp:RadioButton ID="rblTitleYes" GroupName="Title" Text="Yes" runat="server" Checked="true" />
                                    <asp:RadioButton ID="rblTitleNo" GroupName="Title" Text="No" runat="server" />
                                </div>
                                <span class="helpicon"><i id="icTitle" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-3">
                                <input type="button" value="Add Remarks" id="btnTitle" />
                                <input id="txtTitle" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="firstname" runat="server" style="display: none">
                    <div class="form-group m-0" role="group" aria-labelledby="label-firstname">
                        <div class="form-row">
                            <label id="labelfirstname" runat="server" for="firstname" class="col-md-2 col-form-label form-label">First Name *</label>
                            <div class="col-md-6">
                                <div class="prdtl-ans">
                                    <asp:Label ID="lblFirstName" runat="server"></asp:Label>
                                </div>
                                <div class="prdtl-vrfy">
                                    <asp:RadioButton ID="rblFirstNameYes" GroupName="FirstName" Text="Yes" runat="server" Checked="true"/>
                                    <asp:RadioButton ID="rblFirstNameNo" GroupName="FirstName" Text="No" runat="server" />
                                </div>
                                <span class="helpicon"><i id="icfirstname" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-3">
                                <input type="button" value="Add Remarks" id="btnFirstName" />
                                <input id="txtFirstName" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="passportsameasFirstName" runat="server" style="display: none">
                    <div class="form-group m-0" role="group" aria-labelledby="label-firstname">
                        <div class="form-row">
                            <label id="labelpassportsameasFirstName" runat="server" for="firstname" class="col-md-2 col-form-label form-label">Passport First Name same as Above </label>
                            <div class="col-md-6">
                                <div class="prdtl-ans">
                                    <asp:Label ID="lblpassportsameasFirstName" runat="server"></asp:Label>
                                </div>
                                <div class="prdtl-vrfy">
                                    <asp:RadioButton ID="rblpassportsameasFirstNameYes" GroupName="passportsameasFirstName" Text="Yes" runat="server" Checked="true" />
                                    <asp:RadioButton ID="rblpassportsameasFirstNameNo" GroupName="passportsameasFirstName" Text="No" runat="server" />
                                </div>
                                <span class="helpicon"><i id="icpassportsameasFirstName" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-3">
                                <input type="button" value="Add Remarks" id="btnpassportsameasFirstName" />
                                <input id="txtpassportsameasFirstName" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="lastname" runat="server" style="display: none">
                    <div class="form-group m-0" role="group" aria-labelledby="label-lastname">
                        <div class="form-row">
                            <label id="labellastname" runat="server" for="lastname" class="col-md-2 col-form-label form-label">Family Name *</label>
                            <div class="col-md-6">
                                <div class="prdtl-ans">
                                    <asp:Label ID="lblLastName" runat="server"></asp:Label>
                                </div>
                                <div class="prdtl-vrfy">
                                    <asp:RadioButton ID="rblLastNameYes" GroupName="LastName" Text="Yes" runat="server" Checked="true"/>
                                    <asp:RadioButton ID="rblLastNameNo" GroupName="LastName" Text="No" runat="server" />
                                </div>
                                <span class="helpicon"><i id="iclastname" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>

                            </div>
                            <div class="col-md-3">
                                <input type="button" value="Add Remarks" id="btnLastName" />
                                <input id="txtLastName" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>

                    </div>
                </div>
                <div class="list-group-item" id="passportsameasLastName" runat="server" style="display: none">
                    <div class="form-group m-0" role="group" aria-labelledby="label-firstname">
                        <div class="form-row">
                            <label id="labelpassportsameasLastName" runat="server" for="firstname" class="col-md-2 col-form-label form-label">Passport Family Name same as Above</label>
                            <div class="col-md-6">
                                <div class="prdtl-ans">
                                    <asp:Label ID="lblpassportsameasLastName" runat="server"></asp:Label>
                                </div>
                                <div class="prdtl-vrfy">
                                    <asp:RadioButton ID="rblpassportsameasLastNameYes" GroupName="passportsameasLastName" Text="Yes" runat="server" Checked="true"/>
                                    <asp:RadioButton ID="rblpassportsameasLastNameNo" GroupName="passportsameasLastName" Text="No" runat="server" />
                                </div>
                                <span class="helpicon"><i id="icpassportsameasLastName" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-3">
                                <input type="button" value="Add Remarks" id="btnpassportsameasLastName" />
                                <input id="txtpassportsameasLastName" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                         </div>
                     </div>
                 </div>
                <div class="list-group-item" id="preferedname" runat="server" style="display: none">
                    <div class="form-group m-0" role="group" aria-labelledby="label-preferreName">
                        <div class="form-row">
                            <label id="labelpreferreName" runat="server" for="preferreName" class="col-md-2 col-form-label form-label">Preferred Name</label>
                            <div class="col-md-6">
                                <div class="prdtl-ans">
                                    <asp:Label ID="lblPrefferedName" runat="server"></asp:Label>
                                </div>
                                <div class="prdtl-vrfy">
                                    <asp:RadioButton ID="rblPrefferedNameYes" GroupName="PrefferedName" Text="Yes" runat="server" Checked="true"/>
                                    <asp:RadioButton ID="rblPrefferedNameNo" GroupName="PrefferedName" Text="No" runat="server" />
                                </div>
                                <span class="helpicon"><i id="icPreferredname" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-3">
                                <input type="button" value="Add Remarks" id="btnPrefferedName" />
                                <input id="txtPrefferedName" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="middlename" runat="server" style="display: none">
                    <div class="form-group m-0" role="group" aria-labelledby="label-middlename">
                        <div class="form-row">
                            <label id="labelmiddlename" runat="server" for="middlename" class="col-md-2 col-form-label form-label">Middle Name(s)</label>
                            <div class="col-md-6">
                                <div class="prdtl-ans">
                                    <asp:Label ID="lblMiddleName" runat="server"></asp:Label>
                                </div>
                                <div class="prdtl-vrfy">
                                    <asp:RadioButton ID="rblMiddleNameYes" GroupName="MiddleName" Text="Yes" runat="server" Checked="true"/>
                                    <asp:RadioButton ID="rblMiddleNameNo" GroupName="MiddleName" Text="No" runat="server" />
                                </div>
                                <span class="helpicon"><i id="icmiddlename" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-3">
                                <input type="button" value="Add Remarks" id="btnMiddleName" />
                                <input id="txtMiddleName" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>

                    </div>
                </div>
                <div class="list-group-item" id="passportsameasmiddlename" runat="server" style="display: none">
                    <div class="form-group m-0" role="group" aria-labelledby="label-firstname">
                        <div class="form-row">
                            <label id="labelpassportsameasmiddlename" runat="server" for="firstname" class="col-md-2 col-form-label form-label">Passport Middle Name same as Above</label>
                            <div class="col-md-6">
                                <div class="prdtl-ans">
                                    <asp:Label ID="lblpassportsameasmiddlename" runat="server"></asp:Label>
                                </div>
                                <div class="prdtl-vrfy">
                                    <asp:RadioButton ID="rblpassportsameasmiddlenameYes" GroupName="passportsameasmiddlename" Text="Yes" runat="server" Checked="true"/>
                                    <asp:RadioButton ID="rblpassportsameasmiddlenameNo" GroupName="passportsameasmiddlename" Text="No" runat="server" />
                                </div>
                                <span class="helpicon"><i id="icpassportsameasmiddlename" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-3">
                                <input type="button" value="Add Remarks" id="btnpassportsameasmiddlename" />
                                <input id="txtpassportsameasmiddlename" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="dob" runat="server" style="display: none">
                    <div class="form-group m-0" role="group" aria-labelledby="label-dob">
                        <div class="form-row">
                            <label id="labeldob" runat="server" for="dob" class="col-md-2 col-form-label form-label">Date of birth *</label>
                            <div class="col-md-6">
                                <div class="prdtl-ans">
                                    <asp:Label ID="lblDOB" runat="server"></asp:Label>
                                </div>
                                <div class="prdtl-vrfy">
                                    <asp:RadioButton ID="rblDOBYes" GroupName="DOB" Text="Yes" runat="server" Checked="true"/>
                                    <asp:RadioButton ID="rblDOBNo" GroupName="DOB" Text="No" runat="server" />
                                </div>
                                <span class="helpicon"><i id="icDoB" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-3">
                                <input type="button" value="Add Remarks" id="btnDOB" />
                                <input id="txtDOB" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="gender" runat="server" style="display: none">
                    <div class="form-group m-0" role="group" aria-labelledby="label-gender">
                        <div class="form-row">
                            <label id="labelgender" runat="server" for="gender" class="col-md-2 col-form-label form-label">Gender *</label>
                            <div class="col-md-6">
                                <div class="prdtl-ans">
                                    <asp:Label ID="lblGender" runat="server"></asp:Label>
                                </div>
                                <div class="prdtl-vrfy">
                                    <asp:RadioButton ID="rblGenderYes" GroupName="Gender" Text="Yes" runat="server" Checked="true"/>
                                    <asp:RadioButton ID="rblGenderNo" GroupName="Gender" Text="No" runat="server" />
                                </div>
                                <span class="helpicon"><i id="icGender" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-3">
                                <input type="button" value="Add Remarks" id="btnGender" />
                                <input id="txtGender" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="nationality" runat="server" style="display: none">
                    <div class="form-group m-0" role="group" aria-labelledby="label-Nationality">
                        <div class="form-row">
                            <label id="labelNationality" runat="server" for="Nationality" class="col-md-2 col-form-label form-label">Citizenship</label>
                            <div class="col-md-6">
                                <div class="prdtl-ans">
                                    <asp:Label ID="lblNationality" runat="server"></asp:Label>
                                 </div>
                                <div class="prdtl-vrfy">
                                    <asp:RadioButton ID="rblNationalityYes" GroupName="Nationality" Text="Yes" runat="server" Checked="true"/>
                                    <asp:RadioButton ID="rblNationalityNo" GroupName="Nationality" Text="No" runat="server" />
                                </div>
                                <span class="helpicon"><i id="icNationality" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-3">
                                <input type="button" value="Add Remarks" id="btnNationality" />
                                <input id="txtNationality" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>
                    </div>
                    <div class="form-group m-0" id="chineseCode" runat="server" role="group" aria-labelledby="label-chineseCommercialCode" style="display: none">
                        <div class="form-row">
                            <label id="labelChineseCode" runat="server" for="chineseCommercialCode" class="col-md-2 col-form-label form-label">Do you ever use a Chinese Commercial Code Number for your names?</label>
                            <div class="col-md-6">
                                <div class="prdtl-ans">
                                    <asp:Label ID="lblchineseCode" runat="server"></asp:Label>
                                </div>
                                <div class="prdtl-vrfy">
                                    <asp:RadioButton ID="rblChineseCodeYes" GroupName="ChineseCode" Text="Yes" runat="server" Checked="true"/>
                                    <asp:RadioButton ID="rblChineseCodeNo" GroupName="ChineseCode" Text="No" runat="server" />
                                </div>
                                <span class="helpicon"><i id="icchineseCode" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-3">
                                <input type="button" value="Add Remarks" id="btnChineseCode" />
                                <input id="txtChineseCode" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>
                    </div>

                    <div class="form-group m-0" role="group" runat="server" id="textChineseCodeDiv" style="display: none" aria-labelledby="label-chineseCodeNumber">
                        <div class="form-row">
                            <label id="lblChineseCodeNumber" runat="server" for="chineseCodeNumber" class="col-md-2 col-form-label form-label">Chinese Commercial Code Number</label>
                            <div class="col-md-6">
                                <div class="prdtl-ans">
                                    <asp:Label ID="lblChineseCodeNo" runat="server"></asp:Label>
                                </div>
                                <div class="prdtl-vrfy">
                                    <asp:RadioButton ID="rblChineseCodeNoYes" GroupName="ChineseCodeNo" Text="Yes" runat="server" Checked="true"/>
                                    <asp:RadioButton ID="rblChineseCodeNoNo" GroupName="ChineseCodeNo" Text="No" runat="server" />
                                </div>
                                <span class="helpicon"><i id="icChineseCodeNo" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-3">
                                <input type="button" value="Add Remarks" id="btnChineseCodeNo" />
                                <input id="txtChineseCodeNo" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>
                    </div>

                    <div class="form-group m-0" id="russianName" runat="server" role="group" aria-labelledby="label-russianPatronymicName" style="display: none">
                        <div class="form-row">
                            <label id="labelRussianName" runat="server" for="russianPatronymicName" class="col-md-2 col-form-label form-label">In English, provide your patronymic name</label>
                            <div class="col-md-6">
                                <div class="prdtl-ans">
                                    <asp:Label ID="lblrussianName" runat="server"></asp:Label>
                                </div>
                                <div class="prdtl-vrfy">
                                    <asp:RadioButton ID="rblRussianNameYes" GroupName="RussianName" Text="Yes" runat="server" Checked="true"/>
                                    <asp:RadioButton ID="rblRussianNameNo" GroupName="RussianName" Text="No" runat="server" />
                                </div>
                                <span class="helpicon"><i id="icrussianName" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>

                            </div>
                            <div class="col-md-3">
                                <input type="button" value="Add Remarks" id="btnRussianName" />
                                <input id="txtRussiaName" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="dualNationality" runat="server" style="display: none">
                    <div class="form-group m-0" role="group" aria-labelledby="label-dualNationality">
                        <div class="form-row">
                            <label id="labelDualNationality" runat="server" for="dualNationality" class="col-md-2 col-form-label form-label">Do you have dual Citizenship?</label>
                            <div class="col-md-6">
                                <div class="prdtl-ans">
                                    <asp:Label ID="lblDualNationality" runat="server"></asp:Label>
                                </div>
                                <div class="prdtl-vrfy">
                                    <asp:RadioButton ID="rblDualNationalityYes" GroupName="DualNationality" Text="Yes" runat="server" Checked="true"/>
                                    <asp:RadioButton ID="rblDualNationalityNo" GroupName="DualNationality" Text="No" runat="server" />
                                </div>
                                <span class="helpicon"><i id="icdualNationality" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-3">
                                <input type="button" value="Add Remarks" id="btnDualNationality" />
                                <input id="txtDualNationlity" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="secondNation" runat="server" style="display: none">
                    <div class="form-group m-0" role="group" aria-labelledby="label-SecondNationality">
                        <div class="form-row">
                            <label id="labelSecondNation" runat="server" for="SecondNationality" class="col-md-2 col-form-label form-label">Citizenship</label>
                            <div class="col-md-6">
                                <div class="prdtl-ans">
                                    <asp:Label ID="lblOtherNation" runat="server"></asp:Label>
                                </div>
                                <div class="prdtl-vrfy">
                                    <asp:RadioButton ID="rblSecondNationYes" GroupName="SecondNation" Text="Yes" runat="server" Checked="true"/>
                                    <asp:RadioButton ID="rblSecondNationNo" GroupName="SecondNation" Text="No" runat="server" />
                                </div>
                                <span class="helpicon"><i id="icOtherNation" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-3">
                                <input type="button" value="Add Remarks" id="btnSecondNation" />
                                <input id="txtOtherNation" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                            </div>

                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="birthcountry" runat="server" style="display: none">
                    <div class="form-group m-0" role="group" aria-labelledby="label-birthcountry">
                        <div class="form-row">
                            <label id="labelbirthcountry" runat="server" for="birthcountry" class="col-md-2 col-form-label form-label">Country of birth</label>
                            <div class="col-md-6">
                                <div class="prdtl-ans">
                                    <asp:Label ID="lblBirthCountry" runat="server"></asp:Label>
                                </div>
                                <div class="prdtl-vrfy">
                                    <asp:RadioButton ID="rblBirthCountryYes" GroupName="BirthCountry" Text="Yes" runat="server" Checked="true"/>
                                    <asp:RadioButton ID="rblBirthCountryNo" GroupName="BirthCountry" Text="No" runat="server" />
                                </div>
                                <span class="helpicon"><i id="icBirthCountry" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>

                            </div>
                            <div class="col-md-3">
                                <input type="button" value="Add Remarks" id="btnBirthCountry" />
                                <input id="txtBirthCountry" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="marital" runat="server" style="display: none">
                    <div class="form-group m-0" role="group" aria-labelledby="label-Marital">
                        <div class="form-row">
                            <label id="labelMarital" runat="server" for="Marital" class="col-md-2 col-form-label form-label">Marital Status</label>
                            <div class="col-md-6">
                                <div class="prdtl-ans">
                                    <asp:Label ID="lblMarital" runat="server"></asp:Label>
                                </div>
                                <div class="prdtl-vrfy">
                                    <asp:RadioButton ID="rblMaritalYes" GroupName="Marital" Text="Yes" runat="server" Checked="true"/>
                                    <asp:RadioButton ID="rblMaritalNo" GroupName="Marital" Text="No" runat="server" />
                                </div>
                                <span class="helpicon"><i id="icMarital" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-3">
                                <input type="button" value="Add Remarks" id="btnMarital" />
                                <input id="txtMarital" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="statusMarried" runat="server" role="group" style="display: none">
                    <div class="form-group m-0" role="group" aria-labelledby="label-spouseName">
                        <div class="form-row">
                            <label id="lblSpouseName" runat="server" for="spouseName" class="col-md-2 col-form-label form-label">Spouse Name</label>
                            <div class="col-md-6">
                                <div class="prdtl-ans">
                                    <asp:Label ID="labelspouseName" runat="server"></asp:Label>
                                </div>
                                <div class="prdtl-vrfy">
                                    <asp:RadioButton ID="rblspouseNameYes" GroupName="spouseName" Text="Yes" runat="server" Checked="true"/>
                                    <asp:RadioButton ID="rblspouseNameNo" GroupName="spouseName" Text="No" runat="server" />
                                </div>
                                <span class="helpicon"><i id="icspouseName" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>

                            </div>
                            <div class="col-md-3">
                                <input type="button" value="Add Remarks" id="btnspouseName" />
                                <input id="txtSpousename" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="SpouseNationality" runat="server" role="group" aria-labelledby="label-NationalitySpouse" style="display: none">
                    <div class="form-row">
                        <label id="lblSpouseNatinality" runat="server" for="NationalitySpouse" class="col-md-2 col-form-label form-label">Nationality of Spouse</label>
                        <div class="col-md-6">
                            <div class="prdtl-ans">
                                <asp:Label ID="lblSpouseNationality" runat="server"></asp:Label>
                            </div>
                            <div class="prdtl-vrfy">
                                <asp:RadioButton ID="rblSpouseNatinalityYes" GroupName="SpouseNatinality" Text="Yes" runat="server" Checked="true"/>
                                <asp:RadioButton ID="rblSpouseNatinalityNo" GroupName="SpouseNatinality" Text="No" runat="server" />
                            </div>
                            <span class="helpicon"><i id="icSpouseNationality" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>

                        </div>

                        <div class="col-md-3">
                            <input type="button" value="Add Remarks" id="btnSpouseNatinality" />
                            <input id="txtSpouseNationality" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="SpouseDOB" runat="server" role="group" aria-labelledby="label-spousedob" style="display: none">
                    <div class="form-row">
                        <label id="lblSpouseDOB" runat="server" for="spousedob" class="col-md-2 col-form-label form-label">Spouse Date of birth</label>
                        <div class="col-md-6">
                            <div class="prdtl-ans">
                                <asp:Label ID="labelSpouseDOB" runat="server"></asp:Label>
                            </div>
                            <div class="prdtl-vrfy">
                                <asp:RadioButton ID="rblSpouseDobYes" GroupName="SpouseDob" Text="Yes" runat="server" Checked="true"/>
                                <asp:RadioButton ID="rblSpouseDobNo" GroupName="SpouseDob" Text="No" runat="server" />
                            </div>
                            <span class="helpicon"><i id="icSpouseDob" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                        </div>
                        <div class="col-md-3">
                            <input type="button" value="Add Remarks" id="btnSpouseDob" />
                            <input id="txtSpouseDOB" runat="server" type="text" style="display: none" class="form-control" placeholder="Admin Comments">
                        </div>
                    </div>
                </div>

                <div class="list-group-item" role="group" id="MarriageDate" runat="server" aria-labelledby="label-marriagedate" style="display: none">
                    <div class="form-row">
                        <label id="lblMarriageDate" runat="server" for="marriagedate" class="col-md-2 col-form-label form-label">Date of Marriage</label>
                        <div class="col-md-6">
                            <div class="prdtl-ans">
                                <asp:Label ID="labelMarriagedate" runat="server"></asp:Label>
                            </div>
                            <div class="prdtl-vrfy">
                                <asp:RadioButton ID="rblMarriagedateYes" GroupName="Marriagedate" Text="Yes" runat="server" Checked="true"/>
                                <asp:RadioButton ID="rblMarriagedateNo" GroupName="Marriagedate" Text="No" runat="server" />
                            </div>
                            <span class="helpicon"><i id="icMarriagedate" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                        </div>
                        <div class="col-md-3">
                            <input type="button" value="Add Remarks" id="btnMarriagedate" />
                            <input id="txtMarrigeDate" runat="server" type="text" style="display: none" class="form-control" placeholder="Admin Comments">
                        </div>
                    </div>
                </div>
                <div class="list-group-item" role="group" id="higheststudy" runat="server" aria-labelledby="label-marriagedate" style="display: none">
                    <div class="form-row">
                        <label id="labelhigheststudy" runat="server" for="higheststudy" class="col-md-2 col-form-label form-label">Highest study level successfully completed</label>
                        <div class="col-md-6">
                            <div class="prdtl-ans">
                                <asp:Label ID="lblhigheststudy" runat="server"></asp:Label>
                            </div>
                            <div class="prdtl-vrfy">
                                <asp:RadioButton ID="rblhigheststudyYes" GroupName="higheststudy" Text="Yes" runat="server" Checked="true"/>
                                <asp:RadioButton ID="rblhigheststudyNo" GroupName="higheststudy" Text="No" runat="server" />
                            </div>
                            <span class="helpicon"><i id="ichigheststudy" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                        </div>
                        <div class="col-md-3">
                            <input type="button" value="Add Remarks" id="btnhigheststudy" />
                            <input id="txthigheststudy" runat="server" type="text" style="display: none" class="form-control" placeholder="Admin Comments">
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="disability" runat="server" style="display: none">
                    <div class="form-group m-0" role="group" aria-labelledby="label-disability">
                        <div class="form-row">
                            <label id="labeldisability" runat="server" for="disability" class="col-md-2 col-form-label form-label">Do you have any disability, impairment, or a long term condition</label>
                            <div class="col-md-6">
                                <div class="prdtl-ans">
                                    <asp:Label ID="lblDisability" runat="server"></asp:Label>
                                </div>
                                <div class="prdtl-vrfy">
                                    <asp:RadioButton ID="rblDisabilityYes" GroupName="Disability" Text="Yes" runat="server" Checked="true"/>
                                    <asp:RadioButton ID="rblDisabilityNo" GroupName="Disability" Text="No" runat="server" />
                                </div>
                                <span class="helpicon"><i id="icdisability" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-3">
                                <input type="button" value="Add Remarks" id="btnDisability" />
                                <input id="txtDisability" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>
                    </div>
                </div>
                 <div class="list-group-item" role="group" id="fieldstudy" runat="server" aria-labelledby="label-fieldstudy" style="display: none">
                    <div class="form-row">
                        <label id="labelfieldstudy" runat="server" for="fieldstudy" class="col-md-2 col-form-label form-label">Completed highest study in field </label>
                        <div class="col-md-6">
                            <div class="prdtl-ans">
                                <asp:Label ID="lblfieldstudy" runat="server"></asp:Label>
                            </div>
                            <div class="prdtl-vrfy">
                                <asp:RadioButton ID="rbfieldstudyYes" GroupName="fieldstudy" Text="Yes" runat="server" Checked="true"/>
                                <asp:RadioButton ID="rbfieldstudyNo" GroupName="fieldstudy" Text="No" runat="server" />
                            </div>
                            <span class="helpicon"><i id="icfieldstudy" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                        </div>
                        <div class="col-md-3">
                            <input type="button" value="Add Remarks" id="btnfieldstudy" />
                            <input id="txtfieldstudy" runat="server" type="text" style="display: none" class="form-control" placeholder="Admin Comments">
                        </div>
                    </div>
                </div>
                <div class="list-group-item" role="group" id="highestQualificationCountry" runat="server" aria-labelledby="label-highestQualificationCountry" style="display: none">
                    <div class="form-row">
                        <label id="labelhighestQualificationCountry" runat="server" for="highestQualificationCountry" class="col-md-2 col-form-label form-label">Country of Highest Qualificatiion Achieved</label>
                        <div class="col-md-6">
                             <div class="prdtl-ans">
                                <asp:Label ID="lblhighestQualificationCountry" runat="server"></asp:Label>
                            </div>
                             <div class="prdtl-vrfy">
                                <asp:RadioButton ID="rbhighestQualificationCountryYes" GroupName="QualificationCountry" Text="Yes" runat="server" Checked="true"/>
                                <asp:RadioButton ID="rbhighestQualificationCountryNo" GroupName="QualificationCountry" Text="No" runat="server" />
                             </div>
                            <span class="helpicon"><i id="ichighestQualificationCountry" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                        </div>
                        <div class="col-md-3">
                            <input type="button" value="Add Remarks" id="btnhighestQualificationCountry" />
                            <input id="txthighestQualificationCountry" runat="server" type="text" style="display: none" class="form-control" placeholder="Admin Comments">
                        </div>
                    </div>
                </div>
                 <div class="list-group-item" id="highQualificationCompleteDate" runat="server" style="display: none">
                    <div class="form-group m-0" role="group" aria-labelledby="label-highQualificationCompleteDate">
                        <div class="form-row">
                            <label id="labelhighQualificationCompleteDate" runat="server" for="highQualificationCompleteDate" class="col-md-2 col-form-label form-label">Completion Date </label>
                            <div class="col-md-6">
                                <div class="prdtl-ans">
                                    <asp:Label ID="lblhighQualificationCompleteDate" runat="server"></asp:Label>
                                </div>
                                <div class="prdtl-vrfy">
                                    <asp:RadioButton ID="rbhighQualificationCompleteDateYes" GroupName="QualificationCompleteDate" Text="Yes" runat="server" Checked="true"/>
                                    <asp:RadioButton ID="rbhighQualificationCompleteDateNo" GroupName="QualificationCompleteDate" Text="No" runat="server" />
                                </div>
                                <span class="helpicon"><i id="ichighQualificationCompleteDate" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-3">
                                <input type="button" value="Add Remarks" id="btnhighQualificationCompleteDate" />
                                <input id="txthighQualificationCompleteDate" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="disabilitydesc" runat="server" style="display: none">
                    <div class="form-group m-0" role="group" aria-labelledby="label-disabilitydesc">
                        <div class="form-row">
                            <label id="labeldisabilitydesc" runat="server" for="disabilitydesc" class="col-md-2 col-form-label form-label">Disability Description</label>
                            <div class="col-md-6">
                                <div class="prdtl-ans">
                                    <asp:Label ID="lbldisabilitydesc" runat="server"></asp:Label>
                                </div>
                                <div class="prdtl-vrfy">
                                    <asp:RadioButton ID="rbldisabilitydescYes" GroupName="disabilitydesc" Text="Yes" runat="server" Checked="true"/>
                                    <asp:RadioButton ID="rbldisabilitydescNo" GroupName="disabilitydesc" Text="No" runat="server" />
                                </div>
                                <span class="helpicon"><i id="icdisabilitydescription" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-3">
                                <input type="button" value="Add Remarks" id="btndisabilitydesc" />
                                <input id="txtDisabilityDescription" style="display: none" runat="server" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="agent" runat="server" style="display: none">
                    <div class="form-group m-0" role="group" aria-labelledby="label-agent">
                        <div class="form-row">
                            <label id="labelagent" runat="server" for="agent" class="col-md-2 col-form-label form-label">Are you reffered by Agent</label>
                            <div class="col-md-6">
                                <div class="prdtl-ans">
                                    <asp:Label ID="lblAgent" runat="server"></asp:Label>
                                </div>
                                <div class="prdtl-vrfy">
                                    <asp:RadioButton ID="rblAgentYes" GroupName="Agent" Text="Yes" runat="server" Checked="true"/>
                                    <asp:RadioButton ID="rblAgentNo" GroupName="Agent" Text="No" runat="server" />
                                </div>
                                <span class="helpicon"><i id="icAgent" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-3">
                                <input type="button" value="Add Remarks" id="btnAgent" />
                                <input id="txtAgent" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="agentList" runat="server" style="display: none">
                    <div class="form-group m-0" role="group" aria-labelledby="label-agentList">
                        <div class="form-row">
                            <label id="labelagentList" runat="server" for="agentList" class="col-md-2 col-form-label form-label">Agent Name</label>
                            <div class="col-md-6">
                                <div class="prdtl-ans">
                                    <asp:Label ID="lblAgentList" runat="server"></asp:Label>
                                </div>
                                <div class="prdtl-vrfy">
                                    <asp:RadioButton ID="rblAgentListYes" GroupName="AgentList" Text="Yes" runat="server" Checked="true"/>
                                    <asp:RadioButton ID="rblAgentListNo" GroupName="AgentList" Text="No" runat="server" />
                                </div>
                                <span class="helpicon"><i id="icAgentList" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-3">
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

                            <asp:Button ID="btnSave" runat="server" Text="Save Changes" CssClass="btn btn-success" OnClick="btnSave_Click" OnClientClick="return validateform()"/>
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
        $(document).ready(function ()
        {
              <%    for (int n = 0; n < CustomControls.Count; n++)
        {
            string btnName = "ContentPlaceHolder1_btn" + CustomControls[n].customfieldid.ToString();
            string txtName = "ContentPlaceHolder1_txt" + CustomControls[n].customfieldid.ToString();
            string rblNo = "ContentPlaceHolder1_rblNo" + CustomControls[n].customfieldid.ToString();
            string rblYes = "ContentPlaceHolder1_rblYes" + CustomControls[n].customfieldid.ToString();
        %>
            if ($('#<%=txtName%>').val() != "")
                ManageRemarksIfNoCheked('<%=txtName%>', '<%=btnName%>');

            $("#<%=btnName%>").click(function () {
                ManageRemarks('<%=txtName%>', '<%=btnName%>');
            });
            $("#<%=rblYes%>").click(function () {
                ManageRemarksIfYesCheked('<%=txtName%>', '<%=btnName%>');
            });
            $('#<%=rblNo%>').click(function () {
                ManageRemarksIfNoCheked('<%=txtName%>', '<%=btnName%>');
            });

         <%  }%>
            //comment textbox
            if ($("#<%=txtFirstName.ClientID%>").val() != "")
                ManageRemarksIfNoCheked('<%=txtFirstName.ClientID%>', 'btnFirstName');
            if ($("#<%=txtTitle.ClientID%>").val() != "")
                ManageRemarksIfNoCheked('<%=txtTitle.ClientID%>', 'btnTitle');
            if ($("#<%=txtAgentList.ClientID%>").val() != "")
                ManageRemarksIfNoCheked('<%=txtAgentList.ClientID%>', 'btnAgentList');
            if ($("#<%=txtAgent.ClientID%>").val() != "")
                ManageRemarksIfNoCheked('<%=txtAgent.ClientID%>', 'btnAgent');
            if ($("#<%=txtDisabilityDescription.ClientID%>").val() != "")
                ManageRemarksIfNoCheked('<%=txtDisabilityDescription.ClientID%>', 'btndisabilitydesc');
            if ($("#<%=txtDisability.ClientID%>").val() != "")
                ManageRemarksIfNoCheked('<%=txtDisability.ClientID%>', 'btnDisability');
            if ($("#<%=txtMarrigeDate.ClientID%>").val() != "")
                ManageRemarksIfNoCheked('<%=txtMarrigeDate.ClientID%>', 'btnMarriagedate');
            if ($("#<%=txtSpouseDOB.ClientID%>").val() != "")
                ManageRemarksIfNoCheked('<%=txtSpouseDOB.ClientID%>', 'btnSpouseDob');
            if ($("#<%=txtSpouseNationality.ClientID%>").val() != "")
                ManageRemarksIfNoCheked('<%=txtSpouseNationality.ClientID%>', 'btnSpouseNatinality');
            if ($("#<%=txtSpousename.ClientID%>").val() != "")
                ManageRemarksIfNoCheked('<%=txtSpousename.ClientID%>', 'btnspouseName');
            if ($("#<%=txtMarital.ClientID%>").val() != "")
                ManageRemarksIfNoCheked('<%=txtMarital.ClientID%>', 'btnMarital');
            if ($("#<%=txtBirthCountry.ClientID%>").val() != "")
                ManageRemarksIfNoCheked('<%=txtBirthCountry.ClientID%>', 'btnBirthCountry');
            if ($("#<%=txtOtherNation.ClientID%>").val() != "")
                ManageRemarksIfNoCheked('<%=txtOtherNation.ClientID%>', 'btnSecondNation');
            if ($("#<%=txtDualNationlity.ClientID%>").val() != "")
                ManageRemarksIfNoCheked('<%=txtDualNationlity.ClientID%>', 'btnDualNationality');
            if ($("#<%=txtRussiaName.ClientID%>").val() != "")
                ManageRemarksIfNoCheked('<%=txtRussiaName.ClientID%>', 'btnRussianName');
            if ($("#<%=txtChineseCodeNo.ClientID%>").val() != "")
                ManageRemarksIfNoCheked('<%=txtChineseCodeNo.ClientID%>', 'btnChineseCodeNo');
            if ($("#<%=txtChineseCode.ClientID%>").val() != "")
                ManageRemarksIfNoCheked('<%=txtChineseCode.ClientID%>', 'btnChineseCode');
            if ($("#<%=txtNationality.ClientID%>").val() != "")
                ManageRemarksIfNoCheked('<%=txtNationality.ClientID%>', 'btnNationality');
            if ($("#<%=txtDOB.ClientID%>").val() != "")
                ManageRemarksIfNoCheked('<%=txtDOB.ClientID%>', 'btnDOB');
            if ($("#<%=txtMiddleName.ClientID%>").val() != "")
                ManageRemarksIfNoCheked('<%=txtMiddleName.ClientID%>', 'btnMiddleName');
            if ($("#<%=txtPrefferedName.ClientID%>").val() != "")
                ManageRemarksIfNoCheked('<%=txtPrefferedName.ClientID%>', 'btnPrefferedName');
            if ($("#<%=txtLastName.ClientID%>").val() != "")
                ManageRemarksIfNoCheked('<%=txtLastName.ClientID%>', 'btnLastName');
            if ($("#<%=txtpassportsameasFirstName.ClientID%>").val() != "")
                ManageRemarksIfNoCheked('<%=txtpassportsameasFirstName.ClientID%>', 'btnpassportsameasFirstName');
            if ($("#<%=txtpassportsameasmiddlename.ClientID%>").val() != "")
                ManageRemarksIfNoCheked('<%=txtpassportsameasmiddlename.ClientID%>', 'btnpassportsameasmiddlename');
            if ($("#<%=txtpassportsameasLastName.ClientID%>").val() != "")
                ManageRemarksIfNoCheked('<%=txtpassportsameasLastName.ClientID%>', 'btnpassportsameasLastName');
            if ($("#<%=txthigheststudy.ClientID%>").val() != "")
                ManageRemarksIfNoCheked('<%=txthigheststudy.ClientID%>', 'btnhigheststudy');
            if ($("#<%=txtGender.ClientID%>").val() != "")
                ManageRemarksIfNoCheked('<%=txtGender.ClientID%>', 'btnGender');
            if ($("#<%=txtfieldstudy.ClientID%>").val() != "")
                ManageRemarksIfNoCheked('<%=txtfieldstudy.ClientID%>', 'btnfieldstudy');
            if ($("#<%=txthighestQualificationCountry.ClientID%>").val() != "")
                ManageRemarksIfNoCheked('<%=txthighestQualificationCountry.ClientID%>', 'btnhighestQualificationCountry');
            if ($("#<%=txthighQualificationCompleteDate.ClientID%>").val() != "")
                ManageRemarksIfNoCheked('<%=txthighQualificationCompleteDate.ClientID%>', 'btnhighQualificationCompleteDate');
           
        });
        //button
        $("#btnAgentList").click(function () {
            ManageRemarks('<%=txtAgentList.ClientID%>', 'btnAgentList');
        });
        $("#btnAgent").click(function () {
            ManageRemarks('<%=txtAgent.ClientID%>', 'btnAgent');
        });
        $("#btndisabilitydesc").click(function () {
            ManageRemarks('<%=txtDisabilityDescription.ClientID%>', 'btndisabilitydesc');
        });
        $("#btnDisability").click(function () {
            ManageRemarks('<%=txtDisability.ClientID%>', 'btnDisability');
        });
        $("#btnMarriagedate").click(function () {
            ManageRemarks('<%=txtMarrigeDate.ClientID%>', 'btnMarriagedate');
        });
        $("#btnSpouseDob").click(function () {
            ManageRemarks('<%=txtSpouseDOB.ClientID%>', 'btnSpouseDob');
        });
        $("#btnSpouseNatinality").click(function () {
            ManageRemarks('<%=txtSpouseNationality.ClientID%>', 'btnSpouseNatinality');
        });
        $("#btnspouseName").click(function () {
            ManageRemarks('<%=txtSpousename.ClientID%>', 'btnspouseName');
        });
        $("#btnMarital").click(function () {
            ManageRemarks('<%=txtMarital.ClientID%>', 'btnMarital');
        });
        $("#btnBirthCountry").click(function () {
            ManageRemarks('<%=txtBirthCountry.ClientID%>', 'btnBirthCountry');
        });
        $("#btnSecondNation").click(function () {
            ManageRemarks('<%=txtOtherNation.ClientID%>', 'btnSecondNation');
        });
        $("#btnDualNationality").click(function () {
            ManageRemarks('<%=txtDualNationlity.ClientID%>', 'btnDualNationality');
        });
        $("#btnRussianName").click(function () {
            ManageRemarks('<%=txtRussiaName.ClientID%>', 'btnRussianName');
        });
        $("#btnChineseCodeNo").click(function () {
            ManageRemarks('<%=txtChineseCodeNo.ClientID%>', 'btnChineseCodeNo');
        });
        $("#btnChineseCode").click(function () {
            ManageRemarks('<%=txtChineseCode.ClientID%>', 'btnChineseCode');
        });
        $("#btnNationality").click(function () {
            ManageRemarks('<%=txtNationality.ClientID%>', 'btnNationality');
        });
        $("#btnDOB").click(function () {
            ManageRemarks('<%=txtDOB.ClientID%>', 'btnDOB');
        });
        $("#btnMiddleName").click(function () {
            ManageRemarks('<%=txtMiddleName.ClientID%>', 'btnMiddleName');
        });
         $("#btnPrefferedName").click(function () {
            ManageRemarks('<%=txtPrefferedName.ClientID%>', 'btnPrefferedName');
        });
        $("#btnLastName").click(function () {
            ManageRemarks('<%=txtLastName.ClientID%>', 'btnLastName');
        });
        $("#btnFirstName").click(function () {
            ManageRemarks('<%=txtFirstName.ClientID%>', 'btnFirstName');
        });
        $("#btnTitle").click(function () {
            ManageRemarks('<%=txtTitle.ClientID%>', 'btnTitle');
        });
        $("#btnpassportsameasFirstName").click(function () {
            ManageRemarks('<%=txtpassportsameasFirstName.ClientID%>', 'btnpassportsameasFirstName');
        });
        $("#btnpassportsameasmiddlename").click(function () {
            ManageRemarks('<%=txtpassportsameasmiddlename.ClientID%>', 'btnpassportsameasmiddlename');
        });
        $("#btnpassportsameasLastName").click(function () {
            ManageRemarks('<%=txtpassportsameasLastName.ClientID%>', 'btnpassportsameasLastName');
        });
        $("#btnhigheststudy").click(function () {
            ManageRemarks('<%=txthigheststudy.ClientID%>', 'btnhigheststudy');
        });
        $("#btnGender").click(function () {
            ManageRemarks('<%=txtGender.ClientID%>', 'btnGender');
        });
        $("#btnfieldstudy").click(function () {
            ManageRemarks('<%=txtfieldstudy.ClientID%>', 'btnfieldstudy');
        });
        $("#btnhighestQualificationCountry").click(function () {
            ManageRemarks('<%=txthighestQualificationCountry.ClientID%>', 'btnhighestQualificationCountry');
        });
        $("#btnhighQualificationCompleteDate").click(function () {
            ManageRemarks('<%=txthighQualificationCompleteDate.ClientID%>', 'btnhighQualificationCompleteDate');
        }); 
        //Yes Click
        $("#<%=rblAgentListYes.ClientID%>").click(function () {
            ManageRemarksIfYesCheked('<%=txtAgentList.ClientID%>', 'btnAgentList');
        }); 
        $("#<%=rblAgentYes.ClientID%>").click(function () {
            ManageRemarksIfYesCheked('<%=txtAgent.ClientID%>', 'btnAgent');
        }); 
        $("#<%=rbldisabilitydescYes.ClientID%>").click(function () {
            ManageRemarksIfYesCheked('<%=txtDisabilityDescription.ClientID%>', 'btndisabilitydesc');
        }); 
        $("#<%=rblDisabilityYes.ClientID%>").click(function () {
            ManageRemarksIfYesCheked('<%=txtDisability.ClientID%>', 'btnDisability');
        });
        $("#<%=rblMarriagedateYes.ClientID%>").click(function () {
            ManageRemarksIfYesCheked('<%=txtMarrigeDate.ClientID%>', 'btnMarriagedate');
        }); 
        $("#<%=rblSpouseDobYes.ClientID%>").click(function () {
            ManageRemarksIfYesCheked('<%=txtSpouseDOB.ClientID%>', 'btnSpouseDob');
        }); 
        $("#<%=rblSpouseNatinalityYes.ClientID%>").click(function () {
            ManageRemarksIfYesCheked('<%=txtSpouseNationality.ClientID%>', 'btnSpouseNatinality');
        });
        $("#<%=rblspouseNameYes.ClientID%>").click(function () {
            ManageRemarksIfYesCheked('<%=txtSpousename.ClientID%>', 'btnspouseName');
        });
        $("#<%=rblMaritalYes.ClientID%>").click(function () {
            ManageRemarksIfYesCheked('<%=txtMarital.ClientID%>', 'btnMarital');
        });
        $("#<%=rblBirthCountryYes.ClientID%>").click(function () {
            ManageRemarksIfYesCheked('<%=txtBirthCountry.ClientID%>', 'btnBirthCountry');
        }); 
        $("#<%=rblSecondNationYes.ClientID%>").click(function () {
            ManageRemarksIfYesCheked('<%=txtOtherNation.ClientID%>', 'btnSecondNation');
        });
        $("#<%=rblDualNationalityYes.ClientID%>").click(function () {
            ManageRemarksIfYesCheked('<%=txtDualNationlity.ClientID%>', 'btnDualNationality');
        });
        $("#<%=rblRussianNameYes.ClientID%>").click(function () {
            ManageRemarksIfYesCheked('<%=txtRussiaName.ClientID%>', 'btnRussianName');
        });
        $("#<%=rblChineseCodeYes.ClientID%>").click(function () {
            ManageRemarksIfYesCheked('<%=txtChineseCodeNo.ClientID%>', 'btnChineseCodeNo');
        }); 
        $("#<%=rblChineseCodeYes.ClientID%>").click(function () {
            ManageRemarksIfYesCheked('<%=txtChineseCode.ClientID%>', 'btnChineseCode');
        });
        $("#<%=rblNationalityYes.ClientID%>").click(function () {
            ManageRemarksIfYesCheked('<%=txtNationality.ClientID%>', 'btnNationality');
        }); 
        $("#<%=rblDOBYes.ClientID%>").click(function () {
            ManageRemarksIfYesCheked('<%=txtDOB.ClientID%>', 'btnDOB');
        });
        $("#<%=rblMiddleNameYes.ClientID%>").click(function () {
            ManageRemarksIfYesCheked('<%=txtMiddleName.ClientID%>', 'btnMiddleName');
        });
        $("#<%=rblPrefferedNameYes.ClientID%>").click(function () {
            ManageRemarksIfYesCheked('<%=txtPrefferedName.ClientID%>', 'btnPrefferedName');
        }); 
        $("#<%=rblLastNameYes.ClientID%>").click(function () {
            ManageRemarksIfYesCheked('<%=txtLastName.ClientID%>', 'btnLastName');
        }); 
        $("#<%=rblFirstNameYes.ClientID%>").click(function () {
            ManageRemarksIfYesCheked('<%=txtFirstName.ClientID%>', 'btnFirstName');
        }); 
        $("#<%=rblTitleYes.ClientID%>").click(function () {
            ManageRemarksIfYesCheked('<%=txtTitle.ClientID%>', 'btnTitle');
        }); 
        $("#<%=rblpassportsameasFirstNameYes.ClientID%>").click(function () {
            ManageRemarksIfYesCheked('<%=txtpassportsameasFirstName.ClientID%>', 'btnpassportsameasFirstName');
        });
        $("#<%=rblpassportsameasmiddlenameYes.ClientID%>").click(function () {
            ManageRemarksIfYesCheked('<%=txtpassportsameasmiddlename.ClientID%>', 'btnpassportsameasmiddlename');
        });
        $("#<%=rblpassportsameasLastNameYes.ClientID%>").click(function () {
            ManageRemarksIfYesCheked('<%=txtpassportsameasLastName.ClientID%>', 'btnpassportsameasLastName');
        }); 
        $("#<%=rblhigheststudyYes.ClientID%>").click(function () {
            ManageRemarksIfYesCheked('<%=txthigheststudy.ClientID%>', 'btnhigheststudy');
        }); 
        $("#<%=rblGenderYes.ClientID%>").click(function () {
            ManageRemarksIfYesCheked('<%=txtGender.ClientID%>', 'btnGender');
        });
        $("#<%=rbfieldstudyYes.ClientID%>").click(function () {
            ManageRemarksIfYesCheked('<%=txtfieldstudy.ClientID%>', 'btnfieldstudy');
        });
        $("#<%=rbhighestQualificationCountryYes.ClientID%>").click(function () {
            ManageRemarksIfYesCheked('<%=txthighestQualificationCountry.ClientID%>', 'btnhighestQualificationCountry');
        });  
        $("#<%=rbhighQualificationCompleteDateYes.ClientID%>").click(function () {
            ManageRemarksIfYesCheked('<%=txthighQualificationCompleteDate.ClientID%>', 'btnhighQualificationCompleteDate');
        });
        //No click
        $("#<%=rblAgentListNo.ClientID%>").click(function () {
            ManageRemarksIfNoCheked('<%=txtAgentList.ClientID%>', 'btnAgentList');
        });
        $("#<%=rblAgentNo.ClientID%>").click(function () {
            ManageRemarksIfNoCheked('<%=txtAgent.ClientID%>', 'btnAgent');
        });
        $("#<%=rbldisabilitydescNo.ClientID%>").click(function () {
            ManageRemarksIfNoCheked('<%=txtDisabilityDescription.ClientID%>', 'btndisabilitydesc');
        });
        $("#<%=rblDisabilityNo.ClientID%>").click(function () {
            ManageRemarksIfNoCheked('<%=txtDisability.ClientID%>', 'btnDisability');
        });
        $("#<%=rblMarriagedateNo.ClientID%>").click(function () {
            ManageRemarksIfNoCheked('<%=txtMarrigeDate.ClientID%>', 'btnMarriagedate');
        });
        $("#<%=rblSpouseDobNo.ClientID%>").click(function () {
            ManageRemarksIfNoCheked('<%=txtSpouseDOB.ClientID%>', 'btnSpouseDob');
        });
        $("#<%=rblSpouseNatinalityNo.ClientID%>").click(function () {
            ManageRemarksIfNoCheked('<%=txtSpouseNationality.ClientID%>', 'btnSpouseNatinality');
        });
        $("#<%=rblspouseNameNo.ClientID%>").click(function () {
            ManageRemarksIfNoCheked('<%=txtSpousename.ClientID%>', 'btnspouseName');
        }); 
        $("#<%=rblMaritalNo.ClientID%>").click(function () {
            ManageRemarksIfNoCheked('<%=txtMarital.ClientID%>', 'btnMarital');
        });
        $("#<%=rblBirthCountryNo.ClientID%>").click(function () {
            ManageRemarksIfNoCheked('<%=txtBirthCountry.ClientID%>', 'btnBirthCountry');
        });
        $("#<%=rblSecondNationNo.ClientID%>").click(function () {
            ManageRemarksIfNoCheked('<%=txtOtherNation.ClientID%>', 'btnSecondNation');
        });
        $("#<%=rblDualNationalityNo.ClientID%>").click(function () {
            ManageRemarksIfNoCheked('<%=txtDualNationlity.ClientID%>', 'btnDualNationality');
        });
        $("#<%=rblRussianNameNo.ClientID%>").click(function () {
            ManageRemarksIfNoCheked('<%=txtRussiaName.ClientID%>', 'btnRussianName');
        });
        $("#<%=rblChineseCodeNo.ClientID%>").click(function () {
            ManageRemarksIfNoCheked('<%=txtChineseCodeNo.ClientID%>', 'btnChineseCodeNo');
        });
        $("#<%=rblChineseCodeNo.ClientID%>").click(function () {
            ManageRemarksIfNoCheked('<%=txtChineseCode.ClientID%>', 'btnChineseCode');
        });
        $("#<%=rblNationalityNo.ClientID%>").click(function () {
            ManageRemarksIfNoCheked('<%=txtNationality.ClientID%>', 'btnNationality');
        });
        $("#<%=rblDOBNo.ClientID%>").click(function () {
            ManageRemarksIfNoCheked('<%=txtDOB.ClientID%>', 'btnDOB');
        });
        $("#<%=rblMiddleNameNo.ClientID%>").click(function () {
            ManageRemarksIfNoCheked('<%=txtMiddleName.ClientID%>', 'btnMiddleName');
        });
        $("#<%=rblPrefferedNameNo.ClientID%>").click(function () {
            ManageRemarksIfNoCheked('<%=txtPrefferedName.ClientID%>', 'btnPrefferedName');
        });
        $("#<%=rblLastNameNo.ClientID%>").click(function () {
            ManageRemarksIfNoCheked('<%=txtLastName.ClientID%>', 'btnLastName');
        });
        $("#<%=rblFirstNameNo.ClientID%>").click(function () {
            ManageRemarksIfNoCheked('<%=txtFirstName.ClientID%>', 'btnFirstName');
        });
        $("#<%=rblTitleNo.ClientID%>").click(function () {
            ManageRemarksIfNoCheked('<%=txtTitle.ClientID%>', 'btnTitle');
        });
        $("#<%=rblpassportsameasFirstNameNo.ClientID%>").click(function () {
            ManageRemarksIfNoCheked('<%=txtpassportsameasFirstName.ClientID%>', 'btnpassportsameasFirstName');
        });
        $("#<%=rblpassportsameasmiddlenameNo.ClientID%>").click(function () {
            ManageRemarksIfNoCheked('<%=txtpassportsameasmiddlename.ClientID%>', 'btnpassportsameasmiddlename');
        });
        $("#<%=rblpassportsameasLastNameNo.ClientID%>").click(function () {
            ManageRemarksIfNoCheked('<%=txtpassportsameasLastName.ClientID%>', 'btnpassportsameasLastName');
        });
        $("#<%=rblhigheststudyNo.ClientID%>").click(function () {
            ManageRemarksIfNoCheked('<%=txthigheststudy.ClientID%>', 'btnhigheststudy');
        }); 
        $("#<%=rblGenderNo.ClientID%>").click(function () {
            ManageRemarksIfNoCheked('<%=txtGender.ClientID%>', 'btnGender');
        });
        $("#<%=rbfieldstudyNo.ClientID%>").click(function () {
            ManageRemarksIfNoCheked('<%=txtfieldstudy.ClientID%>', 'btnfieldstudy');
        });
        $("#<%=rbhighestQualificationCountryNo.ClientID%>").click(function () {
            ManageRemarksIfNoCheked('<%=txthighestQualificationCountry.ClientID%>', 'btnhighestQualificationCountry');
        });         
        $("#<%=rbhighQualificationCompleteDateNo.ClientID%>").click(function () {
            ManageRemarksIfNoCheked('<%=txthighQualificationCompleteDate.ClientID%>', 'btnhighQualificationCompleteDate');
        });

        function ManageRemarks(cntrol1, control2)
        {
            if ($("#" + cntrol1 + "").is(':hidden')) {
                $("#" + cntrol1 + "").css('display', 'block');
                $("#" + control2 + "").prop('value', 'Hide Remarks');
            }
            else
            {
                $("#" + cntrol1 + "").css('display', 'none');
                $("#" + control2 + "").prop('value', 'Add Remarks');
            }
        }
        function ManageRemarksIfYesCheked(cntrol, control2) {
                $("#" + cntrol + "").css('display', 'none');
                $("#" + control2 + "").prop('value', 'Add Remarks');
        }
        function ManageRemarksIfNoCheked(cntrol, control2) {
                $("#" + cntrol + "").css('display', 'block');
                $("#" + control2 + "").prop('value', 'Hide Remarks');
        }
       function validateform()
        {
            var flag = false;
            if (!$("#<%=title.ClientID%>").is(':hidden') && !($("#<%=rblTitleYes.ClientID%>").is(':checked') || $("#<%=rblTitleNo.ClientID%>").is(':checked'))) 
                alert("Please select option for Title");
            else if (!$("#<%=firstname.ClientID%>").is(':hidden') && !($("#<%=rblFirstNameYes.ClientID%>").is(':checked') || $("#<%=rblFirstNameNo.ClientID%>").is(':checked'))) 
                alert("Please select option for First Name");
            else if (!$("#<%=passportsameasFirstName.ClientID%>").is(':hidden') && !($("#<%=rblpassportsameasFirstNameYes.ClientID%>").is(':checked') || $("#<%=rblpassportsameasFirstNameNo.ClientID%>").is(':checked'))) 
                alert("Please select option for Passport first name same as above");
            else if (!$("#<%=lastname.ClientID%>").is(':hidden') && !($("#<%=rblLastNameYes.ClientID%>").is(':checked') || $("#<%=rblLastNameNo.ClientID%>").is(':checked'))) 
                alert("Please select option for Family Name");
            else if (!$("#<%=passportsameasLastName.ClientID%>").is(':hidden') && !($("#<%=rblpassportsameasLastNameYes.ClientID%>").is(':checked') || $("#<%=rblpassportsameasLastNameNo.ClientID%>").is(':checked'))) 
                alert("Please select option for Passport family name same as above");
            else if (!$("#<%=preferedname.ClientID%>").is(':hidden') && !($("#<%=rblPrefferedNameYes.ClientID%>").is(':checked') || $("#<%=rblPrefferedNameNo.ClientID%>").is(':checked'))) 
                alert("Please select option for Preffered Name");
            else if (!$("#<%=middlename.ClientID%>").is(':hidden') && !($("#<%=rblMiddleNameYes.ClientID%>").is(':checked') || $("#<%=rblMiddleNameNo.ClientID%>").is(':checked'))) 
                alert("Please select option for Middle Name");
            else if (!$("#<%=passportsameasmiddlename.ClientID%>").is(':hidden') && !($("#<%=rblpassportsameasmiddlenameYes.ClientID%>").is(':checked') || $("#<%=rblpassportsameasmiddlenameNo.ClientID%>").is(':checked'))) 
                alert("Please select option for passport Middle name same as above");
            else if (!$("#<%=dob.ClientID%>").is(':hidden') && !($("#<%=rblDOBYes.ClientID%>").is(':checked') || $("#<%=rblDOBNo.ClientID%>").is(':checked'))) 
                alert("Please select option for Date of birth");
            else if (!$("#<%=gender.ClientID%>").is(':hidden') && !($("#<%=rblGenderYes.ClientID%>").is(':checked') || $("#<%=rblGenderNo.ClientID%>").is(':checked'))) 
                alert("Please select option for gender");
            else if (!$("#<%=nationality.ClientID%>").is(':hidden') && !($("#<%=rblNationalityYes.ClientID%>").is(':checked') || $("#<%=rblNationalityNo.ClientID%>").is(':checked'))) 
                alert("Please select option for Nationality");
            else if (!$("#<%=chineseCode.ClientID%>").is(':hidden') && !($("#<%=rblChineseCodeYes.ClientID%>").is(':checked') || $("#<%=rblChineseCodeNo.ClientID%>").is(':checked'))) 
                alert("Please select option for chinese Commercial Code");
            else if (!$("#<%=textChineseCodeDiv.ClientID%>").is(':hidden') && !($("#<%=rblChineseCodeNoYes.ClientID%>").is(':checked') || $("#<%=rblChineseCodeNoNo.ClientID%>").is(':checked'))) 
                alert("Please select option for Chinese Commercial Code Number");
            else if (!$("#<%=russianName.ClientID%>").is(':hidden') && !($("#<%=rblRussianNameYes.ClientID%>").is(':checked') || $("#<%=rblRussianNameNo.ClientID%>").is(':checked'))) 
                alert("Please select option for In English, provide your patronymic name");
            else if (!$("#<%=dualNationality.ClientID%>").is(':hidden') && !($("#<%=rblDualNationalityYes.ClientID%>").is(':checked') || $("#<%=rblDualNationalityNo.ClientID%>").is(':checked'))) 
                alert("Please select option for Dual Nationality");
            else if (!$("#<%=secondNation.ClientID%>").is(':hidden') && !($("#<%=rblSecondNationYes.ClientID%>").is(':checked') || $("#<%=rblSecondNationNo.ClientID%>").is(':checked'))) 
                alert("Please select option for Dual Citizenship");
            else if (!$("#<%=birthcountry.ClientID%>").is(':hidden') && !($("#<%=rblBirthCountryYes.ClientID%>").is(':checked') || $("#<%=rblBirthCountryNo.ClientID%>").is(':checked'))) 
                alert("Please select option for Chinese Code");
            else if (!$("#<%=marital.ClientID%>").is(':hidden') && !($("#<%=rblMaritalYes.ClientID%>").is(':checked') || $("#<%=rblMaritalNo.ClientID%>").is(':checked'))) 
                alert("Please select option for Marital status");
            else if (!$("#<%=statusMarried.ClientID%>").is(':hidden') && !($("#<%=rblspouseNameYes.ClientID%>").is(':checked') || $("#<%=rblspouseNameNo.ClientID%>").is(':checked'))) 
                alert("Please select option for Spouse Name");
            else if (!$("#<%=SpouseNationality.ClientID%>").is(':hidden') && !($("#<%=rblSpouseNatinalityYes.ClientID%>").is(':checked') || $("#<%=rblSpouseNatinalityNo.ClientID%>").is(':checked'))) 
                alert("Please select option for Spouse Nationality");
            else if (!$("#<%=SpouseDOB.ClientID%>").is(':hidden') && !($("#<%=rblSpouseDobYes.ClientID%>").is(':checked') || $("#<%=rblSpouseDobNo.ClientID%>").is(':checked'))) 
                alert("Please select option for Spouse Date of birth");
            else if (!$("#<%=MarriageDate.ClientID%>").is(':hidden') && !($("#<%=rblMarriagedateYes.ClientID%>").is(':checked') || $("#<%=rblMarriagedateNo.ClientID%>").is(':checked'))) 
                alert("Please select option for Date of Marriage");
            else if (!$("#<%=higheststudy.ClientID%>").is(':hidden') && !($("#<%=rblhigheststudyYes.ClientID%>").is(':checked') || $("#<%=rblhigheststudyNo.ClientID%>").is(':checked'))) 
                alert("Please select option for Highest study");
            else if (!$("#<%=disability.ClientID%>").is(':hidden') && !($("#<%=rblDisabilityYes.ClientID%>").is(':checked') || $("#<%=rblDisabilityNo.ClientID%>").is(':checked'))) 
                alert("Please select option for Do You have Disability ");         
            else if (!$("#<%=fieldstudy.ClientID%>").is(':hidden') && !($("#<%=rbfieldstudyYes.ClientID%>").is(':checked') || $("#<%=rbfieldstudyNo.ClientID%>").is(':checked'))) 
                alert("Please select option for field of study");
            else if (!$("#<%=highestQualificationCountry.ClientID%>").is(':hidden') && !($("#<%=rbhighestQualificationCountryYes.ClientID%>").is(':checked') || $("#<%=rbhighestQualificationCountryNo.ClientID%>").is(':checked'))) 
                alert("Please select option forqualification country ");
            else if (!$("#<%=highQualificationCompleteDate.ClientID%>").is(':hidden') && !($("#<%=rbhighQualificationCompleteDateYes.ClientID%>").is(':checked') || $("#<%=rbhighQualificationCompleteDateNo.ClientID%>").is(':checked'))) 
                alert("Please select option for qualification date");
            else if (!$("#<%=agent.ClientID%>").is(':hidden') && !($("#<%=rblAgentYes.ClientID%>").is(':checked') || $("#<%=rblAgentNo.ClientID%>").is(':checked'))) 
                alert("Please select option for Are you referred by agent ");
            else
               flag = true;
           if (flag == true)
                flag = customcontrolValidation();
            return flag;
        } 
        function customcontrolValidation() {
            var flag = false;
            var Count = '<%=CustomControls.Count%>';
            if (Count == '0')
                flag = true;
             <% for (int k = 0; k < CustomControls.Count; k++)
        {
            RadioButton rbDynamicsYes = (RadioButton)mainDiv.FindControl("rblYes" + CustomControls[k].customfieldid);
            RadioButton rbDynamicsNo = (RadioButton)mainDiv.FindControl("rblNo" + CustomControls[k].customfieldid);
            var Description = CustomControls[k].labeldescription.ToLower();
                    %>

            if (!($("#<%=rbDynamicsYes.ClientID%>").is(':checked') || $("#<%=rbDynamicsNo.ClientID%>").is(':checked'))) {
                alert("Please Select option for <%= Description%>" + "\n");
                flag = false;
                return false;
            }
            else
                flag = true;
               <% }%>
            return flag;
        }
        $(document).ready(function () {
	        $('.sidebar-menu-item').removeClass('open');
	        $('#manageapplicantions_list').addClass('open');
	        $('.sidebar-menu-item').removeClass('active');
	        $('#applicantlist').addClass('active');
	    });
    </script>
</asp:Content>


