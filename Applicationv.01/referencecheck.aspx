<%@ Page Language="C#" AutoEventWireup="true" CodeFile="referencecheck.aspx.cs" Inherits="referencecheck"%>

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
                                <div id="confirmation" runat="server">
                                    <div class="list-group-item" id="question1" runat="server">
                                        <div class="form-group m-0" role="group" aria-labelledby="label-email">
                                            <div class="form-row">
                                                <label id="label-question1" for="email" class="col-md-6 col-form-label form-label">1.	How long have you known <%=lblfirstname %> and how are you related to him/her?</label>
                                                <div class="col-md-6">
                                                    <textarea runat="server" id="txtquestion1" class="form-control" style="height: 78px;" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="list-group-item" id="question2" runat="server">
                                        <div class="form-group m-0" role="group" aria-labelledby="label-email">
                                            <div class="form-row">
                                                <label id="label-question2" for="email" class="col-md-6 col-form-label form-label">2.	How would you describe <%=lblfirstname %>’s interpersonal, communicative and social skills?</label>
                                                <div class="col-md-6">
                                                    <textarea runat="server" id="txtquestion2" class="form-control" style="height: 78px;" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="list-group-item" id="question3" runat="server">
                                        <div class="form-group m-0" role="group" aria-labelledby="label-email">
                                            <div class="form-row">
                                                <label id="label-question3" for="email" class="col-md-6 col-form-label form-label">3.	What is <%=lblfirstname %>’s greatest strength and greatest weakness?</label>
                                                <div class="col-md-6">
                                                    <textarea runat="server" id="txtquestion3" class="form-control" style="height: 78px;" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="list-group-item" id="question4" runat="server">
                                        <div class="form-group m-0" role="group" aria-labelledby="label-email">
                                            <div class="form-row">
                                                <label id="label-question4" for="email" class="col-md-6 col-form-label form-label">4.	Why did you choose to refer this student?</label>
                                                <div class="col-md-6">
                                                    <textarea runat="server" id="txtquestion4" class="form-control" style="height: 78px;" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item" id="message" runat="server" visible="false">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-message">
                                        <div class="form-row">
                                            <label id="label-message" for="message" class="col-md-12 col-form-label form-label">You have already verified applicant details</label>

                                        </div>
                                    </div>
                                </div>

                                <div class="list-group-item" id="button" runat="server">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-employerwebsite">
                                        <div class="form-row">
                                            <asp:Button ID="btn_login" runat="server" Text="Save Changes" CssClass="btn btn-success" OnClick="btn_login_Click"/>
                                            <div class="col-md-6">
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="list-group-item" id="lblMessages" runat="server" visible="false">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-employerwebsite">
                                        <div class="form-row">
                                            <div class="col-md-6">
                                                <asp:Label ID="lblMessage" runat="server">Thank You ...Applicant Details have been Verified</asp:Label>
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
            var txtQuestion1 = document.forms["form1"]["txtquestion1"].value;
            var txtQuestion2 = document.forms["form1"]["txtquestion2"].value;
            var txtQuestion3 = document.forms["form1"]["txtquestion3"].value;
            var txtQuestion4 = document.forms["form1"]["txtquestion4"].value;

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
        }
    </script>
</body>
</html>
   

