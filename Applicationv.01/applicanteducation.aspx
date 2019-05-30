<%@ Page Language="C#" AutoEventWireup="true" CodeFile="applicanteducation.aspx.cs" Inherits="applicanteducation" MasterPageFile="~/student.master" %>

<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">


    <div class="container-fluid page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">Education Details</li>
        </ol>
        <h1 class="h2">Education Details</h1>

    </div>
    <div class="page ">
        <div class="container page__container p-0">
            <div class="row m-0">
                <div class="col-lg container-fluid page__container">

                    <div class="card" style="width: 650px;">
                        <div class="list-group list-group-fit">
                            <!----High School Start------>
                            <div class="list-group-item" id="highschool" runat="server" style="display:none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-highschool">
                                    <div class="form-row">
                                        <label id="labelhighschool" runat="server" for="highschool" class="col-md-3 col-form-label form-label">Have you completed high school?</label>
                                        <div class="col-md-9">
                                            <asp:RadioButton ID="rblHighYes" CssClass="form-control" runat="server" GroupName="highschool" Text="Yes" />
                                            <asp:RadioButton ID="rblHighNo" CssClass="form-control" runat="server" GroupName="highschool" Text="No- I am currently studying for my high school qualification " />
                                            <asp:RadioButton ID="rblHighNot" CssClass="form-control" runat="server" GroupName="highschool" Text="No- I do not have a high school qualification " />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="highschoolCountry" runat="server" style="display:none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-highschoolCountry">
                                    <div class="form-row">
                                        <label id="labelhighschoolCountry" runat="server" for="highschoolCountry" class="col-md-3 col-form-label form-label">Country of High School Education</label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlCountryHighSchool" CssClass="form-control" runat="server">
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
                            <div class="list-group-item" id="highschoolstartDate" runat="server" style="display:none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-highschoolstartDate">
                                    <div class="form-row">
                                        <label id="labelhighschoolstartDate" runat="server" for="highschoolstartDate" class="col-md-3 col-form-label form-label">Start Date </label>
                                        <div class="col-md-6">
                                            <input id="txtStartDate" runat="server" type="text" class="form-control" placeholder="Start Date" data-toggle="flatpickr" value="today">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="highschoolendDate" runat="server" style="display:none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-highschoolendateDate">
                                    <div class="form-row">
                                        <label id="labelhighschoolendDate" runat="server" for="highschoolendDate" class="col-md-3 col-form-label form-label">End Date </label>
                                        <div class="col-md-6">
                                            <input id="txtEndDate" runat="server" type="text" class="form-control" placeholder="End Date" data-toggle="flatpickr" value="today">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="highschoolName" runat="server" style="display:none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-highschoolName">
                                    <div class="form-row">
                                        <label id="labelhighschoolName" runat="server" for="highschoolName" class="col-md-3 col-form-label form-label">Name of School</label>
                                        <div class="col-md-6">
                                            <input id="txthighschoolName" runat="server" type="text" class="form-control" placeholder="Name of School">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="highschoolQualificationtype" runat="server" style="display:none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-highschoolQualificationtype">
                                    <div class="form-row">
                                        <label id="labelhighschoolQualificationtype" runat="server" for="highschoolQualificationtype" class="col-md-3 col-form-label form-label">Qualification Type</label>
                                        <div class="col-md-6">
                                            <input id="txthighschoolQualificationtype" runat="server" type="text" placeholder="Qualification Type

"
                                                value="" class="form-control">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="highschoolstudymode" runat="server" style="display:none"> 
                                <div class="form-group m-0" role="group" aria-labelledby="label-highschoolstudymode">
                                    <div class="form-row">
                                        <label id="labelhighschoolstudymode" runat="server" for="highschoolstudymode" class="col-md-3 col-form-label form-label">Mode of study</label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlHighSchoolStudyMode" runat="server" CssClass="form-control"></asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="highschoollanguage" runat="server" style="display:none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-highschoollanguage">
                                    <div class="form-row">
                                        <label id="labelhighschoollanguage" runat="server" for="highschoollanguage" class="col-md-3 col-form-label form-label">Language (Medium) of Study</label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlHighschoolMedium" runat="server" CssClass="form-control"></asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="gradetype" runat="server" style="display:none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-gradetype">
                                    <div class="form-row">
                                        <label id="labelgradetype" runat="server" for="EnglishCourse" class="col-md-3 col-form-label form-label">Grade Type</label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlHighSchoolGrade" runat="server" CssClass="form-control"></asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="highschoolgradeachieved" runat="server" style="display:none">
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
                            <div class="list-group-item" id="ExpectedHighSchoolDategrade" runat="server" style="display:none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-ExpectedHighSchoolDategrade">
                                    <div class="form-row">
                                        <label id="labelExpectedHighSchoolDategrade" runat="server" for="EnglishCourse" class="col-md-3 col-form-label form-label">Expected dates when results will be declared </label>
                                        <div class="col-md-6">
                                            <input id="txtExpectedHighSchoolResult" runat="server" type="text" class="form-control" placeholder="" data-toggle="flatpickr" value="today">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="highschoolverify" runat="server" style="display:none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-highschoolverify">
                                    <div class="form-row">
                                        <label id="labelhighschoolverify" runat="server" for="highschoolverify" class="col-md-3 col-form-label form-label">Name of Contact who can verify this qualification </label>
                                        <div class="col-md-6">
                                            <input id="txthighschoolverify" runat="server" type="text" class="form-control" placeholder="Name of Contact who can verify this qualification">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="highschoolrelation" runat="server" style="display:none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-highschoolrelation">
                                    <div class="form-row">
                                        <label id="labelhighschoolrelation" runat="server" for="highschoolrelation" class="col-md-3 col-form-label form-label">Relationship with the Contact </label>
                                        <div class="col-md-6">
                                            <input id="txthighschoolrelation" runat="server" type="text" class="form-control" placeholder="Relationship with the Contact">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="highschoolcontactEmail" runat="server" style="display:none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-highschoolcontactEmail">
                                    <div class="form-row">
                                        <label id="labelhighschoolcontactEmail" runat="server" for="highschoolcontactEmail" class="col-md-3 col-form-label form-label">Email ID of Contact who can verify your qualification  </label>
                                        <div class="col-md-6">
                                            <input id="txthighschoolcontactEmail" runat="server" type="text" class="form-control" placeholder="Email ID of Contact who can verify your employment">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="highschoolcontactMobile" runat="server" style="display:none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-highschoolcontactMobile">
                                    <div class="form-row">
                                        <label id="labelhighschoolcontactMobile" runat="server" for="highschoolcontactMobile" class="col-md-3 col-form-label form-label">Mobile/Cellular Number of Contact who can verify your qualification</label>
                                        <div class="col-md-6">
                                            <input id="txtMobilehighSchool" runat="server" type="text" class="form-control" placeholder="Mobile no of Contact who can verify">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="higestEducation" runat="server" style="display:none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-higestEducation">
                                    <div class="form-row">
                                        <label id="labelhigestEducation" runat="server" for="higestEducation" class="col-md-3 col-form-label form-label">Highest Education</label>
                                        <div class="col-md-6">
                                            <input id="txtHigestEducation" runat="server" type="text" placeholder="Highest Education" value="" class="form-control">
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="list-group-item" id="highshoolgrade" runat="server" style="display:none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-highschoolYear">
                                    <div class="form-row">
                                        <input type="button" runat="server" class="btn btn-success" id="btn10th" value="Add Subject and their Grades" />
                                    </div>
                                    <div class="form-row">
                                        <div class="col-md-9">
                                            <div style="margin-top: 10px;" class="table-responsive" data-toggle="lists" data-lists-values='["name"]'>
                                                <asp:GridView ID="grd10" DataKeyNames="applicantgradeid" runat="server" CssClass="table" AutoGenerateColumns="false" OnDataBound="grd10_DataBound" OnRowDeleted="grd10_RowDeleted" OnRowDeleting="grd10_RowDeleting">
                                                    <Columns>
                                                        <asp:TemplateField ItemStyle-Width="30px" HeaderText="Course Name">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lbldesignation" runat="server"
                                                                    Text='<%#Eval("courseid.ClientID%>")%>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField ItemStyle-Width="30px" HeaderText="Subject">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblorganization" runat="server"
                                                                    Text='<%#Eval("subject.ClientID%>")%>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField ItemStyle-Width="30px" HeaderText="Grade Type">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblcontactpersonwithdetails" runat="server"
                                                                    Text='<%#Eval("gradetype.ClientID%>")%>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField ItemStyle-Width="30px" HeaderText="Grade ">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblcontactpersonwithdetails" runat="server"
                                                                    Text='<%#Eval("studentgrade.ClientID%>")%>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>

                                                        <asp:CommandField HeaderText="Delete" ShowDeleteButton="True" ShowHeader="True" />
                                                    </Columns>
                                                </asp:GridView>

                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!----High School END------>

                            <!----Secondary Start------>
                            <div id="SecondarySection">
                                <div class="list-group-item" id="Secondary" runat="server" style="display:none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-Secondary">
                                        <div class="form-row">
                                            <label id="labelSecondary" runat="server" for="Secondary" class="col-md-3 col-form-label form-label">Have you completed Senior Secondary school? (Year 12)?</label>
                                            <div class="col-md-9">
                                                <asp:RadioButton ID="rblSecondaryYes" CssClass="form-control" runat="server" GroupName="Secondary" Text="Yes" />
                                                <asp:RadioButton ID="rblSecondaryNo" CssClass="form-control" runat="server" GroupName="Secondary" Text="No  - I am currently still studying for my Senior Secondary " />
                                                <asp:RadioButton ID="rblSecondaryNot" CssClass="form-control" runat="server" GroupName="Secondary" Text="No - I do not have a Senior Secondary qualification" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item" id="SecondaryCountry" runat="server" style="display:none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-SecondaryCountry">
                                        <div class="form-row">
                                            <label id="labelSecondaryCountry" runat="server" for="SecondaryCountry" class="col-md-3 col-form-label form-label">Country of Secondary Education</label>
                                            <div class="col-md-6">
                                                <asp:DropDownList ID="ddlSecondaryCountry" CssClass="form-control" runat="server">
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
                                <div class="list-group-item" id="SecondarystartDate" runat="server" style="display:none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-SecondarystartDate">
                                        <div class="form-row">
                                            <label id="labelSecondarystartDate" runat="server" for="SecondarystartDate" class="col-md-3 col-form-label form-label">Start Date </label>
                                            <div class="col-md-6">
                                                <input id="txtSecondaryStartDate" runat="server" type="text" class="form-control" placeholder="Start Date" data-toggle="flatpickr" value="today">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item" id="SecondaryendDate" runat="server" style="display:none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-SecondaryendDate">
                                        <div class="form-row">
                                            <label id="labelSecondaryendDate" runat="server" for="SecondaryendDate" class="col-md-3 col-form-label form-label">End Date </label>
                                            <div class="col-md-6">
                                                <input id="txtSecondaryEndDate" runat="server" type="text" class="form-control" placeholder="End Date" data-toggle="flatpickr" value="today">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item" id="SecondaryschoolName" runat="server" style="display:none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-SecondaryschoolName">
                                        <div class="form-row">
                                            <label id="labelSecondaryschoolName" runat="server" for="SecondaryschoolName" class="col-md-3 col-form-label form-label">Name of School</label>
                                            <div class="col-md-6">
                                                <input id="txtSecondarySchoolName" runat="server" type="text" class="form-control" placeholder="Name of School

