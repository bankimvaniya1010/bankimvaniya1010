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
                        <div class="list-group list-group-fit">
                            <div class="list-group-item" id="title" runat="server" style="display: none">
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
                                            <asp:DropDownList ID="ddlYear" CssClass="form-control" OnSelectedIndexChanged="ddlYear_SelectedIndexChanged" AutoPostBack="true" runat="server">
                                                <asp:ListItem Value="0" Selected="True">Select Year</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:DropDownList ID="ddlMonth" CssClass="form-control" OnSelectedIndexChanged="ddlMonth_SelectedIndexChanged" AutoPostBack="true" runat="server">
                                                <asp:ListItem Value="0" Selected="True">Select Month</asp:ListItem>
                                            </asp:DropDownList>                                            
                                            <asp:DropDownList ID="ddlDay" CssClass="form-control" runat="server"></asp:DropDownList>
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
                            <div class="list-group-item" id="dualNationality" runat="server" style="display: none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-dualNationality">
                                    <div class="form-row">
                                        <label id="labelDualNationality" runat="server" for="dualNationality" class="col-md-3 col-form-label form-label">Do you have dual Citizenship?</label>
                                        <div class="col-md-6">
                                            <asp:RadioButton ID="rblNationalityYes" runat="server" CssClass="form-control" GroupName="dualnationality" Text="Yes" />
                                            <asp:RadioButton ID="rblNationalityNo" runat="server" CssClass="form-control" GroupName="dualnationality" Text="No" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="secondNation" runat="server" style="display: none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-SecondNationality">
                                    <div class="form-row">
                                        <label id="labelSecondNation" runat="server" for="SecondNationality" class="col-md-3 col-form-label form-label">Nationality and citizenship</label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlOtherNation" CssClass="form-control" runat="server">
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
                               <div id="mainDiv" runat="server"></div>
                            <div class="list-group-item" id="employerwebsite">
                                <div class="form-group m-0" role="group" aria-labelledby="label-employerwebsite">
                                    <div class="form-row">
                                        <a href="applicantcontactdetail.aspx" class="btn btn-success" style="margin-right: 10px;">Contact Details</a>
                                        <asp:Button ID="btn_login" OnClientClick="return validateForm();" runat="server" Text="Save Changes" CssClass="btn btn-success" OnClick="btn_login_Click" />
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
       
        function validateForm() {

            var flag = false;
            if (!$("#<%=title.ClientID%>").is(':hidden') && $("#<%=ddlTitle.ClientID%>").val() == "0")
                alert("Please select valid title name");
            else if ((!$("#<%=title.ClientID%>").is(':hidden')) && ($("#<%=ddlTitle.ClientID%> option:selected").text() == "Others" && $("#<%=txtTitle.ClientID%>").val() == ""))
                alert("Please enter other title");
            else if (!$("#<%=firstname.ClientID%>").is(':hidden') && $("#<%=txtFirstName.ClientID%>").val() == "")
                alert("Please enter first name");
            else if (!$("#<%=lastname.ClientID%>").is(':hidden') && $("#<%=txtLastName.ClientID%>").val() == "")
                alert("Please enter last name");
            else if (!$("#<%=preferedname.ClientID%>").is(':hidden') && $("#<%=txtPreferedName.ClientID%>").val() == "")
                alert("Please enter prefered name");
            else if (!$("#<%=middlename.ClientID%>").is(':hidden') && $("#<%=txtMiddleName.ClientID%>").val() == "")
                alert("Please enter middle name");
            else if (!$("#<%=gender.ClientID%>").is(':hidden') && !($("#<%=rbtnFemale.ClientID%>").is(':checked') || $("#<%=rbtnMale.ClientID%>").is(':checked')))
                alert("Please Select Option to record Gender");
            else if (!$("#<%=dob.ClientID%>").is(':hidden') && (($("#<%=ddlDay.ClientID%>").val() == "0") || ($("#<%=ddlMonth.ClientID%>").val() == "0") || ($("#<%=ddlYear.ClientID%>").val() == "0")))
                alert("Please Select valid date of birth");
            else if (!$("#<%=nationality.ClientID%>").is(':hidden') && $("#<%=ddlNationality.ClientID%>").val().split("_")[0] === "0")
                alert("Please select valid nationality");
            else if (!$("#<%=nationality.ClientID%>").is(':hidden') && !$("#<%=rblNationalityYes.ClientID%>").is(':checked') && !$("#<%=secondNation.ClientID%>").is(':hidden') && $("#<%=ddlOtherNation.ClientID%>").val() === "0")
                alert("Please select valid second nationality");
            else if (!$("#<%=birthcountry.ClientID%>").is(':hidden') && $("#<%=ddlBirthCountry.ClientID%>").val() === "0")
                alert("Please select valid birth country");
            else if (!$("#<%=marital.ClientID%>").is(':hidden') && $("#<%=ddlMarital.ClientID%>").val() === "0")
                alert("Please select valid marital status");
            else if (!$("#<%=marital.ClientID%>").is(':hidden') && $("#<%=ddlMarital.ClientID%>").val() === "0")
                alert("Please select valid marital status");
            else if (!$("#<%=disability.ClientID%>").is(':hidden') && !($("#<%=rblDisabilityYes.ClientID%>").is(':checked') || $("#<%=rblDisabilityNo.ClientID%>").is(':checked')))
                alert("Please Select Option to record disability");
            else if (!$("#<%=disabilitydesc.ClientID%>").is(':hidden') && $("#<%=ddlDisability.ClientID%>").val() === "0")
                alert("Please select select valid disability");
            else if (!$("#<%=agent.ClientID%>").is(':hidden') && !($("#<%=rblAgentYes.ClientID%>").is(':checked') || $("#<%=rblAgentNo.ClientID%>").is(':checked')))
                alert("Please Select Option to record reffrerd by agent");
            else if (!$("#<%=agentList.ClientID%>").is(':hidden') && ($("#<%=ddlAgent.ClientID%>").val() === "0"))
                alert("Please Select valid agent details");

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
            if (!$("#<%=title.ClientID%>").is(':hidden')) {
                $('#<%=ddlTitle.ClientID%>').change(function () {
                    if ($("#<%=ddlTitle.ClientID%> option:selected").text() == "Others") {
                        $('#<%=txtTitle.ClientID%>').css({ 'display': 'block' });
                    }
                    else { $('#<%=txtTitle.ClientID%>').css({ 'display': 'none' }); }

                });
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
            if (!$("#<%=agent.ClientID%>").is(':hidden')) {

                if ($("#<%=rblAgentYes.ClientID%>").is(':checked')) {
                    $("#<%=agentList.ClientID%>").show(); $("#<%=addnewagent.ClientID%>").show();
                } else { $("#<%=agentList.ClientID%>").hide(); $("#<%=addnewagent.ClientID%>").hide(); }
            }
                                    
            $("#<%=rblNationalityYes.ClientID%>").click(function () {
                $("#<%=secondNation.ClientID%>").show();
            });

            $("#<%=rblNationalityNo.ClientID%>").click(function () {
                $("#<%=secondNation.ClientID%>").hide();
            });
            
            $("#<%=ddlNationality.ClientID%>").change(function () {
                countryVal = $("#<%=ddlNationality.ClientID%>").val().split("_");
                dualcitizenship = (countryVal[1] == "True");
                countryId = countryVal[0];

                if (dualcitizenship === true) {
                    if (!$("#<%=nationality.ClientID%>").is(':hidden')) {
                        $("#<%=dualNationality.ClientID%>").show();
                    }
                }
                else {
                    if (!$("#<%=nationality.ClientID%>").is(':hidden')) {
                        $("#<%=dualNationality.ClientID%>").hide();
                        $("#<%=dualNationality.ClientID %> input[type='radio']").prop('checked', false);
                        $("#<%=ddlOtherNation.ClientID %>")[0].selectedIndex = 0;
                    }
                }
                
            });

            // to handle Tool tips
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



    </script>


</asp:Content>

