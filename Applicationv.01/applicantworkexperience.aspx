<%@ Page Language="C#" AutoEventWireup="true" CodeFile="applicantworkexperience.aspx.cs" Inherits="applicantworkexperience" MasterPageFile="~/student.master" %>

<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">


    <div class="container-fluid page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">Work Experience/Employment Details

            </li>
        </ol>
        <h1 class="h2">Work Experience/Employment Details

        </h1>

    </div>
    <div class="page ">
        <div class="container page__container p-0">
            <div class="row m-0">
                <div class="col-lg container-fluid page__container">

                    <div class="card" style="width: 650px;">
                        <div class="list-group list-group-fit">

                            <asp:HiddenField ID="hdnemployer" runat="server" />
                            <asp:HiddenField ID="hdnRow" runat="server" />
                            <div class="list-group-item" id="PreviousEmployment">
                                <div class="form-group m-0" role="group" aria-labelledby="label-PreviousEmployment">
                                    <div class="form-row">



                                        <div class="form-row">

                                            <div class="col-md-9">
                                                <div class="table-responsive" data-toggle="lists" data-lists-values='["name"]'>
                                                    <asp:GridView ID="grdEmployment" DataKeyNames="employerId" runat="server" CssClass="table" AutoGenerateColumns="false" OnDataBound="grdEmployment_DataBound" OnRowDeleting="grdEmployment_RowDeleting" OnRowEditing="grdEmployment_RowEditing" OnRowCommand="grdEmployment_RowCommand">
                                                        <Columns>
                                                            <asp:TemplateField ItemStyle-Width="30px" HeaderText="Designation">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lbldesignation" runat="server"
                                                                        Text='<%#Eval("designation")%>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField ItemStyle-Width="30px" HeaderText="Organization">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblorganization" runat="server"
                                                                        Text='<%#Eval("organization")%>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField ItemStyle-Width="30px" HeaderText="Website">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblcontactpersonwithdetails" runat="server"
                                                                        Text='<%#Eval("website")%>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                            <asp:TemplateField HeaderText="From">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblStart" runat="server" Text='<%#Eval("durationfrom", "{0:dd/MM/yyyy}") %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="To">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lbldurationto" runat="server" Text='<%#Eval("durationto", "{0:dd/MM/yyyy}") %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Edit" ShowHeader="False">

                                                                <ItemTemplate>

                                                                    <asp:LinkButton ID="lnkEdit" runat="server" CausesValidation="False" CommandArgument='<%#Eval("employerId")%>' CommandName="Edit" Text="Edit"></asp:LinkButton>

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
                            <a class="btn btn-success" style="width: 200px" data-toggle="collapse" href="#employment" role="button" aria-expanded="false" aria-controls="employment">Add work experience
                            </a>
                            <div id="employment" class="collapse">
                                <div class="list-group-item" id="employmentInfo" runat="server" style="display: none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-employment">
                                        <div class="form-row">
                                            <label id="labelemployment" runat="server" for="employment" class="col-md-3 col-form-label form-label">Do you wish to record any work experience that may be relevant to the course you are applying for?</label>
                                            <div class="col-md-6">
                                                <asp:RadioButton ID="rblEmploymentYes" runat="server" GroupName="Employment" Text="Yes" />
                                                <asp:RadioButton ID="rblEmploymentNo" runat="server" GroupName="Employment" Text="No" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item" id="employer" runat="server" style="display: none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-employer">
                                        <div class="form-row">
                                            <label id="labelemployer" runat="server" for="employer" class="col-md-3 col-form-label form-label">Name of Organization </label>
                                            <div class="col-md-6">
                                                <input id="txtEmployer" runat="server" type="text" class="form-control" placeholder="Name of Organization 

">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item" id="employerwebsite" runat="server" style="display: none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-employerwebsite">
                                        <div class="form-row">
                                            <label id="labelemployerwebsite" runat="server" for="employerwebsite" class="col-md-3 col-form-label form-label">Website of the Organization</label>
                                            <div class="col-md-6">
                                                <input id="txtemployerwebsite" runat="server" type="text" class="form-control" placeholder="Website" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item" id="employercity" runat="server" style="display: none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-employercity">
                                        <div class="form-row">
                                            <label id="labelemployercity" runat="server" for="employercity" class="col-md-3 col-form-label form-label">City</label>
                                            <div class="col-md-6">
                                                <input id="txtCity" runat="server" type="text" class="form-control" placeholder="City ">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item" id="employercountry" runat="server" style="display: none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-employercountry">
                                        <div class="form-row">
                                            <label id="labelemployercountry" runat="server" for="employercountry" class="col-md-3 col-form-label form-label">Country</label>
                                            <div class="col-md-6">
                                                <asp:DropDownList ID="ddlCountry" runat="server" CssClass="form-control">
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
                                <div class="list-group-item" id="position" runat="server" style="display: none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-position">
                                        <div class="form-row">
                                            <label id="labelposition" runat="server" for="position" class="col-md-3 col-form-label form-label">Position/Role in</label>
                                            <div class="col-md-6">
                                                <input id="txtPosition" runat="server" type="text" class="form-control" placeholder="Position/Role in