">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item" id="SecondaryQualificationtype" runat="server" style="display:none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-SecondaryQualificationtype">
                                        <div class="form-row">
                                            <label id="labelSecondaryQualificationtype" runat="server" for="SecondaryQualificationtype" class="col-md-3 col-form-label form-label">Qualification Type</label>
                                            <div class="col-md-6">
                                                <input id="txtSecondaryQualificationtype" runat="server" type="text" placeholder="Qualification Type

"
                                                    value="" class="form-control">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item" id="Secondarystudymode" runat="server" style="display:none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-Secondarystudymode">
                                        <div class="form-row">
                                            <label id="labelSecondarystudymode" runat="server" for="Secondarystudymode" class="col-md-3 col-form-label form-label">Mode of study</label>
                                            <div class="col-md-6">
                                                <asp:DropDownList ID="ddlSecondaryStudyMode" runat="server" CssClass="form-control"></asp:DropDownList>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item" id="Secondarylanguage" runat="server" style="display:none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-Secondarylanguage">
                                        <div class="form-row">
                                            <label id="labelSecondarylanguage" runat="server" for="Secondarylanguage" class="col-md-3 col-form-label form-label">Language (Medium) of Study</label>
                                            <div class="col-md-6">
                                                <asp:DropDownList ID="ddlSecondaryMedium" runat="server" CssClass="form-control"></asp:DropDownList>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item" id="Secondarygradetype" runat="server" style="display:none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-Secondarygradetype">
                                        <div class="form-row">
                                            <label id="labelSecondarygradetype" runat="server" for="Secondarygradetype" class="col-md-3 col-form-label form-label">Grade Type</label>
                                            <div class="col-md-6">
                                                <asp:DropDownList ID="ddlSecondaryGrade" runat="server" CssClass="form-control"></asp:DropDownList>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item" id="Secondarygradeachieved" runat="server" style="display:none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-Secondarygradeachieved">
                                        <div class="form-row">
                                            <label id="labelSecondarygradeachieved" runat="server" for="Secondarygradeachieved" class="col-md-3 col-form-label form-label">Final Grade Achieved </label>
                                            <div class="col-md-9">
                                                <asp:RadioButton CssClass="form-control" ID="rblSecondarygradeachievedYes" runat="server" GroupName="Secondarygradeachieved" Text="Results Declared" />
                                                <asp:RadioButton CssClass="form-control" ID="SecondarygradeachievedYet" runat="server" GroupName="Secondarygradeachieved" Text=" Examination not conducted yet" />
                                                <asp:RadioButton CssClass="form-control" ID="SecondarygradeachievedNo" runat="server" GroupName="Secondarygradeachieved" Text="Examination Conducted, but Result not declared" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item" id="ExpectedSecondaryDategrade" runat="server" style="display:none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-ExpectedSecondaryDategrade">
                                        <div class="form-row">
                                            <label id="labelExpectedSecondaryDategrade" runat="server" style="display:none" for="ExpectedSecondaryDategrade" class="col-md-3 col-form-label form-label">Expected dates when results will be declared </label>
                                            <div class="col-md-6">
                                                <input id="txtExpectedSecondaryResult" runat="server" type="text" class="form-control" placeholder="" data-toggle="flatpickr" value="today">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item" id="Secondaryverify" runat="server" style="display:none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-Secondaryverify">
                                        <div class="form-row">
                                            <label id="labelSecondaryverify" runat="server" for="Secondaryverify" class="col-md-3 col-form-label form-label">Name of Contact who can verify this qualification </label>
                                            <div class="col-md-6">
                                                <input id="txtSecondaryverify" runat="server" type="text" class="form-control" placeholder="Name of Contact who can verify this qualification">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item" id="secondaryschoolrelation" runat="server" style="display:none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-secondaryschoolrelation">
                                        <div class="form-row">
                                            <label id="labelsecondaryschoolrelation" runat="server" for="secondaryschoolrelation" class="col-md-3 col-form-label form-label">Relationship with the Contact </label>
                                            <div class="col-md-6">
                                                <input id="txtsecondaryschoolrelation" runat="server" type="text" class="form-control" placeholder="Relationship with the Contact">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item" id="secondarycontactEmail" runat="server" style="display:none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-secondarycontactEmail">
                                        <div class="form-row">
                                            <label id="labelsecondarycontactEmail" runat="server" for="secondarycontactEmail" class="col-md-3 col-form-label form-label">Email ID of Contact who can verify your qualification  </label>
                                            <div class="col-md-6">
                                                <input id="txtsecondarycontactEmail" runat="server" type="text" class="form-control" placeholder="Email ID of Contact who can verify your employment">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item" id="secondarycontactMobile" runat="server" style="display:none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-secondarycontactMobile">
                                        <div class="form-row">
                                            <label id="labelsecondarycontactMobile" runat="server" for="secondarycontactMobile" class="col-md-3 col-form-label form-label">Mobile/Cellular Number of Contact who can verify your qualification </label>
                                            <div class="col-md-6">
                                                <input id="txtsecondarycontactMobile" runat="server" type="text" class="form-control" placeholder="Mobile no of Contact who can verify">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item" id="secondarygrade" runat="server" style="display:none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-highschoolYear">
                                        <div class="form-row">
                                            <input type="button" runat="server" class="btn btn-success" id="btn12th" value="Add Subject and their Grades" />
                                        </div>
                                        <div class="form-row">
                                            <div class="col-md-9">
                                                <div style="margin-top: 10px;" class="table-responsive" data-toggle="lists" data-lists-values='["name"]'>
                                                    <asp:GridView ID="grdSecondary" DataKeyNames="applicantgradeid" runat="server" CssClass="table" AutoGenerateColumns="false" OnDataBound="grdSecondary_DataBound" OnRowDeleted="grdSecondary_RowDeleted" OnRowDeleting="grdSecondary_RowDeleting">
                                                        <Columns>
                                                            <asp:TemplateField ItemStyle-Width="30px" HeaderText="Course Name">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lbldesignation" runat="server"
                                                                        Text='<%#Eval("courseid.ClientID%>")%>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField ItemStyle-Width="30px" HeaderText="Subject">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblorganization" runat="server"
                                                                        Text='<%#Eval("subject.ClientID%>")%>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField ItemStyle-Width="30px" HeaderText="Grade Type">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblcontactpersonwithdetails" runat="server"
                                                                        Text='<%#Eval("gradetype.ClientID%>")%>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField ItemStyle-Width="30px" HeaderText="Grade ">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblcontactpersonwithdetails" runat="server"
                                                                        Text='<%#Eval("studentgrade.ClientID%>")%>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                            <asp:CommandField HeaderText="Delete" ShowDeleteButton="True" ShowHeader="True" />
                                                        </Columns>
                                                    </asp:GridView>

                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <!----Secondary END------>
                            <!----Higher Education Start------>
                            <div id="HigherSectionSection">
                                <div class="list-group-item" id="higher" runat="server" style="display:none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-higher">
                                        <div class="form-row">
                                            <label id="labelhigher" runat="server" for="higher" class="col-md-3 col-form-label form-label">
                                                Have you completed any Higher (Under Graduate, Masters or PhD) degree? 
