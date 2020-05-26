<%@ Page Language="C#" AutoEventWireup="true" CodeFile="downloadapplicantdetails.aspx.cs" Inherits="admin_downloadpersonal" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title></title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="<%=System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString() %>/assets/vendor/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css" href="<%=VirtualPathUtility.ToAbsolute("~/assets/dashboard/css/bootstrap.min.css")%>" />
    <link rel="stylesheet" type="text/css" href="<%=VirtualPathUtility.ToAbsolute("~/assets/dashboard/css/style.css")%>" />
    <style>
        table.table.inner-table span {
            display: inline-block;
            min-height: 19px;
        }
        .inner-table td {
            text-align: center;
            padding: 5px 20px !important;
            border: 1px solid #000 !important;
            border-collapse: collapse !important;
            min-height: 81px;
        }
        .bgcol {
            background-color: #e6e1e1;
        }
        .adm-form-table .table.main-table td {
            border: 1px solid #ccc;
            padding: 7px 10px;
            text-align: center;
        }
        .adm-form-table .table.main-table td.first-col{border:0;text-align: right;}
    </style>

</head>
<body>

    <form id="form1" runat="server">
        <div class="container-fluid adm-form-container adm-form-table">
          <div>
               <table cellpadding="0" cellspacing="0" class="table adm-form-table">
                   <tbody>
                       <tr>
                           <td class="width25">
                               <a href="#" class="d-inline-block canning-logo">
                                   <img src="/Docs/1/ABC.png" class="img-fluid">
                               </a>
                           </td>
                           <td class="width75 text-right">
                               <div class="adm-frm-title">ADMISSIONS APPLICATION FORM</div>

                               <div class="adm-frm-sub-txt">Country of Applicant: <span>Afghanistan</span></div>

                           </td>
                       </tr>
                   </tbody>
               </table>
           </div>
		<div class="frm-ttle">PERSONAL DETAILS</div> 
		 <table cellpadding="0" cellspacing="0" class="table">
                                        <tr>
                                            <td class="width30"></td>
                                            <td class="width70 bg-gry-head text-right">
                                                <table cellpadding="0" cellspacing="0" class="table">
                                                    <tr>
                                                        <td class="width50">STUDENT RESPONSE
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" class="hd-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" class="hd-cross-icon">
                                                        </td>
                                                        <td class="width30">REVIEW
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>

                                        <tr class="adm-form-row-tr" id="title" runat="server" visible="false">
                                            <td class="width30 td-rightlabel">
                                                <label runat="server" id="labeltitle" for="title">* Title</label>
                                            </td>
                                            <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">
                                                            <asp:Label ID="lblTitle" runat="server"></asp:Label>
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" visible="false" id="imgTitleYes" runat="server" class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" visible="false" id="imgTitleNo" runat="server" class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30 td-rightlabel">
                                                            <asp:Label ID="lblTitleComments" runat="server"></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr class="adm-form-row-tr" id="firstname" runat="server" visible="false">
                                            <td class="width30 td-rightlabel">
                                                <label id="labelfirstname" runat="server" for="firstname">First Name *</label>
                                            </td>
                                            <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">
                                                            <asp:Label ID="lblFirstName" runat="server"></asp:Label>
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" visible="false" id="imgFirstNameYes" runat="server" class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" visible="false" id="imgFirstNameNo" runat="server" class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30">
                                                            <asp:Label ID="lblFirstNameComments" runat="server"></asp:Label></td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr class="adm-form-row-tr" id="passportsameasFirstName" runat="server" visible="false">
                                            <td class="width30 td-rightlabel">
                                                <label id="labelpassportsameasFirstName" runat="server" for="firstname">Passport First Name same as Above </label>
                                            </td>
                                            <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">
                                                            <asp:Label ID="lblpassportsameasFirstName" runat="server"></asp:Label>
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" visible="false" id="imgpassportsameasFirstNameYes" runat="server" class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" visible="false" id="imgpassportsameasFirstNameNo" runat="server" class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30">
                                                            <asp:Label ID="lblpassportsameasFirstNameComments" runat="server"></asp:Label></td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr class="adm-form-row-tr" id="lastname" runat="server" visible="false">
                                            <td class="width30 td-rightlabel">
                                                <label id="labellastname" runat="server" for="lastname">Family Name *</label>
                                            </td>
                                            <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">
                                                            <asp:Label ID="lblLastName" runat="server"></asp:Label>
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" visible="false" id="imglastnameYes" runat="server" class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" visible="false" id="imglastnameNo" runat="server" class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30">
                                                            <asp:Label ID="lblLastNameComments" runat="server"></asp:Label></td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr class="adm-form-row-tr" id="passportsameasLastName" runat="server" visible="false">
                                            <td class="width30 td-rightlabel">
                                                <label id="labelpassportsameasLastName" runat="server" for="firstname">Passport Family Name same as Above</label>
                                            </td>
                                            <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">
                                                            <asp:Label ID="lblpassportsameasLastName" runat="server"></asp:Label>
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" visible="false" id="imgpassportsameasLastNameYes" runat="server" class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" visible="false" id="imgpassportsameasLastNameNo" runat="server" class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30">
                                                            <asp:Label ID="lblpassportsameasLastNameComments" runat="server"></asp:Label>

                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr class="adm-form-row-tr" id="preferedname" runat="server" visible="false">
                                            <td class="width30 td-rightlabel">
                                                <label id="labelpreferreName" runat="server" for="preferreName">Preferred Name</label>
                                            </td>
                                            <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">
                                                            <asp:Label ID="lblPrefferedName" runat="server"></asp:Label>
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" visible="false" id="imgpreferednameYes" runat="server" class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" visible="false" id="imgpreferednameNo" runat="server" class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30">
                                                            <asp:Label ID="lblPrefferedNameComments" runat="server"></asp:Label></td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr class="adm-form-row-tr" id="middlename" runat="server" visible="false">
                                            <td class="width30 td-rightlabel">
                                                <label id="labelmiddlename" runat="server" for="middlename">Middle Name(s)</label>
                                            </td>
                                            <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">
                                                            <asp:Label ID="lblMiddleName" runat="server"></asp:Label>
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" visible="false" id="imgmiddlenameYes" runat="server" class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" visible="false" id="imgmiddlenameNo" runat="server" class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30">
                                                            <asp:Label ID="lblMiddleNameComments" runat="server"></asp:Label></td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr class="adm-form-row-tr" id="passportsameasmiddlename" runat="server" visible="false">
                                            <td class="width30 td-rightlabel">
                                                <label id="labelpassportsameasmiddlename" runat="server" for="firstname">Passport Middle Name same as Above</label>
                                            </td>
                                            <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">
                                                            <asp:Label ID="lblpassportsameasmiddlename" runat="server"></asp:Label>
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" visible="false" id="imgpassportsameasmiddlenameYes" runat="server" class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" visible="false" id="imgpassportsameasmiddlenameNo" runat="server" class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30">
                                                            <asp:Label ID="lblpassportsameasmiddlenameComments" runat="server"></asp:Label></td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr class="adm-form-row-tr" id="dob" runat="server" visible="false">
                                            <td class="width30 td-rightlabel">
                                                <label id="labeldob" runat="server" for="dob">Date of birth *</label>
                                            </td>
                                            <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">
                                                            <asp:Label ID="lblDOB" runat="server"></asp:Label>
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" visible="false" id="imgdobYes" runat="server" class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" visible="false" id="imgdobNo" runat="server" class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30">
                                                            <asp:Label ID="lblDOBComments" runat="server"></asp:Label></td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr class="adm-form-row-tr" id="gender" runat="server" visible="false">
                                            <td class="width30 td-rightlabel">
                                                <label id="labelgender" runat="server" for="gender">Gender *</label>
                                            </td>
                                            <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">
                                                            <asp:Label ID="lblGender" runat="server"></asp:Label>
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" visible="false" id="imggenderYes" runat="server" class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" visible="false" id="imggenderNo" runat="server" class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30">
                                                            <asp:Label ID="lblGenderComments" runat="server"></asp:Label></td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr class="adm-form-row-tr" id="nationality" runat="server" visible="false">
                                            <td class="width30 td-rightlabel">
                                                <label id="labelNationality" runat="server" for="Nationality">Citizenship</label></td>
                                            <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">
                                                            <asp:Label ID="lblNationality" runat="server"></asp:Label>
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" visible="false" id="imgnationalityYes" runat="server" class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" visible="false" id="imgnationalityNo" runat="server" class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30">
                                                            <asp:Label ID="lblNationalityComments" runat="server"></asp:Label>

                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>

                                        </tr>
                                        <tr class="adm-form-row-tr" id="chineseCode" runat="server" role="group" aria-labelledby="label-chineseCommercialCode" visible="false">
                                            <td class="width30 td-rightlabel">
                                                <label id="labelChineseCode" runat="server" for="chineseCommercialCode">Do you ever use a Chinese Commercial Code Number for your names?</label></td>
                                            <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">
                                                            <asp:Label ID="lblchineseCode" runat="server"></asp:Label>
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" visible="false" id="imgchineseCodeYes" runat="server" class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" visible="false" id="imgchineseCodeNo" runat="server" class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30">
                                                            <asp:Label ID="lblchineseCodeComments" runat="server"></asp:Label>

                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>

                                        </tr>
                                        <tr class="adm-form-row-tr" runat="server" id="textChineseCodeDiv" visible="false">
                                            <td class="width30 td-rightlabel">
                                                <label id="lblChineseCodeNumber" runat="server" for="chineseCodeNumber">Chinese Commercial Code Number</label></td>
                                            <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">
                                                            <asp:Label ID="lblChineseCodeNo" runat="server"></asp:Label>
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" visible="false" id="imgChineseCodeNoYes" runat="server" class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" visible="false" id="imgChineseCodeNoNo" runat="server" class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30">
                                                            <asp:Label ID="lblChineseCodeNoComments" runat="server"></asp:Label>

                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>

                                        </tr>
                                        <tr class="adm-form-row-tr" id="russianName" runat="server" visible="false">
                                            <td class="width30 td-rightlabel">
                                                <label id="labelRussianName" runat="server" for="russianPatronymicName">In English, provide your patronymic name</label></td>
                                            <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">
                                                            <asp:Label ID="lblrussianName" runat="server"></asp:Label>
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" visible="false" id="imgrussianNameYes" runat="server" class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" visible="false" id="imgrussianNameNo" runat="server" class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30">
                                                            <asp:Label ID="lblrussianNameComments" runat="server"></asp:Label>

                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>

                                        </tr>

                                        <tr class="adm-form-row-tr" id="dualNationality" runat="server" visible="false">
                                            <td class="width30 td-rightlabel">
                                                <label id="labelDualNationality" runat="server" for="dualNationality">Do you have dual Citizenship?</label></td>
                                            <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">
                                                            <asp:Label ID="lblDualNationality" runat="server"></asp:Label>
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" visible="false" id="imgdualNationalityYes" runat="server" class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" visible="false" id="imgdualNationalityNo" runat="server" class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30">
                                                            <asp:Label ID="lblDualNationalityComments" runat="server"></asp:Label>

                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>

                                        </tr>

                                        <tr class="adm-form-row-tr" id="secondNation" runat="server" visible="false">
                                            <td class="width30 td-rightlabel">
                                                <label id="labelSecondNation" runat="server" for="SecondNationality">Citizenship</label></td>
                                            <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">
                                                            <asp:Label ID="lblOtherNation" runat="server"></asp:Label>
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" visible="false" id="imgsecondNationYes" runat="server" class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" visible="false" id="imgsecondNationNo" runat="server" class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30">
                                                            <asp:Label ID="lblOtherNationComments" runat="server"></asp:Label>

                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>

                                        </tr>
                                        <tr class="adm-form-row-tr" id="birthcountry" runat="server" visible="false">
                                            <td class="width30 td-rightlabel">
                                                <label id="labelbirthcountry" runat="server" for="birthcountry">Country of birth</label></td>
                                            <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">
                                                            <asp:Label ID="lblBirthCountry" runat="server"></asp:Label>
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" visible="false" id="imgbirthcountryYes" runat="server" class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" visible="false" id="imgbirthcountryNo" runat="server" class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30">
                                                            <asp:Label ID="lblBirthCountryComments" runat="server"></asp:Label>

                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>

                                        </tr>
                                        <tr class="adm-form-row-tr" id="marital" runat="server" visible="false">
                                            <td class="width30 td-rightlabel">
                                                <label id="labelMarital" runat="server" for="Marital">Marital Status</label></td>
                                            <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">
                                                            <asp:Label ID="lblMarital" runat="server"></asp:Label>
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" visible="false" id="imgmaritalYes" runat="server" class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" visible="false" id="imgmaritalNo" runat="server" class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30">
                                                            <asp:Label ID="lblMaritalComments" runat="server"></asp:Label>

                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>

                                        </tr>
                                        <tr class="adm-form-row-tr" id="statusMarried" runat="server" role="group" visible="false">
                                            <td class="width30 td-rightlabel">
                                                <label id="lblSpouseName" runat="server" for="spouseName">Spouse Name</label></td>
                                            <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">
                                                            <asp:Label ID="labelspouseName" runat="server"></asp:Label>
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" visible="false" id="imgspouseNameYes" runat="server" class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" visible="false" id="imgspouseNameNo" runat="server" class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30">
                                                            <asp:Label ID="labelspouseNameComments" runat="server"></asp:Label>

                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>

                                        </tr>
                                        <tr class="adm-form-row-tr" id="SpouseNationality" runat="server" visible="false">
                                            <td class="width30 td-rightlabel">
                                                <label id="lblSpouseNatinality" runat="server" for="NationalitySpouse">Nationality of Spouse</label></td>
                                            <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">
                                                            <asp:Label ID="lblSpouseNationality" runat="server"></asp:Label>
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" visible="false" id="imgSpouseNationalityYes" runat="server" class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" visible="false" id="imgSpouseNationalityNo" runat="server" class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30">
                                                            <asp:Label ID="lblSpouseNationalityComments" runat="server"></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>

                                        </tr>
                                        <tr class="adm-form-row-tr" id="SpouseDOB" runat="server" visible="false">
                                            <td class="width30 td-rightlabel">
                                                <label id="lblSpouseDOB" runat="server" for="spousedob">Spouse Date of birth</label></td>
                                            <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">
                                                            <asp:Label ID="labelSpouseDOB" runat="server"></asp:Label>
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" visible="false" id="imgSpouseDOBYes" runat="server" class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" visible="false" id="imgSpouseDOBNo" runat="server" class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30">
                                                            <asp:Label ID="labelSpouseDOBComments" runat="server"></asp:Label>

                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>

                                        </tr>
                                        <tr class="adm-form-row-tr" id="MarriageDate" runat="server" visible="false">
                                            <td class="width30 td-rightlabel">
                                                <label id="lblMarriageDate" runat="server" for="marriagedate">Date of Marriage</label></td>
                                            <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">
                                                            <asp:Label ID="labelMarriagedate" runat="server"></asp:Label>
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" visible="false" id="imgMarriageDateYes" runat="server" class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" visible="false" id="imgMarriageDateNo" runat="server" class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30">
                                                            <asp:Label ID="labelMarriagedateComments" runat="server"></asp:Label>

                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>

                                        </tr>
                                        <tr class="adm-form-row-tr" id="higheststudy" runat="server" visible="false">
                                            <td class="width30 td-rightlabel">
                                                <label id="labelhigheststudy" runat="server" for="higheststudy">Highest study level successfully completed</label>
                                            </td>
                                                <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">
                                                            <asp:Label ID="lblhigheststudy" runat="server"></asp:Label>
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" visible="false" id="imghigheststudyYes" runat="server" class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" visible="false" id="imghigheststudyNo" runat="server" class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30">
                                                            <asp:Label ID="lblhigheststudyComments" runat="server"></asp:Label>

                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>

                                        </tr>
                                        <tr class="adm-form-row-tr" id="disability" runat="server" visible="false">
                                            <td class="width30 td-rightlabel">
                                                <label id="labeldisability" runat="server" for="disability">Do you have any disability, impairment, or a long term condition</label></td>
                                            <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">
                                                            <asp:Label ID="lblDisability" runat="server"></asp:Label>
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" visible="false" id="imgDisabilityYes" runat="server" class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" visible="false" id="imgDisabilityNo" runat="server" class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30">
                                                            <asp:Label ID="lblDisabilityComments" runat="server"></asp:Label>

                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>

                                        </tr>
                                        <tr class="adm-form-row-tr" id="disabilitydesc" runat="server" visible="false">
                                            <td class="width30 td-rightlabel">
                                                <label id="labeldisabilitydesc" runat="server" for="disabilitydesc">Disability Description</label></td>
                                            <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">
                                                            <asp:Label ID="lbldisabilitydesc" runat="server"></asp:Label>
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" visible="false" id="imgdisabilitydescYes" runat="server" class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" visible="false" id="imgdisabilitydescNo" runat="server" class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30">
                                                            <asp:Label ID="lbldisabilitydescComments" runat="server"></asp:Label>

                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>

                                        </tr>
                                        <tr class="adm-form-row-tr" id="agent" runat="server" visible="false">
                                            <td class="width30 td-rightlabel">
                                                <label id="labelagent" runat="server" for="agent">Are you reffered by Agent</label></td>
                                            <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">
                                                            <asp:Label ID="lblAgent" runat="server"></asp:Label>
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" visible="false" id="imgAgentYes" runat="server" class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" visible="false" id="imgAgentNo" runat="server" class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30">
                                                            <asp:Label ID="lblAgentComments" runat="server"></asp:Label>

                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>

                                        </tr>
                                        <tr class="adm-form-row-tr" id="agentList" runat="server" visible="false">
                                            <td class="width30 td-rightlabel">
                                                <label id="labelagentList" runat="server" for="agentList">Agent Name</label></td>
                                            <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">
                                                            <asp:Label ID="lblAgentList" runat="server"></asp:Label>
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" visible="false" id="imgAgentListYes" runat="server" class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" visible="false" id="imgAgentListNo" runat="server" class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30">
                                                            <asp:Label ID="lblAgentListComments" runat="server"></asp:Label>

                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>

                                        </tr>
                                        <% 
                                            for (int personal = 0; personal < CustomControlsPersonal.Count; personal++)
                                            {
                                                string Comments = objCom.GetCustomFieldAdminComments(ApplicantID, 1, CustomControlsPersonal[personal].labeldescription, universityID);
                                                string[] com = Comments.Split('~');

                                                string Admincomments = com[0];
                                                string Adminaction = "0";
                                                if (com.Length > 1)
                                                    Adminaction = com[1];
                                        %>
                                        <tr class="adm-form-row-tr" id="custom<%= CustomControlsPersonal[personal].customfieldid%>">
                                            <td class="width30 td-rightlabel">
                                                <label id="labelcustom<%= CustomControlsPersonal[personal].customfieldid%>"><%=  CustomControlsPersonal[personal].labeldescription %> </label>
                                            </td>
                                            <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">
                                                            <span><%=objCom.GetCustomFieldValue(ApplicantID,1,CustomControlsPersonal[personal].customfieldid) %></span>
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" id="<%="imgYes"+ CustomControlsPersonal[personal].customfieldid %>" style:'<%= Adminaction == "1" ? "visibility: visible;": "visibility:hidden;"  %>' class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" id="<%="imgNo"+ CustomControlsPersonal[personal].customfieldid %>" style:'<%= Adminaction == "0" ? "visibility: visible;": "visibility:hidden;"  %>' class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30 td-rightlabel">
                                                            <span><%=Admincomments %></span>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <%} %>
                                    </table>
									 <table cellpadding="0" cellspacing="0" class="table">
                                        <tr>
                                            <td class="width30 td-rightlabel">SUPERVISIOR REVIEW & COMMENTS

                                            </td>
                                            <td class="width70">
                                                <asp:TextBox ID="txtPersonalComments" TextMode="MultiLine" CssClass="form-control" runat="server"></asp:TextBox>
                                            </td>
                                        </tr>
                                    </table>
									
									 <!-- Personal Info End -->
                            <!-- Contact Info-->
							<div class="frm-ttle">CONTACT DETAILS</div>
							 <table cellpadding="0" cellspacing="0" class="table">
                                        <tr>
                                            <td class="width30"></td>
                                            <td class="width70 bg-gry-head text-right">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50">STUDENT RESPONSE
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" class="hd-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" class="hd-cross-icon">
                                                        </td>
                                                        <td class="width30">REVIEW
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>

                                        <tr class="adm-form-row-tr" id="email" runat="server" visible="false">
                                            <td class="width30 td-rightlabel">
                                                <label id="labelemail" runat="server" for="email">Email *</label>
                                            </td>
                                            <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">
                                                            <asp:Label ID="lblEmail" runat="server"></asp:Label>
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" visible="false" id="imgEmailYes" runat="server" class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" visible="false" id="imgEmailNo" runat="server" class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30 td-rightlabel">
                                                            <asp:Label ID="lblEmailComments" runat="server"></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr class="adm-form-row-tr" id="mobile" runat="server" visible="false">
                                            <td class="width30 td-rightlabel">
                                                <label id="labelMobile" runat="server" for="Mobile">Mobile/Cellular Number *</label>
                                            </td>
                                            <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">
                                                            <asp:Label ID="lblMobile" runat="server"></asp:Label>
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" visible="false" id="imgMobileYes" runat="server" class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" visible="false" id="imgMobileNo" runat="server" class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30">
                                                            <asp:Label ID="lblMobileComments" runat="server"></asp:Label></td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr class="adm-form-row-tr" id="phone" runat="server" visible="false">
                                            <td class="width30 td-rightlabel">
                                                <label id="labelphone" runat="server" for="phone">Home phone</label>
                                            </td>
                                            <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">
                                                            <asp:Label ID="lblHomePhone" runat="server"></asp:Label>
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" visible="false" id="imgHomePhoneYes" runat="server" class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" visible="false" id="imgHomePhoneNo" runat="server" class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30">
                                                            <asp:Label ID="lblHomePhoneComments" runat="server"></asp:Label></td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr class="adm-form-row-tr" id="skype" runat="server" visible="false">
                                            <td class="width30 td-rightlabel">
                                                <label id="labelskype" runat="server" for="skype">WOULD YOU LIKE TO CONNECT VIA SKYPE</label>
                                            </td>
                                            <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">
                                                            <asp:Label ID="lblSkype" runat="server"></asp:Label>
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" visible="false" id="imgSkypeYes" runat="server" class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" visible="false" id="imgSkypeNo" runat="server" class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30">
                                                            <asp:Label ID="lblSkypeComments" runat="server"></asp:Label>

                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr class="adm-form-row-tr" id="skypeDesc" runat="server" visible="false">
                                            <td class="width30 td-rightlabel">
                                                <label id="labelskypeDesc" runat="server" for="skypeDesc">Skype ID</label>
                                            </td>
                                            <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">
                                                            <asp:Label ID="lblSkypeDescription" runat="server"></asp:Label>
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" visible="false" id="imgSkypeDescriptionYes" runat="server" class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" visible="false" id="imgSkypeDescriptionNo" runat="server" class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30">
                                                            <asp:Label ID="lblSkypeDescriptionComments" runat="server"></asp:Label>

                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr class="adm-form-row-tr" id="whatsapp" runat="server" visible="false">
                                            <td class="width30 td-rightlabel">
                                                <label id="labelwhatsapp" runat="server" for="whatsapp">WOULD YOU LIKE TO CONNECT VIA WHATSAPP </label>
                                            </td>
                                            <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">
                                                            <asp:Label ID="lblWhatsapp" runat="server"></asp:Label>
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" visible="false" id="imgWhatsappYes" runat="server" class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" visible="false" id="imgWhatsappNo" runat="server" class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30">
                                                            <asp:Label ID="lblWhatsappComments" runat="server"></asp:Label></td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr class="adm-form-row-tr" id="whatsappHave" runat="server" visible="false">
                                            <td class="width30 td-rightlabel">
                                                <label id="labelwhatsappHave" runat="server" for="whatsappHave">IS YOUR WHATSAPP NO SAME AS YOUR MOBILE NO </label>
                                            </td>
                                            <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">
                                                            <asp:Label ID="lblWhatsapphave" runat="server"></asp:Label>
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" visible="false" id="imgWhatsapphaveYes" runat="server" class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" visible="false" id="imgWhatsapphaveNo" runat="server" class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30">
                                                            <asp:Label ID="lblWhatsapphaveComments" runat="server"></asp:Label></td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr class="adm-form-row-tr" id="whatsappDesc" runat="server" visible="false">
                                            <td class="width30 td-rightlabel">
                                                <label id="labelwhatsappDesc" runat="server" for="whatsappDesc">Whatsapp Number</label>
                                            </td>
                                            <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">
                                                            <asp:Label ID="lblWhastappDesription" runat="server"></asp:Label>
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" visible="false" id="imgwhatsappDescYes" runat="server" class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" visible="false" id="imgwhatsappDescNo" runat="server" class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30">
                                                            <asp:Label ID="lblWhastappDesriptionComments" runat="server"></asp:Label></td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr class="adm-form-row-tr" id="postal" runat="server" visible="false">
                                            <td class="width30 td-rightlabel">
                                                <label id="labelpostal" runat="server" for="postal">Postal Address</label>
                                            </td>
                                            <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">
                                                            <asp:Label ID="lblPostalAddress" runat="server"></asp:Label>
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" visible="false" id="imgPostalAddressYes" runat="server" class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" visible="false" id="imgPostalAddressNo" runat="server" class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30">
                                                            <asp:Label ID="lblPostalAddressComments" runat="server"></asp:Label></td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr class="adm-form-row-tr" id="address" runat="server" visible="false">
                                            <td class="width30 td-rightlabel">
                                                <label id="labeladdress" runat="server" for="address">Is your Postal Address same as your current residential address</label>
                                            </td>
                                            <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">
                                                            <asp:Label ID="lblAddress" runat="server"></asp:Label>
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" visible="false" id="imgAddressYes" runat="server" class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" visible="false" id="imgAddressNo" runat="server" class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30">
                                                            <asp:Label ID="lblAddressComments" runat="server"></asp:Label></td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr class="adm-form-row-tr" id="CurrentAddress" runat="server" visible="false">
                                            <td class="width30 td-rightlabel">
                                                <label id="labelCurrentAddress" runat="server" for="currentAddressSelection">Have you been living in the current address for Less than 1 year?</label></td>
                                            <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">
                                                            <asp:Label ID="lblCurrentAddress" runat="server"></asp:Label>
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" visible="false" id="imgCurrentAddressYes" runat="server" class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" visible="false" id="imgCurrentAddressNo" runat="server" class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30">
                                                            <asp:Label ID="lblCurrentAddressComments" runat="server"></asp:Label>

                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>

                                        </tr>
                                        <tr class="adm-form-row-tr" id="residential" runat="server" role="group" aria-labelledby="label-chineseCommercialCode" visible="false">
                                            <td class="width30 td-rightlabel">
                                                <label id="labelResidential" runat="server" for="title">Current Residential  Address</label>
                                            </td>
                                                <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">
                                                            <asp:Label ID="lblResidential" runat="server"></asp:Label>
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" visible="false" id="imgResidentialYes" runat="server" class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" visible="false" id="imgResidentialNo" runat="server" class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30">
                                                            <asp:Label ID="lblResidentialComments" runat="server"></asp:Label>

                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>

                                        </tr>
                                        <tr class="adm-form-row-tr" runat="server" id="addressHistory" visible="false">
                                            <td class="width30 td-rightlabel">
                                                <asp:HiddenField ID="hidAddressHistory" runat="server" Value="0" />
                                                <asp:HiddenField ID="hidAddressStartDate" runat="server" Value="" />
                                                <asp:HiddenField ID="hidAddressEndDate" runat="server" Value="" />
                                                <asp:HiddenField ID="hidAddress1" runat="server" Value="" />
                                                <asp:HiddenField ID="hidAddress2" runat="server" Value="" />
                                                <asp:HiddenField ID="hidAddress3" runat="server" Value="" />
                                                <asp:HiddenField ID="hidAddressCity" runat="server" Value="" />
                                                <asp:HiddenField ID="hidAddressState" runat="server" Value="" />
                                                <asp:HiddenField ID="hidAddressPostalCode" runat="server" Value="" />
                                                <asp:HiddenField ID="hidAddressCountry" runat="server" Value="" />
                                                <label id="lblPrevAddress" runat="server" for="prevaddress">Previous Address History Details</label></td>
                                            <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">
                                                            <asp:Label ID="Label38" runat="server"></asp:Label>
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" visible="false" id="imgAddressHistoryYes" runat="server" class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" visible="false" id="imgAddressHistoryNo" runat="server" class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30">
                                                            <asp:Label ID="lblAddressHistoryComments" runat="server"></asp:Label>

                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>

                                        </tr>
                                 
                                        <tr class="adm-form-row-tr" id="guardianname" runat="server" visible="false">
                                            <td class="width30 td-rightlabel">
                                                <label id="labelguardianname" runat="server" for="nomineename">GUARDIAN Full Name</label></td>
                                            <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">
                                                            <asp:Label ID="lblNominneName" runat="server"></asp:Label>
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" visible="false" id="imgNominneNameYes" runat="server" class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" visible="false" id="imgNominneNameNo" runat="server" class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30">
                                                            <asp:Label ID="lblNominneNameComments" runat="server"></asp:Label>

                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>

                                        </tr>
                                        <tr class="adm-form-row-tr" id="guardianrelation" runat="server" visible="false">
                                            <td class="width30 td-rightlabel">
                                                <label id="labelrelation" runat="server" for="relationnominee">Relationship with GUARDIAN</label></td>
                                            <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">
                                                            <asp:Label ID="lblNomineeRealtion" runat="server"></asp:Label>
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" visible="false" id="imgNomineeRealtionYes" runat="server" class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" visible="false" id="imgNomineeRealtionNo" runat="server" class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30">
                                                            <asp:Label ID="lblNomineeRealtionComments" runat="server"></asp:Label>

                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>

                                        </tr>
                                        <tr class="adm-form-row-tr" id="guardianemail" runat="server" visible="false">
                                            <td class="width30 td-rightlabel">
                                                <label id="labelguardianemail" runat="server" for="emailnominee">Email of GUARDIAN</label></td>
                                            <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">
                                                            <asp:Label ID="lblNomineeEmail" runat="server"></asp:Label>
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" visible="false" id="imgNomineeEmailYes" runat="server" class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" visible="false" id="imgNomineeEmailNo" runat="server" class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30">
                                                            <asp:Label ID="lblNomineeEmailComments" runat="server"></asp:Label>

                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>

                                        </tr>
                                        <tr class="adm-form-row-tr" id="guardianmobile" runat="server" visible="false">
                                            <td class="width30 td-rightlabel">
                                                <label id="labelguardianmobile" runat="server" for="mobilenominee">Mobile/Cellular Number of GUARDIAN</label></td>
                                            <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">
                                                            <asp:Label ID="lblNomineeMobile" runat="server"></asp:Label>
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" visible="false" id="imgNomineeMobileYes" runat="server" class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" visible="false" id="imgNomineeMobileNo" runat="server" class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30">
                                                            <asp:Label ID="lblNomineeMobileComments" runat="server"></asp:Label>

                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>

                                        </tr>

                                        <% 
                                            for (int conatct = 0; conatct < CustomControlsConatct.Count; conatct++)
                                            {
                                                string Comments = objCom.GetCustomFieldAdminComments(ApplicantID, 2, CustomControlsPersonal[conatct].labeldescription, universityID);
                                                string[] com = Comments.Split('~');

                                                string Admincomments = com[0];
                                                string Adminaction = "0";
                                                if (com.Length > 1)
                                                    Adminaction = com[1];
                                        %>
                                        <tr class="adm-form-row-tr" id="custom<%= CustomControlsConatct[conatct].customfieldid%>">
                                            <td class="width30 td-rightlabel">
                                                <label id="labelcustom<%= CustomControlsConatct[conatct].customfieldid%>"><%=  CustomControlsPersonal[conatct].labeldescription %> </label>
                                            </td>
                                            <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">
                                                            <span><%=objCom.GetCustomFieldValue(ApplicantID,2,CustomControlsConatct[conatct].customfieldid) %></span>
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" id="<%="imgYes"+ CustomControlsConatct[conatct].customfieldid %>" style:'<%= Adminaction == "1" ? "visibility: visible;": "visibility:hidden;"  %>' class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" id="<%="imgNo"+ CustomControlsConatct[conatct].customfieldid %>" style:'<%= Adminaction == "0" ? "visibility: visible;": "visibility:hidden;"  %>' class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30 td-rightlabel">
                                                            <span><%=Admincomments %></span>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <%} %>
                                    </table>
									 <table cellpadding="0" cellspacing="0" class="table">
                                        <tr>
                                            <td class="width30 td-rightlabel">SUPERVISIOR REVIEW & COMMENTS

                                            </td>
                                            <td class="width70">
                                                <asp:TextBox ID="txtConatct" TextMode="MultiLine" CssClass="form-control" runat="server"></asp:TextBox>
                                            </td>
                                        </tr>
                                    </table>
									  <!-- Contact Info End -->
                            <!-- Know Your information-->
							<div class="frm-ttle">Identification Detail</div>
							  <table cellpadding="0" cellspacing="0" class="table">
                                        <tr>
                                            <td class="width30"></td>
                                            <td class="width70 bg-gry-head text-right">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50">STUDENT RESPONSE
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" class="hd-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" class="hd-cross-icon">
                                                        </td>
                                                        <td class="width30">REVIEW
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>

                                        <tr class="adm-form-row-tr" id="passportno" runat="server" visible="false">
                                            <td class="width30 td-rightlabel">
                                                <label id="labelpassportno" runat="server" for="passportno">Passport Number </label>
                                            </td>
                                            <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">
                                                            <asp:Label ID="lblPassportNo" runat="server"></asp:Label>
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" visible="false" id="imgPassportNoYes" runat="server" class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" visible="false" id="imgPassportNoNo" runat="server" class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30 td-rightlabel">
                                                            <asp:Label ID="labelpassportnoComments" runat="server"></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr class="adm-form-row-tr" id="dateofissue" runat="server" visible="false">
                                            <td class="width30 td-rightlabel">
                                                <label id="labeldateofissue" runat="server" for="dateofissue">Date of Issue </label>
                                            </td>
                                            <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">
                                                            <asp:Label ID="lblDateOfissue" runat="server"></asp:Label>

                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" visible="false" id="imgDateOfissueYes" runat="server" class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" visible="false" id="imgDateOfissueNo" runat="server" class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30">
                                                            <asp:Label ID="lblDateOfissueComments" runat="server"></asp:Label></td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr class="adm-form-row-tr" id="expirydate" runat="server" visible="false">
                                            <td class="width30 td-rightlabel">
                                                <label id="labelexpirydate" runat="server" for="expirydate">Expiry Date </label>
                                            </td>
                                            <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">
                                                            <asp:Label ID="lblExpiryDate" runat="server"></asp:Label>
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" visible="false" id="imgExpiryDateYes" runat="server" class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" visible="false" id="imgExpiryDateNo" runat="server" class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30">
                                                            <asp:Label ID="lblExpiryDateComments" runat="server"></asp:Label></td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr class="adm-form-row-tr" id="countryIssue" runat="server" visible="false">
                                            <td class="width30 td-rightlabel">
                                                <label id="labelcountryIssue" runat="server" for="countryIssue">COUNTRY OF ISSUE </label>
                                            </td>
                                            <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">
                                                            <asp:Label ID="lblcountryIssue" runat="server"></asp:Label>
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" visible="false" id="imgcountryIssueYes" runat="server" class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" visible="false" id="imgcountryIssueNo" runat="server" class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30">
                                                            <asp:Label ID="lblcountryIssueComments" runat="server"></asp:Label>

                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr class="adm-form-row-tr" id="issueplace" runat="server" visible="false">
                                            <td class="width30 td-rightlabel">
                                                <label id="labelissueplace" runat="server" for="issueplace">CITY OF ISSUE </label>
                                            </td>
                                            <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">
                                                            <asp:Label ID="lblissueplace" runat="server"></asp:Label>
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" visible="false" id="imgissueplaceYes" runat="server" class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" visible="false" id="imgissueplaceNo" runat="server" class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30">
                                                            <asp:Label ID="lblissueplaceComments" runat="server"></asp:Label>

                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr class="adm-form-row-tr" id="alternateIdentitytype" runat="server" visible="false">
                                            <td class="width30 td-rightlabel">
                                                <label id="labelalternateIdentitytype" runat="server" for="alternateIdentitytype">Select Identity Proof Type</label>
                                            </td>
                                            <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">
                                                            <asp:Label ID="lblalternateIdentitytype" runat="server"></asp:Label>
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" visible="false" id="imgalternateIdentitytypeYes" runat="server" class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" visible="false" id="imgalternateIdentitytypeNo" runat="server" class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30">
                                                            <asp:Label ID="lblalternateIdentitytypeComments" runat="server"></asp:Label></td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr class="adm-form-row-tr" id="alternateIdentityNo" runat="server" visible="false">
                                            <td class="width30 td-rightlabel">
                                                <label id="labelalternateIdentityNo" runat="server" for="alternateIdentityNo">Identity Proof Number</label>
                                            </td>
                                            <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">
                                                            <asp:Label ID="lblalternateIdentityNo" runat="server"></asp:Label>
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" visible="false" id="imgalternateIdentityNoYes" runat="server" class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" visible="false" id="imgalternateIdentityNoNo" runat="server" class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30">
                                                            <asp:Label ID="lblalternateIdentityNoComments" runat="server"></asp:Label></td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr class="adm-form-row-tr" id="alternatedobIdentitytype" runat="server" visible="false">
                                            <td class="width30 td-rightlabel">
                                                <label id="labelalternatedobIdentitytype" runat="server" for="alternatedobIdentitytype">Select DOB Proof Type </label>
                                            </td>
                                            <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">
                                                            <asp:Label ID="lblalternatedobIdentitytype" runat="server"></asp:Label>
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" visible="false" id="imgalternatedobIdentitytypeYes" runat="server" class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" visible="false" id="imgalternatedobIdentitytypeNo" runat="server" class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30">
                                                            <asp:Label ID="lblalternatedobIdentitytypeComments" runat="server"></asp:Label></td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr class="adm-form-row-tr" id="alternatedobIdentityNo" runat="server" visible="false">
                                            <td class="width30 td-rightlabel">
                                                <label id="labelalternatedobIdentityNo" runat="server" for="alternatedobIdentityNo">DOB proof Number</label>
                                            </td>
                                            <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">
                                                            <asp:Label ID="lblalternatedobIdentityNo" runat="server"></asp:Label>
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" visible="false" id="imgalternatedobIdentityNoYes" runat="server" class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" visible="false" id="imgalternatedobIdentityNoNo" runat="server" class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30">
                                                            <asp:Label ID="lblalternatedobIdentityNoComments" runat="server"></asp:Label></td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr class="adm-form-row-tr" id="alternateresidenceIdentitytype" runat="server" visible="false">
                                            <td class="width30 td-rightlabel">
                                                <label id="labelalternateresidenceIdentitytype" runat="server" for="alternateresidenceIdentitytype">Select Residence Proof Type </label>
                                            </td>
                                            <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">
                                                            <asp:Label ID="lblalternateresidenceIdentitytype" runat="server"></asp:Label>
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" visible="false" id="imgalternateresidenceIdentitytypeYes" runat="server" class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" visible="false" id="imgalternateresidenceIdentitytypeNo" runat="server" class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30">
                                                            <asp:Label ID="lblalternateresidenceIdentitytypeComments" runat="server"></asp:Label></td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr class="adm-form-row-tr" id="alternateresidenceIdentityNo" runat="server" visible="false">
                                            <td class="width30 td-rightlabel">
                                                <label id="labelalternateresidenceIdentityNo" runat="server" for="alternateresidenceIdentityNo">Residence Proof Number</label></td>
                                            <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">
                                                            <asp:Label ID="lblalternateresidenceIdentityNo" runat="server"></asp:Label>
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" visible="false" id="imgalternateresidenceIdentityNoYes" runat="server" class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" visible="false" id="imgalternateresidenceIdentityNoNo" runat="server" class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30">
                                                            <asp:Label ID="lblalternateresidenceIdentityNoComments" runat="server"></asp:Label>

                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>

                                        </tr>

                                        <% 
                                            for (int KYS = 0; KYS < CustomControlsKYS.Count; KYS++)
                                            {
                                                string Comments = objCom.GetCustomFieldAdminComments(ApplicantID, 3, CustomControlsKYS[KYS].labeldescription, universityID);
                                                string[] com = Comments.Split('~');

                                                string Admincomments = com[0];
                                                string Adminaction = "0";
                                                if (com.Length > 1)
                                                    Adminaction = com[1];
                                        %>
                                        <tr class="adm-form-row-tr" id="custom<%= CustomControlsKYS[KYS].customfieldid%>">
                                            <td class="width30 td-rightlabel">
                                                <label id="labelcustom<%= CustomControlsKYS[KYS].customfieldid%>"><%=  CustomControlsKYS[KYS].labeldescription %> </label>
                                            </td>
                                            <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">
                                                            <span><%=objCom.GetCustomFieldValue(ApplicantID,3,CustomControlsKYS[KYS].customfieldid) %></span>
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" id="<%="imgYes"+ CustomControlsKYS[KYS].customfieldid %>" style:'<%= Adminaction == "1" ? "visibility: visible;": "visibility:hidden;"  %>' class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" id="<%="imgNo"+ CustomControlsKYS[KYS].customfieldid %>" style:'<%= Adminaction == "0" ? "visibility: visible;": "visibility:hidden;"  %>' class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30 td-rightlabel">
                                                            <span><%=Admincomments %></span>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <%} %>
                                    </table>
									<table cellpadding="0" cellspacing="0" class="table">
                                        <tr>
                                            <td class="width30 td-rightlabel">SUPERVISIOR REVIEW & COMMENTS

                                            </td>
                                            <td class="width70">
                                                <asp:TextBox ID="txtKnowyournfo" TextMode="MultiLine" CssClass="form-control" runat="server"></asp:TextBox>
                                            </td>
                                        </tr>
                                    </table>
									<!-- Know Your information End-->
                            <!--Education Details-->
							<div class="frm-ttle">Education Detail</div>
							 <table cellpadding="0" cellspacing="0" class="table">
                                        <tr>
                                            <td class="width30"></td>
                                            <td class="width70 bg-gry-head text-right">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50">STUDENT RESPONSE
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" class="hd-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" class="hd-cross-icon">
                                                        </td>
                                                        <td class="width30">REVIEW
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>

                                        <tr class="adm-form-row-tr" id="highschool" runat="server" visible="false">
                                            <td class="width30 td-rightlabel">
                                                <label id="labelhighschool" runat="server" for="highschool">Have you completed high school?</label>
                                            </td>
                                            <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">
                                                            <asp:Label ID="lblhighschool" runat="server"></asp:Label>
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" visible="false" id="imghighschoolYes" runat="server" class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" visible="false" id="imghighschoolNo" runat="server" class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30 td-rightlabel">
                                                            <asp:Label ID="lblhighschoolComments" runat="server"></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr class="adm-form-row-tr" id="highschoolCountry" runat="server" visible="false">
                                            <td class="width30 td-rightlabel">
                                                <label id="labelhighschoolCountry" runat="server" for="highschoolCountry">Country of High School</label>
                                            </td>
                                            <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">
                                                            <asp:Label ID="lblhighschoolCountry" runat="server"></asp:Label>

                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" visible="false" id="imghighschoolCountryYes" runat="server" class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" visible="false" id="imghighschoolCountryNo" runat="server" class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30">
                                                            <asp:Label ID="lblhighschoolCountryComments" runat="server"></asp:Label></td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr class="adm-form-row-tr" id="highschoolstartDate" runat="server" visible="false">
                                            <td class="width30 td-rightlabel">
                                                <label id="labelhighschoolstartDate" runat="server" for="highschoolstartDate">Start Date </label>
                                            </td>
                                            <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">
                                                            <asp:Label ID="lblhighschoolstartDate" runat="server"></asp:Label>
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" visible="false" id="imghighschoolstartDateYes" runat="server" class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" visible="false" id="imghighschoolstartDateNo" runat="server" class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30">
                                                            <asp:Label ID="lblhighschoolstartDateComments" runat="server"></asp:Label></td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr class="adm-form-row-tr" id="highschoolendDate" runat="server" visible="false">
                                            <td class="width30 td-rightlabel">
                                                <label id="labelhighschoolendDate" runat="server" for="highschoolendDate">End Date </label>
                                            </td>
                                            <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">
                                                            <asp:Label ID="lblhighschoolendDate" runat="server"></asp:Label>
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" visible="false" id="imghighschoolendDateYes" runat="server" class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" visible="false" id="imghighschoolendDateNo" runat="server" class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30">
                                                            <asp:Label ID="lblhighschoolendDateComments" runat="server"></asp:Label>

                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr class="adm-form-row-tr" id="highschoolName" runat="server" visible="false">
                                            <td class="width30 td-rightlabel">
                                                <label id="labelhighschoolName" runat="server" for="highschoolName">Name of School</label>
                                            </td>
                                            <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">
                                                            <asp:Label ID="lblhighschoolName" runat="server"></asp:Label>
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" visible="false" id="imghighschoolNameYes" runat="server" class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" visible="false" id="imghighschoolNameNo" runat="server" class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30">
                                                            <asp:Label ID="lblhighschoolNameComments" runat="server"></asp:Label>

                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr class="adm-form-row-tr" id="highschoolQualificationtype" runat="server" visible="false">
                                            <td class="width30 td-rightlabel">
                                                <label id="labelhighschoolQualificationtype" runat="server" for="highschoolQualificationtype">Qualification Name</label>
                                            </td>
                                            <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">
                                                            <asp:Label ID="lblhighschoolQualificationtype" runat="server"></asp:Label>
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" visible="false" id="imghighschoolQualificationtypeYes" runat="server" class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" visible="false" id="imghighschoolQualificationtypeNo" runat="server" class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30">
                                                            <asp:Label ID="lblhighschoolQualificationtypeComments" runat="server"></asp:Label></td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr class="adm-form-row-tr" id="highschoolstudymode" runat="server" visible="false">
                                            <td class="width30 td-rightlabel">
                                                <label id="labelhighschoolstudymode" runat="server" for="highschoolstudymode">Mode of study</label>
                                            </td>
                                            <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">
                                                            <asp:Label ID="lblhighschoolstudymode" runat="server"></asp:Label>
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" visible="false" id="imghighschoolstudymodeYes" runat="server" class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" visible="false" id="imghighschoolstudymodeNo" runat="server" class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30">
                                                            <asp:Label ID="lblhighschoolstudymodeComments" runat="server"></asp:Label></td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr class="adm-form-row-tr" id="highschoollanguage" runat="server" visible="false">
                                            <td class="width30 td-rightlabel">
                                                <label id="labelhighschoollanguage" runat="server" for="highschoollanguage">Language (Medium) of Study</label>
                                            </td>
                                            <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">
                                                            <asp:Label ID="lblhighschoollanguage" runat="server"></asp:Label>
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" visible="false" id="imghighschoollanguageYes" runat="server" class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" visible="false" id="imghighschoollanguageNo" runat="server" class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30">
                                                            <asp:Label ID="lblhighschoollanguageComments" runat="server"></asp:Label></td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr class="adm-form-row-tr" id="gradetype" runat="server" visible="false">
                                            <td class="width30 td-rightlabel">
                                                <label id="labelgradetype" runat="server" for="EnglishCourse">Grade Type</label>
                                            </td>
                                            <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">
                                                            <asp:Label ID="lblgradetype" runat="server"></asp:Label>
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" visible="false" id="imggradetypeYes" runat="server" class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" visible="false" id="imggradetypeNo" runat="server" class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30">
                                                            <asp:Label ID="lblgradetypeComments" runat="server"></asp:Label></td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr class="adm-form-row-tr" id="highschoolgradeachieved" runat="server" visible="false">
                                            <td class="width30 td-rightlabel">
                                                <label id="labelgradeachieved" runat="server" for="gradeachieved">Final Grade Achieved </label>
                                            </td>
                                            <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">
                                                            <asp:Label ID="lblgradeachieved" runat="server"></asp:Label>
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" visible="false" id="imghighschoolgradeachievedYes" runat="server" class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" visible="false" id="imghighschoolgradeachievedNo" runat="server" class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30">
                                                            <asp:Label ID="lblgradeachievedComments" runat="server"></asp:Label></td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr class="adm-form-row-tr" id="ExpectedHighSchoolDategrade" runat="server" visible="false">
                                            <td class="width30 td-rightlabel">
                                                <label id="labelExpectedHighSchoolDategrade" runat="server" for="EnglishCourse">Expected dates when results will be declared </label>
                                            </td>
                                            <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">
                                                            <asp:Label ID="lblExpectedHighSchoolDategrade" runat="server"></asp:Label>
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" visible="false" id="imgExpectedHighSchoolDategradeYes" runat="server" class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" visible="false" id="imgExpectedHighSchoolDategradeNo" runat="server" class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30">
                                                            <asp:Label ID="lblExpectedHighSchoolDategradeComments" runat="server"></asp:Label>

                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>

                                        </tr>
                                        <tr class="adm-form-row-tr" id="highschoolverify" runat="server" visible="false">
                                            <td class="width30 td-rightlabel">
                                                <label id="labelhighschoolverify" runat="server" for="highschoolverify">Name of Contact who can verify this qualification </label>
                                            </td>
                                            <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">
                                                            <asp:Label ID="lblhighschoolverify" runat="server"></asp:Label>
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" visible="false" id="imghighschoolverifyYes" runat="server" class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" visible="false" id="imghighschoolverifyNo" runat="server" class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30">
                                                            <asp:Label ID="lblhighschoolverifyComments" runat="server"></asp:Label>

                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>

                                        </tr>
                                        <tr class="adm-form-row-tr" id="highschoolrelation" runat="server" visible="false">
                                            <td class="width30 td-rightlabel">
                                                <label id="labelhighschoolrelation" runat="server" for="highschoolrelation">Relationship with the Contact </label>
                                            </td>
                                            <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">
                                                            <asp:Label ID="lblhighschoolrelation" runat="server"></asp:Label>
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" visible="false" id="imghighschoolrelationYes" runat="server" class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" visible="false" id="imghighschoolrelationNo" runat="server" class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30">
                                                            <asp:Label ID="lblhighschoolrelationComments" runat="server"></asp:Label>

                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>

                                        </tr>
                                        <tr class="adm-form-row-tr" id="highschoolcontactEmail" runat="server" visible="false">
                                            <td class="width30 td-rightlabel">
                                                <label id="labelhighschoolcontactEmail" runat="server" for="highschoolcontactEmail">Email ID of Contact who can verify your qualification  </label>
                                            </td>
                                            <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">
                                                            <asp:Label ID="lblhighschoolcontactEmail" runat="server"></asp:Label>
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" visible="false" id="imghighschoolcontactEmailYes" runat="server" class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" visible="false" id="imghighschoolcontactEmailNo" runat="server" class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30">
                                                            <asp:Label ID="lblhighschoolcontactEmailComments" runat="server"></asp:Label>

                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>

                                        </tr>
                                        <tr class="adm-form-row-tr" id="highschoolcontactMobile" runat="server" visible="false">
                                            <td class="width30 td-rightlabel">
                                                <label id="labelhighschoolcontactMobile" runat="server" for="highschoolcontactMobile">Mobile/Cellular Number of Contact who can verify your qualification</label></td>
                                            <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">
                                                            <asp:Label ID="lblhighschoolcontactMobile" runat="server"></asp:Label>
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" visible="false" id="imghighschoolcontactMobileYes" runat="server" class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" visible="false" id="imghighschoolcontactMobileNo" runat="server" class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30">
                                                            <asp:Label ID="lblhighschoolcontactMobileComments" runat="server"></asp:Label>

                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>

                                        </tr>

                                        <!--Secondary-->
                                        <tr class="adm-form-row-tr" id="Secondary" runat="server" visible="false">
                                            <td class="width30 td-rightlabel">
                                                <label id="labelSecondary" runat="server" for="Secondary">Have you completed Senior Secondary school? (Year 12)?</label>
                                            </td>
                                            <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">
                                                            <asp:Label ID="lblSecondary" runat="server"></asp:Label>
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" visible="false" id="imgSecondaryYes" runat="server" class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" visible="false" id="imgSecondaryNo" runat="server" class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30 td-rightlabel">
                                                            <asp:Label ID="lblSecondaryComments" runat="server"></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr class="adm-form-row-tr" id="SecondaryCountry" runat="server" visible="false">
                                            <td class="width30 td-rightlabel">
                                                <label id="labelSecondaryCountry" runat="server" for="SecondaryCountry">Country of Secondary Education</label>
                                            </td>
                                            <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">
                                                            <asp:Label ID="lblSecondaryCountry" runat="server"></asp:Label>

                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" visible="false" id="imgSecondaryCountryYes" runat="server" class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" visible="false" id="imgSecondaryCountryNo" runat="server" class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30">
                                                            <asp:Label ID="lblSecondaryCountryComments" runat="server"></asp:Label></td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr class="adm-form-row-tr" id="SecondarystartDate" runat="server" visible="false">
                                            <td class="width30 td-rightlabel">
                                                <label id="labelSecondarystartDate" runat="server" for="SecondarystartDate">Start Date </label>
                                            </td>
                                            <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">
                                                            <asp:Label ID="lblSecondarystartDate" runat="server"></asp:Label>
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" visible="false" id="imgSecondarystartDateYes" runat="server" class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" visible="false" id="imgSecondarystartDateNo" runat="server" class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30">
                                                            <asp:Label ID="lblSecondarystartDateComments" runat="server"></asp:Label></td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr class="adm-form-row-tr" id="SecondaryendDate" runat="server" visible="false">
                                            <td class="width30 td-rightlabel">
                                                <label id="labelSecondaryendDate" runat="server" for="SecondaryendDate">End Date </label>
                                            </td>
                                            <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">
                                                            <asp:Label ID="lblSecondaryendDate" runat="server"></asp:Label>
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" visible="false" id="imgSecondaryendDateYes" runat="server" class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" visible="false" id="imgSecondaryendDateNo" runat="server" class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30">
                                                            <asp:Label ID="lblSecondaryendDateComments" runat="server"></asp:Label>

                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr class="adm-form-row-tr" id="SecondaryName" runat="server" visible="false">
                                            <td class="width30 td-rightlabel">
                                                <label id="labelSecondaryName" runat="server" for="SecondaryName">Name of School</label>
                                            </td>
                                            <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">
                                                            <asp:Label ID="lblSecondaryName" runat="server"></asp:Label>
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" visible="false" id="imgSecondaryNameYes" runat="server" class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" visible="false" id="imgSecondaryNameNo" runat="server" class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30">
                                                            <asp:Label ID="lblSecondaryNameComments" runat="server"></asp:Label>

                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr class="adm-form-row-tr" id="SecondaryQualificationtype" runat="server" visible="false">
                                            <td class="width30 td-rightlabel">
                                                <label id="labelSecondaryQualificationtype" runat="server" for="SecondaryQualificationtype">Qualification Name</label>
                                            </td>
                                            <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">
                                                            <asp:Label ID="lblSecondaryQualificationtype" runat="server"></asp:Label>
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" visible="false" id="imgSecondaryQualificationtypeYes" runat="server" class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" visible="false" id="imgSecondaryQualificationtypeNo" runat="server" class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30">
                                                            <asp:Label ID="lblSecondaryQualificationtypeComments" runat="server"></asp:Label></td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr class="adm-form-row-tr" id="Secondarystudymode" runat="server" visible="false">
                                            <td class="width30 td-rightlabel">
                                                <label id="labelSecondarystudymode" runat="server" for="Secondarystudymode">Mode of study</label>
                                            </td>
                                            <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">
                                                            <asp:Label ID="lblSecondarystudymode" runat="server"></asp:Label>
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" visible="false" id="imgSecondarystudymodeYes" runat="server" class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" visible="false" id="imgSecondarystudymodeNo" runat="server" class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30">
                                                            <asp:Label ID="lblSecondarystudymodeComments" runat="server"></asp:Label></td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr class="adm-form-row-tr" id="Secondarylanguage" runat="server" visible="false">
                                            <td class="width30 td-rightlabel">
                                                <label id="labelSecondarylanguage" runat="server" for="Secondarylanguage">Language (Medium) of Study</label>
                                            </td>
                                            <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">
                                                            <asp:Label ID="lblSecondarylanguage" runat="server"></asp:Label>
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" visible="false" id="imgSecondarylanguageYes" runat="server" class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" visible="false" id="imgSecondarylanguageNo" runat="server" class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30">
                                                            <asp:Label ID="lblSecondarylanguageComments" runat="server"></asp:Label></td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr class="adm-form-row-tr" id="Secondarygradetype" runat="server" visible="false">
                                            <td class="width30 td-rightlabel">
                                                <label id="labelSecondarygradetype" runat="server" for="Secondarygradetype">Grade Type</label>
                                            </td>
                                            <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">
                                                            <asp:Label ID="lblSecondarygradetype" runat="server"></asp:Label>
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" visible="false" id="imgSecondarygradetypeYes" runat="server" class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" visible="false" id="imgSecondarygradetypeNo" runat="server" class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30">
                                                            <asp:Label ID="lblSecondarygradetypeComments" runat="server"></asp:Label></td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr class="adm-form-row-tr" id="Secondarygradeachieved" runat="server" visible="false">
                                            <td class="width30 td-rightlabel">
                                                <label id="labelSecondarygradeachieved" runat="server" for="Secondarygradeachieved">Final Grade Achieved </label>
                                            </td>
                                            <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">
                                                            <asp:Label ID="lblSecondarygradeachieved" runat="server"></asp:Label>
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" visible="false" id="imgSecondarygradeachievedYes" runat="server" class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" visible="false" id="imgSecondarygradeachievedNo" runat="server" class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30">
                                                            <asp:Label ID="lblSecondarygradeachievedComments" runat="server"></asp:Label></td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr class="adm-form-row-tr" id="ExpectedSecondaryDategrade" runat="server" visible="false">
                                            <td class="width30 td-rightlabel">
                                                <label id="labelExpectedSecondaryDategrade" runat="server" for="EnglishCourse">Expected dates when results will be declared </label>
                                            </td>
                                            <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">
                                                            <asp:Label ID="lblExpectedSecondaryDategrade" runat="server"></asp:Label>
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" visible="false" id="imgExpectedSecondaryDategradeYes" runat="server" class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" visible="false" id="imgExpectedSecondaryDategradeNo" runat="server" class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30">
                                                            <asp:Label ID="lblExpectedSecondaryDategradeComments" runat="server"></asp:Label>

                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>

                                        </tr>
                                        <tr class="adm-form-row-tr" id="Secondaryverify" runat="server" visible="false">
                                            <td class="width30 td-rightlabel">
                                                <label id="labelSecondaryverify" runat="server" for="Secondaryverify">Name of Contact who can verify this qualification </label>
                                            </td>
                                            <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">
                                                            <asp:Label ID="lblSecondaryverify" runat="server"></asp:Label>
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" visible="false" id="imgSecondaryverifyYes" runat="server" class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" visible="false" id="imgSecondaryverifyNo" runat="server" class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30">
                                                            <asp:Label ID="lblSecondaryverifyComments" runat="server"></asp:Label>

                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>

                                        </tr>
                                        <tr class="adm-form-row-tr" id="Secondaryrelation" runat="server" visible="false">
                                            <td class="width30 td-rightlabel">
                                                <label id="labelSecondaryrelation" runat="server" for="Secondaryrelation">Relationship with the Contact </label>
                                            </td>
                                            <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">
                                                            <asp:Label ID="lblSecondaryrelation" runat="server"></asp:Label>
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" visible="false" id="imgSecondaryrelationYes" runat="server" class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" visible="false" id="imgSecondaryrelationNo" runat="server" class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30">
                                                            <asp:Label ID="lblSecondaryrelationComments" runat="server"></asp:Label>

                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>

                                        </tr>
                                        <tr class="adm-form-row-tr" id="SecondarycontactEmail" runat="server" visible="false">
                                            <td class="width30 td-rightlabel">
                                                <label id="labelSecondarycontactEmail" runat="server" for="SecondarycontactEmail">Email ID of Contact who can verify your qualification  </label>
                                            </td>
                                            <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">
                                                            <asp:Label ID="lblSecondarycontactEmail" runat="server"></asp:Label>
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" visible="false" id="imgSecondarycontactEmailYes" runat="server" class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" visible="false" id="imgSecondarycontactEmailNo" runat="server" class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30">
                                                            <asp:Label ID="lblSecondarycontactEmailComments" runat="server"></asp:Label>

                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>

                                        </tr>
                                        <tr class="adm-form-row-tr" id="SecondarycontactMobile" runat="server" visible="false">
                                            <td class="width30 td-rightlabel">
                                                <label id="labelSecondarycontactMobile" runat="server" for="SecondarycontactMobile">Mobile/Cellular Number of Contact who can verify your qualification</label></td>
                                            <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">
                                                            <asp:Label ID="lblSecondarycontactMobile" runat="server"></asp:Label>
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" visible="false" id="imgSecondarycontactMobileYes" runat="server" class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" visible="false" id="imgSecondarycontactMobileNo" runat="server" class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30">
                                                            <asp:Label ID="lblSecondarycontactMobileComments" runat="server"></asp:Label>

                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>

                                        </tr>
                                        <!-- Higher Education-->
                                        <tr class="adm-form-row-tr" id="higher" runat="server" visible="false">
                                            <td class="width30 td-rightlabel">
                                                <label id="labelhigher" runat="server" for="higher">
                                                    Have you completed any Higher (Under Graduate, Masters or PhD) degree? 
