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

                        <div class="list-group list-group-fit">
                            <div class="list-group-item" id="email" runat="server" style="display: none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-email">
                                    <div class="form-row">
                                        <label id="labelemail" runat="server" for="email" class="col-md-3 col-form-label form-label">Email *</label>
                                        <div class="col-md-6">
                                            <input id="txtEmail" runat="server" type="text" placeholder="email" value="" required="" class="form-control"><span class="helpicon"><i id="icEmail" runat="server" class="fa fa-question-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="mobile" runat="server" style="display: none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-Mobile">
                                    <div class="form-row">
                                        <label id="labelMobile" runat="server" for="Mobile" class="col-md-3 col-form-label form-label">Mobile/Cellular Number *</label>
                                        <div class="col-md-6">
                                            <input id="txtMobile" runat="server" type="text" placeholder="Mobile/Cellular Number" value="" class="form-control"><span class="helpicon"><i id="icMobile" runat="server" class="fa fa-question-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="phone" runat="server" style="display: none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-phone">
                                    <div class="form-row">
                                        <label id="labelphone" runat="server" for="phone" class="col-md-3 col-form-label form-label">Home phone</label>
                                        <div class="col-md-6">
                                            <input id="txtHomePhone" runat="server" type="text" class="form-control" placeholder="Home phone"><span class="helpicon"><i id="icHomePhone" runat="server" class="fa fa-question-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="skype" runat="server" style="display: none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-skype">
                                    <div class="form-row">
                                        <label id="labelskype" runat="server" for="skype" class="col-md-3 col-form-label form-label">WOULD YOU LIKE TO CONNECT VIA SKYPE</label>
                                        <div class="col-md-6">
                                            <asp:RadioButton ID="rblSkypeYes" runat="server" CssClass="form-control" GroupName="skype" Text="Yes" />
                                            <asp:RadioButton ID="rblSkypeNo" runat="server" CssClass="form-control" GroupName="skype" Text="No" /><span class="helpicon"><i id="icSkype" runat="server" class="fa fa-question-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="list-group-item" id="skypeDesc" runat="server" style="display: none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-skypeDesc">
                                    <div class="form-row">
                                        <label id="labelskypeDesc" runat="server" for="skypeDesc" class="col-md-3 col-form-label form-label">Skype ID</label>
                                        <div class="col-md-6">
                                            <asp:TextBox ID="txtSkype" runat="server" CssClass="form-control"></asp:TextBox><span class="helpicon"><i id="icSkypeDesc" runat="server" class="fa fa-question-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="whatsapp" runat="server" style="display: none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-whatsapp">
                                    <div class="form-row">
                                        <label id="labelwhatsapp" runat="server" for="whatsapp" class="col-md-3 col-form-label form-label">WOULD YOU LIKE TO CONNECT VIA WHATSAPP </label>
                                        <div class="col-md-6">
                                            <asp:RadioButton ID="rblwhatsappYes" runat="server" CssClass="form-control" GroupName="whatsapp" Text="Yes" />
                                            <asp:RadioButton ID="rblwhatsappNo" runat="server" CssClass="form-control" GroupName="whatsapp" Text="No" /><span class="helpicon"><i id="icWhatsapp" runat="server" class="fa fa-question-circle" style="display: none;"></i></span>

                                        </div>
                                    </div>
                                </div>
                            </div>                            
                            <div class="list-group-item" id="whatsappHave" runat="server" style="display: none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-whatsappHave">
                                    <div class="form-row">
                                        <label id="labelwhatsappHave" runat="server" for="whatsappHave" class="col-md-3 col-form-label form-label">IS YOUR WHATSAPP NO SAME AS YOUR MOBILE NO </label>
                                        <div class="col-md-6">
                                            <asp:RadioButton ID="rblWhatsupsameYes" runat="server" CssClass="form-control" GroupName="whatsappSame" Text="Yes" />
                                            <asp:RadioButton ID="rblWhatsupsameNo" runat="server" CssClass="form-control" GroupName="whatsappSame" Text="No" /><span class="helpicon"><i id="icWhatsapphave" runat="server" class="fa fa-question-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>   
                            <div class="list-group-item" id="whatsappDesc" runat="server" style="display: none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-skypeDesc">
                                    <div class="form-row">
                                        <label id="labelwhatsappDesc" runat="server" for="whatsappDesc" class="col-md-3 col-form-label form-label">Whatsapp Number</label>
                                        <div class="col-md-6">
                                            <asp:TextBox ID="txtWhatsappNo" runat="server" CssClass="form-control"></asp:TextBox><span class="helpicon"><i id="icWhatsappDesc" runat="server" class="fa fa-question-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="postal" runat="server" style="display: none">
                                <div class="form-group m-0" role="postal" aria-labelledby="label-postal">
                                    <div class="form-row">
                                        <label id="labelpostal" runat="server" for="postal" class="col-md-3 col-form-label form-label">Postal Address</label>
                                        <div class="col-md-6">
                                            <input id="txtAddressLine1" runat="server" type="text" placeholder="Address line 1" value="" class="form-control"> <span class="helpicon"><i id="icPostal" runat="server" class="fa fa-question-circle" style="display: none;"></i></span>
                                            <input id="txtAddressLine2" runat="server" type="text" placeholder="Address line 2" value="" class="form-control">
                                            <input id="txtAddressLine3" runat="server" type="text" placeholder="Address line 3" value="" class="form-control">
                                            <input id="txtCity" runat="server" type="text" placeholder="City, Town or Suburb" value="" class="form-control">
                                            <input id="txtState" runat="server" type="text" placeholder="State" value="" class="form-control">
                                            <input id="txtPostal" runat="server" type="text" placeholder="Postal" value="" class="form-control">
                                            <asp:DropDownList ID="ddlpostalCountry" CssClass="form-control" runat="server">
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="address" runat="server" style="display: none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-address">
                                    <div class="form-row">
                                        <label id="labeladdress" runat="server" for="address" class="col-md-3 col-form-label form-label">Is your Postal Address same as your current residential address</label>
                                        <div class="col-md-6">
                                            <asp:RadioButton ID="rblAddressYes" runat="server" CssClass="form-control" GroupName="address" Text="Yes" />
                                            <asp:RadioButton ID="rblAddressNo" runat="server" CssClass="form-control" GroupName="address" Text="No" /><span class="helpicon"><i id="icAddress" runat="server" class="fa fa-question-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                    <div class="form-row">
                                        <label id="labelCurrentAddress" runat="server" for="currentAddressSelection" class="col-md-3 col-form-label form-label">Have you been living in the current address for Less than 1 year?</label>
                                        <div class="col-md-6">
                                            <asp:RadioButton ID="rblCurrentAddYes" runat="server" CssClass="form-control" GroupName="currentAddressSelection" Text="Yes" />
                                            <asp:RadioButton ID="rblCurrentAddNo" runat="server" CssClass="form-control" GroupName="currentAddressSelection" Text="No" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="residential" runat="server" style="display: none">
                                <div class="form-group m-0" role="Residential" aria-labelledby="label-Residential ">
                                    <div class="form-row">
                                        <label id="labelResidential" runat="server" for="title" class="col-md-3 col-form-label form-label">Current Residential  Address</label>
                                        <div class="col-md-6">

                                            <input id="txtResidentialAddress1" runat="server" type="text" placeholder="Address line 1" value="" class="form-control"><span class="helpicon"><i id="icResedentail" runat="server" class="fa fa-question-circle" style="display: none;"></i></span>
                                            <input id="txtResidentialAddress2" runat="server" type="text" placeholder="Address line 2" value="" class="form-control">
                                            <input id="txtResidentialAddress3" runat="server" type="text" placeholder="Address line 3" value="" class="form-control">
                                            <input id="txtResidentialCity" runat="server" type="text" placeholder="City, Town or Suburb" value="" class="form-control">
                                            <input id="txtResidentialState" runat="server" type="text" placeholder="State" value="" class="form-control">
                                            <input id="txtResidentialpostal" runat="server" type="text" placeholder="Postal code" value="" class="form-control">
                                            <asp:DropDownList ID="ddlResidentialCountry" CssClass="form-control" runat="server">
                                            </asp:DropDownList>

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
                                        <div class="col-md-6">
                                            <input id="txtPrevAddStartDate" runat="server" type="text" class="form-control" placeholder="Start Date" data-toggle="flatpickr" value="">
                                            <input id="txtPrevAddEndDate" runat="server" type="text" class="form-control" placeholder="End Date" data-toggle="flatpickr" value="">
                                            <input id="prevAddress1" runat="server" type="text" placeholder="Address line 1" value="" class="form-control">
                                            <input id="prevAddress2" runat="server" type="text" placeholder="Address line 2" value="" class="form-control">
                                            <input id="prevAddress3" runat="server" type="text" placeholder="Address line 3" value="" class="form-control">
                                            <input id="prevAddressCity" runat="server" type="text" placeholder="City, Town or Suburb" value="" class="form-control">
                                            <input id="prevAddressState" runat="server" type="text" placeholder="State" value="" class="form-control">
                                            <input id="prevAddressPostalCode" runat="server" type="text" placeholder="Postal code" value="" class="form-control">
                                            <asp:DropDownList ID="ddlPrevAddressCountry" CssClass="form-control" runat="server">
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div id="container"></div>
                                    <input id="addPrevAddressDiv" type="button" class="btn btn-success" value="Add More" />
                                </div>
                            </div>
                            <div id="guardian" runat="server" visible="false">
                                <div class="form-row" style="margin-left: 25px">
                                    <label id="gurdianmessgae" runat="server" for="gurdian" class="col-md-9 col-form-label form-label">You age today is #Year# Years and #Month# Months. Please provide the name & details of your authorized Guardian</label>

                                </div>
                                <div class="list-group-item" id="guardianname" runat="server" style="display: none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-nomineename">
                                        <div class="form-row">
                                            <label id="labelguardianname" runat="server" for="nomineename" class="col-md-3 col-form-label form-label">GUARDIAN Full Name</label>
                                            <div class="col-md-6">
                                                <input id="txtNomineeName" runat="server" type="text" placeholder="Nominee Full Name" value="" class="form-control"><span class="helpicon"><i id="icNomineeName" runat="server" class="fa fa-question-circle" style="display: none;"></i></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item" id="guardianrelation" runat="server" style="display: none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-relationnominee">
                                        <div class="form-row">
                                            <label id="labelrelation" runat="server" for="relationnominee" class="col-md-3 col-form-label form-label">Relationship with GUARDIAN</label>
                                            <div class="col-md-6">
                                                <input id="txtRelationNominee" runat="server" type="text" placeholder="Relationship with Nominee" value="" class="form-control"><span class="helpicon"><i id="icNomineeRealation" runat="server" class="fa fa-question-circle" style="display: none;"></i></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item" id="guardianemail" runat="server" style="display: none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-emailnominee">
                                        <div class="form-row">
                                            <label id="labelguardianemail" runat="server" for="emailnominee" class="col-md-3 col-form-label form-label">Email of GUARDIAN</label>
                                            <div class="col-md-6">
                                                <input id="txtEmailNominee" runat="server" type="text" class="form-control" placeholder="Email of Nominee"><span class="helpicon"><i id="icNomineeEmail" runat="server" class="fa fa-question-circle" style="display: none;"></i></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item" id="guardianmobile" runat="server" style="display: none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-mobilenominee">
                                        <div class="form-row">
                                            <label id="labelguardianmobile" runat="server" for="mobilenominee" class="col-md-3 col-form-label form-label">Mobile/Cellular Number of GUARDIAN</label>
                                            <div class="col-md-6">
                                                <input id="txtMobileNominee" runat="server" type="text" class="form-control" placeholder="Mobile/Cellular Number of Nominee"><span class="helpicon"><i id="icNomineeMobile" runat="server" class="fa fa-question-circle" style="display: none;"></i></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div id="mainDiv" runat="server"></div>
                            <div class="list-group-item" id="employerwebsite">
                                <div class="form-group m-0" role="group" aria-labelledby="label-employerwebsite">
                                    <div class="form-row">
                                        <a href="knowyourstudent.aspx" class="btn btn-success" style="margin-right: 10px;">Identification Details</a>
                                        <asp:Button ID="btn_login" runat="server" Text="Save Changes" OnClientClick="return validateForm()" CssClass="btn btn-success" OnClick="btn_login_Click" />
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

        $('#ContentPlaceHolder1_txtPrevAddStartDate').flatpickr({

            dateFormat: 'Y-m-d', defaultDate: ""
        });
        $('#ContentPlaceHolder1_txtPrevAddEndDate').flatpickr({
            dateFormat: 'Y-m-d', defaultDate: ""
        });

        function isvalidPreviousResidentialAddressDates() {
            var startDate = new Date($("#<%=txtPrevAddStartDate.ClientID%>").val());
            var endDate = new Date($("#<%=txtPrevAddEndDate.ClientID%>").val());
            if (startDate > endDate) {
                alert("Please enter valid previous residential start date and end date.");
                return false;
            }

            return true;
        }

        function isvalidAllAddressDetails() {
            var flag = false;
            if ((!$("#<%=addressHistory.ClientID%>").is(':hidden')) && ($("#<%=txtPrevAddStartDate.ClientID%>").val() == ""))
                alert("Please enter previous residential address start date");
            else if ((!$("#<%=addressHistory.ClientID%>").is(':hidden')) && ($("#<%=txtPrevAddEndDate.ClientID%>").val() == ""))
                alert("Please enter previous residential address end date");
            else if ((!$("#<%=addressHistory.ClientID%>").is(':hidden')) && ($("#<%=prevAddress1.ClientID%>").val() == ""))
                alert("Please enter previous first residential address line");
            else if ((!$("#<%=addressHistory.ClientID%>").is(':hidden')) && ($("#<%=prevAddress2.ClientID%>").val() == ""))
                alert("Please enter previous second residential address line");
            else if ((!$("#<%=addressHistory.ClientID%>").is(':hidden')) && ($("#<%=prevAddress3.ClientID%>").val() == ""))
                alert("Please enter previous third residential address line");
            else if ((!$("#<%=addressHistory.ClientID%>").is(':hidden')) && ($("#<%=prevAddressCity.ClientID%>").val() == ""))
                alert("Please enter previous residential city");
            else if ((!$("#<%=addressHistory.ClientID%>").is(':hidden')) && ($("#<%=prevAddressState.ClientID%>").val() == ""))
                alert("Please enter previous residential state");
            else if ((!$("#<%=addressHistory.ClientID%>").is(':hidden')) && ($("#<%=prevAddressPostalCode.ClientID%>").val() == ""))
                alert("Please enter previous residential postal code");
            else if ((!$("#<%=addressHistory.ClientID%>").is(':hidden')) && ($("#<%=ddlPrevAddressCountry.ClientID%>").val() == "0"))
                alert("Please enter previous residential Country");
            else if (!$("#<%=addressHistory.ClientID%>").is(':hidden') && !isvalidPreviousResidentialAddressDates()) { }
            else
                flag = true;

            var allAddressCount = $("#<%=hidAddressHistory.ClientID %>").val();
            $("#<%=hidAddressStartDate.ClientID %>").val('');
            $("#<%=hidAddressEndDate.ClientID %>").val('');
            $("#<%=hidAddress1.ClientID %>").val('');
            $("#<%=hidAddress2.ClientID %>").val('');
            $("#<%=hidAddress3.ClientID %>").val('');
            $("#<%=hidAddressCity.ClientID %>").val('');
            $("#<%=hidAddressState.ClientID %>").val('');
            $("#<%=hidAddressPostalCode.ClientID %>").val('');
            $("#<%=hidAddressCountry.ClientID %>").val('');

            for (var i = 1; i <= allAddressCount; i++)
            {
                if ((!$("#<%=addressHistory.ClientID%>").is(':hidden')) && ($("#txtPrevAddStartDate_" + i).val() == "")) {
                    alert("Please enter" + (i + 1) + " previous residential address start date");
                    return false;
                }
                else {
                    var data = $("#txtPrevAddStartDate_" + i).val() + ";" + $("#<%=hidAddressStartDate.ClientID %>").val();
                    $("#<%=hidAddressStartDate.ClientID %>").val(data);
                }
                if ((!$("#<%=addressHistory.ClientID%>").is(':hidden')) && ($("#txtPrevAddEndDate_" + i).val() == "")) {
                    alert("Please enter" + (i + 1) +" previous residential address end date");
                    return false;
                }
                else {
                    var data = $("#txtPrevAddEndDate_" + i).val() + ";" + $("#<%=hidAddressEndDate.ClientID %>").val();
                    $("#<%=hidAddressEndDate.ClientID %>").val(data);
                }
                if ((!$("#<%=addressHistory.ClientID%>").is(':hidden')) && ($("#prevAddress1_" + i).val() == "")) {
                    alert("Please enter" + (i + 1) +" previous first residential address line");
                    return false;
                } 
                else {
                    var data = $("#prevAddress1_" + i).val() + ";" + $("#<%=hidAddress1.ClientID %>").val();
                    $("#<%=hidAddress1.ClientID %>").val(data);
                }
                if ((!$("#<%=addressHistory.ClientID%>").is(':hidden')) && ($("#prevAddress2_" + i).val() == "")) {
                    alert("Please enter" + (i + 1) +" previous second residential address line");
                    return false;
                }
                else {
                    var data = $("#prevAddress2_" + i).val() + ";" + $("#<%=hidAddress2.ClientID %>").val();
                    $("#<%=hidAddress2.ClientID %>").val(data);
                }
                if ((!$("#<%=addressHistory.ClientID%>").is(':hidden')) && ($("#prevAddress3_" + i).val() == "")) {
                    alert("Please enter" + (i + 1) +" previous third residential address line");
                    return false;
                }
                else {
                    var data = $("#prevAddress3_" + i).val() + ";" + $("#<%=hidAddress3.ClientID %>").val();
                    $("#<%=hidAddress3.ClientID %>").val(data);
                }
                if ((!$("#<%=addressHistory.ClientID%>").is(':hidden')) && ($("#prevAddressCity_" + i).val() == "")) {
                    alert("Please enter" + (i + 1) +" previous residential city");
                    return false;
                }
                else {
                    var data = $("#prevAddressCity_" + i).val() + ";" + $("#<%=hidAddressCity.ClientID %>").val();
                    $("#<%=hidAddressCity.ClientID %>").val(data);
                }
                if ((!$("#<%=addressHistory.ClientID%>").is(':hidden')) && ($("#prevAddressState_" + i).val() == "")) {
                    alert("Please enter" + (i + 1) +" previous residential state");
                    return false;
                }
                else {
                    var data = $("#prevAddressState_" + i).val() + ";" + $("#<%=hidAddressState.ClientID %>").val();
                    $("#<%=hidAddressState.ClientID %>").val(data);
                }
                if ((!$("#<%=addressHistory.ClientID%>").is(':hidden')) && ($("#prevAddressPostalCode_" + i).val() == "")) {
                    alert("Please enter" + (i + 1) +" previous residential postal code");
                    return false;
                }
                else {
                    var data = $("#prevAddressPostalCode_" + i).val() + ";" + $("#<%=hidAddressPostalCode.ClientID %>").val();
                    $("#<%=hidAddressPostalCode.ClientID %>").val(data);
                }
                if ((!$("#<%=addressHistory.ClientID%>").is(':hidden')) && ($("#ddlPrevAddressCountry_" + i).val() == "0")) {
                    alert("Please enter" + (i + 1) +" previous residential Country");
                    return false;
                }
                else {
                    var data = $('#ddlPrevAddressCountry_'+ i).val() + ";" + $("#<%=hidAddressCountry.ClientID %>").val();
                    $("#<%=hidAddressCountry.ClientID %>").val(data);
                }
                var startDate = new Date($("#txtPrevAddStartDate_" + i).val());
                var endDate = new Date($("#txtPrevAddEndDate_" + i).val());
                if (startDate > endDate) {
                    alert("Please enter" + (i + 1) +" valid previous residential start date and end date.");
                    return false;
                }
            }

            return flag;
        }

        function validateForm() {
            var emailRegex = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
            var flag = false;
            if (!$("#<%=email.ClientID%>").is(':hidden') && $("#<%=txtEmail.ClientID%>").val() == "" || !(emailRegex.test($("#<%=txtEmail.ClientID%>").val())))
                alert("Please enter Valid e-mail address");
            else if (!$("#<%=mobile.ClientID%>").is(':hidden') && $("#<%=txtMobile.ClientID%>").val() == "")
                alert("Please enter mobile no");
            else if (!$("#<%=phone.ClientID%>").is(':hidden') && $("#<%=txtHomePhone.ClientID%>").val() == "")
                alert("Please enter home phone");          
            else if (!$("#<%=skype.ClientID%>").is(':hidden') && !($("#<%=rblSkypeYes.ClientID%>").is(':checked') || $("#<%=rblSkypeNo.ClientID%>").is(':checked')))
                alert("Please Select Option to record your Skype ID");
            else if (!$("#<%=skype.ClientID%>").is(':hidden') && $("#<%=rblSkypeYes.ClientID%>").is(':checked') && $("#<%=txtSkype.ClientID%>").val() == "")
                alert("Please enter enter Skype ID");  
                
             //whatsapp   
            else if (!$("#<%=whatsapp.ClientID%>").is(':hidden') && !($("#<%=rblwhatsappYes.ClientID%>").is(':checked') || $("#<%=rblwhatsappNo.ClientID%>").is(':checked')))
                alert("Please Select Option to record your whatsapp detail");
            else if (!$("#<%=whatsapp.ClientID%>").is(':hidden') && $("#<%=rblwhatsappYes.ClientID%>").is(':checked') && !($("#<%=rblWhatsupsameYes.ClientID%>").is(':checked') || $("#<%=rblWhatsupsameNo.ClientID%>").is(':checked')))
                alert("Please Select Is Your Whatsapp No is Same As Your Mobile No");
            else if (!$("#<%=whatsapp.ClientID%>").is(':hidden') && !$("#<%=whatsappHave.ClientID%>").is(':hidden') && $("#<%=rblWhatsupsameNo.ClientID%>").is(':checked') && $("#<%=txtWhatsappNo.ClientID%>").val() == "")
                alert("Please Enter New Whatsapp Number ");
                //postal 
            else if (!$("#<%=postal.ClientID%>").is(':hidden') && $("#<%=txtAddressLine1.ClientID%>").val() == "")
                alert("Please enter first postal address line");
            else if (!$("#<%=postal.ClientID%>").is(':hidden') && $("#<%=txtAddressLine2.ClientID%>").val() == "")
                alert("Please enter second postal address line");
            else if (!$("#<%=postal.ClientID%>").is(':hidden') && $("#<%=txtAddressLine3.ClientID%>").val() == "")
                alert("Please enter third postal address line");
            else if (!$("#<%=postal.ClientID%>").is(':hidden') && $("#<%=txtCity.ClientID%>").val() == "")
                alert("Please enter postal city");
            else if (!$("#<%=postal.ClientID%>").is(':hidden') && $("#<%=txtState.ClientID%>").val() == "")
                alert("Please enter postal state");
            else if (!$("#<%=postal.ClientID%>").is(':hidden') && $("#<%=txtPostal.ClientID%>").val() == "")
                alert("Please enter postal postal code");
            else if (!$("#<%=postal.ClientID%>").is(':hidden') && $("#<%=ddlpostalCountry.ClientID%>").val() == "0")
                 alert("Please select valid postal country");
            else if (!$("#<%=address.ClientID%>").is(':hidden') && !($("#<%=rblAddressYes.ClientID%>").is(':checked') || $("#<%=rblAddressNo.ClientID%>").is(':checked')))
                 alert("Please Select Option to record is your postal and residentail address is same");
            else if (!$("#<%=address.ClientID%>").is(':hidden') && $("#<%=rblAddressNo.ClientID%>").is(':checked'))
            {
                if ((!$("#<%=residential.ClientID%>").is(':hidden')) && ($("#<%=txtResidentialAddress1.ClientID%>").val() == ""))
                    alert("Please enter first residential address line");
                else if ((!$("#<%=residential.ClientID%>").is(':hidden')) && ($("#<%=txtResidentialAddress2.ClientID%>").val() == ""))
                    alert("Please enter second residential address line");
                else if ((!$("#<%=residential.ClientID%>").is(':hidden')) && ($("#<%=txtResidentialAddress3.ClientID%>").val() == ""))
                    alert("Please enter third residential address line");
                else if ((!$("#<%=residential.ClientID%>").is(':hidden')) && ($("#<%=txtResidentialCity.ClientID%>").val() == ""))
                    alert("Please enter residential city");
                else if ((!$("#<%=residential.ClientID%>").is(':hidden')) && ($("#<%=txtResidentialState.ClientID%>").val() == ""))
                    alert("Please enter residential state");
                else if ((!$("#<%=residential.ClientID%>").is(':hidden')) && ($("#<%=txtResidentialpostal.ClientID%>").val() == ""))
                    alert("Please enter residential postal code");
                else if ((!$("#<%=residential.ClientID%>").is(':hidden')) && ($("#<%=ddlResidentialCountry.ClientID%>").val() == "0"))
                    alert("Please enter residential Country");
            }
            else if (!$("#<%=addressHistory.ClientID%>").is(':hidden') && !($("#<%=rblCurrentAddYes.ClientID%>").is(':checked') || $("#<%=rblCurrentAddNo.ClientID%>").is(':checked')))
                 alert("Please Select Option to record your previous residential address.");
            else if (!$("#<%=addressHistory.ClientID%>").is(':hidden') && $("#<%=rblCurrentAddYes.ClientID%>").is(':checked') && !isvalidAllAddressDetails()) { }
            else if ((!$("#<%=guardianname.ClientID%>").is(':hidden')) && ($("#<%=txtNomineeName.ClientID%>").val() == ""))
                alert("Please enter guardianname name" + "\n");            
            else if ((!$("#<%=guardianrelation.ClientID%>").is(':hidden')) && ($("#<%=txtRelationNominee.ClientID%>").val() == ""))
                alert("Please enter relationships with guardian");           
            else if ((!$("#<%=guardianemail.ClientID%>").is(':hidden')) && (($("#<%=txtEmailNominee.ClientID%>").val() == "") && (!emailRegex.test($("#<%=txtEmailNominee.ClientID%>").val()))))
                alert("Please enter guardian e-mail address");
            else if ((!$("#<%=guardianmobile.ClientID%>").is(':hidden')) && ($("#<%=txtMobileNominee.ClientID%>").val() == ""))
                alert("Please enter guardian mobile no");
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
            TextBox txtDynamic = (TextBox)mainDiv.FindControl("txt" + CustomControls[k].customfieldid);
            var Description = CustomControls[k].labeldescription.ToLower();
                    %>

             if ($("#<%=txtDynamic.ClientID%>").val() == "") {
                 alert("Please enter <%= Description%>" + "\n");
                 flag = false;
                 return false;
             }
             else
                 flag = true;
               <% }%>
            return flag;
        }

        $(document).ready(function () {

           $('.fa-question-circle').tipso({
				position: 'right',
				background: 'rgba(0,0,0,0.8)',
				useTitle: false,
			});

            if (!$("#<%=skype.ClientID%>").is(':hidden') && $("#<%=rblSkypeYes.ClientID%>").is(':checked'))
                $("#<%=skypeDesc.ClientID%>").show();
            else
                $("#<%=skypeDesc.ClientID%>").hide();


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

            if (!$("#<%=postal.ClientID%>").is(':hidden') && $("#<%=rblAddressNo.ClientID%>").is(':checked'))
                $("#<%=residential.ClientID%>").show();
            else
                $("#<%=residential.ClientID%>").hide();                

            $("#<%=rblCurrentAddYes.ClientID%>").click(function () {
                $("#<%=addressHistory.ClientID%>").show();
            });

            $("#<%=rblCurrentAddNo.ClientID%>").click(function () {
                $("#<%=hidAddressHistory.ClientID%>").val = 0;
                $("#<%=hidAddressStartDate.ClientID%>").val('');
                $("#<%=hidAddressEndDate.ClientID%>").val('');
                $("#<%=hidAddress1.ClientID%>").val('');
                $("#<%=hidAddress2.ClientID%>").val('');
                $("#<%=hidAddress3.ClientID%>").val('');
                $("#<%=hidAddressState.ClientID%>").val('');
                $("#<%=hidAddressCity.ClientID%>").val('');
                $("#<%=hidAddressPostalCode.ClientID%>").val('');
                $("#<%=hidAddressCountry.ClientID%>").val('');
            });

            $("#addPrevAddressDiv").click(function () {
                var hfPrevAddress = $("#<%=hidAddressHistory.ClientID %>");
                var count = parseInt(hfPrevAddress.val()) + 1;
                hfPrevAddress.val(count);

                //Clone the DropDownList 
                var ddl = $("#<%=ddlPrevAddressCountry.ClientID%>").clone();
                //Set the ID and Name
                ddl.attr("id", "ddlPrevAddressCountry_" + count);
                ddl.attr("name", "ddlPrevAddressCountry_" + count);

                $('#ddlPrevAddressCountry_'+ count).addClass('form-control');

                $("#container").append('<div class="form-row">' +
                    '<label id="lblPrevAddress_' + count + '" for="prevaddress" class="col-md-3 col-form-label form-label">Previous Address History Details</label>' +
                    '<div class="col-md-6">' +
                    '<input id="txtPrevAddStartDate_' + count + '" type="text" class="form-control" placeholder="Start Date" data-toggle="flatpickr" value="" />' +
                    '<input id="txtPrevAddEndDate_' + count + '" type="text" class="form-control" placeholder="End Date" data-toggle="flatpickr" value="" />' +
                    '<input id="prevAddress1_' + count + '" type="text" placeholder="Address line 1" value="" class="form-control" />' +
                    '<input id="prevAddress2_' + count + '" type="text" placeholder="Address line 2" value="" class="form-control" />' +
                    '<input id="prevAddress3_' + count + '" type="text" placeholder="Address line 3" value="" class="form-control" />' +
                    '<input id="prevAddressCity_' + count + '" type="text" placeholder="City, Town or Suburb" value="" class="form-control" />' +
                    '<input id="prevAddressState_' + count + '" type="text" placeholder="State" value="" class="form-control" />' +
                    '<input id="prevAddressPostalCode_' + count + '" type="text" placeholder="Postal code" value="" class="form-control" />');

                $("#container").append(ddl);
                $("#container").append('</div></div>');
                                        
                $('#txtPrevAddStartDate_' + count).flatpickr({

                    dateFormat: 'Y-m-d', defaultDate: ""
                });
                $('#txtPrevAddEndDate_' + count).flatpickr({
                    dateFormat: 'Y-m-d', defaultDate: ""
                });

            });

            if (!$("#<%=mobile.ClientID%>").is(':hidden')) {
                var input = document.querySelector("#<%=txtMobile.ClientID%>");
                window.intlTelInput(input, {
                    utilsScript: "/assets/js/utils.js?1551697588835" // just for formatting/placeholders etc
                });
            }
            if (!$("#<%=phone.ClientID%>").is(':hidden')) {
                var input = document.querySelector("#<%=txtHomePhone.ClientID%>");
                window.intlTelInput(input, {
                    utilsScript: "/assets/js/utils.js?1551697588835" // just for formatting/placeholders etc
                });
            }
            if (!$("#<%=whatsappDesc.ClientID%>").is(':hidden')) {
                var input = document.querySelector("#<%=txtWhatsappNo.ClientID%>");
                window.intlTelInput(input, {
                    utilsScript: "/assets/js/utils.js?1551697588835" // just for formatting/placeholders etc
                });
            }
            if (!$("#<%=guardianmobile.ClientID%>").is(':hidden')) {
                var input = document.querySelector("#<%=txtMobileNominee.ClientID%>");
                window.intlTelInput(input, {
                    utilsScript: "/assets/js/utils.js?1551697588835" // just for formatting/placeholders etc
                });
            }
        });

        $(function () {
            $("input[name='ctl00$ContentPlaceHolder1$skype']").click(function () {

                if ($("#<%=rblSkypeYes.ClientID%>").is(":checked")) {

                    $("#<%=skypeDesc.ClientID%>").show();
                } else {
                    $("#<%=skypeDesc.ClientID%>").hide();
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
        
        $(function () {
            $("input[name='ctl00$ContentPlaceHolder1$address']").click(function () {
                if ($("#<%=rblAddressNo.ClientID%>").is(":checked")) {

                    $("#<%=residential.ClientID%>").show();
                } else {
                    $("#<%=residential.ClientID%>").hide();
                }
            });
        });
      
        $('#ContentPlaceHolder1_dob').flatpickr({

            dateFormat: 'Y-m-d',defaultDate:""
        });

    </script>
</asp:Content>
