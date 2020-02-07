<%@ Page Language="C#" AutoEventWireup="true" CodeFile="verifyemployment.aspx.cs" Inherits="verifyemployment" %>

<!DOCTYPE html>

<html lang="en" dir="ltr">
<head runat="server">
    <title></title>
    <!-- App CSS -->
    <link type="text/css" href="assets/css/app.css" rel="stylesheet">
    <link type="text/css" href="assets/css/app.rtl.css" rel="stylesheet">
</head>
<body>
    <form id="form1" runat="server" onsubmit="return validateForm()">

        <div class="page ">
            <div class="container page__container">
                <div class="row">
                    <div class="col-md-8">
                        <div class="card">
                            <div class="card-body list-group list-group-fit">
                                <div id="questionDIv" runat="server">
                                    <div class="list-group-item" id="question1" runat="server">
                                        <div class="form-group m-0" role="group" aria-labelledby="label-email">
                                            <div class="form-row">
                                                <label id="label-question1" class="col-md-12 col-form-label form-label">1. Can you verify the below-mentioned details about <%= lblfirstname %>’s work experience?</label>

                                                <asp:Label runat="server" class="col-md-5 form-label">Name of Employer Organisation: </asp:Label><label runat="server" id="lblnameoforganisation" class="col-md-5"></label><br />
                                                <asp:Label runat="server" class="col-md-5 form-label">Term of Employment: </asp:Label><label runat="server" id="lblyearsofworkexper" class="col-md-5"></label><br />
                                                <asp:Label runat="server" class="col-md-5 form-label">Job Role/Position:  </asp:Label><label runat="server" id="lblposition" class="col-md-5"></label><br />
                                                <asp:Label runat="server" class="col-md-7 form-label">Location of Employer Organisation: </asp:Label><label runat="server" id="lbllocation" class="col-md-4"></label><br />
                                                <asp:Label runat="server" class="col-md-5 form-label">Start Date of Employment: </asp:Label><label runat="server" id="lblstartdate" class="col-md-5"></label><br />
                                                <asp:Label runat="server" class="col-md-5 form-label">End Date of Employment: </asp:Label><label runat="server" id="lblEndDate" class="col-md-5"></label><br />
                                                <asp:Label runat="server" class="col-md-7 form-label">Name of <%= lblfirstname%>’s Reporting Manager: </asp:Label><label runat="server" id="lblreportingmanager" class="col-md-4"></label><br />
                                                <asp:Label runat="server" class="col-md-5 form-label">Job Description: </asp:Label><label runat="server" id="lbljobdescription" class="col-md-5"></label><br />
                                                <div class="col-md-6">
                                                    <textarea runat="server" id="txtQuestion1" class="form-control" style="height: 78px;" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="list-group-item" id="question2" runat="server">
                                        <div class="form-group m-0" role="group" aria-labelledby="label-email">
                                            <div class="form-row">
                                                <label id="label-question2" class="col-md-12 col-form-label form-label">2. How long have you known <%= lblfirstname%> and how are you related to him/her?</label>
                                                <div class="col-md-6">
                                                    <textarea runat="server" id="txtQuestion2" class="form-control" style="height: 78px;" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="list-group-item" id="question3" runat="server">
                                        <div class="form-group m-0" role="group" aria-labelledby="label-email">
                                            <div class="form-row">
                                                <label id="label-question3" class="col-md-12 col-form-label form-label">3. In your opinion, what makes <%= lblfirstname%> a good fit to study this course?</label>
                                                <div class="col-md-6">
                                                    <textarea runat="server" id="txtQuestion3" class="form-control" style="height: 78px;" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="list-group-item" id="question4" runat="server">
                                        <div class="form-group m-0" role="group" aria-labelledby="label-email">
                                            <div class="form-row">
                                                <label id="label-question4" class="col-md-12 col-form-label form-label">4. What is <%= lblfirstname%>’s biggest strength and biggest weakness?</label>
                                                <div class="col-md-6">
                                                    <textarea runat="server" id="txtQuestion4" class="form-control" style="height: 78px;" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="list-group-item" id="question5" runat="server">
                                        <div class="form-group m-0" role="group" aria-labelledby="label-email">
                                            <div class="form-row">
                                                <label id="label-question5" class="col-md-12 col-form-label form-label">5. How did  <%= lblfirstname%>  get along with co-workers and management?</label>
                                                <div class="col-md-6">
                                                    <textarea runat="server" id="txtQuestion5" class="form-control" style="height: 78px;" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="list-group-item" id="question6" runat="server">
                                        <div class="form-group m-0" role="group" aria-labelledby="label-email">
                                            <div class="form-row">
                                                <label id="label-question6" class="col-md-12 col-form-label form-label">6. Would you re-hire this employee in the future?</label>
                                                <div class="col-md-6">
                                                    <textarea runat="server" id="txtQuestion6" class="form-control" style="height: 78px;" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="list-group-item" id="button" runat="server">
                                        <div class="form-group m-0" role="group" aria-labelledby="label-employerwebsite">
                                            <div class="form-row">
                                                <asp:Button ID="btn_Save" runat="server" Text="Save Changes" CssClass="btn btn-success" OnClick="btn_Save_Click1"/>
                                                <div class="col-md-6">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="list-group-item" id="verified" runat="server" visible="false">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-message">
                                        <div class="form-row">
                                            <label id="label-message" for="message" class="col-md-12 col-form-label form-label">You have already verified applicant details</label>
                                        </div>
                                    </div>
                                </div>

                                <div class="list-group-item" id="afterVerfication" runat="server" visible="false">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-employerwebsite">
                                        <div class="form-row">
                                            <div class="col-md-12">
                                                <asp:Label ID="lblMessage" runat="server">Thank You ...Applicant Details have been Verified</asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="list-group-item" id="detailsNotFound" runat="server" visible="false">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-employerwebsite">
                                        <div class="form-row">
                                            <div class="col-md-12">
                                                <asp:Label ID="Label1" runat="server">Details Not Found. Please click on validation link once again.</asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <script type="text/javascript">        
        function validateForm() {
            var txtQuestion1 = document.forms["form1"]["txtQuestion1"].value;
            var txtQuestion2 = document.forms["form1"]["txtQuestion2"].value;
            var txtQuestion3 = document.forms["form1"]["txtQuestion3"].value;
            var txtQuestion4 = document.forms["form1"]["txtQuestion4"].value;
            var txtQuestion5 = document.forms["form1"]["txtQuestion5"].value;
            var txtQuestion6 = document.forms["form1"]["txtQuestion6"].value;
            if (txtQuestion1 == "") {
                alert("Please enter response for question 1");
                return false;
            }
            else if (txtQuestion2 == "") {
                alert("Please enter response for question 2");
                return false;
            }
            else if (txtQuestion3 == "") {
                alert("Please enter response for question 3");
                return false;
            }
            else if (txtQuestion4 == "") {
                alert("Please enter response for question 4");
                return false;
            }
            else if (txtQuestion5 == "") {
                alert("Please enter response for question 5");
                return false;
            }
            else if (txtQuestion6 == "") {
                alert("Please enter response for question 6");
                return false;
            }
        }
    </script>
</body>
</html>
