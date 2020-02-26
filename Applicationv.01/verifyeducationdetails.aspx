<%@ Page Language="C#" AutoEventWireup="true" CodeFile="verifyeducationdetails.aspx.cs" Inherits="verifyhighschool"%>

<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
    <title></title>
    <!-- App CSS -->
    <link type="text/css" href="assets/css/app.css" rel="stylesheet">

    <!-- Google Tag Manager -->
    <script>
        (function (w, d, s, l, i) {
            w[l] = w[l] || [];
            w[l].push({ 'gtm.start': new Date().getTime(), event: 'gtm.js' });
            var f = d.getElementsByTagName(s)[0], j = d.createElement(s), dl = l != 'dataLayer' ? '&l=' + l : '';
            j.async = true;
            j.src = 'https://www.googletagmanager.com/gtm.js?id=' + i + dl;
            f.parentNode.insertBefore(j, f);
        })(window, document, 'script', 'dataLayer', '<%=universityGTMCode%>');
    </script>
    <!-- End Google Tag Manager -->
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
                                                <label id="label-question1" class="col-md-12 col-form-label form-label">1.	Can you verify the below-mentioned details about <%= lblfirstname %>’s educational qualifications?</label>

                                                    <asp:Label runat="server" class="col-md-4 form-label">Name of Qualification:  </asp:Label><label runat="server" id="lblqualificationName" class="col-md-5"></label><br />
                                                    <asp:Label runat="server" class="col-md-7 form-label">Name of High School attended / attending:  </asp:Label><label runat="server" id="lblhighschoolName" class="col-md-5"></label><br />
                                                    <asp:Label runat="server" class="col-md-5 form-label">Start Date of Qualification:  </asp:Label><label runat="server" id="lblstartdateofQualification" class="col-md-5"></label><br />
                                                    <asp:Label runat="server" class="col-md-5 form-label">End Date of Qualification: </asp:Label><label runat="server" id="lblenddateofQualification" class="col-md-4"></label><br />
                                                    <asp:Label runat="server" class="col-md-5 form-label">Location of High School:</asp:Label><label runat="server" id="lbllocationofhighschool" class="col-md-5"></label><br />
                                                    
                                                <div class="col-md-12">
                                                    <div class="col-md-12">
                                                    <input type="radio" style="margin-left: -16%; margin-right: -14%;" class="col-md-4 form-label" name="info" runat="server" id="rbYes">Yes, I can verify the above information.                                                    
                                                    </div>
                                                    <div class="col-md-12">
                                                        <input type="radio" style="margin-left: -16%; margin-right: -14%;" class="col-md-4 form-label" name="info" runat="server" id="rbNo">No, I am not in the right position to verify the above information.                                                    
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="list-group-item" id="question2" runat="server">
                                        <div class="form-group m-0" role="group" aria-labelledby="label-email">
                                            <div class="form-row">
                                                <label id="label-question2" class="col-md-12 col-form-label form-label">2. How long have you known <%= lblfirstname%> and in what capacity?</label>
                                                <div class="col-md-6">
                                                    <textarea runat="server" id="txtQuestion2" class="form-control" style="height: 78px;" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>                                   
                                    <div class="list-group-item" id="question4" runat="server">
                                        <div class="form-group m-0" role="group" aria-labelledby="label-email">
                                            <div class="form-row">
                                                <label id="label-question4" class="col-md-12 col-form-label form-label">3.	Please briefly describe <%= lblfirstname%>’s performance in relation to academics – class participation, grades achieved, initiatives, activities, etc.</label>
                                                <div class="col-md-6">
                                                    <textarea runat="server" id="txtQuestion3" class="form-control" style="height: 78px;" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                     <div class="list-group-item" id="question5" runat="server">
                                        <div class="form-group m-0" role="group" aria-labelledby="label-email">
                                            <div class="form-row">
                                                <label id="label-question5" class="col-md-12 col-form-label form-label">4.	What is <%= lblfirstname%>’s greatest strength that will help him/her succeed in this programme?</label>
                                                <div class="col-md-6">
                                                    <textarea runat="server" id="txtQuestion4" class="form-control" style="height: 78px;" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                     <div class="list-group-item" id="question6" runat="server">
                                        <div class="form-group m-0" role="group" aria-labelledby="label-email">
                                            <div class="form-row">
                                                <label id="label-question6" class="col-md-12 col-form-label form-label">5.	Is there any additional information that you feel we should know when considering <%= lblfirstname%> as a student at <%= lbluniversityName%>?</label>
                                                <div class="col-md-6">
                                                    <textarea runat="server" id="txtQuestion5" class="form-control" style="height: 78px;" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="list-group-item" id="button" runat="server">
                                        <div class="form-group m-0" role="group" aria-labelledby="label-employerwebsite">
                                            <div class="form-row">
                                                <asp:Button ID="btn_Save" runat="server" Text="Save Changes" CssClass="btn btn-success" OnClick="btn_Save_Click"/>
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
            var txtQuestion2 = document.forms["form1"]["txtQuestion2"].value;
            var txtQuestion3 = document.forms["form1"]["txtQuestion3"].value;
            var txtQuestion5 = document.forms["form1"]["txtQuestion5"].value;            
            if (document.forms["form1"]["rbYes"].checked == false && document.forms["form1"]["rbNo"].checked == false) {
                alert("Please select response for question 1");
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
            else if (txtQuestion5 == "") {
                alert("Please enter response for question 5");
                return false;
            }       
        }
    </script>

    <!-- Google Tag Manager (noscript) -->
    <noscript>
        <iframe src="https://www.googletagmanager.com/ns.html?id=<%=universityGTMCode%>" height="0" width="0" style="display: none; visibility: hidden"></iframe>
    </noscript>
    <!-- End Google Tag Manager (noscript) -->

</body>
    
</html>
