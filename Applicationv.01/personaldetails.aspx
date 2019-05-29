<%@ Page Language="C#" AutoEventWireup="true" CodeFile="personaldetails.aspx.cs" Inherits="personaldetails" MasterPageFile="~/student.master" %>

<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">


    <div class="container-fluid page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">Personal Details</li>
        </ol>
        <h1 class="h2">Personal Details</h1>

    </div>
    <div class="page ">
        <div class="container page__container p-0">
            <div class="row m-0">
                <div class="col-lg container-fluid page__container">

                    <div class="card" style="width: 650px;">
                        <div class="list-group list-group-fit" id="title" runat="server" style="display: none">
                            <div class="list-group-item">
                                <div class="form-group m-0" role="group" aria-labelledby="label-title">
                                    <div class="form-row">
                                        <label runat="server" id="labeltitle" for="title" class="col-md-3 col-form-label form-label">Title</label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlTitle" CssClass="form-control" runat="server">
                                            </asp:DropDownList>
                                            <input style="display: none" id="txtTitle" runat="server" type="text" placeholder="Title" value="" class="form-control">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="firstname" runat="server" style="display: none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-firstname">
                                    <div class="form-row">
                                        <label id="labelfirstname" runat="server" for="firstname" class="col-md-3 col-form-label form-label">First Name *</label>
                                        <div class="col-md-6">
                                            <input id="txtFirstName" runat="server" type="text" placeholder="First name as it appears in your passport

"
                                                value="" class="form-control" required="">
                                            <div class="invalid-feedback">Please provide a valid name.</div>
                                            <div class="valid-feedback">Looks good!</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="lastname" runat="server" style="display: none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-lastname">
                                    <div class="form-row">
                                        <label id="labellastname" runat="server" for="lastname" class="col-md-3 col-form-label form-label">Last Name *</label>
                                        <div class="col-md-6">
                                            <input id="txtLastName" runat="server" type="text" class="form-control" placeholder="Last name as it appears in your passport

"
                                                required="">
                                            <div class="invalid-feedback">Please provide a valid name.</div>
                                            <div class="valid-feedback">Looks good!</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="preferedname" runat="server" style="display: none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-preferreName">
                                    <div class="form-row">
                                        <label id="labelpreferreName" runat="server" for="preferreName" class="col-md-3 col-form-label form-label">Preferred Name</label>
                                        <div class="col-md-6">
                                            <input id="txtPreferedName" runat="server" type="text" class="form-control" placeholder="What name do you want us to use when we are communicating with you?

">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="middlename" runat="server" style="display: none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-middlename">
                                    <div class="form-row">
                                        <label id="labelmiddlename" runat="server" for="middlename" class="col-md-3 col-form-label form-label">Other middle names</label>
                                        <div class="col-md-6">
                                            <input id="txtMiddleName" runat="server" type="text" placeholder="As they appear in your passport

