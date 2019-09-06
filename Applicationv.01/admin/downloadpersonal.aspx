<%@ Page Language="C#" AutoEventWireup="true" CodeFile="downloadpersonal.aspx.cs" Inherits="admin_downloadpersonal" %>

<html lang="en">
<head>
    <title></title>
    <style>
        @media print {

            /* Inhaltsbreite setzen, Floats und Margins aufheben */
            /* Achtung: Die Klassen und IDs variieren von Theme zu Theme. Hier also eigene Klassen setzen */
            #content, #page {
                width: 100%;
                margin: 0;
                float: none;
            }

            /** Seitenränder einstellen */
            @page {
                margin: 2cm
            }

            /* Font auf 16px/13pt setzen, Background auf Weiß und Schrift auf Schwarz setzen.*/
            /* Das spart Tinte */
            body {
                font: 13pt Georgia, "Times New Roman", Times, serif;
                line-height: 1.3;
                background: #fff !important;
                color: #000;
            }

            h1 {
                font-size: 24pt;
            }

            h2, h3, h4 {
                font-size: 14pt;
                margin-top: 25px;
            }

            /* Alle Seitenumbrüche definieren */
            a {
                page-break-inside: avoid
            }

            blockquote {
                page-break-inside: avoid;
            }

            h1, h2, h3, h4, h5, h6 {
                page-break-after: avoid;
                page-break-inside: avoid
            }

            img {
                page-break-inside: avoid;
                page-break-after: avoid;
            }

            table, pre {
                page-break-inside: avoid
            }

            ul, ol, dl {
                page-break-before: avoid
            }

            /* Linkfarbe und Linkverhalten darstellen */
            a:link, a:visited, a {
                background: transparent;
                color: #520;
                font-weight: bold;
                text-decoration: underline;
                text-align: left;
            }

            a {
                page-break-inside: avoid
            }

                a[href^=http]:after {
                    content: " <" attr(href) "> ";
                }

            $a:after > img {
                content: "";
            }

            article a[href^="#"]:after {
                content: "";
            }

            a:not(:local-link):after {
                content: " <" attr(href) "> ";
            }

            /**
 * Eingebundene Videos verschwinden lassen und den Whitespace der iframes auf null reduzieren.
 */
            .entry iframe, ins {
                display: none;
                width: 0 !important;
                height: 0 !important;
                overflow: hidden !important;
                line-height: 0pt !important;
                white-space: nowrap;
            }

            .embed-youtube, .embed-responsive {
                position: absolute;
                height: 0;
                overflow: hidden;
            }

            /* Unnötige Elemente ausblenden für den Druck */

            #header-widgets, nav, aside.mashsb-container,
            .sidebar, .mashshare-top, .mashshare-bottom,
            .content-ads, .make-comment, .author-bio,
            .heading, .related-posts, #decomments-form-add-comment,
            #breadcrumbs, #footer, .post-byline, .meta-single,
            .site-title img, .post-tags, .readability {
                display: none;
            }

            /* Benutzerdefinierte Nachrichten vor und nach dem Inhalt einfügen */
            .entry:after {
                content: "\ Alle Rechte vorbehalten. (c) 2014 - 2016 TechBrain - techbrain.de";
                color: #999 !important;
                font-size: 1em;
                padding-top: 30px;
            }

            #header:before {
                content: "\ Vielen herzlichen Dank für das Ausdrucken unseres Artikels. Wir hoffen, dass auch andere Artikel von uns Ihr Interesse wecken können.";
                color: #777 !important;
                font-size: 1em;
                padding-top: 30px;
                text-align: center !important;
            }

            /* Wichtige Elemente definieren */
            p, address, li, dt, dd, blockquote {
                font-size: 100%
            }

            /* Zeichensatz fuer Code Beispiele */
            code, pre {
                font-family: "Courier New", Courier, mono
            }

            ul, ol {
                list-style: square;
                margin-left: 18pt;
                margin-bottom: 20pt;
            }

            li {
                line-height: 1.6em;
            }
        }
    </style>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" type="text/css" href="<%=VirtualPathUtility.ToAbsolute("~/assets/dashboard/css/bootstrap.min.css")%>" />
    <link rel="stylesheet" type="text/css" href="<%=VirtualPathUtility.ToAbsolute("~/assets/dashboard/css/style.css")%>">
</head>
<body>
    <form runat="server">
        <div>
            <table cellspacing="0" cellpadding="0" width="100%" class="report-table">
                <tr>
                    <td>
                        <table cellpadding="0" cellspacing="0" class="table">
                            <tr>
                                <td class="width25">
                                    <a href="#" class="d-inline-block">
                                        <img src="/assets/dashboard/img/gte-logo.jpg" class="img-fluid">
                                    </a>
                                </td>
                                <td class="width50 au-hedr" colspan="2">

                                    <div class="text-center txt font-bold">ADMISSIONS APPLICATION FORM </div>
                                    <div class="text-center txt font-bold">
                                        No: AAA0001
Country of Applicant: India
Commencement date: 01 October, 2019
Course applied for: Western Australian Certificate of Education (WACE)
                                    </div>
                                </td>
                                <td class="width25"></td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td colspan="3">PERSONAL DETAILS</td>
                </tr>
                <tr>
                    <td colspan="3">
                        <table border="1">
                            <tbody>
                                <tr>
                                    <td colspan="2" width="236"></td>
                                    <td width="270">
                                        <p><strong>STUDENT RESPONSE</strong></p>
                                    </td>
                                    <td width="35">&#x2713;</td>
                                    <td width="36">&#x2717;</td>
                                    <td width="120">
                                        <p><strong>REVIEW</strong></p>
                                    </td>
                                </tr>

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
                                <tr>
                                    <td width="21">
                                        <p>&nbsp;</p>
                                    </td>
                                    <td rowspan="2" width="215">
                                        <p><strong>SUPERVISIOR REVIEW </strong></p>
                                        <p><strong>&amp; COMMENTS</strong></p>
                                    </td>
                                    <td colspan="4" rowspan="2" width="460">
                                        <p>&nbsp;</p>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="21">
                                        <p>&nbsp;</p>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </td>
                </tr>
            </table>
            </td></tr>
            </table>
        </div>

    </form>

</body>
</html>
