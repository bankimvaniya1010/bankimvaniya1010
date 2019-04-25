<%@ Page Language="C#" AutoEventWireup="true" CodeFile="applicantcourse.aspx.cs" Inherits="applicantcourse" MasterPageFile="~/student.master" %>

<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">


    <div class="container-fluid page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">YOUR APPLICATION</li>
        </ol>
        <h1 class="h2">YOUR APPLICATION</h1>

    </div>
    <div class="page ">
        <div class="container page__container p-0">
            <div class="row m-0">
                <div class="col-lg container-fluid page__container">

                    <div class="card" style="width: 650px;">
                        <!--- First Preference-->
                        <div class="list-group list-group-fit">
                            <div class="list-group-item">
                                <div class="form-group m-0" role="firstpref" aria-labelledby="label-firstpref">
                                    <div class="form-row">
                                        <label id="label-firstpref" for="firstpref" class="col-md-3 col-form-label form-label">
                                            1st Preference
                                        </label>
                                        <div class="col-md-6">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="list-group-item">
                            <div class="form-group m-0" role="group" aria-labelledby="label-college1">
                                <div class="form-row">
                                    <label id="label-college1" for="college1" class="col-md-3 col-form-label form-label">University College Name</label>
                                    <div class="col-md-6">
                                        <asp:DropDownList ID="ddlCollege1" CssClass="form-control" runat="server">
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="list-group-item" id="location1">
                            <div class="form-group m-0" role="group" aria-labelledby="label-location1">
                                <div class="form-row">
                                    <label id="label-location1" for="location1" class="col-md-3 col-form-label form-label">Select Location of Study</label>
                                    <div class="col-md-6">
                                        <asp:DropDownList ID="ddlCampus1" runat="server" CssClass="form-control"></asp:DropDownList>
                                        <asp:DropDownList ID="ddlCity1" runat="server" CssClass="form-control"></asp:DropDownList>
                                        <asp:DropDownList ID="ddlCountry1" runat="server" CssClass="form-control">
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
                        <div class="list-group-item" id="mode1">
                            <div class="form-group m-0" role="group" aria-labelledby="label-mode1">
                                <div class="form-row">
                                    <label id="label-mode1" for="mode1" class="col-md-3 col-form-label form-label">Select Mode of Study</label>
                                    <div class="col-md-6">
                                        <asp:DropDownList ID="ddlmode1" runat="server" CssClass="form-control"></asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="list-group-item" id="major1">
                            <div class="form-group m-0" role="group" aria-labelledby="label-major1">
                                <div class="form-row">
                                    <label id="label-major1" for="major1" class="col-md-3 col-form-label form-label">Select Major or Discipline</label>
                                    <div class="col-md-6">
                                        <asp:DropDownList ID="ddlMajor1" runat="server" CssClass="form-control"></asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="list-group-item" id="course1">
                            <div class="form-group m-0" role="group" aria-labelledby="label-course1">
                                <div class="form-row">
                                    <label id="label-course1" for="course1" class="col-md-3 col-form-label form-label">Select Course</label>
                                    <div class="col-md-6">
                                        <asp:DropDownList ID="ddlCourse1" runat="server" CssClass="form-control"></asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="list-group-item" id="commencementmonth1">
                            <div class="form-group m-0" role="group" aria-labelledby="label-commencementmonth1">
                                <div class="form-row">
                                    <label id="label-commencementmonth1" for="commencementmonth1" class="col-md-3 col-form-label form-label">Select Commencement Month</label>
                                    <div class="col-md-6">
                                        <asp:DropDownList ID="ddlCommencementmonth1" runat="server" CssClass="form-control"></asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="list-group-item" id="commencementyear1">
                            <div class="form-group m-0" role="group" aria-labelledby="label-commencementyear1">
                                <div class="form-row">
                                    <label id="label-commencementyear1" for="commencementyear1" class="col-md-3 col-form-label form-label">Select Commencement Year</label>
                                    <div class="col-md-6">
                                        <asp:DropDownList ID="ddlCommenceYear1" runat="server" CssClass="form-control"></asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--- End First Preference-->

                        <!---  Second Preference-->
                        <a class="btn btn-success" style="width: 200px" data-toggle="collapse" href="#second" role="button" aria-expanded="false" aria-controls="second">Add Second Preference
                        </a>
                        <div id="second" class="collapse">
                            <div class="list-group list-group-fit" id="secondpref">
                                <div class="list-group-item">
                                    <div class="form-group m-0" role="secondpref" aria-labelledby="label-secondpref">
                                        <div class="form-row">
                                            <label id="label-secondpref" for="secondpref" class="col-md-3 col-form-label form-label">
                                                2nd Preference
                                            </label>
                                            <div class="col-md-6">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="college2">
                                <div class="form-group m-0" role="group" aria-labelledby="label-college2">
                                    <div class="form-row">
                                        <label id="label-college2" for="college2" class="col-md-3 col-form-label form-label">University College Name</label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlCollege2" runat="server" CssClass="form-control">
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="list-group-item" id="location2">
                                <div class="form-group m-0" role="group" aria-labelledby="label-location2">
                                    <div class="form-row">
                                        <label id="label-location2" for="location2" class="col-md-3 col-form-label form-label">Select Location of Study</label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlCampus2" runat="server" CssClass="form-control"></asp:DropDownList>
                                            <asp:DropDownList ID="ddlCity2" runat="server" CssClass="form-control"></asp:DropDownList>
                                            <asp:DropDownList ID="ddlCountry2" runat="server" CssClass="form-control">
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
                            <div class="list-group-item" id="mode2">
                                <div class="form-group m-0" role="group" aria-labelledby="label-mode2">
                                    <div class="form-row">
                                        <label id="label-mode2" for="mode2" class="col-md-3 col-form-label form-label">Select Mode of Study</label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlMode2" CssClass="form-control" runat="server"></asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="major2">
                                <div class="form-group m-0" role="group" aria-labelledby="label-major2">
                                    <div class="form-row">
                                        <label id="label-major2" for="major2" class="col-md-3 col-form-label form-label">Select Major or Discipline</label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlMajor2" CssClass="form-control" runat="server"></asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="course2">
                                <div class="form-group m-0" role="group" aria-labelledby="label-course2">
                                    <div class="form-row">
                                        <label id="label-course2" for="course2" class="col-md-3 col-form-label form-label">Select Course</label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlCourse2" CssClass="form-control" runat="server"></asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="commencementmonth2">
                                <div class="form-group m-0" role="group" aria-labelledby="label-email">
                                    <div class="form-row">
                                        <label id="label-commencementmonth2" for="commencementmonth2" class="col-md-3 col-form-label form-label">Select Commencement Month</label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlCommencementMonth2" CssClass="form-control" runat="server"></asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="commencementyear2">
                                <div class="form-group m-0" role="group" aria-labelledby="label-commencementyear2">
                                    <div class="form-row">
                                        <label id="label-commencementyear2" for="commencementyear2" class="col-md-3 col-form-label form-label">Select Commencement Year</label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlCommencementYear2" CssClass="form-control" runat="server"></asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--- End Second Preference-->

                        <!---  Third Preference-->
                        <a class="btn btn-success" style="width: 200px" data-toggle="collapse" href="#third" role="button" aria-expanded="false" aria-controls="second">Add Third Preference
                        </a>
                        <div id="third" class="collapse">
                            <div class="list-group list-group-fit" id="thirdpref">
                                <div class="list-group-item">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-thirdpref">
                                        <div class="form-row">
                                            <label id="label-thirdpref" for="thirdpref" class="col-md-3 col-form-label form-label">
                                                3rd Preference
                                            </label>
                                            <div class="col-md-6">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="college3">
                                <div class="form-group m-0" role="group" aria-labelledby="label-college3">
                                    <div class="form-row">
                                        <label id="label-college3" for="college3" class="col-md-3 col-form-label form-label">University College Name</label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlCollege3" CssClass="form-control" runat="server">
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="list-group-item" id="location3">
                                <div class="form-group m-0" role="group" aria-labelledby="label-location3">
                                    <div class="form-row">
                                        <label id="label-location3" for="location3" class="col-md-3 col-form-label form-label">Select Location of Study</label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlCampus3" runat="server" CssClass="form-control"></asp:DropDownList>
                                            <asp:DropDownList ID="ddlCity3" runat="server" CssClass="form-control"></asp:DropDownList>
                                            <asp:DropDownList ID="ddlCountry3" runat="server" CssClass="form-control">
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
                            <div class="list-group-item" id="mode3">
                                <div class="form-group m-0" role="group" aria-labelledby="label-mode3">
                                    <div class="form-row">
                                        <label id="label-mode3" for="mode3" class="col-md-3 col-form-label form-label">Select Mode of Study</label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlMode3" CssClass="form-control" runat="server"></asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="major3">
                                <div class="form-group m-0" role="group" aria-labelledby="label-major3">
                                    <div class="form-row">
                                        <label id="label-major3" for="major3" class="col-md-3 col-form-label form-label">Select Major or Discipline</label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlMajor3" CssClass="form-control" runat="server"></asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="course3">
                                <div class="form-group m-0" role="group" aria-labelledby="label-course3">
                                    <div class="form-row">
                                        <label id="label-course3" for="course3" class="col-md-3 col-form-label form-label">Select Course</label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlCourse3" CssClass="form-control" runat="server"></asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="commencementmonth3">
                                <div class="form-group m-0" role="group" aria-labelledby="label-commencementmonth3">
                                    <div class="form-row">
                                        <label id="label-commencementmonth3" for="commencementmonth3" class="col-md-3 col-form-label form-label">Select Commencement Month</label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlCommencementMonth3" CssClass="form-control" runat="server"></asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="commencementyear3">
                                <div class="form-group m-0" role="group" aria-labelledby="label-commencementyear3">
                                    <div class="form-row">
                                        <label id="label-commencementyear3" for="commencementyear3" class="col-md-3 col-form-label form-label">Select Commencement Year</label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlCommencementYear3" CssClass="form-control" runat="server"></asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--- End Third Preference-->
                        <!---  Fourth Preference-->
                        <a class="btn btn-success" style="width: 200px" data-toggle="collapse" href="#four" role="button" aria-expanded="false" aria-controls="second">Add Fourth Preference
                        </a>
                        <div id="four" class="collapse">
                            <div class="list-group list-group-fit" id="fourthPref">
                                <div class="list-group-item">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-fourthPref">
                                        <div class="form-row">
                                            <label id="label-fourthPref" for="fourthPref" class="col-md-3 col-form-label form-label">
                                                4th Preference
                                            </label>
                                            <div class="col-md-6">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="college4">
                                <div class="form-group m-0" role="group" aria-labelledby="label-college4">
                                    <div class="form-row">
                                        <label id="label-college4" for="college4" class="col-md-3 col-form-label form-label">University College Name</label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlCollege4" CssClass="form-control" runat="server">
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="list-group-item" id="location4">
                                <div class="form-group m-0" role="group" aria-labelledby="label-location4">
                                    <div class="form-row">
                                        <label id="label-location4" for="location4" class="col-md-3 col-form-label form-label">Select Location of Study</label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlCampus4" CssClass="form-control" runat="server"></asp:DropDownList>
                                            <asp:DropDownList ID="ddlCity4" CssClass="form-control" runat="server"></asp:DropDownList>
                                            <asp:DropDownList ID="ddlCountry4" CssClass="form-control" runat="server">
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
                            <div class="list-group-item" id="mode4">
                                <div class="form-group m-0" role="group" aria-labelledby="label-mode4">
                                    <div class="form-row">
                                        <label id="label-mode4" for="mode4" class="col-md-3 col-form-label form-label">Select Mode of Study</label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlMode4" CssClass="form-control" runat="server"></asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="major4">
                                <div class="form-group m-0" role="group" aria-labelledby="label-major4">
                                    <div class="form-row">
                                        <label id="label-major4" for="major4" class="col-md-3 col-form-label form-label">Select Major or Discipline</label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlMajor4" CssClass="form-control" runat="server"></asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="course4">
                                <div class="form-group m-0" role="group" aria-labelledby="label-course4">
                                    <div class="form-row">
                                        <label id="label-course4" for="course4" class="col-md-3 col-form-label form-label">Select Course</label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlCourse4" CssClass="form-control" runat="server"></asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="commencementmonth4">
                                <div class="form-group m-0" role="group" aria-labelledby="label-commencementmonth4">
                                    <div class="form-row">
                                        <label id="label-commencementmonth4" for="commencementmonth4" class="col-md-3 col-form-label form-label">Select Commencement Month</label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlCommencementMonth4" CssClass="form-control" runat="server"></asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="commencementyear4">
                                <div class="form-group m-0" role="group" aria-labelledby="label-commencementyear4">
                                    <div class="form-row">
                                        <label id="label-commencementyear4" for="commencementyear4" class="col-md-3 col-form-label form-label">Select Commencement Year</label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlCommencementyear4" CssClass="form-control" runat="server"></asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--- End Fourth Preference-->

                        <!---  Fifth Preference-->
                        <a class="btn btn-success" style="width: 200px" data-toggle="collapse" href="#five" role="button" aria-expanded="false" aria-controls="second">Add Fifth Preference
                        </a>
                        <div id="five" class="collapse">
                            <div class="list-group list-group-fit" id="fifthpref">
                                <div class="list-group-item">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-fifthpref">
                                        <div class="form-row">
                                            <label id="label-fifthpref" for="fifthpref" class="col-md-3 col-form-label form-label">
                                                5th Preference
                                            </label>
                                            <div class="col-md-6">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="college5">
                                <div class="form-group m-0" role="group" aria-labelledby="label-college5">
                                    <div class="form-row">
                                        <label id="label-college5" for="college5" class="col-md-3 col-form-label form-label">University College Name</label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlCollege5" CssClass="form-control" runat="server">
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="list-group-item" id="location5">
                                <div class="form-group m-0" role="group" aria-labelledby="label-location5">
                                    <div class="form-row">
                                        <label id="label-location5" for="location5" class="col-md-3 col-form-label form-label">Select Location of Study</label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlCampus5" CssClass="form-control" runat="server"></asp:DropDownList>
                                            <asp:DropDownList ID="ddlCity5" CssClass="form-control" runat="server"></asp:DropDownList>
                                            <asp:DropDownList ID="ddlCountry5" CssClass="form-control" runat="server">
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
                            <div class="list-group-item" id="mode5">
                                <div class="form-group m-0" role="group" aria-labelledby="label-mode5">
                                    <div class="form-row">
                                        <label id="label-mode5" for="mode5" class="col-md-3 col-form-label form-label">Select Mode of Study</label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlMode5" CssClass="form-control" runat="server"></asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="major5">
                                <div class="form-group m-0" role="group" aria-labelledby="label-major2">
                                    <div class="form-row">
                                        <label id="label-major5" for="major5" class="col-md-3 col-form-label form-label">Select Major or Discipline</label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlMajor5" CssClass="form-control" runat="server"></asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="course5">
                                <div class="form-group m-0" role="group" aria-labelledby="label-course5">
                                    <div class="form-row">
                                        <label id="label-course5" for="course5" class="col-md-3 col-form-label form-label">Select Course</label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlCourse5" CssClass="form-control" runat="server"></asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="commencementmonth5">
                                <div class="form-group m-0" role="group" aria-labelledby="label-email">
                                    <div class="form-row">
                                        <label id="label-commencementmonth5" for="commencementmonth5" class="col-md-3 col-form-label form-label">Select Commencement Month</label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlCommencementMonth5" CssClass="form-control" runat="server"></asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="commencementyear5">
                                <div class="form-group m-0" role="group" aria-labelledby="label-commencementyear5">
                                    <div class="form-row">
                                        <label id="label-commencementyear5" for="commencementyear5" class="col-md-3 col-form-label form-label">Select Commencement Year</label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlCommencementYear5" CssClass="form-control" runat="server"></asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--- End Fifth Preference-->

                        <div class="list-group-item">
                            <div class="form-group m-0" role="group" aria-labelledby="label-employerwebsite">
                                <div class="form-row">
                                    <asp:Button ID="btn_login" runat="server" Text="Save Changes" CssClass="btn btn-success" />
                                    <div class="col-md-6">
                                    </div>
                                </div>
                            </div>
                        </div>

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

        $('#ContentPlaceHolder1_dob').flatpickr({

            dateFormat: 'Y-m-d'
        });
        $('#<%=ddlCollege1.ClientID%>').change(function () {
           
        var universityID =  $('#<%=ddlCollege1.ClientID%> option:selected').attr('value')
            $.ajax({
                type: "POST",
                url: "<%=System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString()%>applicantcourse.aspx/GetDropDownDataCampus",
                data:JSON.stringify({university: parseInt(universityID)}),               
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                
                success: function (data) {

                    var jsdata = JSON.parse(data.d);
                    $('#<%=ddlCampus1.ClientID%>').empty();
                     $('#<%=ddlCampus1.ClientID%>')
                        .append($("<option></option>").val(0).html("Select Campus"));
                    $.each(jsdata, function (key, value) {

                        $('#<%=ddlCampus1.ClientID%>')
                        .append($("<option></option>").val(value.campusid).html(value.campusname));

                    });

                },

                error: function (data) {

                    alert("error found");

                }

            });

        });
 $('#<%=ddlCampus1.ClientID%>').change(function() {
        var campusID =  $('#<%=ddlCampus1.ClientID%> option:selected').attr('value')
            $.ajax({
                type: "POST",
                url: "<%=System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString()%>applicantcourse.aspx/GetDropDownDataCity",
                data:JSON.stringify({campusId: parseInt(campusID)}),               
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                
                success: function (data) {

                    var jsdata = JSON.parse(data.d);
                    $('#<%=ddlCity1.ClientID%>').empty();
                     $('#<%=ddlCity1.ClientID%>')
                        .append($("<option></option>").val(0).html("Select City"));
                    $.each(jsdata, function (key, value) {

                        $('#<%=ddlCity1.ClientID%>')
                        .append($("<option></option>").val(value.universitylocationid).html(value.cityname));

                    });

                },

                error: function (data) {

                    alert("error found");

                }

            });

        });
 $('#<%=ddlCampus1.ClientID%>').change(function() {
        var campusID =  $('#<%=ddlCampus1.ClientID%> option:selected').attr('value')
            $.ajax({
                type: "POST",
                url: "<%=System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString()%>applicantcourse.aspx/GetDropDownDataCity",
                data:JSON.stringify({campusId: parseInt(campusID)}),               
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                
                success: function (data) {

                    var jsdata = JSON.parse(data.d);
                    $('#<%=ddlCountry1.ClientID%>').empty();
                     $('#<%=ddlCountry1.ClientID%>')
                        .append($("<option></option>").val(0).html("Select City"));
                    $.each(jsdata, function (key, value) {

                        $('#<%=ddlCountry1.ClientID%>')
                        .append($("<option></option>").val(value.universitylocationid).html(value.cityname));

                    });

                },

                error: function (data) {

                    alert("error found");

                }

            });

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
