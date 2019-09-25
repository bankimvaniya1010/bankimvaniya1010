<%@ Page Language="C#" AutoEventWireup="true" CodeFile="applicantcontactdetail.aspx.cs" Inherits="admin_applicantcontactdetail" MasterPageFile="~/admin/admin.master" %>

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
            <li class="breadcrumb-item active">Applicant Contact Details</li>
        </ol>
        <h1 class="h2">Applicant Contact Details</h1>
        <div class="card">

            <div class="list-group list-group-fit">
                <div class="list-group-item" id="email" runat="server" style="display: none">
                    <div class="form-group m-0" role="group" aria-labelledby="label-email">
                        <div class="form-row">
                            <label id="labelemail" runat="server" for="email" class="col-md-2 col-form-label form-label">Email *</label>
                            <div class="col-md-6">
                                <div class="prdtl-ans">
                                    <asp:Label ID="lblEmail" runat="server"></asp:Label>
                                </div>
                                <div class="prdtl-vrfy">
                                    <asp:RadioButton ID="rblEmailYes" GroupName="Email" Text="Yes" runat="server" />
                                    <asp:RadioButton ID="rblEmailNo" GroupName="Email" Text="No" runat="server" />
                                </div>
                                <span class="helpicon"><i id="icEmail" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-3">
                                <input type="button" value="Add Remarks" id="btnEmail" />
                                <input id="txtEmail" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="mobile" runat="server" style="display: none">
                    <div class="form-group m-0" role="group" aria-labelledby="label-Mobile">
                        <div class="form-row">
                            <label id="labelMobile" runat="server" for="Mobile" class="col-md-2 col-form-label form-label">Mobile/Cellular Number *</label>
                            <div class="col-md-6">
                                <div class="prdtl-ans">
                                    <asp:Label ID="lblMobile" runat="server"></asp:Label>
                                </div>
                                <div class="prdtl-vrfy">
                                    <asp:RadioButton ID="rblMobileYes" GroupName="Mobile" Text="Yes" runat="server" />
                                    <asp:RadioButton ID="rblMobileNo" GroupName="Mobile" Text="No" runat="server" />
                                </div>
                                <span class="helpicon"><i id="icMobile" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-3">
                                <input type="button" value="Add Remarks" id="btnMobile" />
                                <input id="txtMobile" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="phone" runat="server" style="display: none">
                    <div class="form-group m-0" role="group" aria-labelledby="label-phone">
                        <div class="form-row">
                            <label id="labelphone" runat="server" for="phone" class="col-md-2 col-form-label form-label">Home phone</label>
                            <div class="col-md-6">
                                <div class="prdtl-ans">
                                    <asp:Label ID="lblHomePhone" runat="server"></asp:Label>
                                </div>
                                <div class="prdtl-vrfy">
                                    <asp:RadioButton ID="rblHomePhoneYes" GroupName="HomePhone" Text="Yes" runat="server" />
                                    <asp:RadioButton ID="rblHomePhoneNo" GroupName="HomePhone" Text="No" runat="server" />
                                </div>
                                <span class="helpicon"><i id="icHomePhone" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-3">
                                <input type="button" value="Add Remarks" id="btnHomePhone" />
                                <input id="txtHomePhone" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="skype" runat="server" style="display: none">
                    <div class="form-group m-0" role="group" aria-labelledby="label-skype">
                        <div class="form-row">
                            <label id="labelskype" runat="server" for="skype" class="col-md-2 col-form-label form-label">WOULD YOU LIKE TO CONNECT VIA SKYPE</label>
                            <div class="col-md-6">
                                <div class="prdtl-ans">
                                    <asp:Label ID="lblSkype" runat="server"></asp:Label>
                                </div>
                                <div class="prdtl-vrfy">
                                    <asp:RadioButton ID="rblSkypeYes" GroupName="Skype" Text="Yes" runat="server" />
                                    <asp:RadioButton ID="rblSkypeNo" GroupName="Skype" Text="No" runat="server" />
                                </div>
                                <span class="helpicon"><i id="icSkype" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-3">
                                <input type="button" value="Add Remarks" id="btnSkype" />
                                <input id="txtSkype" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>
                    </div>
                </div>

                <div class="list-group-item" id="skypeDesc" runat="server" style="display: none">
                    <div class="form-group m-0" role="group" aria-labelledby="label-skypeDesc">
                        <div class="form-row">
                            <label id="labelskypeDesc" runat="server" for="skypeDesc" class="col-md-2 col-form-label form-label">Skype ID</label>
                            <div class="col-md-6">
                                <div class="prdtl-ans">
                                    <asp:Label ID="lblSkypeDescription" runat="server"></asp:Label>
                                </div>
                                <div class="prdtl-vrfy">
                                    <asp:RadioButton ID="rblSkypeDescriptionYes" GroupName="SkypeDescription" Text="Yes" runat="server" />
                                    <asp:RadioButton ID="rblSkypeDescriptionNo" GroupName="SkypeDescription" Text="No" runat="server" />
                                </div>
                                <span class="helpicon"><i id="icSkypeDesc" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-3">
                                <input type="button" value="Add Remarks" id="btnSkypeDescription" />
                                <input id="txtSkypeDescription" style="display: none" runat="server" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="whatsapp" runat="server" style="display: none">
                    <div class="form-group m-0" role="group" aria-labelledby="label-whatsapp">
                        <div class="form-row">
                            <label id="labelwhatsapp" runat="server" for="whatsapp" class="col-md-2 col-form-label form-label">WOULD YOU LIKE TO CONNECT VIA WHATSAPP </label>
                            <div class="col-md-6">
                                <div class="prdtl-ans">
                                    <asp:Label ID="lblWhatsapp" runat="server"></asp:Label>
                                </div>
                                <div class="prdtl-vrfy">
                                    <asp:RadioButton ID="rblWhatsappYes" GroupName="Whatsapp" Text="Yes" runat="server" />
                                    <asp:RadioButton ID="rblWhatsappNo" GroupName="Whatsapp" Text="No" runat="server" />
                                </div>
                                <span class="helpicon"><i id="icWhatsapp" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>

                            </div>
                            <div class="col-md-3">
                                <input type="button" value="Add Remarks" id="btnWhatsapp" />
                                <input id="txtWhatsapp" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="whatsappHave" runat="server" style="display: none">
                    <div class="form-group m-0" role="group" aria-labelledby="label-whatsappHave">
                        <div class="form-row">
                            <label id="labelwhatsappHave" runat="server" for="whatsappHave" class="col-md-2 col-form-label form-label">IS YOUR WHATSAPP NO SAME AS YOUR MOBILE NO </label>
                            <div class="col-md-6">
                                <div class="prdtl-ans">
                                    <asp:Label ID="lblWhatsapphave" runat="server"></asp:Label>
                                </div>
                                <div class="prdtl-vrfy">
                                    <asp:RadioButton ID="rblWhatsapphaveYes" GroupName="Whatsapphave" Text="Yes" runat="server" />
                                    <asp:RadioButton ID="rblWhatsapphaveNo" GroupName="Whatsapphave" Text="No" runat="server" />
                                </div>
                                <span class="helpicon"><i id="icWhatsapphave" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-3">
                                <input type="button" value="Add Remarks" id="btnWhatsapphave" />
                                <input id="txtWhastappHave" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="whatsappDesc" runat="server" style="display: none">
                    <div class="form-group m-0" role="group" aria-labelledby="label-skypeDesc">
                        <div class="form-row">
                            <label id="labelwhatsappDesc" runat="server" for="whatsappDesc" class="col-md-2 col-form-label form-label">Whatsapp Number</label>
                            <div class="col-md-6">
                                <div class="prdtl-ans">
                                    <asp:Label ID="lblWhastappDesription" runat="server"></asp:Label>
                                </div>
                                <div class="prdtl-vrfy">
                                    <asp:RadioButton ID="rblwhatsappDescYes" GroupName="whatsappDesc" Text="Yes" runat="server" />
                                    <asp:RadioButton ID="rblwhatsappDescNo" GroupName="whatsappDesc" Text="No" runat="server" />
                                </div>
                                <span class="helpicon"><i id="icWhatsappDesc" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>

                            </div>
                            <div class="col-md-3">
                                <input type="button" value="Add Remarks" id="btnwhatsappDesc" />
                                <input id="txtWhatsappDescription" style="display: none" runat="server" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="postal" runat="server" style="display: none">
                    <div class="form-group m-0" role="postal" aria-labelledby="label-postal">
                        <div class="form-row">
                            <label id="labelpostal" runat="server" for="postal" class="col-md-2 col-form-label form-label">Postal Address</label>
                            <div class="col-md-6">
                                <div class="prdtl-ans">
                                    <asp:Label ID="lblPostalAddress" runat="server"></asp:Label>
                                </div>
                                <div class="prdtl-vrfy">
                                    <asp:RadioButton ID="rblPostalAddressYes" GroupName="PostalAddress" Text="Yes" runat="server" />
                                    <asp:RadioButton ID="rblPostalAddressNo" GroupName="PostalAddress" Text="No" runat="server" />
                                </div>
                                <span class="helpicon"><i id="icPostal" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-3">
                                <input type="button" value="Add Remarks" id="btnPostalAddress" />
                                <input id="txtPostalAddress" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="address" runat="server" style="display: none">
                    <div class="form-group m-0" role="group" aria-labelledby="label-address">
                        <div class="form-row">
                            <label id="labeladdress" runat="server" for="address" class="col-md-2 col-form-label form-label">Is your Postal Address same as your current residential address</label>
                            <div class="col-md-6">
                                <div class="prdtl-ans">
                                    <asp:Label ID="lblAddress" runat="server"></asp:Label>
                                </div>
                                <div class="prdtl-vrfy">
                                    <asp:RadioButton ID="rblAddressYes" GroupName="Address" Text="Yes" runat="server" />
                                    <asp:RadioButton ID="rblAddressNo" GroupName="Address" Text="No" runat="server" />
                                </div>
                                <span class="helpicon"><i id="icAddress" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-3">
                                <input type="button" value="Add Remarks" id="btnAddress" />
                                <input id="txtAddress" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>
                        <div class="form-row">
                            <label id="labelCurrentAddress" runat="server" for="currentAddressSelection" class="col-md-2 col-form-label form-label">Have you been living in the current address for Less than 1 year?</label>
                            <div class="col-md-6">
                                <div class="prdtl-ans">
                                    <asp:Label ID="lblCurrentAddress" runat="server"></asp:Label>
                                </div>
                                <div class="prdtl-vrfy">
                                    <asp:RadioButton ID="rblCurrentAddressYes" GroupName="CurrentAddress" Text="Yes" runat="server" />
                                    <asp:RadioButton ID="rblCurrentAddressNo" GroupName="CurrentAddress" Text="No" runat="server" />
                                </div>
                                <span class="helpicon"><i id="icCurrentAddress" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-3">
                                <input type="button" value="Add Remarks" id="btnCurrentAddress" />
                                <input id="txtCurrentAddress" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>
                    </div>
                </div>               
                <div class="list-group-item" id="residential" runat="server" style="display: none">
                    <div class="form-group m-0" role="Residential" aria-labelledby="label-Residential ">
                        <div class="form-row">
                            <label id="labelResidential" runat="server" for="title" class="col-md-2 col-form-label form-label">Current Residential  Address</label>
                            <div class="col-md-6">
                                <div class="prdtl-ans">
                                    <asp:Label ID="lblResidential" runat="server"></asp:Label>
                                </div>
                                <div class="prdtl-vrfy">
                                    <asp:RadioButton ID="rblResidentialYes" GroupName="Residential" Text="Yes" runat="server" />
                                    <asp:RadioButton ID="rblResidentialNo" GroupName="Residential" Text="No" runat="server" />
                                </div>
                                <span class="helpicon"><i id="icResedentail" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-3">
                                <input type="button" value="Add Remarks" id="btnResidential" />
                                <input id="txtResidential" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="addressHistory" runat="server" style="display: none">
                    <div class="form-group m-0" role="group" aria-labelledby="label-prevaddress">
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
                        <div class="form-row">
                            <label id="lblPrevAddress" runat="server" for="prevaddress" class="col-md-3 col-form-label form-label">Previous Address History Details</label>
                            <div class="col-md-4">
                                <asp:Label ID="lblPrevAddStartDate" runat="server"></asp:Label>
                                <asp:Label ID="lblPrevAddEndDate" runat="server"></asp:Label>
                                <asp:Label ID="lblprevAddress1" runat="server"></asp:Label>
                                <asp:Label ID="lblprevAddress2" runat="server"></asp:Label>
                                <asp:Label ID="lblprevAddress3" runat="server"></asp:Label>
                                <asp:Label ID="lblprevAddressCity" runat="server"></asp:Label>
                                <asp:Label ID="lblprevAddressState" runat="server"></asp:Label>
                                <asp:Label ID="lblprevAddressPostalCode" runat="server"></asp:Label>
                                <asp:Label ID="lblPrevAddressCountry" runat="server"></asp:Label>
                                <asp:RadioButton ID="rblAddressHistoryYes" GroupName="AddressHistory" Text="Yes" runat="server" />
                                <asp:RadioButton ID="rblAddressHistoryNo" GroupName="AddressHistory" Text="No" runat="server" />
                                <span class="helpicon"><i id="iAddressHistory" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-4">
                                <input type="button" value="Add Remarks" id="btnAddressHistory" />
                                <input id="txtAddressHistory" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>
                        <div id="container"></div>

                    </div>
                </div>
                <div id="guardian" runat="server" style="display: none">

                    <div class="list-group-item" id="guardianname" runat="server" style="display: none">

                        <div class="form-group m-0" role="group" aria-labelledby="label-nomineename">
                            <div class="form-row">
                                <i class="fa fa-check" aria-hidden="true" runat="server" id="isVerifed"></i>
                                <label id="labelguardianname" runat="server" for="nomineename" class="col-md-3 col-form-label form-label">GUARDIAN Full Name</label>
                                <div class="col-md-4">
                                    <asp:Label ID="lblNominneName" runat="server"></asp:Label>
                                    <asp:RadioButton ID="rblNominneNameYes" GroupName="NominneName" Text="Yes" runat="server" />
                                    <asp:RadioButton ID="rblNominneNameNo" GroupName="NominneName" Text="No" runat="server" />
                                    <span class="helpicon"><i id="icNomineeName" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                </div>
                                <div class="col-md-4">
                                    <input type="button" value="Add Remarks" id="btnNominneName" />
                                    <input id="txtGuardianname" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="list-group-item" id="guardianrelation" runat="server" style="display: none">
                        <div class="form-group m-0" role="group" aria-labelledby="label-relationnominee">
                            <div class="form-row">
                                <label id="labelrelation" runat="server" for="relationnominee" class="col-md-3 col-form-label form-label">Relationship with GUARDIAN</label>
                                <div class="col-md-4">
                                    <asp:Label ID="lblNomineeRealtion" runat="server"></asp:Label>
                                    <asp:RadioButton ID="rblNomineeRelationYes" GroupName="NomineeRealtion" Text="Yes" runat="server" />
                                    <asp:RadioButton ID="rblNomineeRelationNo" GroupName="NomineeRealtion" Text="No" runat="server" />
                                    <span class="helpicon"><i id="icNomineeRealation" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                </div>
                                <div class="col-md-4">
                                    <input type="button" value="Add Remarks" id="btnNomineeRelation" />
                                    <input id="txtNomineeRelation" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="list-group-item" id="guardianemail" runat="server" style="display: none">
                        <div class="form-group m-0" role="group" aria-labelledby="label-emailnominee">
                            <div class="form-row">
                                <label id="labelguardianemail" runat="server" for="emailnominee" class="col-md-3 col-form-label form-label">Email of GUARDIAN</label>
                                <div class="col-md-4">
                                    <asp:Label ID="lblNomineeEmail" runat="server"></asp:Label>
                                    <asp:RadioButton ID="rblNomineeEmailYes" GroupName="NomineeEmail" Text="Yes" runat="server" />
                                    <asp:RadioButton ID="rblNomineeEmailNo" GroupName="NomineeEmail" Text="No" runat="server" />
                                    <span class="helpicon"><i id="icNomineeEmail" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                </div>
                                <div class="col-md-4">
                                    <input type="button" value="Add Remarks" id="btnNomineeEmail" />
                                    <input id="txtNomineeEmail" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="list-group-item" id="guardianmobile" runat="server" style="display: none">
                        <div class="form-group m-0" role="group" aria-labelledby="label-mobilenominee">
                            <div class="form-row">
                                <label id="labelguardianmobile" runat="server" for="mobilenominee" class="col-md-3 col-form-label form-label">Mobile/Cellular Number of GUARDIAN</label>
                                <div class="col-md-4">
                                    <asp:Label ID="lblNomineeMobile" runat="server"></asp:Label>
                                    <asp:RadioButton ID="rblNomineeMobileYes" GroupName="NomineeMobile" Text="Yes" runat="server" />
                                    <asp:RadioButton ID="rblNomineeMobileNo" GroupName="NomineeMobile" Text="No" runat="server" />
                                    <span class="helpicon"><i id="icNomineeMobile" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                </div>
                                <div class="col-md-4">
                                    <input type="button" value="Add Remarks" id="btnNomineeMobile" />
                                    <input id="txtNomiineeMobile" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="mainDiv" runat="server"></div>
            <div class="list-group-item" id="employerwebsite">
                <div class="form-group m-0" role="group" aria-labelledby="label-employerwebsite">
                    <div class="form-row">

                        <asp:Button ID="btnSave" runat="server" Text="Save Changes" class="btn btn-success" OnClick="btnSave_Click" OnClientClick="return validaform()"/>
                        <div class="col-md-6">
                            <asp:Label ID="lblMessage" runat="server" Visible="false"></asp:Label>
                            <asp:Label ID="lblSaveTime" runat="server"></asp:Label>
                        </div>
                    </div>
                </div>
            </div>
    
        </div>
    </div>

    <script type="text/javascript">
        $(document).ready(function () {
            //comment box
            
            if ($("#<%=txtEmail.ClientID%>").val() != "")
                ManageRemarksIfNoCheked('<%=txtEmail.ClientID%>', 'btnEmail');
            if ($("#<%=txtMobile.ClientID%>").val() != "")
                ManageRemarksIfNoCheked('<%=txtMobile.ClientID%>', 'btnMobile');
            if ($("#<%=txtHomePhone.ClientID%>").val() != "")
                ManageRemarksIfNoCheked('<%=txtHomePhone.ClientID%>', 'btnHomePhone');
            if ($("#<%=txtSkype.ClientID%>").val() != "")
                ManageRemarksIfNoCheked('<%=txtSkype.ClientID%>', 'btnSkype');
            if ($("#<%=txtSkypeDescription.ClientID%>").val() != "")
                ManageRemarksIfNoCheked('<%=txtSkypeDescription.ClientID%>', 'btnSkypeDescription');
            if ($("#<%=txtWhatsapp.ClientID%>").val() != "")
                ManageRemarksIfNoCheked('<%=txtWhatsapp.ClientID%>', 'btnWhatsapp');
            if ($("#<%=txtWhastappHave.ClientID%>").val() != "")
                ManageRemarksIfNoCheked('<%=txtWhastappHave.ClientID%>', 'btnWhatsapphave');
            if ($("#<%=txtWhatsappDescription.ClientID%>").val() != "")
                ManageRemarksIfNoCheked('<%=txtWhatsappDescription.ClientID%>', 'btnwhatsappDesc');
            if ($("#<%=txtPostalAddress.ClientID%>").val() != "")
                ManageRemarksIfNoCheked('<%=txtPostalAddress.ClientID%>', 'btnPostalAddress');
            if ($("#<%=txtAddress.ClientID%>").val() != "")
                ManageRemarksIfNoCheked('<%=txtAddress.ClientID%>', 'btnAddress');
            if ($("#<%=txtCurrentAddress.ClientID%>").val() != "")
                ManageRemarksIfNoCheked('<%=txtCurrentAddress.ClientID%>', 'btnCurrentAddress');
            if ($("#<%=txtResidential.ClientID%>").val() != "")
                ManageRemarksIfNoCheked('<%=txtResidential.ClientID%>', 'btnResidential');
            if ($("#<%=txtAddressHistory.ClientID%>").val() != "")
                ManageRemarksIfNoCheked('<%=txtAddressHistory.ClientID%>', 'btnAddressHistory');
            if ($("#<%=txtGuardianname.ClientID%>").val() != "")
                ManageRemarksIfNoCheked('<%=txtGuardianname.ClientID%>', 'btnNominneName');
            if ($("#<%=txtNomineeRelation.ClientID%>").val() != "")
                ManageRemarksIfNoCheked('<%=txtNomineeRelation.ClientID%>', 'btnNomineeRelation');
            if ($("#<%=txtNomineeEmail.ClientID%>").val() != "")
                ManageRemarksIfNoCheked('<%=txtNomineeEmail.ClientID%>', 'btnNomineeEmail');
            if ($("#<%=txtNomiineeMobile.ClientID%>").val() != "")
                ManageRemarksIfNoCheked('<%=txtNomiineeMobile.ClientID%>', 'btnNomineeMobile');

            $("#btnEmail").click(function () {
                ManageRemarks('<%=txtEmail.ClientID%>', 'btnEmail');
            });
            $("#<%=rblEmailNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtEmail.ClientID%>', 'btnEmail');
            });
            $("#btnMobile").click(function () {
                ManageRemarks('<%=txtMobile.ClientID%>', 'btnMobile');
            });
            $("#<%=rblMobileNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtMobile.ClientID%>', 'btnMobile');
            });
            $("#btnHomePhone").click(function () {
                ManageRemarks('<%=txtHomePhone.ClientID%>', 'btnHomePhone');
            });
            $("#<%=rblHomePhoneNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtHomePhone.ClientID%>', 'btnHomePhone');
            });

            $("#btnSkype").click(function () {
                ManageRemarks('<%=txtSkype.ClientID%>', 'btnSkype');
            });
            $("#<%=rblSkypeNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtSkype.ClientID%>', 'btnSkype');
            });
            $("#btnSkypeDescription").click(function () {
                ManageRemarks('<%=txtSkypeDescription.ClientID%>', 'btnSkypeDescription');
            });
            $("#<%=rblSkypeDescriptionNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtSkypeDescription.ClientID%>', 'btnSkypeDescription');
            });
            $("#btnWhatsapp").click(function () {
                ManageRemarks('<%=txtWhatsapp.ClientID%>', 'btnWhatsapp');
            });
            $("#<%=rblWhatsappNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtWhatsapp.ClientID%>', 'btnWhatsapp');
            });
            $("#btnWhatsapphave").click(function () {
                ManageRemarks('<%=txtWhastappHave.ClientID%>', 'btnWhatsapphave');
            });
            $("#<%=rblWhatsapphaveNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtWhastappHave.ClientID%>', 'btnWhatsapphave');
            });
            $("#btnwhatsappDesc").click(function () {
                ManageRemarks('<%=txtWhatsappDescription.ClientID%>', 'btnwhatsappDesc');
            });
            $("#<%=rblwhatsappDescNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtWhatsappDescription.ClientID%>', 'btnwhatsappDesc');
            });
            $("#btnPostalAddress").click(function () {
                ManageRemarks('<%=txtPostalAddress.ClientID%>', 'btnPostalAddress');
            });
            $("#<%=rblPostalAddressNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtPostalAddress.ClientID%>', 'btnPostalAddress');
            });
            $("#btnAddress").click(function () {
                ManageRemarks('<%=txtAddress.ClientID%>', 'btnAddress');
            });
            $("#<%=rblAddressNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtAddress.ClientID%>', 'btnAddress');
            });
            $("#btnCurrentAddress").click(function () {
                ManageRemarks('<%=txtCurrentAddress.ClientID%>', 'btnCurrentAddress');
            });
            $("#<%=rblCurrentAddressNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtCurrentAddress.ClientID%>', 'btnCurrentAddress');
            });
            $("#btnResidential").click(function () {
                ManageRemarks('<%=txtResidential.ClientID%>', 'btnResidential');
            });
            $("#<%=rblResidentialNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtResidential.ClientID%>', 'btnResidential');
            });
            $("#btnAddressHistory").click(function () {
                ManageRemarks('<%=txtAddressHistory.ClientID%>', 'btnAddressHistory');
            });
            $("#<%=rblAddressHistoryNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtAddressHistory.ClientID%>', 'btnAddressHistory');
            });
            $("#btnNominneName").click(function () {
                ManageRemarks('<%=txtGuardianname.ClientID%>', 'btnNominneName');
            });
            $("#<%=rblNominneNameNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtGuardianname.ClientID%>', 'btnNominneName');
            });
            $("#btnNomineeRelation").click(function () {
                ManageRemarks('<%=txtNomineeRelation.ClientID%>', 'btnNomineeRelation');
            });
            $("#<%=rblNomineeRelationNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtNomineeRelation.ClientID%>', 'btnNomineeRelation');
            });
            $("#btnNomineeEmail").click(function () {
                ManageRemarks('<%=txtNomineeEmail.ClientID%>', 'btnNomineeEmail');
            });
            $("#<%=rblNomineeEmailNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtNomineeEmail.ClientID%>', 'btnNomineeEmail');
            });
            $("#btnNomineeMobile").click(function () {
                ManageRemarks('<%=txtNomiineeMobile.ClientID%>', 'btnNomineeMobile');
            });
            $("#<%=rblNomineeMobileNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtNomiineeMobile.ClientID%>', 'btnNomineeMobile');
            });


            if ($('#<%=rblEmailNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtEmail.ClientID%>', 'btnEmail');
            if ($('#<%=rblMobileNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtMobile.ClientID%>', 'btnMobile');
            if ($('#<%=rblHomePhoneNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtHomePhone.ClientID%>', 'btnHomePhone');
            if ($('#<%=rblSkypeNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtSkype.ClientID%>', 'btnSkype');
            if ($('#<%=rblSkypeDescriptionNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtSkypeDescription.ClientID%>', 'btnSkypeDescription');
            if ($('#<%=rblWhatsappNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtWhatsapp.ClientID%>', 'btnWhatsapp');
            if ($('#<%=rblWhatsapphaveNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtWhastappHave.ClientID%>', 'btnWhatsapphave');
            if ($('#<%=rblwhatsappDescNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtWhatsappDescription.ClientID%>', 'btnwhatsappDesc');
            if ($('#<%=rblPostalAddressNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtPostalAddress.ClientID%>', 'btnPostalAddress');
            if ($('#<%=rblAddressNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtAddress.ClientID%>', 'btnAddress');
            if ($('#<%=rblCurrentAddressNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtCurrentAddress.ClientID%>', 'btnCurrentAddress');
            if ($('#<%=rblResidentialNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtResidential.ClientID%>', 'btnResidential');
            if ($('#<%=rblAddressHistoryNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtAddressHistory.ClientID%>', 'btnAddressHistory');
            if ($('#<%=rblNominneNameNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtGuardianname.ClientID%>', 'btnNominneName');
            if ($('#<%=rblNomineeRelationNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtNomineeRelation.ClientID%>', 'btnNomineeRelation');
            if ($('#<%=rblNomineeEmailNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtNomineeEmail.ClientID%>', 'btnNomineeEmail');
            if ($('#<%=rblNomineeMobileNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtNomiineeMobile.ClientID%>', 'btnNomineeMobile');

             <%    for (int n = 0; n < CustomControls.Count; n++)
        {
            string btnName = "ContentPlaceHolder1_btn" + CustomControls[n].customfieldid.ToString();
            string txtName = "ContentPlaceHolder1_txt" + CustomControls[n].customfieldid.ToString();
            string rblName = "ContentPlaceHolder1_rblNo" + CustomControls[n].customfieldid.ToString();
        %>
            if ($('#<%=txtName%>').val() != "")
                ManageRemarksIfNoCheked('<%=txtName%>', '<%=btnName%>');

            $("#<%=btnName%>").click(function () {
                ManageRemarks('<%=txtName%>', '<%=btnName%>');
            });
            $("#<%=rblName%>").click(function () {
                ManageRemarks('<%=txtName%>', '<%=btnName%>');
            });
            if ($('#<%=rblName%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtName%>', '<%=btnName%>');

         <%  }%>
            function ManageRemarksIfNoCheked(cntrol, control2) {
                $("#" + cntrol + "").css('display', 'block');
                $("#" + control2 + "").prop('value', 'Hide Comments');
            }
            function ManageRemarks(control1, control2) {
                if ($("#" + control1 + "").is(':hidden')) {
                    $("#" + control1 + "").css('display', 'block');
                    $("#" + control2 + "").prop('value', 'Hide Comments');
                    // $("#btnTwitter").html("Hide Comments");
                }
                else {
                    $("#" + control1 + "").css('display', 'none');
                    // $("#btnTwitter").html("Add Comments")
                    $("#" + control2 + "").prop('value', 'Add Comments');
                }
            }

        });
        function validaform()
        {
            var flag = false;
            if (!$("#<%=email.ClientID%>").is(':hidden') && !($("#<%=rblEmailYes.ClientID%>").is(':checked') || $("#<%=rblEmailNo.ClientID%>").is(':checked'))) 
                alert("Please seclect option for Email");
            else if (!$("#<%=mobile.ClientID%>").is(':hidden') && !($("#<%=rblMobileYes.ClientID%>").is(':checked') || $("#<%=rblMobileNo.ClientID%>").is(':checked'))) 
                alert("Please select option for Mobile Number");
            else if (!$("#<%=phone.ClientID%>").is(':hidden') && $("#<%=rblHomePhoneYes.ClientID%>").is(':checked') && $("#<%=rblHomePhoneNo.ClientID%>").val() == "")
                alert("Please enter comments for Home phone number");
            else if (!$("#<%=skype.ClientID%>").is(':hidden') && !($("#<%=rblSkypeYes.ClientID%>").is(':checked') || $("#<%=rblSkypeNo.ClientID%>").is(':checked'))) 
                alert("Please select option for would you like to connect via skype");
            else if (!$("#<%=skypeDesc.ClientID%>").is(':hidden') && !($("#<%=rblSkypeDescriptionYes.ClientID%>").is(':checked') || $("#<%=rblSkypeDescriptionNo.ClientID%>").is(':checked'))) 
                alert("Please select option for description of skype Id");
            else if (!$("#<%=whatsapp.ClientID%>").is(':hidden') && !($("#<%=rblWhatsappYes.ClientID%>").is(':checked') || $("#<%=rblWhatsappNo.ClientID%>").is(':checked'))) 
                alert("Please select option for would you like to connect via whatsapp");
            else if (!$("#<%=whatsappHave.ClientID%>").is(':hidden') && !($("#<%=rblWhatsapphaveYes.ClientID%>").is(':checked') || $("#<%=rblWhatsapphaveNo.ClientID%>").is(':checked'))) 
                alert("Please select option for Is your whatsapp no same as your mobile number");
            else if (!$("#<%=whatsappDesc.ClientID%>").is(':hidden') && !($("#<%=rblwhatsappDescYes.ClientID%>").is(':checked') || $("#<%=rblwhatsappDescNo.ClientID%>").is(':checked'))) 
                alert("Please select option for Whatsapp Number");
            else if (!$("#<%=postal.ClientID%>").is(':hidden') && !($("#<%=rblPostalAddressYes.ClientID%>").is(':checked') || $("#<%=rblPostalAddressNo.ClientID%>").is(':checked'))) 
                alert("Please select option for Postal Address");
            else if (!$("#<%=address.ClientID%>").is(':hidden') && !($("#<%=rblAddressYes.ClientID%>").is(':checked') || $("#<%=rblAddressNo.ClientID%>").is(':checked'))) 
                alert("Please select option for Is your Postal Address same as your current residential address");
            else if (!$("#<%=residential.ClientID%>").is(':hidden') && !($("#<%=rblResidentialYes.ClientID%>").is(':checked') || $("#<%=rblResidentialNo.ClientID%>").is(':checked'))) 
                alert("Please select option for Current Residential  Address");
            else if (!$("#<%=addressHistory.ClientID%>").is(':hidden') && !($("#<%=rblAddressHistoryYes.ClientID%>").is(':checked') || $("#<%=rblAddressHistoryNo.ClientID%>").is(':checked'))) 
                alert("Please select option for Previous Address History Details");
            else if (!$("#<%=guardianname.ClientID%>").is(':hidden') && !($("#<%=rblNominneNameYes.ClientID%>").is(':checked') || $("#<%=rblNominneNameNo.ClientID%>").is(':checked'))) 
                alert("Please select option for guardian Full Name");
            else if (!$("#<%=guardianrelation.ClientID%>").is(':hidden') && !($("#<%=rblNomineeRelationYes.ClientID%>").is(':checked') || $("#<%=rblNomineeRelationNo.ClientID%>").is(':checked'))) 
                alert("Please select option for Relationship with guardian");
            else if (!$("#<%=guardianemail.ClientID%>").is(':hidden') && !($("#<%=rblNomineeEmailYes.ClientID%>").is(':checked') || $("#<%=rblNomineeEmailNo.ClientID%>").is(':checked'))) 
                alert("Please select option for Email of guardian");
            else if (!$("#<%=guardianmobile.ClientID%>").is(':hidden') && !($("#<%=rblNomineeMobileYes.ClientID%>").is(':checked') || $("#<%=rblNomineeMobileNo.ClientID%>").is(':checked'))) 
                alert("Please select option for Mobile/Cellular Number of guardian");
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
