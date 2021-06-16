<%@ Page Language="C#" AutoEventWireup="true" CodeFile="gte_declaration_download.aspx.cs" Inherits="gte_declaration_download" %>

<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <script src="assets/js/qrcode.min.js"></script>
    <script src="assets/js/qrcode.js"></script>


    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="assets/GTEReport/style.css">
    <title>Student - Dashboard</title>
</head>
<body>
    <form runat="server">
        <div runat="server" id="lblDiv" style="display: none;">
            <asp:Label runat="server">Please Scan again...</asp:Label>
        </div>
           <div runat="server" id="btnDiv" class="form-row justify-content-between" style="display: none;margin-left: 810px;width: 50%;padding: 10px;">
            
            <asp:Button ID="btnDownload" runat="server" CssClass="btn btn-success" Text="Download Report" OnClick="btnDownload_Click"/>
        </div>
        

        <%--2--%>
        <div class="certificate-wrpr">

            <table class="certificate-table" cellspacing="0" cellpadding="0">
                <tr>
                    <td>
                        <table cellspacing="0" cellpadding="0" class="first-row-table">
                            <tr class="first-row">
                                <td class="min-20">
                                    <img src="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/GTEReport/logo.png" class="cer-logo">
                                </td>
                                <td class="min-60">
                                    <span class="cer-ttl">Candidate Declaration</span>
                                    <span class="cer-sub-ttl">for Australian Genuine Student &</span>
                                    <span class="cer-sub-ttl">Genuine Temporary Entrant Criteria</span>
                                </td>
                                <td class="min-20">
                                    <div class="cer-flg-wrpr clearfix">
                                        <img src="<%=UniLogURL%>" class="cer-flag">
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>

                <tr>
                    <td class="cer-sep">
                        <div></div>
                    </td>
                </tr>
                <tr>
                    <td>
                         <div class="cer-note-wrpr">
                        <table cellpadding="0" cellspacing="0">
                            <tr>
                                
                                <td>
                                    <table cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td>
                                                <div style="font-size: medium;font-weight: 800;margin-left: 19px;">CANDIDATE DECLARATION & ACCEPTANCE OF TERMS OF USE & PRIVACY POLICY</div><%--<img src="http://localhost:50180//assets/GTEReport/dcl-txt.png">--%>
                                                <div class="std-bx-wrpr">
                                                    <span><%=Student_name %></span> has made a declaration and accepted the terms of use at: <span><%=reportsubmitteddate %> using IP address: <%=ipaddress %></span> 
                                                </div>
                                            </td>
                                            <td class="pr-15">
                                                <img src="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/GTEReport/accepted.png">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <br/>
                                                <br/>
                                                 <span class="cer-note-wrpr pt-20">
                                                    <%=universityName %> Student Declaration for Genuine Student (GS) and Genuine Temporary Entrant (GTE)
                                                </span>
                                            </td>
                                        </tr>
                                        <tr>
                                            
                                           <td class="cer-btm-txt-1">  
                                               <br/>
                                               <br/>
                                                    <p class="cer-note-wrpr">
                                                        I <%=Student_name%>, citizen of <%=Country_of_Citizenship %> born on <%=dob %>  holding passport number <%=passport_number%> and residing at <%=current_address%> declare that I am a genuine temporary entrant and genuine student.

                                                    </p>
                                                    <p class="cer-note-wrpr">
                                                        I declare that the information and documents upload in the <%=universityName%> GTE Direct Centre are true, accurate and complete representation of myself and my history. I understand that no further documents can be submitted after an assessment is done.

                                                    </p>
                                                    <p class="cer-note-wrpr">
                                                        I understand that giving false or misleading information is a serious offence under Australian law and will impact negatively on my application to study in Australia.

                                                    </p>
                                                    <p class="cer-note-wrpr">
                                                        I declare that the course I have chosen to study at <%=universityName%> is my decision and not my agent’s.

                                                    </p>
                                                    <p class="cer-note-wrpr">
                                                        I agree that <%=universityName%>, can vary or reverse any decision made on the basis of any incorrect, incomplete, fraudulent or misleading information that I have provided. This may result in my enrolment being terminated.

                                                    </p>
                                                    <p class="cer-note-wrpr">
                                                        I am aware that my spouse is required to abide by my student visa conditions as he/she is a dependent on my visa.

                                                    </p>
                                                    <p class="cer-note-wrpr">
                                                        I agree to tell <%=universityName%> immediately if there is any change to the information I have given in this application.

                                                    </p>
                                                    <p class="cer-note-wrpr">
                                                        I declare that if my spouse moves to another city, I am aware that it is not grounds for release letter because I am required to maintain my enrolment as per my visa conditions.

                                                    </p>
                                                    <p class="cer-note-wrpr">
                                                        I understand that if I am unable to pay my tuition fees in line with the payment due date, <%=universityName%> may cancel my enrolment which may affect my student visa.

                                                    </p>
                                                    <p class="cer-note-wrpr">
                                                        I understand my obligation to have sufficient funds to pay for Overseas Student Health Cover, all tuition fees and associated student costs and all living and travel expense for myself and any dependent/s (if applicable) for the entire duration of my stay in Australia.
                                                    </p>
                                                    <p class="cer-note-wrpr">
                                                        I understand that while, as part of my student visa, I am allowed to work a maximum of 40 hours per fortnight (with unlimited work-rights during semester breaks), these funds are to be used to supplement my living costs but must not be my only source of income to pay my tuition fees and living expenses.
                                                    </p>
                                                    <p class="cer-note-wrpr">
                                                        I understand that my visa may be rejected or cancelled by the Department of Home Affairs (DHA) if it is determined that documents supporting my application are fraudulent or I have made a false declaration.

                                                    </p>
                                                    <p class="cer-note-wrpr">
                                                        I understand that my visa application will be denied if I do not pass DHA’s health and character checks.

                                                    </p>
                                                    <p class="cer-note-wrpr">
                                                        I understand that my visa application will be rejected if DHA is not satisfied that I am a genuine student: 
                                                        <a href="https://www.homeaffairs.gov.au/trav/stud/more/genuine-temporary-entrant">https://www.homeaffairs.gov.au/trav/stud/more/genuine-temporary-entrant</a>

                                                    </p>
                                                    <p class="cer-note-wrpr">
                                                        I understand that my visa may be cancelled by DHA if I do not abide by the conditions of my visa. Please go to the following link for more information: <a href="https://www.homeaffairs.gov.au/trav/stud/more/visa-conditions">https://www.homeaffairs.gov.au/trav/stud/more/visa-conditions</a>

                                                    </p>
                                                    <p class="cer-note-wrpr">
                                                        I understand that I will be required to update any changes to my personal details direct to the <%=universityName%> Student System within seven days of my arrival in Australia. These details will only be passed onto DHA when requested by DHA.

                                                    </p>
                                                    <p class="cer-note-wrpr">
                                                        I fully understand that if I request a transfer to another provider (release letter) within the first six months of my study, <%=universityName%> may refuse my request. <a href="https://www.homeaffairs.gov.au/trav/stud/more/changing-courses">https://www.homeaffairs.gov.au/trav/stud/more/changing-courses</a>

                                                    </p>
                                                    <p class="cer-note-wrpr">
                                                        I fully understand that if I decide to downgrade i.e. go to a course that has a lower AQF level I will not be released from <%=universityName%> and will be required to apply for another visa. 
                                                        <a href="https://www.homeaffairs.gov.au/trav/stud/more/changing-courses">https://www.homeaffairs.gov.au/trav/stud/more/changing-courses</a>

                                                    </p>
                                                    <p class="cer-note-wrpr">
                                                        I understand that if I am unsuccessful in my visa application <%=universityName%> may not issue another offer and Confirmation of Enrolment

                                                    </p>
                                                    <p class="cer-note-wrpr">
                                                        I, <%=Student_name%> confirm that my agent or any third person is not helping me in completing this GTE assessment and / or has not completed this on my behalf.

                                                    </p>
                                               
                                           </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                             </div>
                    </td>
                </tr>

            </table>
        </div>

    </form>
    <!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>

    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <!--
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
    -->

</body>
</html>