?</label>
                                            <div class="col-md-9">
                                                <asp:RadioButton CssClass="form-control" ID="rblhigherYes" runat="server" GroupName="higher" Text="Yes" />
                                                <asp:RadioButton CssClass="form-control" ID="rblhigherNot" runat="server" GroupName="higher" Text=" I am currently studying for my higher qualification" />
                                                <asp:RadioButton CssClass="form-control" ID="rblhigherNo" runat="server" GroupName="higher" Text="No- I do not have a higher qualification " />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item" id="highercourse" runat="server" style="display:none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-highercourse">
                                        <div class="form-row">
                                            <label id="labelhighercourse" runat="server" for="highercourse" class="col-md-3 col-form-label form-label">Higher Course</label>
                                            <div class="col-md-6">
                                                <asp:DropDownList ID="ddlCourse" runat="server" CssClass="form-control">
                                                    <asp:ListItem Value="" Selected="True">Select Course</asp:ListItem>
                                                    <asp:ListItem Value="UG">Under Graduate</asp:ListItem>
                                                    <asp:ListItem Value="PG">Post Graduate</asp:ListItem>
                                                    <asp:ListItem Value="Phd">PhD</asp:ListItem>
                                                    <asp:ListItem Value="Other">Other</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item" id="higherCountry" runat="server" style="display:none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-higherCountry">
                                        <div class="form-row">
                                            <label id="labelhigherCountry" runat="server" for="higherCountry" class="col-md-3 col-form-label form-label">Country of Higher Education</label>
                                            <div class="col-md-6">
                                                <asp:DropDownList ID="ddlHigherCountry" CssClass="form-control" runat="server">
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
                                <div class="list-group-item" id="higherstartDate" runat="server" style="display:none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-highschoolstartDate">
                                        <div class="form-row">
                                            <label id="labelhigherstartDate" runat="server" for="highschoolstartDate" class="col-md-3 col-form-label form-label">Start Date </label>
                                            <div class="col-md-6">
                                                <input id="txtHigherStartDate" runat="server" type="text" class="form-control" placeholder="" data-toggle="flatpickr" value="today">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item" id="higherendDate" runat="server" style="display:none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-higherendDate">
                                        <div class="form-row">
                                            <label id="labelhigherendDate" runat="server" for="higherendDate" class="col-md-3 col-form-label form-label">End Date </label>
                                            <div class="col-md-6">
                                                <input id="txtHigherEndDate" runat="server" type="text" class="form-control" placeholder="" data-toggle="flatpickr" value="today">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item" id="higherschoolName" runat="server" style="display:none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-higherschoolName">
                                        <div class="form-row">
                                            <label id="labelhigherschoolName" runat="server" for="higherschoolName" class="col-md-3 col-form-label form-label">Name of School</label>
                                            <div class="col-md-6">
                                                <input id="txtHigherschoolName" runat="server" type="text" class="form-control" placeholder="Name of School

">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item" id="higherQualificationtype" runat="server" style="display:none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-higherQualificationtype">
                                        <div class="form-row">
                                            <label id="labelhigherQualificationtype" runat="server" for="higherQualificationtype" class="col-md-3 col-form-label form-label">Qualification Type</label>
                                            <div class="col-md-6">
                                                <input id="txtHigherQualificationtype" runat="server" type="text" placeholder="Qualification Type

"
                                                    value="" class="form-control">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item" id="higherstudymode" runat="server" style="display:none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-higherstudymode">
                                        <div class="form-row">
                                            <label id="labelhigherstudymode" runat="server" for="higherstudymode" class="col-md-3 col-form-label form-label">Mode of study</label>
                                            <div class="col-md-6">
                                                <asp:DropDownList ID="ddlHigherStudyMode" runat="server" CssClass="form-control"></asp:DropDownList>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item" id="higherlanguage" runat="server" style="display:none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-higherlanguage">
                                        <div class="form-row">
                                            <label id="labelhigherlanguage" runat="server" for="higherlanguage" class="col-md-3 col-form-label form-label">Language (Medium) of Study</label>
                                            <div class="col-md-6">
                                                <asp:DropDownList ID="ddlHigherMedium" runat="server" CssClass="form-control"></asp:DropDownList>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item" id="highergradetype" runat="server">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-highergradetype">
                                        <div class="form-row">
                                            <label id="labelhighergradetype" runat="server" for="highergradetype" class="col-md-3 col-form-label form-label">Grade Type</label>
                                            <div class="col-md-6">
                                                <asp:DropDownList ID="ddlHigherGrade" runat="server" CssClass="form-control"></asp:DropDownList>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item" id="highergradeachieved" runat="server" style="display:none" >
                                    <div class="form-group m-0" role="group" aria-labelledby="label-highergradeachieved">
                                        <div class="form-row">
                                            <label id="labelhighergradeachieved" runat="server" for="highergradeachieved" class="col-md-3 col-form-label form-label">Final Grade Achieved </label>
                                            <div class="col-md-9">
                                                <asp:RadioButton CssClass="form-control" ID="rblhighergradeachievedYes" runat="server" GroupName="highergradeachieved" Text="Results Declared" />
                                                <asp:RadioButton CssClass="form-control" ID="rblhighergradeachievedYet" runat="server" GroupName="highergradeachieved" Text=" Examination not conducted yet" />
                                                <asp:RadioButton CssClass="form-control" ID="rblhighergradeachievedNo" runat="server" GroupName="highergradeachieved" Text="Examination Conducted, but Result not declared" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item" id="ExpectedHigherDategrade" runat="server" style="display:none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-ExpectedHigherDategrade">
                                        <div class="form-row">
                                            <label id="labelExpectedHigherDategrade" runat="server" for="ExpectedHigherDategrade" class="col-md-3 col-form-label form-label">Expected dates when results will be declared </label>
                                            <div class="col-md-6">
                                                <input id="txtExpectedHigherDategrade" runat="server" type="text" class="form-control" placeholder="Test Date" data-toggle="flatpickr" value="today">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item" id="higherverify" runat="server" style="display:none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-higherverify">
                                        <div class="form-row">
                                            <label id="labelhigherverify" runat="server" for="higherverify" class="col-md-3 col-form-label form-label">Name of Contact who can verify this qualification </label>
                                            <div class="col-md-6">
                                                <input id="txtHigherVerification" runat="server" type="text" class="form-control" placeholder="Name of Contact who can verify this qualification">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item" id="higherrelation" runat="server" style="display:none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-higherrelation">
                                        <div class="form-row">
                                            <label id="labelhigherrelation" runat="server" for="highschoolrelation" class="col-md-3 col-form-label form-label">Relationship with the Contact </label>
                                            <div class="col-md-6">
                                                <input id="txtHigherRelation" runat="server" type="text" class="form-control" placeholder="Relationship with the Contact">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item" id="highercontactEmail" runat="server" style="display:none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-highercontactEmail">
                                        <div class="form-row">
                                            <label id="labelhighercontactEmail" runat="server" for="highercontactEmail" class="col-md-3 col-form-label form-label">Email ID of Contact who can verify your qualification  </label>
                                            <div class="col-md-6">
                                                <input id="txtHighercontactEmail" runat="server" type="text" class="form-control" placeholder="Email ID of Contact who can verify your employment">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item" id="highercontactMobile" runat="server" style="display:none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-highercontactMobile">
                                        <div class="form-row">
                                            <label id="labelhighercontactMobile" runat="server" for="highercontactMobile" class="col-md-3 col-form-label form-label">Mobile/Cellular Number who can verify this qualification </label>
                                            <div class="col-md-6">
                                                <input id="txthighercontactMobile" runat="server" type="text" class="form-control" placeholder="Mobile/Cellular Number who can verify this qualification ">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item" id="highergrade" runat="server" style="display:none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-highschoolYear">
                                        <div class="form-row">
                                            <input type="button" runat="server" class="btn btn-success" id="btnhigher" value="Add Subject and their Grades" />
                                        </div>
                                        <div class="form-row">
                                            <div class="col-md-9">
                                                <div style="margin-top: 10px;" class="table-responsive" data-toggle="lists" data-lists-values='["name"]'>
                                                    <asp:GridView ID="grdHigher" DataKeyNames="applicantgradeid" runat="server" CssClass="table" AutoGenerateColumns="false" OnDataBound="grdHigher_DataBound" OnRowDeleted="grdHigher_RowDeleted" OnRowDeleting="grdHigher_RowDeleting">
                                                        <Columns>
                                                            <asp:TemplateField ItemStyle-Width="30px" HeaderText="Course Name">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lbldesignation" runat="server"
                                                                        Text='<%#Eval("courseid.ClientID%>")%>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField ItemStyle-Width="30px" HeaderText="Subject">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblorganization" runat="server"
                                                                        Text='<%#Eval("subject.ClientID%>")%>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField ItemStyle-Width="30px" HeaderText="Grade Type">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblcontactpersonwithdetails" runat="server"
                                                                        Text='<%#Eval("gradetype.ClientID%>")%>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField ItemStyle-Width="30px" HeaderText="Grade ">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblcontactpersonwithdetails" runat="server"
                                                                        Text='<%#Eval("studentgrade.ClientID%>")%>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                            <asp:CommandField HeaderText="Delete" ShowDeleteButton="True" ShowHeader="True" />
                                                        </Columns>
                                                    </asp:GridView>

                                                </div>

                                            </div>
                                        </div>
                                    </div>


                                </div>
                                <div class="list-group-item" id="addanother" runat="server" style="display:none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-highergrade">
                                        <div class="form-row">

                                            <div class="col-md-6">

                                                <asp:Button ID="btnAddanother" runat="server" Text="Add Another Higher Qualification" CssClass="btn btn-success" OnClick="btnAddanother_Click" />
                                            </div>
                                        </div>
                                        <div class="form-row">
                                            <div class="col-md-9">
                                                <div style="margin-top: 10px;" class="table-responsive" data-toggle="lists" data-lists-values='["name"]'>
                                                    <asp:GridView ID="grdHigherCourses" DataKeyNames="applicanthighereducationid" runat="server" CssClass="table" AutoGenerateColumns="false" OnDataBound="grdHigherCourses_DataBound" OnRowDeleted="grdHigherCourses_RowDeleted" OnRowDeleting="grdHigherCourses_RowDeleting" OnRowEditing="grdHigherCourses_RowEditing" OnRowCommand="grdHigherCourses_RowCommand">
                                                        <Columns>
                                                            <asp:TemplateField ItemStyle-Width="30px" HeaderText="id" Visible="false">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblId" runat="server"
                                                                        Text='<%#Eval("applicanthighereducationid.ClientID%>")%>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField ItemStyle-Width="30px" HeaderText="Course Name">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblCourse" runat="server"
                                                                        Text='<%#Eval("coursename.ClientID%>")%>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField ItemStyle-Width="30px" HeaderText="School Name">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblSchool" runat="server"
                                                                        Text='<%#Eval("schoolname.ClientID%>")%>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField ItemStyle-Width="30px" HeaderText="Start Date">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblStart" runat="server"
                                                                        Text='<%#Eval("startdate", "{0:dd/MM/yyyy}.ClientID%>") %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField ItemStyle-Width="30px" HeaderText="End Date ">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblEnd" runat="server"
                                                                        Text='<%#Eval("endate", "{0:dd/MM/yyyy}.ClientID%>")%>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Edit" ShowHeader="False">

                                                                <ItemTemplate>
                                                                    <asp:LinkButton ID="lnkEdit" runat="server" CommandArgument='<%#Eval("applicanthighereducationid.ClientID%>")%>' CommandName="Edit" Text="Edit"></asp:LinkButton>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:CommandField HeaderText="Delete" ShowDeleteButton="True" ShowHeader="True" />
                                                        </Columns>
                                                    </asp:GridView>

                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!----Higher Education END------>
                            <!----Diploma Start------>
                            <div class="list-group-item" id="diploma" runat="server" style="display:none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-diploma">
                                    <div class="form-row">
                                        <label id="labeldiploma" runat="server" for="diploma" class="col-md-3 col-form-label form-label">Have you completed any Diploma or Certificate Programs ?</label>
                                        <div class="col-md-9">
                                            <asp:RadioButton CssClass="form-control" ID="rbldiplomaYes" runat="server" GroupName="diploma" Text="Yes" />
                                            <asp:RadioButton CssClass="form-control" ID="rbldiplomaNo" runat="server" GroupName="diploma" Text="I am currently studying for my Diploma/Certificate" />
                                            <asp:RadioButton CssClass="form-control" ID="rbldiplomaNot" runat="server" GroupName="diploma" Text="No - I do not have a Diploma/Certificate qualification" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="diplomaCountry" runat="server" style="display:none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-diplomaCountry">
                                    <div class="form-row">
                                        <label id="labeldiplomaCountry" runat="server" for="diplomaCountry" class="col-md-3 col-form-label form-label">Country of Diploma or Certificate Programs</label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlDiplomaCountry" runat="server" CssClass="form-control">
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
                            <div class="list-group-item" id="diplomastartDate" runat="server" style="display:none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-diplomastartDate">
                                    <div class="form-row">
                                        <label id="labeldiplomastartDate" runat="server" for="diplomastartDate" class="col-md-3 col-form-label form-label">Start Date </label>
                                        <div class="col-md-6">
                                            <input id="txtDiplomaStartDate" runat="server" type="text" class="form-control" placeholder="Start Date" data-toggle="flatpickr" value="today">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="diplomaendDate" runat="server" style="display:none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-diplomaendDate">
                                    <div class="form-row">
                                        <label id="labeldiplomaendDate" runat="server" for="diplomaendDate" class="col-md-3 col-form-label form-label">End Date </label>
                                        <div class="col-md-6">
                                            <input id="txtDiplomaEndDate" runat="server" type="text" class="form-control" placeholder="End Date" data-toggle="flatpickr" value="today">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="diplomaschoolName" runat="server" style="display:none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-diplomaschoolName">
                                    <div class="form-row">
                                        <label id="labeldiplomaschoolName" runat="server" for="diplomaschoolName" class="col-md-3 col-form-label form-label">Name of School</label>
                                        <div class="col-md-6">
                                            <input id="txtDiplomaschoolName" runat="server" type="text" class="form-control" placeholder="Name of School

