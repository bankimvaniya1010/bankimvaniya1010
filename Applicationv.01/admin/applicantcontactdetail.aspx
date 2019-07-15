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
                            <label id="labelemail" runat="server" for="email" class="col-md-3 col-form-label form-label">Email *</label>
                            <div class="col-md-4">
                                <asp:Label ID="lblEmail" runat="server"></asp:Label>
                                <span class="helpicon"><i id="icEmail" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-4">
                                <input id="txtEmail" runat="server" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="mobile" runat="server" style="display: none">
                    <div class="form-group m-0" role="group" aria-labelledby="label-Mobile">
                        <div class="form-row">
                            <label id="labelMobile" runat="server" for="Mobile" class="col-md-3 col-form-label form-label">Mobile/Cellular Number *</label>
                            <div class="col-md-4">
                                <asp:Label ID="lblMobile" runat="server"></asp:Label>
                                <span class="helpicon"><i id="icMobile" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-4">
                                <input id="txtMobile" runat="server" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="phone" runat="server" style="display: none">
                    <div class="form-group m-0" role="group" aria-labelledby="label-phone">
                        <div class="form-row">
                            <label id="labelphone" runat="server" for="phone" class="col-md-3 col-form-label form-label">Home phone</label>
                            <div class="col-md-4">
                                <asp:Label ID="lblHomePhone" runat="server"></asp:Label>
                                <span class="helpicon"><i id="icHomePhone" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-4">
                                <input id="txtHomePhone" runat="server" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="skype" runat="server" style="display: none">
                    <div class="form-group m-0" role="group" aria-labelledby="label-skype">
                        <div class="form-row">
                            <label id="labelskype" runat="server" for="skype" class="col-md-3 col-form-label form-label">WOULD YOU LIKE TO CONNECT VIA SKYPE</label>
                            <div class="col-md-4">
                                <asp:Label ID="lblSkype" runat="server"></asp:Label>
                                <span class="helpicon"><i id="icSkype" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-4">
                                <input id="txtSkype" runat="server" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>
                    </div>
                </div>

                <div class="list-group-item" id="skypeDesc" runat="server" style="display: none">
                    <div class="form-group m-0" role="group" aria-labelledby="label-skypeDesc">
                        <div class="form-row">
                            <label id="labelskypeDesc" runat="server" for="skypeDesc" class="col-md-3 col-form-label form-label">Skype ID</label>
                            <div class="col-md-4">
                                <asp:Label ID="lblSkypeDescription" runat="server"></asp:Label>
                                <span class="helpicon"><i id="icSkypeDesc" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-4">
                                <input id="txtSkypeDescription" runat="server" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="whatsapp" runat="server" style="display: none">
                    <div class="form-group m-0" role="group" aria-labelledby="label-whatsapp">
                        <div class="form-row">
                            <label id="labelwhatsapp" runat="server" for="whatsapp" class="col-md-3 col-form-label form-label">WOULD YOU LIKE TO CONNECT VIA WHATSAPP </label>
                            <div class="col-md-4">
                                <asp:Label ID="lblWhatsapp" runat="server"></asp:Label>
                                <span class="helpicon"><i id="icWhatsapp" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>

                            </div>
                            <div class="col-md-4">
                                <input id="txtWhatsapp" runat="server" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="whatsappHave" runat="server" style="display: none">
                    <div class="form-group m-0" role="group" aria-labelledby="label-whatsappHave">
                        <div class="form-row">
                            <label id="labelwhatsappHave" runat="server" for="whatsappHave" class="col-md-3 col-form-label form-label">IS YOUR WHATSAPP NO SAME AS YOUR MOBILE NO </label>
                            <div class="col-md-4">
                                <asp:Label ID="lblWhatsapphave" runat="server"></asp:Label>
                                <span class="helpicon"><i id="icWhatsapphave" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-4">
                                <input id="txtWhastappHave" runat="server" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="whatsappDesc" runat="server" style="display: none">
                    <div class="form-group m-0" role="group" aria-labelledby="label-skypeDesc">
                        <div class="form-row">
                            <label id="labelwhatsappDesc" runat="server" for="whatsappDesc" class="col-md-3 col-form-label form-label">Whatsapp Number</label>
                            <div class="col-md-4">
                                <asp:Label ID="lblWhastappDesription" runat="server"></asp:Label>
                                <span class="helpicon"><i id="icWhatsappDesc" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>

                            </div>
                            <div class="col-md-4">
                                <input id="txtWhatsappDescription" runat="server" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="postal" runat="server" style="display: none">
                    <div class="form-group m-0" role="postal" aria-labelledby="label-postal">
                        <div class="form-row">
                            <label id="labelpostal" runat="server" for="postal" class="col-md-3 col-form-label form-label">Postal Address</label>
                            <div class="col-md-4">
                                <asp:Label ID="lblPostalAddress" runat="server"></asp:Label>
                                <span class="helpicon"><i id="icPostal" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-4">
                                <input id="txtPostalAddress" runat="server" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="address" runat="server" style="display: none">
                    <div class="form-group m-0" role="group" aria-labelledby="label-address">
                        <div class="form-row">
                            <label id="labeladdress" runat="server" for="address" class="col-md-3 col-form-label form-label">Is your Postal Address same as your current residential address</label>
                            <div class="col-md-4">
                                <asp:Label ID="lblAddress" runat="server"></asp:Label>
                                <span class="helpicon"><i id="icAddress" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-4">
                                <input id="txtAddress" runat="server" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>
                        <div class="form-row">
                            <label id="labelCurrentAddress" runat="server" for="currentAddressSelection" class="col-md-3 col-form-label form-label">Have you been living in the current address for Less than 1 year?</label>
                            <div class="col-md-4">
                                <asp:Label ID="lblCurrentAddress" runat="server"></asp:Label>
                                <span class="helpicon"><i id="icCurrentAddress" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-4">
                                <input id="txtCurrentAddress" runat="server" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="residential" runat="server" style="display: none">
                    <div class="form-group m-0" role="Residential" aria-labelledby="label-Residential ">
                        <div class="form-row">
                            <label id="labelResidential" runat="server" for="title" class="col-md-3 col-form-label form-label">Current Residential  Address</label>
                            <div class="col-md-4">
                                <asp:Label ID="lblResidential" runat="server"></asp:Label>
                                <span class="helpicon"><i id="icResedentail" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-4">
                                <input id="txtResidential" runat="server" type="text" class="form-control" placeholder="Admin Comments">
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

                                <span class="helpicon"><i id="iAddressHistory" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-4">
                                <input id="txtAddressHistory" runat="server" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>
                        <div id="container"></div>

                    </div>
                </div>
                <div id="guardian" runat="server" visible="false">
                   
                    <div class="list-group-item" id="guardianname" runat="server" style="display: none">
                       
                        <div class="form-group m-0" role="group" aria-labelledby="label-nomineename">
                            <div class="form-row">
                               <i class="fa fa-check" aria-hidden="true" runat="server" id="isVerifed"></i>  <label id="labelguardianname" runat="server" for="nomineename" class="col-md-3 col-form-label form-label">GUARDIAN Full Name</label>
                                <div class="col-md-4">
                                    <asp:Label ID="lblNominneName" runat="server"></asp:Label>
                                    <span class="helpicon"><i id="icNomineeName" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                </div>
                                <div class="col-md-4">
                                    <input id="txtGuardianname" runat="server" type="text" class="form-control" placeholder="Admin Comments">
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
                                    <span class="helpicon"><i id="icNomineeRealation" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                </div>
                                <div class="col-md-4">
                                    <input id="txtNomineeRelation" runat="server" type="text" class="form-control" placeholder="Admin Comments">
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
                                    <span class="helpicon"><i id="icNomineeEmail" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                </div>
                                <div class="col-md-4">
                                    <input id="txtNomineeEmail" runat="server" type="text" class="form-control" placeholder="Admin Comments">
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
                                    <span class="helpicon"><i id="icNomineeMobile" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                </div>
                                <div class="col-md-4">
                                    <input id="txtNomiineeMobile" runat="server" type="text" class="form-control" placeholder="Admin Comments">
                                </div>
                            </div>
                        </div>
                    </div></div>
                </div>
                <div id="mainDiv" runat="server"></div>
                <div class="list-group-item" id="employerwebsite">
                    <div class="form-group m-0" role="group" aria-labelledby="label-employerwebsite">
                        <div class="form-row">

                            <asp:Button ID="btnSave" runat="server" Text="Save Changes" class="btn btn-success" OnClick="btnSave_Click" />
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

</asp:Content>
