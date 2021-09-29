<%@ Page Language="C#" AutoEventWireup="true" CodeFile="applicantfunding.aspx.cs" Inherits="admin_applicantfunding" MasterPageFile="~/admin/admin.master" %>

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
            <li class="breadcrumb-item"><a href="Default.aspx">My Dashboard</a></li>
            <li class="breadcrumb-item active">Applicant funding details</li>
        </ol>
        <h1 class="h2">Applicant funding details</h1>
        <div class="card">

            <div class="list-group list-group-fit">
                <div class="list-group-item" id="labelstudylive">
                    <div class="form-group m-0" role="group" aria-labelledby="label-calculator">
                        <div class="form-row">
                            <label id="label-calculator" for="calculator" class="col-md-2 col-form-label form-label">StudyNlive Budget Calculator</label>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="study" runat="server">
                    <div class="form-group m-0" role="group" aria-labelledby="label-Mobile">
                        <div class="form-row">
                            <label id="label-Mobile" for="Mobile" class="col-md-2 col-form-label form-label">Would you study-n-live alone or would your family members come along </label>
                            <div class="col-md-6">
                                <div class="prdtl-ans">
                                    <asp:Label ID="lblstudy" runat="server"></asp:Label>
                                </div>
                                <div class="prdtl-vrfy">
                                    <asp:RadioButton ID="rblstudyYes" GroupName="study" Text="Yes" runat="server" Checked="true"/>
                                    <asp:RadioButton ID="rblstudyNo" GroupName="study" Text="No" runat="server" />
                                </div>
                                <span class="helpicon"><i id="icstudy" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-3">
                                <input type="button" value="Add Remarks" id="btnstudy" />
                                <input id="txtstudy" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="familymember" runat="server">
                    <div class="form-group m-0" role="group" aria-labelledby="label-phone">
                        <div class="form-row">
                            <label id="label-phone" for="phone" class="col-md-2 col-form-label form-label">No of Family members  </label>
                            <div class="col-md-6">
                                <div class="prdtl-ans">
                                    <asp:Label ID="lblfamilymember" runat="server"></asp:Label>
                                </div>
                                <div class="prdtl-vrfy">
                                    <asp:RadioButton ID="rblfamilymemberYes" GroupName="familymember" Text="Yes" runat="server" Checked="true"/>
                                    <asp:RadioButton ID="rblfamilymemberNo" GroupName="familymember" Text="No" runat="server" />
                                </div>
                                <span class="helpicon"><i id="icfamilymember" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-3">
                                <input type="button" value="Add Remarks" id="btnfamilymember" />
                                <input id="txtfamilymember" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="accommodation" runat="server">
                    <div class="form-group m-0" role="group" aria-labelledby="label-skype">
                        <div class="form-row">
                            <label id="label-skype" for="skype" class="col-md-2 col-form-label form-label">Select the kind of accommodation you plan to have </label>
                            <div class="col-md-6">
                                <div class="prdtl-ans">
                                    <asp:Label ID="lblaccommodation" runat="server"></asp:Label>
                                </div>
                                <div class="prdtl-vrfy">
                                    <asp:RadioButton ID="rblaccommodationYes" GroupName="accommodation" Text="Yes" runat="server" Checked="true"/>
                                    <asp:RadioButton ID="rblaccommodationNo" GroupName="accommodation" Text="No" runat="server" />
                                </div>
                                <span class="helpicon"><i id="icaccommodation" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-3">
                                <input type="button" value="Add Remarks" id="btnaccommodation" />
                                <input id="txtaccommodation" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>
                    </div>
                </div>

                <div class="list-group-item" id="managemeal" runat="server">
                    <div class="form-group m-0" role="group" aria-labelledby="label-skypeDesc">
                        <div class="form-row">
                            <label id="label-skypeDesc" for="skypeDesc" class="col-md-2 col-form-label form-label">
                                Select the kind of Meal you plan to have
                            </label>
                            <div class="col-md-6">
                                <div class="prdtl-ans">
                                    <asp:Label ID="lblmanagemeal" runat="server"></asp:Label>
                                </div>
                                <div class="prdtl-vrfy">
                                    <asp:RadioButton ID="rblmanagemealYes" GroupName="managemeal" Text="Yes" runat="server" Checked="true"/>
                                    <asp:RadioButton ID="rblmanagemealNo" GroupName="managemeal" Text="No" runat="server" />
                                </div>
                                <span class="helpicon"><i id="icmanagemeal" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-3">
                                <input type="button" value="Add Remarks" id="btnmanagemeal" />
                                <input id="txtmanagemeal" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="transportchoice" runat="server">
                    <div class="form-group m-0" role="group" aria-labelledby="label-whatsapp">
                        <div class="form-row">
                            <label id="label-whatsapp" for="whatsapp" class="col-md-2 col-form-label form-label">Select your preferred choice of transport in the city  </label>
                            <div class="col-md-6">
                                <div class="prdtl-ans">
                                    <asp:Label ID="lbltransportchoice" runat="server"></asp:Label>
                                </div>
                                <div class="prdtl-vrfy">
                                    <asp:RadioButton ID="rbltransportchoiceYes" GroupName="transportchoice" Text="Yes" runat="server" Checked="true"/>
                                    <asp:RadioButton ID="rbltransportchoiceNo" GroupName="transportchoice" Text="No" runat="server" />
                                </div>
                                <span class="helpicon"><i id="ictransportchoice" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-3">
                                <input type="button" value="Add Remarks" id="btntransportchoice" />
                                <input id="txttransportchoice" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="Trips" runat="server">
                    <div class="form-group m-0" role="group" aria-labelledby="label-skypeDesc">
                        <div class="form-row">
                            <label id="label-whatsappDesc" for="whatsappDesc" class="col-md-2 col-form-label form-label">No of Trips you plan to take to your home country in a year</label>
                            <div class="col-md-6">
                                <div class="prdtl-ans">
                                    <asp:Label ID="lblTrips" runat="server"></asp:Label>
                                </div>
                                <div class="prdtl-vrfy">
                                    <asp:RadioButton ID="rblTripsYes" GroupName="Trips" Text="Yes" runat="server" Checked="true"/>
                                    <asp:RadioButton ID="rblTripsNo" GroupName="Trips" Text="No" runat="server" />
                                </div>
                                <span class="helpicon"><i id="icTrips" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-3">
                                <input type="button" value="Add Remarks" id="btnTrips" />
                                <input id="txtTrips" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>
                    </div>
                </div>

                <div class="list-group-item" id="entertainment" runat="server">
                    <div class="form-group m-0" role="group" aria-labelledby="label-address">
                        <div class="form-row">
                            <label id="labelentertainment" for="address" class="col-md-2 col-form-label form-label">
                                How often in a week do you typically go out (entertainment) 
                            </label>
                            <div class="col-md-6">
                                <div class="prdtl-ans">
                                    <asp:Label ID="lblentertainment" runat="server"></asp:Label>
                                </div>
                                <div class="prdtl-vrfy">
                                    <asp:RadioButton ID="rblentertainmentYes" GroupName="entertainment" Text="Yes" runat="server" Checked="true"/>
                                    <asp:RadioButton ID="rblentertainmentNo" GroupName="entertainment" Text="No" runat="server" />
                                </div>
                                <span class="helpicon"><i id="icentertainment" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-3">
                                <input type="button" value="Add Remarks" id="btnentertainment" />
                                <input id="txtentertainment" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>
                    </div>
                </div>

                <div class="list-group-item" id="cost" runat="server">
                    <div class="form-group m-0" role="group" aria-labelledby="label-employerwebsite">
                        <div class="form-row">

                            <div class="col-md-9">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>Cost Head</th>
                                            <th>Estimated Costs</th>
                                        </tr>
                                    </thead>
                                    <tbody class="list">
                                        <tr>
                                            <td class="name">Tuition Fee </td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td class="name">Other Education Costs </td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td class="name">Accommodation  </td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td class="name">Meals / Groceries  </td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td class="name">Travel & related  </td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td class="name">Utilities, including Phone & internet </td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td class="name">Entertainment  </td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td class="name">Health Insurance   </td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td class="name">Misc </td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td class="name">Totals  </td>
                                            <td></td>
                                        </tr>
                                    </tbody>
                                </table>

                            </div>
                        </div>
                    </div>
                </div>

                <div class="list-group-item" runat="server">
                    <div class="form-group m-0" role="group" aria-labelledby="label-address">
                        <div class="form-row">
                            <label id="labelfunding" for="address" class="col-md-9 col-form-label form-label">
                                How do you plan to fund your education and living costs of $10,000 per annum or S30000 for the duration of your course 
                            </label>

                        </div>
                    </div>
                </div>

                <div class="list-group-item" id="funding" runat="server">
                    <div class="form-group m-0" role="group" aria-labelledby="label-employerwebsite">
                        <div class="form-row">

                            <div class="col-md-9">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>Funding Source</th>
                                            <th>% Contribution (Amount) </th>
                                        </tr>
                                    </thead>
                                    <tbody class="list">
                                        <tr>
                                            <td class="name">Private Finance  </td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td class="name">Scholarship </td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td class="name">Student Loan </td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td class="name">Sponsorship (Company/Family/Friends)</td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td class="name">Part-time work alongside my study </td>
                                            <td></td>
                                        </tr>
                                    </tbody>
                                </table>

                            </div>
                        </div>
                    </div>
                </div>
                <div id="mainDiv" runat="server"></div>
                <div class="list-group-item">
                    <div class="form-group m-0" role="group" aria-labelledby="label-employerwebsite">
                        <div class="form-row">
                            <asp:Button ID="btn_fundingdetails" runat="server" Text="Save Changes" CssClass="btn btn-success" OnClick="btn_fundingdetails_Click" OnClientClick="return validateform()"/>
                            <div class="col-md-6">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


    </div>
    <script type="text/javascript">
        $(document).ready(function () {
            //comment box
             if ($("#<%=txtstudy.ClientID%>").val() != "")
                ManageRemarksIfNoCheked('<%=txtstudy.ClientID%>', 'btnstudy');
             if ($("#<%=txtfamilymember.ClientID%>").val() != "")
                ManageRemarksIfNoCheked('<%=txtfamilymember.ClientID%>', 'btnfamilymember');
             if ($("#<%=txtaccommodation.ClientID%>").val() != "")
                ManageRemarksIfNoCheked('<%=txtaccommodation.ClientID%>', 'btnaccommodation');
             if ($("#<%=txtmanagemeal.ClientID%>").val() != "")
                ManageRemarksIfNoCheked('<%=txtmanagemeal.ClientID%>', 'btnmanagemeal');
             if ($("#<%=txttransportchoice.ClientID%>").val() != "")
                ManageRemarksIfNoCheked('<%=txttransportchoice.ClientID%>', 'btntransportchoice');
             if ($("#<%=txtTrips.ClientID%>").val() != "")
                ManageRemarksIfNoCheked('<%=txtTrips.ClientID%>', 'btnTrips');
             if ($("#<%=txtentertainment.ClientID%>").val() != "")
                ManageRemarksIfNoCheked('<%=txtentertainment.ClientID%>', 'btnentertainment');

            $("#btnstudy").click(function () {
                ManageRemarks('<%=txtstudy.ClientID%>', 'btnstudy');
            });
            $("#<%=rblstudyNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtstudy.ClientID%>', 'btnstudy');
            });
            $("#btnfamilymember").click(function () {
                ManageRemarks('<%=txtfamilymember.ClientID%>', 'btnfamilymember');
            });
            $("#<%=rblfamilymemberNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtfamilymember.ClientID%>', 'btnfamilymember');
            });
            $("#btnaccommodation").click(function () {
                ManageRemarks('<%=txtaccommodation.ClientID%>', 'btnaccommodation');
            });
            $("#<%=rblaccommodationNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtaccommodation.ClientID%>', 'btnaccommodation');
            });
            $("#btnmanagemeal").click(function () {
                ManageRemarks('<%=txtmanagemeal.ClientID%>', 'btnmanagemeal');
            });
            $("#<%=rblmanagemealNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtmanagemeal.ClientID%>', 'btnmanagemeal');
            });
            $("#btntransportchoice").click(function () {
                ManageRemarks('<%=txttransportchoice.ClientID%>', 'btntransportchoice');
            });
            $("#<%=rbltransportchoiceNo.ClientID%>").click(function () {
                ManageRemarks('<%=txttransportchoice.ClientID%>', 'btntransportchoice');
            });
            $("#btnTrips").click(function () {
                ManageRemarks('<%=txtTrips.ClientID%>', 'btnTrips');
            });
            $("#<%=rblTripsNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtTrips.ClientID%>', 'btnTrips');
            });
            $("#btnentertainment").click(function () {
                ManageRemarks('<%=txtentertainment.ClientID%>', 'btnentertainment');
            });
            $("#<%=rblentertainmentNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtentertainment.ClientID%>', 'btnentertainment');
            });
            if ($('#<%=rblstudyNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtstudy.ClientID%>', 'btnstudy');
            if ($('#<%=rblfamilymemberNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtfamilymember.ClientID%>', 'btnfamilymember');
            if ($('#<%=rblaccommodationNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtaccommodation.ClientID%>', 'btnaccommodation');
            if ($('#<%=rblmanagemealNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtmanagemeal.ClientID%>', 'btnmanagemeal');
            if ($('#<%=rbltransportchoiceNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txttransportchoice.ClientID%>', 'btntransportchoice');
            if ($('#<%=rblTripsNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtTrips.ClientID%>', 'btnTrips');
            if ($('#<%=rblentertainmentNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtentertainment.ClientID%>', 'btnentertainment');

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
            function ManageRemarks(cntrol1, control2) {
                if ($("#" + cntrol1 + "").is(':hidden')) {
                    $("#" + cntrol1 + "").css('display', 'block');
                    $("#" + control2 + "").prop('value', 'Hide Comments');
                    // $("#btnTwitter").html("Hide Comments");
                }
                else {
                    $("#" + cntrol1 + "").css('display', 'none');
                    // $("#btnTwitter").html("Add Comments")
                    $("#" + control2 + "").prop('value', 'Add Comments');
                }
            }

        });
        function validateform()
        {
            var flag = false;
            if (!$("#<%=study.ClientID%>").is(':hidden') && !($("#<%=rblstudyYes.ClientID%>").is(':checked') || $("#<%=rblstudyNo.ClientID%>").is(':checked'))) 
                alert("Please select option for Would you study-n-live alone or would your family members come along ");
            else if (!$("#<%=familymember.ClientID%>").is(':hidden') && !($("#<%=rblfamilymemberYes.ClientID%>").is(':checked') || $("#<%=rblfamilymemberNo.ClientID%>").is(':checked'))) 
                alert("Please select option for No of Family members ");
            else if (!$("#<%=accommodation.ClientID%>").is(':hidden') && !($("#<%=rblaccommodationYes.ClientID%>").is(':checked') || $("#<%=rblaccommodationNo.ClientID%>").is(':checked'))) 
                alert("Please select option for Select the kind of accommodation you plan to have");
            else if (!$("#<%=managemeal.ClientID%>").is(':hidden') && !($("#<%=rblmanagemealYes.ClientID%>").is(':checked') || $("#<%=rblmanagemealNo.ClientID%>").is(':checked'))) 
                alert("Please select option for Select the kind of meal you plan to have ");
            else if (!$("#<%=transportchoice.ClientID%>").is(':hidden') && !($("#<%=rbltransportchoiceYes.ClientID%>").is(':checked') || $("#<%=rbltransportchoiceNo.ClientID%>").is(':checked'))) 
                alert("Please select option for Select your preferred choice of transport in the city ");
            else if (!$("#<%=Trips.ClientID%>").is(':hidden') && !($("#<%=rblTripsYes.ClientID%>").is(':checked') || $("#<%=rblTripsNo.ClientID%>").is(':checked'))) 
                alert("Please select option for No of Trips you plan to take to your home country in a year");
            else if (!$("#<%=entertainment.ClientID%>").is(':hidden') && !($("#<%=rblentertainmentYes.ClientID%>").is(':checked') || $("#<%=rblentertainmentNo.ClientID%>").is(':checked'))) 
                alert("Please select option for How often in a week do you typically go out (entertainment) ");    
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
