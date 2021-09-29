<%@ Page Language="C#" AutoEventWireup="true" CodeFile="applicantfunding.aspx.cs" Inherits="applicantfunding" MasterPageFile="~/student.master" %>

<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">


    <div class="container-fluid page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">My Dashboard</a></li>
            <li class="breadcrumb-item active">COST CALCULATOR</li>
        </ol>
        <h1 class="h2">CALCULATE AND PLAN YOUR BUDGET USING THE COST CALCULATOR</h1>

    </div>
    <div class="page ">
        <div class="container page__container">
            <div class="row">
                <div class="col-md-8">

                    <div class="card">

                        <div class="card-body list-group list-group-fit">
                            <div class="list-group-item" id="study" runat="server">
                                <div class="form-group m-0" role="group" aria-labelledby="label-Mobile">
                                    <div class="form-row">
                                        <label id="label-Mobile" for="Mobile" class="col-md-5 col-form-label form-label">Would you study-n-live alone or with family members?</label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlstudy" CssClass="form-control" runat="server"></asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="familymember">
                                <div class="form-group m-0" role="group" aria-labelledby="label-phone">
                                    <div class="form-row">
                                        <label id="label-phone" for="phone" class="col-md-5 col-form-label form-label">No of Family members  </label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlFamilyMember" CssClass="form-control" runat="server"> </asp:DropDownList>
                                        </div>
                                    </div>
                                    <br/>
                                    <div class="form-row">
                                        <label id="label-family-adult" for="phone" class="col-md-3 col-form-label form-label">No of Adult Family members  </label>
                                        <div class="col-md-3">
                                            <asp:DropDownList ID="ddlFamilyAdult" CssClass="form-control" runat="server"></asp:DropDownList>
                                        </div>
                                        <label id="label-family-children" for="phone" class="col-md-3 col-form-label form-label">No of Children in Family  </label>
                                        <div class="col-md-3">
                                            <asp:DropDownList ID="ddlFamilyChildren" CssClass="form-control" runat="server"></asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="accommodation" runat="server">
                                <div class="form-group m-0" role="group" aria-labelledby="label-skype">
                                    <div class="form-row">
                                        <label id="label-skype" for="skype" class="col-md-5 col-form-label form-label">What type of accommodation do you plan to have? </label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlAccomdation" CssClass="form-control" runat="server"> </asp:DropDownList>
                                        </div>
                                        <asp:HiddenField ID="hidAccomdation" runat="server" />
                                    </div>
                                </div>
                            </div>

                            <div class="list-group-item" id="managemeal" runat="server">
                                <div class="form-group m-0" role="group" aria-labelledby="label-skypeDesc">
                                    <div class="form-row">
                                        <label id="label-skypeDesc" for="skypeDesc" class="col-md-5 col-form-label form-label"> How do you plan to manage meals? </label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlCooking" CssClass="form-control" runat="server"></asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="transportchoice" runat="server">
                                <div class="form-group m-0" role="group" aria-labelledby="label-whatsapp">
                                    <div class="form-row">
                                        <label id="label-whatsapp" for="whatsapp" class="col-md-5 col-form-label form-label"> How would you be getting around the city?  </label>
                                        <div class="col-md-6">
                                             <asp:DropDownList ID="ddltransportchoice" CssClass="form-control" runat="server"></asp:DropDownList>                                           
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="Trips" runat="server">
                                <div class="form-group m-0" role="group" aria-labelledby="label-skypeDesc">
                                    <div class="form-row">
                                        <label id="label-whatsappDesc" for="whatsappDesc" class="col-md-5 col-form-label form-label">How Many trips do you plan to take to your home country in an year?</label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlTrips" CssClass="form-control" runat="server">  </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="list-group-item" id="entertainment" runat="server">
                                <div class="form-group m-0" role="group" aria-labelledby="label-address">
                                    <div class="form-row">
                                        <label id="labelentertainment" for="address" class="col-md-5 col-form-label form-label"> How often do you typically go out in a week?</label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlEntertainment" CssClass="form-control" runat="server"> </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="list-group-item">
                                <div class="form-group">
                                    <div class="form-row">
                                        <asp:Button ID="btnCalculateCosts" runat="server" CssClass="btn btn-success" Text="Calculate My Estimated Costs" OnClientClick="return validateForm()" OnClick="btnCalculateCosts_Click" />
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="cost" runat="server" style ="display:none">
                                <asp:HiddenField ID="hidCurrency" runat="server" />
                                <div class="form-group m-0" role="group" aria-labelledby="label-employerwebsite">
                                    <div class="form-row">

                                        <div class="col-md-12">
                                            <table class="table">
                                                <thead>
                                                    <tr>
                                                        <th>Cost Head</th>
                                                        <th>Curerncy</th>
                                                        <th>Cost Per Year</th>
                                                    </tr>
                                                </thead>
                                                <tbody class="list">
                                                    <tr>
                                                        <td class="name">Estimated Tuition Fee </td>
                                                        <td> <%=hidCurrency.Value %> </td>
                                                        <td id="tution_fee" runat='server'></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="name">Estimated Living Expenses </td>
                                                        <td> <%=hidCurrency.Value %> </td>
                                                        <td id="living_cost1" runat='server'></td>
                                                    </tr>
                                                    <tr style="font-weight:bold">
                                                        <td class="name">Total Estimated Expenses </td>
                                                        <td> <%=hidCurrency.Value %> </td>
                                                        <td id="grand_total" runat='server'></td>
                                                    </tr>
                                                    <tr style="font-weight:bold">
                                                        <td>Break down of Living Costs </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="name">Accommodation  </td>
                                                        <td> <%=hidCurrency.Value %> </td>
                                                        <td id="accomodation_cost" runat='server'></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="name">Meals / Groceries  </td>
                                                        <td> <%=hidCurrency.Value %> </td>
                                                        <td id="meals_cost" runat='server'></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="name">Transportation </td>
                                                        <td> <%=hidCurrency.Value %> </td>
                                                        <td id="transportation_cost" runat='server'></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="name">Travel & related  </td>
                                                        <td> <%=hidCurrency.Value %> </td>
                                                        <td id="trips_cost" runat='server'></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="name">Utilities, including Phone & internet </td>
                                                        <td> <%=hidCurrency.Value %> </td>
                                                        <td id="utilities_cost" runat='server'></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="name">Entertainment  </td>
                                                        <td> <%=hidCurrency.Value %> </td>
                                                        <td id="entertainment_cost" runat='server'></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="name">Health Insurance   </td>
                                                        <td> <%=hidCurrency.Value %> </td>
                                                        <td id="health_insurance_cost" runat='server'></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="name">Visa Costs(First Year) </td>
                                                        <td> <%=hidCurrency.Value %> </td>
                                                        <td id="visa_cost" runat='server'></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="name">Totals  </td>
                                                        <td> <%=hidCurrency.Value %> </td>
                                                        <td id="living_cost" runat='server'></td>
                                                    </tr>
                                                </tbody>
                                            </table>

                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="list-group-item" id="funding" runat="server" style ="display:none">
                                <asp:HiddenField ID="hidAmount" runat="server" />
                                <div class="form-group m-0" role="group" aria-labelledby="label-employerwebsite">
                                    <div class="form-row">
                                        <label id="labelfunding" for="address" class="col-form-label form-label">
                                            How do you plan to fund your education and living costs of <%=hidCurrency.Value %> <%=hidAmount.Value %> for the duration of your course 
                                        </label>
                                       
                                    </div>
                                    <div class="form-row">

                                        <div class="col-md-12">
                                            <table class="table fundng-tbl">
                                                <thead>
                                                    <tr>
                                                        <th class="frst-rw">Funding Source</th>
                                                        <th class="sec-rw">% Contribution (Amount) </th>
                                                        <th class="third-rw">Amount</th>
                                                    </tr>
                                                </thead>
                                                <tbody class="list">
                                                    <tr>
                                                        <td class="name frst-rw">Private Finance  </td>
                                                        <td class="sec-rw">
                                                            <input type="number" runat="server" id="txtPrivateFinancePercentage" value=0 class="form-control" />
                                                        </td>
                                                        <td class="third-rw">
                                                            <input type="text" disabled="disabled" id="txtCalcPrivateFinance" class="form-control" value=0>
                                                            <%--<span id="txtCalcPrivateFinance"></span>--%>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="name frst-rw">Scholarship </td>
                                                        <td class="sec-rw">
                                                            <input type="number" runat="server" id="txtScholarshipPercentage" value=0 class="form-control" />
                                                        </td>
                                                        <td class="third-rw">
                                                            <input type="text" disabled="disabled" id="txtCalcScholarshipAmount" class="form-control" value=0>
                                                            <%--<span id="txtCalcScholarshipAmount"></span>--%>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="name frst-rw">Student Loan </td>
                                                        <td class="sec-rw">
                                                            <input type="number" runat="server" id="txtLoanPercentage" value=0 class="form-control" />
                                                        </td>
                                                        <td class="third-rw">
                                                            <input type="text" disabled="disabled" id="txtCalcLoanAmount" class="form-control" value=0>
                                                            <%--<span id="txtCalcLoanAmount"></span>--%>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="name frst-rw">Sponsorship (Company/Family/Friends)</td>
                                                        <td class="sec-rw">
                                                            <input type="number" runat="server" id="txtSponsorshipPercentage" value=0 class="form-control" />
                                                        </td>
                                                        <td class="third-rw">
                                                            <input type="text" disabled="disabled" id="txtCalcSponsorshipAmount" class="form-control" value=0>
                                                            <%--<span id="txtCalcSponsorshipAmount"></span>--%>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="name frst-rw">Part-time work alongside my study </td>
                                                        <td class="sec-rw">
                                                            <input type="number" runat="server" id="txtPartTimeWorkPercentage" value=0 class="form-control" />
                                                        </td>
                                                        <td class="third-rw">
                                                            <input type="text" disabled="disabled" id="txtCalcPartimeAmount" class="form-control" value=0>
                                                            <%--<span id="txtCalcPartimeAmount"></span>--%>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="name frst-rw">Total</td>
                                                        <td class="sec-rw">
                                                            <input type="number" runat="server" disabled="disabled" id="txtTotalPercentage" class="form-control" value=0>
                                                        </td>
                                                        <td class="third-rw">                                                           
                                                           <input type="text" disabled="disabled" id="txtSumTotalAmount" class="form-control" value=0>
                                                            <%--<span id="txtSumTotalAmount"></span>--%>
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
                                    <asp:Button ID="btn_fundingdetails" runat="server" Text="Save" CssClass="btn btn-success" OnClick="btn_fundingdetails_Click"  OnClientClick="return validateForm()"/>
                                    <div class="col-md-6">
                                    </div>
                                </div>
                            </div>
                        </div>
                        </div>
                    </div>
                    </div>
                    <div class="col-md-4">
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
                                                <label onclick="showFaqQuestion('<%=allQuestions[q].question%>','<%=allQuestions[q].answer.Replace(Environment.NewLine, "<br />") %>')"> <%=allQuestions[q].question%> </label>
                                            </div>                                                  
                                    <%} %>
                                </div>
                            </div>      
                                <%} %>  
                                     
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
            else if ($("#<%=ddlstudy.ClientID%>").val() == "2" && !isvalidFamilyDetails()) { }
            else if ($("#<%=hidAccomdation.ClientID%>").val() == "" || $("#<%=ddlAccomdation.ClientID%>").val() == "0")
                alert("Please Select the kind of accommodation you plan to have");
            else if ($("#<%=ddlCooking.ClientID%>").val() == "0")
                alert("Please Select  how you plan to manage meals");
            else if ($("#<%=ddltransportchoice.ClientID%>").val() == "0")
                alert("Please Select your preferred choice of transport in the city");
            else if ($("#<%=ddlTrips.ClientID%>").val() == "0")
                alert("Please Select No of Trips you plan to take to your home country per year");
            else if ($("#<%=ddlEntertainment.ClientID%>").val() == "0")
                alert("Please Select  How often in a week do you typically go out (entertainment) ");            
            else
                flag = true;
            
            return flag;
        }

        function isvalidFamilyDetails() {
            var flag = false;

            var totalFamilyMembers = parseInt($("#<%=ddlFamilyMember.ClientID%>").val()) + 1;
            var adultFamilyMembers = parseInt($("#<%=ddlFamilyAdult.ClientID%>").val());
            var childFamilyMembers = parseInt($("#<%=ddlFamilyChildren.ClientID%>").val());

            if ($("#<%=ddlFamilyMember.ClientID%>").val() == "0")
                alert("Please Select No of Family members");
            else if (totalFamilyMembers !== (adultFamilyMembers + childFamilyMembers + 1))
                alert("Please select appropriate family members as No of Family members does not match Adult/Child members.");
            else
                flag = true;

            return flag;
        }

         $(function() {
            $("#<%=ddlstudy.ClientID%>").change(function() {
                $("#<%=hidAccomdation.ClientID%>").val("");
                $("#<%=ddlAccomdation.ClientID%>").val("0");
                hidecostandbutton();
                if ($(this).val() == "2") {
                    $("#familymember").show();                    
                    removeAccommodationOptionsForFamily();
                }
                else {
                    $("#familymember").hide(); 
                     $("#<%=ddlFamilyMember.ClientID%>").val("0");
                     var accomdationItem = $('#<%=ddlAccomdation.ClientID%>').children('option').length;
                    if (accomdationItem <= 3)
                        addAccommodationOptionsForSingle();
                }
            });
        });

        $(function () {
            $("#<%=ddlAccomdation.ClientID%>").change(function () {
                $("#<%=hidAccomdation.ClientID%>").val($("#<%=ddlAccomdation.ClientID%>").val());
            });
        });

        function addAccommodationOptionsForSingle() {
            $("#<%=ddlAccomdation.ClientID%> option").remove();
            $("#<%=ddlAccomdation.ClientID%>").append($('<option selected="selected" disabled="disabled"></option>').val("0").html("Please select"));
            $.ajax({
                type: "GET",
                url: "applicantfunding.aspx/GetAccommodationOptions",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    if (response.d) {
                        var result = JSON.parse(response.d);
                        for (var i = 0; i < result.length; i++)
                            $('#<%=ddlAccomdation.ClientID%>').append($("<option></option>").val(result[i].id).html(result[i].description));
                    }
                }
            });
        }

        function removeAccommodationOptionsForFamily() {
            $('#<%=ddlAccomdation.ClientID%> option:contains(On-Campus - Shared)').remove();
            $('#<%=ddlAccomdation.ClientID%> option:contains(On Campus - Private)').remove();
            $('#<%=ddlAccomdation.ClientID%> option:contains(Off Campus - Shared)').remove();
        }
        $(document).ready(function () {

            $("#<%=btn_fundingdetails.ClientID%>").attr("disabled", "disabled");            
                        
            if ($("#<%=ddlstudy.ClientID%>").val() == "2") {
                $("#familymember").show();
                removeAccommodationOptionsForFamily();
            }
            else
                $("#familymember").hide();


            getprivateFinanceAmount();
            getscholarshipAmount();
            getloanAmount();
            getsponsorshipAmount();
            getpartTimeWorkAmount();
            checkContributionPercentage();

            $("#<%=txtPrivateFinancePercentage.ClientID%>").change(function () {
                getprivateFinanceAmount();
            });

            $("#<%=txtScholarshipPercentage.ClientID%>").change(function () {
                getscholarshipAmount();
            });

            $("#<%=txtLoanPercentage.ClientID%>").change(function () {
                getloanAmount();
            });

            $("#<%=txtSponsorshipPercentage.ClientID%>").change(function () {
                getsponsorshipAmount();
            });

            $("#<%=txtPartTimeWorkPercentage.ClientID%>").change(function () {
                getpartTimeWorkAmount();
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

            var privateFinanceAmount = parseFloat($("#txtCalcPrivateFinance").val());
            var scholarshipAmount = parseFloat($("#txtCalcScholarshipAmount").val());
            var loanAmount = parseFloat($("#txtCalcLoanAmount").val());
            var sponsorshipAmount = parseFloat($("#txtCalcSponsorshipAmount").val());
            var partTimeWorkAmount = parseFloat($("#txtCalcPartimeAmount").val());

            var total = privateFinancePercentage + scholarshipPercentage + loanPercentage + sponsorshipPercentage + partTimeWorkPercentage;
            var totalAmount = Math.round(privateFinanceAmount + scholarshipAmount + loanAmount + sponsorshipAmount + partTimeWorkAmount);
            $("#txtSumTotalAmount").val(totalAmount);

            if (total > 100 || total != 100) 
                $("#<%=btn_fundingdetails.ClientID%>").attr("disabled", "disabled");
            else
                $("#<%=btn_fundingdetails.ClientID%>").removeAttr("disabled");

        }

        var Amount = parseInt(<%=hidAmount.Value%>);

        function getprivateFinanceAmount()
        {
	        var privateFinanceAmount = Math.round(Amount * $("#<%=txtPrivateFinancePercentage.ClientID%>").val()) / 100;
            $("#txtCalcPrivateFinance").val(privateFinanceAmount);
            var total = parseFloat($("#<%=txtPrivateFinancePercentage.ClientID%>").val()) + parseFloat($("#<%=txtScholarshipPercentage.ClientID%>").val()) + parseFloat($("#<%=txtLoanPercentage.ClientID%>").val()) + parseFloat($("#<%=txtSponsorshipPercentage.ClientID%>").val()) + parseFloat($("#<%=txtPartTimeWorkPercentage.ClientID%>").val());
            $("#<%=txtTotalPercentage.ClientID%>").val(total);
        }

        function getscholarshipAmount()
        {
	        var scholarshipAmount = Math.round(Amount * $("#<%=txtScholarshipPercentage.ClientID%>").val()) / 100;
            $("#txtCalcScholarshipAmount").val(scholarshipAmount);
            var total = parseFloat($("#<%=txtPrivateFinancePercentage.ClientID%>").val()) + parseFloat($("#<%=txtScholarshipPercentage.ClientID%>").val()) + parseFloat($("#<%=txtLoanPercentage.ClientID%>").val()) + parseFloat($("#<%=txtSponsorshipPercentage.ClientID%>").val()) + parseFloat($("#<%=txtPartTimeWorkPercentage.ClientID%>").val());
            $("#<%=txtTotalPercentage.ClientID%>").val(total);
        }

        function getloanAmount()
        {
	        var loanAmount = Math.round(Amount * $("#<%=txtLoanPercentage.ClientID%>").val()) / 100;
            $("#txtCalcLoanAmount").val(loanAmount);
            var total = parseFloat($("#<%=txtPrivateFinancePercentage.ClientID%>").val()) + parseFloat($("#<%=txtScholarshipPercentage.ClientID%>").val()) + parseFloat($("#<%=txtLoanPercentage.ClientID%>").val()) + parseFloat($("#<%=txtSponsorshipPercentage.ClientID%>").val()) + parseFloat($("#<%=txtPartTimeWorkPercentage.ClientID%>").val());
            $("#<%=txtTotalPercentage.ClientID%>").val(total);
        }

        function getsponsorshipAmount()
        {
	        var sponsorshipAmount = Math.round(Amount * $("#<%=txtSponsorshipPercentage.ClientID%>").val()) / 100;
            $("#txtCalcSponsorshipAmount").val(sponsorshipAmount);
            var total = parseFloat($("#<%=txtPrivateFinancePercentage.ClientID%>").val()) + parseFloat($("#<%=txtScholarshipPercentage.ClientID%>").val()) + parseFloat($("#<%=txtLoanPercentage.ClientID%>").val()) + parseFloat($("#<%=txtSponsorshipPercentage.ClientID%>").val()) + parseFloat($("#<%=txtPartTimeWorkPercentage.ClientID%>").val());
            $("#<%=txtTotalPercentage.ClientID%>").val(total);
        } 

        function getpartTimeWorkAmount()
        {
	        var partTimeWorkAmount = Math.round(Amount * $("#<%=txtPartTimeWorkPercentage.ClientID%>").val()) / 100;
            $("#txtCalcPartimeAmount").val(partTimeWorkAmount);
            var total = parseFloat($("#<%=txtPrivateFinancePercentage.ClientID%>").val()) + parseFloat($("#<%=txtScholarshipPercentage.ClientID%>").val()) + parseFloat($("#<%=txtLoanPercentage.ClientID%>").val()) + parseFloat($("#<%=txtSponsorshipPercentage.ClientID%>").val()) + parseFloat($("#<%=txtPartTimeWorkPercentage.ClientID%>").val());
            $("#<%=txtTotalPercentage.ClientID%>").val(total);
        }

        function hidecostandbutton()
        {
            $("#<%=cost.ClientID%>").hide();
            $("#<%=funding.ClientID%>").hide();
            $("#<%=btn_fundingdetails.ClientID%>").attr("disabled", "disabled");
        }
        $(function () {
            $("#<%=ddlFamilyMember.ClientID%>").change(function () {
                hidecostandbutton();
            });
        });
        $(function () {
            $("#<%=ddlFamilyAdult.ClientID%>").change(function () {
                hidecostandbutton();
            });
        });
        $(function () {
            $("#<%=ddlFamilyChildren.ClientID%>").change(function () {
                hidecostandbutton();
            });
        });
        $(function () {
            $("#<%=ddlAccomdation.ClientID%>").change(function () {
                hidecostandbutton();
            });
        });
        $(function () {
            $("#<%=ddlCooking.ClientID%>").change(function () {
                hidecostandbutton();
            });
        });
        $(function () {
            $("#<%=ddltransportchoice.ClientID%>").change(function () {
                hidecostandbutton();
            });
        });
        $(function () {
            $("#<%=ddlTrips.ClientID%>").change(function () {
                hidecostandbutton();
            });
        });
        $(function () {
            $("#<%=ddlEntertainment.ClientID%>").change(function () {
                hidecostandbutton();
            });
        });
        $(document).ready(function () {
            $('.sidebar-menu-item').removeClass('open');
            $('#studentapplication_finances').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#applicantfunding').addClass('active');
        });
    </script>
</asp:Content>

