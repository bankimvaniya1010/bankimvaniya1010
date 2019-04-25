<%@ Page Language="C#" AutoEventWireup="true" CodeFile="applicantlanguage.aspx.cs" Inherits="applicantlanguage" MasterPageFile="~/student.master" %>

<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">


    <div class="container-fluid page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">English Language Competency

            </li>
        </ol>
        <h1 class="h2">English Language Competency

        </h1>

    </div>
    <div class="page ">
        <div class="container page__container p-0">
            <div class="row m-0">
                <div class="col-lg container-fluid page__container">

                    <div class="card" style="width: 650px;">
                        <div class="list-group list-group-fit">

                            <div class="list-group-item" id="homelanguage" runat="server" style="display: none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-homelanguage">
                                    <div class="form-row">
                                        <label id="labelhomelanguage" runat="server" for="homelanguage" class="col-md-3 col-form-label form-label">What language do you speak at home</label>
                                        <div class="col-md-6">
                                            <input id="txthomelanguage" runat="server" type="text" placeholder="What language do you speak at home
"
                                                value="" class="form-control">
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="list-group-item" id="EnglishBackground" runat="server" style="display: none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-EnglishBackground">
                                    <div class="form-row">
                                        <label id="labelEnglishBackground" runat="server" for="EnglishBackground" class="col-md-3 col-form-label form-label">Have you studied an English Language Intensive Course for students from non-English speaking backgrounds</label>
                                        <div class="col-md-6">
                                            <asp:RadioButton ID="rblEnglishBackgroundYes" runat="server" GroupName="EnglishBackground" Text="Yes" />
                                            <asp:RadioButton ID="rblEnglishBackgroundNo" runat="server" GroupName="EnglishBackground" Text="No  - I am currently still studying for my English Language Course" />
                                            <asp:RadioButton ID="rblEnglishBackgroundNot" runat="server" GroupName="EnglishBackground" Text="No - I have not studied an English Language Intensive Course for people from non-English speaking backgrounds" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="Language" runat="server" style="display: none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-Language">
                                    <div class="form-row">
                                        <label id="labelLanguage" runat="server" for="Language" class="col-md-3 col-form-label form-label">Country of English Language Intensive Course</label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlLanguage" runat="server" CssClass="form-control">
                                                <asp:ListItem Value="" Selected="True">Select Country</asp:ListItem>
                                                <asp:ListItem Value="AF">Afghanistan</asp:ListItem>
                                                <asp:ListItem Value="AL">Albania</asp:ListItem>
                                                <asp:ListItem Value="DZ">Algeria</asp:ListItem>
                                                <asp:ListItem Value="AS">American Samoa</asp:ListItem>
                                                <asp:ListItem Value="AD">Andorra</asp:ListItem>
                                                <asp:ListItem Value="AO">Angola</asp:ListItem>
                                                <asp:ListItem Value="AI">Anguilla</asp:ListItem>
                                                <asp:ListItem Value="AQ">Antarctica</asp:ListItem>
                                                <asp:ListItem Value="AG">Antigua And Barbuda</asp:ListItem>
                                                <asp:ListItem Value="AR">Argentina</asp:ListItem>
                                                <asp:ListItem Value="AM">Armenia</asp:ListItem>
                                                <asp:ListItem Value="AW">Aruba</asp:ListItem>
                                                <asp:ListItem Value="AU">Australia</asp:ListItem>
                                                <asp:ListItem Value="AT">Austria</asp:ListItem>
                                                <asp:ListItem Value="AZ">Azerbaijan</asp:ListItem>
                                                <asp:ListItem Value="BS">Bahamas</asp:ListItem>
                                                <asp:ListItem Value="BH">Bahrain</asp:ListItem>
                                                <asp:ListItem Value="BD">Bangladesh</asp:ListItem>
                                                <asp:ListItem Value="BB">Barbados</asp:ListItem>
                                                <asp:ListItem Value="BY">Belarus</asp:ListItem>
                                                <asp:ListItem Value="BE">Belgium</asp:ListItem>
                                                <asp:ListItem Value="BZ">Belize</asp:ListItem>
                                                <asp:ListItem Value="BJ">Benin</asp:ListItem>
                                                <asp:ListItem Value="BM">Bermuda</asp:ListItem>
                                                <asp:ListItem Value="BT">Bhutan</asp:ListItem>
                                                <asp:ListItem Value="BO">Bolivia</asp:ListItem>
                                                <asp:ListItem Value="BA">Bosnia And Herzegowina</asp:ListItem>
                                                <asp:ListItem Value="BW">Botswana</asp:ListItem>
                                                <asp:ListItem Value="BV">Bouvet Island</asp:ListItem>
                                                <asp:ListItem Value="BR">Brazil</asp:ListItem>
                                                <asp:ListItem Value="IO">British Indian Ocean Territory</asp:ListItem>
                                                <asp:ListItem Value="BN">Brunei Darussalam</asp:ListItem>
                                                <asp:ListItem Value="BG">Bulgaria</asp:ListItem>
                                                <asp:ListItem Value="BF">Burkina Faso</asp:ListItem>
                                                <asp:ListItem Value="BI">Burundi</asp:ListItem>
                                                <asp:ListItem Value="KH">Cambodia</asp:ListItem>
                                                <asp:ListItem Value="CM">Cameroon</asp:ListItem>
                                                <asp:ListItem Value="CA">Canada</asp:ListItem>
                                                <asp:ListItem Value="CV">Cape Verde</asp:ListItem>
                                                <asp:ListItem Value="KY">Cayman Islands</asp:ListItem>
                                                <asp:ListItem Value="CF">Central African Republic</asp:ListItem>
                                                <asp:ListItem Value="TD">Chad</asp:ListItem>
                                                <asp:ListItem Value="CL">Chile</asp:ListItem>
                                                <asp:ListItem Value="CN">China</asp:ListItem>
                                                <asp:ListItem Value="CX">Christmas Island</asp:ListItem>
                                                <asp:ListItem Value="CC">Cocos (Keeling) Islands</asp:ListItem>
                                                <asp:ListItem Value="CO">Colombia</asp:ListItem>
                                                <asp:ListItem Value="KM">Comoros</asp:ListItem>
                                                <asp:ListItem Value="CG">Congo</asp:ListItem>
                                                <asp:ListItem Value="CK">Cook Islands</asp:ListItem>
                                                <asp:ListItem Value="CR">Costa Rica</asp:ListItem>
                                                <asp:ListItem Value="CI">Cote D'Ivoire</asp:ListItem>
                                                <asp:ListItem Value="HR">Croatia (Local Name: Hrvatska)</asp:ListItem>
                                                <asp:ListItem Value="CU">Cuba</asp:ListItem>
                                                <asp:ListItem Value="CY">Cyprus</asp:ListItem>
                                                <asp:ListItem Value="CZ">Czech Republic</asp:ListItem>
                                                <asp:ListItem Value="DK">Denmark</asp:ListItem>
                                                <asp:ListItem Value="DJ">Djibouti</asp:ListItem>
                                                <asp:ListItem Value="DM">Dominica</asp:ListItem>
                                                <asp:ListItem Value="DO">Dominican Republic</asp:ListItem>
                                                <asp:ListItem Value="TP">East Timor</asp:ListItem>
                                                <asp:ListItem Value="EC">Ecuador</asp:ListItem>
                                                <asp:ListItem Value="EG">Egypt</asp:ListItem>
                                                <asp:ListItem Value="SV">El Salvador</asp:ListItem>
                                                <asp:ListItem Value="GQ">Equatorial Guinea</asp:ListItem>
                                                <asp:ListItem Value="ER">Eritrea</asp:ListItem>
                                                <asp:ListItem Value="EE">Estonia</asp:ListItem>
                                                <asp:ListItem Value="ET">Ethiopia</asp:ListItem>
                                                <asp:ListItem Value="FK">Falkland Islands (Malvinas)</asp:ListItem>
                                                <asp:ListItem Value="FO">Faroe Islands</asp:ListItem>
                                                <asp:ListItem Value="FJ">Fiji</asp:ListItem>
                                                <asp:ListItem Value="FI">Finland</asp:ListItem>
                                                <asp:ListItem Value="FR">France</asp:ListItem>
                                                <asp:ListItem Value="GF">French Guiana</asp:ListItem>
                                                <asp:ListItem Value="PF">French Polynesia</asp:ListItem>
                                                <asp:ListItem Value="TF">French Southern Territories</asp:ListItem>
                                                <asp:ListItem Value="GA">Gabon</asp:ListItem>
                                                <asp:ListItem Value="GM">Gambia</asp:ListItem>
                                                <asp:ListItem Value="GE">Georgia</asp:ListItem>
                                                <asp:ListItem Value="DE">Germany</asp:ListItem>
                                                <asp:ListItem Value="GH">Ghana</asp:ListItem>
                                                <asp:ListItem Value="GI">Gibraltar</asp:ListItem>
                                                <asp:ListItem Value="GR">Greece</asp:ListItem>
                                                <asp:ListItem Value="GL">Greenland</asp:ListItem>
                                                <asp:ListItem Value="GD">Grenada</asp:ListItem>
                                                <asp:ListItem Value="GP">Guadeloupe</asp:ListItem>
                                                <asp:ListItem Value="GU">Guam</asp:ListItem>
                                                <asp:ListItem Value="GT">Guatemala</asp:ListItem>
                                                <asp:ListItem Value="GN">Guinea</asp:ListItem>
                                                <asp:ListItem Value="GW">Guinea-Bissau</asp:ListItem>
                                                <asp:ListItem Value="GY">Guyana</asp:ListItem>
                                                <asp:ListItem Value="HT">Haiti</asp:ListItem>
                                                <asp:ListItem Value="HM">Heard And Mc Donald Islands</asp:ListItem>
                                                <asp:ListItem Value="VA">Holy See (Vatican City State)</asp:ListItem>
                                                <asp:ListItem Value="HN">Honduras</asp:ListItem>
                                                <asp:ListItem Value="HK">Hong Kong</asp:ListItem>
                                                <asp:ListItem Value="HU">Hungary</asp:ListItem>
                                                <asp:ListItem Value="IS">Icel And</asp:ListItem>
                                                <asp:ListItem Value="IN">India</asp:ListItem>
                                                <asp:ListItem Value="ID">Indonesia</asp:ListItem>
                                                <asp:ListItem Value="IR">Iran (Islamic Republic Of)</asp:ListItem>
                                                <asp:ListItem Value="IQ">Iraq</asp:ListItem>
                                                <asp:ListItem Value="IE">Ireland</asp:ListItem>
                                                <asp:ListItem Value="IL">Israel</asp:ListItem>
                                                <asp:ListItem Value="IT">Italy</asp:ListItem>
                                                <asp:ListItem Value="JM">Jamaica</asp:ListItem>
                                                <asp:ListItem Value="JP">Japan</asp:ListItem>
                                                <asp:ListItem Value="JO">Jordan</asp:ListItem>
                                                <asp:ListItem Value="KZ">Kazakhstan</asp:ListItem>
                                                <asp:ListItem Value="KE">Kenya</asp:ListItem>
                                                <asp:ListItem Value="KI">Kiribati</asp:ListItem>
                                                <asp:ListItem Value="KP">Korea, Dem People'S Republic</asp:ListItem>
                                                <asp:ListItem Value="KR">Korea, Republic Of</asp:ListItem>
                                                <asp:ListItem Value="KW">Kuwait</asp:ListItem>
                                                <asp:ListItem Value="KG">Kyrgyzstan</asp:ListItem>
                                                <asp:ListItem Value="LA">Lao People'S Dem Republic</asp:ListItem>
                                                <asp:ListItem Value="LV">Latvia</asp:ListItem>
                                                <asp:ListItem Value="LB">Lebanon</asp:ListItem>
                                                <asp:ListItem Value="LS">Lesotho</asp:ListItem>
                                                <asp:ListItem Value="LR">Liberia</asp:ListItem>
                                                <asp:ListItem Value="LY">Libyan Arab Jamahiriya</asp:ListItem>
                                                <asp:ListItem Value="LI">Liechtenstein</asp:ListItem>
                                                <asp:ListItem Value="LT">Lithuania</asp:ListItem>
                                                <asp:ListItem Value="LU">Luxembourg</asp:ListItem>
                                                <asp:ListItem Value="MO">Macau</asp:ListItem>
                                                <asp:ListItem Value="MK">Macedonia</asp:ListItem>
                                                <asp:ListItem Value="MG">Madagascar</asp:ListItem>
                                                <asp:ListItem Value="MW">Malawi</asp:ListItem>
                                                <asp:ListItem Value="MY">Malaysia</asp:ListItem>
                                                <asp:ListItem Value="MV">Maldives</asp:ListItem>
                                                <asp:ListItem Value="ML">Mali</asp:ListItem>
                                                <asp:ListItem Value="MT">Malta</asp:ListItem>
                                                <asp:ListItem Value="MH">Marshall Islands</asp:ListItem>
                                                <asp:ListItem Value="MQ">Martinique</asp:ListItem>
                                                <asp:ListItem Value="MR">Mauritania</asp:ListItem>
                                                <asp:ListItem Value="MU">Mauritius</asp:ListItem>
                                                <asp:ListItem Value="YT">Mayotte</asp:ListItem>
                                                <asp:ListItem Value="MX">Mexico</asp:ListItem>
                                                <asp:ListItem Value="FM">Micronesia, Federated States</asp:ListItem>
                                                <asp:ListItem Value="MD">Moldova, Republic Of</asp:ListItem>
                                                <asp:ListItem Value="MC">Monaco</asp:ListItem>
                                                <asp:ListItem Value="MN">Mongolia</asp:ListItem>
                                                <asp:ListItem Value="MS">Montserrat</asp:ListItem>
                                                <asp:ListItem Value="MA">Morocco</asp:ListItem>
                                                <asp:ListItem Value="MZ">Mozambique</asp:ListItem>
                                                <asp:ListItem Value="MM">Myanmar</asp:ListItem>
                                                <asp:ListItem Value="NA">Namibia</asp:ListItem>
                                                <asp:ListItem Value="NR">Nauru</asp:ListItem>
                                                <asp:ListItem Value="NP">Nepal</asp:ListItem>
                                                <asp:ListItem Value="NL">Netherlands</asp:ListItem>
                                                <asp:ListItem Value="AN">Netherlands Ant Illes</asp:ListItem>
                                                <asp:ListItem Value="NC">New Caledonia</asp:ListItem>
                                                <asp:ListItem Value="NZ">New Zealand</asp:ListItem>
                                                <asp:ListItem Value="NI">Nicaragua</asp:ListItem>
                                                <asp:ListItem Value="NE">Niger</asp:ListItem>
                                                <asp:ListItem Value="NG">Nigeria</asp:ListItem>
                                                <asp:ListItem Value="NU">Niue</asp:ListItem>
                                                <asp:ListItem Value="NF">Norfolk Island</asp:ListItem>
                                                <asp:ListItem Value="MP">Northern Mariana Islands</asp:ListItem>
                                                <asp:ListItem Value="NO">Norway</asp:ListItem>
                                                <asp:ListItem Value="OM">Oman</asp:ListItem>
                                                <asp:ListItem Value="PK">Pakistan</asp:ListItem>
                                                <asp:ListItem Value="PW">Palau</asp:ListItem>
                                                <asp:ListItem Value="PA">Panama</asp:ListItem>
                                                <asp:ListItem Value="PG">Papua New Guinea</asp:ListItem>
                                                <asp:ListItem Value="PY">Paraguay</asp:ListItem>
                                                <asp:ListItem Value="PE">Peru</asp:ListItem>
                                                <asp:ListItem Value="PH">Philippines</asp:ListItem>
                                                <asp:ListItem Value="PN">Pitcairn</asp:ListItem>
                                                <asp:ListItem Value="PL">Poland</asp:ListItem>
                                                <asp:ListItem Value="PT">Portugal</asp:ListItem>
                                                <asp:ListItem Value="PR">Puerto Rico</asp:ListItem>
                                                <asp:ListItem Value="QA">Qatar</asp:ListItem>
                                                <asp:ListItem Value="RE">Reunion</asp:ListItem>
                                                <asp:ListItem Value="RO">Romania</asp:ListItem>
                                                <asp:ListItem Value="RU">Russian Federation</asp:ListItem>
                                                <asp:ListItem Value="RW">Rwanda</asp:ListItem>
                                                <asp:ListItem Value="KN">Saint K Itts And Nevis</asp:ListItem>
                                                <asp:ListItem Value="LC">Saint Lucia</asp:ListItem>
                                                <asp:ListItem Value="VC">Saint Vincent, The Grenadines</asp:ListItem>
                                                <asp:ListItem Value="WS">Samoa</asp:ListItem>
                                                <asp:ListItem Value="SM">San Marino</asp:ListItem>
                                                <asp:ListItem Value="ST">Sao Tome And Principe</asp:ListItem>
                                                <asp:ListItem Value="SA">Saudi Arabia</asp:ListItem>
                                                <asp:ListItem Value="SN">Senegal</asp:ListItem>
                                                <asp:ListItem Value="SC">Seychelles</asp:ListItem>
                                                <asp:ListItem Value="SL">Sierra Leone</asp:ListItem>
                                                <asp:ListItem Value="SG">Singapore</asp:ListItem>
                                                <asp:ListItem Value="SK">Slovakia (Slovak Republic)</asp:ListItem>
                                                <asp:ListItem Value="SI">Slovenia</asp:ListItem>
                                                <asp:ListItem Value="SB">Solomon Islands</asp:ListItem>
                                                <asp:ListItem Value="SO">Somalia</asp:ListItem>
                                                <asp:ListItem Value="ZA">South Africa</asp:ListItem>
                                                <asp:ListItem Value="GS">South Georgia , S Sandwich Is.</asp:ListItem>
                                                <asp:ListItem Value="ES">Spain</asp:ListItem>
                                                <asp:ListItem Value="LK">Sri Lanka</asp:ListItem>
                                                <asp:ListItem Value="SH">St. Helena</asp:ListItem>
                                                <asp:ListItem Value="PM">St. Pierre And Miquelon</asp:ListItem>
                                                <asp:ListItem Value="SD">Sudan</asp:ListItem>
                                                <asp:ListItem Value="SR">Suriname</asp:ListItem>
                                                <asp:ListItem Value="SJ">Svalbard, Jan Mayen Islands</asp:ListItem>
                                                <asp:ListItem Value="SZ">Sw Aziland</asp:ListItem>
                                                <asp:ListItem Value="SE">Sweden</asp:ListItem>
                                                <asp:ListItem Value="CH">Switzerland</asp:ListItem>
                                                <asp:ListItem Value="SY">Syrian Arab Republic</asp:ListItem>
                                                <asp:ListItem Value="TW">Taiwan</asp:ListItem>
                                                <asp:ListItem Value="TJ">Tajikistan</asp:ListItem>
                                                <asp:ListItem Value="TZ">Tanzania, United Republic Of</asp:ListItem>
                                                <asp:ListItem Value="TH">Thailand</asp:ListItem>
                                                <asp:ListItem Value="TG">Togo</asp:ListItem>
                                                <asp:ListItem Value="TK">Tokelau</asp:ListItem>
                                                <asp:ListItem Value="TO">Tonga</asp:ListItem>
                                                <asp:ListItem Value="TT">Trinidad And Tobago</asp:ListItem>
                                                <asp:ListItem Value="TN">Tunisia</asp:ListItem>
                                                <asp:ListItem Value="TR">Turkey</asp:ListItem>
                                                <asp:ListItem Value="TM">Turkmenistan</asp:ListItem>
                                                <asp:ListItem Value="TC">Turks And Caicos Islands</asp:ListItem>
                                                <asp:ListItem Value="TV">Tuvalu</asp:ListItem>
                                                <asp:ListItem Value="UG">Uganda</asp:ListItem>
                                                <asp:ListItem Value="UA">Ukraine</asp:ListItem>
                                                <asp:ListItem Value="AE">United Arab Emirates</asp:ListItem>
                                                <asp:ListItem Value="GB">United Kingdom</asp:ListItem>
                                                <asp:ListItem Value="US">United States</asp:ListItem>
                                                <asp:ListItem Value="UM">United States Minor Is.</asp:ListItem>
                                                <asp:ListItem Value="UY">Uruguay</asp:ListItem>
                                                <asp:ListItem Value="UZ">Uzbekistan</asp:ListItem>
                                                <asp:ListItem Value="VU">Vanuatu</asp:ListItem>
                                                <asp:ListItem Value="VE">Venezuela</asp:ListItem>
                                                <asp:ListItem Value="VN">Viet Nam</asp:ListItem>
                                                <asp:ListItem Value="VG">Virgin Islands (British)</asp:ListItem>
                                                <asp:ListItem Value="VI">Virgin Islands (U.S.)</asp:ListItem>
                                                <asp:ListItem Value="WF">Wallis And Futuna Islands</asp:ListItem>
                                                <asp:ListItem Value="EH">Western Sahara</asp:ListItem>
                                                <asp:ListItem Value="YE">Yemen</asp:ListItem>
                                                <asp:ListItem Value="ZR">Zaire</asp:ListItem>
                                                <asp:ListItem Value="ZM">Zambia</asp:ListItem>
                                                <asp:ListItem Value="ZW">Zimbabwe</asp:ListItem>
                                            </asp:DropDownList>

                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="YearCompletion" runat="server" style="display: none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-YearCompletion">
                                    <div class="form-row">
                                        <label id="labelYearCompletion" runat="server" for="YearCompletion" class="col-md-3 col-form-label form-label">Year of Completion/Expected </label>
                                        <div class="col-md-6">

                                            <input id="txtYearCompletion" runat="server" type="text" class="form-control" placeholder="DOB" data-toggle="flatpickr" value="today">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="NameCollege" runat="server" style="display: none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-NameCollege">
                                    <div class="form-row">
                                        <label id="labelNameCollege" runat="server" for="NameCollege" class="col-md-3 col-form-label form-label">Name of College or University</label>
                                        <div class="col-md-6">
                                            <input id="txtNameCollege" runat="server" type="text" placeholder="Name of College or University" value="" class="form-control">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="studymode" runat="server" style="display: none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-studymode">
                                    <div class="form-row">
                                        <label id="labelstudymode" runat="server" for="studymode" class="col-md-3 col-form-label form-label">Mode of study</label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlStudyMode" runat="server" CssClass="form-control"></asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="QualificationType" runat="server" style="display: none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-QualificationType">
                                    <div class="form-row">
                                        <label id="labelQualificationType" runat="server" for="QualificationType" class="col-md-3 col-form-label form-label">Qualification Type</label>
                                        <div class="col-md-6">
                                            <input id="txtQualificationType" runat="server" type="text" placeholder="Qualification Type" value="" class="form-control">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="gradetype" runat="server" style="display: none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-gradetype">
                                    <div class="form-row">
                                        <label id="labelgradetype" runat="server" for="EnglishCourse" class="col-md-3 col-form-label form-label">Grade Type</label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlGrade" runat="server" CssClass="form-control"></asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="gradeachieved" runat="server" style="display: none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-gradeachieved">
                                    <div class="form-row">
                                        <label id="labelgradeachieved" runat="server" for="gradeachieved" class="col-md-3 col-form-label form-label">Final Grade Achieved </label>
                                        <div class="col-md-9">
                                            <asp:RadioButton ID="rblYes" CssClass="form-control" runat="server" GroupName="HighschoolGrade" Text="Results Declared" />
                                            <asp:RadioButton ID="rblYetToConduct" CssClass="form-control" runat="server" GroupName="HighschoolGrade" Text=" Examination not conducted yet" />
                                            <asp:RadioButton ID="rblNot" runat="server" CssClass="form-control" GroupName="HighschoolGrade" Text="Examination Conducted, but Result not declared" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="ExpectedDategrade" runat="server" style="display: none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-ExpectedDategrade">
                                    <div class="form-row">
                                        <label id="labelExpectedDategrade" runat="server" for="EnglishCourse" class="col-md-3 col-form-label form-label">Expected dates when results will be declared </label>
                                        <div class="col-md-6">
                                            <input id="txtExpectedDategrade" runat="server" type="text" class="form-control" placeholder="Test Date" data-toggle="flatpickr" value="today">
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="list-group-item" id="EnglishTest" runat="server" style="display: none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-EnglishTest">
                                    <div class="form-row">
                                        <label id="labelEnglishTest" runat="server" for="EnglishTest" class="col-md-3 col-form-label form-label">Have you sat any one of the following English Language competency tests</label>
                                        <div class="col-md-6">
                                            <asp:RadioButton ID="rblLanguageielts" runat="server" GroupName="EnglishTest" Text="IELTS" />
                                            <asp:RadioButton ID="rblLanguagepearsons" runat="server" GroupName="EnglishTest" Text="Pearsons" />
                                            <asp:RadioButton ID="rblLanguagtofel" runat="server" GroupName="EnglishTest" Text="TOEFL" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="testName" runat="server" style="display: none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-testName">
                                    <div class="form-row">
                                        <label id="labeltestName" runat="server" for="testName" class="col-md-3 col-form-label form-label">Test Name </label>
                                        <div class="col-md-6">
                                            <input id="txtTestName" runat="server" type="text" placeholder="Test Score" value="" class="form-control">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="CentreNo" runat="server" style="display: none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-CentreNo">
                                    <div class="form-row">
                                        <label id="labelCentreNo" runat="server" for="testName" class="col-md-3 col-form-label form-label">Centre No </label>
                                        <div class="col-md-6">
                                            <input id="txtCentreNo" runat="server" type="text" placeholder="Centre No" value="" class="form-control">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="CandidateNo" runat="server" style="display: none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-CandidateNo">
                                    <div class="form-row">
                                        <label id="labelCandidateNo" runat="server" for="CandidateNo" class="col-md-3 col-form-label form-label">Candidate No </label>
                                        <div class="col-md-6">
                                            <input id="txtCandidateNo" runat="server" type="text" placeholder="Candidate No" value="" class="form-control">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="CandidateID" runat="server" style="display: none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-CandidateID">
                                    <div class="form-row">
                                        <label id="labelCandidateID" runat="server" for="CandidateID" class="col-md-3 col-form-label form-label">Candidate ID </label>
                                        <div class="col-md-6">
                                            <input id="txtCandidateID" runat="server" type="text" placeholder="Candidate ID" value="" class="form-control">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="LanguageTestDate" runat="server" style="display: none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-LanguageTestDate">
                                    <div class="form-row">
                                        <label id="labelLanguageTestDate" runat="server" for="LanguageTestDate" class="col-md-3 col-form-label form-label">Test Date</label>
                                        <div class="col-md-6">
                                            <input id="txtLanguageTestDate" runat="server" type="text" class="form-control" placeholder="Test Date" data-toggle="flatpickr" value="today">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="LanguageScore" runat="server" style="display: none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-LanguageScore">
                                    <div class="form-row">
                                        <label id="labelLanguageScore" runat="server" for="LanguageScore" class="col-md-3 col-form-label form-label">Overall Score </label>
                                        <div class="col-md-6">
                                            <input id="txtLanguageScore" runat="server" type="text" placeholder="Test Score" value="" class="form-control">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="SpeakingScore" runat="server" style="display: none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-SpeakingScore">
                                    <div class="form-row">
                                        <label id="labelSpeakingScore" runat="server" for="SpeakingScore" class="col-md-3 col-form-label form-label">Speaking Score </label>
                                        <div class="col-md-6">
                                            <input id="txtSpeaking" runat="server" type="text" placeholder="Speaking Score" value="" class="form-control">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="ListeningScore" runat="server" style="display: none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-ListeningScore">
                                    <div class="form-row">
                                        <label id="labelListeningScore" runat="server" for="ListeningScore" class="col-md-3 col-form-label form-label">Listening Score </label>
                                        <div class="col-md-6">
                                            <input id="txtListening" runat="server" type="text" placeholder="Listening Score " value="" class="form-control">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="ReadingScore" runat="server" style="display: none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-ReadingScore">
                                    <div class="form-row">
                                        <label id="labelReadingScore" runat="server" for="ReadingScore" class="col-md-3 col-form-label form-label">Reading Score </label>
                                        <div class="col-md-6">
                                            <input id="txtReading" runat="server" type="text" placeholder="Reading Score" value="" class="form-control">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="WritingScore" runat="server" style="display: none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-WritingScore">
                                    <div class="form-row">
                                        <label id="labelWritingScore" runat="server" for="ListeningScore" class="col-md-3 col-form-label form-label">Writing Score </label>
                                        <div class="col-md-6">
                                            <input id="txtWriting" runat="server" type="text" placeholder="Writing Score " value="" class="form-control">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="CEFR" runat="server" style="display: none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-CEFR">
                                    <div class="form-row">
                                        <label id="labelCEFR" runat="server" for="CEFR" class="col-md-3 col-form-label form-label">CEFR Level </label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlCEFR" runat="server" CssClass="form-control">
                                                <asp:ListItem Value="" Selected="True">Select CEFR</asp:ListItem>
                                                <asp:ListItem Text="A1" Value="A1"></asp:ListItem>
                                                <asp:ListItem Text="A2" Value="A2"></asp:ListItem>
                                                <asp:ListItem Text="B1" Value="B1"></asp:ListItem>
                                                <asp:ListItem Text="B2" Value="B2"></asp:ListItem>
                                                <asp:ListItem Text="C1" Value="C1"></asp:ListItem>
                                                <asp:ListItem Text="C2" Value="C2"></asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="testRefno" runat="server" style="display: none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-testRefno">
                                    <div class="form-row">
                                        <label id="labeltestRefno" runat="server" for="testRefno" class="col-md-3 col-form-label form-label">Test Report Reference No </label>
                                        <div class="col-md-6">
                                            <input id="txttestRefno" runat="server" type="text" placeholder="Writing Score " value="" class="form-control">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="employerwebsite">
                                <div class="form-group m-0" role="group" aria-labelledby="label-employerwebsite">
                                    <div class="form-row">
                                        <a href="applicantworkexperience.aspx" class="btn btn-success" style="margin-right: 10px;">Work Experience</a>
                                        <asp:Button ID="btn_login" runat="server" Text="Save Changes" CssClass="btn btn-success" OnClick="btn_login_Click" />
                                        <div class="col-md-6">
                                            <asp:Label ID="lblMessage" runat="server" Visible="false"></asp:Label>
                                            <asp:Label ID="lblSaveTime" runat="server"></asp:Label>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
                <div id="page-nav" class="col-lg-auto page-nav">

                    <div>
                        <span id="tooltip"></span>
                    </div>


                </div>

            </div>
        </div>


        <div class="container page__container">
            <div class="footer">
            </div>

        </div>
    </div>
    <script> $(document).ready(function () {
            $(".form-control")
                .mouseover(function () {
                    var controlId = $(this).attr('id');
                    var title = $(this).attr('title');
                    $("#tooltip").text(title);
                });
            var highschool = $("input[type=radio][name='ctl00$ContentPlaceHolder1$EnglishBackground']:checked").val()
            if (highschool == 'rblEnglishBackgroundYes') {
                $("#Language").show();
                $("#YearCompletion").show();
                $("#NameCollege").show();
                $("#studymode").show();
                $("#QualificationType").show();
                $("#gradetype").show();
                $("#ExpectedDategrade").hide();
                $("#highschoolgradeachieved").show();


            }
            else if (highschool == 'rblHighNot') {
                $("#Language").show();
                $("#YearCompletion").show();
                $("#NameCollege").show();
                $("#studymode").show();
                $("#QualificationType").show();
                $("#gradetype").show();
                $("#ExpectedDategrade").show();
                $("#highschoolgradeachieved").hide();
            }
            else {
                $("#Language").hide();
                $("#YearCompletion").hide();
                $("#NameCollege").hide();
                $("#studymode").hide();
                $("#QualificationType").hide();
                $("#gradetype").hide();
                $("#ExpectedDategrade").hide();
                $("#highschoolgradeachieved").hide();
            }
        });
        $(function () {
            $("input[name='ctl00$ContentPlaceHolder1$EnglishBackground']").click(function () {
                if ($("#ContentPlaceHolder1_rblEnglishBackgroundNot").is(":checked")) {
                    $("#Language").hide();
                    $("#YearCompletion").hide();
                    $("#NameCollege").hide();
                    $("#studymode").hide();
                    $("#QualificationType").hide();
                    $("#gradetype").hide();
                    $("#ExpectedDategrade").hide();
                    $("#highschoolgradeachieved").hide();

                } else if ($("#ContentPlaceHolder1_rblEnglishBackgroundNo").is(":checked")) {
                    $("#Language").show();
                    $("#YearCompletion").show();
                    $("#NameCollege").show();
                    $("#studymode").show();
                    $("#QualificationType").show();
                    $("#gradetype").show();
                    $("#ExpectedDategrade").show();
                    $("#highschoolgradeachieved").hide();
                }
                else {
                    $("#Language").show();
                    $("#YearCompletion").show();
                    $("#NameCollege").show();
                    $("#studymode").show();
                    $("#QualificationType").show();
                    $("#gradetype").show();
                    $("#ExpectedDategrade").hide();
                    $("#highschoolgradeachieved").show();
                }
            });
        });
        $(function () {
            $("input[name='ctl00$ContentPlaceHolder1$EnglishTest']").click(function () {
                if ($("#ContentPlaceHolder1_rblEnglishBackgroundYes").is(":checked")) {
                    $("#LanguageScore").show();
                    $("#LanguageTestDate").show();

                } else {
                    $("#LanguageScore").show();
                    $("#LanguageTestDate").show();

                }
            });
        });
        $('#ContentPlaceHolder1_txtLanguageTestDate').flatpickr({

            dateFormat: 'Y-m-d'
        });
        $('#ContentPlaceHolder1_txtYearCompletion').flatpickr({

            dateFormat: 'Y-m-d'
        });
        $('#ContentPlaceHolder1_txtExpectedDategrade').flatpickr({

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
