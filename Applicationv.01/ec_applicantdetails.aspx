<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ec_applicantdetails.aspx.cs" Inherits="ec_applicantdetails" MasterPageFile="~/student.master" EnableEventValidation="false"  %>

<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="container-fluid page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">Your Details</li>
        </ol>

    </div>

    <div class="page" style="margin-top: -47px;">
        <div class="container page__container">

            <div class="row">
                <div class="card">
                    <div class="card-body list-group list-group-fit">
                        <p style="padding-left: 21px"><b><span style="font-weight: 600"><%=firstname %></span>, please carefully complete this section. All fields are mandatory and need to be completed. You  will be required to upload your digital photograph (.jpg or .png formats).</b></p>

                        <h5 class="form-control col-md-4 h5ctrl">Personal Details</h5>
                        <div>
                            <div class="list-group-item" id="title" runat="server">
                                <div class="form-group m-0" role="group" aria-labelledby="label-title">
                                    <div class="form-row">
                                        <label runat="server" id="labeltitle" for="title" class="col-md-3 col-form-label form-label">Title*</label>
                                        <div class="col-md-6">
                                            <asp:dropdownlist id="ddlTitle" cssclass="form-control" runat="server">
                                        </asp:dropdownlist>
                                            <span class="helpicon"><i id="icTitle" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                            <input style="display: none" id="txtTitle" runat="server" type="text" autocomplete="off" placeholder="Title" value="" class="form-control">
                                            <span class="helpicon"><i id="icOtherTitle" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="firstname">
                                <div class="form-group m-0" role="group" aria-labelledby="label-firstname">
                                    <div class="form-row">
                                        <label id="labelfirstname" runat="server" for="firstname" class="col-md-3 col-form-label form-label">First Name *</label>
                                        <div class="col-md-6">
                                            <input id="txtFirstName" runat="server" type="text" autocomplete="off" placeholder="Enter your legal first name" value="" class="form-control" required="">
                                            <span class="helpicon"><i id="icfirstname" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>

                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="lastname">
                                <div class="form-group m-0" role="group" aria-labelledby="label-lastname">
                                    <div class="form-row">
                                        <label id="labellastname" runat="server" for="lastname" class="col-md-3 col-form-label form-label">Family Name *</label>
                                        <div class="col-md-6">
                                            <input id="txtLastName" runat="server" type="text" autocomplete="off" class="form-control" placeholder="Enter your legal family name / surname" required="">
                                            <span class="helpicon"><i id="iclastname" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="middlename">
                                <div class="form-group m-0" role="group" aria-labelledby="label-middlename">
                                    <div class="form-row">
                                        <label id="labelmiddlename" runat="server" for="middlename" class="col-md-3 col-form-label form-label">Middle Name(s)</label>
                                        <div class="col-md-6">
                                            <input id="txtMiddleName" runat="server" type="text" autocomplete="off" placeholder="Enter your legal middle name(s)" value="" class="form-control">
                                            <span class="helpicon"><i id="icmiddlename" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="dob">
                                <div class="form-group m-0" role="group" aria-labelledby="label-dob">
                                    <div class="form-row">
                                        <label id="lbldob" runat="server" for="dateofissue" class="col-md-3 col-form-label form-label">Date of Birth * </label>
                                        <div class="col-md-6">
                                            <div runat="server" id="dobDiv">
                                                <asp:dropdownlist id="ddlYear" cssclass="form-control" runat="server">
                                            </asp:dropdownlist>
                                                <asp:dropdownlist id="ddlMonth" cssclass="form-control" runat="server">
                                            </asp:dropdownlist>
                                                <asp:dropdownlist id="ddlDay" cssclass="form-control" runat="server">
                                                <asp:ListItem Value="">Select Day</asp:ListItem>
                                            </asp:dropdownlist>
                                            </div>
                                            <asp:hiddenfield runat="server" id="hidDOBDate" />
                                            <asp:label runat="server" cssclass="form-control" id="lbltxtdob" visible="false"></asp:label>
                                            <%--<input id="txtdob" runat="server" type="text" autocomplete="off" class="form-control" placeholder="Date of Birth" data-toggle="flatpickr" value="">--%>
                                            <span class="helpicon"><i id="icdob" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="gender" runat="server">
                                <div class="form-group m-0" role="group" aria-labelledby="label-gender">
                                    <div class="form-row">
                                        <label id="labelgender" runat="server" for="gender" class="col-md-3 col-form-label form-label">Gender *</label>
                                        <div class="col-md-6">
                                            <asp:dropdownlist runat="server" id="ddlgenderList" cssclass="form-control">
                                        </asp:dropdownlist>
                                            <span class="helpicon"><i id="icGender" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="nationality">
                                <div class="form-group m-0" role="group" aria-labelledby="label-nationality">
                                    <div class="form-row">
                                        <label id="lblnationality" runat="server" for="nationality" class="col-md-3 col-form-label form-label">Country of Citizenship *</label>
                                        <div class="col-md-6">
                                            <asp:dropdownlist id="ddlnationality" cssclass="form-control" runat="server">
                                        </asp:dropdownlist>
                                            <span class="helpicon"><i id="icnationality" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="countryofdob">
                                <div class="form-group m-0" role="group" aria-labelledby="label-countryofdob">
                                    <div class="form-row">
                                        <label id="lblcountryofdob" runat="server" for="countryofdob" class="col-md-3 col-form-label form-label">Country of Birth *</label>
                                        <div class="col-md-6">
                                            <asp:dropdownlist id="ddlcountryofdob" cssclass="form-control" runat="server">
                                        </asp:dropdownlist>
                                            <span class="helpicon"><i id="iccountryofdob" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="maritalstatus">
                                <div class="form-group m-0" role="group" aria-labelledby="label-maritalstatus">
                                    <div class="form-row">
                                        <label id="lblmaritalstatus" runat="server" for="maritalstatus" class="col-md-3 col-form-label form-label">Marital Status *</label>
                                        <div class="col-md-6">
                                            <asp:dropdownlist id="ddlmaritalstatus" cssclass="form-control" runat="server">
                                        </asp:dropdownlist>
                                            <span class="helpicon"><i id="icmaritalstatus" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="disability" runat="server">
                                <div class="form-group m-0" role="group" aria-labelledby="label-disability">
                                    <div class="form-row">
                                        <label id="labeldisability" runat="server" for="disability" class="col-md-3 col-form-label form-label">DO YOU HAVE ANY DISABILITY, IMPAIRMENT OR LONG-TERM CONDITION? *</label>
                                        <div class="col-md-6">
                                            <asp:radiobutton id="rblDisabilityYes" runat="server" cssclass="form-control" groupname="disability" text="Yes" />
                                            <asp:radiobutton id="rblDisabilityNo" runat="server" cssclass="form-control" groupname="disability" text="No" />
                                            <span class="helpicon"><i id="icdisability" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="disabilitydesc" runat="server">
                                <div class="form-group m-0" role="group" aria-labelledby="label-disabilitydesc">
                                    <div class="form-row">
                                        <label id="labeldisabilitydesc" runat="server" for="disabilitydesc" class="col-md-3 col-form-label form-label">Disability Description *</label>
                                        <div class="col-md-6">
                                            <asp:dropdownlist id="ddlDisability" runat="server" cssclass="form-control"></asp:dropdownlist>
                                            <span class="helpicon"><i id="icdisabilitydescription" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <h5 class="form-control col-md-4 h5ctrl">Contact Details</h5>
                        <div>
                            <div class="list-group-item" id="email" runat="server">
                                <div class="form-group m-0" role="group" aria-labelledby="label-email">
                                    <div class="form-row">
                                        <label id="labelemail" runat="server" for="email" class="col-md-3 col-form-label form-label">Email *</label>
                                        <div class="col-md-6">
                                            <input id="txtEmail" runat="server" type="text" autocomplete="off" placeholder="email" value="" required="" class="form-control"><span class="helpicon"><i id="icEmail" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="mobile" runat="server">
                                <div class="form-group m-0" role="group" aria-labelledby="label-Mobile">
                                    <div class="form-row">
                                        <label id="labelMobile" runat="server" for="Mobile" class="col-md-3 col-form-label form-label">Mobile/Cellular Number *</label>
                                        <div class="col-md-2" id="countrycodeDiv" runat="server">
                                            <asp:dropdownlist runat="server" id="ddlcountrycode" cssclass="form-control">
                                        </asp:dropdownlist>
                                        </div>
                                        <div class="col-md-3">
                                            <input id="txtMobile" runat="server" type="text" autocomplete="off" placeholder="Mobile/Cellular Number" value="" class="form-control" maxlength="10"><span class="helpicon"><i id="icMobile" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="whatsapp" runat="server">
                                <div class="form-group m-0" role="group" aria-labelledby="label-whatsapp">
                                    <div class="form-row">
                                        <label id="labelwhatsapp" runat="server" for="whatsapp" class="col-md-3 col-form-label form-label">WOULD YOU LIKE TO CONNECT VIA WHATSAPP? *</label>
                                        <div class="col-md-6">
                                            <asp:radiobutton id="rblwhatsappYes" runat="server" cssclass="form-control" groupname="whatsapp" text="Yes" />
                                            <asp:radiobutton id="rblwhatsappNo" runat="server" cssclass="form-control" groupname="whatsapp" text="No" />
                                            <span class="helpicon"><i id="icWhatsapp" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>

                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="whatsappHave" runat="server">
                                <div class="form-group m-0" role="group" aria-labelledby="label-whatsappHave">
                                    <div class="form-row">
                                        <label id="labelwhatsappHave" runat="server" for="whatsappHave" class="col-md-3 col-form-label form-label">IS YOUR WHATSAPP NUMBER SAME AS YOUR MOBILE NUMBER ABOVE? *</label>
                                        <div class="col-md-6">
                                            <asp:radiobutton id="rblWhatsupsameYes" runat="server" cssclass="form-control" groupname="whatsappSame" text="Yes" />
                                            <asp:radiobutton id="rblWhatsupsameNo" runat="server" cssclass="form-control" groupname="whatsappSame" text="No" />
                                            <span class="helpicon"><i id="icWhatsapphave" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="whatsappDesc" runat="server">
                                <div class="form-group m-0" role="group" aria-labelledby="label-skypeDesc">
                                    <div class="form-row">
                                        <label id="labelwhatsappDesc" runat="server" for="whatsappDesc" class="col-md-3 col-form-label form-label">Whatsapp Number *</label>
                                        <div class="col-md-6">
                                            <asp:textbox id="txtWhatsappNo" runat="server" cssclass="form-control"></asp:textbox>
                                            <span class="helpicon"><i id="icWhatsappDesc" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="postal" runat="server">
                                <div class="form-group m-0" role="postal" aria-labelledby="label-postal">
                                    <div class="form-row">
                                        <label id="labelpostal" runat="server" for="postal" class="col-md-3 col-form-label form-label">Postal Address *</label>
                                        <div class="col-md-6">
                                            <input id="txtAddressLine1" runat="server" type="text" autocomplete="off" placeholder="Address line 1" value="" class="form-control" maxlength="200">
                                            <span class="helpicon"><i id="icPostal" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                            <input id="txtAddressLine2" runat="server" type="text" autocomplete="off" placeholder="Address line 2" value="" class="form-control" maxlength="200">
                                            <input id="txtAddressLine3" runat="server" type="text" autocomplete="off" placeholder="Address line 3" value="" class="form-control" maxlength="200">
                                            <input id="txtCity" runat="server" type="text" autocomplete="off" placeholder="City, Town or Suburb" value="" class="form-control">
                                            <input id="txtState" runat="server" type="text" autocomplete="off" placeholder="State" value="" class="form-control">
                                            <input id="txtPostal" runat="server" type="text" autocomplete="off" placeholder="Postal Code" value="" class="form-control">
                                            <asp:dropdownlist id="ddlpostalCountry" cssclass="form-control" runat="server">
                                        </asp:dropdownlist>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="address" runat="server">
                                <div class="form-group m-0" role="group" aria-labelledby="label-address">
                                    <div class="form-row">
                                        <label id="labeladdress" runat="server" for="address" class="col-md-3 col-form-label form-label">IS YOUR POSTAL ADDRESS THE SAME AS YOUR CURRENT RESIDENTIAL ADDRESS? *</label>
                                        <div class="col-md-6">
                                            <asp:radiobutton id="rblAddressYes" runat="server" cssclass="form-control" groupname="address" text="Yes" />
                                            <asp:radiobutton id="rblAddressNo" runat="server" cssclass="form-control" groupname="address" text="No" />
                                            <span class="helpicon"><i id="icAddress" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="residential" runat="server">
                                <div class="form-group m-0" role="Residential" aria-labelledby="label-Residential ">
                                    <div class="form-row">
                                        <label id="labelResidential" runat="server" for="title" class="col-md-3 col-form-label form-label">Current Residential  Address *</label>
                                        <div class="col-md-6">

                                            <input id="txtResidentialAddress1" runat="server" type="text" autocomplete="off" placeholder="Address line 1" value="" class="form-control" maxlength="200"><span class="helpicon"><i id="icResedentail" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                            <input id="txtResidentialAddress2" runat="server" type="text" autocomplete="off" placeholder="Address line 2" value="" class="form-control" maxlength="200">
                                            <input id="txtResidentialAddress3" runat="server" type="text" autocomplete="off" placeholder="Address line 3" value="" class="form-control" maxlength="200">
                                            <input id="txtResidentialCity" runat="server" type="text" autocomplete="off" placeholder="City, Town or Suburb" value="" class="form-control">
                                            <input id="txtResidentialState" runat="server" type="text" autocomplete="off" placeholder="State" value="" class="form-control">
                                            <input id="txtResidentialpostal" runat="server" type="text" autocomplete="off" placeholder="Postal code" value="" class="form-control">
                                            <asp:dropdownlist id="ddlResidentialCountry" cssclass="form-control" runat="server">
                                        </asp:dropdownlist>

                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="Div6" runat="server">
                                <div class="form-group m-0" role="group" aria-labelledby="label-email">
                                    <div class="form-row">
                                        <label id="label6" runat="server" for="email" class="col-md-3 col-form-label form-label">GUARDIAN / EMERGENCY CONTACT FULL NAME *</label>
                                        <div class="col-md-6">
                                            <input id="txtguardianName" runat="server" type="text" autocomplete="off" placeholder="" value="" required="" class="form-control"><span class="helpicon"><i id="i5" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="Div10" runat="server">
                                <div class="form-group m-0" role="group" aria-labelledby="label-email">
                                    <div class="form-row">
                                        <label id="label9" runat="server" for="" class="col-md-3 col-form-label form-label">RELATIONSHIP WITH GUARDIAN / EMERGENCY CONTACT *</label>
                                        <div class="col-md-6">
                                            <asp:dropdownlist runat="server" id="ddlrelationship_guardian" cssclass="form-control">
                                        </asp:dropdownlist>
                                            <span class="helpicon"><i id="i8" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="Div9" runat="server">
                                <div class="form-group m-0" role="group" aria-labelledby="label-email">
                                    <div class="form-row">
                                        <label id="label8" runat="server" for="email" class="col-md-3 col-form-label form-label">EMAIL OF GUARDIAN / EMERGENCY CONTACT *</label>
                                        <div class="col-md-6">
                                            <input id="txtguardian_email" runat="server" type="text" autocomplete="off" placeholder="email" value="" required="" class="form-control"><span class="helpicon"><i id="i7" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="Div7" runat="server">
                                <div class="form-group m-0" role="group" aria-labelledby="label-Mobile">
                                    <div class="form-row">
                                        <label id="label7" runat="server" for="Mobile" class="col-md-3 col-form-label form-label">MOBILE/CELLULAR NUMBER OF GUARDIAN / EMERGENCY CONTACT *</label>
                                        <div class="col-md-2" id="Div8" runat="server">
                                            <asp:dropdownlist runat="server" id="ddlguardian_countrycode" cssclass="form-control">
                                        </asp:dropdownlist>
                                        </div>
                                        <div class="col-md-3">
                                            <input id="txtguardian_mobileno" runat="server" type="text" autocomplete="off" placeholder="Mobile/Cellular Number" value="" class="form-control" maxlength="10"><span class="helpicon"><i id="i6" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <h5 class="form-control col-md-4 h5ctrl">PHOTO & PROOF OF IDENTITY </h5>
                        <div>
                            <div class="list-group-item" id="alternateIdentitytype" runat="server">
                                <div class="form-group m-0" role="group" aria-labelledby="label-alternateIdentitytype">
                                    <div class="form-row">
                                        <label id="labelalternateIdentitytype" runat="server" for="alternateIdentitytype" class="col-md-3 col-form-label form-label">Select Identity Proof Type *</label>
                                        <div class="col-md-6">
                                            <asp:dropdownlist id="ddlalternateIdentitytype" cssclass="form-control" runat="server">
                                        </asp:dropdownlist>
                                            <span class="helpicon"><i id="icIdentityProofType" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="alternateIdentityNo" runat="server">
                                <div class="form-group m-0" role="group" aria-labelledby="label-alternateIdentityNo">
                                    <div class="form-row">
                                        <label id="labelalternateIdentityNo" runat="server" for="alternateIdentityNo" class="col-md-3 col-form-label form-label">Identity Proof Number *</label>
                                        <div class="col-md-6">
                                            <input id="txtalternateIdentityNo" runat="server" type="text" autocomplete="off" class="form-control" placeholder="Identity Number"><span class="helpicon"><i id="icIdentityProofNo" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="passportcopt">
                                <div class="form-group m-0" role="group" aria-labelledby="label-dob">
                                    <div class="form-row">
                                        <label id="Label12" runat="server" for="dateofissue" class="col-md-3 col-form-label form-label">upload ID copy *</label>
                                        <div class="col-md-6">
                                            <asp:label id="Label13" runat="server" />
                                            <asp:fileupload id="FileUpload_passport" runat="server" /><br/>
                                            <label style="color: black;" id="lbl1" runat="server"><i class="fa fa-info-circle" aria-hidden="true"></i>only accept "jpg","png","jpeg"</label>
                                            <label runat="server" id="Label14" />
                                            <input type="hidden" id="hidPassportDocPath" runat="server" />
                                            <asp:hyperlink runat="server" id="HyperLink1" target="_blank"></asp:hyperlink>
                                            <span class="helpicon"><i id="i15" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="profilepic">
                                <div class="form-group m-0" role="group" aria-labelledby="label-dob">
                                    <div class="form-row">
                                        <label id="Label1" runat="server" for="dateofissue" class="col-md-3 col-form-label form-label">Please upload an electronic photo for your profile picture *</label>
                                        <div class="col-md-6">
                                            <asp:label id="lblupload" runat="server" />
                                            <asp:fileupload id="fileUpload" runat="server" /><br/>
                                            <label style="color: black;" id="lbl2" runat="server"><i class="fa fa-info-circle" aria-hidden="true"></i>only accept "jpg","png","jpeg"</label>
                                            <%--<asp:Button runat="server" ID="testbtn" OnClick="testbtn_Click" Text="save" Visible="false"/>--%>
                                            <label runat="server" id="lbl" />
                                            <input type="hidden" id="hidDocumentPath" runat="server" />
                                            <asp:hyperlink runat="server" id="uploadedFile" target="_blank"></asp:hyperlink>
                                            <span class="helpicon"><i id="icprofilephoto" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <h5 class="form-control col-md-4 h5ctrl">SOCIAL</h5>
                        <div>
                            <div class="list-group-item" id="linkedin" runat="server">
                                <div class="form-group m-0" role="group" aria-labelledby="label-linked">
                                    <div class="form-row">
                                        <label id="labellinked" runat="server" for="linked" class="col-md-3 col-form-label form-label">LINKEDIN PROFILE *</label>
                                        <div class="col-md-6">
                                            <input id="txtLinkedin" runat="server" type="text" autocomplete="off" class="form-control" placeholder="Enter the link to your LinkedIN profile">
                                            <asp:checkbox id="chkLinkeIn" runat="server" text="I DO NOT HAVE A LINKEDIN ACCOUNT." class="form-label" />
                                            <span class="helpicon"><i id="icLinkedin" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="facebook" runat="server">
                                <div class="form-group m-0" role="group" aria-labelledby="label-facebook">
                                    <div class="form-row">
                                        <label id="labelfacebook" runat="server" for="employer" class="col-md-3 col-form-label form-label">FACEBOOK PROFILE *</label>
                                        <div class="col-md-6">
                                            <input id="txtFacebook" runat="server" type="text" autocomplete="off" class="form-control" placeholder="Enter the link to your Facebook profile">
                                            <asp:checkbox id="ChkFacebook" runat="server" text="I DO NOT HAVE A FACEBOOK ACCOUNT." class="form-label" />
                                            <span class="helpicon"><i id="icFacebook" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="twitter" runat="server">
                                <div class="form-group m-0" role="group" aria-labelledby="label-twitter">
                                    <div class="form-row">
                                        <label id="labeltwitter" runat="server" for="twitter" class="col-md-3 col-form-label form-label">TWITTER HANDLE *</label>
                                        <div class="col-md-6">
                                            <input id="txtTwitter" runat="server" type="text" autocomplete="off" class="form-control" placeholder="Enter the link to your Twitter handle">
                                            <asp:checkbox id="chkTwitter" runat="server" text="I DO NOT HAVE A TWITTER ACCOUNT." class="form-label" />
                                            <span class="helpicon"><i id="icTwitter" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <h5 class="form-control col-md-4 h5ctrl">EDUCATIONAL QUALIFICATIONS</h5>
                        <div>
                            <div class="list-group-item" id="highestqualificationAchieved">
                                <div class="form-group m-0" role="group" aria-labelledby="label-highestqualificationAchieved">
                                    <div class="form-row">
                                        <label id="lblhighestqualificationAchieved" runat="server" for="highestqualificationAchieved" class="col-md-3 col-form-label form-label">Level of Highest Academic Qualification Completed *</label>
                                        <div class="col-md-6">
                                            <asp:dropdownlist id="ddlhighestqualificationAchieved" cssclass="form-control" runat="server">
                                        </asp:dropdownlist>
                                            <span class="helpicon"><i id="ichighestqualificationAchieved" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="boradfield">
                                <div class="form-group m-0" role="group" aria-labelledby="label-courseapplied">
                                    <div class="form-row">
                                        <label id="Label2" runat="server" for="boradfield" class="col-md-3 col-form-label form-label">Broad Field of Education of Highest Academic Qualification Completed *</label>
                                        <div class="col-md-6">
                                            <asp:dropdownlist id="ddlboradfield" cssclass="form-control" runat="server">
                                            <asp:ListItem Value="0">Please Select</asp:ListItem>
                                        </asp:dropdownlist>
                                            <asp:hiddenfield runat="server" id="hidbroadfieldId" />

                                            <span class="helpicon"><i id="i1" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="narrowfield">
                                <div class="form-group m-0" role="group" aria-labelledby="label-courseapplied">
                                    <div class="form-row">
                                        <label id="Label3" runat="server" for="narrowfield" class="col-md-3 col-form-label form-label">Narrow Field of Education of Highest Academic Qualification Completed *</label>
                                        <div class="col-md-6">
                                            <asp:dropdownlist id="ddlnarrowfield" cssclass="form-control" runat="server">
                                            <asp:ListItem Value="0">Please Select</asp:ListItem>
                                        </asp:dropdownlist>
                                            <asp:hiddenfield runat="server" id="hidnarrowfieldId" />
                                            <span class="helpicon"><i id="i2" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="detailedfield">
                                <div class="form-group m-0" role="group" aria-labelledby="label-courseapplied">
                                    <div class="form-row">
                                        <label id="Label4" runat="server" for="detailedfield" class="col-md-3 col-form-label form-label">Detailed Field of Education of Highest Academic Qualification Completed *</label>
                                        <div class="col-md-6">
                                            <asp:dropdownlist id="ddldetailedfield" cssclass="form-control" runat="server">
                                            <asp:ListItem Value="0">Please Select</asp:ListItem>
                                        </asp:dropdownlist>
                                            <asp:hiddenfield runat="server" id="hiddetailedfield" />
                                            <span class="helpicon"><i id="i3" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="highestqualificationdate">
                                <div class="form-group m-0" role="group" aria-labelledby="label-highestqualificationdate">
                                    <div class="form-row">
                                        <label id="lblhighestqualificationdate" runat="server" for="highschoolendDate" class="col-md-3 col-form-label form-label">Date of completion of highest academic qualification *</label>
                                        <div class="col-md-6">
                                            <asp:dropdownlist id="ddlhighestqualificationmonth" cssclass="form-control" runat="server"></asp:dropdownlist>
                                            <asp:dropdownlist id="ddlhighestqualificationYear" cssclass="form-control" runat="server"></asp:dropdownlist>
                                            <span class="helpicon"><i id="ichighestqualificationdate" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="highestqualificationcountry">
                                <div class="form-group m-0" role="group" aria-labelledby="label-highestqualificationcountry">
                                    <div class="form-row">
                                        <label id="lblhighestqualificationcountry" runat="server" for="highestqualificationcountry" class="col-md-3 col-form-label form-label">Country where you studied your highest academic qualification *</label>
                                        <div class="col-md-6">
                                            <asp:dropdownlist id="ddlhighestqualificationcountry" cssclass="form-control" runat="server">
                                        </asp:dropdownlist>
                                            <span class="helpicon"><i id="ichighestqualificationcountry" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <h5 class="form-control col-md-4 h5ctrl">WORK EXPERIENCE</h5>
                        <div>
                            <div class="list-group-item" id="workexperience">
                                <div class="form-group m-0" role="group" aria-labelledby="label-workexperience">
                                    <div class="form-row">
                                        <label id="lblworkexperience" runat="server" for="workexperience" class="col-md-3 col-form-label form-label">Number of years of full-time work experience *</label>
                                        <div class="col-md-6">
                                            <asp:dropdownlist id="ddlworkexperience" cssclass="form-control" runat="server">
                                        </asp:dropdownlist>
                                            <span class="helpicon"><i id="icworkexperience" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="workexperience2">
                                <div class="form-group m-0" role="group" aria-labelledby="label-workexperience">
                                    <div class="form-row">
                                        <label id="Label5" runat="server" for="workexperience" class="col-md-3 col-form-label form-label">Are you currently working in a full-time job? *</label>
                                        <div class="col-md-6">
                                            <asp:dropdownlist id="ddlcurrentlyworking" cssclass="form-control" runat="server">
                                            <asp:ListItem Value="0">Please select</asp:ListItem>
                                            <asp:ListItem Value="1">Yes</asp:ListItem>
                                            <asp:ListItem Value="2">No</asp:ListItem>
                                        </asp:dropdownlist>
                                            <span class="helpicon"><i id="i4" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item">
                                <div class="form-group m-0" role="group" aria-labelledby="label-workexperience">
                                    <div class="form-row">
                                        <label id="Label10" runat="server" for="workexperience" class="col-md-3 col-form-label form-label">
                                            IN YOUR CURRENT JOB ARE YOU EMPLOYEES BY *
                                        </label> 
                                        <div class="col-md-6">
                                            <asp:dropdownlist id="ddlemployeesby" cssclass="form-control" runat="server">
                                            <asp:ListItem Value="0">Please Select</asp:ListItem>
                                            <asp:ListItem Value="1">Government</asp:ListItem>
                                            <asp:ListItem Value="2">Private (for-profit)</asp:ListItem>
                                            <asp:ListItem Value="3">Non-profit organization</asp:ListItem>
                                            <asp:ListItem Value="4">Self-employed</asp:ListItem>
                                            <asp:ListItem Value="5">Family business</asp:ListItem>
                                        </asp:dropdownlist>
                                            <span class="helpicon"><i id="i9" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="list-group-item">
                            <div class="form-group m-0" role="group" aria-labelledby="label-workexperience">
                                <div class="form-row">
                                    <label id="Label11" runat="server" class="col-md-3 col-form-label form-label">MAJOR CAREER FIELD *</label>
                                    <div class="col-md-6">
                                        <asp:DropDownList ID="ddlcareer_major" CssClass="form-control" runat="server">
                                        </asp:DropDownList>
                                        <span class="helpicon"><i id="i10" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="list-group-item">
                            <div class="form-group m-0" role="group" aria-labelledby="label-workexperience">
                                <div class="form-row">
                                    <label id="Label15" runat="server" for="" class="col-md-3 col-form-label form-label">MINOR CAREER FIELD *</label>
                                    <div class="col-md-6">
                                        <asp:DropDownList ID="ddlcareer_minor" CssClass="form-control" runat="server">
                                        </asp:DropDownList>
                                        <input type="hidden" runat="server" id="hidcareer_minor"/>
                                        <span class="helpicon"><i id="i11" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="list-group-item">
                            <div class="form-group m-0" role="group" aria-labelledby="label-workexperience">
                                <div class="form-row">
                                    <label id="Label21" runat="server" for="" class="col-md-3 col-form-label form-label">Broad CAREER FIELD *</label>
                                    <div class="col-md-6">
                                        <asp:DropDownList ID="ddlcareer_broad" CssClass="form-control" runat="server">
                                        </asp:DropDownList>
                                        <input type="hidden" runat="server" id="hidcareer_broad"/>
                                        <span class="helpicon"><i id="i12" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="list-group-item">
                            <div class="form-group m-0" role="group" aria-labelledby="label-workexperience">
                                <div class="form-row">
                                    <label id="Label22" runat="server" for="" class="col-md-3 col-form-label form-label">Detailed CAREER FIELD *</label>
                                    <div class="col-md-6">
                                        <asp:DropDownList ID="ddlcareer_detailed" CssClass="form-control" runat="server">
                                        </asp:DropDownList>
                                        <input type="hidden" runat="server" id="hidcareer_detailed"/>
                                        <span class="helpicon"><i id="i13" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <h5 class="form-control col-md-4 h5ctrl">INSTITUTION REFERENCE</h5>
                        <div>
                            <div class="list-group-item" id="Div1" runat="server">
                                <div class="form-group m-0" role="group" aria-labelledby="label-skypeDesc">
                                    <div class="form-row">
                                        <label id="label16" runat="server" for="whatsappDesc" class="col-md-3 col-form-label form-label">INSTITUTION NAME *</label>
                                        <div class="col-md-6">
                                            <input type="text" autocomplete="off" id="txtinstitutionname" runat="server" class="form-control" disabled="disabled">
                                            <span class="helpicon"><i id="ic_institutionname" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="Div2" runat="server">
                                <div class="form-group m-0" role="group" aria-labelledby="label-skypeDesc">
                                    <div class="form-row">
                                        <label id="label17" runat="server" for="whatsappDesc" class="col-md-3 col-form-label form-label">CAMPUS / LOCATION *</label>
                                        <div class="col-md-6">
                                            <asp:dropdownlist runat="server" id="ddlcampus" cssclass="form-control" />
                                            <span class="helpicon"><i id="icc_campus" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                             <div class="list-group-item" id="Div11" runat="server">
                                <div class="form-group m-0" role="group" aria-labelledby="label-skypeDesc">
                                    <div class="form-row">
                                        <label id="label23" runat="server" for="whatsappDesc" class="col-md-3 col-form-label form-label">GRADE/PROGRAM/DEPARTMENT *</label>
                                        <div class="col-md-6">
                                            <asp:dropdownlist runat="server" id="ddlgrade" cssclass="form-control" />
                                            <span class="helpicon"><i id="i14" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                             <div class="list-group-item" id="Div4" runat="server">
                                <div class="form-group m-0" role="group" aria-labelledby="label-skypeDesc">
                                    <div class="form-row">
                                        <label id="label19" runat="server" for="whatsappDesc" class="col-md-3 col-form-label form-label">GROUP *</label>
                                        <div class="col-md-6">
                                            <asp:dropdownlist runat="server" id="ddlgroup" cssclass="form-control" />
                                            <span class="helpicon"><i id="i16_group" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="Div5" runat="server">
                                <div class="form-group m-0" role="group" aria-labelledby="label-skypeDesc">
                                    <div class="form-row">
                                        <label id="label20" runat="server" for="whatsappDesc" class="col-md-3 col-form-label form-label">SUBJECTS / MODULES *</label>
                                        <div class="col-md-6">
                                             <asp:CheckBoxList runat="server" ID="ddlsubject" RepeatColumns="2" Font-Size="Small" RepeatDirection="Vertical">
                                                            </asp:CheckBoxList>

                                            <span class="helpicon"><i id="i17_subject" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                           
                            
                        </div>
                        <div id="mainDiv" runat="server"></div>
                        <div class="list-group-item" id="btgteapplicantdetail" runat="server">
                            <div class="form-group m-0" role="group" aria-labelledby="label-gteapplicantdetail">
                                <div class="form-row">

                                    <asp:button id="btngteapplicantdetail" runat="server" text="Save Changes" cssclass="btn btn-success" onclientclick="return validateForm()" onclick="btngteapplicantdetail_Click" style="margin-right: 271px;" />

                                    <div class="col-md-6">
                                        <asp:label id="lblMessage" runat="server" visible="false"></asp:label>
                                        <asp:label id="lblSaveTime" runat="server" visible="false"></asp:label>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
            <%-- <div class="col-md-4">
                    <div class="banImg-wrp">
                        <img src="/assets/images/Banner1.jpg" class="img-fluid">
                    </div>
                    <div class="card faq-qwrp" id="questions" runat="server">
                            <div class="card-body">
                            <%  if (allQuestions.Count > 0)
                                { %>
                            <div id="question" runat="server">
                                    <h5>Frequently Asked Questions (FAQs)</h5>
                                    <div class="">
                                    <%for (int q = 0; q < allQuestions.Count; q++)
                                        {%>  <div class="star-list">                                                             
                                                <label onclick="showFaqQuestion('<%=allQuestions[q].question%>','<%=allQuestions[q].answer.Replace(Environment.NewLine, "<br />") %>')">  <%=allQuestions[q].question%> </label>
                                            </div>                                                  
                                    <%} %>
                                </div>
                            </div>      
                                <%} %>  
                                     
                            </div>
                        </div>
                </div>--%>
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
    <script>

        $('#ContentPlaceHolder1_txtdob').flatpickr({
            dateFormat: 'Y-m-d', defaultDate: "", altInput: true, altFormat: 'd/m/Y', maxDate: "today"
        });

        $('#ContentPlaceHolder1_txtmarriagedob').flatpickr({
            dateFormat: 'Y-m-d', defaultDate: ""
        });

        $('#ContentPlaceHolder1_txtcommencementdate').flatpickr({
            dateFormat: 'Y-m-d', defaultDate: ""
        });

        function getAge(DOB) {
            var today = new Date();
            var birthDate = new Date(DOB);
            var age = today.getFullYear() - birthDate.getFullYear();
            var m = today.getMonth() - birthDate.getMonth();
            if (m < 0 || (m === 0 && today.getDate() < birthDate.getDate())) {
                age = age - 1;
            }

            return age;
        }

        function isValidUniversityAcceptAgeRange() {
            var dob = $("#<%=ddlMonth.ClientID%>").val() + "/" + $("#<%=ddlDay.ClientID%>").val() + "/" + $("#<%=ddlYear.ClientID%>").val();
            var age = getAge(dob);
            var maxAge = <%=GlobalVariables.universityMaxAge%>;
            var minAge = <%=GlobalVariables.universityMinAge%>;

            if (age < minAge || age > maxAge) {
                alert("Age should be between " + minAge + " & " + maxAge + " years");
                return false;
            }
            return true;
        }

        function isValidateHighestQualificationDate() {
            var DOB = $("#<%=ddlMonth.ClientID%>").val() + "/" + $("#<%=ddlDay.ClientID%>").val() + "/" + $("#<%=ddlYear.ClientID%>").val();
            var birthDate = new Date(DOB);

            var birthdateYear = birthDate.getFullYear();
            var birthdateMonth = birthDate.getMonth();
            var birthdateDay = birthDate.getDate();

            var HighestQualificationMonth = $("#<%=ddlhighestqualificationmonth.ClientID%>").val();
            var HighestQualificationYear = $("#<%=ddlhighestqualificationYear.ClientID%>").val();

            if (HighestQualificationYear == "0") {
                alert("Please select year of completion of highest academic qualification");
                return false;
            }
            else if (HighestQualificationMonth == "0") {
                alert("Please select Month of completion of highest academic qualification");
                return false;
            }
            else if (HighestQualificationYear < birthdateYear) {
                alert("Please select valid year of completion of highest academic qualification");
                return false;
            }
            return true;
        }
        function validateForm() {
            var flag = false;
            var checOnlykNum = /^[0-9]*$/;
            var emailRegex = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,10}(?:\.[a-z]{10})?)$/i;

            if ($("#<%=ddlTitle.ClientID%>").val() == "0")
                alert("Please select title");
            else if ($("#<%=txtFirstName.ClientID%>").val() == "")
                alert("Please enter first name");
            else if ($("#<%=txtLastName.ClientID%>").val() == "")
                alert("Please enter family name");
            else if (($("#<%=ddlDay.ClientID%>").val() == "0") || ($("#<%=ddlMonth.ClientID%>").val() == "0") || ($("#<%=ddlYear.ClientID%>").val() == "0") || ($("#<%=hidDOBDate.ClientID%>").val() == ""))
                alert("Please Select valid date of birth");
            else if (!isValidUniversityAcceptAgeRange()) { }
            else if ($("#<%=ddlgenderList.ClientID%>").val() == "0")
                alert("Please select gender");
            else if ($("#<%=ddlnationality.ClientID%>").val() == "0")
                alert("Please select country of citizenship");
            else if ($("#<%=ddlcountryofdob.ClientID%>").val() == "0")
                alert("Please select country Of date Of birth");
            else if ($("#<%=ddlmaritalstatus.ClientID%>").val() == "0")
                alert("Please select marital status");
            else if (!$("#<%=disability.ClientID%>").is(':hidden') && !($("#<%=rblDisabilityYes.ClientID%>").is(':checked') || $("#<%=rblDisabilityNo.ClientID%>").is(':checked')))
                alert("Please Select Option to record disability");
            else if (!$("#<%=disabilitydesc.ClientID%>").is(':hidden') && $("#<%=ddlDisability.ClientID%>").val() == "0")
                alert("Please select valid disability");

            else if ($("#<%=txtEmail.ClientID%>").val() == "" || !(emailRegex.test($("#<%=txtEmail.ClientID%>").val())))
                alert("Please enter Valid e-mail address");
            else if ($("#<%=ddlcountrycode.ClientID%>").val() == "0")
                alert("Please select country code for mobile number");
            else if ($("#<%=txtMobile.ClientID%>").val() == "")
                alert("Please enter mobile number");
            else if (!(checOnlykNum.test($("#<%=txtMobile.ClientID%>").val())))
                alert("Please enter valid mobile number");
            else if (!$("#<%=whatsapp.ClientID%>").is(':hidden') && !($("#<%=rblwhatsappYes.ClientID%>").is(':checked') || $("#<%=rblwhatsappNo.ClientID%>").is(':checked')))
                alert("Please Select Option to record your whatsapp detail");
            else if (!$("#<%=whatsapp.ClientID%>").is(':hidden') && $("#<%=rblwhatsappYes.ClientID%>").is(':checked') && !($("#<%=rblWhatsupsameYes.ClientID%>").is(':checked') || $("#<%=rblWhatsupsameNo.ClientID%>").is(':checked')))
                alert("Please Select Is Your Whatsapp No is Same As Your Mobile No");
            else if (!$("#<%=whatsapp.ClientID%>").is(':hidden') && !$("#<%=whatsappHave.ClientID%>").is(':hidden') && $("#<%=rblWhatsupsameNo.ClientID%>").is(':checked') && $("#<%=txtWhatsappNo.ClientID%>").val() == "")
                alert("Please Enter New Whatsapp Number ");
            //postal 
            else if (!$("#<%=postal.ClientID%>").is(':hidden') && $("#<%=txtAddressLine1.ClientID%>").val() == "")
                alert("Please enter first postal address line");
            <%--else if (!$("#<%=postal.ClientID%>").is(':hidden') && $("#<%=txtAddressLine2.ClientID%>").val() == "")
                alert("Please enter second postal address line");
            else if (!$("#<%=postal.ClientID%>").is(':hidden') && $("#<%=txtAddressLine3.ClientID%>").val() == "")
                alert("Please enter third postal address line");--%>
            else if (!$("#<%=postal.ClientID%>").is(':hidden') && $("#<%=txtCity.ClientID%>").val() == "")
                alert("Please enter postal city");
            else if (!$("#<%=postal.ClientID%>").is(':hidden') && $("#<%=txtState.ClientID%>").val() == "")
                alert("Please enter postal state");
            else if (!$("#<%=postal.ClientID%>").is(':hidden') && ($("#<%=txtPostal.ClientID%>").val() == "" || !(checOnlykNum.test($("#<%=txtPostal.ClientID%>").val()))))
                alert("Please enter valid postal postal code");
            else if (!$("#<%=postal.ClientID%>").is(':hidden') && $("#<%=ddlpostalCountry.ClientID%>").val() == "0")
                alert("Please select valid postal country");
            else if (!($("#<%=rblAddressYes.ClientID%>").is(':checked') || $("#<%=rblAddressNo.ClientID%>").is(':checked')))
                alert("Please Select Option to record is your postal and residentail address is same");
            else if ($("#<%=rblAddressNo.ClientID%>").is(':checked') && (!$("#<%=residential.ClientID%>").is(':hidden')) && ($("#<%=txtResidentialAddress1.ClientID%>").val() == ""))
                alert("Please enter first residential address line");
            else if ($("#<%=rblAddressNo.ClientID%>").is(':checked') && (!$("#<%=residential.ClientID%>").is(':hidden')) && ($("#<%=txtResidentialCity.ClientID%>").val() == ""))
                alert("Please enter residential city");
            else if ($("#<%=rblAddressNo.ClientID%>").is(':checked') && (!$("#<%=residential.ClientID%>").is(':hidden')) && ($("#<%=ddlResidentialCountry.ClientID%>").val() == "0"))
                alert("Please enter residential Country");

            else if ($("#<%=txtguardianName.ClientID%>").val() == "")
                alert("Please enter guardian name");
            else if ($("#<%=ddlrelationship_guardian.ClientID%>").val() == "0")
                alert("Please select relationship with guardian");
            else if ($("#<%=txtguardian_email.ClientID%>").val() == "" || !(emailRegex.test($("#<%=txtguardian_email.ClientID%>").val())))
                alert("Please enter guardian email");
            else if ($("#<%=ddlguardian_countrycode.ClientID%>").val() == "0")
                alert("Please select country code for guardian mobile number ");
            else if ($("#<%=txtguardian_mobileno.ClientID%>").val() == "")
                alert("Please enter guardian mobile number");
            else if (!(checOnlykNum.test($("#<%=txtguardian_mobileno.ClientID%>").val())))
                alert("Please enter valid guardian mobile number");
            else if ($("#<%=ddlalternateIdentitytype.ClientID%>").val() == "0")
                alert("Please select identity proof type");
            else if ($("#<%=txtalternateIdentityNo.ClientID%>").val() == "")
                alert("Please enter valid identity number");
            else if ($("#<%=FileUpload_passport.ClientID%>").val() == "" && $("#<%=hidPassportDocPath.ClientID%>").val() == "")
                alert("Please upload ID copy");
            else if (!validfileExtention($("#<%=FileUpload_passport.ClientID%>").val(), $("#<%=hidPassportDocPath.ClientID%>").val()))
                alert("Please upload valid file format");
            else if (!checkpassportFileSize())
                alert("passport document size should be less than 16MB");
            else if ($("#<%=fileUpload.ClientID%>").val() == "" && $("#<%=hidDocumentPath.ClientID%>").val() == "")
                alert("Please upload profile picture");
            else if (!validfileExtention($("#<%=fileUpload.ClientID%>").val(), $("#<%=hidDocumentPath.ClientID%>").val()))
                alert("Please upload valid file format");
            else if (!checkFileSize())
                alert("photo size should be less than 16MB");
            //social
            else if (!$("#<%=linkedin.ClientID%>").is(':hidden') && $("#<%=txtLinkedin.ClientID%>").val() == "" && !$("#<%=chkLinkeIn.ClientID%>").is(":checked"))
                alert("Please Enter LinkedIn Profile");
            else if (!$("#<%=facebook.ClientID%>").is(':hidden') && $("#<%=txtFacebook.ClientID%>").val() == "" && !$("#<%=ChkFacebook.ClientID%>").is(":checked"))
                alert("Please Enter Facebook Profile");
            else if (!$("#<%=twitter.ClientID%>").is(':hidden') && $("#<%=txtTwitter.ClientID%>").val() == "" && !$("#<%=chkTwitter.ClientID%>").is(":checked"))
                alert("Please Select Twitter Profile");
            //EDUCATIONAL QUALIFICATIONS

            else if ($("#<%=ddlhighestqualificationAchieved.ClientID%>").val() == "0")
                alert("Please select level of the highest qualification completed");
            else if ($("#<%=ddlboradfield.ClientID%>").val() == "0")
                alert("Please select broad field of education of highest academic qualification completed");
            else if ($("#<%=ddlnarrowfield.ClientID%>").val() == "0")
                alert("Please select narrow field of education of highest academic qualification completed");
            else if ($("#<%=ddldetailedfield.ClientID%>").val() == "0")
                alert("Please select detailed field of education of highest academic qualification completed");
            else if (!isValidateHighestQualificationDate()) { }
            else if ($("#<%=ddlhighestqualificationcountry.ClientID%>").val() == "0")
                alert("Please select country where you studied your highest academic qualification");
            //WORK EXPERIENCE
            else if ($("#<%=ddlworkexperience.ClientID%>").val() == "0")
                alert("Please select work experience ");
            else if ($("#<%=ddlcurrentlyworking.ClientID%>").val() == "0")
                alert("Please select potion for are you currently working in full time job ");
            else if ($("#<%=ddlemployeesby.ClientID%>").val() == "0")
                alert("Please select potion for in your current job are you employees by");
            else if ($("#<%=ddlcareer_major.ClientID%>").val() == "0")
                alert("Please select potion for major career field");
            else if ($("#<%=hidcareer_minor.ClientID%>").val() == "")
                alert("Please select potion for minor career field");
            else if ($("#<%=hidcareer_broad.ClientID%>").val() == "")
                alert("Please select potion for broad career field");
            else if ($("#<%=hidcareer_detailed.ClientID%>").val() == "")
                alert("Please select potion for detailed career field");
            //INSTITUTION REFERENCE
            else if ($("#<%=ddlcampus.ClientID%>").val() == "0")
                alert("Please select campus");
            else if ($("#<%=ddlgrade.ClientID%>").val() == "0")
                alert("Please select grade");
            else if ($("#<%=ddlgroup.ClientID%>").val() == "0")
                alert("Please select group");
             else if ($("input[type=checkbox]:checked").length == 0)
                alert("Please select subject");
            else
                flag = true;
            return flag;
        }

        function validfileExtention(filepath, hidDocumentPath) {
            if (filepath == "") {
                filepath = hidDocumentPath;
            }
            if (!filepath)
                return false;
            var fileExtension = filepath.substring(filepath.lastIndexOf(".") + 1).toString().toLowerCase();
            if (filepath != "") {
                if (fileExtension != "jpg" && fileExtension != "png" && fileExtension != "jpeg")
                    return false;
            }
            return true;
        }
        function checkFileSize() {
            var fileSize = $("#ContentPlaceHolder1_fileUpload")[0].files[0].size;
            var fileSizeInMB = (fileSize / 1024) / 1024;
            return (fileSizeInMB < 16);
        }
        function checkpassportFileSize() {
            var fileSize = $("#ContentPlaceHolder1_FileUpload_passport")[0].files[0].size;
            var fileSizeInMB = (fileSize / 1024) / 1024;
            return (fileSizeInMB < 16);
        }


        $(document).ready(function () {

            $('.fa-info-circle').tipso({
                position: 'right',
                background: 'rgba(0,0,0,0.8)',
                useTitle: false,
            });

            <%-- var input = document.querySelector("#<%=txtMobile.ClientID%>");
                window.intlTelInput(input, {
                    utilsScript: "/assets/js/utils.js?1551697588835" // just for formatting/placeholders etc
            });--%>
            //$('.sidebar-menu-item').removeClass('open');
            //$('#gteevalution_list').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#gtestudentdetail').addClass('active');

            if ($("#<%=rblAddressYes.ClientID%>").is(':checked'))
                $("#<%=residential.ClientID%>").hide();
            else
                $("#<%=residential.ClientID%>").show();


        });





        $("#<%=ddlboradfield.ClientID%>").change(function () {
            var broadfieldID = $("#<%=ddlboradfield.ClientID%>").val()
            if (broadfieldID > 0) {
                $.ajax({
                    type: "GET",
                    url: "ec_applicantdetails.aspx/GetNarrowFields",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: { broadfieldID: broadfieldID },
                    success: function (response) {
                        if (response.d) {
                            var result = JSON.parse(response.d);
                            if ($("#<%=ddlnarrowfield.ClientID%>").length >= 1) {
                                $("#<%=ddlnarrowfield.ClientID%>").empty();
                                $("#<%=ddlnarrowfield.ClientID%>").append($('<option selected="selected"></option>').val("0").html("Please Select"));
                            }
                            for (var i = 0; i < result.length; i++)
                                $("#<%=ddlnarrowfield.ClientID%>").append($("<option></option>").val(result[i].id).html(result[i].fieldname));
                        }
                    }
                });
            }
            else {
                $("#<%=ddlnarrowfield.ClientID%>").empty();
                $("#<%=ddlnarrowfield.ClientID%>").append($('<option selected="selected"></option>').val("0").html("Please Select"));
            }
        });

        $("#<%=ddlnarrowfield.ClientID%>").change(function () {
            $("#<%=hidnarrowfieldId.ClientID%>").val($("#<%=ddlnarrowfield.ClientID%>").val());
        });
        ////
        $("#<%=ddlnarrowfield.ClientID%>").change(function () {
            var narrowfieldID = $("#<%=ddlnarrowfield.ClientID%>").val()
            if (narrowfieldID > 0) {
                $.ajax({
                    type: "GET",
                    url: "ec_applicantdetails.aspx/GetDetailedFields",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: { narrowfieldID: narrowfieldID },
                    success: function (response) {
                        if (response.d) {
                            var result = JSON.parse(response.d);
                            if ($("#<%=ddldetailedfield.ClientID%>").length >= 1) {
                                 $("#<%=ddldetailedfield.ClientID%>").empty();
                                 $("#<%=ddldetailedfield.ClientID%>").append($('<option selected="selected"></option>').val("0").html("Please Select"));
                             }
                             for (var i = 0; i < result.length; i++)
                                 $("#<%=ddldetailedfield.ClientID%>").append($("<option></option>").val(result[i].id).html(result[i].fieldname));
                         }
                     }
                 });
             }
             else {
                 $("#<%=ddldetailedfield.ClientID%>").empty();
                 $("#<%=ddldetailedfield.ClientID%>").append($('<option selected="selected"></option>').val("0").html("Please Select"));
            }
        });

        $("#<%=ddldetailedfield.ClientID%>").change(function () {
            $("#<%=hiddetailedfield.ClientID%>").val($("#<%=ddldetailedfield.ClientID%>").val());
        });

        $("#<%=ddlhighestqualificationAchieved.ClientID%>").change(function () {
            var studeylevelID = $("#<%=ddlhighestqualificationAchieved.ClientID%>").val()
            if (studeylevelID > 0) {
                $.ajax({
                    type: "GET",
                    url: "ec_applicantdetails.aspx/GetBroadFields",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: { studeylevelID: studeylevelID },
                    success: function (response) {
                        if (response.d) {
                            var result = JSON.parse(response.d);
                            if ($("#<%=ddlboradfield.ClientID%>").length >= 1) {
                                $("#<%=ddlboradfield.ClientID%>").empty();
                                $("#<%=ddlboradfield.ClientID%>").append($('<option selected="selected"></option>').val("0").html("Please Select"));
                            }
                            for (var i = 0; i < result.length; i++)
                                $("#<%=ddlboradfield.ClientID%>").append($("<option></option>").val(result[i].id).html(result[i].fieldname));
                        }
                    }
                });
            }
            else {
                $("#<%=ddlboradfield.ClientID%>").empty();
                $("#<%=ddlboradfield.ClientID%>").append($('<option selected="selected"></option>').val("0").html("Please Select"));
            }
        });

        $("#<%=ddlboradfield.ClientID%>").change(function () {
            $("#<%=hidbroadfieldId.ClientID%>").val($("#<%=ddlboradfield.ClientID%>").val());
        });

        $(function () {
            $("input[name='ctl00$ContentPlaceHolder1$address']").click(function () {
                if ($("#<%=rblAddressYes.ClientID%>").is(":checked")) {

                    $("#<%=residential.ClientID%>").hide();
                } else {
                    $("#<%=residential.ClientID%>").show();
                }
            });
        });

        function getDaysInMonth(month, year) {
            return new Date(year, month, 0).getDate();
        };
        //DOB
        $("#<%=ddlMonth.ClientID%>").change(function () {
            $("#<%=ddlDay.ClientID%>").empty();
            var daysInSelectedMonth = getDaysInMonth($("#<%=ddlMonth.ClientID%>").val(), $("#<%=ddlYear.ClientID%>").val());
            $("#<%=ddlDay.ClientID%>").append($("<option></option>").attr("value", "0").text("Select Day"));
            for (var i = 1; i <= daysInSelectedMonth; i++) {
                $("#<%=ddlDay.ClientID%>").append($("<option></option>").attr("value", i).text(i));
            }

        });
        $("#<%=ddlDay.ClientID%>").change(function () {
            $("#<%=hidDOBDate.ClientID%>").val($("#<%=ddlDay.ClientID%>").val());
        });

        function getAge(DOB) {
            var today = new Date();
            var birthDate = new Date(DOB);
            var age = today.getFullYear() - birthDate.getFullYear();
            var m = today.getMonth() - birthDate.getMonth();
            if (m < 0 || (m === 0 && today.getDate() < birthDate.getDate())) {
                age = age - 1;
            }

            return age;
        }

        function isValidUniversityAcceptAgeRange() {
            var dob = $("#<%=ddlMonth.ClientID%>").val() + "/" + $("#<%=ddlDay.ClientID%>").val() + "/" + $("#<%=ddlYear.ClientID%>").val();
            var age = getAge(dob);
            var maxAge = <%=GlobalVariables.universityMaxAge%>;
            var minAge = <%=GlobalVariables.universityMinAge%>;

            if (age < minAge || age > maxAge) {
                alert("Age should be between " + minAge + " & " + maxAge + " years");
                return false;
            }
            return true;
        }

        $(function () {
            $("input[name='ctl00$ContentPlaceHolder1$disability']").click(function () {
                if ($("#<%=rblDisabilityYes.ClientID%>").is(":checked")) {
                    $("#<%=disabilitydesc.ClientID%>").show();

                } else {
                    $("#<%=disabilitydesc.ClientID%>").hide();

                }
            });
        });
            $(function () {
                $("input[name='ctl00$ContentPlaceHolder1$whatsappSame']").click(function () {
                    if ($("#<%=rblWhatsupsameNo.ClientID%>").is(":checked"))
                    $("#<%=whatsappDesc.ClientID%>").show();
                else
                    $("#<%=whatsappDesc.ClientID%>").hide();
                });
            });
            $(function () {
                $("input[name='ctl00$ContentPlaceHolder1$whatsapp']").click(function () {
                    if ($("#<%=rblwhatsappYes.ClientID%>").is(":checked"))
                    $("#<%=whatsappHave.ClientID%>").show();
                else
                    $("#<%=whatsappHave.ClientID%>").hide();
                $("#<%=whatsappDesc.ClientID%>").hide();

                });
            });
            $("#<%=ChkFacebook.ClientID%>").change(function () {
                if ($(this).is(":checked")) {
                    $("#<%=txtFacebook.ClientID%>").val("");
                $("#<%=txtFacebook.ClientID%>").attr("disabled", "disabled");
            }
            else
                $("#<%=txtFacebook.ClientID%>").removeAttr("disabled");
            });

        $("#<%=chkTwitter.ClientID%>").change(function () {
            if ($(this).is(":checked")) {
                $("#<%=txtTwitter.ClientID%>").val("");
                    $("#<%=txtTwitter.ClientID%>").attr("disabled", "disabled");
                }
                else
                    $("#<%=txtTwitter.ClientID%>").removeAttr("disabled");
        });
        $("#<%=chkLinkeIn.ClientID%>").change(function () {
            if ($(this).is(":checked")) {
                $("#<%=txtLinkedin.ClientID%>").val("");
                $("#<%=txtLinkedin.ClientID%>").attr("disabled", "disabled");
            }
            else
                $("#<%=txtLinkedin.ClientID%>").removeAttr("disabled");
        });
        $('#<%=ddlTitle.ClientID%>').change(function () {
                if ($("#<%=ddlTitle.ClientID%> option:selected").text() == "Others") {
                    $('#<%=txtTitle.ClientID%>').css({ 'display': 'block' });
                }
                else { $('#<%=txtTitle.ClientID%>').css({ 'display': 'none' }); }

            });

        
            $(document).ready(function () {
                if (!$("#<%=title.ClientID%>").is(':hidden')) {

                    if ($("#<%=ddlTitle.ClientID%> option:selected").text() == "Others") {
                        $('#<%=txtTitle.ClientID%>').css({ 'display': 'block' });
                    }
                    else { $('#<%=txtTitle.ClientID%>').css({ 'display': 'none' }); }
                }
                if (!$("#<%=disability.ClientID%>").is(':hidden')) {

                    if ($("#<%=rblDisabilityYes.ClientID%>").is(':checked')) {
                        $("#<%=disabilitydesc.ClientID%>").show();
                    } else { $("#<%=disabilitydesc.ClientID%>").hide(); }
                }

                if (!$("#<%=whatsapp.ClientID%>").is(':hidden') && $("#<%=rblwhatsappYes.ClientID%>").is(':checked')) {
                    $("#<%=whatsappHave.ClientID%>").show();
                }
                else {
                    $("#<%=whatsappHave.ClientID%>").hide();
                    $("#<%=whatsappDesc.ClientID%>").hide();
                }

                if (!$("#<%=whatsappHave.ClientID%>").is(':hidden') && $("#<%=rblWhatsupsameNo.ClientID%>").is(':checked')) {
                    $("#<%=whatsappDesc.ClientID%>").show();
                }
                else {
                    $("#<%=whatsappDesc.ClientID%>").hide();
                }
                if ($("#<%=chkLinkeIn.ClientID%>").is(":checked"))
                    $("#<%=txtLinkedin.ClientID%>").attr("disabled", "disabled");
                else
                    $("#<%=txtLinkedin.ClientID%>").removeAttr("disabled");

                if ($("#<%=ChkFacebook.ClientID%>").is(":checked"))
                    $("#<%=txtFacebook.ClientID%>").attr("disabled", "disabled");
                else
                    $("#<%=txtFacebook.ClientID%>").removeAttr("disabled");

                if ($("#<%=chkTwitter.ClientID%>").is(":checked"))
                    $("#<%=txtTwitter.ClientID%>").attr("disabled", "disabled");
                else
                    $("#<%=txtTwitter.ClientID%>").removeAttr("disabled");
        });

        ///////////////////////////////////////////////////////////////////////
          $("#<%=ddlcareer_major.ClientID%>").change(function () {
            var major_fieldID = $("#<%=ddlcareer_major.ClientID%>").val()
            if (major_fieldID > 0) {
                $.ajax({
                    type: "GET",
                    url: "ec_applicantdetails.aspx/GetFields_minor",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: { major_fieldID: major_fieldID },
                    success: function (response) {
                        if (response.d) {
                            var result = JSON.parse(response.d);
                            if ($("#<%=ddlcareer_minor.ClientID%>").length >= 1) {
                                $("#<%=ddlcareer_minor.ClientID%>").empty();
                                $("#<%=ddlcareer_minor.ClientID%>").append($('<option selected="selected"></option>').val("0").html("Please Select"));
                            }
                            for (var i = 0; i < result.length; i++)
                                $("#<%=ddlcareer_minor.ClientID%>").append($("<option></option>").val(result[i].id).html(result[i].fieldname));
                        }
                    }
                });
            }
            else {
                $("#<%=ddlcareer_minor.ClientID%>").empty();
                $("#<%=ddlcareer_minor.ClientID%>").append($('<option selected="selected"></option>').val("0").html("Please Select"));
            }
        });

        $("#<%=ddlcareer_minor.ClientID%>").change(function () {
            $("#<%=hidcareer_minor.ClientID%>").val($("#<%=ddlcareer_minor.ClientID%>").val());
        });

          $("#<%=ddlcareer_minor.ClientID%>").change(function () {
            var minor_fieldID = $("#<%=hidcareer_minor.ClientID%>").val()
            if (minor_fieldID > 0) {
                $.ajax({
                    type: "GET",
                    url: "ec_applicantdetails.aspx/GetFields_broad",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: { minor_fieldID: minor_fieldID },
                    success: function (response) {
                        if (response.d) {
                            var result = JSON.parse(response.d);
                            if ($("#<%=ddlcareer_broad.ClientID%>").length >= 1) {
                                $("#<%=ddlcareer_broad.ClientID%>").empty();
                                $("#<%=ddlcareer_broad.ClientID%>").append($('<option selected="selected"></option>').val("0").html("Please Select"));
                            }
                            for (var i = 0; i < result.length; i++)
                                $("#<%=ddlcareer_broad.ClientID%>").append($("<option></option>").val(result[i].id).html(result[i].fieldname));
                        }
                    }
                });
            }
            else {
                $("#<%=ddlcareer_broad.ClientID%>").empty();
                $("#<%=ddlcareer_broad.ClientID%>").append($('<option selected="selected"></option>').val("0").html("Please Select"));
            }
        });

        $("#<%=ddlcareer_broad.ClientID%>").change(function () {
            $("#<%=hidcareer_broad.ClientID%>").val($("#<%=ddlcareer_broad.ClientID%>").val());
        });
        $("#<%=ddlcareer_broad.ClientID%>").change(function () {
            var broad_fieldID = $("#<%=hidcareer_broad.ClientID%>").val()
            if (broad_fieldID > 0) {
                $.ajax({
                    type: "GET",
                    url: "ec_applicantdetails.aspx/GetFields_detailed",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: { broad_fieldID : broad_fieldID  },
                    success: function (response) {
                        if (response.d) {
                            var result = JSON.parse(response.d);
                            if ($("#<%=ddlcareer_detailed.ClientID%>").length >= 1) {
                                $("#<%=ddlcareer_detailed.ClientID%>").empty();
                                $("#<%=ddlcareer_detailed.ClientID%>").append($('<option selected="selected"></option>').val("0").html("Please Select"));
                            }
                            for (var i = 0; i < result.length; i++)
                                $("#<%=ddlcareer_detailed.ClientID%>").append($("<option></option>").val(result[i].id).html(result[i].fieldname));
                        }
                    }
                });
            }
            else {
                $("#<%=ddlcareer_detailed.ClientID%>").empty();
                $("#<%=ddlcareer_detailed.ClientID%>").append($('<option selected="selected"></option>').val("0").html("Please Select"));
            }
        });

        $("#<%=ddlcareer_detailed.ClientID%>").change(function () {
            $("#<%=hidcareer_detailed.ClientID%>").val($("#<%=ddlcareer_detailed.ClientID%>").val());
        });

    </script>
</asp:Content>
