<%@ Page Language="C#" AutoEventWireup="true" CodeFile="applicantvisa.aspx.cs" Inherits="applicantvisa" MasterPageFile="~/student.master" %>

<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">


    <div class="container-fluid page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">Visas</li>
        </ol>
        <h1 class="h2">Visas</h1>

    </div>
    <div class="page ">
        <div class="container page__container p-0">
            <div class="row m-0">
                <div class="col-lg container-fluid page__container">

                    <div class="card" style="width: 650px;">

                        <div class="list-group list-group-fit">
                            <div class="list-group-item" id="applyvisa">
                                <div class="form-group m-0" role="group" aria-labelledby="label-havevisa">
                                    <div class="form-row">
                                        <label id="label-havevisa" for="havevisa" class="col-md-3 col-form-label form-label">
                                            Do you currently have a visa that allows you to study in {insert name of country}

                                        </label>
                                        <div class="col-md-9">
                                            <asp:RadioButton ID="rbtnYes" runat="server" CssClass="form-control" GroupName="Visa" Text="Yes" />
                                            <asp:RadioButton ID="rbtnNo" runat="server" CssClass="form-control" GroupName="Visa" Text="No - I will need to apply for an international student visa" />
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="list-group-item" id="visa">
                                <div class="form-group m-0" role="group" aria-labelledby="label-visa">
                                    <div class="form-row">
                                        <label id="label-visa" for="visa" class="col-md-3 col-form-label form-label">Which Visa Do You Hold</label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlVisa" CssClass="form-control" runat="server"></asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="validityFrom">
                                <div class="form-group m-0" role="group" aria-labelledby="label-validityFrom">
                                    <div class="form-row">
                                        <label id="label-validityFrom" for="EnglishCourse" class="col-md-3 col-form-label form-label">Validity From </label>
                                        <div class="col-md-6">
                                            <input id="txtValidityFrom" runat="server" type="text" class="form-control" placeholder="Validity From " data-toggle="flatpickr" value="">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="validityTo">
                                <div class="form-group m-0" role="group" aria-labelledby="label-validityTo">
                                    <div class="form-row">
                                        <label id="label-validityTo" for="EnglishCourse" class="col-md-3 col-form-label form-label">Validity To </label>
                                        <div class="col-md-6">
                                            <input id="txtValidityTo" runat="server" type="text" class="form-control" placeholder="Validity To" data-toggle="flatpickr" value="">
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="list-group-item" id="visano">
                                <div class="form-group m-0" role="group" aria-labelledby="label-visano">
                                    <div class="form-row">
                                        <label id="label-visano" for="visano" class="col-md-3 col-form-label form-label">Visa No</label>
                                        <div class="col-md-6">
                                            <input id="txtVisano" runat="server" type="text" class="form-control" placeholder="Visa Number">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="visaappliedCountry">
                                <div class="form-group m-0" role="group" aria-labelledby="label-visaappliedCountry">
                                    <div class="form-row">
                                        <label id="label-visaappliedCountry" for="visaappliedCountry" class="col-md-3 col-form-label form-label">
                                            Where would you be making your Visa application 

                                        </label>
                                        <div class="col-md-6">
                                            <asp:RadioButton ID="VisaApplicationYes" CssClass="form-control" runat="server" GroupName="VisaApplication" Text="Country where the college is located" />
                                            <asp:RadioButton ID="VisaApplicationNo" CssClass="form-control" runat="server" GroupName="VisaApplication" Text="Offshore" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="visacity">
                                <div class="form-group m-0" role="group" aria-labelledby="label-city">
                                    <div class="form-row">
                                        <label id="label-city" for="city" class="col-md-3 col-form-label form-label">
                                            City

                                        </label>
                                        <div class="col-md-6">
                                            <input id="txtCity" runat="server" type="text" class="form-control" placeholder="">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="visacountry">
                                <div class="form-group m-0" role="group" aria-labelledby="label-highschoolCountry">
                                    <div class="form-row">
                                        <label id="label-highschoolCountry" for="highschoolCountry" class="col-md-3 col-form-label form-label">Visa Application Country</label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlCountry" CssClass="form-control" runat="server"></asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="firstvisit">
                                <div class="form-group m-0" role="group" aria-labelledby="label-firstvisit">
                                    <div class="form-row">
                                        <label id="label-firstvisit" for="firstvisit" class="col-md-3 col-form-label form-label">Date of first Visit to Country of Application </label>
                                        <div class="col-md-6">
                                            <input id="txtFirstVisit" runat="server" type="text" class="form-control" placeholder="Date of first Visit" data-toggle="flatpickr" value="" >
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="Previuosstay">
                                <div class="form-group m-0" role="group" aria-labelledby="label-Previuosstay">
                                    <div class="form-row">
                                        <label id="label-Previuosstay" for="Previuosstay" class="col-md-3 col-form-label form-label">
                                            Have you ever, lived, worked, studied in Country of Application before

                                        </label>
                                        <div class="col-md-6">
                                            <asp:RadioButton ID="rblLivedBeforeYes" CssClass="form-control" runat="server" GroupName="LivedBefore" Text="Yes" />
                                            <asp:RadioButton ID="rblLivedBeforeNo" CssClass="form-control" runat="server" GroupName="LivedBefore" Text="No" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="parent">
                                <div class="form-group m-0" role="group" aria-labelledby="label-parent">
                                    <div class="form-row">
                                        <label id="label-parent" for="parent" class="col-md-3 col-form-label form-label">
                                            Do your parents/step parents/spouse/partner/children/step-children live, study, work in Country of Application

                                        </label>
                                        <div class="col-md-6">
                                            <asp:RadioButton ID="rblParentYes" CssClass="form-control" runat="server" GroupName="Parent" Text="Yes" />
                                            <asp:RadioButton ID="rblParentNo" CssClass="form-control" runat="server" GroupName="Parent" Text="No" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="DeniedVisa">
                                <div class="form-group m-0" role="group" aria-labelledby="label-DeniedVisa">
                                    <div class="form-row">
                                        <label id="label-DeniedVisa" for="DeniedVisa" class="col-md-3 col-form-label form-label">
                                            Have you ever been refused a Visa or Deported by Country of Application
                                        </label>
                                        <div class="col-md-6">
                                            <asp:RadioButton ID="rblRefuseYes" runat="server" CssClass="form-control" GroupName="Refuse" Text="Yes" />
                                            <asp:RadioButton ID="rblRefuseNo" runat="server" CssClass="form-control" GroupName="Refuse" Text="No" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="parentdeny">
                                <div class="form-group m-0" role="group" aria-labelledby="label-parentdeny">
                                    <div class="form-row">
                                        <label id="label-parentdeny" for="parentdeny" class="col-md-3 col-form-label form-label">
                                            Have your parents/step parents/spouse/partner/children/step-children ever been refused a visa or deported from

                                        </label>
                                        <div class="col-md-6">
                                            <asp:RadioButton ID="rblParentRefuseYes" runat="server" CssClass="form-control" GroupName="ParentRefuse" Text="Yes" />
                                            <asp:RadioButton ID="rblParentRefuseNo" runat="server" CssClass="form-control" GroupName="ParentRefuse" Text="No" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                             <div id="mainDiv" runat="server"></div>
                            <div class="list-group-item">
                                <div class="form-group m-0" role="group" aria-labelledby="label-employerwebsite">
                                    <div class="form-row">
                                        <asp:Button ID="btn_login" runat="server" Text="Save Changes" CssClass="btn btn-success" OnClick="btn_login_Click"  OnClientClick="return validateForm()"/> <%-- OnClientClick="return validateForm()"--%>
                                        <div class="col-md-6">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
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
            var visacountry = $("input[type=radio][name='ctl00$ContentPlaceHolder1$VisaApplication']:checked").val()
            if (visacountry == 'VisaApplicationNo') {
                $("#visacity").show();
                $("#visacountry").show();
            }
            else {
                 $("#visacity").hide();
                 $("#visacountry").hide();
            }

            var visavalue = $("input[type=radio][name='ctl00$ContentPlaceHolder1$Visa']:checked").val()
            if (visavalue == 'rbtnYes') {
                $("#visa").show();
                $("#validityFrom").show();
                $("#validityTo").show();
                $("#visano").show();
                $("#visaappliedCountry").hide(); 
                $("#firstvisit").show();
                $("#visacity").hide();
                $("#visacountry").hide();
                
            }
            else {
                $("#visa").hide();
                $("#validityFrom").hide();
                $("#validityTo").hide();
                $("#visano").hide();
                $("#visaappliedCountry").show();
                $("#firstvisit").hide();
               
            }

        });

         $(function () {
            $("input[name='ctl00$ContentPlaceHolder1$Visa']").click(function () {
                if ($("#<%=rbtnYes.ClientID%>").is(":checked")) {
                    $("#visa").show();
                    $("#validityFrom").show();
                    $("#validityTo").show();
                    $("#visano").show();   
                    $("#firstvisit").show();
                    $("#visaappliedCountry").hide();
                    $("#visacity").hide();
                    $("#visacountry").hide();
                }
                else {
                    $("#visa").hide();
                    $("#validityFrom").hide();
                    $("#validityTo").hide();
                    $("#visano").hide();                    
                    $("#firstvisit").hide();
                    $("#visaappliedCountry").show();
                }                
            });
        });
        $(function () {
            $("input[name='ctl00$ContentPlaceHolder1$VisaApplication']").click(function () {
                if ($("#<%=VisaApplicationNo.ClientID%>").is(":checked")) {
                    $("#visacity").show();
                    $("#visacountry").show();
                }
                else {
                    $("#visacity").hide();
                    $("#visacountry").hide();                   
                }                
            });
         });
        $('#ContentPlaceHolder1_txtValidityFrom').flatpickr({

            dateFormat: 'Y-m-d'
        });
        $('#ContentPlaceHolder1_txtValidityTo').flatpickr({

            dateFormat: 'Y-m-d'
        });
        $('#ContentPlaceHolder1_txtFirstVisit').flatpickr({            
            dateFormat: 'Y-m-d'
           
        });
        function customcontrolValidation()
        {
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
        function validateForm()
        {
            var flag = false;
            var innerConditions = false;
            var isValidDate;
            if ($("#<%=txtFirstVisit.ClientID%>").val() != "") {
                var from = new Date($("#<%=txtValidityFrom.ClientID%>").val());
                var to = new Date($("#<%=txtValidityTo.ClientID%>").val());
                var visitDate = new Date($("#<%=txtFirstVisit.ClientID%>").val());
                isValidDate = (visitDate >= from && visitDate <= to);
            }

            if (!$("#<%=rbtnYes.ClientID%>").is(':checked') && !$("#<%=rbtnNo.ClientID%>").is(':checked'))
                alert("Please Select  Do you currently have a visa ");
            else if ($("#<%=rbtnYes.ClientID%>").is(':checked'))
            {
                if ($("#<%=ddlVisa.ClientID%>").val() == "0")
                    alert("Please Select Visa Type");
                else if ($("#<%=txtValidityFrom.ClientID%>").val() == "")
                    alert("Please Enter Date of Validity From");
                else if ($("#<%=txtValidityTo.ClientID%>").val() == "")
                    alert("Please enter Date Of Validity From");
                else if ($("#<%=txtVisano.ClientID%>").val() == "")
                    alert("Please enter Visa Number");
                else if ($("#<%=txtFirstVisit.ClientID%>").val() == "" && !isValidDate)
                    alert("Please Select Date of first Visit");                          
                else
                    innerConditions = true;
            }
            else if ($("#<%=rbtnNo.ClientID%>").is(':checked'))
            {
                if ($("#<%=rbtnNo.ClientID%>").is(':checked') && !$("#<%=VisaApplicationYes.ClientID%>").is(':checked') && !$("#<%=VisaApplicationNo.ClientID%>").is(':checked'))
                    alert("Please Select Where You Would Be Making Your Visa Application");
                else if ($("#<%=VisaApplicationNo.ClientID%>").is(':checked') && $("#<%=txtCity.ClientID%>").val() == "")
                    alert("Please enter via city");
                else if ($("#<%=VisaApplicationNo.ClientID%>").is(':checked') && $("#<%=ddlCountry.ClientID%>").val() == "0")
                    alert("Please Select Country");        
                else
                    innerConditions = true;
            }
            else
                innerConditions = true;
            
            if (innerConditions) {

                if (!$("#<%=rblLivedBeforeYes.ClientID%>").is(':checked') && !$("#<%=rblLivedBeforeNo.ClientID%>").is(':checked'))
                    alert(" Please Select Have you ever, lived, worked, studied in Country of Application before");
                else if (!$("#<%=rblParentYes.ClientID%>").is(':checked') && !$("#<%=rblParentNo.ClientID%>").is(':checked'))
                    alert("Please Select  Do your parents/step parents/spouse/partner/children/step-children live, study, work in Country of Application");
                else if (!$("#<%=rblRefuseYes.ClientID%>").is(':checked') && !$("#<%=rblRefuseNo.ClientID%>").is(':checked'))
                    alert("Please Select  Have you ever been refused a Visa or Deported by Country of Application");
                else if (!$("#<%=rblParentRefuseYes.ClientID%>").is(':checked') && !$("#<%=rblParentRefuseNo.ClientID%>").is(':checked'))
                    alert("Please Select Have your parents/step parents/spouse/partner/children/step-children ever been refused a visa or deported from");
                else
                    flag = true;
            }
            return flag;

        }    
        $(document).ready(function () {
            $('.sidebar-menu-item').removeClass('open');
            $('#Application_list').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#applicantvisa').addClass('active');
        });
    </script>
</asp:Content>
