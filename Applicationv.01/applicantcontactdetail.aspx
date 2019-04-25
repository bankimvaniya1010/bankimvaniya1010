<%@ Page Language="C#" AutoEventWireup="true" CodeFile="applicantcontactdetail.aspx.cs" Inherits="applicantcontactdetail" MasterPageFile="~/student.master" %>

<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">


    <div class="container-fluid page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">Applicant Contact Details</li>
        </ol>
        <h1 class="h2">Applicant Contact Details</h1>

    </div>
    <div class="page ">
        <div class="container page__container p-0">
            <div class="row m-0">
                <div class="col-lg container-fluid page__container">

                    <div class="card" style="width: 650px;">

                        <div class="list-group list-group-fit" id="email" runat="server" style="display:none">
                            <div class="list-group-item">
                                <div class="form-group m-0" role="group" aria-labelledby="label-email">
                                    <div class="form-row">
                                        <label id="labelemail" runat="server"  for="email" class="col-md-3 col-form-label form-label">Email *</label>
                                        <div class="col-md-6">
                                            <input id="txtEmail" runat="server" type="text" placeholder="email" disabled="disabled" value="" required="" class="form-control">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="mobile" runat="server" style="display:none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-Mobile">
                                    <div class="form-row">
                                        <label id="labelMobile" runat="server" for="Mobile" class="col-md-3 col-form-label form-label">Mobile/Cellular Number *</label>
                                        <div class="col-md-6">
                                            <input id="txtMobile" runat="server" type="tel" placeholder="Mobile/Cellular Number" required="" value="" class="form-control">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="phone" runat="server" style="display:none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-phone">
                                    <div class="form-row">
                                        <label id="labelphone" runat="server" for="phone" class="col-md-3 col-form-label form-label">Home phone</label>
                                        <div class="col-md-6">
                                            <input id="txtHomePhone" runat="server" type="text" class="form-control" placeholder="Home phone">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="skype" runat="server" style="display:none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-skype">
                                    <div class="form-row">
                                        <label id="labelskype" runat="server" for="skype" class="col-md-3 col-form-label form-label">WOULD YOU LIKE TO CONNECT VIA SKYPE</label>
                                        <div class="col-md-6">
                                            <asp:RadioButton ID="rblSkypeYes" runat="server" CssClass="form-control" GroupName="skype" Text="Yes" />
                                            <asp:RadioButton ID="rblSkypeNo" runat="server" CssClass="form-control" GroupName="skype" Text="No" />
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="list-group-item" id="skypeDesc" runat="server" style="display:none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-skypeDesc">
                                    <div class="form-row">
                                        <label id="labelskypeDesc" runat="server" for="skypeDesc" class="col-md-3 col-form-label form-label">Skype ID</label>
                                        <div class="col-md-6">
                                            <asp:TextBox ID="txtSkype" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="whatsapp" runat="server" style="display:none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-whatsapp">
                                    <div class="form-row">
                                        <label id="labelwhatsapp" runat="server" for="whatsapp" class="col-md-3 col-form-label form-label">WOULD YOU LIKE TO CONNECT VIA WHATSAPP </label>
                                        <div class="col-md-6">
                                            <asp:RadioButton ID="rblwhatsappYes" runat="server" CssClass="form-control" GroupName="whatsapp" Text="Yes" />
                                            <asp:RadioButton ID="rblwhatsappDif" runat="server" CssClass="form-control" GroupName="whatsapp" Text="No" />

                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="whatsappHave" runat="server" style="display:none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-whatsappHave">
                                    <div class="form-row">
                                        <label id="labelwhatsappHave" runat="server" for="whatsappHave" class="col-md-3 col-form-label form-label">IS YOUR WHATSAPP NO SAME AS YOUR MOBILE NO </label>
                                        <div class="col-md-6">
                                            <asp:RadioButton ID="rblWhatsupsameYes" runat="server" CssClass="form-control" GroupName="whatsappSame" Text="Yes" />
                                            <asp:RadioButton ID="rblWhatsupsameNo" runat="server" CssClass="form-control" GroupName="whatsappSame" Text="No" />

                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="whatsappDesc" runat="server" style="display:none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-skypeDesc">
                                    <div class="form-row">
                                        <label id="labelwhatsappDesc" runat="server" for="whatsappDesc" class="col-md-3 col-form-label form-label">Whatsapp Number</label>
                                        <div class="col-md-6">
                                            <asp:TextBox ID="txtWhatsappNo" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="postal" runat="server" style="display:none">
                                <div class="form-group m-0" role="postal" aria-labelledby="label-postal">
                                    <div class="form-row">
                                        <label id="labelpostal" runat="server" for="postal" class="col-md-3 col-form-label form-label">Postal Address</label>
                                        <div class="col-md-6">
                                            <input id="txtAddressLine1" runat="server" type="text" placeholder="Address line 1" value="" class="form-control">
                                            <input id="txtAddressLine2" runat="server" type="text" placeholder="Address line 2" value="" class="form-control">
                                            <input id="txtAddressLine3" runat="server" type="text" placeholder="Address line 3" value="" class="form-control">
                                            <input id="txtCity" runat="server" type="text" placeholder="City, Town or Suburb" value="" class="form-control">
                                            <input id="txtState" runat="server" type="text" placeholder="State" value="" class="form-control">
                                            <input id="txtPostal" runat="server" type="text" placeholder="Postal" value="" class="form-control">
                                            <asp:DropDownList ID="ddlpostalCountry" CssClass="form-control" runat="server">
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
                            <div class="list-group-item" id="address" runat="server" style="display:none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-address">
                                    <div class="form-row">
                                        <label id="labeladdress" runat="server" for="address" class="col-md-3 col-form-label form-label">Is your Postal Address same as your current residential address</label>
                                        <div class="col-md-6">
                                            <asp:RadioButton ID="rblAddressYes" runat="server" CssClass="form-control" GroupName="address" Text="Yes" />
                                            <asp:RadioButton ID="rblAddressNo" runat="server" CssClass="form-control" GroupName="address" Text="No" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="residential" runat="server" style="display:none">
                                <div class="form-group m-0" role="Residential" aria-labelledby="label-Residential ">
                                    <div class="form-row">
                                        <label id="labelResidential" runat="server" for="title" class="col-md-3 col-form-label form-label">Current Residential  Address</label>
                                        <div class="col-md-6">

                                            <input id="txtResidentialAddress1" runat="server" type="text" placeholder="Address line 1" value="" class="form-control">
                                            <input id="txtResidentialAddress2" runat="server" type="text" placeholder="Address line 2" value="" class="form-control">
                                            <input id="txtResidentialAddress3" runat="server" type="text" placeholder="Address line 3" value="" class="form-control">
                                            <input id="txtResidentialCity" runat="server" type="text" placeholder="City, Town or Suburb" value="" class="form-control">
                                            <input id="txtResidentialState" runat="server" type="text" placeholder="State" value="" class="form-control">
                                            <input id="txtResidentialpostal" runat="server" type="text" placeholder="Postal code" value="" class="form-control">
                                            <asp:DropDownList ID="ddlResidential" CssClass="form-control" runat="server">
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
                            <div id="guardian" runat="server" visible="false">
                                <div class="form-row" style="margin-left: 25px">
                                    <label id="gurdianmessgae" runat="server" for="gurdian" class="col-md-9 col-form-label form-label">You age today is #Year# Years and #Month# Months. Please provide the name & details of your authorized Guardian</label>

                                </div>
                                <div class="list-group-item" id="guardianname" runat="server" style="display:none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-nomineename">
                                        <div class="form-row">
                                            <label id="labelguardianname" runat="server" for="nomineename" class="col-md-3 col-form-label form-label">GUARDIAN Full Name</label>
                                            <div class="col-md-6">
                                                <input id="txtNomineeName" runat="server" type="text" placeholder="Nominee Full Name" value="" class="form-control">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item" id="guardianrelation" runat="server" style="display:none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-relationnominee">
                                        <div class="form-row">
                                            <label id="labelrelation" runat="server" for="relationnominee" class="col-md-3 col-form-label form-label">Relationship with GUARDIAN</label>
                                            <div class="col-md-6">
                                                <input id="txtRelationNominee" runat="server" type="text" placeholder="Relationship with Nominee" value="" class="form-control">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item" id="guardianemail" runat="server" style="display:none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-emailnominee">
                                        <div class="form-row">
                                            <label id="labelguardianemail" runat="server" for="emailnominee" class="col-md-3 col-form-label form-label">Email of GUARDIAN</label>
                                            <div class="col-md-6">
                                                <input id="txtEmailNominee" runat="server" type="text" class="form-control" placeholder="Email of Nominee">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item" id="guardianmobile" runat="server" style="display:none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-mobilenominee">
                                        <div class="form-row">
                                            <label id="labelguardianmobile" runat="server" for="mobilenominee" class="col-md-3 col-form-label form-label">Mobile/Cellular Number of GUARDIAN</label>
                                            <div class="col-md-6">
                                                <input id="txtMobileNominee" runat="server" type="text" class="form-control" placeholder="Mobile/Cellular Number of Nominee">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="employerwebsite">
                                <div class="form-group m-0" role="group" aria-labelledby="label-employerwebsite">
                                    <div class="form-row">
                                        <a href="knowyourstudent.aspx" class="btn btn-success" style="margin-right: 10px;">Identification Details</a>
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
    </div>


    <div class="container page__container">
        <div class="footer">
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
            var input = document.querySelector("#ContentPlaceHolder1_txtMobile");
            window.intlTelInput(input, {
                utilsScript: "/assets/js/utils.js?1551697588835" // just for formatting/placeholders etc
            });
            var input = document.querySelector("#ContentPlaceHolder1_txtHomePhone");
            window.intlTelInput(input, {
                utilsScript: "/assets/js/utils.js?1551697588835" // just for formatting/placeholders etc
            });
           
            var input = document.querySelector("#ContentPlaceHolder1_txtWhatsappNo");
            window.intlTelInput(input, {
                utilsScript: "/assets/js/utils.js?1551697588835" // just for formatting/placeholders etc
            });
            var skype = $("input[type=radio][name='ctl00$ContentPlaceHolder1$skype']:checked").val()
            if (skype == 'rblSkypeYes') {
                $("#skypeDesc").show();

            } else {
                $("#skypeDesc").hide();

            }
            var whatsup = $("input[type=radio][name='ctl00$ContentPlaceHolder1$whatsappSame']:checked").val()
            if (whatsup == 'rblWhatsupsameNo') {
                $("#whatsappDesc").show();

            } else {
                $("#whatsappDesc").hide();

            }
            var whatsupsame = $("input[type=radio][name='ctl00$ContentPlaceHolder1$whatsapp']:checked").val()
            if (whatsup == 'rblwhatsappYes') {
                $("#whatsappHave").show();

            } else {
                $("#whatsappHave").hide();

            }
             var input = document.querySelector("#ContentPlaceHolder1_txtMobileNominee");
            window.intlTelInput(input, {
                utilsScript: "/assets/js/utils.js?1551697588835" // just for formatting/placeholders etc
            });
        });

        $(function () {
            $("input[name='ctl00$ContentPlaceHolder1$skype']").click(function () {
                if ($("#ContentPlaceHolder1_rblSkypeYes").is(":checked")) {
                    $("#skypeDesc").show();

                } else {
                    $("#skypeDesc").hide();

                }
            });
        });
        $(function () {
            $("input[name='ctl00$ContentPlaceHolder1$whatsappSame']").click(function () {
                if ($("#ContentPlaceHolder1_rblWhatsupsameNo").is(":checked")) {
                    $("#whatsappDesc").show();

                } else {
                    $("#whatsappDesc").hide();

                }
            });
        });
        $(function () {
            $("input[name='ctl00$ContentPlaceHolder1$whatsapp']").click(function () {
                if ($("#ContentPlaceHolder1_rblwhatsappYes").is(":checked")) {
                    $("#whatsappHave").show();

                } else {
                    $("#whatsappHave").hide();

                }
            });
        });

        $(function () {
            $("input[name='ctl00$ContentPlaceHolder1$address']").click(function () {
                if ($("#ContentPlaceHolder1_rblAddressYes").is(":checked")) {
                    $("#ContentPlaceHolder1_txtResidentialAddress1").val($("#ContentPlaceHolder1_txtAddressLine1").val());
                    $("#ContentPlaceHolder1_txtResidentialAddress2").val($("#ContentPlaceHolder1_txtAddressLine2").val());
                    $("#ContentPlaceHolder1_txtResidentialAddress3").val($("#ContentPlaceHolder1_txtAddressLine3").val());
                    $("#ContentPlaceHolder1_txtResidentialCity").val($("#ContentPlaceHolder1_txtCity").val());
                    $("#ContentPlaceHolder1_txtResidentialState").val($("#ContentPlaceHolder1_txtState").val());
                    $("#ContentPlaceHolder1_txtResidentialpostal").val($("#ContentPlaceHolder1_txtpostal").val());
                    $('#ContentPlaceHolder1_ddlResidential option[value="3"]').attr("selected", "selected");
                    var country = $('#ContentPlaceHolder1_ddlpostalCountry').val();
                    $("#ContentPlaceHolder1_ddlResidential").val(country);



                } else {
                    $("#ContentPlaceHolder1_txtResidentialAddress1").val('');
                    $("#ContentPlaceHolder1_txtResidentialAddress2").val('');
                    $("#ContentPlaceHolder1_txtResidentialAddress3").val('');
                    $("#ContentPlaceHolder1_txtResidentialCity").val('');
                    $("#ContentPlaceHolder1_txtResidentialState").val('');
                    $("#ContentPlaceHolder1_txtResidentialpostal").val('');
                    $('#ContentPlaceHolder1_ddlResidential').val('');

                }
            });
        });
        $('#ContentPlaceHolder1_dob').flatpickr({

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
