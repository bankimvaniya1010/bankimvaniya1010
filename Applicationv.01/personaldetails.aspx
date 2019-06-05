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
                                        <label runat="server" id="labeltitle" for="title" class="col-md-3 col-form-label form-label">* Title</label>
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
    <script type="text/javascript">
        $(function () {
            $('#<%=btn_login.ClientID%>').click(function () {
                debugger;
                var summary = "";
                summary += isvalidTitle();
                summary += isvalidFirstName();
                summary += isvalidLastName();
                summary += isvalidPreferedName();
                summary += isvalidMiddleName();
                summary += isvalidGender();
                summary += isvalidNationality();
                summary += isvalidCountryBirth();
                summary += isvalidMaritalStatus();
                summary += isvalidDisability();
                summary += isvalidAgentDetails();
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
        function isvalidTitle() {
            if ($("#<%=ddlTitle.ClientID%>").val() == "0") {
                return ("Please select valid title name" + "\n");
            }
            else {
                if (($("#<%=ddlTitle.ClientID%>").val() == "7") && ($("#<%=txtTitle.ClientID%>").val() == "")) {
                    return ("Please enter other title" + "\n");
                }
                else {
                    return "";
                }
            }
            return "";
        }

        function isvalidFirstName() {
            if ($("#<%=txtFirstName.ClientID%>").val() == "") {
                return ("Please enter first name" + "\n");
            }
            else {
                return "";
            }
        }
        function isvalidLastName() {

            if ($("#<%=txtLastName.ClientID%>").val() == "") {
                return ("Please enter last name" + "\n");
            }
            else {
                return "";
            }
        }
        function isvalidPreferedName() {

            if ($("#<%=txtPreferedName.ClientID%>").val() == "") {
                return ("Please enter prefered name" + "\n");
            }
            else {
                return "";
            }
        }
        function isvalidMiddleName() {

            if ($("#<%=txtMiddleName.ClientID%>").val() == "") {
                return ("Please enter middlename" + "\n");
            }
            else {
                return "";
            }
        }
        function isvalidGender() {
           if ((($("#<%=rbtnFemale.ClientID%>").is(":checked")) || ($("#<%=rbtnMale.ClientID%>").is(":checked")))) {
                // if ($('#enrollmentyear :radio:checked').length > 0) {
                return "";
            }
            else {
                return ("Please select Gender" + "\n");

            }
        }

        function isvalidNationality() {
            if ($("#<%=ddlNationality.ClientID%>").val() == "0") {
                return ("Please select valid nationality" + "\n");
            }
            else {
                return "";

            }
        }
        function isvalidCountryBirth() {
            if ($("#<%=ddlBirthCountry.ClientID%>").val() == "0") {
                return ("Please select valid  birth country" + "\n");
            }
            else {
                return "";

            }
        }
        function isvalidMaritalStatus() {
            if ($("#<%=ddlMarital.ClientID%>").val() == "0") {
                return ("Please select marital status" + "\n");
            }
            else {
                return "";

            }
        }
        function isvalidDisability() {
             if ((($("#<%=rblDisabilityNo.ClientID%>").is(":checked")) || ($("#<%=rblDisabilityYes.ClientID%>").is(":checked")))) {

                if (($("#<%=ddlDisability.ClientID%>").val() == "0") && ($("#<%=rblDisabilityYes.ClientID%>").is(":checked"))) {
                    return ("Please select valid disability" + "\n");
                }
                else { return ""; }
                return "";
            }
            else {
                return ("Please select have you disability" + "\n");

            }
        }
        function isvalidAgentDetails() {
            if ((($("#<%=rblAgentNo.ClientID%>").is(":checked")) || ($("#<%=rblAgentYes.ClientID%>").is(":checked")))) {

                if (($("#<%=ddlAgent.ClientID%>").val() == "0") && ($("#<%=rblAgentYes.ClientID%>").is(":checked"))) {
                    return ("Please select valid agent details" + "\n");
                }
                else { return ""; }
                return "";
            }
            else {
                return ("Please select have you referred by agent" + "\n");

            }
        }


        $(document).ready(function () {
            $('#<%=ddlTitle.ClientID%>').change(function () {
                if ($('#<%=ddlTitle.ClientID%>').val() == '7') {
                    $('#<%=txtTitle.ClientID%>').css({ 'display': 'block' });
                }
                else { $('#<%=txtTitle.ClientID%>').css({ 'display': 'none' }); }
                if (($(this).val() == '2') || ($(this).val() == '3') || ($(this).val() == '4')) {
                    $('#ContentPlaceHolder1_rbtnFemale').prop("checked", true);
                }
                else { $('#ContentPlaceHolder1_rbtnMale').prop("checked", true); }
            });
            if ($('#<%=ddlTitle.ClientID%>').val() == '7') {
                $('#<%=txtTitle.ClientID%>').css({ 'display': 'block' });
            }
            else { $('#<%=txtTitle.ClientID%>').css({ 'display': 'none' }); }
            var Disability = $("input[type=radio][name='ctl00$ContentPlaceHolder1$disability']:checked").val();
            if (Disability == 'rblDisabilityYes') {
                $("#<%=disabilitydesc.ClientID%>").show();
            } else { $("#<%=disabilitydesc.ClientID%>").hide(); }

            var agent = $("input[type=radio][name='ctl00$ContentPlaceHolder1$agent']:checked").val();
            if (agent == 'rblAgentYes') {
                $("#<%=agentList.ClientID%>").show(); $("#<%=addnewagent.ClientID%>").show();
            } else { $("#<%=agentList.ClientID%>").hide(); $("#<%=addnewagent.ClientID%>").hide(); }

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
                if ($("#<%=rblDisabilityYes.ClientID%>").is(":checked")) {
                    $("#<%=disabilitydesc.ClientID%>").show();

                } else {
                    $("#<%=disabilitydesc.ClientID%>").hide();

                }
            });
        });
        $(function () {
            $("input[name='ctl00$ContentPlaceHolder1$agent']").click(function () {
                if ($("#<%=rblAgentYes.ClientID%>").is(":checked")) {
                    $("#<%=agentList.ClientID%>").show(); $("#<%=addnewagent.ClientID%>").show();
                } else { $("#<%=agentList.ClientID%>").hide(); $("#<%=addnewagent.ClientID%>").hide(); }
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