">
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="list-group-item" id="startdate" runat="server" style="display: none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-startdate">
                                        <div class="form-row">
                                            <label id="labelstartdate" runat="server" for="startdate" class="col-md-3 col-form-label form-label">Start Date</label>
                                            <div class="col-md-6">
                                                <input id="txtStartDate" runat="server" type="text" class="form-control" placeholder="End Date" data-toggle="flatpickr" value="today">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item" id="endate" runat="server" style="display: none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-endate">
                                        <div class="form-row">
                                            <label id="labelendate" runat="server" for="endate" class="col-md-3 col-form-label form-label">End Date</label>
                                            <div class="col-md-6">
                                                <input id="txtEndate" runat="server" type="text" class="form-control" placeholder="End Date" data-toggle="flatpickr" value="today">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item" id="briefDescription" runat="server" style="display: none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-briefDescription">
                                        <div class="form-row">
                                            <label id="labelbriefDescription" runat="server" for="briefDescription" class="col-md-3 col-form-label form-label">Brief Description of what you did</label>
                                            <div class="col-md-6">
                                                <input id="txtbriefDescription" runat="server" type="text" class="form-control" placeholder="Brief Description of what you did

">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item" id="reportingmanger" runat="server" style="display: none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-reportingmanger">
                                        <div class="form-row">
                                            <label id="labelreportingmanger" runat="server" for="reportingmanger" class="col-md-3 col-form-label form-label">Name of your reporting Manager</label>
                                            <div class="col-md-6">
                                                <input id="txtreportingmanger" runat="server" type="text" class="form-control" placeholder="Name of your reporting Manager

">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item" id="employmentverification" runat="server" style="display: none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-employmentverification">
                                        <div class="form-row">
                                            <label id="labelemploymentverification" runat="server" for="employmentverification" class="col-md-3 col-form-label form-label">Name of Contact who can verify your employment </label>
                                            <div class="col-md-6">
                                                <input id="txtemploymentverification" runat="server" type="text" class="form-control" placeholder="Name of Contact who can verify your employment 

">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item" id="relationship" runat="server" style="display: none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-relationship">
                                        <div class="form-row">
                                            <label id="labelrelationship" runat="server" for="relationship" class="col-md-3 col-form-label form-label">Relationship with the Contact  </label>
                                            <div class="col-md-6">
                                                <input id="txtrelationship" runat="server" type="text" class="form-control" placeholder="Relationship with the Contact

">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item" id="email" runat="server" style="display: none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-email">
                                        <div class="form-row">
                                            <label id="labelemail" runat="server" for="email" class="col-md-3 col-form-label form-label">Email ID of Contact who can verify your employment  </label>
                                            <div class="col-md-6">
                                                <input id="txtEmail" runat="server" type="text" class="form-control" placeholder="Email ID of Contact who can verify your employment

">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item" id="linkedin" runat="server" style="display: none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-linkedin">
                                        <div class="form-row">
                                            <label id="labellinkedin" runat="server" for="linkedin" class="col-md-3 col-form-label form-label">LinkedIn Profile Link of the contact  </label>
                                            <div class="col-md-6">
                                                <input id="txtlinkedin" runat="server" type="text" class="form-control" placeholder="LinkedIn Profile Link of the contact

">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-employerwebsite">
                                        <div class="form-row">
                                            <a href="applicantsocial.aspx" class="btn btn-success" style="margin-right: 10px;">Social</a>
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

            var emp = $("#<%=hdnemployer.ClientID%>").val()
            if (emp != '') {
                $("#position").show();
                $("#employer").show();
                $("#startdate").show();
                $("#endate").show();
                $("#briefDescription").show();
                $("#employercity").show();
                $("#employercountry").show();
                $("#reportingmanger").show();
                $("#employmentverification").show();
                $("#relationship").show();
                $("#email").show();
                $("#linkedin").show();
                // $("#PreviousEmployment").show();
                $("#employerwebsite").show();
                $("#employment").show();

            }
            else {
                $("#employerwebsite").hide();
                $("#position").hide();
                $("#employer").hide();
                $("#startdate").hide();
                $("#endate").hide();
                $("#briefDescription").hide();
                $("#employercity").hide();
                $("#employercountry").hide();
                $("#reportingmanger").hide();
                $("#employmentverification").hide();
                $("#relationship").hide();
                $("#email").hide();
                $("#linkedin").hide();
                //$("#PreviousEmployment").hide();
            }

        });

        $(function () {
            $("input[name='ctl00$ContentPlaceHolder1$Employment']").click(function () {
                if ($("#ContentPlaceHolder1_rblEmploymentYes").is(":checked")) {
                    $("#position").show();
                    $("#employer").show();
                    $("#startdate").show();
                    $("#endate").show();
                    $("#briefDescription").show();
                    $("#employercity").show();
                    $("#employercountry").show();
                    $("#reportingmanger").show();
                    $("#employmentverification").show();
                    $("#relationship").show();
                    $("#email").show();
                    $("#linkedin").show();
                    //$("#PreviousEmployment").show();


                } else {
                    $("#position").hide();
                    $("#employer").hide();
                    $("#startdate").hide();
                    $("#endate").hide();
                    $("#briefDescription").hide();
                    $("#employercity").hide();
                    $("#employercountry").hide();
                    $("#reportingmanger").hide();
                    $("#employmentverification").hide();
                    $("#relationship").hide();
                    $("#email").hide();
                    $("#linkedin").hide();
                    // $("#PreviousEmployment").hide();
                    $("#employerwebsite").hide();
                }
            });
        });

        $('#ContentPlaceHolder1_txtStartDate').flatpickr({

            dateFormat: 'Y-m-d'
        });

        $('#ContentPlaceHolder1_txtEndate').flatpickr({

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

        function ConfirmOnDelete(item) {
            if (confirm("Are you sure to delete: " + item + "?") == true)
                return true;
            else
                return false;
        }





//Code E

    </script>

    <style type="text/css">
        .currRow {
            background-color: Gray;
            cursor: pointer;
        }
    </style>
</asp:Content>