">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="diplomaQualificationtype" runat="server" style="display:none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-diplomaQualificationtype">
                                    <div class="form-row">
                                        <label id="labeldiplomaQualificationtype" runat="server" for="diplomaQualificationtype" class="col-md-3 col-form-label form-label">Qualification Type</label>
                                        <div class="col-md-6">
                                            <input id="txtDiplomaQualificationtype" runat="server" type="text" placeholder="Qualification Type

"
                                                value="" class="form-control">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="diplomastudymode" runat="server" style="display:none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-diplomastudymode">
                                    <div class="form-row">
                                        <label id="labeldiplomastudymode" runat="server" for="diplomastudymode" class="col-md-3 col-form-label form-label">Mode of study</label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlDiplomaStudyMode" runat="server" CssClass="form-control"></asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="diplomalanguage" runat="server" style="display:none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-diplomalanguage">
                                    <div class="form-row">
                                        <label id="labeldiplomalanguage" runat="server" for="diplomalanguage" class="col-md-3 col-form-label form-label">Language (Medium) of Study</label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlDiplomaMedium" runat="server" CssClass="form-control"></asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="diplomagradetype" runat="server" style="display:none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-diplomagradetype">
                                    <div class="form-row">
                                        <label id="labeldiplomagradetype" runat="server" for="diplomagradetype" class="col-md-3 col-form-label form-label">Grade Type</label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlDiplomaGrade" runat="server" CssClass="form-control"></asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="diplomagradeachieved" runat="server" style="display:none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-diplomagradeachieved">
                                    <div class="form-row">
                                        <label id="labeldiplomagradeachieved" runat="server" for="diplomagradeachieved" class="col-md-3 col-form-label form-label">Final Grade Achieved </label>
                                        <div class="col-md-9">
                                            <asp:RadioButton CssClass="form-control" ID="rblDiplomaGradeYes" runat="server" GroupName="DiplomaGrade" Text="Results Declared" />
                                            <asp:RadioButton CssClass="form-control" ID="rblDiplomaGradeYet" runat="server" GroupName="DiplomaGrade" Text=" Examination not conducted yet" />
                                            <asp:RadioButton CssClass="form-control" ID="rblDiplomaGradeNot" runat="server" GroupName="DiplomaGrade" Text="Examination Conducted, but Result not declared" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="ExpectedDiplomaDategrade" runat="server" style="display:none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-ExpectedDiplomaDategrade">
                                    <div class="form-row">
                                        <label id="labelExpectedDiplomaDategrade" runat="server" for="ExpectedDiplomaDategrade" class="col-md-3 col-form-label form-label">Expected dates when results will be declared </label>
                                        <div class="col-md-6">
                                            <input id="txtExpectedDiplomaResult" runat="server" type="text" class="form-control" placeholder="Test Date" data-toggle="flatpickr" value="today">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="diplomaverify" runat="server" style="display:none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-diplomaverify">
                                    <div class="form-row">
                                        <label id="labeldiplomaverify" runat="server" for="diplomaverify" class="col-md-3 col-form-label form-label">Name of Contact who can verify this qualification </label>
                                        <div class="col-md-6">
                                            <input id="txtDiplomaVerify" runat="server" type="text" class="form-control" placeholder="Name of Contact who can verify this qualification">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="diplomarelation" runat="server" style="display:none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-diplomarelation">
                                    <div class="form-row">
                                        <label id="labeldiplomarelation" runat="server" for="diplomarelation" class="col-md-3 col-form-label form-label">Relationship with the Contact </label>
                                        <div class="col-md-6">
                                            <input id="txtDiplomaRelation" runat="server" type="text" class="form-control" placeholder="Relationship with the Contact">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="diplomacontactEmail" runat="server" style="display:none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-diplomacontactEmail">
                                    <div class="form-row">
                                        <label id="labeldiplomacontactEmail" runat="server" for="diplomacontactEmail" class="col-md-3 col-form-label form-label">Email ID of Contact who can verify your employment  </label>
                                        <div class="col-md-6">
                                            <input id="txtDiplomacontactEmail" runat="server" type="text" class="form-control" placeholder="Email ID of Contact who can verify your employment">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="diplomacontactMobile" runat="server" style="display:none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-diplomacontactMobile">
                                    <div class="form-row">
                                        <label id="labeldiplomacontactMobile" runat="server" for="diplomacontactMobile" class="col-md-3 col-form-label form-label">Mobile/Cellular Number who can verify this qualification </label>
                                        <div class="col-md-6">
                                            <input id="txtdiplomacontactMobile" runat="server" type="text" class="form-control" placeholder="Mobile/Cellular Number who can verify this qualification ">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="diplomagrade" runat="server" style="display:none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-highschoolYear">
                                    <div class="form-row">
                                        <input type="button" runat="server" class="btn btn-success" id="btndiploma" value="Add Subject and their Grades" />
                                    </div>
                                    <div class="form-row">
                                        <div class="col-md-9">
                                            <div style="margin-top: 10px;" class="table-responsive" data-toggle="lists" data-lists-values='["name"]'>
                                                <asp:GridView ID="grdDiploma" runat="server" DataKeyNames="applicantgradeid" CssClass="table" AutoGenerateColumns="false" OnDataBound="grdDiploma_DataBound" OnRowDeleted="grdDiploma_RowDeleted" OnRowDeleting="grdDiploma_RowDeleting">
                                                    <Columns>
                                                        <asp:TemplateField ItemStyle-Width="30px" HeaderText="Course Name">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lbldesignation" runat="server"
                                                                    Text='<%#Eval("courseid.ClientID%>")%>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField ItemStyle-Width="30px" HeaderText="Subject">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblorganization" runat="server"
                                                                    Text='<%#Eval("subject.ClientID%>")%>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField ItemStyle-Width="30px" HeaderText="Grade Type">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblcontactpersonwithdetails" runat="server"
                                                                    Text='<%#Eval("gradetype.ClientID%>")%>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField ItemStyle-Width="30px" HeaderText="Grade ">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblcontactpersonwithdetails" runat="server"
                                                                    Text='<%#Eval("studentgrade.ClientID%>")%>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>

                                                        <asp:CommandField HeaderText="Delete" ShowDeleteButton="True" ShowHeader="True" />
                                                    </Columns>
                                                </asp:GridView>

                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>




                            <!----Diploma END------>
                            <div class="list-group-item">
                                <div class="form-group m-0" role="group" aria-labelledby="label-employerwebsite">
                                    <div class="form-row">
                                         <a href="applicantlanguage.aspx" class="btn btn-success" style="margin-right: 10px;">English Language Competency</a>
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
    <script>
        $(document).ready(function () {
             $(".form-control")
                .mouseover(function () {
                    var controlId = $(this).attr('id');
                    var title = $(this).attr('title');
                    $("#tooltip").text(title);
                });
            var input = document.querySelector("#<%=txtMobilehighSchool.ClientID%>");
            window.intlTelInput(input, {
                utilsScript: "/assets/js/utils.js?1551697588835" // just for formatting/placeholders etc
            });
            var input = document.querySelector("#<%=txtsecondarycontactMobile.ClientID%>");
            window.intlTelInput(input, {
                utilsScript: "/assets/js/utils.js?1551697588835" // just for formatting/placeholders etc
            });
            var input = document.querySelector("#<%=txthighercontactMobile.ClientID%>");
            window.intlTelInput(input, {
                utilsScript: "/assets/js/utils.js?1551697588835" // just for formatting/placeholders etc
            });
            var input = document.querySelector("#<%=txtdiplomacontactMobile.ClientID%>");
            window.intlTelInput(input, {
                utilsScript: "/assets/js/utils.js?1551697588835" // just for formatting/placeholders etc
            });
            $("#<%=higestEducation.ClientID%>").hide()
            // Attach Button click event listener 
            $("#<%=btn10th.ClientID%>").click(function () {
                var grade = $("#<%=ddlHighSchoolGrade.ClientID%>").val();
                var course = "tenth"
                var w = window.open("/addgrade.aspx?g=" + grade + "&c=" + course, 'popupWindow', 'width = 600, height = 400, scrollbars = yes');

            });
            $("#<%=btn12th.ClientID%>").click(function () {
                var grade = $("#<%=ddlSecondaryGrade.ClientID%>").val();
                var course = "twelth"
                var w = window.open("/addgrade.aspx?g=" + grade + "&c=" + course, 'popupWindow', 'width = 600, height = 400, scrollbars = yes');

            });
            $("#<%=btnhigher.ClientID%>").click(function () {
                var grade = $("#<%=ddlHigherGrade.ClientID%>").val();
                var course = $("#<%=ddlCourse.ClientID%>").val()
                var w = window.open("/addgrade.aspx?g=" + grade + "&c=" + course, 'popupWindow', 'width = 600, height = 400, scrollbars = yes');

            });
            $("#<%=btndiploma.ClientID%>").click(function () {
                var grade = $("#<%=ddlDiplomaGrade.ClientID%>").val();
                var course = "diploma"
                var w = window.open("/addgrade.aspx?g=" + grade + "&c=" + course, 'popupWindow', 'width = 600, height = 400, scrollbars = yes');

            });
            var highschool = $("input[type=radio][name='ctl00$ContentPlaceHolder1$highschool']:checked").val()
            if (highschool == 'rblHighYes') {
                $("#<%=highschoolCountry.ClientID%>").show();
                $("#<%=highschoolstartDate.ClientID%>").show();
                $("#<%=highschoolendDate.ClientID%>").show();
                $("#<%=highschoolstudymode.ClientID%>").show();
                $("#<%=highschoollanguage.ClientID%>").show();
                $("#<%=gradetype.ClientID%>").show();
                $("#<%=highschoolgradeachieved.ClientID%>").show();
                $("#<%=ExpectedHighSchoolDategrade.ClientID%>").hide();
                $("#<%=highschoolverify.ClientID%>").show();
                $("#<%=highschoolrelation.ClientID%>").show();
                $("#<%=highschoolcontactEmail.ClientID%>").show();
                $("#highschoolYear").show();
                $("#<%=highschoolName.ClientID%>").show();
                $("#<%=highschoolQualificationtype.ClientID%>").show();
                $("#<%=higestEducation.ClientID%>").hide();
                $("#<%=highshoolgrade.ClientID%>").show();
                $("#SecondarySection").show();
                $("#<%=highschoolcontactMobile.ClientID%>").show();

                var HighschoolGrade = $("input[type=radio][name='ctl00$ContentPlaceHolder1$HighschoolGrade']:checked").val();
                if (HighschoolGrade == "rblYes.ClientID%>") {
                    $("#<%=ExpectedHighSchoolDategrade.ClientID%>").hide();
                }
                else
                    $("#<%=ExpectedHighSchoolDategrade.ClientID%>").show();
            }
            else if (highschool == 'rblHighNot') {
                $("#<%=highschoolCountry.ClientID%>").show();
                $("#<%=highschoolstartDate.ClientID%>").show();
                $("#<%=highschoolendDate.ClientID%>").show();
                $("#<%=highschoolstudymode.ClientID%>").show();
                $("#<%=highschoollanguage.ClientID%>").show();
                $("#<%=gradetype.ClientID%>").show();
                $("#<%=highschoolgradeachieved.ClientID%>").show();
                $("#<%=ExpectedHighSchoolDategrade.ClientID%>").show();
                $("#<%=highschoolverify.ClientID%>").hide();
                $("#<%=highschoolrelation.ClientID%>").hide();
                $("#<%=highschoolcontactEmail.ClientID%>").hide();
                $("#<%=highschoolcontactMobile.ClientID%>").hide();
                $("#highschoolYear").show();
                $("#<%=highschoolName.ClientID%>").show();
                $("#<%=highschoolQualificationtype.ClientID%>").show();
                $("#<%=higestEducation.ClientID%>").hide();
                $("#SecondarySection").hide();
                $("#<%=highshoolgrade.ClientID%>").hide();

            }
            else {
                $("#<%=highschoolCountry.ClientID%>").hide();
                $("#<%=highschoolstartDate.ClientID%>").hide();
                $("#<%=highschoolendDate.ClientID%>").hide();
                $("#<%=highschoolstudymode.ClientID%>").hide();
                $("#<%=highschoollanguage.ClientID%>").hide();
                $("#<%=gradetype.ClientID%>").hide();
                $("#<%=highschoolcontactMobile.ClientID%>").hide();
                $("#<%=highschoolgradeachieved.ClientID%>").hide();
                $("#<%=ExpectedHighSchoolDategrade.ClientID%>").hide();
                $("#<%=highschoolverify.ClientID%>").hide();
                $("#<%=highschoolrelation.ClientID%>").hide();
                $("#<%=highschoolcontactEmail.ClientID%>").hide();
                $("#highschoolYear").hide();
                $("#<%=highschoolName.ClientID%>").hide();
                $("#<%=highschoolQualificationtype.ClientID%>").hide();
                $("#<%=higestEducation.ClientID%>").hide();
                $("#SecondarySection").hide();
                $("#<%=highshoolgrade.ClientID%>").hide();
                $("#<%=highshoolgrade.ClientID%>").hide();
            }


            var Secondary = $("input[type=radio][name='ctl00$ContentPlaceHolder1$Secondary']:checked").val();
            if (Secondary == 'rblSecondaryYes') {
                $("#<%=SecondaryCountry.ClientID%>").show();
                $("#<%=SecondarystartDate.ClientID%>").show();
                $("#<%=SecondaryendDate.ClientID%>").show();
                $("#<%=Secondarystudymode.ClientID%>").show();
                $("#<%=Secondarylanguage.ClientID%>").show();
                $("#<%=Secondarygradetype.ClientID%>").show();
                $("#<%=Secondarygradeachieved.ClientID%>").show();
                $("#<%=ExpectedSecondaryDategrade.ClientID%>").hide();
                $("#<%=Secondaryverify.ClientID%>").show();
                $("#<%=secondaryschoolrelation.ClientID%>").show();
                $("#<%=secondarygrade.ClientID%>").show();
                $("#<%=SecondaryschoolName.ClientID%>").show();
                $("#<%=SecondaryQualificationtype.ClientID%>").show();
                $("#HigherSectionSection").show();
                $("#<%=secondarycontactEmail.ClientID%>").show();
                $("#<%=higher.ClientID%>").show();
                $("#<%=secondarygrade.ClientID%>").show();
                $("#<%=secondarycontactMobile.ClientID%>").show();

            }
            else if (Secondary == 'rblSecondaryNot') {
                $("#<%=SecondaryCountry.ClientID%>").show();
                $("#<%=SecondarystartDate.ClientID%>").show();
                $("#<%=SecondaryendDate.ClientID%>").show();
                $("#<%=Secondarystudymode.ClientID%>").show();
                $("#<%=Secondarylanguage.ClientID%>").show();
                $("#<%=Secondarygradetype.ClientID%>").show();
                $("#<%=Secondarygradeachieved.ClientID%>").show();
                $("#<%=ExpectedSecondaryDategrade.ClientID%>").hide();
                $("#<%=Secondaryverify.ClientID%>").hide();
                $("#<%=secondaryschoolrelation.ClientID%>").hide();
                $("#<%=secondarygrade.ClientID%>").show();
                $("#<%=SecondaryschoolName.ClientID%>").show();
                $("#<%=SecondaryQualificationtype.ClientID%>").show();
                $("#<%=secondarygrade.ClientID%>").hide();
                $("#<%=secondarycontactEmail.ClientID%>").hide();
                $("#<%=secondarycontactMobile.ClientID%>").hide();
            }
            else {
                $("#<%=higher.ClientID%>").hide();
                $("#<%=SecondaryCountry.ClientID%>").hide();
                $("#<%=SecondarystartDate.ClientID%>").hide();
                $("#<%=SecondaryendDate.ClientID%>").hide();
                $("#<%=Secondarystudymode.ClientID%>").hide();
                $("#<%=Secondarylanguage.ClientID%>").hide();
                $("#<%=Secondarygradetype.ClientID%>").hide();
                $("#<%=Secondarygradeachieved.ClientID%>").hide();
                $("#<%=ExpectedSecondaryDategrade.ClientID%>").hide();
                $("#<%=Secondaryverify.ClientID%>").hide();
                $("#<%=secondaryschoolrelation.ClientID%>").hide();
                $("#<%=secondarygrade.ClientID%>").hide();
                $("#<%=SecondaryschoolName.ClientID%>").hide();
                $("#<%=SecondaryQualificationtype.ClientID%>").hide();
                $("#HigherSectionSection").show();
                $("#<%=secondarycontactEmail.ClientID%>").hide();
                $("#SecondaryEducation").hide();
                $("#<%=secondarygrade.ClientID%>").hide();
                $("#<%=secondarycontactMobile.ClientID%>").hide();
            }

            var Higher = $("input[type=radio][name='ctl00$ContentPlaceHolder1$higher']:checked").val();
            if (Higher == 'rblhigherYes') {
                $("#<%=highercourse.ClientID%>").show();
                $("#<%=higherCountry.ClientID%>").show();
                $("#<%=higherstartDate.ClientID%>").show();
                $("#<%=higherendDate.ClientID%>").show();
                $("#<%=higherschoolName.ClientID%>").show();
                $("#<%=higherQualificationtype.ClientID%>").show();
                $("#<%=higherstudymode.ClientID%>").show();
                $("#<%=higherlanguage.ClientID%>").show();
                $("#<%=highergradetype.ClientID%>").show();
                $("#<%=highergradeachieved.ClientID%>").show();
                $("#<%=ExpectedHigherDategrade.ClientID%>").hide();
                $("#<%=higherverify.ClientID%>").show();
                $("#<%=higherrelation.ClientID%>").show();
                $("#<%=highercontactEmail.ClientID%>").show();
                $("#<%=highergrade.ClientID%>").show();
                $("#<%=addanother.ClientID%>").show();
                $("#<%=highercontactMobile.ClientID%>").show();

            }
            else if (Higher == 'rblhigherNot') {
                $("#<%=highercourse.ClientID%>").show();
                $("#<%=higherCountry.ClientID%>").show();
                $("#<%=higherstartDate.ClientID%>").show();
                $("#<%=higherendDate.ClientID%>").show();
                $("#<%=higherschoolName.ClientID%>").show();
                $("#<%=higherQualificationtype.ClientID%>").show();
                $("#<%=higherstudymode.ClientID%>").show();
                $("#<%=higherlanguage.ClientID%>").show();
                $("#<%=highergradetype.ClientID%>").show();
                $("#<%=highergradeachieved.ClientID%>").show();
                $("#<%=ExpectedHigherDategrade.ClientID%>").show();
                $("#<%=higherverify.ClientID%>").show();
                $("#<%=higherrelation.ClientID%>").show();
                $("#<%=highercontactEmail.ClientID%>").show();
                $("#<%=highergrade.ClientID%>").hide();
                $("#<%=addanother.ClientID%>").hide();
                $("#<%=highercontactMobile.ClientID%>").hide();
                var HigherGrade = $("input[type=radio][name='ctl00$ContentPlaceHolder1$highergradeachieved']:checked").val();
                if (HigherGrade == "rblhighergradeachievedYes") {
                    $("#<%=ExpectedHigherDategrade.ClientID%>").hide();
                }
                else {
                    $("#<%=ExpectedHigherDategrade.ClientID%>").show();
                }
            }
            else {
                $("#<%=highercourse.ClientID%>").hide();
                $("#<%=higherCountry.ClientID%>").hide();
                $("#<%=higherstartDate.ClientID%>").hide();
                $("#<%=higherendDate.ClientID%>").hide();
                $("#<%=higherschoolName.ClientID%>").hide();
                $("#<%=higherQualificationtype.ClientID%>").hide();
                $("#<%=higherstudymode.ClientID%>").hide();
                $("#<%=higherlanguage.ClientID%>").hide();
                $("#<%=highergradetype.ClientID%>").hide();
                $("#<%=highergradeachieved.ClientID%>").hide();
                $("#<%=ExpectedHigherDategrade.ClientID%>").hide();
                $("#<%=higherverify.ClientID%>").hide();
                $("#<%=higherrelation.ClientID%>").hide();
                $("#<%=highercontactEmail.ClientID%>").hide();
                $("#<%=highergrade.ClientID%>").hide();
                $("#<%=addanother.ClientID%>").hide();
                $("#<%=highercontactMobile.ClientID%>").hide();
            }
            var Diploma = $("input[type=radio][name='ctl00$ContentPlaceHolder1$diploma']:checked").val();
            if (Diploma == "rbldiplomaYes") {

                $("#<%=diplomaCountry.ClientID%>").show();
                $("#<%=diplomastartDate.ClientID%>").show();
                $("#<%=diplomaendDate.ClientID%>").show();
                $("#<%=diplomaschoolName.ClientID%>").show();
                $("#<%=diplomaQualificationtype.ClientID%>").show();
                $("#<%=diplomastudymode.ClientID%>").show();
                $("#<%=diplomalanguage.ClientID%>").show();
                $("#<%=diplomagradetype.ClientID%>").show();
                $("#<%=diplomagradeachieved.ClientID%>").show();
                $("#<%=ExpectedDiplomaDategrade.ClientID%>").show();
                $("#<%=diplomaverify.ClientID%>").show();
                $("#<%=diplomarelation.ClientID%>").show();
                $("#<%=diplomacontactEmail.ClientID%>").show();
                $("#<%=diplomagrade.ClientID%>").show();
                $("#<%=diplomacontactMobile.ClientID%>").show();

            }
            else if (Diploma == "higherNot") {
                $("#<%=diplomaCountry.ClientID%>").show();
                $("#<%=diplomastartDate.ClientID%>").show();
                $("#<%=diplomaendDate.ClientID%>").show();
                $("#<%=diplomaschoolName.ClientID%>").show();
                $("#<%=diplomaQualificationtype.ClientID%>").show();
                $("#<%=diplomastudymode.ClientID%>").show();
                $("#<%=diplomalanguage.ClientID%>").show();
                $("#<%=diplomagradetype.ClientID%>").show();
                $("#<%=diplomagradeachieved.ClientID%>").show();
                $("#<%=ExpectedDiplomaDategrade.ClientID%>").show();
                $("#<%=diplomaverify.ClientID%>").show();
                $("#<%=diplomarelation.ClientID%>").show();
                $("#<%=diplomacontactEmail.ClientID%>").show();
                $("#<%=diplomagrade.ClientID%>").hide();
                $("#<%=diplomacontactMobile.ClientID%>").hide();
                var DiplomaGrade = $("input[type=radio][name='ctl00$ContentPlaceHolder1$DiplomaGrade']:checked").val();
                if (DiplomaGrade == "rblDiplomaGradeYes.ClientID%>") {
                    $("#<%=ExpectedDiplomaDategrade.ClientID%>").hide();
                }
                else
                    $("#<%=ExpectedDiplomaDategrade.ClientID%>").show();
            }
            else {
                $("#<%=diplomaCountry.ClientID%>").hide();
                $("#<%=diplomastartDate.ClientID%>").hide();
                $("#<%=diplomaendDate.ClientID%>").hide();
                $("#<%=diplomaschoolName.ClientID%>").hide();
                $("#<%=diplomaQualificationtype.ClientID%>").hide();
                $("#<%=diplomastudymode.ClientID%>").hide();
                $("#<%=diplomalanguage.ClientID%>").hide();
                $("#<%=diplomagradetype.ClientID%>").hide();
                $("#<%=diplomagradeachieved.ClientID%>").hide();
                $("#<%=ExpectedDiplomaDategrade.ClientID%>").hide();
                $("#<%=diplomaverify.ClientID%>").hide();
                $("#<%=diplomarelation.ClientID%>").hide();
                $("#<%=diplomacontactEmail.ClientID%>").hide();
                $("#<%=diplomagrade.ClientID%>").hide();
                $("#<%=diplomacontactMobile.ClientID%>").hide();
            }

            //var SecondaryGrade = $("input[type=radio][name='ctl00$ContentPlaceHolder1$Secondarygradeachieved']:checked.ClientID%>").val();
            //if (SecondaryGrade == "rblSecondarygradeachievedYes.ClientID%>") {
            //    $("#<%=ExpectedSecondaryDategrade.ClientID%>").hide();
            //}
            //else
            //    $("#<%=ExpectedSecondaryDategrade.ClientID%>").show();



        });

        

        //Handle High School
        $(function () {
            $("input[name='ctl00$ContentPlaceHolder1$highschool']").click(function () {
                if ($("#<%=rblHighYes.ClientID%>").is(":checked")) {
                    $("#<%=highschoolCountry.ClientID%>").show();
                    $("#<%=highschoolstartDate.ClientID%>").show();
                    $("#<%=highschoolendDate.ClientID%>").show();
                    $("#<%=highschoolstudymode.ClientID%>").show();
                    $("#<%=highschoollanguage.ClientID%>").show();
                    $("#<%=gradetype.ClientID%>").show();
                    $("#<%=highschoolgradeachieved.ClientID%>").show();
                    $("#<%=ExpectedHighSchoolDategrade.ClientID%>").hide();
                    $("#<%=highschoolverify.ClientID%>").show();
                    $("#<%=highschoolrelation.ClientID%>").show();
                    $("#<%=highschoolcontactEmail.ClientID%>").show();
                    $("#highschoolYear").show();
                    $("#<%=highschoolName.ClientID%>").show();
                    $("#<%=highschoolQualificationtype.ClientID%>").show();
                    $("#<%=higestEducation.ClientID%>").hide();
                    $("#<%=highshoolgrade.ClientID%>").show();
                    $("#<%=highschoolcontactMobile.ClientID%>").show();
                    $("#SecondarySection").show();
                }
                else if ($("#<%=rblHighNot.ClientID%>").is(":checked")) {
                    $("#<%=highschoolCountry.ClientID%>").hide();
                    $("#<%=highschoolstartDate.ClientID%>").hide();
                    $("#<%=highschoolendDate.ClientID%>").hide();
                    $("#<%=highschoolstudymode.ClientID%>").hide();
                    $("#<%=highschoollanguage.ClientID%>").hide();
                    $("#<%=gradetype.ClientID%>").hide();
                    $("#<%=highschoolgradeachieved.ClientID%>").hide();
                    $("#<%=ExpectedHighSchoolDategrade.ClientID%>").hide();
                    $("#<%=highschoolverify.ClientID%>").hide();
                    $("#<%=highschoolrelation.ClientID%>").hide();
                    $("#<%=highschoolcontactEmail.ClientID%>").hide();
                    $("#highschoolYear").hide();
                    $("#<%=highschoolName.ClientID%>").hide();
                    $("#<%=highschoolQualificationtype.ClientID%>").hide();
                    $("#<%=higestEducation.ClientID%>").show();
                    $("#SecondarySection").hide();
                    $("#<%=highshoolgrade.ClientID%>").hide();
                    $("#<%=highschoolcontactMobile.ClientID%>").hide();
                }
                else {
                    $("#<%=highschoolCountry.ClientID%>").show();
                    $("#<%=highschoolstartDate.ClientID%>").show();
                    $("#<%=highschoolendDate.ClientID%>").show();
                    $("#<%=highschoolstudymode.ClientID%>").show();
                    $("#<%=highschoollanguage.ClientID%>").show();
                    $("#<%=gradetype.ClientID%>").show();
                    $("#<%=highschoolgradeachieved.ClientID%>").show();
                    $("#<%=ExpectedHighSchoolDategrade.ClientID%>").show();
                    $("#<%=highschoolverify.ClientID%>").hide();
                    $("#<%=highschoolrelation.ClientID%>").hide();
                    $("#<%=highschoolcontactEmail.ClientID%>").hide();
                    $("#highschoolYear").show();
                    $("#<%=highschoolName.ClientID%>").show();
                    $("#<%=highschoolQualificationtype.ClientID%>").show();
                    $("#<%=higestEducation.ClientID%>").hide();
                    $("#SecondarySection").hide();
                    $("#<%=highshoolgrade.ClientID%>").hide();
                    $("#<%=highschoolcontactMobile.ClientID%>").hide();
                }
            });
        });
        //handle higher secondary
        $(function () {
            $("input[name='ctl00$ContentPlaceHolder1$Secondary']").click(function () {
                if ($("#<%=rblSecondaryYes.ClientID%>").is(":checked")) {
                    $("#<%=SecondaryCountry.ClientID%>").show();
                    $("#<%=SecondarystartDate.ClientID%>").show();
                    $("#<%=SecondaryendDate.ClientID%>").show();
                    $("#<%=Secondarystudymode.ClientID%>").show();
                    $("#<%=Secondarylanguage.ClientID%>").show();
                    $("#<%=Secondarygradetype.ClientID%>").show();
                    $("#<%=Secondarygradeachieved.ClientID%>").show();
                    $("#<%=ExpectedSecondaryDategrade.ClientID%>").hide();
                    $("#<%=Secondaryverify.ClientID%>").show();
                    $("#<%=secondaryschoolrelation.ClientID%>").show();
                    $("#<%=secondarygrade.ClientID%>").show();
                    $("#<%=SecondaryschoolName.ClientID%>").show();
                    $("#<%=SecondaryQualificationtype.ClientID%>").show();
                    $("HigherSectionSection").show();
                    $("#<%=secondarycontactEmail.ClientID%>").show();
                    $("#SecondaryEducation").hide();
                    $("#<%=higher.ClientID%>").show();
                    $("#<%=secondarygrade.ClientID%>").show();
                    $("#<%=secondarycontactMobile.ClientID%>").show();
                }
                else if ($("#<%=rblSecondaryNo.ClientID%>").is(":checked")) {
                    $("#<%=SecondaryCountry.ClientID%>").show();
                    $("#<%=SecondarystartDate.ClientID%>").show();
                    $("#<%=SecondaryendDate.ClientID%>").show();
                    $("#<%=Secondarystudymode.ClientID%>").show();
                    $("#<%=Secondarylanguage.ClientID%>").show();
                    $("#<%=Secondarygradetype.ClientID%>").show();
                    $("#<%=Secondarygradeachieved.ClientID%>").show();
                    $("#<%=ExpectedSecondaryDategrade.ClientID%>").hide();
                    $("#<%=Secondaryverify.ClientID%>").hide();
                    $("#<%=secondaryschoolrelation.ClientID%>").hide();
                    $("#<%=secondarygrade.ClientID%>").show();
                    $("#<%=SecondaryschoolName.ClientID%>").show();
                    $("#<%=SecondaryQualificationtype.ClientID%>").show();
                    $("#<%=secondarygrade.ClientID%>").hide();
                    $("#<%=secondarycontactMobile.ClientID%>").hide();
                }
                else {
                    $("#<%=secondarycontactEmail.ClientID%>").hide();
                    $("#<%=SecondaryCountry.ClientID%>").hide();
                    $("#<%=SecondarystartDate.ClientID%>").hide();
                    $("#<%=SecondaryendDate.ClientID%>").hide();
                    $("#<%=Secondarystudymode.ClientID%>").hide();
                    $("#<%=Secondarylanguage.ClientID%>").hide();
                    $("#<%=Secondarygradetype.ClientID%>").hide();
                    $("#<%=Secondarygradeachieved.ClientID%>").hide();
                    $("#<%=ExpectedSecondaryDategrade.ClientID%>").hide();
                    $("#<%=Secondaryverify.ClientID%>").hide();
                    $("#<%=secondaryschoolrelation.ClientID%>").hide();
                    $("#<%=secondarygrade.ClientID%>").hide();
                    $("#<%=SecondaryschoolName.ClientID%>").hide();
                    $("#<%=SecondaryQualificationtype.ClientID%>").hide();
                    $("#HigherSectionSection").show();
                    $("#<%=secondarycontactEmail.ClientID%>").hide();
                    $("#SecondaryEducation>").hide();
                    $("#<%=secondarygrade.ClientID%>").hide();
                    $("#<%=secondarycontactMobile.ClientID%>").hide();
                }
            });
        });

        $(function () {
            $("input[name='ctl00$ContentPlaceHolder1$higher']").click(function () {
                if ($("#<%=rblhigherYes.ClientID%>").is(":checked")) {
                    $("#<%=highercourse.ClientID%>").show();
                    $("#<%=higherCountry.ClientID%>").show();
                    $("#<%=higherstartDate.ClientID%>").show();
                    $("#<%=higherendDate.ClientID%>").show();
                    $("#<%=higherschoolName.ClientID%>").show();
                    $("#<%=higherQualificationtype.ClientID%>").show();
                    $("#<%=higherstudymode.ClientID%>").show();
                    $("#<%=higherlanguage.ClientID%>").show();
                    $("#<%=highergradetype.ClientID%>").show();
                    $("#<%=highergradeachieved.ClientID%>").show();
                    $("#<%=ExpectedHigherDategrade.ClientID%>").hide();
                    $("#<%=higherverify.ClientID%>").show();
                    $("#<%=higherrelation.ClientID%>").show();
                    $("#<%=highercontactEmail.ClientID%>").show();
                    $("#<%=highergrade.ClientID%>").show();
                    $("#<%=addanother.ClientID%>").show();
                    $("#<%=highercontactMobile.ClientID%>").show();
                }
                else if ($("#<%=rblhigherNot.ClientID%>").is(":checked")) {
                    $("#<%=highercourse.ClientID%>").show();
                    $("#<%=higherCountry.ClientID%>").show();
                    $("#<%=higherstartDate.ClientID%>").show();
                    $("#<%=higherendDate.ClientID%>").show();
                    $("#<%=higherschoolName.ClientID%>").show();
                    $("#<%=higherQualificationtype.ClientID%>").show();
                    $("#<%=higherstudymode.ClientID%>").show();
                    $("#<%=higherlanguage.ClientID%>").show();
                    $("#<%=highergradetype.ClientID%>").show();
                    $("#<%=highergradeachieved.ClientID%>").show();
                    $("#<%=ExpectedHigherDategrade.ClientID%>").show();
                    $("#<%=higherverify.ClientID%>").show();
                    $("#<%=higherrelation.ClientID%>").show();
                    $("#<%=highercontactEmail.ClientID%>").show();
                    $("#<%=highergrade.ClientID%>").hide();
                    $("#<%=addanother.ClientID%>").hide();
                    $("#<%=highercontactMobile.ClientID%>").hide();
                }
                else {
                    $("#<%=highercourse.ClientID%>").hide();
                    $("#<%=higherCountry.ClientID%>").hide();
                    $("#<%=higherstartDate.ClientID%>").hide();
                    $("#<%=higherendDate.ClientID%>").hide();
                    $("#<%=higherschoolName.ClientID%>").hide();
                    $("#<%=higherQualificationtype.ClientID%>").hide();
                    $("#<%=higherstudymode.ClientID%>").hide();
                    $("#<%=higherlanguage.ClientID%>").hide();
                    $("#<%=highergradetype.ClientID%>").hide();
                    $("#<%=highergradeachieved.ClientID%>").hide();
                    $("#<%=ExpectedHigherDategrade.ClientID%>").hide();
                    $("#<%=higherverify.ClientID%>").hide();
                    $("#<%=higherrelation.ClientID%>").hide();
                    $("#<%=highercontactEmail.ClientID%>").hide();
                    $("#<%=highergrade.ClientID%>").hide();
                    $("#<%=addanother.ClientID%>").hide();
                    $("#<%=highercontactMobile.ClientID%>").hide();
                }
            });
        });
        $(function () {
            $("input[name='ctl00$ContentPlaceHolder1$diploma']").click(function () {
                if ($("#<%=rbldiplomaYes.ClientID%>").is(":checked")) {

                    $("#<%=diplomaCountry.ClientID%>").show();
                    $("#<%=diplomastartDate.ClientID%>").show();
                    $("#<%=diplomaendDate.ClientID%>").show();
                    $("#<%=diplomaschoolName.ClientID%>").show();
                    $("#<%=diplomaQualificationtype.ClientID%>").show();
                    $("#<%=diplomastudymode.ClientID%>").show();
                    $("#<%=diplomalanguage.ClientID%>").show();
                    $("#<%=diplomagradetype.ClientID%>").show();
                    $("#<%=diplomagradeachieved.ClientID%>").show();
                    $("#<%=ExpectedDiplomaDategrade.ClientID%>").show();
                    $("#<%=diplomaverify.ClientID%>").show();
                    $("#<%=diplomarelation.ClientID%>").show();
                    $("#<%=diplomacontactEmail.ClientID%>").show();
                    $("#<%=diplomagrade.ClientID%>").show();
                    $("#<%=diplomacontactMobile.ClientID%>").show();

                }
                else if ($("#<%=rbldiplomaNo.ClientID%>").is(":checked")) {
                    $("#<%=diplomaCountry.ClientID%>").show();
                    $("#<%=diplomastartDate.ClientID%>").show();
                    $("#<%=diplomaendDate.ClientID%>").show();
                    $("#<%=diplomaschoolName.ClientID%>").show();
                    $("#<%=diplomaQualificationtype.ClientID%>").show();
                    $("#<%=diplomastudymode.ClientID%>").show();
                    $("#<%=diplomalanguage.ClientID%>").show();
                    $("#<%=diplomagradetype.ClientID%>").show();
                    $("#<%=diplomagradeachieved.ClientID%>").show();
                    $("#<%=ExpectedDiplomaDategrade.ClientID%>").show();
                    $("#<%=diplomaverify.ClientID%>").show();
                    $("#<%=diplomarelation.ClientID%>").show();
                    $("#<%=diplomacontactEmail.ClientID%>").show();
                    $("#<%=diplomagrade.ClientID%>").hide();
                    $("#<%=diplomacontactMobile.ClientID%>").hide();
                }
                else {
                    $("#<%=diplomaCountry.ClientID%>").hide();
                    $("#<%=diplomastartDate.ClientID%>").hide();
                    $("#<%=diplomaendDate.ClientID%>").hide();
                    $("#<%=diplomaschoolName.ClientID%>").hide();
                    $("#<%=diplomaQualificationtype.ClientID%>").hide();
                    $("#<%=diplomastudymode.ClientID%>").hide();
                    $("#<%=diplomalanguage.ClientID%>").hide();
                    $("#<%=diplomagradetype.ClientID%>").hide();
                    $("#<%=diplomagradeachieved.ClientID%>").hide();
                    $("#<%=ExpectedDiplomaDategrade.ClientID%>").hide();
                    $("#<%=diplomaverify.ClientID%>").hide();
                    $("#<%=diplomarelation.ClientID%>").hide();
                    $("#<%=diplomacontactEmail.ClientID%>").hide();
                    $("#<%=diplomagrade.ClientID%>").hide();
                    $("#<%=diplomacontactMobile.ClientID%>").hide();
                }
            });
        });

        $(function () {
            $("input[name='ctl00$ContentPlaceHolder1$HighschoolGrade']").click(function () {
                if ($("#<%=rblYes.ClientID%>").is(":checked")) {
                    $("#<%=ExpectedHighSchoolDategrade.ClientID%>").hide();
                }
                else {
                    $("#<%=ExpectedHighSchoolDategrade.ClientID%>").show();
                }
            });
        });
        $(function () {
            $("input[name='ctl00$ContentPlaceHolder1$DiplomaGrade']").click(function () {
                if ($("#<%=rblDiplomaGradeYes.ClientID%>").is(":checked")) {
                    $("#<%=ExpectedDiplomaDategrade.ClientID%>").hide();
                }
                else {
                    $("#<%=ExpectedDiplomaDategrade.ClientID%>").show();
                }
            });
        });
        $(function () {
            $("input[name='ctl00$ContentPlaceHolder1$Secondarygradeachieved']").click(function () {
                if ($("#<%=rblSecondarygradeachievedYes.ClientID%>").is(":checked")) {
                    $("#<%=ExpectedSecondaryDategrade.ClientID%>").hide();
                }
                else {
                    $("#<%=ExpectedSecondaryDategrade.ClientID%>").show();
                }
            });
        });
        $(function () {
            $("input[name='ctl00$ContentPlaceHolder1$highergradeachieved']").click(function () {
                if ($("#<%=rblhighergradeachievedYes.ClientID%>").is(":checked")) {
                    $("#<%=ExpectedHigherDategrade.ClientID%>").hide();
                }
                else {
                    $("#<%=ExpectedHigherDategrade.ClientID%>").show();
                }
            });
        });
        $('#ContentPlaceHolder1_txtStartDate').flatpickr({

            dateFormat: 'Y-m-d'
        });
        $('#ContentPlaceHolder1_txtEndDate').flatpickr({

            dateFormat: 'Y-m-d'
        });
        $('#ContentPlaceHolder1_txtExpectedHighSchoolResult').flatpickr({

            dateFormat: 'Y-m-d'
        });
        $('#ContentPlaceHolder1_txtDiplomaStartDate').flatpickr({

            dateFormat: 'Y-m-d'
        });
        $('#ContentPlaceHolder1_txtDiplomaEndDate').flatpickr({

            dateFormat: 'Y-m-d'
        });
        $('#ContentPlaceHolder1_txtExpectedDiplomaResult').flatpickr({

            dateFormat: 'Y-m-d'
        });
        $('#ContentPlaceHolder1_txtSecondaryStartDate').flatpickr({

            dateFormat: 'Y-m-d'
        });
        $('#ContentPlaceHolder1_txtSecondaryEndDate').flatpickr({

            dateFormat: 'Y-m-d'
        });
        $('#ContentPlaceHolder1_txtExpectedSecondaryResult').flatpickr({

            dateFormat: 'Y-m-d'
        });
        $('#ContentPlaceHolder1_txtHigherStartDate').flatpickr({

            dateFormat: 'Y-m-d'
        });
        $('#ContentPlaceHolder1_txtHigherEndDate').flatpickr({

            dateFormat: 'Y-m-d'
        });
        $('#ContentPlaceHolder1_txtExpectedHigherDategrade').flatpickr({

            dateFormat: 'Y-m-d'
        });
        //document.getElementById("ContentPlaceHolder1_dob.ClientID%>").flatpickr({
        //    wrap: true,
        //    weekNumbers: true,
        //    enableTime: true, // enables timepicker default is false    
        //    time_24hr: true, // set to false for AM PM default is false
        //    onChange: function (selectedDates, dateStr, instance) {
        //        console.log("changed.ClientID%>");
        //    }
        //});

        function ConfirmOnDelete(item) {
            if (confirm("Are you sure to delete: " + item + "?.ClientID%>") == true)
                return true;
            else
                return false;
        }

    </script>


</asp:Content>
