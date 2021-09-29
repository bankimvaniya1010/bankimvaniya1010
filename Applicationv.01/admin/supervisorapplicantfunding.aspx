<%@ Page Language="C#" AutoEventWireup="true" CodeFile="supervisorapplicantfunding.aspx.cs" Inherits="admin_supervisorapplicantfunding" MasterPageFile="~/admin/admin.master" %>

<asp:Content ID="content1" runat="server" ContentPlaceHolderID="head">
    <title></title>
    <script>

</script>
</asp:Content>
<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="container page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">My Dashboard</a></li>
            <li class="breadcrumb-item active">Applicant funding details</li>
        </ol>
        <h1 class="h2">Applicant funding details</h1>
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
                            <div class="col-md-4">
                                <asp:Label ID="lblstudy" runat="server"></asp:Label>
                            </div>
                            <div class="col-md-4">
                                <asp:RadioButton ID="rblstudyYes" GroupName="study" Text="Yes" runat="server" />
                                <asp:RadioButton ID="rblstudyNo" GroupName="study" Text="No" runat="server" />
                                <asp:Label ID="lblstudyComments" runat="server"></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="familymember" runat="server">
                    <div class="form-group m-0" role="group" aria-labelledby="label-phone">
                        <div class="form-row">
                            <label id="label-phone" for="phone" class="col-md-3 col-form-label form-label">No of Family members  </label>
                            <div class="col-md-4">
                                <asp:Label ID="lblfamilymember" runat="server"></asp:Label>
                            </div>
                            <div class="col-md-4">
                                <asp:RadioButton ID="rblfamilymemberYes" GroupName="familymember" Text="Yes" runat="server" />
                                <asp:RadioButton ID="rblfamilymemberNo" GroupName="familymember" Text="No" runat="server" />
                                <asp:Label ID="lblfamilymemberComments" runat="server"></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="accommodation" runat="server">
                    <div class="form-group m-0" role="group" aria-labelledby="label-skype">
                        <div class="form-row">
                            <label id="label-skype" for="skype" class="col-md-3 col-form-label form-label">Select the kind of accommodation you plan to have </label>
                            <div class="col-md-4">
                                <asp:Label ID="lblaccommodation" runat="server"></asp:Label>
                            </div>
                            <div class="col-md-4">
                                <asp:RadioButton ID="rblaccommodationYes" GroupName="accommodation" Text="Yes" runat="server" />
                                <asp:RadioButton ID="rblaccommodationNo" GroupName="accommodation" Text="No" runat="server" />
                                <asp:Label ID="lblaccommodationComments" runat="server"></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="list-group-item" id="managemeal" runat="server">
                    <div class="form-group m-0" role="group" aria-labelledby="label-skypeDesc">
                        <div class="form-row">
                            <label id="label-skypeDesc" for="skypeDesc" class="col-md-3 col-form-label form-label">
                                Select the kind of accommodation you plan to have
                            </label>
                            <div class="col-md-4">
                                <asp:Label ID="lblmanagemeal" runat="server"></asp:Label>
                            </div>
                            <div class="col-md-4">
                                <asp:RadioButton ID="rblmanagemealYes" GroupName="managemeal" Text="Yes" runat="server" />
                                <asp:RadioButton ID="rblmanagemealNo" GroupName="managemeal" Text="No" runat="server" />
                                <asp:Label ID="lblmanagemealComments" runat="server"></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="transportchoice" runat="server">
                    <div class="form-group m-0" role="group" aria-labelledby="label-whatsapp">
                        <div class="form-row">
                            <label id="label-whatsapp" for="whatsapp" class="col-md-3 col-form-label form-label">Select your preferred choice of transport in the city  </label>
                            <div class="col-md-4">
                                <asp:Label ID="lbltransportchoice" runat="server"></asp:Label>
                            </div>
                            <div class="col-md-4">
                                <asp:RadioButton ID="rbltransportchoiceYes" GroupName="transportchoice" Text="Yes" runat="server" />
                                <asp:RadioButton ID="rbltransportchoiceNo" GroupName="transportchoice" Text="No" runat="server" />
                                <asp:Label ID="lbltransportchoiceComments" runat="server"></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="Trips" runat="server">
                    <div class="form-group m-0" role="group" aria-labelledby="label-skypeDesc">
                        <div class="form-row">
                            <label id="label-whatsappDesc" for="whatsappDesc" class="col-md-3 col-form-label form-label">No of Trips you plan to take to your home country in a year</label>
                            <div class="col-md-4">
                                <asp:Label ID="lblTrips" runat="server"></asp:Label>
                            </div>
                            <div class="col-md-4">
                                <asp:RadioButton ID="rblTripsYes" GroupName="Trips" Text="Yes" runat="server" />
                                <asp:RadioButton ID="rblTripsNo" GroupName="Trips" Text="No" runat="server" />
                                <asp:Label ID="lblTripsComments" runat="server"></asp:Label>
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
                            <div class="col-md-4">
                                <asp:Label ID="lblentertainment" runat="server"></asp:Label>
                            </div>
                            <div class="col-md-4">
                                <asp:RadioButton ID="rblentertainmentYes" GroupName="entertainment" Text="Yes" runat="server" />
                                <asp:RadioButton ID="rblentertainmentNo" GroupName="entertainment" Text="No" runat="server" /><asp:Label ID="lblentertainmentComments" runat="server"></asp:Label>
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
                    <div class="form-group m-0" role="group" aria-labelledby="label-agentList">
                        <div class="form-row">
                            <label for="agentList" class="col-md-3 col-form-label form-label">Superviosr Action</label>
                            <div class="col-md-4">
                                <input type="radio" id="rbApproved" runat="server" name="supervisorAction">
                                Approved
                                <input type="radio" id="rbDenied" runat="server" name="supervisorAction">Further Review
                            </div>
                            <div class="col-md-4">
                                <asp:TextBox ID="txtComments" TextMode="MultiLine" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="list-group-item">
                    <div class="form-group m-0" role="group" aria-labelledby="label-employerwebsite">
                        <div class="form-row">
                            <asp:Button ID="btn_fundingdetails" runat="server" Text="Save Changes" CssClass="btn btn-success" OnClick="btn_fundingdetails_Click" />
                            <div class="col-md-6">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


    </div>
</asp:Content>