?</label>
                                            </td>
                                            <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">
                                                            <asp:Label ID="lblhigher" runat="server"></asp:Label>
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" visible="false" id="imghigherYes" runat="server" class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" visible="false" id="imghigherNo" runat="server" class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30 td-rightlabel">
                                                            <asp:Label ID="lblhigherComments" runat="server"></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr id="UG" runat="server" visible="false" class="adm-form-row-tr">
                                            <td colspan="6">
                                                <table cellpadding="0" cellspacing="0" class="table">
                                                    <tr class="adm-form-row-tr" id="highercourse" runat="server" visible="false">
                                                        <td class="width30 td-rightlabel">
                                                            <label id="labelhighercourse" runat="server" for="highercourse">Higher Course</label>
                                                        </td>
                                                        <td class="width70">
                                                            <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                                <tr>
                                                                    <td class="width50 bgcol">
                                                                        <asp:Label ID="lblhighercourse" runat="server"></asp:Label>

                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/check.png" visible="false" id="imghighercourseYes" runat="server" class="bdy-check-icon">
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/cross.png" visible="false" id="imghighercourseNo" runat="server" class="bdy-cross-icon">
                                                                    </td>
                                                                    <td class="width30">
                                                                        <asp:Label ID="lblhighercourseComments" runat="server"></asp:Label></td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr class="adm-form-row-tr" id="higherCountry" runat="server" visible="false">
                                                        <td class="width30 td-rightlabel">
                                                            <label id="labelhigherCountry" runat="server" for="higherCountry">Country of Higher Education</label>
                                                        </td>
                                                        <td class="width70">
                                                            <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                                <tr>
                                                                    <td class="width50 bgcol">
                                                                        <asp:Label ID="lblhigherCountry" runat="server"></asp:Label>

                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/check.png" visible="false" id="imghigherCountryYes" runat="server" class="bdy-check-icon">
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/cross.png" visible="false" id="imghigherCountryNo" runat="server" class="bdy-cross-icon">
                                                                    </td>
                                                                    <td class="width30">
                                                                        <asp:Label ID="lblhigherCountryComments" runat="server"></asp:Label></td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr class="adm-form-row-tr" id="higherstartDate" runat="server" visible="false">
                                                        <td class="width30 td-rightlabel">
                                                            <label id="labelhigherstartDate" runat="server" for="higherstartDate">Start Date </label>
                                                        </td>
                                                        <td class="width70">
                                                            <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                                <tr>
                                                                    <td class="width50 bgcol">
                                                                        <asp:Label ID="lblhigherstartDate" runat="server"></asp:Label>
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/check.png" visible="false" id="imghigherstartDateYes" runat="server" class="bdy-check-icon">
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/cross.png" visible="false" id="imghigherstartDateNo" runat="server" class="bdy-cross-icon">
                                                                    </td>
                                                                    <td class="width30">
                                                                        <asp:Label ID="lblhigherstartDateComments" runat="server"></asp:Label></td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr class="adm-form-row-tr" id="higherendDate" runat="server" visible="false">
                                                        <td class="width30 td-rightlabel">
                                                            <label id="labelhigherendDate" runat="server" for="higherendDate">End Date </label>
                                                        </td>
                                                        <td class="width70">
                                                            <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                                <tr>
                                                                    <td class="width50 bgcol">
                                                                        <asp:Label ID="lblhigherendDate" runat="server"></asp:Label>
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/check.png" visible="false" id="imghigherendDateYes" runat="server" class="bdy-check-icon">
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/cross.png" visible="false" id="imghigherendDateNo" runat="server" class="bdy-cross-icon">
                                                                    </td>
                                                                    <td class="width30">
                                                                        <asp:Label ID="lblhigherendDateComments" runat="server"></asp:Label>

                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr class="adm-form-row-tr" id="higherName" runat="server" visible="false">
                                                        <td class="width30 td-rightlabel">
                                                            <label id="labelhigherName" runat="server" for="higherName">Name of School</label>
                                                        </td>
                                                        <td class="width70">
                                                            <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                                <tr>
                                                                    <td class="width50 bgcol">
                                                                        <asp:Label ID="lblhigherName" runat="server"></asp:Label>
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/check.png" visible="false" id="imghigherNameYes" runat="server" class="bdy-check-icon">
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/cross.png" visible="false" id="imghigherNameNo" runat="server" class="bdy-cross-icon">
                                                                    </td>
                                                                    <td class="width30">
                                                                        <asp:Label ID="lblhigherNameComments" runat="server"></asp:Label>

                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr class="adm-form-row-tr" id="higherQualificationtype" runat="server" visible="false">
                                                        <td class="width30 td-rightlabel">
                                                            <label id="labelhigherQualificationtype" runat="server" for="higherQualificationtype">Qualification Name</label>
                                                        </td>
                                                        <td class="width70">
                                                            <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                                <tr>
                                                                    <td class="width50 bgcol">
                                                                        <asp:Label ID="lblhigherQualificationtype" runat="server"></asp:Label>
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/check.png" visible="false" id="imghigherQualificationtypeYes" runat="server" class="bdy-check-icon">
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/cross.png" visible="false" id="imghigherQualificationtypeNo" runat="server" class="bdy-cross-icon">
                                                                    </td>
                                                                    <td class="width30">
                                                                        <asp:Label ID="lblhigherQualificationtypeComments" runat="server"></asp:Label></td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr class="adm-form-row-tr" id="higherstudymode" runat="server" visible="false">
                                                        <td class="width30 td-rightlabel">
                                                            <label id="labelhigherstudymode" runat="server" for="higherstudymode">Mode of study</label>
                                                        </td>
                                                        <td class="width70">
                                                            <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                                <tr>
                                                                    <td class="width50 bgcol">
                                                                        <asp:Label ID="lblhigherstudymode" runat="server"></asp:Label>
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/check.png" visible="false" id="imghigherstudymodeYes" runat="server" class="bdy-check-icon">
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/cross.png" visible="false" id="imghigherstudymodeNo" runat="server" class="bdy-cross-icon">
                                                                    </td>
                                                                    <td class="width30">
                                                                        <asp:Label ID="lblhigherstudymodeComments" runat="server"></asp:Label></td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr class="adm-form-row-tr" id="higherlanguage" runat="server" visible="false">
                                                        <td class="width30 td-rightlabel">
                                                            <label id="labelhigherlanguage" runat="server" for="higherlanguage">Language (Medium) of Study</label>
                                                        </td>
                                                        <td class="width70">
                                                            <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                                <tr>
                                                                    <td class="width50 bgcol">
                                                                        <asp:Label ID="lblhigherlanguage" runat="server"></asp:Label>
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/check.png" visible="false" id="imghigherlanguageYes" runat="server" class="bdy-check-icon">
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/cross.png" visible="false" id="imghigherlanguageNo" runat="server" class="bdy-cross-icon">
                                                                    </td>
                                                                    <td class="width30">
                                                                        <asp:Label ID="lblhigherlanguageComments" runat="server"></asp:Label></td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr class="adm-form-row-tr" id="highergradetype" runat="server" visible="false">
                                                        <td class="width30 td-rightlabel">
                                                            <label id="labelhighergradetype" runat="server" for="highergradetype">Grade Type</label>
                                                        </td>
                                                        <td class="width70">
                                                            <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                                <tr>
                                                                    <td class="width50 bgcol">
                                                                        <asp:Label ID="lblhighergradetype" runat="server"></asp:Label>
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/check.png" visible="false" id="imghighergradetypeYes" runat="server" class="bdy-check-icon">
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/cross.png" visible="false" id="imghighergradetypeNo" runat="server" class="bdy-cross-icon">
                                                                    </td>
                                                                    <td class="width30">
                                                                        <asp:Label ID="lblhighergradetypeComments" runat="server"></asp:Label></td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr class="adm-form-row-tr" id="highergradeachieved" runat="server" visible="false">
                                                        <td class="width30 td-rightlabel">
                                                            <label id="labelhighergradeachieved" runat="server" for="highergradeachieved">Final Grade Achieved </label>
                                                        </td>
                                                        <td class="width70">
                                                            <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                                <tr>
                                                                    <td class="width50 bgcol">
                                                                        <asp:Label ID="lblhighergradeachieved" runat="server"></asp:Label>
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/check.png" visible="false" id="imghighergradeachievedYes" runat="server" class="bdy-check-icon">
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/cross.png" visible="false" id="imghighergradeachievedNo" runat="server" class="bdy-cross-icon">
                                                                    </td>
                                                                    <td class="width30">
                                                                        <asp:Label ID="lblhighergradeachievedComments" runat="server"></asp:Label></td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr class="adm-form-row-tr" id="ExpectedhigherDategrade" runat="server" visible="false">
                                                        <td class="width30 td-rightlabel">
                                                            <label id="labelExpectedhigherDategrade" runat="server" for="EnglishCourse">Expected dates when results will be declared </label>
                                                        </td>
                                                        <td class="width70">
                                                            <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                                <tr>
                                                                    <td class="width50 bgcol">
                                                                        <asp:Label ID="lblExpectedhigherDategrade" runat="server"></asp:Label>
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/check.png" visible="false" id="imgExpectedhigherDategradeYes" runat="server" class="bdy-check-icon">
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/cross.png" visible="false" id="imgExpectedhigherDategradeNo" runat="server" class="bdy-cross-icon">
                                                                    </td>
                                                                    <td class="width30">
                                                                        <asp:Label ID="lblExpectedhigherDategradeComments" runat="server"></asp:Label>

                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>

                                                    </tr>
                                                    <tr class="adm-form-row-tr" id="higherverify" runat="server" visible="false">
                                                        <td class="width30 td-rightlabel">
                                                            <label id="labelhigherverify" runat="server" for="higherverify">Name of Contact who can verify this qualification </label>
                                                        </td>
                                                        <td class="width70">
                                                            <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                                <tr>
                                                                    <td class="width50 bgcol">
                                                                        <asp:Label ID="lblhigherverify" runat="server"></asp:Label>
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/check.png" visible="false" id="imghigherverifyYes" runat="server" class="bdy-check-icon">
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/cross.png" visible="false" id="imghigherverifyNo" runat="server" class="bdy-cross-icon">
                                                                    </td>
                                                                    <td class="width30">
                                                                        <asp:Label ID="lblhigherverifyComments" runat="server"></asp:Label>

                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>

                                                    </tr>
                                                    <tr class="adm-form-row-tr" id="higherrelation" runat="server" visible="false">
                                                        <td class="width30 td-rightlabel">
                                                            <label id="labelhigherrelation" runat="server" for="higherrelation">Relationship with the Contact </label>
                                                        </td>
                                                        <td class="width70">
                                                            <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                                <tr>
                                                                    <td class="width50 bgcol">
                                                                        <asp:Label ID="lblhigherrelation" runat="server"></asp:Label>
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/check.png" visible="false" id="imghigherrelationYes" runat="server" class="bdy-check-icon">
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/cross.png" visible="false" id="imghigherrelationNo" runat="server" class="bdy-cross-icon">
                                                                    </td>
                                                                    <td class="width30">
                                                                        <asp:Label ID="lblhigherrelationComments" runat="server"></asp:Label>

                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>

                                                    </tr>
                                                    <tr class="adm-form-row-tr" id="highercontactEmail" runat="server" visible="false">
                                                        <td class="width30 td-rightlabel">
                                                            <label id="labelhighercontactEmail" runat="server" for="highercontactEmail">Email ID of Contact who can verify your qualification  </label>
                                                        </td>
                                                        <td class="width70">
                                                            <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                                <tr>
                                                                    <td class="width50 bgcol">
                                                                        <asp:Label ID="lblhighercontactEmail" runat="server"></asp:Label>
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/check.png" visible="false" id="imghighercontactEmailYes" runat="server" class="bdy-check-icon">
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/cross.png" visible="false" id="imghighercontactEmailNo" runat="server" class="bdy-cross-icon">
                                                                    </td>
                                                                    <td class="width30">
                                                                        <asp:Label ID="lblhighercontactEmailComments" runat="server"></asp:Label>

                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>

                                                    </tr>
                                                    <tr class="adm-form-row-tr" id="highercontactMobile" runat="server" visible="false">
                                                        <td class="width30 td-rightlabel">
                                                            <label id="labelhighercontactMobile" runat="server" for="highercontactMobile">Mobile/Cellular Number of Contact who can verify your qualification</label></td>
                                                        <td class="width70">
                                                            <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                                <tr>
                                                                    <td class="width50 bgcol">
                                                                        <asp:Label ID="lblhighercontactMobile" runat="server"></asp:Label>
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/check.png" visible="false" id="imghighercontactMobileYes" runat="server" class="bdy-check-icon">
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/cross.png" visible="false" id="imghighercontactMobileNo" runat="server" class="bdy-cross-icon">
                                                                    </td>
                                                                    <td class="width30">
                                                                        <asp:Label ID="lblhighercontactMobileComments" runat="server"></asp:Label>

                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>

                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <!--PG-->
                                        <tr id="PG" runat="server" visible="false" class="adm-form-row-tr">
                                            <td colspan="6">
                                                <table cellpadding="0" cellspacing="0" class="table">
                                                    <tr class="adm-form-row-tr" id="highercoursePG" runat="server" visible="false">
                                                        <td class="width30 td-rightlabel">
                                                            <label id="labelhighercoursePG" runat="server" for="highercourse">Higher Course</label>
                                                        </td>
                                                        <td class="width70">
                                                            <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                                <tr>
                                                                    <td class="width50 bgcol">
                                                                        <asp:Label ID="lblhighercoursePG" runat="server"></asp:Label>
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/check.png" visible="false" id="imghighercoursePGYes" runat="server" class="bdy-check-icon">
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/cross.png" visible="false" id="imghighercoursePGNo" runat="server" class="bdy-cross-icon">
                                                                    </td>
                                                                    <td class="width30 td-rightlabel">
                                                                        <asp:Label ID="lblhighercoursePGComments" runat="server"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr class="adm-form-row-tr" id="higherCountryPG" runat="server" visible="false">
                                                        <td class="width30 td-rightlabel">
                                                            <label id="labelhigherCountryPG" runat="server" for="higherCountry">Country of Higher Education</label>
                                                        </td>
                                                        <td class="width70">
                                                            <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                                <tr>
                                                                    <td class="width50 bgcol">
                                                                        <asp:Label ID="lblhigherCountryPG" runat="server"></asp:Label>

                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/check.png" visible="false" id="imghigherCountryPGYes" runat="server" class="bdy-check-icon">
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/cross.png" visible="false" id="imghigherCountryPGNo" runat="server" class="bdy-cross-icon">
                                                                    </td>
                                                                    <td class="width30">
                                                                        <asp:Label ID="lblhigherCountryPGComments" runat="server"></asp:Label></td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr class="adm-form-row-tr" id="higherstartDatePG" runat="server" visible="false">
                                                        <td class="width30 td-rightlabel">
                                                            <label id="labelhigherstartDatePG" runat="server" for="higherstartDate">Start Date </label>
                                                        </td>
                                                        <td class="width70">
                                                            <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                                <tr>
                                                                    <td class="width50 bgcol">
                                                                        <asp:Label ID="lblhigherstartDatePG" runat="server"></asp:Label>
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/check.png" visible="false" id="imghigherstartDatePGYes" runat="server" class="bdy-check-icon">
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/cross.png" visible="false" id="imghigherstartDatePGNo" runat="server" class="bdy-cross-icon">
                                                                    </td>
                                                                    <td class="width30">
                                                                        <asp:Label ID="lblhigherstartDatePGComments" runat="server"></asp:Label></td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr class="adm-form-row-tr" id="higherendDatePG" runat="server" visible="false">
                                                        <td class="width30 td-rightlabel">
                                                            <label id="labelhigherendDatePG" runat="server" for="higherendDate">End Date </label>
                                                        </td>
                                                        <td class="width70">
                                                            <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                                <tr>
                                                                    <td class="width50 bgcol">
                                                                        <asp:Label ID="lblhigherendDatePG" runat="server"></asp:Label>
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/check.png" visible="false" id="imghigherendDatePGYes" runat="server" class="bdy-check-icon">
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/cross.png" visible="false" id="imghigherendDatePGNo" runat="server" class="bdy-cross-icon">
                                                                    </td>
                                                                    <td class="width30">
                                                                        <asp:Label ID="lblhigherendDatePGComments" runat="server"></asp:Label>

                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr class="adm-form-row-tr" id="higherNamePG" runat="server" visible="false">
                                                        <td class="width30 td-rightlabel">
                                                            <label id="labelhigherNamePG" runat="server" for="higherName">Name of School</label>
                                                        </td>
                                                        <td class="width70">
                                                            <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                                <tr>
                                                                    <td class="width50 bgcol">
                                                                        <asp:Label ID="lblhigherNamePG" runat="server"></asp:Label>
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/check.png" visible="false" id="imghigherNamePGYes" runat="server" class="bdy-check-icon">
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/cross.png" visible="false" id="imghigherNamePGNo" runat="server" class="bdy-cross-icon">
                                                                    </td>
                                                                    <td class="width30">
                                                                        <asp:Label ID="lblhigherNamePGComments" runat="server"></asp:Label>

                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr class="adm-form-row-tr" id="higherQualificationtypePG" runat="server" visible="false">
                                                        <td class="width30 td-rightlabel">
                                                            <label id="labelhigherQualificationtypePG" runat="server" for="higherQualificationtype">Qualification Name</label>
                                                        </td>
                                                        <td class="width70">
                                                            <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                                <tr>
                                                                    <td class="width50 bgcol">
                                                                        <asp:Label ID="lblhigherQualificationtypePG" runat="server"></asp:Label>
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/check.png" visible="false" id="imghigherQualificationtypePGYes" runat="server" class="bdy-check-icon">
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/cross.png" visible="false" id="imghigherQualificationtypePGNo" runat="server" class="bdy-cross-icon">
                                                                    </td>
                                                                    <td class="width30">
                                                                        <asp:Label ID="lblhigherQualificationtypePGComments" runat="server"></asp:Label></td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr class="adm-form-row-tr" id="higherstudymodePG" runat="server" visible="false">
                                                        <td class="width30 td-rightlabel">
                                                            <label id="labelhigherstudymodePG" runat="server" for="higherstudymode">Mode of study</label>
                                                        </td>
                                                        <td class="width70">
                                                            <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                                <tr>
                                                                    <td class="width50 bgcol">
                                                                        <asp:Label ID="lblhigherstudymodePG" runat="server"></asp:Label>
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/check.png" visible="false" id="imghigherstudymodePGYes" runat="server" class="bdy-check-icon">
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/cross.png" visible="false" id="imghigherstudymodePGNo" runat="server" class="bdy-cross-icon">
                                                                    </td>
                                                                    <td class="width30">
                                                                        <asp:Label ID="lblhigherstudymodePGComments" runat="server"></asp:Label></td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr class="adm-form-row-tr" id="higherlanguagePG" runat="server" visible="false">
                                                        <td class="width30 td-rightlabel">
                                                            <label id="labelhigherlanguagePG" runat="server" for="higherlanguage">Language (Medium) of Study</label>
                                                        </td>
                                                        <td class="width70">
                                                            <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                                <tr>
                                                                    <td class="width50 bgcol">
                                                                        <asp:Label ID="lblhigherlanguagePG" runat="server"></asp:Label>
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/check.png" visible="false" id="imghigherlanguagePGYes" runat="server" class="bdy-check-icon">
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/cross.png" visible="false" id="imghigherlanguagePGNo" runat="server" class="bdy-cross-icon">
                                                                    </td>
                                                                    <td class="width30">
                                                                        <asp:Label ID="lblhigherlanguagePGComments" runat="server"></asp:Label></td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr class="adm-form-row-tr" id="highergradetypePG" runat="server" visible="false">
                                                        <td class="width30 td-rightlabel">
                                                            <label id="labelhighergradetypePG" runat="server" for="highergradetype">Grade Type</label>
                                                        </td>
                                                        <td class="width70">
                                                            <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                                <tr>
                                                                    <td class="width50 bgcol">
                                                                        <asp:Label ID="lblhighergradetypePG" runat="server"></asp:Label>
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/check.png" visible="false" id="imghighergradetypePGYes" runat="server" class="bdy-check-icon">
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/cross.png" visible="false" id="imghighergradetypePGNo" runat="server" class="bdy-cross-icon">
                                                                    </td>
                                                                    <td class="width30">
                                                                        <asp:Label ID="lblhighergradetypePGComments" runat="server"></asp:Label></td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr class="adm-form-row-tr" id="highergradeachievedPG" runat="server" visible="false">
                                                        <td class="width30 td-rightlabel">
                                                            <label id="labelhighergradeachievedPG" runat="server" for="highergradeachieved">Final Grade Achieved </label>
                                                        </td>
                                                        <td class="width70">
                                                            <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                                <tr>
                                                                    <td class="width50 bgcol">
                                                                        <asp:Label ID="lblhighergradeachievedPG" runat="server"></asp:Label>
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/check.png" visible="false" id="imghighergradeachievedPGYes" runat="server" class="bdy-check-icon">
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/cross.png" visible="false" id="imghighergradeachievedPGNo" runat="server" class="bdy-cross-icon">
                                                                    </td>
                                                                    <td class="width30">
                                                                        <asp:Label ID="lblhighergradeachievedPGComments" runat="server"></asp:Label></td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr class="adm-form-row-tr" id="ExpectedhigherDategradePG" runat="server" visible="false">
                                                        <td class="width30 td-rightlabel">
                                                            <label id="labelExpectedhigherDategradePG" runat="server" for="EnglishCourse">Expected dates when results will be declared </label>
                                                        </td>
                                                        <td class="width70">
                                                            <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                                <tr>
                                                                    <td class="width50 bgcol">
                                                                        <asp:Label ID="lblExpectedhigherDategradePG" runat="server"></asp:Label>
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/check.png" visible="false" id="imgExpectedhigherDategradePGYes" runat="server" class="bdy-check-icon">
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/cross.png" visible="false" id="imgExpectedhigherDategradePGNo" runat="server" class="bdy-cross-icon">
                                                                    </td>
                                                                    <td class="width30">
                                                                        <asp:Label ID="lblExpectedhigherDategradePGComments" runat="server"></asp:Label>

                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>

                                                    </tr>
                                                    <tr class="adm-form-row-tr" id="higherverifyPG" runat="server" visible="false">
                                                        <td class="width30 td-rightlabel">
                                                            <label id="labelhigherverifyPG" runat="server" for="higherverify">Name of Contact who can verify this qualification </label>
                                                        </td>
                                                        <td class="width70">
                                                            <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                                <tr>
                                                                    <td class="width50 bgcol">
                                                                        <asp:Label ID="lblhigherverifyPG" runat="server"></asp:Label>
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/check.png" visible="false" id="imghigherverifyPGYes" runat="server" class="bdy-check-icon">
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/cross.png" visible="false" id="imghigherverifyPGNo" runat="server" class="bdy-cross-icon">
                                                                    </td>
                                                                    <td class="width30">
                                                                        <asp:Label ID="lblhigherverifyPGComments" runat="server"></asp:Label>

                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>

                                                    </tr>
                                                    <tr class="adm-form-row-tr" id="higherrelationPG" runat="server" visible="false">
                                                        <td class="width30 td-rightlabel">
                                                            <label id="labelhigherrelationPG" runat="server" for="higherrelation">Relationship with the Contact </label>
                                                        </td>
                                                        <td class="width70">
                                                            <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                                <tr>
                                                                    <td class="width50 bgcol">
                                                                        <asp:Label ID="lblhigherrelationPG" runat="server"></asp:Label>
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/check.png" visible="false" id="imghigherrelationPGYes" runat="server" class="bdy-check-icon">
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/cross.png" visible="false" id="imghigherrelationPGNo" runat="server" class="bdy-cross-icon">
                                                                    </td>
                                                                    <td class="width30">
                                                                        <asp:Label ID="lblhigherrelationPGComments" runat="server"></asp:Label>

                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>

                                                    </tr>
                                                    <tr class="adm-form-row-tr" id="highercontactEmailPG" runat="server" visible="false">
                                                        <td class="width30 td-rightlabel">
                                                            <label id="labelhighercontactEmailPG" runat="server" for="highercontactEmail">Email ID of Contact who can verify your qualification  </label>
                                                        </td>
                                                        <td class="width70">
                                                            <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                                <tr>
                                                                    <td class="width50 bgcol">
                                                                        <asp:Label ID="lblhighercontactEmailPG" runat="server"></asp:Label>
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/check.png" visible="false" id="imghighercontactEmailPGYes" runat="server" class="bdy-check-icon">
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/cross.png" visible="false" id="imghighercontactEmailPGNo" runat="server" class="bdy-cross-icon">
                                                                    </td>
                                                                    <td class="width30">
                                                                        <asp:Label ID="lblhighercontactEmailPGComments" runat="server"></asp:Label>

                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>

                                                    </tr>
                                                    <tr class="adm-form-row-tr" id="highercontactMobilePG" runat="server" visible="false">
                                                        <td class="width30 td-rightlabel">
                                                            <label id="labelhighercontactMobilePG" runat="server" for="highercontactMobile">Mobile/Cellular Number of Contact who can verify your qualification</label></td>
                                                        <td class="width70">
                                                            <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                                <tr>
                                                                    <td class="width50 bgcol">
                                                                        <asp:Label ID="lblhighercontactMobilePG" runat="server"></asp:Label>
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/check.png" visible="false" id="imghighercontactMobilePGYes" runat="server" class="bdy-check-icon">
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/cross.png" visible="false" id="imghighercontactMobilePGNo" runat="server" class="bdy-cross-icon">
                                                                    </td>
                                                                    <td class="width30">
                                                                        <asp:Label ID="lblhighercontactMobilePGComments" runat="server"></asp:Label>

                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>

                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <!--PHD-->
                                        <tr id="Phd" runat="server" visible="false" class="adm-form-row-tr">
                                            <td colspan="6">
                                                <table cellpadding="0" cellspacing="0" class="table">
                                                    <tr class="adm-form-row-tr" id="highercoursePhd" runat="server" visible="false">
                                                        <td class="width30 td-rightlabel">
                                                            <label id="labelhighercoursePhd" runat="server" for="highercourse">Higher Course</label>
                                                        </td>
                                                        <td class="width70">
                                                            <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                                <tr>
                                                                    <td class="width50 bgcol">
                                                                        <asp:Label ID="lblhighercoursePhd" runat="server"></asp:Label>
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/check.png" visible="false" id="imghighercoursePhdYes" runat="server" class="bdy-check-icon">
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/cross.png" visible="false" id="imghighercoursePhdNo" runat="server" class="bdy-cross-icon">
                                                                    </td>
                                                                    <td class="width30 td-rightlabel">
                                                                        <asp:Label ID="lblhighercoursePhdComments" runat="server"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr class="adm-form-row-tr" id="higherCountryPhd" runat="server" visible="false">
                                                        <td class="width30 td-rightlabel">
                                                            <label id="labelhigherCountryPhd" runat="server" for="higherCountry">Country of Higher Education</label>
                                                        </td>
                                                        <td class="width70">
                                                            <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                                <tr>
                                                                    <td class="width50 bgcol">
                                                                        <asp:Label ID="lblhigherCountryPhd" runat="server"></asp:Label>

                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/check.png" visible="false" id="imghigherCountryPhdYes" runat="server" class="bdy-check-icon">
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/cross.png" visible="false" id="imghigherCountryPhdNo" runat="server" class="bdy-cross-icon">
                                                                    </td>
                                                                    <td class="width30">
                                                                        <asp:Label ID="lblhigherCountryPhdComments" runat="server"></asp:Label></td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr class="adm-form-row-tr" id="higherstartDatePhd" runat="server" visible="false">
                                                        <td class="width30 td-rightlabel">
                                                            <label id="labelhigherstartDatePhd" runat="server" for="higherstartDate">Start Date </label>
                                                        </td>
                                                        <td class="width70">
                                                            <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                                <tr>
                                                                    <td class="width50 bgcol">
                                                                        <asp:Label ID="lblhigherstartDatePhd" runat="server"></asp:Label>
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/check.png" visible="false" id="imghigherstartDatePhdYes" runat="server" class="bdy-check-icon">
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/cross.png" visible="false" id="imghigherstartDatePhdNo" runat="server" class="bdy-cross-icon">
                                                                    </td>
                                                                    <td class="width30">
                                                                        <asp:Label ID="lblhigherstartDatePhdComments" runat="server"></asp:Label></td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr class="adm-form-row-tr" id="higherendDatePhd" runat="server" visible="false">
                                                        <td class="width30 td-rightlabel">
                                                            <label id="labelhigherendDatePhd" runat="server" for="higherendDate">End Date </label>
                                                        </td>
                                                        <td class="width70">
                                                            <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                                <tr>
                                                                    <td class="width50 bgcol">
                                                                        <asp:Label ID="lblhigherendDatePhd" runat="server"></asp:Label>
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/check.png" visible="false" id="imghigherendDatePhdYes" runat="server" class="bdy-check-icon">
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/cross.png" visible="false" id="imghigherendDatePhdNo" runat="server" class="bdy-cross-icon">
                                                                    </td>
                                                                    <td class="width30">
                                                                        <asp:Label ID="lblhigherendDatePhdComments" runat="server"></asp:Label>

                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr class="adm-form-row-tr" id="higherNamePhd" runat="server" visible="false">
                                                        <td class="width30 td-rightlabel">
                                                            <label id="labelhigherNamePhd" runat="server" for="higherName">Name of School</label>
                                                        </td>
                                                        <td class="width70">
                                                            <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                                <tr>
                                                                    <td class="width50 bgcol">
                                                                        <asp:Label ID="lblhigherNamePhd" runat="server"></asp:Label>
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/check.png" visible="false" id="imghigherNamePhdYes" runat="server" class="bdy-check-icon">
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/cross.png" visible="false" id="imghigherNamePhdNo" runat="server" class="bdy-cross-icon">
                                                                    </td>
                                                                    <td class="width30">
                                                                        <asp:Label ID="lblhigherNamePhdComments" runat="server"></asp:Label>

                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr class="adm-form-row-tr" id="higherQualificationtypePhd" runat="server" visible="false">
                                                        <td class="width30 td-rightlabel">
                                                            <label id="labelhigherQualificationtypePhd" runat="server" for="higherQualificationtype">Qualification Name</label>
                                                        </td>
                                                        <td class="width70">
                                                            <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                                <tr>
                                                                    <td class="width50 bgcol">
                                                                        <asp:Label ID="lblhigherQualificationtypePhd" runat="server"></asp:Label>
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/check.png" visible="false" id="imghigherQualificationtypePhdYes" runat="server" class="bdy-check-icon">
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/cross.png" visible="false" id="imghigherQualificationtypePhdNo" runat="server" class="bdy-cross-icon">
                                                                    </td>
                                                                    <td class="width30">
                                                                        <asp:Label ID="lblhigherQualificationtypePhdComments" runat="server"></asp:Label></td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr class="adm-form-row-tr" id="higherstudymodePhd" runat="server" visible="false">
                                                        <td class="width30 td-rightlabel">
                                                            <label id="labelhigherstudymodePhd" runat="server" for="higherstudymode">Mode of study</label>
                                                        </td>
                                                        <td class="width70">
                                                            <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                                <tr>
                                                                    <td class="width50 bgcol">
                                                                        <asp:Label ID="lblhigherstudymodePhd" runat="server"></asp:Label>
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/check.png" visible="false" id="imghigherstudymodePhdYes" runat="server" class="bdy-check-icon">
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/cross.png" visible="false" id="imghigherstudymodePhdNo" runat="server" class="bdy-cross-icon">
                                                                    </td>
                                                                    <td class="width30">
                                                                        <asp:Label ID="lblhigherstudymodePhdComments" runat="server"></asp:Label></td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr class="adm-form-row-tr" id="higherlanguagePhd" runat="server" visible="false">
                                                        <td class="width30 td-rightlabel">
                                                            <label id="labelhigherlanguagePhd" runat="server" for="higherlanguage">Language (Medium) of Study</label>
                                                        </td>
                                                        <td class="width70">
                                                            <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                                <tr>
                                                                    <td class="width50 bgcol">
                                                                        <asp:Label ID="lblhigherlanguagePhd" runat="server"></asp:Label>
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/check.png" visible="false" id="imghigherlanguagePhdYes" runat="server" class="bdy-check-icon">
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/cross.png" visible="false" id="imghigherlanguagePhdNo" runat="server" class="bdy-cross-icon">
                                                                    </td>
                                                                    <td class="width30">
                                                                        <asp:Label ID="lblhigherlanguagePhdComments" runat="server"></asp:Label></td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr class="adm-form-row-tr" id="highergradetypePhd" runat="server" visible="false">
                                                        <td class="width30 td-rightlabel">
                                                            <label id="labelhighergradetypePhd" runat="server" for="highergradetype">Grade Type</label>
                                                        </td>
                                                        <td class="width70">
                                                            <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                                <tr>
                                                                    <td class="width50 bgcol">
                                                                        <asp:Label ID="lblhighergradetypePhd" runat="server"></asp:Label>
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/check.png" visible="false" id="imghighergradetypePhdYes" runat="server" class="bdy-check-icon">
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/cross.png" visible="false" id="imghighergradetypePhdNo" runat="server" class="bdy-cross-icon">
                                                                    </td>
                                                                    <td class="width30">
                                                                        <asp:Label ID="lblhighergradetypePhdComments" runat="server"></asp:Label></td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr class="adm-form-row-tr" id="highergradeachievedPhd" runat="server" visible="false">
                                                        <td class="width30 td-rightlabel">
                                                            <label id="labelhighergradeachievedPhd" runat="server" for="highergradeachieved">Final Grade Achieved </label>
                                                        </td>
                                                        <td class="width70">
                                                            <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                                <tr>
                                                                    <td class="width50 bgcol">
                                                                        <asp:Label ID="lblhighergradeachievedPhd" runat="server"></asp:Label>
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/check.png" visible="false" id="imghighergradeachievedPhdYes" runat="server" class="bdy-check-icon">
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/cross.png" visible="false" id="imghighergradeachievedPhdNo" runat="server" class="bdy-cross-icon">
                                                                    </td>
                                                                    <td class="width30">
                                                                        <asp:Label ID="lblhighergradeachievedPhdComments" runat="server"></asp:Label></td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr class="adm-form-row-tr" id="ExpectedhigherDategradePhd" runat="server" visible="false">
                                                        <td class="width30 td-rightlabel">
                                                            <label id="labelExpectedhigherDategradePhd" runat="server" for="EnglishCourse">Expected dates when results will be declared </label>
                                                        </td>
                                                        <td class="width70">
                                                            <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                                <tr>
                                                                    <td class="width50 bgcol">
                                                                        <asp:Label ID="lblExpectedhigherDategradePhd" runat="server"></asp:Label>
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/check.png" visible="false" id="imgExpectedhigherDategradePhdYes" runat="server" class="bdy-check-icon">
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/cross.png" visible="false" id="imgExpectedhigherDategradePhdNo" runat="server" class="bdy-cross-icon">
                                                                    </td>
                                                                    <td class="width30">
                                                                        <asp:Label ID="lblExpectedhigherDategradePhdComments" runat="server"></asp:Label>

                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>

                                                    </tr>
                                                    <tr class="adm-form-row-tr" id="higherverifyPhd" runat="server" visible="false">
                                                        <td class="width30 td-rightlabel">
                                                            <label id="labelhigherverifyPhd" runat="server" for="higherverify">Name of Contact who can verify this qualification </label>
                                                        </td>
                                                        <td class="width70">
                                                            <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                                <tr>
                                                                    <td class="width50 bgcol">
                                                                        <asp:Label ID="lblhigherverifyPhd" runat="server"></asp:Label>
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/check.png" visible="false" id="imghigherverifyPhdYes" runat="server" class="bdy-check-icon">
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/cross.png" visible="false" id="imghigherverifyPhdNo" runat="server" class="bdy-cross-icon">
                                                                    </td>
                                                                    <td class="width30">
                                                                        <asp:Label ID="lblhigherverifyPhdComments" runat="server"></asp:Label>

                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>

                                                    </tr>
                                                    <tr class="adm-form-row-tr" id="higherrelationPhd" runat="server" visible="false">
                                                        <td class="width30 td-rightlabel">
                                                            <label id="labelhigherrelationPhd" runat="server" for="higherrelation">Relationship with the Contact </label>
                                                        </td>
                                                        <td class="width70">
                                                            <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                                <tr>
                                                                    <td class="width50 bgcol">
                                                                        <asp:Label ID="lblhigherrelationPhd" runat="server"></asp:Label>
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/check.png" visible="false" id="imghigherrelationPhdYes" runat="server" class="bdy-check-icon">
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/cross.png" visible="false" id="imghigherrelationPhdNo" runat="server" class="bdy-cross-icon">
                                                                    </td>
                                                                    <td class="width30">
                                                                        <asp:Label ID="lblhigherrelationPhdComments" runat="server"></asp:Label>

                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>

                                                    </tr>
                                                    <tr class="adm-form-row-tr" id="highercontactEmailPhd" runat="server" visible="false">
                                                        <td class="width30 td-rightlabel">
                                                            <label id="labelhighercontactEmailPhd" runat="server" for="highercontactEmail">Email ID of Contact who can verify your qualification  </label>
                                                        </td>
                                                        <td class="width70">
                                                            <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                                <tr>
                                                                    <td class="width50 bgcol">
                                                                        <asp:Label ID="lblhighercontactEmailPhd" runat="server"></asp:Label>
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/check.png" visible="false" id="imghighercontactEmailPhdYes" runat="server" class="bdy-check-icon">
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/cross.png" visible="false" id="imghighercontactEmailPhdNo" runat="server" class="bdy-cross-icon">
                                                                    </td>
                                                                    <td class="width30">
                                                                        <asp:Label ID="lblhighercontactEmailPhdComments" runat="server"></asp:Label>

                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>

                                                    </tr>
                                                    <tr class="adm-form-row-tr" id="highercontactMobilePhd" runat="server" visible="false">
                                                        <td class="width30 td-rightlabel">
                                                            <label id="labelhighercontactMobilePhd" runat="server" for="highercontactMobile">Mobile/Cellular Number of Contact who can verify your qualification</label></td>
                                                        <td class="width70">
                                                            <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                                <tr>
                                                                    <td class="width50 bgcol">
                                                                        <asp:Label ID="lblhighercontactMobilePhd" runat="server"></asp:Label>
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/check.png" visible="false" id="imghighercontactMobilePhdYes" runat="server" class="bdy-check-icon">
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/cross.png" visible="false" id="imghighercontactMobilePhdNo" runat="server" class="bdy-cross-icon">
                                                                    </td>
                                                                    <td class="width30">
                                                                        <asp:Label ID="lblhighercontactMobilePhdComments" runat="server"></asp:Label>

                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>

                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <!--Other-->
                                        <tr id="OtherHigherCourse" runat="server" visible="false" class="adm-form-row-tr">
                                            <td colspan="6">
                                                <table cellpadding="0" cellspacing="0" class="table">
                                                    <tr class="adm-form-row-tr" id="highercourseOther" runat="server" visible="false">
                                                        <td class="width30 td-rightlabel">
                                                            <label id="labelhighercourseOther" runat="server" for="highercourse">Higher Course</label>
                                                        </td>
                                                        <td class="width70">
                                                            <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                                <tr>
                                                                    <td class="width50 bgcol">
                                                                        <asp:Label ID="lblhighercourseOther" runat="server"></asp:Label>
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/check.png" visible="false" id="highercourseOtherYes" runat="server" class="bdy-check-icon">
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/cross.png" visible="false" id="highercourseOtherNo" runat="server" class="bdy-cross-icon">
                                                                    </td>
                                                                    <td class="width30 td-rightlabel">
                                                                        <asp:Label ID="lblhighercourseOtherComments" runat="server"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr class="adm-form-row-tr" id="higherCountryOther" runat="server" visible="false">
                                                        <td class="width30 td-rightlabel">
                                                            <label id="labelhigherCountryOther" runat="server" for="higherCountry">Country of Higher Education</label>
                                                        </td>
                                                        <td class="width70">
                                                            <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                                <tr>
                                                                    <td class="width50 bgcol">
                                                                        <asp:Label ID="lblhigherCountryOther" runat="server"></asp:Label>

                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/check.png" visible="false" id="imghigherCountryOtherYes" runat="server" class="bdy-check-icon">
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/cross.png" visible="false" id="imghigherCountryOtherNo" runat="server" class="bdy-cross-icon">
                                                                    </td>
                                                                    <td class="width30">
                                                                        <asp:Label ID="lblhigherCountryOtherComments" runat="server"></asp:Label></td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr class="adm-form-row-tr" id="higherstartDateOther" runat="server" visible="false">
                                                        <td class="width30 td-rightlabel">
                                                            <label id="labelhigherstartDateOther" runat="server" for="higherstartDate">Start Date </label>
                                                        </td>
                                                        <td class="width70">
                                                            <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                                <tr>
                                                                    <td class="width50 bgcol">
                                                                        <asp:Label ID="lblhigherstartDateOther" runat="server"></asp:Label>
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/check.png" visible="false" id="imghigherstartDateOtherYes" runat="server" class="bdy-check-icon">
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/cross.png" visible="false" id="imghigherstartDateOtherNo" runat="server" class="bdy-cross-icon">
                                                                    </td>
                                                                    <td class="width30">
                                                                        <asp:Label ID="lblhigherstartDateOtherComments" runat="server"></asp:Label></td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr class="adm-form-row-tr" id="higherendDateOther" runat="server" visible="false">
                                                        <td class="width30 td-rightlabel">
                                                            <label id="labelhigherendDateOther" runat="server" for="higherendDate">End Date </label>
                                                        </td>
                                                        <td class="width70">
                                                            <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                                <tr>
                                                                    <td class="width50 bgcol">
                                                                        <asp:Label ID="lblhigherendDateOther" runat="server"></asp:Label>
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/check.png" visible="false" id="imghigherendDateOtherYes" runat="server" class="bdy-check-icon">
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/cross.png" visible="false" id="imghigherendDateOtherNo" runat="server" class="bdy-cross-icon">
                                                                    </td>
                                                                    <td class="width30">
                                                                        <asp:Label ID="lblhigherendDateOtherComments" runat="server"></asp:Label>

                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr class="adm-form-row-tr" id="higherNameOther" runat="server" visible="false">
                                                        <td class="width30 td-rightlabel">
                                                            <label id="labelhigherNameOther" runat="server" for="higherName">Name of School</label>
                                                        </td>
                                                        <td class="width70">
                                                            <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                                <tr>
                                                                    <td class="width50 bgcol">
                                                                        <asp:Label ID="lblhigherNameOther" runat="server"></asp:Label>
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/check.png" visible="false" id="imghigherNameOtherYes" runat="server" class="bdy-check-icon">
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/cross.png" visible="false" id="imghigherNameOtherNo" runat="server" class="bdy-cross-icon">
                                                                    </td>
                                                                    <td class="width30">
                                                                        <asp:Label ID="lblhigherNameOtherComments" runat="server"></asp:Label>

                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr class="adm-form-row-tr" id="higherQualificationtypeOther" runat="server" visible="false">
                                                        <td class="width30 td-rightlabel">
                                                            <label id="labelhigherQualificationtypeOther" runat="server" for="higherQualificationtype">Qualification Name</label>
                                                        </td>
                                                        <td class="width70">
                                                            <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                                <tr>
                                                                    <td class="width50 bgcol">
                                                                        <asp:Label ID="lblhigherQualificationtypeOther" runat="server"></asp:Label>
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/check.png" visible="false" id="imghigherQualificationtypeOtherYes" runat="server" class="bdy-check-icon">
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/cross.png" visible="false" id="imghigherQualificationtypeOtherNo" runat="server" class="bdy-cross-icon">
                                                                    </td>
                                                                    <td class="width30">
                                                                        <asp:Label ID="lblhigherQualificationtypeOtherComments" runat="server"></asp:Label></td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr class="adm-form-row-tr" id="higherstudymodeOther" runat="server" visible="false">
                                                        <td class="width30 td-rightlabel">
                                                            <label id="labelhigherstudymodeOther" runat="server" for="higherstudymode">Mode of study</label>
                                                        </td>
                                                        <td class="width70">
                                                            <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                                <tr>
                                                                    <td class="width50 bgcol">
                                                                        <asp:Label ID="lblhigherstudymodeOther" runat="server"></asp:Label>
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/check.png" visible="false" id="imghigherstudymodeOtherYes" runat="server" class="bdy-check-icon">
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/cross.png" visible="false" id="imghigherstudymodeOtherNo" runat="server" class="bdy-cross-icon">
                                                                    </td>
                                                                    <td class="width30">
                                                                        <asp:Label ID="lblhigherstudymodeOtherComments" runat="server"></asp:Label></td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr class="adm-form-row-tr" id="higherlanguageOther" runat="server" visible="false">
                                                        <td class="width30 td-rightlabel">
                                                            <label id="labelhigherlanguageOther" runat="server" for="higherlanguage">Language (Medium) of Study</label>
                                                        </td>
                                                        <td class="width70">
                                                            <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                                <tr>
                                                                    <td class="width50 bgcol">
                                                                        <asp:Label ID="lblhigherlanguageOther" runat="server"></asp:Label>
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/check.png" visible="false" id="imghigherlanguageOtherYes" runat="server" class="bdy-check-icon">
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/cross.png" visible="false" id="imghigherlanguageOtherNo" runat="server" class="bdy-cross-icon">
                                                                    </td>
                                                                    <td class="width30">
                                                                        <asp:Label ID="lblhigherlanguageOtherComments" runat="server"></asp:Label></td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr class="adm-form-row-tr" id="highergradetypeOther" runat="server" visible="false">
                                                        <td class="width30 td-rightlabel">
                                                            <label id="labelhighergradetypeOther" runat="server" for="highergradetype">Grade Type</label>
                                                        </td>
                                                        <td class="width70">
                                                            <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                                <tr>
                                                                    <td class="width50 bgcol">
                                                                        <asp:Label ID="lblhighergradetypeOther" runat="server"></asp:Label>
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/check.png" visible="false" id="imghighergradetypeOtherYes" runat="server" class="bdy-check-icon">
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/cross.png" visible="false" id="imghighergradetypeOtherNo" runat="server" class="bdy-cross-icon">
                                                                    </td>
                                                                    <td class="width30">
                                                                        <asp:Label ID="lblhighergradetypeOtherComments" runat="server"></asp:Label></td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr class="adm-form-row-tr" id="highergradeachievedOther" runat="server" visible="false">
                                                        <td class="width30 td-rightlabel">
                                                            <label id="labelhighergradeachievedOther" runat="server" for="highergradeachieved">Final Grade Achieved </label>
                                                        </td>
                                                        <td class="width70">
                                                            <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                                <tr>
                                                                    <td class="width50 bgcol">
                                                                        <asp:Label ID="lblhighergradeachievedOther" runat="server"></asp:Label>
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/check.png" visible="false" id="imghighergradeachievedOtherYes" runat="server" class="bdy-check-icon">
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/cross.png" visible="false" id="imghighergradeachievedOtherNo" runat="server" class="bdy-cross-icon">
                                                                    </td>
                                                                    <td class="width30">
                                                                        <asp:Label ID="lblhighergradeachievedOtherComments" runat="server"></asp:Label></td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr class="adm-form-row-tr" id="ExpectedhigherDategradeOther" runat="server" visible="false">
                                                        <td class="width30 td-rightlabel">
                                                            <label id="labelExpectedhigherDategradeOther" runat="server" for="EnglishCourse">Expected dates when results will be declared </label>
                                                        </td>
                                                        <td class="width70">
                                                            <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                                <tr>
                                                                    <td class="width50 bgcol">
                                                                        <asp:Label ID="lblExpectedhigherDategradeOther" runat="server"></asp:Label>
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/check.png" visible="false" id="imgExpectedhigherDategradeOtherYes" runat="server" class="bdy-check-icon">
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/cross.png" visible="false" id="imgExpectedhigherDategradeOtherNo" runat="server" class="bdy-cross-icon">
                                                                    </td>
                                                                    <td class="width30">
                                                                        <asp:Label ID="lblExpectedhigherDategradeOtherComments" runat="server"></asp:Label>

                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>

                                                    </tr>
                                                    <tr class="adm-form-row-tr" id="higherverifyOther" runat="server" visible="false">
                                                        <td class="width30 td-rightlabel">
                                                            <label id="labelhigherverifyOther" runat="server" for="higherverify">Name of Contact who can verify this qualification </label>
                                                        </td>
                                                        <td class="width70">
                                                            <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                                <tr>
                                                                    <td class="width50 bgcol">
                                                                        <asp:Label ID="lblhigherverifyOther" runat="server"></asp:Label>
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/check.png" visible="false" id="imghigherverifyOtherYes" runat="server" class="bdy-check-icon">
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/cross.png" visible="false" id="imghigherverifyOtherNo" runat="server" class="bdy-cross-icon">
                                                                    </td>
                                                                    <td class="width30">
                                                                        <asp:Label ID="lblhigherverifyOtherComments" runat="server"></asp:Label>

                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>

                                                    </tr>
                                                    <tr class="adm-form-row-tr" id="higherrelationOther" runat="server" visible="false">
                                                        <td class="width30 td-rightlabel">
                                                            <label id="labelhigherrelationOther" runat="server" for="higherrelation">Relationship with the Contact </label>
                                                        </td>
                                                        <td class="width70">
                                                            <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                                <tr>
                                                                    <td class="width50 bgcol">
                                                                        <asp:Label ID="lblhigherrelationOther" runat="server"></asp:Label>
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/check.png" visible="false" id="imghigherrelationOtherYes" runat="server" class="bdy-check-icon">
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/cross.png" visible="false" id="imghigherrelationOtherNo" runat="server" class="bdy-cross-icon">
                                                                    </td>
                                                                    <td class="width30">
                                                                        <asp:Label ID="lblhigherrelationOtherComments" runat="server"></asp:Label>

                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>

                                                    </tr>
                                                    <tr class="adm-form-row-tr" id="highercontactEmailOther" runat="server" visible="false">
                                                        <td class="width30 td-rightlabel">
                                                            <label id="labelhighercontactEmailOther" runat="server" for="highercontactEmail">Email ID of Contact who can verify your qualification  </label>
                                                        </td>
                                                        <td class="width70">
                                                            <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                                <tr>
                                                                    <td class="width50 bgcol">
                                                                        <asp:Label ID="lblhighercontactEmailOther" runat="server"></asp:Label>
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/check.png" visible="false" id="imghighercontactEmailOtherYes" runat="server" class="bdy-check-icon">
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/cross.png" visible="false" id="imghighercontactEmailOtherNo" runat="server" class="bdy-cross-icon">
                                                                    </td>
                                                                    <td class="width30">
                                                                        <asp:Label ID="lblhighercontactEmailOtherComments" runat="server"></asp:Label>

                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>

                                                    </tr>
                                                    <tr class="adm-form-row-tr" id="highercontactMobileOther" runat="server" visible="false">
                                                        <td class="width30 td-rightlabel">
                                                            <label id="labelhighercontactMobileOther" runat="server" for="highercontactMobile">Mobile/Cellular Number of Contact who can verify your qualification</label></td>
                                                        <td class="width70">
                                                            <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                                <tr>
                                                                    <td class="width50 bgcol">
                                                                        <asp:Label ID="lblhighercontactMobileOther" runat="server"></asp:Label>
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/check.png" visible="false" id="imghighercontactMobileOtherYes" runat="server" class="bdy-check-icon">
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/cross.png" visible="false" id="imghighercontactMobileOtherNo" runat="server" class="bdy-cross-icon">
                                                                    </td>
                                                                    <td class="width30">
                                                                        <asp:Label ID="lblhighercontactMobileOtherComments" runat="server"></asp:Label>

                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>

                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <!-- Diploma-->
                                        <tr class="adm-form-row-tr" id="diploma" runat="server" visible="false">
                                            <td class="width30 td-rightlabel">
                                                <label id="labeldiploma" runat="server" for="diploma">Have you completed any Diploma or Certificate Programs ?</label>
                                            </td>
                                            <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">
                                                            <asp:Label ID="lbldiploma" runat="server"></asp:Label>
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" visible="false" id="imgdiplomaYes" runat="server" class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" visible="false" id="imgdiplomaNo" runat="server" class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30 td-rightlabel">
                                                            <asp:Label ID="lbldiplomaComments" runat="server"></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr class="adm-form-row-tr" id="diplomaCountry" runat="server" visible="false">
                                            <td class="width30 td-rightlabel">
                                                <label id="labeldiplomaCountry" runat="server" for="diplomaCountry">Country of Diploma or Certificate Programs</label>
                                            </td>
                                            <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">
                                                            <asp:Label ID="lbldiplomaCountry" runat="server"></asp:Label>

                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" visible="false" id="imgdiplomaCountryYes" runat="server" class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" visible="false" id="imgdiplomaCountryNo" runat="server" class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30">
                                                            <asp:Label ID="lbldiplomaCountryComments" runat="server"></asp:Label></td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr class="adm-form-row-tr" id="diplomastartDate" runat="server" visible="false">
                                            <td class="width30 td-rightlabel">
                                                <label id="labeldiplomastartDate" runat="server" for="diplomastartDate">Start Date </label>
                                            </td>
                                            <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">
                                                            <asp:Label ID="lbldiplomastartDate" runat="server"></asp:Label>
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" visible="false" id="imgdiplomastartDateYes" runat="server" class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" visible="false" id="imgdiplomastartDateNo" runat="server" class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30">
                                                            <asp:Label ID="lbldiplomastartDateComments" runat="server"></asp:Label></td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr class="adm-form-row-tr" id="diplomaendDate" runat="server" visible="false">
                                            <td class="width30 td-rightlabel">
                                                <label id="labeldiplomaendDate" runat="server" for="diplomaendDate">End Date </label>
                                            </td>
                                            <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">
                                                            <asp:Label ID="lbldiplomaendDate" runat="server"></asp:Label>
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" visible="false" id="imgdiplomaendDateYes" runat="server" class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" visible="false" id="imgdiplomaendDateNo" runat="server" class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30">
                                                            <asp:Label ID="lbldiplomaendDateComments" runat="server"></asp:Label>

                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr class="adm-form-row-tr" id="diplomaName" runat="server" visible="false">
                                            <td class="width30 td-rightlabel">
                                                <label id="labeldiplomaName" runat="server" for="diplomaName">Name of School</label>
                                            </td>
                                            <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">
                                                            <asp:Label ID="lbldiplomaName" runat="server"></asp:Label>
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" visible="false" id="imgdiplomaNameYes" runat="server" class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" visible="false" id="imgdiplomaNameNo" runat="server" class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30">
                                                            <asp:Label ID="lbldiplomaNameComments" runat="server"></asp:Label>

                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr class="adm-form-row-tr" id="diplomaQualificationtype" runat="server" visible="false">
                                            <td class="width30 td-rightlabel">
                                                <label id="labeldiplomaQualificationtype" runat="server" for="diplomaQualificationtype">Qualification Name</label>
                                            </td>
                                            <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">
                                                            <asp:Label ID="lbldiplomaQualificationtype" runat="server"></asp:Label>
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" visible="false" id="imgdiplomaQualificationtypeYes" runat="server" class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" visible="false" id="imgdiplomaQualificationtypeNo" runat="server" class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30">
                                                            <asp:Label ID="lbldiplomaQualificationtypeComments" runat="server"></asp:Label></td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr class="adm-form-row-tr" id="diplomastudymode" runat="server" visible="false">
                                            <td class="width30 td-rightlabel">
                                                <label id="labeldiplomastudymode" runat="server" for="diplomastudymode">Mode of study</label>
                                            </td>
                                            <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">
                                                            <asp:Label ID="lbldiplomastudymode" runat="server"></asp:Label>
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" visible="false" id="imgdiplomastudymodeYes" runat="server" class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" visible="false" id="imgdiplomastudymodeNo" runat="server" class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30">
                                                            <asp:Label ID="lbldiplomastudymodeComments" runat="server"></asp:Label></td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr class="adm-form-row-tr" id="diplomalanguage" runat="server" visible="false">
                                            <td class="width30 td-rightlabel">
                                                <label id="labeldiplomalanguage" runat="server" for="diplomalanguage">Language (Medium) of Study</label>
                                            </td>
                                            <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">
                                                            <asp:Label ID="lbldiplomalanguage" runat="server"></asp:Label>
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" visible="false" id="imgdiplomalanguageYes" runat="server" class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" visible="false" id="imgdiplomalanguageNo" runat="server" class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30">
                                                            <asp:Label ID="lbldiplomalanguageComments" runat="server"></asp:Label></td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr class="adm-form-row-tr" id="diplomagradetype" runat="server" visible="false">
                                            <td class="width30 td-rightlabel">
                                                <label id="labeldiplomagradetype" runat="server" for="diplomagradetype">Grade Type</label>
                                            </td>
                                            <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">
                                                            <asp:Label ID="lbldiplomagradetype" runat="server"></asp:Label>
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" visible="false" id="imgdiplomagradetypeYes" runat="server" class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" visible="false" id="imgdiplomagradetypeNo" runat="server" class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30">
                                                            <asp:Label ID="lbldiplomagradetypeComments" runat="server"></asp:Label></td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr class="adm-form-row-tr" id="diplomagradeachieved" runat="server" visible="false">
                                            <td class="width30 td-rightlabel">
                                                <label id="labeldiplomagradeachieved" runat="server" for="gradeachieved">Final Grade Achieved </label>
                                            </td>
                                            <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">
                                                            <asp:Label ID="lbldiplomagradeachieved" runat="server"></asp:Label>
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" visible="false" id="imgdiplomagradeachievedYes" runat="server" class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" visible="false" id="imgdiplomagradeachievedNo" runat="server" class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30">
                                                            <asp:Label ID="lbldiplomagradeachievedComments" runat="server"></asp:Label></td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr class="adm-form-row-tr" id="ExpecteddiplomaDategrade" runat="server" visible="false">
                                            <td class="width30 td-rightlabel">
                                                <label id="labelExpecteddiplomaDategrade" runat="server" for="EnglishCourse">Expected dates when results will be declared </label>
                                            </td>
                                            <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">
                                                            <asp:Label ID="lblExpecteddiplomaDategrade" runat="server"></asp:Label>
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" visible="false" id="imgExpecteddiplomaDategradeYes" runat="server" class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" visible="false" id="imgExpecteddiplomaDategradeNo" runat="server" class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30">
                                                            <asp:Label ID="lblExpecteddiplomaDategradeComments" runat="server"></asp:Label>

                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>

                                        </tr>
                                        <tr class="adm-form-row-tr" id="diplomaverify" runat="server" visible="false">
                                            <td class="width30 td-rightlabel">
                                                <label id="labeldiplomaverify" runat="server" for="diplomaverify">Name of Contact who can verify this qualification </label>
                                            </td>
                                            <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">
                                                            <asp:Label ID="lbldiplomaverify" runat="server"></asp:Label>
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" visible="false" id="imgdiplomaverifyYes" runat="server" class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" visible="false" id="imgdiplomaverifyNo" runat="server" class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30">
                                                            <asp:Label ID="lbldiplomaverifyComments" runat="server"></asp:Label>

                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>

                                        </tr>
                                        <tr class="adm-form-row-tr" id="diplomarelation" runat="server" visible="false">
                                            <td class="width30 td-rightlabel">
                                                <label id="labeldiplomarelation" runat="server" for="diplomarelation">Relationship with the Contact </label>
                                            </td>
                                            <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">
                                                            <asp:Label ID="lbldiplomarelation" runat="server"></asp:Label>
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" visible="false" id="imgdiplomarelationYes" runat="server" class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" visible="false" id="imgdiplomarelationNo" runat="server" class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30">
                                                            <asp:Label ID="lbldiplomarelationComments" runat="server"></asp:Label>

                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>

                                        </tr>
                                        <tr class="adm-form-row-tr" id="diplomacontactEmail" runat="server" visible="false">
                                            <td class="width30 td-rightlabel">
                                                <label id="labeldiplomacontactEmail" runat="server" for="diplomacontactEmail">Email ID of Contact who can verify your qualification  </label>
                                            </td>
                                            <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">
                                                            <asp:Label ID="lbldiplomacontactEmail" runat="server"></asp:Label>
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" visible="false" id="imgdiplomacontactEmailYes" runat="server" class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" visible="false" id="imgdiplomacontactEmailNo" runat="server" class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30">
                                                            <asp:Label ID="lbldiplomacontactEmailComments" runat="server"></asp:Label>

                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>

                                        </tr>
                                        <tr class="adm-form-row-tr" id="diplomacontactMobile" runat="server" visible="false">
                                            <td class="width30 td-rightlabel">
                                                <label id="labeldiplomacontactMobile" runat="server" for="diplomacontactMobile">Mobile/Cellular Number of Contact who can verify your qualification</label></td>
                                            <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">
                                                            <asp:Label ID="lbldiplomacontactMobile" runat="server"></asp:Label>
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" visible="false" id="imgdiplomacontactMobileYes" runat="server" class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" visible="false" id="imgdiplomacontactMobileNo" runat="server" class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30">
                                                            <asp:Label ID="lbldiplomacontactMobileComments" runat="server"></asp:Label>

                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>

                                        </tr>
                                        <% 
                                            for (int edu = 0; edu < CustomControlsEdu.Count; edu++)
                                            {
                                                string Comments = objCom.GetCustomFieldAdminComments(ApplicantID, 4, CustomControlsEdu[edu].labeldescription, universityID);
                                                string[] com = Comments.Split('~');

                                                string Admincomments = com[0];
                                                string Adminaction = "0";
                                                if (com.Length > 1)
                                                    Adminaction = com[1];
                                        %>
                                        <tr class="adm-form-row-tr" id="custom<%= CustomControlsEdu[edu].customfieldid%>">
                                            <td class="width30 td-rightlabel">
                                                <label id="labelcustom<%= CustomControlsEdu[edu].customfieldid%>"><%=  CustomControlsEdu[edu].labeldescription %> </label>
                                            </td>
                                            <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">
                                                            <span><%=objCom.GetCustomFieldValue(ApplicantID,4,CustomControlsEdu[edu].customfieldid) %></span>
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" id="<%="imgYes"+ CustomControlsEdu[edu].customfieldid %>" style:'<%= Adminaction == "1" ? "visibility: visible;": "visibility:hidden;"  %>' class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" id="<%="imgNo"+ CustomControlsEdu[edu].customfieldid %>" style:'<%= Adminaction == "0" ? "visibility: visible;": "visibility:hidden;"  %>' class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30 td-rightlabel">
                                                            <span><%=Admincomments %></span>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <%} %>
                                    </table>
									 <table cellpadding="0" cellspacing="0" class="table">
                                        <tr>
                                            <td class="width30 td-rightlabel">SUPERVISIOR REVIEW & COMMENTS

                                            </td>
                                            <td class="width70">
                                                <asp:TextBox ID="txtEducation" TextMode="MultiLine" CssClass="form-control" runat="server"></asp:TextBox>
                                            </td>
                                        </tr>
                                    </table>
									 <!-- Education Detail End-->
                            <!-- Language Information -->
							<div class="frm-ttle">Language Detail</div>
							 <table cellpadding="0" cellspacing="0" class="table">
                                        <tr>
                                            <td class="width30"></td>
                                            <td class="width70 bg-gry-head text-right">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50">STUDENT RESPONSE
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" class="hd-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" class="hd-cross-icon">
                                                        </td>
                                                        <td class="width30">REVIEW
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>

                                        <tr class="adm-form-row-tr" id="homelanguage" runat="server" visible="false">
                                            <td class="width30 td-rightlabel">
                                                <label id="labelhomelanguage" runat="server" for="homelanguage">What language do you speak at home</label>
                                            </td>
                                            <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">
                                                            <asp:Label ID="lblhomelanguage" runat="server"></asp:Label>
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" visible="false" id="imghomelanguageYes" runat="server" class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" visible="false" id="imghomelanguageNo" runat="server" class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30 td-rightlabel">
                                                            <asp:Label ID="lblhomelanguageComments" runat="server"></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr class="adm-form-row-tr" id="EnglishBackground" runat="server" visible="false">
                                            <td class="width30 td-rightlabel">
                                                <label id="labelEnglishBackground" runat="server" for="EnglishBackground">Have you studied an English Language Intensive Course for students from non-English speaking backgrounds</label>
                                            </td>
                                            <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">
                                                            <asp:Label ID="lblEnglishBackground" runat="server"></asp:Label>

                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" visible="false" id="imgEnglishBackgroundYes" runat="server" class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" visible="false" id="imgEnglishBackgroundNo" runat="server" class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30">
                                                            <asp:Label ID="lblEnglishBackgroundComments" runat="server"></asp:Label></td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr class="adm-form-row-tr" id="Language" runat="server" visible="false">
                                            <td class="width30 td-rightlabel">
                                                <label id="labelLanguage" runat="server" for="Language">Country of English Language Intensive Course</label>
                                            </td>
                                            <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">
                                                            <asp:Label ID="lblLanguage" runat="server"></asp:Label>
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" visible="false" id="imgLanguageYes" runat="server" class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" visible="false" id="imgLanguageNo" runat="server" class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30">
                                                            <asp:Label ID="lblLanguageComments" runat="server"></asp:Label></td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr class="adm-form-row-tr" id="YearCompletion" runat="server" visible="false">
                                            <td class="width30 td-rightlabel">
                                                <label id="labelYearCompletion" runat="server" for="YearCompletion">Year of Completion/Expected </label>
                                            </td>
                                            <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">
                                                            <asp:Label ID="lblYearCompletion" runat="server"></asp:Label>
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" visible="false" id="imgYearCompletionYes" runat="server" class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" visible="false" id="imgYearCompletionNo" runat="server" class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30">
                                                            <asp:Label ID="lblYearCompletionComments" runat="server"></asp:Label>

                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr class="adm-form-row-tr" id="NameCollege" runat="server" visible="false">
                                            <td class="width30 td-rightlabel">
                                                <label id="labelNameCollege" runat="server" for="NameCollege">Name of College or University</label>
                                            </td>
                                            <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">
                                                            <asp:Label ID="lblNameCollege" runat="server"></asp:Label>
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" visible="false" id="imgNameCollegeYes" runat="server" class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" visible="false" id="imgNameCollegeNo" runat="server" class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30">
                                                            <asp:Label ID="lblNameCollegeComments" runat="server"></asp:Label>

                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr class="adm-form-row-tr" id="studymode" runat="server" visible="false">
                                            <td class="width30 td-rightlabel">
                                                <label id="labelstudymode" runat="server" for="studymode">Mode of study</label>
                                            </td>
                                            <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">
                                                            <asp:Label ID="lblstudymode" runat="server"></asp:Label>
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" visible="false" id="imgstudymodeYes" runat="server" class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" visible="false" id="imgstudymodeNo" runat="server" class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30">
                                                            <asp:Label ID="lblstudymodeComments" runat="server"></asp:Label></td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr class="adm-form-row-tr" id="QualificationType" runat="server" visible="false">
                                            <td class="width30 td-rightlabel">
                                                <label id="labelQualificationType" runat="server" for="QualificationType">Qualification Type</label>
                                            </td>
                                            <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">
                                                            <asp:Label ID="lblQualificationType" runat="server"></asp:Label>
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" visible="false" id="imgQualificationTypeYes" runat="server" class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" visible="false" id="imgQualificationTypeNo" runat="server" class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30">
                                                            <asp:Label ID="lblQualificationTypeComments" runat="server"></asp:Label></td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr class="adm-form-row-tr" id="QualificationName" runat="server" visible="false">
                                            <td class="width30 td-rightlabel">
                                                <label id="labelQualificationName" runat="server" for="QualificationName">Qualification Name</label>
                                            </td>
                                            <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">
                                                            <asp:Label ID="lblQualificationName" runat="server"></asp:Label>
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" visible="false" id="imgQualificationNameYes" runat="server" class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" visible="false" id="imgQualificationNameNo" runat="server" class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30">
                                                            <asp:Label ID="lblQualificationNameComments" runat="server"></asp:Label></td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr class="adm-form-row-tr" id="Langgradetype" runat="server" visible="false">
                                            <td class="width30 td-rightlabel">
                                                <label id="labelLanggradetype" runat="server" for="EnglishCourse">Grade Type</label>
                                            </td>
                                            <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">
                                                            <asp:Label ID="lblLanggradetype" runat="server"></asp:Label>
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" visible="false" id="imgLanggradetypeNo" runat="server" class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" visible="false" id="imgLanggradetypeYes" runat="server" class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30">
                                                            <asp:Label ID="lblLanggradetypeComments" runat="server"></asp:Label></td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr class="adm-form-row-tr" id="gradeachieved" runat="server" visible="false">
                                            <td class="width30 td-rightlabel">
                                                <label id="labelLanggradeachieved" runat="server" for="gradeachieved">Final Grade Achieved </label>
                                            </td>
                                            <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">
                                                            <asp:Label ID="lblLanggradeachieved" runat="server"></asp:Label>
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" visible="false" id="imggradeachievedYes" runat="server" class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" visible="false" id="imggradeachievedNo" runat="server" class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30">
                                                            <asp:Label ID="lblLanggradeachievedComments" runat="server"></asp:Label></td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr class="adm-form-row-tr" id="ExpectedDategrade" runat="server" visible="false">
                                            <td class="width30 td-rightlabel">
                                                <label id="labelExpectedDategrade" runat="server" for="EnglishCourse">Expected dates when results will be declared </label>
                                            </td>
                                            <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">
                                                            <asp:Label ID="lblExpectedDategrade" runat="server"></asp:Label>
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" visible="false" id="imgExpectedDategradeYes" runat="server" class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" visible="false" id="imgExpectedDategradeNo" runat="server" class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30">
                                                            <asp:Label ID="lblExpectedDategradeComments" runat="server"></asp:Label>

                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>

                                        </tr>
                                        <tr class="adm-form-row-tr" id="isgiventest_yes_or_no" runat="server" visible="false">
                                            <td class="width30 td-rightlabel">
                                                <label id="lbl_isgiventest_yes_or_no" runat="server" for="isgiventest_yes_or_no">HAVE YOU TAKEN ANY ENGLISH LANGUAGE TEST?</label>
                                            </td>
                                            <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">
                                                            <asp:Label ID="lblisgiventest_yes_or_no" runat="server"></asp:Label>
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" visible="false" id="isgiventest_yes" runat="server" class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" visible="false" id="isgiventest_no" runat="server" class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30 td-rightlabel">
                                                            <asp:Label ID="lblisgiventest_yes_or_noComment" runat="server"></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr class="adm-form-row-tr" id="EnglishTest" runat="server" visible="false">
                                            <td class="width30 td-rightlabel">
                                                <label id="labelEnglishTest" runat="server" for="EnglishTest">Test Name</label>
                                            </td>
                                            <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">
                                                            <asp:Label ID="lblEnglishTest" runat="server"></asp:Label>
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" visible="false" id="imgEnglishTestYes" runat="server" class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" visible="false" id="imgEnglishTestNo" runat="server" class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30 td-rightlabel">
                                                            <asp:Label ID="lblEnglishTestComments" runat="server"></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        
                                        <tr id="Ilet" runat="server" visible="false" class="adm-form-row-tr">
                                            <td colspan="6">
                                                <table cellpadding="0" cellspacing="0" class="table">
                                                            <tr class="adm-form-row-tr" id="testName" runat="server" visible="false">
                                                    <td class="width30 td-rightlabel">
                                                        <label id="labeltestName" runat="server" for="testName">Test Name </label>
                                                    </td>
                                                    <td class="width70">
                                                        <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                            <tr>
                                                                <td class="width50 bgcol">
                                                                    <asp:Label ID="lbltestName" runat="server"></asp:Label>

                                                                </td>
                                                                <td class="width10">
                                                                    <img src="/assets/dashboard/img/check.png" visible="false" id="imgtestNameYes" runat="server" class="bdy-check-icon">
                                                                </td>
                                                                <td class="width10">
                                                                    <img src="/assets/dashboard/img/cross.png" visible="false" id="imgtestNameNo" runat="server" class="bdy-cross-icon">
                                                                </td>
                                                                <td class="width30">
                                                                    <asp:Label ID="lbltestNameComments" runat="server"></asp:Label></td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>   

                                                    <tr class="adm-form-row-tr" id="CandidateID" runat="server" visible="false">
                                                        <td class="width30 td-rightlabel">
                                                            <label id="labelCandidateID" runat="server" for="CandidateID">Candidate ID </label>
                                                        </td>
                                                        <td class="width70">
                                                            <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                                <tr>
                                                                    <td class="width50 bgcol">
                                                                        <asp:Label ID="lblCandidateID" runat="server"></asp:Label>
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/check.png" visible="false" id="imgCandidateIDYes" runat="server" class="bdy-check-icon">
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/cross.png" visible="false" id="imgCandidateIDNo" runat="server" class="bdy-cross-icon">
                                                                    </td>
                                                                    <td class="width30">
                                                                        <asp:Label ID="lblCandidateIDComments" runat="server"></asp:Label></td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr class="adm-form-row-tr" id="CandidateNo" runat="server" visible="false">
                                                        <td class="width30 td-rightlabel">
                                                            <label id="labelCandidateNo" runat="server" for="CandidateNo">Candidate No </label>
                                                        </td>
                                                        <td class="width70">
                                                            <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                                <tr>
                                                                    <td class="width50 bgcol">
                                                                        <asp:Label ID="lblCandidateNo" runat="server"></asp:Label>
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/check.png" visible="false" id="imgCandidateNoYes" runat="server" class="bdy-check-icon">
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/cross.png" visible="false" id="imgCandidateNoNo" runat="server" class="bdy-cross-icon">
                                                                    </td>
                                                                    <td class="width30">
                                                                        <asp:Label ID="lblCandidateNoComments" runat="server"></asp:Label>

                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr class="adm-form-row-tr" id="ieltsTestDate" runat="server" visible="false">
                                                        <td class="width30 td-rightlabel">
                                                            <label id="labelieltsTestDate" runat="server" for="ieltsTestDate">Test Date</label>
                                                        </td>
                                                        <td class="width70">
                                                            <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                                <tr>
                                                                    <td class="width50 bgcol">
                                                                        <asp:Label ID="lblieltsTestDate" runat="server"></asp:Label>
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/check.png" visible="false" id="imgieltsTestDateYes" runat="server" class="bdy-check-icon">
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/cross.png" visible="false" id="imgieltsTestDateNo" runat="server" class="bdy-cross-icon">
                                                                    </td>
                                                                    <td class="width30">
                                                                        <asp:Label ID="lblieltsTestDateComments" runat="server"></asp:Label>

                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr class="adm-form-row-tr" id="CentreNo" runat="server" visible="false">
                                                        <td class="width30 td-rightlabel">
                                                            <label id="labelCentreNo" runat="server" for="testName">Test Centre No </label>
                                                        </td>
                                                        <td class="width70">
                                                            <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                                <tr>
                                                                    <td class="width50 bgcol">
                                                                        <asp:Label ID="lblCentreNo" runat="server"></asp:Label>
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/check.png" visible="false" id="imgCentreNoYes" runat="server" class="bdy-check-icon">
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/cross.png" visible="false" id="imgCentreNoNo" runat="server" class="bdy-cross-icon">
                                                                    </td>
                                                                    <td class="width30">
                                                                        <asp:Label ID="lblCentreNoComments" runat="server"></asp:Label></td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr class="adm-form-row-tr" id="ReadingScore" runat="server" visible="false">
                                                        <td class="width30 td-rightlabel">
                                                            <label id="labelReadingScore" runat="server" for="ReadingScore">Reading Score</label>
                                                        </td>
                                                        <td class="width70">
                                                            <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                                <tr>
                                                                    <td class="width50 bgcol">
                                                                        <asp:Label ID="lblReadingScore" runat="server"></asp:Label>
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/check.png" visible="false" id="imgReadingScoreIeltYes" runat="server" class="bdy-check-icon">
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/cross.png" visible="false" id="imgReadingScoreIeltNo" runat="server" class="bdy-cross-icon">
                                                                    </td>
                                                                    <td class="width30">
                                                                        <asp:Label ID="lblReadingScoreComments" runat="server"></asp:Label></td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr class="adm-form-row-tr" id="ListeningScore" runat="server" visible="false">
                                                        <td class="width30 td-rightlabel">
                                                            <label id="labelListeningScore" runat="server" for="ListeningScore">Listening Score</label>
                                                        </td>
                                                        <td class="width70">
                                                            <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                                <tr>
                                                                    <td class="width50 bgcol">
                                                                        <asp:Label ID="lblListeningScore" runat="server"></asp:Label>
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/check.png" visible="false" id="imgListeningScoreIletYes" runat="server" class="bdy-check-icon">
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/cross.png" visible="false" id="imgListeningScoreIletNo" runat="server" class="bdy-cross-icon">
                                                                    </td>
                                                                    <td class="width30">
                                                                        <asp:Label ID="lblListeningScoreComments" runat="server"></asp:Label></td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr class="adm-form-row-tr" id="SpeakingScore" runat="server" visible="false">
                                                        <td class="width30 td-rightlabel">
                                                            <label id="labelSpeakingScore" runat="server" for="SpeakingScore">Speaking Score</label>
                                                        </td>
                                                        <td class="width70">
                                                            <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                                <tr>
                                                                    <td class="width50 bgcol">
                                                                        <asp:Label ID="lblSpeakingScore" runat="server"></asp:Label>
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/check.png" visible="false" id="imgSpeakingScoreIletYes" runat="server" class="bdy-check-icon">
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/cross.png" visible="false" id="imgSpeakingScoreIletNo" runat="server" class="bdy-cross-icon">
                                                                    </td>
                                                                    <td class="width30">
                                                                        <asp:Label ID="lblSpeakingScoreComments" runat="server"></asp:Label></td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr class="adm-form-row-tr" id="WritingScore" runat="server" visible="false">
                                                        <td class="width30 td-rightlabel">
                                                            <label id="labelWritingScore" runat="server" for="WritingScore">Writing Score</label>
                                                        </td>
                                                        <td class="width70">
                                                            <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                                <tr>
                                                                    <td class="width50 bgcol">
                                                                        <asp:Label ID="lblWritingScore" runat="server"></asp:Label>
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/check.png" visible="false" id="imgWritingScoreIletYes" runat="server" class="bdy-check-icon">
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/cross.png" visible="false" id="imgWritingScoreIletNo" runat="server" class="bdy-cross-icon">
                                                                    </td>
                                                                    <td class="width30">
                                                                        <asp:Label ID="lblWritingScoreComments" runat="server"></asp:Label></td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr class="adm-form-row-tr" id="LanguageScore" runat="server" visible="false">
                                                        <td class="width30 td-rightlabel">
                                                            <label id="labelLanguageScore" runat="server" for="LanguageScore">Total Score</label></td>
                                                        <td class="width70">
                                                            <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                                <tr>
                                                                    <td class="width50 bgcol">
                                                                        <asp:Label ID="lblLanguageScore" runat="server"></asp:Label>
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/check.png" visible="false" id="imgLanguageScoreYes" runat="server" class="bdy-check-icon">
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/cross.png" visible="false" id="imgLanguageScoreNo" runat="server" class="bdy-cross-icon">
                                                                    </td>
                                                                    <td class="width30">
                                                                        <asp:Label ID="lblLanguageScoreComments" runat="server"></asp:Label>

                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>

                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr id="PTE" runat="server" visible="false" class="adm-form-row-tr">
                                            <td colspan="6">
                                                <table cellpadding="0" cellspacing="0" class="table">
                                                    <tr class="adm-form-row-tr" id="ptetesttaker" runat="server" visible="false">
                                                        <td class="width30 td-rightlabel">
                                                            <label id="labelptetesttaker" runat="server" for="ptetesttaker">Test Taker ID</label>
                                                        </td>
                                                        <td class="width70">
                                                            <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                                <tr>
                                                                    <td class="width50 bgcol">
                                                                        <asp:Label ID="lblptetesttaker" runat="server"></asp:Label>
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/check.png" visible="false" id="imgptetesttakerYes" runat="server" class="bdy-check-icon">
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/cross.png" visible="false" id="imgptetesttakerNo" runat="server" class="bdy-cross-icon">
                                                                    </td>
                                                                    <td class="width30 td-rightlabel">
                                                                        <asp:Label ID="lblptetesttakerComments" runat="server"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr class="adm-form-row-tr" id="pteregistrationno" runat="server" visible="false">
                                                        <td class="width30 td-rightlabel">
                                                            <label id="labelpteregistrationno" runat="server" for="pteregistrationno">Registration Number </label>
                                                        </td>
                                                        <td class="width70">
                                                            <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                                <tr>
                                                                    <td class="width50 bgcol">
                                                                        <asp:Label ID="lblpteregistrationno" runat="server"></asp:Label>

                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/check.png" visible="false" id="imgpteregistrationnoYes" runat="server" class="bdy-check-icon">
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/cross.png" visible="false" id="imgpteregistrationnoNo" runat="server" class="bdy-cross-icon">
                                                                    </td>
                                                                    <td class="width30">
                                                                        <asp:Label ID="lblpteregistrationnoComments" runat="server"></asp:Label></td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr class="adm-form-row-tr" id="pteTestDate" runat="server" visible="false">
                                                        <td class="width30 td-rightlabel">
                                                            <label id="labelpteTestDate" runat="server" for="pteTestDate">Test Date</label>
                                                        </td>
                                                        <td class="width70">
                                                            <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                                <tr>
                                                                    <td class="width50 bgcol">
                                                                        <asp:Label ID="lblpteTestDate" runat="server"></asp:Label>
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/check.png" visible="false" id="imgpteTestDateYes" runat="server" class="bdy-check-icon">
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/cross.png" visible="false" id="imgpteTestDateNo" runat="server" class="bdy-cross-icon">
                                                                    </td>
                                                                    <td class="width30">
                                                                        <asp:Label ID="lblpteTestDateComments" runat="server"></asp:Label></td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr class="adm-form-row-tr" id="ptecentercountry" runat="server" visible="false">
                                                        <td class="width30 td-rightlabel">
                                                            <label id="labelptecentercountry" runat="server" for="ptecentercountry">Test Center Country</label>
                                                        </td>
                                                        <td class="width70">
                                                            <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                                <tr>
                                                                    <td class="width50 bgcol">
                                                                        <asp:Label ID="lblptecentercountry" runat="server"></asp:Label>
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/check.png" visible="false" id="imgptecentercountryYes" runat="server" class="bdy-check-icon">
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/cross.png" visible="false" id="imgptecentercountryNo" runat="server" class="bdy-cross-icon">
                                                                    </td>
                                                                    <td class="width30">
                                                                        <asp:Label ID="lblptecentercountryComments" runat="server"></asp:Label>

                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr class="adm-form-row-tr" id="ptetestcenterNo" runat="server" visible="false">
                                                        <td class="width30 td-rightlabel">
                                                            <label id="labelptetestcenterNo" runat="server" for="ptetestcenterNo">Test Centre No </label>
                                                        </td>
                                                        <td class="width70">
                                                            <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                                <tr>
                                                                    <td class="width50 bgcol">
                                                                        <asp:Label ID="lblptetestcenterNo" runat="server"></asp:Label>
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/check.png" visible="false" id="imgptetestcenterNoYes" runat="server" class="bdy-check-icon">
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/cross.png" visible="false" id="imgptetestcenterNoNo" runat="server" class="bdy-cross-icon">
                                                                    </td>
                                                                    <td class="width30">
                                                                        <asp:Label ID="lblptetestcenterNoComments" runat="server"></asp:Label>

                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr class="adm-form-row-tr" id="pteReadingScore" runat="server" visible="false">
                                                        <td class="width30 td-rightlabel">
                                                            <label id="labelpteReadingScore" runat="server" for="pteReadingScore">Reading Score</label>
                                                        </td>
                                                        <td class="width70">
                                                            <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                                <tr>
                                                                    <td class="width50 bgcol">
                                                                        <asp:Label ID="lblpteReadingScore" runat="server"></asp:Label>
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/check.png" visible="false" id="imgpteReadingScoreYes" runat="server" class="bdy-check-icon">
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/cross.png" visible="false" id="imgpteReadingScoreNo" runat="server" class="bdy-cross-icon">
                                                                    </td>
                                                                    <td class="width30">
                                                                        <asp:Label ID="lblpteReadingScoreComments" runat="server"></asp:Label></td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr class="adm-form-row-tr" id="pteListeningScore" runat="server" visible="false">
                                                        <td class="width30 td-rightlabel">
                                                            <label id="labelpteListeningScore" runat="server" for="pteListeningScore">Listening Score</label>
                                                        </td>
                                                        <td class="width70">
                                                            <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                                <tr>
                                                                    <td class="width50 bgcol">
                                                                        <asp:Label ID="lblpteListeningScore" runat="server"></asp:Label>
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/check.png" visible="false" id="imgpteListeningScoreYes" runat="server" class="bdy-check-icon">
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/cross.png" visible="false" id="imgpteListeningScoreNo" runat="server" class="bdy-cross-icon">
                                                                    </td>
                                                                    <td class="width30">
                                                                        <asp:Label ID="lblpteListeningScoreComments" runat="server"></asp:Label></td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr class="adm-form-row-tr" id="pteSpeakingScore" runat="server" visible="false">
                                                        <td class="width30 td-rightlabel">
                                                            <label id="labelpteSpeakingScore" runat="server" for="pteSpeakingScore">Speaking Score</label>
                                                        </td>
                                                        <td class="width70">
                                                            <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                                <tr>
                                                                    <td class="width50 bgcol">
                                                                        <asp:Label ID="lblpteSpeakingScore" runat="server"></asp:Label>
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/check.png" visible="false" id="imgpteSpeakingScoreYes" runat="server" class="bdy-check-icon">
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/cross.png" visible="false" id="imgpteSpeakingScoreNo" runat="server" class="bdy-cross-icon">
                                                                    </td>
                                                                    <td class="width30">
                                                                        <asp:Label ID="lblpteSpeakingScoreComments" runat="server"></asp:Label></td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr class="adm-form-row-tr" id="pteWritingScore" runat="server" visible="false">
                                                        <td class="width30 td-rightlabel">
                                                            <label id="labelpteWritingScore" runat="server" for="pteWritingScore">Writing Score</label>
                                                        </td>
                                                        <td class="width70">
                                                            <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                                <tr>
                                                                    <td class="width50 bgcol">
                                                                        <asp:Label ID="lblpteWritingScore" runat="server"></asp:Label>
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/check.png" visible="false" id="imgpteWritingScoreYes" runat="server" class="bdy-check-icon">
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/cross.png" visible="false" id="imgpteWritingScoreNo" runat="server" class="bdy-cross-icon">
                                                                    </td>
                                                                    <td class="width30">
                                                                        <asp:Label ID="lblpteWritingScoreComments" runat="server"></asp:Label></td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr class="adm-form-row-tr" id="pteTotalScore" runat="server" visible="false">
                                                        <td class="width30 td-rightlabel">
                                                            <label id="labelpteTotalScore" runat="server" for="pteTotalScore">Total Score</label>
                                                        </td>
                                                        <td class="width70">
                                                            <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                                <tr>
                                                                    <td class="width50 bgcol">
                                                                        <asp:Label ID="lblpteTotalScore" runat="server"></asp:Label>
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/check.png" visible="false" id="imgpteTotalScoreYes" runat="server" class="bdy-check-icon">
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/cross.png" visible="false" id="imgpteTotalScoreNo" runat="server" class="bdy-cross-icon">
                                                                    </td>
                                                                    <td class="width30">
                                                                        <asp:Label ID="lblpteTotalScoreComments" runat="server"></asp:Label></td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr id="Tofel" runat="server" visible="false" class="adm-form-row-tr">
                                            <td colspan="6">
                                                <table cellpadding="0" cellspacing="0" class="table">
                                                    <tr class="adm-form-row-tr" id="tofelregistrationno" runat="server" visible="false">
                                                        <td class="width30 td-rightlabel">
                                                            <label id="labeltofelregistrationno" runat="server" for="tofelregistrationno">Registration Number </label>
                                                        </td>
                                                        <td class="width70">
                                                            <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                                <tr>
                                                                    <td class="width50 bgcol">
                                                                        <asp:Label ID="lbltofelregistrationno" runat="server"></asp:Label>
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/check.png" visible="false" id="imgtofelregistrationnoYes" runat="server" class="bdy-check-icon">
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/cross.png" visible="false" id="imgtofelregistrationnoNo" runat="server" class="bdy-cross-icon">
                                                                    </td>
                                                                    <td class="width30">
                                                                        <asp:Label ID="lbltofelregistrationnoComments" runat="server"></asp:Label>

                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>

                                                    </tr>
                                                    <tr class="adm-form-row-tr" id="tofelTestDate" runat="server" visible="false">
                                                        <td class="width30 td-rightlabel">
                                                            <label id="labeltofelTestDate" runat="server" for="tofelTestDate">Test Date</label>
                                                        </td>
                                                        <td class="width70">
                                                            <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                                <tr>
                                                                    <td class="width50 bgcol">
                                                                        <asp:Label ID="lbltofelTestDate" runat="server"></asp:Label>
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/check.png" visible="false" id="imgtofelTestDateYes" runat="server" class="bdy-check-icon">
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/cross.png" visible="false" id="imgtofelTestDateNo" runat="server" class="bdy-cross-icon">
                                                                    </td>
                                                                    <td class="width30">
                                                                        <asp:Label ID="lbltofelTestDateComments" runat="server"></asp:Label></td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr class="adm-form-row-tr" id="tofelcentercountry" runat="server" visible="false">
                                                        <td class="width30 td-rightlabel">
                                                            <label id="labeltofelcentercountry" runat="server" for="tofelcentercountry">Test Center Country</label>
                                                        </td>
                                                        <td class="width70">
                                                            <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                                <tr>
                                                                    <td class="width50 bgcol">
                                                                        <asp:Label ID="lbltofelcentercountry" runat="server"></asp:Label>
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/check.png" visible="false" id="imgtofelcentercountryYes" runat="server" class="bdy-check-icon">
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/cross.png" visible="false" id="imgtofelcentercountryNo" runat="server" class="bdy-cross-icon">
                                                                    </td>
                                                                    <td class="width30">
                                                                        <asp:Label ID="lbltofelcentercountryComments" runat="server"></asp:Label></td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr class="adm-form-row-tr" id="tofelcenterNo" runat="server" visible="false">
                                                        <td class="width30 td-rightlabel">
                                                            <label id="labeltofelcenterNo" runat="server" for="tofelcenterNo">Test Centre No </label>
                                                        </td>
                                                        <td class="width70">
                                                            <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                                <tr>
                                                                    <td class="width50 bgcol">
                                                                        <asp:Label ID="lbltofelcenterNo" runat="server"></asp:Label>
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/check.png" visible="false" id="imgtofelcenterNoYes" runat="server" class="bdy-check-icon">
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/cross.png" visible="false" id="imgtofelcenterNoNo" runat="server" class="bdy-cross-icon">
                                                                    </td>
                                                                    <td class="width30">
                                                                        <asp:Label ID="lbltofelcenterNoComments" runat="server"></asp:Label></td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr class="adm-form-row-tr" id="tofelReadingScore" runat="server" visible="false">
                                                        <td class="width30 td-rightlabel">
                                                            <label id="labeltofelReadingScore" runat="server" for="tofelReadingScore">Reading Score</label>
                                                        </td>
                                                        <td class="width70">
                                                            <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                                <tr>
                                                                    <td class="width50 bgcol">
                                                                        <asp:Label ID="lbltofelReadingScore" runat="server"></asp:Label>
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/check.png" visible="false" id="imgtofelReadingScoreYes" runat="server" class="bdy-check-icon">
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/cross.png" visible="false" id="imgtofelReadingScoreNo" runat="server" class="bdy-cross-icon">
                                                                    </td>
                                                                    <td class="width30">
                                                                        <asp:Label ID="lbltofelReadingScoreComments" runat="server"></asp:Label></td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr class="adm-form-row-tr" id="tofelListeningScore" runat="server" visible="false">
                                                        <td class="width30 td-rightlabel">
                                                            <label id="labeltofelListeningScore" runat="server" for="tofelListeningScore">Listening Score</label>
                                                        </td>
                                                        <td class="width70">
                                                            <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                                <tr>
                                                                    <td class="width50 bgcol">
                                                                        <asp:Label ID="lbltofelListeningScore" runat="server"></asp:Label>
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/check.png" visible="false" id="imgtofelListeningScoreYes" runat="server" class="bdy-check-icon">
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/cross.png" visible="false" id="imgtofelListeningScoreNo" runat="server" class="bdy-cross-icon">
                                                                    </td>
                                                                    <td class="width30">
                                                                        <asp:Label ID="lbltofelListeningScoreComments" runat="server"></asp:Label>

                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>

                                                    </tr>
                                                    <tr class="adm-form-row-tr" id="tofelSpeakingScore" runat="server" visible="false">
                                                        <td class="width30 td-rightlabel">
                                                            <label id="labeltofelSpeakingScore" runat="server" for="tofelSpeakingScore">Speaking Score</label>
                                                        </td>
                                                        <td class="width70">
                                                            <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                                <tr>
                                                                    <td class="width50 bgcol">
                                                                        <asp:Label ID="lbltofelSpeakingScore" runat="server"></asp:Label>
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/check.png" visible="false" id="imgtofelSpeakingScoreYes" runat="server" class="bdy-check-icon">
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/cross.png" visible="false" id="imgtofelSpeakingScoreNo" runat="server" class="bdy-cross-icon">
                                                                    </td>
                                                                    <td class="width30">
                                                                        <asp:Label ID="lbltofelSpeakingScoreComments" runat="server"></asp:Label></td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr class="adm-form-row-tr" id="tofelWritingScore" runat="server" visible="false">
                                                        <td class="width30 td-rightlabel">
                                                            <label id="labeltofelWritingScore" runat="server" for="tofelWritingScore">Writing Score</label>
                                                        </td>
                                                        <td class="width70">
                                                            <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                                <tr>
                                                                    <td class="width50 bgcol">
                                                                        <asp:Label ID="lbltofelWritingScore" runat="server"></asp:Label>
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/check.png" visible="false" id="imgtofelWritingScoreYes" runat="server" class="bdy-check-icon">
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/cross.png" visible="false" id="imgtofelWritingScoreNo" runat="server" class="bdy-cross-icon">
                                                                    </td>
                                                                    <td class="width30">
                                                                        <asp:Label ID="lbltofelWritingScoreComments" runat="server"></asp:Label></td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr class="adm-form-row-tr" id="tofelTotalScore" runat="server" visible="false">
                                                        <td class="width30 td-rightlabel">
                                                            <label id="labeltofelTotalScore" runat="server" for="tofelTotalScore">Total Score</label>
                                                        </td>
                                                        <td class="width70">
                                                            <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                                <tr>
                                                                    <td class="width50 bgcol">
                                                                        <asp:Label ID="lbltofelTotalScore" runat="server"></asp:Label>
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/check.png" visible="false" id="imgtofelTotalScoreYes" runat="server" class="bdy-check-icon">
                                                                    </td>
                                                                    <td class="width10">
                                                                        <img src="/assets/dashboard/img/cross.png" visible="false" id="imgtofelTotalScoreNo" runat="server" class="bdy-cross-icon">
                                                                    </td>
                                                                    <td class="width30">
                                                                        <asp:Label ID="lbltofelTotalScoreComments" runat="server"></asp:Label></td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr class="adm-form-row-tr" id="CEFR" runat="server" visible="false">
                                            <td class="width30 td-rightlabel">
                                                <label id="labelCEFR" runat="server" for="CEFR">CEFR Level </label>
                                            </td>
                                            <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">
                                                            <asp:Label ID="lblCEFR" runat="server"></asp:Label>
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" visible="false" id="imgCEFRYes" runat="server" class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" visible="false" id="imgCEFRNo" runat="server" class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30">
                                                            <asp:Label ID="lblCEFRComments" runat="server"></asp:Label></td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr class="adm-form-row-tr" id="testRefno" runat="server" visible="false">
                                            <td class="width30 td-rightlabel">
                                                <label id="labeltestRefno" runat="server" for="testRefno">Test Report Reference No </label>
                                            </td>
                                            <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">
                                                            <asp:Label ID="lbltestRefno" runat="server"></asp:Label>
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" visible="false" id="imgtestRefnoYes" runat="server" class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" visible="false" id="imgtestRefnoNo" runat="server" class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30">
                                                            <asp:Label ID="lbltestRefnoComments" runat="server"></asp:Label>

                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>

                                        </tr>

                                        <% 
                                            for (int lang = 0; lang < CustomControlsLang.Count; lang++)
                                            {
                                                string Comments = objCom.GetCustomFieldAdminComments(ApplicantID, 5, CustomControlsLang[lang].labeldescription, universityID);
                                                string[] com = Comments.Split('~');

                                                string Admincomments = com[0];
                                                string Adminaction = "0";
                                                if (com.Length > 1)
                                                    Adminaction = com[1];
                                        %>
                                        <tr class="adm-form-row-tr" id="custom<%= CustomControlsLang[lang].customfieldid%>">
                                            <td class="width30 td-rightlabel">
                                                <label id="labelcustom<%= CustomControlsLang[lang].customfieldid%>"><%=  CustomControlsLang[lang].labeldescription %> </label>
                                            </td>
                                            <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">
                                                            <span><%=objCom.GetCustomFieldValue(ApplicantID,5,CustomControlsLang[lang].customfieldid) %></span>
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" id="<%="imgYes"+ CustomControlsLang[lang].customfieldid %>" style:'<%= Adminaction == "1" ? "visibility: visible;": "visibility:hidden;"  %>' class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" id="<%="imgNo"+ CustomControlsLang[lang].customfieldid %>" style:'<%= Adminaction == "0" ? "visibility: visible;": "visibility:hidden;"  %>' class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30 td-rightlabel">
                                                            <span><%=Admincomments %></span>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <%} %>
                                    </table>
									<table cellpadding="0" cellspacing="0" class="table">
                                        <tr>
                                            <td class="width30 td-rightlabel">SUPERVISIOR REVIEW & COMMENTS

                                            </td>
                                            <td class="width70">
                                                <asp:TextBox ID="txtLanguage" TextMode="MultiLine" CssClass="form-control" runat="server"></asp:TextBox>
                                            </td>
                                        </tr>
                                    </table>
									 <!-- Language information End-->
                            <!-- Employment Information-->
							<div class="frm-ttle">Employer Detail</div>
							  <table cellpadding="0" cellspacing="0" class="table">
                                        <tr>
                                            <td class="width30"></td>
                                            <td class="width70 bg-gry-head text-right">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50">STUDENT RESPONSE
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" class="hd-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" class="hd-cross-icon">
                                                        </td>
                                                        <td class="width30">REVIEW
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <% 
                                            for (int k = 0; k < EmployersDetail.Count; k++)
                                            {

                                        %>
                                        <tr class="adm-form-row-tr" id="employmentInfo_count" style:'<%= employmentInfo == "" ? "visibility: hidden;": "visibility:visible;"  %>'>
                                            <td class="width30 td-rightlabel">                                                
                                            </td>
                                            <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol" colspan="3">
                                                            <span>Employment Record:<%=k + 1 %></span>
                                                        </td>                                                        
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                   <tr class="adm-form-row-tr" id="employmentInfo" style:'<%= employmentInfo == "" ? "visibility: hidden;": "visibility:visible;"  %>'>
                                            <td class="width30 td-rightlabel">
                                                <label id="lblemploymentInfo" for="employer"><%=employmentInfo %> </label>
                                            </td>
                                            <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">                                                            
                                                            <span><%=EmployersDetail[k].wishtoaddemployer  == 1 ? "Yes" : "No" %></span>
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" id="<%="wishtoaddemployerYes" + k %>" style="visibility: hidden" class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" id="<%="wishtoaddemployerNo" + k %>" style="visibility: hidden" class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30 td-rightlabel">
                                                            <span id="<%="lblwishtoaddemployerComment" + k %>"></span>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                  <%-- <tr class="adm-form-row-tr" id="yearsOfexp" style:'<%= yearsOfexp == "" ? "visibility: hidden;": "visibility:visible;"  %>'>
                                            <td class="width30 td-rightlabel">
                                                <label id="lblyearsOfexp" for="employer"><%=yearsOfexp %> </label>
                                            </td>
                                            <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">
                                                            <span><%=EmployersDetail[k].to %></span>
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" id="<%="yearsOfexpYes" + k %>" style="visibility: hidden" class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" id="<%="yearsOfexpNo" + k %>" style="visibility: hidden" class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30 td-rightlabel">
                                                            <span id="<%="lblyearsOfexpComment" + k %>"></span>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>--%>
                                        <tr class="adm-form-row-tr" id="employer" style:'<%= employer == "" ? "visibility: hidden;": "visibility:visible;"  %>'>
                                            <td class="width30 td-rightlabel">
                                                <label id="labelemployer" for="employer"><%=employer %> </label>
                                            </td>
                                            <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">
                                                            <span><%=EmployersDetail[k].organization %></span>
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" id="<%="imgemployerYes" + k %>" style="visibility: hidden" class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" id="<%="imgemployerNo" + k %>" style="visibility: hidden" class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30 td-rightlabel">
                                                            <span id="<%="lblemployer" + k %>"></span>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr class="adm-form-row-tr" id="employerwebsite" style:'<%= employerwebsite == "" ? "visibility: hidden;": "visibility:visible;"  %>'>
                                            <td class="width30 td-rightlabel">
                                                <label id="labelemployerwebsite" for="employerwebsite"><%=employerwebsite %></label>
                                            </td>
                                            <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">
                                                            <span><%=EmployersDetail[k].website == null?"DOES NOT HAVE WEBSITE":EmployersDetail[k].website %></span>
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" id="<%="imgemployerwebsiteYes" + k %>" style="visibility: hidden" class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" id="<%="imgemployerwebsiteNo" + k %>" style="visibility: hidden" class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30 td-rightlabel">
                                                            <span id="<%="lblemployerwebsite" + k %>"></span>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr class="adm-form-row-tr" id="employercity" style:'<%= employercity == "" ? "visibility: hidden;": "visibility:visible;"  %>'>
                                            <td class="width30 td-rightlabel">
                                                <label id="labelemployercity" for="employercity"><%=employercity %></label>
                                            </td>
                                            <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">
                                                            <span><%=EmployersDetail[k].city %></span>
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" id="<%="imgemployercityYes" + k %>" style="visibility: hidden" class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" id="<%="imgemployercityNo" + k %>" style="visibility: hidden" class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30 td-rightlabel">
                                                            <span id="<%="lblemployercity" + k %>"></span>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr class="adm-form-row-tr" id="employercountry" style:'<%= employercountry == "" ? "visibility: hidden;": "visibility:visible;"  %>'>
                                            <td class="width30 td-rightlabel">
                                                <label id="labelemployercountry" for="employercountry"><%=employercountry %></label>
                                            </td>
                                            <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">
                                                            <span><%=EmployersDetail[k].country == null ? "" : objCom.GetCountryDiscription(Convert.ToInt32(EmployersDetail[k].country)) %></span>
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" id="<%="imgemployercountryYes" + k %>" style="visibility: hidden" class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" id="<%="imgemployercountryNo" + k %>" style="visibility: hidden" class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30 td-rightlabel">
                                                            <span id="<%="lblemployercountry" + k %>"></span>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr class="adm-form-row-tr" id="position" style:'<%= position == "" ? "visibility: hidden;": "visibility:visible;"  %>'>
                                            <td class="width30 td-rightlabel">
                                                <label id="labelposition" for="position"><%=position %></label>
                                            </td>
                                            <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">
                                                            <span><%=EmployersDetail[k].designation %></span>
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" id="<%="imgpositionYes" + k %>" style="visibility: hidden" class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" id="<%="imgpositionNo" + k %>" style="visibility: hidden" class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30 td-rightlabel">
                                                            <span id="<%="lblposition" + k %>"></span>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr class="adm-form-row-tr" id="startdate" style:'<%= startdate == "" ? "visibility: hidden;": "visibility:visible;"  %>'>
                                            <td class="width30 td-rightlabel">
                                                <label id="labelstartdate" for="startdate"><%=startdate %></label>
                                            </td>
                                            <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">
                                                            <span><%=Convert.ToDateTime(EmployersDetail[k].durationfrom).ToString("yyyy-MM-dd") %></span>
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" id="<%="imgstartdateYes" + k %>" style="visibility: hidden" class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" id="<%="imgstartdateNo" + k %>" style="visibility: hidden" class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30 td-rightlabel">
                                                            <span id="<%="lblstartdate" + k %>"></span>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr class="adm-form-row-tr" id="endate" style:'<%= enddate == "" ? "visibility: hidden;": "visibility:visible;"  %>'>
                                            <td class="width30 td-rightlabel">
                                                <label id="label7" runat="server" for="passportno"><%=enddate %> </label>
                                            </td>
                                            <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">
                                                            <label id="labelendate" for="endate"><%=EmployersDetail[k].durationto == null ?"Currently Working" : Convert.ToDateTime(EmployersDetail[k].durationto).ToString("yyyy-MM-dd") %></label>
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" id="<%="imgenddateYes" + k %>" style="visibility: hidden" class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" id="<%="imgenddateNo" + k %>" style="visibility: hidden" class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30 td-rightlabel">
                                                            <span id="<%="lblenddate" + k %>"></span>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr class="adm-form-row-tr" id="briefDescription" style:'<%= BriefDescription == "" ? "visibility: hidden;": "visibility:visible;"  %>'>
                                            <td class="width30 td-rightlabel">
                                                <label id="labelbriefDescription" for="briefDescription"><%=BriefDescription %></label>
                                            </td>
                                            <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">
                                                            <span><%=EmployersDetail[k].briefdescription %></span>
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" id="<%="imgbriefDescriptionYes" + k %>" style="visibility: hidden" class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" id="<%="imgbriefDescriptionNo" + k %>" style="visibility: hidden" class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30 td-rightlabel">
                                                            <span id="<%="lblbriefDescription" + k %>"></span>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr class="adm-form-row-tr" id="reportingmanger" style:'<%= reportingmanger == "" ? "visibility: hidden;": "visibility:visible;"  %>'>
                                            <td class="width30 td-rightlabel">
                                                <label id="labelreportingmanger" for="reportingmanger"><%=reportingmanger %></label>
                                            </td>
                                            <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">
                                                            <span><%=EmployersDetail[k].nameofreportingmanger %></span>
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" id="<%="imgreportingmangerYes" + k %>" style="visibility: hidden" class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" id="<%="imgreportingmangerNo" + k %>" style="visibility: hidden" class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30 td-rightlabel">
                                                            <span id="<%="lblreportingmanger" + k %>"></span>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr class="adm-form-row-tr" id="employmentverification" style:'<%= employmentverification == "" ? "visibility: hidden;": "visibility:visible;"  %>'>
                                            <td class="width30 td-rightlabel">
                                                <label id="labelemploymentverification" for="employmentverification"><%=employmentverification %> </label>
                                            </td>
                                            <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">
                                                            <span><%=EmployersDetail[k].contactpersonwithdetails %></span>
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" id="<%="imgemploymentverificationYes" + k %>" style="visibility: hidden" class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" id="<%="imgemploymentverificationNo" + k %>" style="visibility: hidden" class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30 td-rightlabel">
                                                            <span id="<%="lblemploymentverification" + k %>"></span>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr class="adm-form-row-tr" id="relationship" style:'<%= relationship == "" ? "visibility: hidden;": "visibility:visible;"  %>'>
                                            <td class="width30 td-rightlabel">
                                                <label id="labelrelationship" for="relationship"><%=relationship %>   </label>
                                            </td>
                                            <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">
                                                            <span><%=EmployersDetail[k].relationshipwithcontact == null ? "" : objCom.GetRealtionship(Convert.ToInt32(EmployersDetail[k].relationshipwithcontact))%></span>
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" id="<%="imgrelationshipYes" + k %>" style="visibility: hidden" class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" id="<%="imgrelationshipNo" + k %>" style="visibility: hidden" class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30 td-rightlabel">
                                                            <span id="<%="lblrelationship" + k %>"></span>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr class="adm-form-row-tr" id="emailEmployment" style:'<%= emailEmployment == "" ? "visibility: hidden;": "visibility:visible;"  %>'>
                                            <td class="width30 td-rightlabel">
                                                <label id="labelemail" for="email"><%=emailEmployment %>  </label>
                                            </td>
                                            <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">
                                                            <span><%=EmployersDetail[k].emailid %></span>
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" id="<%="imgemailEmploymentYes" + k %>" style="visibility: hidden" class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" id="<%="imgemailEmploymentNo" + k %>" style="visibility: hidden" class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30 td-rightlabel">
                                                            <span id="<%="lblemailEmployment" + k %>"></span>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr class="adm-form-row-tr" id="linkedin" style:'<%= linkedin == "" ? "visibility: hidden;": "visibility:visible;"  %>'>
                                            <td class="width30 td-rightlabel">
                                                <label id="labellinkedin" for="linkedin"><%=linkedin %>  </label>
                                            </td>
                                            <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">
                                                            <span><%=EmployersDetail[k].linkedinidofcontact %></span>
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" id="<%="imglinkedinYes" + k %>" style="visibility: hidden" class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" id="<%="imglinkedinNo" + k %>" style="visibility: hidden" class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30 td-rightlabel">
                                                            <span id="<%="lbllinkedin" + k %>"></span>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <%}
                                            for (int emp = 0; emp < CustomControlsEmp.Count; emp++)
                                            {
                                                string Comments = objCom.GetCustomFieldAdminComments(ApplicantID, 7, CustomControlsEmp[emp].labeldescription, universityID);
                                                string[] com = Comments.Split('~');

                                                string Admincomments = com[0];
                                                string Adminaction = "0";
                                                if (com.Length > 1)
                                                    Adminaction = com[1];
                                        %>
                                        <tr class="adm-form-row-tr" id="custom<%= CustomControlsEmp[emp].customfieldid%>">
                                            <td class="width30 td-rightlabel">
                                                <label id="labelcustom<%= CustomControlsEmp[emp].customfieldid%>"><%=  CustomControlsEmp[emp].labeldescription %> </label>
                                            </td>
                                            <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">
                                                            <span><%=objCom.GetCustomFieldValue(ApplicantID,7,CustomControlsEmp[emp].customfieldid) %></span>
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" id="<%="imgYes"+ CustomControlsEmp[emp].customfieldid %>" style:'<%= Adminaction == "1" ? "visibility: visible;": "visibility:hidden;"  %>' class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" id="<%="imgNo"+ CustomControlsEmp[emp].customfieldid %>" style:'<%= Adminaction == "0" ? "visibility: visible;": "visibility:hidden;"  %>' class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30 td-rightlabel">
                                                            <span><%=Admincomments %></span>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <%} %>
                                    </table>
									  <table cellpadding="0" cellspacing="0" class="table">
                                        <tr>
                                            <td class="width30 td-rightlabel">SUPERVISIOR REVIEW & COMMENTS

                                            </td>
                                            <td class="width70">
                                                <asp:TextBox ID="txtEmp" TextMode="MultiLine" CssClass="form-control" runat="server"></asp:TextBox>
                                            </td>
                                        </tr>
                                    </table>
									 <!-- Employement information End-->
                            <!-- Reference Check Information-->
							 <div class="frm-ttle">Reference Check Detail</div>
							  <table cellpadding="0" cellspacing="0" class="table">
                                        <tr>
                                            <td class="width30"></td>
                                            <td class="width70 bg-gry-head text-right">
                                                <table cellpadding="0" cellspacing="0" class="table">
                                                    <tr>
                                                        <td class="width50">STUDENT RESPONSE
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" class="hd-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" class="hd-cross-icon">
                                                        </td>
                                                        <td class="width30">REVIEW
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <% 
                                            for (int k = 0; k < referenccheckList.Count; k++)
                                            {

                                        %>
                                        <tr class="adm-form-row-tr" style:'<%= Name == "" ? "visibility: hidden;": "visibility:visible;"  %>'>
                                            <td class="width30 td-rightlabel">
                                                <label id="labelname" for="name"><%=Name %></label>
                                            </td>
                                            <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">
                                                            <span><%=referenccheckList[k].name %></span>
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" id="<%="imgNameYes" + k %>" style="visibility: hidden;" class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" id="<%="imgNameNo" + k %>" style="visibility: hidden;" class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30 td-rightlabel">
                                                            <span id="<%="lblName" + k %>"></span>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr class="adm-form-row-tr" style:'<%= RefrenceMobile == "" ? "visibility: hidden;": "visibility:visible;"  %>'>
                                            <td class="width30 td-rightlabel">
                                                <label id="labelmobile" for="name"><%=RefrenceMobile %> </label>
                                            </td>
                                            <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">
                                                            <span><%=referenccheckList[k].mobile %></span>
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" id="<%="imgMobileYes" + k %>" style="visibility: hidden;" class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" id="<%="imgMobileNo" + k %>" style="visibility: hidden;" class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30 td-rightlabel">
                                                            <span id="<%="lblMobile" + k %>"></span>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr class="adm-form-row-tr" style:'<%= RefrenceEmail == "" ? "visibility: hidden;": "visibility:visible;"  %>'>
                                            <td class="width30 td-rightlabel">
                                                <label id="labelEmail" for="Email"><%=RefrenceEmail %> </label>
                                            </td>
                                            <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">
                                                            <span><%=referenccheckList[k].email %></span>
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" id="<%="imgEmailYes" + k %>" style="visibility: hidden;" class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" id="<%="imgEmailNo" + k %>" style="visibility: hidden;" class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30 td-rightlabel">
                                                            <span id="<%="lblEmail" + k %>"></span>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>

                                        <%}
                                            for (int refcnt = 0; refcnt < CustomControlsRef.Count; refcnt++)
                                            {
                                                string Comments = objCom.GetCustomFieldAdminComments(ApplicantID, 6, CustomControlsRef[refcnt].labeldescription, universityID);
                                                string[] com = Comments.Split('~');

                                                string Admincomments = com[0];
                                                string Adminaction = "0";
                                                if (com.Length > 1)
                                                    Adminaction = com[1];
                                        %>
                                        <tr class="adm-form-row-tr" id="custom<%= CustomControlsRef[refcnt].customfieldid%>">
                                            <td class="width30 td-rightlabel">
                                                <label id="labelcustom<%= CustomControlsRef[refcnt].customfieldid%>"><%=  CustomControlsRef[refcnt].labeldescription %> </label>
                                            </td>
                                            <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">
                                                            <span><%=objCom.GetCustomFieldValue(ApplicantID,6,CustomControlsRef[refcnt].customfieldid) %></span>
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" id="<%="imgYes"+ CustomControlsRef[refcnt].customfieldid %>" style:'<%= Adminaction == "1" ? "visibility: visible;": "visibility:hidden;"  %>' class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" id="<%="imgNo"+ CustomControlsRef[refcnt].customfieldid %>" style:'<%= Adminaction == "0" ? "visibility: visible;": "visibility:hidden;"  %>' class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30 td-rightlabel">
                                                            <span><%=Admincomments %></span>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <%} %>
                                    </table>
									   <table cellpadding="0" cellspacing="0" class="table">
                                        <tr>
                                            <td class="width30 td-rightlabel">SUPERVISIOR REVIEW & COMMENTS

                                            </td>
                                            <td class="width70">
                                                <asp:TextBox ID="txtRef" TextMode="MultiLine" CssClass="form-control" runat="server"></asp:TextBox>
                                            </td>
                                        </tr>
                                    </table>
									 <!-- Reference Check Information End-->
                            <!-- Socail  Information-->
							
                                    <div class="frm-ttle">Social  Detail</div>
									  <table cellpadding="0" cellspacing="0" class="table">
                                        <tr>
                                            <td class="width30"></td>
                                            <td class="width70 bg-gry-head text-right">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50">STUDENT RESPONSE
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" class="hd-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" class="hd-cross-icon">
                                                        </td>
                                                        <td class="width30">REVIEW
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>

                                        <tr class="adm-form-row-tr" id="linkedinsocail" runat="server" visible="false">
                                            <td class="width30 td-rightlabel">
                                                <label id="labellinked" runat="server" for="linked">Link to your LinkedIn profile</label>
                                            </td>
                                            <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">
                                                            <asp:Label ID="lblLinkedin" runat="server"></asp:Label>
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" visible="false" id="imgLinkedinYes" runat="server" class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" visible="false" id="imgLinkedinNo" runat="server" class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30">
                                                            <asp:Label ID="lblLinkedinComments" runat="server"></asp:Label>

                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>

                                        </tr>
                                        <tr class="adm-form-row-tr" id="facebook" runat="server" visible="false">
                                            <td class="width30 td-rightlabel">
                                                <label id="labelfacebook" runat="server" for="employer">Link to your Facebook profile </label>
                                            </td>
                                            <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">
                                                            <asp:Label ID="lblFacebook" runat="server"></asp:Label>
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" visible="false" id="imglblFacebookYes" runat="server" class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" visible="false" id="imglblFacebookNo" runat="server" class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30">
                                                            <asp:Label ID="lblFacebookComments" runat="server"></asp:Label>

                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>

                                        </tr>
                                        <tr class="adm-form-row-tr" id="twitter" runat="server" visible="false">
                                            <td class="width30 td-rightlabel">
                                                <label id="labeltwitter" runat="server" for="twitter">Link to your twitter handle </label>
                                            </td>
                                            <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">
                                                            <asp:Label ID="lblTwitter" runat="server"></asp:Label>
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" visible="false" id="imgtwitterYes" runat="server" class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" visible="false" id="imgtwitterNo" runat="server" class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30">
                                                            <asp:Label ID="lblTwitterComments" runat="server"></asp:Label>

                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>

                                        </tr>

                                        <%  for (int social = 0; social < CustomControlsSocial.Count; social++)
                                            {
                                                string Comments = objCom.GetCustomFieldAdminComments(ApplicantID, 8, CustomControlsSocial[social].labeldescription, universityID);
                                                string[] com = Comments.Split('~');

                                                string Admincomments = com[0];
                                                string Adminaction = "0";
                                                if (com.Length > 1)
                                                    Adminaction = com[1];
                                        %>
                                        <tr class="adm-form-row-tr" id="custom<%= CustomControlsSocial[social].customfieldid%>">
                                            <td class="width30 td-rightlabel">
                                                <label id="labelcustom<%= CustomControlsSocial[social].customfieldid%>"><%=  CustomControlsSocial[social].labeldescription %> </label>
                                            </td>
                                            <td class="width70">
                                                <table cellpadding="0" cellspacing="0" class="table inner-table">
                                                    <tr>
                                                        <td class="width50 bgcol">
                                                            <span><%=objCom.GetCustomFieldValue(ApplicantID,8,CustomControlsSocial[social].customfieldid) %></span>
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/check.png" id="<%="imgYes"+ CustomControlsSocial[social].customfieldid %>" style:'<%= Adminaction == "1" ? "visibility: visible;": "visibility:hidden;"  %>' class="bdy-check-icon">
                                                        </td>
                                                        <td class="width10">
                                                            <img src="/assets/dashboard/img/cross.png" id="<%="imgNo"+ CustomControlsSocial[social].customfieldid %>" style:'<%= Adminaction == "0" ? "visibility: visible;": "visibility:hidden;"  %>' class="bdy-cross-icon">
                                                        </td>
                                                        <td class="width30 td-rightlabel">
                                                            <span><%=Admincomments %></span>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <%} %>
                                    </table>
									<table cellpadding="0" cellspacing="0" class="table">
                                        <tr>
                                            <td class="width30 td-rightlabel">SUPERVISIOR REVIEW & COMMENTS

                                            </td>
                                            <td class="width70">
                                                <asp:TextBox ID="txtSocial" TextMode="MultiLine" CssClass="form-control" runat="server"></asp:TextBox>
                                            </td>
                                        </tr>
                                    </table>
									 <!-- Employement information End-->
        </div>
        <script>

       <%  
            for (int k = 0; k < Comments.Count; k++)
            {
                string fieldName = Comments[k].fieldname;
                string AdminComments = Comments[k].comments;
                int Adminaction = Convert.ToInt32(Comments[k].adminaction);
                int EmployerCount = EmployersDetail.Count;
                for (int i = 0; i < EmployerCount; i++)
                {
                    if (fieldName == employer + (i + 1))
                    {%>

            $("#txtemployer<%=i%>").val('<%=AdminComments%>');
                 <%   if (Adminaction == 0)
            {%>
            $('#imgemployerNo<%=i%>').css("visibility", "visible");

                 <% }
            else
            { %>
            $('#imgemployerYes<%=i%>').css("visibility", "visible");
                      <%  }
            }
            else if (fieldName == employerwebsite + (i + 1))
            {%>

            $("#txtemployerwebsite<%=i%>").val('<%=AdminComments%>');
                            <%   if (Adminaction == 0)
            {%>
            $('#imgemployerwebsiteNo<%=i%>').css("visibility", "visible");

                                <% }
            else
            { %>
            $('#imgemployerwebsiteYes<%=i%>').css("visibility", "visible");
                                  <%  }
            }

            else if (fieldName == employercity + (i + 1))
            {%>
            $("#txtemployercity<%=i%>").val('<%=AdminComments%>');
                    <%   if (Adminaction == 0)
            {%>
            $('#imgemployercityNo<%=i%>').css("visibility", "visible");

                    <% }
            else
            { %>
            $('#imgemployercityYes<%=i%>').css("visibility", "visible");
                      <%  }
            }

            else if (fieldName == employercountry + (i + 1))
            {%>


            $("#txtemployercountry<%=i%>").val('<%=AdminComments%>');
                        <%   if (Adminaction == 0)
            {%>
            $('#imgemployercountryNo<%=i%>').css("visibility", "visible");

                        <% }
            else
            { %>
            $('#imgemployercountryYes<%=i%>').css("visibility", "visible");
                      <%  }
            }

            else if (fieldName == position + (i + 1))
            {%>


            $("#txtposition<%=i%>").val('<%=AdminComments%>');
                        <%   if (Adminaction == 0)
            {%>
            $('#imgpositionNo<%=i%>').css("visibility", "visible");

                        <% }
            else
            { %>
            $('#imgpositionYes<%=i%>').css("visibility", "visible");
                      <%  }
            }

            else if (fieldName == startdate + (i + 1))
            {%>


            $("#txtstartdate<%=i%>").val('<%=AdminComments%>');
                        <%   if (Adminaction == 0)
            {%>
            $('#imgstartdateNo<%=i%>').css("visibility", "visible");

                        <% }
            else
            { %>
            $('#imgstartdateYes<%=i%>').css("visibility", "visible");
                      <%  }
            }

            else if (fieldName == enddate + (i + 1))
            {%>


            $("#txtenddate<%=i%>").val('<%=AdminComments%>');
                        <%   if (Adminaction == 0)
            {%>
            $('#imgenddateNo<%=i%>').css("visibility", "visible");

                        <% }
            else
            { %>
            $('#imgenddateYes<%=i%>').css("visibility", "visible");
                      <%  }
            }


            else if (fieldName == BriefDescription + (i + 1))
            {%>

            $("#txtbriefDescription<%=i%>").val('<%=AdminComments%>');
                    <%   if (Adminaction == 0)
            {%>
            $('#imgbriefDescriptionNo<%=i%>').css("visibility", "visible");

                    <% }
            else
            { %>
            $('#imgbriefDescriptionYes<%=i%>').css("visibility", "visible");
                  <%  }
            }

            else if (fieldName == reportingmanger + (i + 1))
            {%>


            $("#txtreportingmanger<%=i%>").val('<%=AdminComments%>');
                    <%   if (Adminaction == 0)
            {%>
            $('#imgreportingmangerNo<%=i%>').css("visibility", "visible");

                    <% }
            else
            { %>
            $('#imgreportingmangerYes<%=i%>').css("visibility", "visible");
                  <%  }
            }

            else if (fieldName == employmentverification + (i + 1))
            {%>


            $("#txtemploymentverification<%=i%>").val('<%=AdminComments%>');
                    <%   if (Adminaction == 0)
            {%>
            $('#imgemploymentverificationNo<%=i%>').css("visibility", "visible");

                    <% }
            else
            { %>
            $('#imgemploymentverificationYes<%=i%>').css("visibility", "visible");
                  <%  }
            }

            else if (fieldName == relationship + (i + 1))
            {%>


            $("#txtrelationship<%=i%>").val('<%=AdminComments%>');
                    <%   if (Adminaction == 0)
            {%>
            $('#imgrelationshipNo<%=i%>').css("visibility", "visible");

                    <% }
            else
            { %>
            $('#imgrelationshipYes<%=i%>').css("visibility", "visible");
                  <%  }
            }

            else if (fieldName == emailEmployment + (i + 1))
            {%>  

            $("#txtemailEmployment<%=i%>").val('<%=AdminComments%>');
                    <%   if (Adminaction == 0)
            {%>
            $('#imgemailEmploymentNo<%=i%>').css("visibility", "visible");

                    <% }
            else
            { %>
            $('#imgemailEmploymentYes<%=i%>').css("visibility", "visible");
                  <%  }
            }

            else if (fieldName == linkedin + (i + 1))
            {%>
            $("#txtlinkedin<%=i%>").val('<%=AdminComments%>');
                    <%   if (Adminaction == 0)
            {%>
            $('#imglinkedinNo<%=i%>').css("visibility", "visible");

                    <% }
            else
            { %>
            $('#imglinkedinYes<%=i%>').css("visibility", "visible");
                  <%  }
                    }

                }
            }
            for (int n = 0; n < RefComments.Count; n++)
            {
                string fieldName = RefComments[n].fieldname;
                string AdminComments = RefComments[n].comments;
                int Adminaction = Convert.ToInt32(RefComments[n].adminaction);
                int RefrenceCount = referenccheckList.Count;
                for (int r = 0; r < RefrenceCount; r++)
                {
            %>
            <% if (fieldName == Name + (r + 1))
            {%> 


            $("#txtName<%=r%>").val('<%=AdminComments%>');
            <%   if (Adminaction == 0)
            {%>
            $('#imgNameNo<%=r%>').css("visibility", "visible");

            <% }
            else
            { %>
            $('#imgNameYes<%=r%>').css("visibility", "visible");
          <%  }
            }
            else if (fieldName == RefrenceEmail + (r + 1))
            {%>

            $("#txtEmail<%=r%>").val('<%=AdminComments%>');
           <%   if (Adminaction == 0)
            {%>
            $('#imgEmailNo<%=r%>').css("visibility", "visible");


            <% }
            else
            { %>
            $('#imgEmailYes<%=r%>').css("visibility", "visible");
          <%  }
            }
            else if (fieldName == RefrenceMobile + (r + 1))
            {%> 

            $("#txtMobile<%=r%>").val('<%=AdminComments%>');
            <%   if (Adminaction == 0)
            {%>
            $('#imgMobileNo<%=r%>').css("visibility", "visible");

            <% }
            else
            { %>
            $('#imgMobileYes<%=r%>').css("visibility", "visible");
          <%  }
                    }
                }
            }
        %>




</script>
        <div id="mainDiv" runat="server"></div>
    </form>
</body>
</html>
