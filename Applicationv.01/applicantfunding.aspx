<%@ Page Language="C#" AutoEventWireup="true" CodeFile="applicantfunding.aspx.cs" Inherits="applicantfunding" MasterPageFile="~/student.master" %>

<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">


    <div class="container-fluid page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">Funding</li>
        </ol>
        <h1 class="h2">Funding</h1>

    </div>
    <div class="page ">
        <div class="container page__container p-0">
            <div class="row m-0">
                <div class="col-lg container-fluid page__container">

                    <div class="card" style="width: 650px;">

                        <div class="list-group list-group-fit">
                            <div class="list-group-item" id="labelstudylive">
                                <div class="form-group m-0" role="group" aria-labelledby="label-calculator">
                                    <div class="form-row">
                                        <label id="label-calculator" for="calculator" class="col-md-3 col-form-label form-label">StudyNlive Budget Calculator</label>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="study" runat="server">
                                <div class="form-group m-0" role="group" aria-labelledby="label-Mobile">
                                    <div class="form-row">
                                        <label id="label-Mobile" for="Mobile" class="col-md-3 col-form-label form-label">Would you study-n-live alone or would your family members come along </label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlstudy" CssClass="form-control" runat="server"></asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="familymember" runat="server">
                                <div class="form-group m-0" role="group" aria-labelledby="label-phone">
                                    <div class="form-row">
                                        <label id="label-phone" for="phone" class="col-md-3 col-form-label form-label">No of Family members  </label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlFamilyMember" CssClass="form-control" runat="server"> </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="accommodation" runat="server">
                                <div class="form-group m-0" role="group" aria-labelledby="label-skype">
                                    <div class="form-row">
                                        <label id="label-skype" for="skype" class="col-md-3 col-form-label form-label">Select the kind of accommodation you plan to have </label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlAccomdation" CssClass="form-control" runat="server"> </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="list-group-item" id="managemeal" runat="server">
                                <div class="form-group m-0" role="group" aria-labelledby="label-skypeDesc">
                                    <div class="form-row">
                                        <label id="label-skypeDesc" for="skypeDesc" class="col-md-3 col-form-label form-label">
                                            Select how you plan to manage meals
                                        </label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlCooking" CssClass="form-control" runat="server"></asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="transportchoice" runat="server">
                                <div class="form-group m-0" role="group" aria-labelledby="label-whatsapp">
                                    <div class="form-row">
                                        <label id="label-whatsapp" for="whatsapp" class="col-md-3 col-form-label form-label">Select your preferred choice of transport in the city  </label>
                                        <div class="col-md-6">
                                             <asp:DropDownList ID="ddltransportchoice" CssClass="form-control" runat="server"></asp:DropDownList>                                           
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="Trips" runat="server">
                                <div class="form-group m-0" role="group" aria-labelledby="label-skypeDesc">
                                    <div class="form-row">
                                        <label id="label-whatsappDesc" for="whatsappDesc" class="col-md-3 col-form-label form-label">No of Trips you plan to take to your home country in a year</label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlTrips" CssClass="form-control" runat="server">  </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="list-group-item" id="entertainment" runat="server">
                                <div class="form-group m-0" role="group" aria-labelledby="label-address">
                                    <div class="form-row">
                                        <label id="labelentertainment" for="address" class="col-md-3 col-form-label form-label">
                                            How often in a week do you typically go out (entertainment) 
                                        </label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlEntertainment" CssClass="form-control" runat="server"> </asp:DropDownList>
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
                                                        <th>Amount</th>
                                                    </tr>
                                                </thead>
                                                <tbody class="list">
                                                    <tr>
                                                        <td class="name">Private Finance  </td>
                                                        <td>
                                                            <input type="number" runat="server" id="txtPrivateFinancePercentage" value=0 class="form-control" />
                                                        </td>
                                                        <td>
                                                            <input type="number" disabled="disabled" id="txtCalcPrivateFinance" class="form-control" value=0>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="name">Scholarship </td>
                                                        <td>
                                                            <input type="number" runat="server" id="txtScholarshipPercentage" value=0 class="form-control" />
                                                        </td>
                                                        <td>
                                                            <input type="number" disabled="disabled" id="txtCalcScholarshipAmount" class="form-control" value=0>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="name">Student Loan </td>
                                                        <td>
                                                            <input type="number" runat="server" id="txtLoanPercentage" value=0 class="form-control" />
                                                        </td>
                                                        <td>
                                                            <input type="number" disabled="disabled" id="txtCalcLoanAmount" class="form-control" value=0>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="name">Sponsorship (Company/Family/Friends)</td>
                                                        <td>
                                                            <input type="number" runat="server" id="txtSponsorshipPercentage" value=0 class="form-control" />
                                                        </td>
                                                        <td>
                                                            <input type="number" disabled="disabled" id="txtCalcSponsorshipAmount" class="form-control" value=0>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="name">Part-time work alongside my study </td>
                                                        <td>
                                                            <input type="number" runat="server" id="txtPartTimeWorkPercentage" value=0 class="form-control" />
                                                        </td>
                                                        <td>
                                                            <input type="number" disabled="disabled" id="txtCalcPartimeAmount" class="form-control" value=0>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="name">Total</td>
                                                        <td>
                                                            <input type="number" runat="server" disabled="disabled" id="txtTotalPercentage" class="form-control" value=0>
                                                        </td>
                                                        <td>
                                                            <input type="number" disabled="disabled" id="txtSumTotalAmount" class="form-control" value=0>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>

                                        </div>
                                    </div>
                                </div>
                            </div>
                             <div class="list-group-item">
                            <div class="form-group m-0" role="group" aria-labelledby="label-employerwebsite">
                                <div class="form-row">
                                    <asp:Button ID="btn_fundingdetails" runat="server" Text="Save Changes" CssClass="btn btn-success" OnClick="btn_fundingdetails_Click"  OnClientClick="return validateForm()"/>
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
         function validateForm() {
            var flag = false;
            if ($("#<%=ddlstudy.ClientID%>").val() == "0")
                alert("Please Select Would you study-n-live alone or would your family members come along");
            else if ($("#<%=ddlstudy.ClientID%>").val() == "2" && $("#<%=ddlFamilyMember.ClientID%>").val() == "0")
                alert("Please Select No of Family members");
            else if ($("#<%=ddlAccomdation.ClientID%>").val() == "0")
                alert("Please Select the kind of accommodation you plan to have");
            else if ($("#<%=ddlCooking.ClientID%>").val() == "0")
                alert("Please Select  how you plan to manage meals");
            else if ($("#<%=ddltransportchoice.ClientID%>").val() == "0")
                alert("Please Select your preferred choice of transport in the city");
            else if ($("#<%=ddlTrips.ClientID%>").val() == "0")
                alert("Please Select No of Trips you plan to take to your home country in a year");
            else if ($("#<%=ddlEntertainment.ClientID%>").val() == "0")
                alert("Please Select  How often in a week do you typically go out (entertainment) ");
            else
                flag = true;
            
            return flag;
        }
        $(document).ready(function () {
            if ($("#<%=ddlstudy.ClientID%>").val() == "2")
                $("#familymember").show();
            else
                $("#familymember").hide();

            var Amount = 10000;
            $("#<%=txtPrivateFinancePercentage.ClientID%>").change(function () {
                var privateFinanceAmount = (Amount * $("#<%=txtPrivateFinancePercentage.ClientID%>").val()) / 100;
                $("#txtCalcPrivateFinance").val(privateFinanceAmount);
                var total = parseFloat($("#<%=txtPrivateFinancePercentage.ClientID%>").val()) + parseFloat($("#<%=txtScholarshipPercentage.ClientID%>").val()) + parseFloat($("#<%=txtLoanPercentage.ClientID%>").val()) + parseFloat($("#<%=txtSponsorshipPercentage.ClientID%>").val()) + parseFloat($("#<%=txtPartTimeWorkPercentage.ClientID%>").val());
                $("#<%=txtTotalPercentage.ClientID%>").val(total);
            });

            $("#<%=txtScholarshipPercentage.ClientID%>").change(function () {
                var scholarshipAmount = (Amount * $("#<%=txtScholarshipPercentage.ClientID%>").val()) / 100;
                $("#txtCalcScholarshipAmount").val(scholarshipAmount);
                var total = parseFloat($("#<%=txtPrivateFinancePercentage.ClientID%>").val()) + parseFloat($("#<%=txtScholarshipPercentage.ClientID%>").val()) + parseFloat($("#<%=txtLoanPercentage.ClientID%>").val()) + parseFloat($("#<%=txtSponsorshipPercentage.ClientID%>").val()) + parseFloat($("#<%=txtPartTimeWorkPercentage.ClientID%>").val());
                $("#<%=txtTotalPercentage.ClientID%>").val(total);
            });

            $("#<%=txtLoanPercentage.ClientID%>").change(function () {
                var loanAmount = (Amount * $("#<%=txtLoanPercentage.ClientID%>").val()) / 100;
                $("#txtCalcLoanAmount").val(loanAmount);
                var total = parseFloat($("#<%=txtPrivateFinancePercentage.ClientID%>").val()) + parseFloat($("#<%=txtScholarshipPercentage.ClientID%>").val()) + parseFloat($("#<%=txtLoanPercentage.ClientID%>").val()) + parseFloat($("#<%=txtSponsorshipPercentage.ClientID%>").val()) + parseFloat($("#<%=txtPartTimeWorkPercentage.ClientID%>").val());
                $("#<%=txtTotalPercentage.ClientID%>").val(total);
            });

            $("#<%=txtSponsorshipPercentage.ClientID%>").change(function () {
                var sponsorshipAmount = (Amount * $("#<%=txtSponsorshipPercentage.ClientID%>").val()) / 100;
                $("#txtCalcSponsorshipAmount").val(sponsorshipAmount);
                var total = parseFloat($("#<%=txtPrivateFinancePercentage.ClientID%>").val()) + parseFloat($("#<%=txtScholarshipPercentage.ClientID%>").val()) + parseFloat($("#<%=txtLoanPercentage.ClientID%>").val()) + parseFloat($("#<%=txtSponsorshipPercentage.ClientID%>").val()) + parseFloat($("#<%=txtPartTimeWorkPercentage.ClientID%>").val());
                $("#<%=txtTotalPercentage.ClientID%>").val(total);
            });

            $("#<%=txtPartTimeWorkPercentage.ClientID%>").change(function () {
                var partTimeWorkAmount = (Amount * $("#<%=txtPartTimeWorkPercentage.ClientID%>").val()) / 100;
                $("#txtCalcPartimeAmount").val(partTimeWorkAmount);
                var total = parseFloat($("#<%=txtPrivateFinancePercentage.ClientID%>").val()) + parseFloat($("#<%=txtScholarshipPercentage.ClientID%>").val()) + parseFloat($("#<%=txtLoanPercentage.ClientID%>").val()) + parseFloat($("#<%=txtSponsorshipPercentage.ClientID%>").val()) + parseFloat($("#<%=txtPartTimeWorkPercentage.ClientID%>").val());
                $("#<%=txtTotalPercentage.ClientID%>").val(total);
            });

            $("#<%=txtPrivateFinancePercentage.ClientID%>").blur(function () {
                checkContributionPercentage();
            });
            $("#<%=txtScholarshipPercentage.ClientID%>").blur(function () {
                checkContributionPercentage();
            });
            $("#<%=txtLoanPercentage.ClientID%>").blur(function () {
                checkContributionPercentage();
            });
            $("#<%=txtSponsorshipPercentage.ClientID%>").blur(function () {
                checkContributionPercentage();
            });
            $("#<%=txtPartTimeWorkPercentage.ClientID%>").blur(function () {
                checkContributionPercentage();
            });
            
        });
        
        function checkContributionPercentage() {
            var privateFinancePercentage = parseFloat($("#<%=txtPrivateFinancePercentage.ClientID%>").val());
            var scholarshipPercentage = parseFloat($("#<%=txtScholarshipPercentage.ClientID%>").val());
            var loanPercentage = parseFloat($("#<%=txtLoanPercentage.ClientID%>").val());
            var sponsorshipPercentage = parseFloat($("#<%=txtSponsorshipPercentage.ClientID%>").val());
            var partTimeWorkPercentage = parseFloat($("#<%=txtPartTimeWorkPercentage.ClientID%>").val());

            var privateFinanceAmount = parseInt($("#txtCalcPrivateFinance").val());
            var scholarshipAmount = parseInt($("#txtCalcScholarshipAmount").val());
            var loanAmount = parseInt($("#txtCalcLoanAmount").val());
            var sponsorshipAmount = parseInt($("#txtCalcSponsorshipAmount").val());
            var partTimeWorkAmount = parseInt($("#txtCalcPartimeAmount").val());

            var total = privateFinancePercentage + scholarshipPercentage + loanPercentage + sponsorshipPercentage + partTimeWorkPercentage;
            var totalAmount = privateFinanceAmount + scholarshipAmount + loanAmount + sponsorshipAmount + partTimeWorkAmount;
            $("#txtSumTotalAmount").val(totalAmount);

            if (total > 100)
                alert("Please check contribution percentage once again as total exceeds 100");
        }
    </script>
</asp:Content>