"
                                                value="" class="form-control">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="dob" runat="server" style="display: none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-dob">
                                    <div class="form-row">
                                        <label id="labeldob" runat="server" for="dob" class="col-md-3 col-form-label form-label">Date of birth *</label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlDay" CssClass="form-control" runat="server"></asp:DropDownList>
                                            <asp:DropDownList ID="ddlMonth" CssClass="form-control" OnSelectedIndexChanged="ddlMonth_SelectedIndexChanged" AutoPostBack="true" runat="server"></asp:DropDownList>
                                            <asp:DropDownList ID="ddlYear" CssClass="form-control" OnSelectedIndexChanged="ddlYear_SelectedIndexChanged" AutoPostBack="true" runat="server"></asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="gender" runat="server" style="display: none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-gender">
                                    <div class="form-row">
                                        <label id="labelgender" runat="server" for="gender" class="col-md-3 col-form-label form-label">Gender *</label>
                                        <div class="col-md-6">
                                            <input type="radio" id="rbtnMale" runat="server" name="gender" required>Male</input>
                                            <input type="radio" id="rbtnFemale" runat="server" name="gender" required>Female</input>

                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="nationality" runat="server" style="display: none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-Nationality">
                                    <div class="form-row">
                                        <label id="labelNationality" runat="server" for="Nationality" class="col-md-3 col-form-label form-label">Nationality and citizenship</label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlNationality" CssClass="form-control" runat="server">
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
                            <div class="list-group-item" id="birthcountry" runat="server" style="display: none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-birthcountry">
                                    <div class="form-row">
                                        <label id="labelbirthcountry" runat="server" for="birthcountry" class="col-md-3 col-form-label form-label">Country of birth</label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlBirthCountry" runat="server" CssClass="form-control">
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
                            <div class="list-group-item" id="marital" runat="server" style="display: none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-Marital">
                                    <div class="form-row">
                                        <label id="labelMarital" runat="server" for="Marital" class="col-md-3 col-form-label form-label">Marital Status</label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlMarital" runat="server" CssClass="form-control">
                                                <asp:ListItem Value="" Selected="True">Select Marital Status</asp:ListItem>
                                                <asp:ListItem Value="1">Married</asp:ListItem>
                                                <asp:ListItem Value="2">Widowed</asp:ListItem>
                                                <asp:ListItem Value="3">Separated</asp:ListItem>
                                                <asp:ListItem Value="4">Divorced</asp:ListItem>
                                                <asp:ListItem Value="5">Single</asp:ListItem>

                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="disability" runat="server" style="display: none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-disability">
                                    <div class="form-row">
                                        <label id="labeldisability" runat="server" for="disability" class="col-md-3 col-form-label form-label">Do you have any disability, impairment, or a long term condition</label>
                                        <div class="col-md-6">
                                            <asp:RadioButton ID="rblDisabilityYes" runat="server" CssClass="form-control" GroupName="disability" Text="Yes" />
                                            <asp:RadioButton ID="rblDisabilityNo" runat="server" CssClass="form-control" GroupName="disability" Text="No" />
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="list-group-item" id="disabilitydesc" runat="server" style="display: none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-disabilitydesc">
                                    <div class="form-row">
                                        <label id="labeldisabilitydesc" runat="server" for="disabilitydesc" class="col-md-3 col-form-label form-label">Disability Description</label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlDisability" runat="server" CssClass="form-control"></asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="agent" runat="server" style="display: none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-agent">
                                    <div class="form-row">
                                        <label id="labelagent" runat="server" for="agent" class="col-md-3 col-form-label form-label">Are you reffered by Agent</label>
                                        <div class="col-md-6">
                                            <asp:RadioButton ID="rblAgentYes" runat="server" CssClass="form-control" GroupName="agent" Text="Yes" />
                                            <asp:RadioButton ID="rblAgentNo" runat="server" CssClass="form-control" GroupName="agent" Text="No" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="agentList" runat="server" style="display: none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-agentList">
                                    <div class="form-row">
                                        <label id="labelagentList" runat="server" for="agentList" class="col-md-3 col-form-label form-label">Agent Name</label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlAgent" runat="server" CssClass="form-control"></asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="addnewagent" runat="server" style="display: none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-addnewagent">
                                    <div class="form-row">
                                        <label id="labeladdnewagent" runat="server" for="addnewagent" class="col-md-3 col-form-label form-label">If didn't find agent name in the list then add his email ID to sent registeration link</label>
                                        <div class="col-md-6">
                                            <asp:TextBox ID="txtAgentname" runat="server" CssClass="form-control"></asp:TextBox>
                                            &nbsp;
                                              <div class="col-md-6">
                                                  <asp:Button ID="btnNewAgent" runat="server" Text="Ask to Register" CssClass="btn btn-success" OnClick="btnNewAgent_Click" />
                                              </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="employerwebsite">
                                <div class="form-group m-0" role="group" aria-labelledby="label-employerwebsite">
                                    <div class="form-row">
                                        <a href="applicantcontactdetail.aspx" class="btn btn-success" style="margin-right: 10px;">Contact Details</a>
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
            $('#ContentPlaceHolder1_ddlTitle').change(function () {
                if ($(this).val() == '7') {
                    $('#ContentPlaceHolder1_txtTitle').css({ 'display': 'block' });
                }
                else { $('#ContentPlaceHolder1_txtTitle').css({ 'display': 'none' }); }
                if (($(this).val() == '2') || ($(this).val() == '3') || ($(this).val() == '4')) {
                    $('#ContentPlaceHolder1_rbtnFemale').prop("checked", true);
                }
                else { $('#ContentPlaceHolder1_rbtnMale').prop("checked", true); }
            });
            var Disability = $("input[type=radio][name='ctl00$ContentPlaceHolder1$disability']:checked").val();
            if (Disability == 'rblDisabilityYes') {
                $("#disabilitydesc").show();
            } else { $("#disabilitydesc").hide(); }

            var agent = $("input[type=radio][name='ctl00$ContentPlaceHolder1$agent']:checked").val();
            if (agent == 'rblAgentYes') {
                $("#agentList").show(); $("#addnewagent").show();
            } else { $("#agentList").hide(); $("#addnewagent").hide(); }

            var i = 0;
            $(".form-control")
                .mouseover(function () {
                    var controlId = $(this).attr('id');
                    var title = $(this).attr('title');
                    $("#tooltip").text(title);
                });



        });

        $(function () {
            $("input[name='ctl00$ContentPlaceHolder1$disability']").click(function () {
                if ($("#ContentPlaceHolder1_rblDisabilityYes").is(":checked")) {
                    $("#disabilitydesc").show();

                } else {
                    $("#disabilitydesc").hide();

                }
            });
        });
        $(function () {
            $("input[name='ctl00$ContentPlaceHolder1$agent']").click(function () {
                if ($("#ContentPlaceHolder1_rblAgentYes").is(":checked")) {
                    $("#ContentPlaceHolder1_agentList").show();
                    $("#ContentPlaceHolder1_addnewagent").show();

                } else {
                    $("#ContentPlaceHolder1_agentList").hide();
                    $("#ContentPlaceHolder1_addnewagent").hide();
                }
            });
        });
        //$('#ContentPlaceHolder1_txtCourseStartDate').flatpickr({

        //    dateFormat: 'Y-m-d'
        //});

        //$('#ContentPlaceHolder1_txtCourseEndate').flatpickr({

        //    dateFormat: 'Y-m-d'
        //});

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

