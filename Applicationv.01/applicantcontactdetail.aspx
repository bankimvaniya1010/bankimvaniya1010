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
                                        <label id="labelemail" runat="server" for="email" class="col-md-3 col-form-label form-label">Email *</label>
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
                                            <asp:DropDownList ID="ddlResidentialCountry" CssClass="form-control" runat="server">
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

        $(function () {
            $('#<%=btn_login.ClientID%>').click(function () {
               
                var summary = "";
                summary += isvalidEmail();
                summary += isvalidMobile();
                summary += isvalidHome();
                summary += isvalidSkype();
                summary += isvalidWhatsapp();
                summary += isvalidPostalAddress();
                summary += isvalidPostalResidentail();
                summary += isvalidResidentailAddress();
                summary += isvalidGuardiandetails();
                 summary = summary.replace(/undefined/g, "");
                if (summary != "") {
                    alert(summary);
                    return false;
                }
                else {
                    return true;
                }
            });
        });

        function isvalidEmail() {

            if ($("#<%=txtEmail.ClientID%>").val() == "") {
                return ("Please enter  e-mail address" + "\n");
            }
            else {

                var userinput = $("#<%=txtEmail.ClientID%>").val();
                var pattern = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;

                if (!pattern.test(userinput)) {
                    return ("Please enter a valid e-mail address" + "\n");
                }
                else {
                    return "";
                }
            }
        }


        function isvalidMobile() {
            if ($("#<%=txtMobile.ClientID%>").val() == "") {
                return ("Please enter mobile no" + "\n");
            }
            else {
                return "";
            }
        }
        function isvalidHome() {

            if ($("#<%=txtHomePhone.ClientID%>").val() == "") {
                return ("Please enter home phone" + "\n");
            }
            else {
                return "";
            }
        }
        function isvalidSkype() {
            if ((($("#<%=rblSkypeNo.ClientID%>").is(":checked")) || ($("#<%=rblSkypeYes.ClientID%>").is(":checked")))) {

                if (($("#<%=txtSkype.ClientID%>").val() == "") && ($("#<%=rblSkypeYes.ClientID%>").is(":checked"))) {
                    return ("Please enter Skype ID" + "\n");
                }

            }
            else {
                return ("Please select if you have Skype ID" + "\n");

            }
        }
        function isvalidWhatsapp() {
            if ((($("#<%=rblwhatsappYes.ClientID%>").is(":checked")) || ($("#<%=rblAddressYes.ClientID%>").is(":checked")))) {
                if ($("#<%=rblwhatsappYes.ClientID%>").is(":checked")) {
                       if (($("#<%=txtWhatsappNo.ClientID%>").val() == "") && ($("#<%=rblwhatsappDif.ClientID%>").is(":checked"))) {
                        return ("Please enter other whats app no" + "\n");
                    }
                }
                else {
                      return ("Please select if you have different or same whatsapp no" + "\n");
                }
            }
            else {
                return ("Please select if you use whatsapp no" + "\n");

            }
        }
        function isvalidResidentailAddress() {

            if ($("#<%=txtResidentialAddress1.ClientID%>").val() == "") {
                return ("Please enter first residential address line" + "\n");
            }

            if ($("#<%=txtResidentialAddress2.ClientID%>").val() == "") {
                return ("Please enter second residential address line" + "\n");
            }

            if ($("#<%=txtResidentialAddress3.ClientID%>").val() == "") {
                return ("Please enter third residential address line" + "\n");
            }

            if ($("#<%=txtResidentialCity.ClientID%>").val() == "") {
                return ("Please enter residential city" + "\n");
            }

            if ($("#<%=txtResidentialState.ClientID%>").val() == "") {
                return ("Please enter residential state" + "\n");
            }

            if ($("#<%=txtResidentialpostal.ClientID%>").val() == "") {
                return ("Please enter residential postal code" + "\n");
            }

        }
        function isvalidResidentailCountry() {
            if ($("#<%=ddlResidentialCountry.ClientID%>").val() == "0") {
                return ("Please select valid residential country" + "\n");
            }
            else {
                return "";

            }
        }
        function isvalidPostalAddress() {

            if ($("#<%=txtAddressLine1.ClientID%>").val() == "") {
                return ("Please enter first postal address line" + "\n");
            }
            if ($("#<%=txtAddressLine2.ClientID%>").val() == "") {
                return ("Please enter second postal address line" + "\n");
            }

            if ($("#<%=txtAddressLine3.ClientID%>").val() == "") {
                return ("Please enter second postal address line" + "\n");
            }

            if ($("#<%=txtCity.ClientID%>").val() == "") {
                return ("Please enter postal city" + "\n");
            }

            if ($("#<%=txtState.ClientID%>").val() == "") {
                return ("Please enter postal state" + "\n");
            }
            if ($("#<%=txtPostal.ClientID%>").val() == "") {
                return ("Please enter postal postal code" + "\n");
            }

            if ($("#<%=ddlpostalCountry.ClientID%>").val() == "0") {
                return ("Please select valid postal country" + "\n");
            }

        }

        function isvalidPostalResidentail() {

            if ((($("#<%=rblAddressNo.ClientID%>").is(":checked")) || ($("#<%=rblAddressYes.ClientID%>").is(":checked")))) {
                // if ($('#enrollmentyear :radio:checked').length > 0) {
                return "";
            }
            else {
                return ("Please select if you have postal and resdentail address is same" + "\n");

            }
        }
        function isvalidGuardiandetails() {
            if ($("#<%=txtNomineeName.ClientID%>").is(":visible")) {

                if ($("#<%=txtNomineeName.ClientID%>").val() == "") {
                    return ("Please enter guardian name" + "\n");
                }
                if ($("#<%=txtMobileNominee.ClientID%>").val() == "") {
                    return ("Please enter guardian mobile no" + "\n");
                }

                if ($("#<%=txtRelationNominee.ClientID%>").val() == "") {
                    return ("Please enter relationships with guardian" + "\n");
                }

                if ($("#<%=txtEmailNominee.ClientID%>").val() == "") {
                    return ("Please enter guardian e-mail address" + "\n");
                }
                else {
                    var userinput = $("#<%=txtEmailNominee.ClientID%>").val();
                    var pattern = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
                    if (!pattern.test(userinput)) {
                        return ("Please enter a valid guardian e-mail address" + "\n");
                    }

                }

            }

        }


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
                $("#<%=skypeDesc.ClientID%>").show()
            } else {
                $("#<%=skypeDesc.ClientID%>").hide()
            }
            var whatsup = $("input[type=radio][name='ctl00$ContentPlaceHolder1$whatsappSame']:checked").val()
            if (whatsup == 'rblWhatsupsameNo') {

                $("#<%=whatsappDesc.ClientID%>").show()
            } else {
                $("#<%=whatsappDesc.ClientID%>").hide()
            }
            var whatsupsame = $("input[type=radio][name='ctl00$ContentPlaceHolder1$whatsapp']:checked").val()
            if (whatsup == 'rblwhatsappYes') {
                $("#<%=whatsappHave.ClientID%>").show()
            } else {
                $("#<%=whatsappHave.ClientID%>").hide()
            }

            var input = document.querySelector("#ContentPlaceHolder1_txtMobileNominee");
            window.intlTelInput(input, {
                utilsScript: "/assets/js/utils.js?1551697588835" // just for formatting/placeholders etc
            });
        });

        $(function () {
            $("input[name='ctl00$ContentPlaceHolder1$skype']").click(function () {

                if ($("#<%=rblSkypeYes.ClientID%>").is(":checked")) {

                    $("#<%=skypeDesc.ClientID%>").show()
                } else {
                    $("#<%=skypeDesc.ClientID%>").hide()
                }
            });
        });
        $(function () {
            $("input[name='ctl00$ContentPlaceHolder1$whatsappSame']").click(function () {
                if ($("#<%=rblWhatsupsameNo.ClientID%>").is(":checked")) {

                    $("#<%=whatsappDesc.ClientID%>").show()
                } else {
                    $("#<%=whatsappDesc.ClientID%>").hide()
                }

            });
        });
        $(function () {
            $("input[name='ctl00$ContentPlaceHolder1$whatsapp']").click(function () {
                if ($("#<%=rblwhatsappYes.ClientID%>").is(":checked")) {

                    $("#<%=whatsappHave.ClientID%>").show()
                } else {
                    $("#<%=whatsappHave.ClientID%>").hide()
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
