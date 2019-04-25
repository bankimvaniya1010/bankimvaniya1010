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
                            <div class="list-group-item">
                                <div class="form-group m-0" role="group" aria-labelledby="label-calculator">
                                    <div class="form-row">
                                        <label id="label-calculator" for="calculator" class="col-md-3 col-form-label form-label">StudyNlive Budget Calculator</label>

                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item">
                                <div class="form-group m-0" role="group" aria-labelledby="label-Mobile">
                                    <div class="form-row">
                                        <label id="label-Mobile" for="Mobile" class="col-md-3 col-form-label form-label">Would you study-n-live alone or would your family members come along </label>
                                        <div class="col-md-6">
                                            <asp:RadioButton ID="rblSingle" runat="server" CssClass="form-control" GroupName="Family" Text="Single" />
                                            <asp:RadioButton ID="rblFamily" runat="server" CssClass="form-control" GroupName="Family" Text="Family" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item">
                                <div class="form-group m-0" role="group" aria-labelledby="label-phone">
                                    <div class="form-row">
                                        <label id="label-phone" for="phone" class="col-md-3 col-form-label form-label">No of Family members  </label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlFamilyMember" CssClass="form-control" runat="server">
                                                <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                                <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                                <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                                <asp:ListItem Text="4" Value="4"></asp:ListItem>
                                                <asp:ListItem Text="5" Value="5"></asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item">
                                <div class="form-group m-0" role="group" aria-labelledby="label-skype">
                                    <div class="form-row">
                                        <label id="label-skype" for="skype" class="col-md-3 col-form-label form-label">Select the kind of accommodation you plan to have </label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlAccomdation" CssClass="form-control" runat="server">
                                                <asp:ListItem Text="On-Campus - Shared" Value="On-Campus - Shared"></asp:ListItem>
                                                <asp:ListItem Text="On Campus-private" Value="On Campus-private"></asp:ListItem>
                                                <asp:ListItem Text="Off Campus - Shared" Value=" Off Campus - Shared"></asp:ListItem>
                                                <asp:ListItem Text="Off Campus - Private" Value="Off Campus - Private"></asp:ListItem>
                                                <asp:ListItem Text="Homestay" Value="Homestay"></asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="list-group-item" id="skypeDesc">
                                <div class="form-group m-0" role="group" aria-labelledby="label-skypeDesc">
                                    <div class="form-row">
                                        <label id="label-skypeDesc" for="skypeDesc" class="col-md-3 col-form-label form-label">
                                            Select how you plan to manage meals
                                        </label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlCooking" CssClass="form-control" runat="server">
                                                <asp:ListItem Text="Buy groceries and cook" Value="Buy groceries and cook"></asp:ListItem>
                                                <asp:ListItem Text="Eat out" Value="Eat out"></asp:ListItem>
                                                <asp:ListItem Text="Use boarding and lodging plans" Value="Use boarding and lodging plans"></asp:ListItem>

                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item">
                                <div class="form-group m-0" role="group" aria-labelledby="label-whatsapp">
                                    <div class="form-row">
                                        <label id="label-whatsapp" for="whatsapp" class="col-md-3 col-form-label form-label">Select your preferred choice of transport in the city  </label>
                                        <div class="col-md-6">
                                            <asp:RadioButton ID="rblTrvelYes" runat="server" CssClass="form-control" GroupName="Travel" Text="Private car" />
                                            <asp:RadioButton ID="rblTrvelNo" runat="server" CssClass="form-control" GroupName="Travel" Text="Public Transport" />

                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="whatsappDesc">
                                <div class="form-group m-0" role="group" aria-labelledby="label-skypeDesc">
                                    <div class="form-row">
                                        <label id="label-whatsappDesc" for="whatsappDesc" class="col-md-3 col-form-label form-label">No of Trips you plan to take to your home country in a year</label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlTrips" CssClass="form-control" runat="server">
                                                <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                                <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                                <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                                <asp:ListItem Text="4" Value="4"></asp:ListItem>
                                                <asp:ListItem Text="5" Value="5"></asp:ListItem>

                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="list-group-item">
                                <div class="form-group m-0" role="group" aria-labelledby="label-address">
                                    <div class="form-row">
                                        <label id="label-address" for="address" class="col-md-3 col-form-label form-label">
                                            How often in a week do you typically go out (entertainment) 
                                        </label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlEntertainment" CssClass="form-control" runat="server">
                                                <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                                <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                                <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                                <asp:ListItem Text="4" Value="4"></asp:ListItem>
                                                <asp:ListItem Text="5" Value="5"></asp:ListItem>

                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="list-group-item" id="employerwebsite">
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

                            <div class="list-group-item">
                                <div class="form-group m-0" role="group" aria-labelledby="label-address">
                                    <div class="form-row">
                                        <label id="label-address" for="address" class="col-md-9 col-form-label form-label">
                                            How do you plan to fund your education and living costs of $10,000 per annum or S30000 for the duration of your course 
                                        </label>
                                       
                                    </div>
                                </div>
                            </div>

                            <div class="list-group-item" id="employerwebsite">
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

</asp:Content>

