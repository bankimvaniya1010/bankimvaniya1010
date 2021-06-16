<%@ Page Language="C#" AutoEventWireup="true" CodeFile="counsellor_report.aspx.cs" Inherits="counsellor_report" %>

<!doctype html>
<html lang="en">
  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
    <%--<link rel="stylesheet" type="text/css" href="assets/gteCertificate_images/style.css">--%>
      <link rel="stylesheet" type="text/css" href="assets/counsellor_report/style.css">
      <script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.9.2/html2pdf.bundle.js"></script>
    <title></title>
  </head>
  <body>
            <div id="invoice">
     <form runat="server">

              <div id="btnDiv" class="form-row justify-content-between" style="margin-left:810px;width:50%;padding:10px;" runat="server" visible="false">
            <asp:Button ID="btnDownload" runat="server" CssClass="btn btn-success" Text="Download Report" OnClick="btnDownload_Click"/>
         </div>

<%--         <div style="page-break-before: always; page-break-after: always;">--%>
             <div class="certificate-wrpr" id="page1" runat="server">

                 <table class="certificate-table" cellspacing="0" cellpadding="0">
                     <tr>
                         <td class="cer-sep cer-sep-1">
                             <div></div>
                         </td>
                     </tr>
                     <tr>
                         <td>
                             <table cellspacing="0" cellpadding="0" class="first-row-table">
                                 <tr class="text-center">
                                     <td class="min-20"></td>
                                     <td class="min-60">
                                         <h3>CONFIDENTIAL</h3>
                                         <p>Not for circulation without the consent and permission of <%=fullname %></p>
                                     </td>
                                     <td class="min-20">
                                         <div class="cer-flg-wrpr clearfix">
                                             <img src="assets/counsellor_report/logo.png" class="cer-logo">
                                         </div>
                                     </td>
                                 </tr>
                             </table>
                         </td>
                     </tr>
                     <tr>
                         <td class="cer-sep cer-sep-1">
                             <div></div>
                         </td>
                     </tr>
                     <tr>
                         <td class="min-30">
                             <table class="third-row-table" cellspacing="0" cellpadding="0">
                                 <tr>
                                     <td>
                                         <h5 class="head">GTE Direct Counsellor Report for <%=fullname %></h5>
                                     </td>
                                 </tr>
                             </table>
                         </td>
                     </tr>
                     <tr>
                         <td>
                             <table cellspacing="0" cellpadding="0" class="usr-info-table">
                                 <tr>
                                     <!--                            <td class="lft-ttl"><img src="http://qc.testyt.com//assets/GTEReport/txt1.png"></td>-->
                                     <td class="wid-460">
                                         <table cellpadding="0" cellspacing="0" class="frm-tab-cer">
                                             <tr>
                                                 <td>
                                                     <table cellpadding="0" cellspacing="0" class="frm-tab-cer-inner frm-tab-cer-inner-1">
                                                         <tr>
                                                             <td class="third-row-label">REPORT DATE:</td>
                                                             <td class="third-row-input"><%=reportdate%>
                                                             </td>
                                                         </tr>
                                                     </table>
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td>
                                                     <table cellpadding="0" cellspacing="0" class="frm-tab-cer-inner frm-tab-cer-inner-1">
                                                         <tr>
                                                             <td class="third-row-label">STUDY DESTINATION COUNTRY: </td>
                                                             <td class="third-row-input"><%=country_intent_tostudy%>
                                                             </td>
                                                         </tr>
                                                     </table>
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td>
                                                     <table cellpadding="0" cellspacing="0" class="frm-tab-cer-inner frm-tab-cer-inner-1">
                                                         <tr>
                                                             <td class="third-row-label">EDUCATION INSTITUTION NAME:</td>
                                                             <td class="third-row-input"><%=universityname%>
                                                             </td>
                                                         </tr>
                                                     </table>
                                                 </td>
                                             </tr>
                                         </table>
                                     </td>
                                     <td class="rgt-img">
                                         <img src="<%=profileURL %>" width="150px" height="200px" /></td>
                                 </tr>
                             </table>
                         </td>
                     </tr>
                     <tr>
                         <td class="cer-sep cer-sep-1">
                             <p>Dear <strong><%=firstname %>,</strong></p>
                             <p>Congratulations on successfully completing your GTE Direct Evaluation.</p>
                             <p class="scr">This report:</p>
                             <ul>
                                 <li>Highlights key findings from your GTE Direct Assessment.</li>
                                 <li>Makes recommendations on how you can strengthen your course and student visa </li>
                                 <li>applications to give you the best possible chance of fulfilling your goal of studying at <%=universityname %> in <%=country_intent_tostudy %>.</li>
                             </ul>
                         </td>
                     </tr>
                     <tr>
                         <td>
                             <table cellpadding="0" cellspacing="0">
                                 <tr>
                                     <td class="">
                                         <table cellpadding="0" cellspacing="0">
                                             <tr>
                                                 <td>
                                                     <table cellpadding="0" cellspacing="0">
                                                         <tr>
                                                             <td class="recm-txt-img">
                                                                 <h4 class="main-heading" style="margin-bottom:25px;">1.Introduction</h4>
                                                                 <p class="heading-1 bg-color heading-upr">1.1 About this report</p>
                                                                 <div class="cer-note-wrpr">
                                                                     This report has been generated by the GTE Direct technology, the world's first artificial intelligence- driven global student training and evaluation service. The GTE Direct system generated this report based on your responses during your GTE Direct Assessment which you completed on <%=reportdate %>.
                                                                 </div>
                                                             </td>
                                                             <td></td>
                                                         </tr>
                                                     </table>
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td class="goals">
                                                     <p class="content">There are 3 goals that we seek to achieve through this report:</p>
                                                     <ol class="text-justify">
                                                         <li>We want to empower you to make well-informed decisions by ensuring that you have an accurate understanding of the student visa requirements and conditions for study in <%=country_intent_tostudy %>.</li>
                                                         <li>We want to support you in preparing and producing a high quality student visa application so that you have the best probability for success. </li>
                                                         <li>Finally, we want to provide you with an opportunity to have an increased chance of a positive study experience in <%=country_intent_tostudy %>. </li>
                                                     </ol>
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td>
                                                     <div class="clearfix rsk-div-wrpr">
                                                         <p class="content">
                                                             Though this report gives an indication of how well you meet the student visa requirements for 
                                             <%=country_intent_tostudy %>
                                             , the focus of most of the Counsellor Comments are on those aspects of your application that constitute possible risks of visa rejection/refusal. The reason why we focus on the risk-factors is because we want to give you the opportunity to address those risk factors in your application to help reassure the decision-maker who will be assessing your student visa application that you are a genuine student.
                                                         </p>
                                                     </div>
                                                 </td>
                                             </tr>
                                         </table>
                                     </td>
                                 </tr>
                             </table>
                         </td>
                     </tr>


                 </table>
             </div>
             <div id="page2" runat="server" class="certificate-wrpr">

                 <table class="certificate-table" cellspacing="0" cellpadding="0">


                     <tr>
                         <td class="min-40">
                             <table class="third-row-table" cellspacing="0" cellpadding="0" style="margin-bottom:15px;">
                                 <tr>
                                     <td>
                                         <p class="heading-1 bg-color heading-upr">1.2 Your draft <%= country_intent_tostudy %> -Statement of purpose(SOP)</p>
                                     </td>
                                 </tr>
                             </table>
                         </td>
                     </tr>
                     <tr>
                         <td class="cer-sep cer-sep-1">
                             <p>Other than this GTE Direct Counsellor Report, another very important document that the GTE Direct technology helped create for you when you completed your (GTE Direct) assessment is your draft <%= country_intent_tostudy %> -Statement of purpose(SOP). </p>
                             <p>
                                 Your draft <%= country_intent_tostudy %> -Statement of purpose(SOP) is a compilation of your responses during the GTE Direct <span class="color">Assessment.</span> To assist you in producing a high-quality 
                         <%=country_intent_tostudy %> - Statement of purpose (SOP)
                        ,the (GTE Direct) artificial intelligence has captured your responses and has put those (your) responses in  an essay format and in a format that will make it relatively easy for your student visa decision-maker(s) to assess your <%= country_intent_tostudy %> -Statement of purpose(SOP) against the student visa requirements of <%=country_intent_tostudy %>.
                             </p>
                             <p>
                                 Now that you have both your draft 
                         <%=country_intent_tostudy %> - Statement of purpose (SOP)
                        and this GTE Direct Counsellor Report, what you will need to do is to respond to the Counsellor Comments in this report by:
                             </p>
                             <ol>
                                 <li>Editing and refining your draft <%= country_intent_tostudy %> -Statement of purpose(SOP) by providing reasonable explanations that address any concerns that a decision-maker might have about each risk-factor identified by the GTE Direct artificial intelligence</li>
                                 <li>Ensuring that you submit valid supporting documents that provide evidence for the statements and explanations that you have provided in your 
                            <%=country_intent_tostudy %> - Statement of purpose (SOP)
                           .
                                 </li>
                             </ol>
                             Once you have edited and refined your draft 
                      <%=country_intent_tostudy %> - Statement of purpose (SOP)
                     as per the  above instructions, you will then have a final version of your 
                      <%=country_intent_tostudy %> - Statement of purpose (SOP)
                     which you can then use when submitting or lodging your student visa application.
                         </td>
                     </tr>
                     
                 </table>
             </div>
         <%--</div>
         <div style="page-break-before: always; page-break-after: always;display:block;">--%>
             <div id="page3" runat="server" class="certificate-wrpr">
                 <table class="certificate-table" cellspacing="0" cellpadding="0">
                     <tr>
                         <td class="min-40">
                             <table class="third-row-table" cellspacing="0" cellpadding="0">
                                 <tr>
                                     <td>
                                         <p class="heading-1 bg-color heading-upr">1.3 Disclaimers</p>
                                     </td>
                                 </tr>
                             </table>
                         </td>
                     </tr>
                     <tr>
                         <td class="cer-sep cer-sep-1">
                             <p>
                                 GTE Direct is an artificial intelligence-driven service that:<br>
                                 <span class="bullet">&#8226;</span> Asked you questions relevant to published student visa requirements for international students who wish you study in 
                        <%=country_intent_tostudy %>
                        ; and
                                 <br>
                                 <span class="bullet">&#8226;</span> Evaluated your responses against those published student visa requirements based on an interpretation of those requirements by the artificial intelligence and those indidividuals who designed the GTE Direct system.
                             </p>
                             <p>In producing your draft Statement of Purpose and this GTE Direct Counsellor Report, we have assumed the following regarding your responses in the GTE Direct Evaluation:<br>
                                 <span class="bullet">&#8226;</span> All your responses were honest and truthful<br>
                                 <span class="bullet">&#8226;</span> All your responses were accurate and correct<br>
                                 <span class="bullet">&#8226;</span> You will be able to provide supporting documents (evidence) to support all factual information that you provided in the assessment.</p>
                         </td>
                     </tr>
                     <tr>
                         <td class="cer-sep cer-sep-1">
                             <p class="heading">In light of the above-mentioned comments and assumptions, GTE Direct Pty Ltd  makes the following disclaimers:</p>
                             <ul>
                                 <li>Whilst every effort is made to keep the student visa requirements in the GTE Direct service up-to-date, we cannot guarantee that the visa requirements that were used to assess your responses will be the same ones that the student visa decision-makers will use to assess your visa application. GTE Direct Pty Ltd assumes no responsibility for errors or omissions in the artificial intelligence-driven assessments and evaluations.</li>
                                 <li>The comments and recommendations made in this GTE Direct Counsellor Report are generic in nature and do not constitute visa advice. If you need specific advice, please seek a professional who is licensed to offer legal visa advice.</li>
                                 <li>Since every education institution and every Government Immigration Department assessment office  or decision-maker may employ their own methodology and rationale for assessing applications against the required criteria, you should not rely on this information as a guarantee of a successful application outcome, nor is it a substitute for, nor does it replace the official advice of an education institution or Government Immigration Department.</li>
                                 <li>To the maximum extent permitted by applicable law, GTE Direct Pty Ltd and associated staff and/or partners shall not be liable for any indirect, incidental, special, consequential or punitive damages whether incurred directly or indirectly as a result of the provision of the GTE Direct service.</li>
                             </ul>
                             <p>Based on the above, any actions that you take as a result of the information contained or omitted in this report are entirely at your own risk.</p>
                             <p style="margin-top:-8px;">GTE Direct Pty Ltd reserves the right to make additions, deletions or modification to the content and structure of the GTE Direct Counsellor Reports at any time without prior notice.</p>
                         </td>
                     </tr>
                     <tr>
                         <td class="cer-sep cer-sep-1">
                             <h4 class="bg-color">2. Risk Factors</h4>
                             <p>In the context of this report, a risk factor is defined as: </p>
                             <p><i><b>"Something that can be reasonably expected to raise concerns in the mind of a decison-maker, thereby making it more likely that the decision-maker could refuse or reject your student visa application or your application for admission into an education institution." </b></i></p>
                             <p>For your benefit, all the risk factors identified in this GTE Direct Counsellor Report have been classified on a 3-point severity scale that gives an indication of how serious that risk factor is. The table overleaf lists the 3 severity levels and describes what each of the 3 risk factor severity levels means:</p>
                         </td>
                     </tr>
                     <tr>
                         <td>

                             <div class="statictbl" style="margin-top: -20px;">
                                 <table class="table">
                                     <tr>
                                         <th class="scale">Severity scale
                                         </th>
                                         <th class="desp">Description of what the severity classification means
                                         </th>


                                     </tr>
                                     <tr class="first">
                                         <td class="border middle">High Severity
                                         </td>
                                         <td class="border">High severity risk factors are those that are likely to be considered to be very serious by a decision-maker. Therefore high severity risk factors have a high probability of being potential causes for application refusals and rejections
                                         </td>



                                     </tr>
                                     <tr class="second">
                                         <td class="border medium">Medium Severity
                                         </td>
                                         <td class="border">Medium severity risk factors are those that are likely to be considered to be somewhat serious by a decision-maker. Therefore medium severity risk factors could  be potential causes for application refusals or rejections
                                         </td>



                                     </tr>
                                     <tr class="third">
                                         <td class="border low">Low Severity
                                         </td>
                                         <td class="border">Low severity risk factors are those that are likely to be considered to be not too serious by a decision-maker. Therefore low severity risk factors could have a low probability of being potential causes for application refusals or rejections
                                         </td>



                                     </tr>
                                 </table>
                             </div>

                         </td>
                     </tr>
                     <tr>
                         <td class="cer-sep cer-sep-1">
                             <p>
                                 Irrespective of whether a risk factor is classified as high, medium or low, we recommend that you address all risk factors in your 
                         <%=country_intent_tostudy %> - Statement of purpose (SOP)
                        . The reason why we make this recommendation is so that you give yourself the best chance of getting a successful application outcome by reassuring the decision-maker on all areas of concern that he or she may have regarding your application. 
                             </p>
                         </td>
                     </tr>

                 </table>
             </div>
         </div>
       <%--  <div style="page-break-before: always; page-break-after: always;">--%>
             <div id="page4" runat="server" class="certificate-wrpr">
                 <table class="certificate-table" cellspacing="0" cellpadding="0">                    
                     <tr>
                         <td class="cer-sep cer-sep-1">
                             <p class="heading-1 bg-color heading-upr">2.1 Previous Study and Gaps </p>
                         </td>
                     </tr>
                     <tr>
                         <td>
                             <div class="overall-score-mrk">
                                 <b>Previous Study & Gaps </b>
                                 <%--<p>Insert pictorial graph/infographic representation of evaluation</p>--%>
                             </div>
                             <div class="overall-mrk"></div>
                             <div class="overall">
                                 <p class="heading-small" id="previousrisk_1" runat="server" style="display: none;">Based on your responses*, the GTE Direct AI-system did not identify any risk factors for this criteria.</p>
                                 <p class="heading-small" id="previousrisk_2" runat="server" style="display: none;">Based on your responses*, the GTE Direct AI-system has identified the following risk factors for this criteria:</p>
                                 <p class="heading-small" id="previousrisk_3" runat="server" style="display: none;">
                                     *If any of the risk factors identified in this section are a result of an incorrect response in your GTE Direct <span>Assessment</span> ,  please make sure that you edit your 
                            <%=country_intent_tostudy %> - Statement of purpose (SOP)
                           . That way, you will reduce the risk factors in your application by ensuring that your 
                            <%=country_intent_tostudy %> - Statement of purpose (SOP)
                           only contains information that is true, accurate and correct.
                                 </p>
                             </div>
                         </td>
                     </tr>
                     <tr id="previous_page4e" runat="server">
                         <td class="cer-sep cer-sep-1">
                             <ul>
                                 <li>
                                     <b>Study & Work Gaps</b> Periods of 3 months or longer (gaps) where you were neither studying nor working must be explained.<br>
                                     <center><mark id="second">Severity = Medium</mark></center>
                                 </li>
                             </ul>
                         </td>
                     </tr>
                      <tr>
                         <td class="cer-sep cer-sep-1">
                             <ul>
                                 <li class="limrg" id="page5_statement_1" runat="server"><span class="bullet">&#8226;</span>
                                     <b>Started a course in 
                              <%=country_intent_tostudy %>
                              but did not complete it:
                                     </b>
                                     Unsuccessful completion of previous studies may indicate possible lack of commitment or value attached to education.
                           <center><mark id="second">Severity = Medium</mark></center>
                                 </li>
                                 <li class="limrg" id="page5_statement_2" runat="server"><span class="bullet">&#8226;</span>
                                     <b>Course level applied is significantly lower than previous study:</b> It appears that you  intend to study a course in 
                           <%=country_intent_tostudy %>
                           that is a significantly lower level than your highest qualification. This 'downgrading' may be considered contrary to the requirements of the student visa.
                           <center><mark id="first">Severity = high</mark></center>
                                 </li>
                                 <li class="limrg" id="page5_statement_3" runat="server"><span class="bullet">&#8226;</span>
                                     <b>Course level applied is lower than previous study:</b> It appears that you  intend to study a course in 
                           <%=country_intent_tostudy %>
                           that is a lower level than your highest  qualification. This 'downgrading' may be considered contrary to the requirements of the student visa.
                           <center><mark id="second">Severity = Medium</mark></center>
                                 </li>
                                 <li class="limrg" id="page5_statement_4" runat="server"><span class="bullet">&#8226;</span>
                                     <b>Course level applied is equal to level of previous study:</b> It appears that you intend  to study a course in 
                           <%=country_intent_tostudy %>
                           that is at the same level as your highest qualification. The perceived lack of progression to a higher level of study may be considered contrary to the requirements of the student visa.
                           <center><mark id="third">Severity = Low</mark></center>
                                 </li>
                                 <li class="limrg" id="page5_statement_5" runat="server"><span class="bullet">&#8226;</span>
                                     <b>Broad field of study different from previous study:  </b>You seem to be pursuing <span>a broad field of study that</span> is different than what you have studied before. The decision to change your field of study may result in the decision-maker being suspicious that you might not be genuinely intending to study in 
                           <%=country_intent_tostudy %>
                           .
                           <center><mark id="third">Severity = Low</mark></center>
                                 </li>
                                 <li class="limrg" id="page5_statement_6" runat="server"><span class="bullet">&#8226;</span>
                                     <b>Narrow field of study different from previous study: </b>You seem to be pursuingYou seem to be pursuing a  narrow field of study that is different than what you have studied before. The  decision to change your field of study may result in the decision-maker being suspicious that you might not be genuinely intending to study in 
                           <%=country_intent_tostudy %>
                           .
                           <center><mark id="third">Severity = Low</mark></center>
                                 </li>
                                 <li class="limrg" id="page5_statement_7" runat="server"><span class="bullet">&#8226;</span>
                                     <b>Started a course but did not complete it: </b>Unsuccessful completion of previous studies may be perceived as a possible lack of commitment or value attached to education.
                           <center><mark id="third">Severity = Low</mark></center>
                                 </li>
                                 <li class="limrg" id="page5_statement_8" runat="server"><span class="bullet">&#8226;</span>
                                     <b>Previous suspensions or expulsions from education institutions: </b>Previous suspensions or expulsions may raise concerns about behaviours that would be detrimental to a learning environment and community.
                           <center><mark id="second">Severity = Medium</mark></center>
                                 </li>
                                 <li class="limrg" id="page5_statement_9" runat="server"><span class="bullet">&#8226;</span>
                                     <b>Needing multiple attempts to pass subjects, units and courses: </b>A track record of failing in your previous studies may raise concerns about whether or not you will be able to complete your studies in the approved duration of the course.
                           <center><mark id="third">Severity = Low</mark></center>
                                 </li>
                             </ul>
                         </td>
                     </tr>
                     
                     <tr>
                         <td class="cer-sep cer-sep-1">
                             <ul>
                                 <li class="limrg" id="page6_statement_1" runat="server"><span class="bullet">&#8226;</span>
                                     <b>Track record of not attending classes: </b>A history of non-attendance of classes may raise concerns about your ability to abide by visa conditions and to be successful in your studies.
                           <center><mark id="third">Severity = Low</mark></center>
                                 </li>
                                 <li class="limrg" id="page6_statement_2" runat="server"><span class="bullet">&#8226;</span>
                                     <b>Enrolled but not studying:</b> A track record of being enrolled but not studying may raise concerns that you do not take your studies seriously.
                           <center><mark id="third">Severity = Low</mark></center>
                                 </li>
                                 <li class="limrg" id="page6_statement_3" runat="server"><span class="bullet">&#8226;</span>
                                     <b>Previous deferral requests for reasons that were not true:</b>  A track record of saying things that are not true may raise concerns about your honesty and trust-worthiness.
                           <center><mark id="third">Severity = Low</mark></center>
                                 </li>
                             </ul>

                         </td>
                     </tr>
                 </table>
             </div>
         <%--</div>

         <div style="page-break-before: always; page-break-after: always;">--%>
             <div id="page7_1" runat="server" class="certificate-wrpr">
                 <table class="certificate-table" cellspacing="0" cellpadding="0">
                     <tr>
                         <td>
                             <p class="heading-1 bg-color heading-upr">2.2 Employment and value of the course to your future</p>
                             <div class="overall-score-mrk">
                                 <b>Employment & Value</b>
                                 <%--<p>Insert pictorial graph/infographic representation of evaluation</p>--%>
                             </div>
                             <div class="overall-mrk"></div>
                             <div class="overall">
                                 <p class="heading-small" id="valuerisk_1" style="display: none;" runat="server">Based on your responses*, the GTE Direct AI-system did not identify any risk factors for this criteria.</p>
                                 <p class="heading-small" id="valuerisk_2" style="display: none;" runat="server">Based on your responses*, the GTE Direct AI-system has identified the following risk factors for this criteria:</p>
                                 <p class="heading-small" id="valuerisk_3" style="display: none;" runat="server">
                                     *If any of the risk factors identified in this section are a result of an incorrect response in your GTE Direct <span>Assessment</span> , please make sure that you edit your 
                            <%=country_intent_tostudy %> - Statement of purpose (SOP)
                           . That way, you will reduce the risk factors in your application by ensuring that your 
                            <%=country_intent_tostudy %> - Statement of purpose (SOP)
                           only contains information that is true, accurate and correct.
                                 </p>
                             </div>
                         </td>
                     </tr>
                     <tr>
                         <td class="cer-sep cer-sep-1">
                             <ul>
                                 <li class="limrg" id="page6_statement_4" runat="server" style="display: none;"><span class="bullet">&#8226;</span>
                                     <b>Primary reason to study course is "cheapest cost possible": </b>Your stated decision-making factor of cheapest cost may be interpreted as you using the student visa simply to live in 
                           <%=country_intent_tostudy %>
                           which is contrary to the intentions of the student visa program.
                           <center><mark id="first">Severity = High</mark></center>
                                 </li>
                                 <li class="limrg" id="pag6_5" runat="server" style="display: none;"><span class="bullet">&#8226;</span>
                                     <b>Primary reason to study course is "increase my chances of migrating to 
                              <%=country_intent_tostudy %>
                              ": 
                                     </b>
                                     Your stated intention of the possibility of migrating to 
                           <%=country_intent_tostudy %>
                           is contrary to the intentions of the student visa program.
                           <center><mark id="second">Severity = Medium</mark></center>
                                 </li>
                                 <li class="limrg" id="page6_statement_6" runat="server" style="display: none;"><span class="bullet">&#8226;</span>
                                     <b>Primary reason to study course is "will help me secure a permanent job in  
                              <%=country_intent_tostudy %>
                              after completion of my studies":
                                     </b>
                                     Your stated intention of the possibility of working permanently in 
                           <%=country_intent_tostudy %>
                           after your studies is contrary to the intentions of the student visa program.
                           <center><mark id="third">Severity = Low</mark></center>
                                 </li>
                             </ul>
                         </td>
                     </tr>
                     <tr>
                         <td class="cer-sep cer-sep-1">
                             <ul>
                                 <li class="limrg" id="page7_statement_1" runat="server" style="display: none;"><span class="bullet">&#8226;</span>
                                     <b>Duration of study is "less than 6 months": </b>The very short duration of study of less than 6 months may be considered as a means for you to either use the student visa to simply get into the country or to extend your stay in 
                           <%=country_intent_tostudy %>
                           temporarily.
                           <center><mark id="first">Severity = High</mark></center>
                                 </li>
                                 <li class="limrg" id="page7_statement_2" runat="server" style="display: none;"><span class="bullet">&#8226;</span>
                                     <b>Duration of study is "between 6 to 12 months":</b>The short duration of study of between 6 and 12 months may be considered as a means for you to either use the student visa to simply get into the country or to extend your stay in 
                           <%=country_intent_tostudy %>
                           temporarily.
                           <center><mark id="second">Severity = Medium</mark></center>
                                 </li>
                                 <li class="limrg" id="page7_statement_3" runat="server" style="display: none;"><span class="bullet">&#8226;</span>
                                     <b>Duration of study is "between 13-18 months ": </b>The relatively short duration of study of between 13-18 months may be considered as a means for you to either use the student visa to simply get into the country or to extend your stay in 
                           <%=country_intent_tostudy %>
                           temporarily.
                           <center><mark id="third">Severity = Low</mark></center>
                                 </li>
                                 <li class="limrg" id="page7_statement_4" runat="server" style="display: none;"><span class="bullet">&#8226;</span>
                                     <b>Stated value of the course to your future is "explore options to continue to stay and work in 
                              <%=country_intent_tostudy %>
                              ": 
                                     </b>
                                     Your stated intention of the possibility of continuing to live in 
                           <%=country_intent_tostudy %>
                           after your studies is contrary to the intentions of the student visa.
                           <center><mark id="first">Severity = High</mark></center>
                                 </li>
                                 <li class="limrg" id="page7_statement_5" runat="server" style="display: none;"><span class="bullet">&#8226;</span>
                                     <b>Stated value of the course to your future is to ultimately "apply for other visas to continue to stay in 
                              <%=country_intent_tostudy %>
                              " permanently : 
                                     </b>
                                     Your stated intention of the possibility of continuing to live in 
                           <%=country_intent_tostudy %>
                           after your studies is contrary to the intentions of the student visa.
                           <center><mark id="second">Severity = Medium</mark></center>
                                 </li>
                                 <li class="limrg" id="page7_statement_6" runat="server" style="display: none;"><span class="bullet">&#8226;</span>
                                     <b>Stated primary reason for wanting to study in 
                              <%=country_intent_tostudy %>
                              is "to secure Permanent Residency":
                                     </b>
                                     Your stated intention of possibility of seeking Permanent Residency in 
                           <%=country_intent_tostudy %>
                           is contrary to the intentions and requirement criteria of the student visa.
                           <center><mark id="first">Severity = High</mark></center>
                                 </li>
                                 <li class="limrg" id="page7_statement_7" runat="server" style="display: none;"><span class="bullet">&#8226;</span>
                                     <b>English language competency is "not very good":</b>Since English-language proficiency is an important factor that could affect successful completion of studies and successful integration in the society in 
                           <%=country_intent_tostudy %>
                           , it will be important that you intentionally work at improving your English language competency.
                           <center><mark id="third">Severity = Low</mark></center>
                                 </li>
                                 <li class="limrg" id="page7_statement_8" runat="server" style="display: none;"><span class="bullet">&#8226;</span>
                                     <b>Stated intention after completion of your studies is "I intend to look for full time employment opportunities in 
                              <%=country_intent_tostudy %>
                              ":
                                     </b>
                                     Your stated intention of the possibility of seeking full-time employment in 
                           <%=country_intent_tostudy %>
                           after completion of studies is contrary to the requirements and intention of the student visa.
                           <center><mark id="second">Severity = Medium</mark></center>
                                 </li>
                             </ul>
                         </td>
                     </tr>

                     <tr>
                         <td class="cer-sep cer-sep-1">
                             <ul id="page8_statement_1" runat="server" style="display: none">
                                 <li>
                                     <b>Less than 1 year of full-time work experience: </b>Since you have only been in full-time employment for less than a year, the decision-maker may wonder why you are choosing to study now instead of getting more work experience.
                           <center><mark id="third">Severity = Low</mark></center>
                                 </li>
                             </ul>
                             <p class="heading-1 bg-color heading-upr">2.3 Ties to, and situations in, your home country or country of residence</p>
                         </td>
                     </tr>

                     <tr>
                         <td>
                             <div class="overall-score-mrk"><b>Situations in home country</b><br>
                             </div>
                             <div class="overall-mrk"></div>
                             <div class="overall">
                                 <p class="heading-small" id="situation_1" runat="server" style="display: none;">Based on your responses*, the GTE Direct AI-system did not identify any risk factors for this criteria.</p>
                                 <p class="heading-small" id="situation_2" runat="server" style="display: none">Based on your responses*, the GTE Direct AI-system has identified the following risk factors for this criteria: </p>
                                 <p class="heading-small" id="situation_3" runat="server" style="display: none;">
                                     *If any of the risk factors identified in this section are a result of an incorrect response in your GTE Direct <span>Assessment</span> , please make sure that you edit your 
                            <%=country_intent_tostudy %> - Statement of purpose (SOP)
                           . That way, you will reduce the risk factors in your application by ensuring that your 
                            <%=country_intent_tostudy %> - Statement of purpose (SOP)
                           only contains information that is true, accurate and correct.
                                 </p>
                             </div>
                         </td>
                     </tr>
                     <tr>
                         <td class="cer-sep cer-sep-1">
                             <ul>
                                 <li class="limrg" id="page8_statement_2" runat="server" style="display: none"><span class="bullet">&#8226;</span>
                                     <b>Stated reason for planning to study this course in 
                              <%=country_intent_tostudy %>
                              rather than in 
                              <%=Nationality%>
                              is "my chances of migrating to 
                              <%=country_intent_tostudy %>
                              and securing a Permanent Residency visa will improve":
                                     </b>
                                     Your stated intention of migrating to 
                           <%=country_intent_tostudy %>
                           is contrary to the genuine temporary entrant criteria of the student visa.
                           <center><mark id="second">Severity = Medium</mark></center>
                                 </li>
                                 <li class="limrg" id="page8_statement_3" runat="server" style="display: none"><span class="bullet">&#8226;</span>
                                     <b>Stated reason for planning to study this course in 
                              <%=country_intent_tostudy %>
                              rather than in 
                              <%=Nationality%>
                              is "these types of courses in 
                              <%=Nationality%>
                              are not relevant to current industry demands": 
                                     </b>
                                     If industry demands for graduates of these types of courses is low in 
                           <%=Nationality%>
                           , the decision-maker may perceive this as a disincentive for you to return to your home country after your studies.
                           <center><mark id="third">Severity = Low</mark></center>
                                 </li>
                                 <li class="limrg" id="page8_statement_4" runat="server" style="display: none"><span class="bullet">&#8226;</span>
                                     <b>Stated reason for planning to study this course in 
                              <%=country_intent_tostudy %>
                              rather than in 
                              <%=Nationality%>
                              is "I have family / friends already studying / living in <span>Country of study</span>":
                                     </b>
                                     The presence of your family and friends in 
                           <%=country_intent_tostudy %>
                           may be perceived as a reduction of ties to 
                           <%=Nationality%>
                           and an incentive for you to seek to remain in 
                           <%=country_intent_tostudy %>
                           after your studies. 
                           <center><mark id="third">Severity = Low</mark></center>
                                 </li>
                             </ul>
                         </td>
                     </tr>


                 </table>
             </div>
             <div id="page8" runat="server" class="certificate-wrpr">

                 <table class="certificate-table" cellspacing="0" cellpadding="0">

                     <tr>
                         <td class="cer-sep cer-sep-1">
                             <ul>
                                 <li class="limrg" id="page9_statement_1" runat="server" style="display: none;"><span class="bullet">&#8226;</span>
                                     <b>Parents, brothers and sisters are mostly based in countries other than 
                              <%=Nationality%>
                              :    
                                     </b>
                                     Close relatives living in countries other than 
                           <%=Nationality%>
                           will be perceived as a  reduction in the ties to your home country.
                           <center><mark id="first">Severity = High</mark></center>
                                 </li>
                                 <li class="limrg" id="page9_statement_2" runat="server" style="display: none;"><span class="bullet">&#8226;</span>
                                     <b>Your parents, brothers and sisters are not alive. You do not have any living parents, brothers or sisters:</b>No close relatives living in 
                           <%=Nationality%>
                           will be perceived as a  reduction in the ties to your home country.
                           <center><mark id="first">Severity = High</mark></center>
                                 </li>
                                 <li class="limrg" id="page9_statement_3" runat="server" style="display: none;"><span class="bullet">&#8226;</span>
                                     <b>Parents, brothers and sisters are mainly based in other countries around the world, and one or two are based in 
                              <%=Nationality%>
                              : 
                                     </b>
                                     Having most of your close relatives living in countries other than 
                           <%=Nationality%>
                           may be perceived as a reduction in the ties to your home country.
                           <center><mark id="second">Severity = Medium</mark></center>
                                 </li>
                                 <li class="limrg" id="page9_statement_4" runat="server" style="display: none;"><span class="bullet">&#8226;</span>
                                     <b>Your parents, brothers and sisters are mainly based in 
                              <%=Nationality%>
                              , and one or two live in other countries around the world: 
                                     </b>
                                     Having some of your close relatives living in countries other than 
                           <%=Nationality%>
                           may be perceived as a potential reduction in the ties to your home country.
                           <center><mark id="third">Severity = Low</mark></center>
                                 </li>
                                 <li class="limrg" id="page9_statement_5" runat="server" style="display: none;"><span class="bullet">&#8226;</span>
                                     <b>Your parents, brothers and sisters almost equally based in 
                              <%=Nationality%>
                              and other countries around the world:
                                     </b>
                                     Having a significant number of your close relatives living in countries other than 
                           <%=Nationality%>
                           may be perceived as a potential reduction in the ties to your home country.
                           <center><mark id="third">Severity = Low</mark></center>
                                 </li>
                                 <li class="limrg" id="page9_statement_6" runat="server" style="display: none;"><span class="bullet">&#8226;</span>
                                     <b>The current market value of your family's fixed assets is less than USD 100,000:</b> The stated market value of your family's fixed assets are likely to be perceived as insufficient to support the costs of living and studying in 
                           <%=country_intent_tostudy %>
                           .
                           <span>Also, the absence of significant assets in your home country could be perceived as a potential lack of incentive for you to return to your home country after completion of your studies in 
                              <%=country_intent_tostudy %>
                              .
                           </span>
                                     <center><mark id="second">Severity = Medium</mark></center>
                                 </li>
                                 <li class="limrg" id="page9_statement_7" runat="server" style="display: none;"><span class="bullet">&#8226;</span>
                                     <b>The current market value of your family's fixed assets valued  between USD 100,00 to USD 500,000: </b>The stated market value of your family's fixed assets are likely to be perceived as potentially insufficient to support the costs of living and studying in 
                           <%=country_intent_tostudy %>
                           . 
                           <span>Also, the absence of large-value assets in your home country could be perceived as a potential lack of incentive for you to return to your home  country after completion of your studies in 
                              <%=country_intent_tostudy %>
                              .
                           </span>
                                     <center><mark id="third">Severity = Low</mark></center>
                                 </li>
                                 <li class="limrg" id="page9_statement_8" runat="server" style="display: none;"><span class="bullet">&#8226;</span>
                                     <b>The source of funding for your tuition fees and living expenses will be partly funded by your family and you intend to fund the remaining through part-time work in 
                              <%=country_intent_tostudy %>
                              :
                                     </b>
                                     Your stated intention to fund cost of living and studying in 
                           <%=country_intent_tostudy %>
                           through part-time work increases the probability of financial distress and suggests insufficient access to funds.
                           <center><mark id="second">Severity = Medium</mark></center>
                                 </li>
                             </ul>
                         </td>
                     </tr>


                 </table>
             </div>
             <div id="page9" runat="server" class="certificate-wrpr">

                 <table class="certificate-table" cellspacing="0" cellpadding="0">

                     <tr>
                         <td class="cer-sep cer-sep-1">
                             <ul>
                                 <li class="limrg" id="page10_statement_1" runat="server" style="display: none;"><span class="bullet">&#8226;</span>
                                     <b>The source of funding for your tuition fees and living expenses will be sponsored by an individual who is not your parent, spouse, brother or sister:   </b>Dependence  on funding from an individual who is not a close relative increases the risk of having insufficient funds to study and live in 
                           <%=country_intent_tostudy %>
                                     <center><mark id="second">Severity = Medium</mark></center>
                                 </li>
                                 <li class="limrg" id="page10_statement_2" runat="server" style="display: none;"><span class="bullet">&#8226;</span>
                                     <b>The source of funding for your tuition fees and living expenses will be funded using a mix of your family's own funds and loans/scholarships:</b>Your stated intention to fund part of the cost of living and studying in 
                           <%=country_intent_tostudy %>
                           through student loans and scholarships will require a confirmation letter from the lending bank  or scholarship awarding body.
                           <center><mark id="third">Severity = Low</mark></center>
                                 </li>
                                 <li class="limrg" id="page10_statement_3" runat="server" style="display: none;"><span class="bullet">&#8226;</span>
                                     <b>The source of funding for your tuition fees and living expenses will be funded largely through student loans and scholarships:  </b>Your stated intention to fund  part of the cost of living and studying in 
                           <%=country_intent_tostudy %>
                           through student loans and scholarships will require a confirmation letter from the lending bank  or scholarship awarding body.
                           <center><mark id="third">Severity = Low</mark></center>
                                 </li>
                                 <li class="limrg" id="page10_statement_4" runat="server" style="display: none;"><span class="bullet">&#8226;</span>
                                     <b>Your sponsor's income in the last calendar year was less than USD 25,000: </b>Your stated sponsor's income relative to the cost of living and studying in 
                           <%=country_intent_tostudy %>
                           indicates a high risk of possible financial distress for either yourself or your sponsor (or both), if you go and study in 
                           <%=country_intent_tostudy %>
                           .
                           <center><mark id="first">Severity = High</mark></center>
                                 </li>
                                 <li class="limrg" id="page10_statement_5" runat="server" style="display: none;"><span class="bullet">&#8226;</span>
                                     <b>Your sponsor's income in the last calendar year was between USD25,001 TO 50,000:</b>  Your stated sponsor's income relative to the cost of living and studying in 
                           <%=country_intent_tostudy %>
                           indicates a medium-level risk of possible financial distress for  either yourself or your sponsor (or both), if you go and study in 
                           <%=country_intent_tostudy %>
                           .
                           <center><mark id="second">Severity = Medium</mark></center>
                                 </li>
                                 <li class="limrg" id="page10_statement_6" runat="server" style="display: none;"><span class="bullet">&#8226;</span>
                                     <b>Your sponsor's income in the last calendar year was between USD50,001 TO 75,000:</b> Your stated sponsor's income relative to the cost of living and studying in 
                           <%=country_intent_tostudy %>
                           indicates a low-level risk of possible financial distress for  either yourself or your sponsor (or both), if you go and study in 
                           <%=country_intent_tostudy %>
                           .
                           <center><mark id="third">Severity = Low</mark></center>
                                 </li>
                                 <li class="limrg" id="page10_statement_7" runat="server" style="display: none;"><span class="bullet">&#8226;</span>
                                     <b>Your sponsor is a company or government department:</b>Your intention to fund the cost of living and studying in 
                           <%=country_intent_tostudy %>
                           through a corporate or government sponsor will require a confirmation letter from the company or government department.
                           <center><mark id="third">Severity = Low</mark></center>
                                 </li>
                             </ul>
                         </td>
                     </tr>


                 </table>
             </div>
             <div id="page10" runat="server" class="certificate-wrpr">

                 <table class="certificate-table" cellspacing="0" cellpadding="0">


                     <tr>
                         <td class="cer-sep cer-sep-1">
                             <ul>
                                 <li class="limrg" id="page11_statement_1" runat="server" style="display: none;"><span class="bullet">&#8226;</span>
                                     <b>Your sponsor is a scholarship awarding body/organisation:   </b>Your intention to fund the cost of living and studying in 
                           <%=country_intent_tostudy %>
                           through a scholarship awarding body/organisation will require a confirmation letter from the scholarship awarding body.
                           <center><mark id="third">Severity = Low</mark></center>
                                 </li>
                                 <li class="limrg" id="page11_statement_2" runat="server" style="display: none;"><span class="bullet">&#8226;</span>
                                     <b>Your sponsor is a bank or financial lending institution:</b> Your intention to fund the cost of living and studying in 
                           <%=country_intent_tostudy %>
                           through a bank or financial  lending institution will require a confirmation letter from the lending bank or financial institution.
                           <center><mark id="third">Severity = Low</mark></center>
                                 </li>
                                 <li class="limrg" id="page11_statement_3" runat="server" style="display: none;"><span class="bullet">&#8226;</span>
                                     <b>In your home country 
                              <%=Nationality%>
                              , you are required to do compulsory Military Service which is due in the next 12 months:  
                                     </b>
                                     Choosing to study in 
                           <%=country_intent_tostudy %>
                           when you are obligated to undertake military service in the next 12 months could raise concerns that you intend to use the student visa simply to avoid undertaking the military service.
                           <center><mark id="second">Severity = Medium</mark></center>
                                 </li>
                                 <li class="limrg" id="page11_statement_4" runat="server" style="display: none;"><span class="bullet">&#8226;</span>
                                     <b>In your home country 
                              <%=Nationality%>
                              , your spouse is required to do compulsory  Military Service which is due in the next 12 months:
                                     </b>
                                     Choosing to study in 
                           <%=country_intent_tostudy %>
                           when your spouse is obligated to undertake military service in the next 12 months could raise concerns that you intend to use the student visa simply to avoid the need for your spouse to undertake the military service.
                           <center><mark id="second">Severity = Medium</mark></center>
                                 </li>
                                 <li class="limrg" id="page11_statement_5" runat="server" style="display: none;"><span class="bullet">&#8226;</span>
                                     <b>In your home country 
                              <%=Nationality%>
                              , you are required to do compulsory Military Service which is due in the next 24 months:
                                     </b>
                                     Choosing to study in 
                           <%=country_intent_tostudy %>
                           when you are obligated to undertake military service in the next 24 months could raise concerns that you intend to use the student visa simply to avoid undertaking the military service.
                           <center><mark id="third">Severity = Low</mark></center>
                                 </li>
                                 <li class="limrg" id="page11_statement_6" runat="server" style="display: none;"><span class="bullet">&#8226;</span>
                                     <b>In your home country 
                              <%=Nationality%>
                              , your spouse is required to do compulsory  Military Service which is due in the next 24 months:
                                     </b>
                                     Choosing to study in 
                           <%=country_intent_tostudy %>
                           when your spouse is obligated to undertake military service in the next 24 months could raise concerns that you intend to use the student visa simply to avoid the need for your spouse to undertake the military service.
                           <center><mark id="third">Severity = Low</mark></center>
                                 </li>
                                 <li class="limrg" id="page11_statement_7" runat="server" style="display: none;"><span class="bullet">&#8226;</span>
                                     <b>In your home country 
                              <%=Nationality%>
                              , your dependent is required to do compulsory  Military Service which is due in the next 24 months: 
                                     </b>
                                     Choosing to study in 
                           <%=country_intent_tostudy %>
                           when your dependent is obligated to undertake military service in the next 24 months could raise concerns that you intend to use the student visa simply to avoid the need for your dependent to undertake the military service.
                           <center><mark id="third">Severity = Low</mark></center>
                                 </li>
                             </ul>
                         </td>
                     </tr>


                 </table>
             </div>
             <div id="page11" runat="server" class="certificate-wrpr">

                 <table class="certificate-table" cellspacing="0" cellpadding="0">


                     <tr>
                         <td class="cer-sep cer-sep-1">
                             <ul>
                                 <li class="limrg" id="page12_statement_1" runat="server" style="display: none;"><span class="bullet">&#8226;</span>
                                     <b>You have said that the political and civil situation in 
                              <%=Nationality%>
                              , your home country, is very bad, and there is risk to life and property. You would like to move out quickly:   
                                     </b>
                                     The political and civil situation in 
                           <%=Nationality%>
                           may indicate an increased probability that you may be intending to use the student visa to ultimately seek refuge or political asylum in 
                           <%=country_intent_tostudy %>
                           , which is inconsistent with the intentions of the student visa.
                           <center><mark id="first">Severity = High</mark></center>
                                 </li>
                                 <li class="limrg" id="page12_statement_2" runat="server" style="display: none;"><span class="bullet">&#8226;</span>
                                     <b>You have said that the political and civil situation in 
                              <%=Nationality%>
                              , your home country, is bad and you fear that your family and yourself would not be safe in  
                              <%=Nationality%>
                              :
                                     </b>
                                     The political and civil situation in 
                           <%=Nationality%>
                           may indicate an increased probability that you may be intending to use the student visa to ultimately seek refuge or political asylum in 
                           <%=country_intent_tostudy %>
                           , which is inconsistent with the intentions of the student visa.
                           <center><mark id="first">Severity = High</mark></center>
                                 </li>
                                 <li class="limrg" id="page12_statement_3" runat="server" style="display: none;"><span class="bullet">&#8226;</span>
                                     <b>You have said that the political and civil situation in 
                              <%=Nationality%>
                              , your home country, is deteriorating quickly, and you are worried about the future:  
                                     </b>
                                     The political and civil situation in 
                           <%=Nationality%>
                           may indicate that you are intending to use the student visa as a means of seeking a migration outcome. This reason is inconsistent with the intentions of the student visa.
                           <center><mark id="second">Severity = Medium</mark></center>
                                 </li>
                                 <li class="limrg" id="page12_statement_4" runat="server" style="display: none;"><span class="bullet">&#8226;</span>
                                     <b>You have said that the political and civil situation in 
                              <%=Nationality%>
                              , your home country, is not good. You believe that you would risk your future if you continue to stay in 
                              <%=Nationality%>
                              :
                                     </b>
                                     The political and civil situation in 
                           <%=Nationality%>
                           may indicate that you are intending to use the student visa as a means of seeking a migration outcome. This reason is inconsistent with the intentions of the student visa.
                           <center><mark id="third">Severity = Low</mark></center>
                                 </li>
                                 <li class="limrg" id="page12_statement_5" runat="server" style="display: none;"><span class="bullet">&#8226;</span>
                                     <b>You have said that you are unwilling to return and stay in your home country due to a fear of being persecuted because of your race, religion, nationality, membership of a particular social group or political opinion:</b>    Your fears concerning your safety in 
                           <%=Nationality%>
                           may indicate that you are intending to use the student visa to ultimately seek refuge or political asylum in 
                           <%=country_intent_tostudy %>
                           , which is inconsistent with the intentions of the student visa.
                           <center><mark id="first">Severity = High</mark></center>
                                 </li>
                             </ul>
                         </td>
                     </tr>


                 </table>
             </div>
        <%-- </div>
              <div style="page-break-before: always; page-break-after: always;">--%>
         <div id="page12" runat="server" class="certificate-wrpr" >
            
            <table class="certificate-table" cellspacing="0" cellpadding="0">
              
               
               <tr>
                  <td class="cer-sep cer-sep-1">
                     <p class="heading-1 bg-color heading-upr">
                        
                           2.4 Potential situation in 
                           <%=country_intent_tostudy %>
                        
                     </p>
                  </td>
               </tr>
               <tr>
                  <td>
                     <div class="overall-score-mrk">
                        <b>
                          
                              Potential situation in 
                              <%=country_intent_tostudy %>
                           
                        </b>
                        <br> 
                     </div>
                     <div class="overall-mrk"></div>
                     <div class="overall">
                        <p class="heading-small" style="display:none;" runat="server" id="potential_1">Based on your responses*, the GTE Direct AI-system did not identify any risk factors for this criteria.</p>
                        <p class="heading-small" style="display:none;" runat="server" id="potential_2">Based on your responses*, the GTE Direct AI-system has identified the following risk factors for this criteria: </p>
                        <p class="heading-small" style="display:none;" runat="server" id="potential_3">
                           *If any of the risk factors identified in this section are a result of an incorrect response in your GTE Direct <span>Assessment</span> , please make sure that you edit your 
                            <%=country_intent_tostudy %> - Statement of purpose (SOP)
                           . That way, you will reduce the risk factors in your application by ensuring that your 
                            <%=country_intent_tostudy %> - Statement of purpose (SOP)
                           only contains information that is true, accurate and correct.
                        </p>
                     </div>
                  </td>
               </tr>
               <tr>
                  <td class="cer-sep cer-sep-1">
                     <ul>
                        <li class="limrg" id="page13_statement_1" runat="server" style="display:none;"><span class="bullet">&#8226;</span>
                           <b>
                              You said that while you study in 
                              <%=country_intent_tostudy %>
                              , one or both your parents will join you and stay with you:
                           </b>
                           Information about the intentions of your accompanying parent(s) will need to be included in order to address any concerns regarding significant relationships.
                           <center><mark id="second">Severity = Medium</mark></center>
                        </li>
                        <li class="limrg" id="page13_statement_2" runat="server" style="display:none;"><span class="bullet">&#8226;</span>
                           <b>
                              You said that while you study in 
                              <%=country_intent_tostudy %>
                              , your parents, spouse, and children will join you and stay with you:  
                           </b>
                           Information about the intentions of your accompanying parent(s) will need to be included in order to address any concerns regarding significant relationships.
                           <center><mark id="second">Severity = Medium</mark></center>
                        </li>
                        <li class="limrg" id="page13_statement_3" runat="server" style="display:none;"><span class="bullet">&#8226;</span>
                           <b>
                              You said that while you study in 
                              <%=country_intent_tostudy %>
                              , your spouse will join you and stay with you:
                           </b>
                           Information about the intentions of your accompanying spouse will need to be included in order to address any concerns regarding significant relationships.
                           <center><mark id="third">Severity = Low</mark></center>
                        </li>
                       <li class="limrg" id="page13_statement_4" runat="server" style="display:none;"><span class="bullet">&#8226;</span>
                           <b>
                              You said that while you study in 
                              <%=country_intent_tostudy %>
                              , your spouse and children/dependents will join you and stay with you : 
                           </b>
                           Since your spouse and dependants will be joining you applicant to 
                           <%=country_intent_tostudy %>
                           , additional funds and schooling arrangements for dependants under the age of 18 need to be considered.
                           <center><mark id="third">Severity = Low</mark></center>
                        </li>
                      <li class="limrg" id="page13_statement_5" runat="server" style="display:none;"><span class="bullet">&#8226;</span>
                           <b>
                              You said that your personal experience with 
                              <%=country_intent_tostudy %>
                              does not exist because this is the first time I will be visiting 
                              <%=country_intent_tostudy %>
                              :  
                           </b>
                           Since this will be the first time that you will visit 
                           <%=country_intent_tostudy %>
                           , it will be very important that you have, and can demonstrate that you have, an accurate understanding of living in 
                           <%=country_intent_tostudy %>
                           .
                           <center><mark id="third">Severity = Low</mark></center>
                        </li>
                     </ul>
                  </td>
               </tr>
             
              
            </table>
         </div>
         <div id="page13" runat="server" class="certificate-wrpr" >
            
            <table class="certificate-table" cellspacing="0" cellpadding="0">
             
               
               <tr>
                  <td class="cer-sep cer-sep-1">
                     <ul>
                        <li class="limrg" id="page14_statement_1" runat="server" style="display:none;"><span class="bullet">&#8226;</span>
                           <b>
                              You said that your personal experience with 
                              <%=country_intent_tostudy %>
                              exists because you are currently living and have been studying in 
                              <%=country_intent_tostudy %>
                              on a student visa: 
                           </b>
                           Since you are currently in 
                           <%=country_intent_tostudy %>
                           , on a student visa, care must be taken to address any concerns regarding you potentially using another student visa simply to continue living in the country.
                           <center><mark id="third">Severity = Low</mark></center>
                        </li>
                        <li class="limrg" id="page14_statement_2" runat="server" style="display:none;"> <span class="bullet">&#8226;</span>
                           <b>
                              You said that your personal experience with 
                              <%=country_intent_tostudy %>
                              exists because  
                              <span>
                                 your spouse has linkages to 
                                 <%=country_intent_tostudy %>
                                 : 
                              </span>
                           </b>
                           <span>
                              Since your spouse has linkages to 
                              <%=country_intent_tostudy %>
                              , concerns regarding significant relationships must be addressed. 
                           </span>
                           <center><mark id="third">Severity = Low</mark></center>
                        </li>
                        <li class="limrg" id="page14_statement_3" runat="server" style="display:none;"> <span class="bullet">&#8226;</span>
                           <b>
                              You said that you have chosen to study in 
                              <%=country_intent_tostudy %>
                              over other destinations because you plan to migrate to 
                              <%=country_intent_tostudy %>
                              and apply for a Permanent Residency Visa after your course:
                           </b>
                           Your stated intention of migrating to 
                           <%=country_intent_tostudy %>
                           is contrary to the genuine temporary entrant criteria of the student visa.
                           <center><mark id="first">Severity = High</mark></center>
                        </li>
                        <li class="limrg" id="page14_statement_4" runat="server" style="display:none;"> <span class="bullet">&#8226;</span>
                           <b>
                              You said that you have chosen to study in 
                              <%=country_intent_tostudy %>
                              over other destinations because 
                              <%=country_intent_tostudy %>
                              will offer you a much better quality of life and career options than your Home Country:
                           </b>
                           A negative comparison of career options and quality of life between 
                           <%=country_intent_tostudy %>
                           and 
                           <%=Nationality%>
                           may be considered an disincentive for you to return to your home country after your studies.
                           <center><mark id="second">Severity = Medium</mark></center>
                        </li>
                        <li class="limrg" id="page14_statement_5" runat="server" style="display:none;"> <span class="bullet">&#8226;</span>
                           <b>
                              You said that you have chosen to study in 
                              <%=country_intent_tostudy %>
                              over other destinations because you already have friends and family living and studying in 
                              <%=country_intent_tostudy %>
                              : 
                           </b>
                           Existence of your family and friends already living in 
                           <%=country_intent_tostudy %>
                           may be considered an incentive to seek permanent residency upon completion of your studies.
                           <center><mark id="third">Severity = Low</mark></center>
                        </li>
                        <li class="limrg" id="page14_statement_6" runat="server" style="display:none;"> <span class="bullet">&#8226;</span>
                           <b>
                              You said that your decision to study at 
                              <<%=universityname %>
                              is based on having friends and family living in 
                              <%=City%>
                              :
                           </b>
                           Existence of your family and friends already living in 
                           <%=City%>
                           may be considered an incentive to seek permanent residency in 
                           <%=country_intent_tostudy %>
                           on completion of your studies.
                           <center><mark id="third">Severity = Low</mark></center>
                        </li>
                        <li class="limrg" id="page14_statement_7" runat="server" style="display:none;"> <span class="bullet">&#8226;</span>
                           <b>
                              You said that your decision to study at 
                              <<%=universityname %>
                              is based on it having the lowest tuition fee among your shortlisted institutions:
                           </b>
                           Your stated decision-making factor of lowest fees may result in concerns that you will be a risk of transferring to other low-cost education providers prior to completion of these studies.
                           <center><mark id="third">Severity = Low</mark></center>
                        </li>
                     </ul>
                  </td>
               </tr>
              
             
            </table>
         </div>
         <div id="page14" runat="server" class="certificate-wrpr" >
            
            <table class="certificate-table" cellspacing="0" cellpadding="0">
             
               <tr>
                  <td class="cer-sep cer-sep-1">
                     <ul>
                        <li class="limrg" id="page15_statement_1" runat="server" style="display:none;"> <span class="bullet">&#8226;</span>
                           <b>
                              You will be less than 18 years old when you first arrive in 
                              <%=country_intent_tostudy %>
                              to start your course: 
                           </b>
                           Adequate welfare arrangements need to be put in place as you  will be less than 18 years of age at the expected time of course commencement.
                           <center><mark id="third">Severity = Low</mark></center>
                        </li>
                        <li class="limrg" id="page15_statement_2" runat="server" style="display:none;"> <span class="bullet">&#8226;</span>
                           <b>
                              You have not studied in 
                              <%=country_intent_tostudy %>
                              before: 
                           </b>
                           The fact that you have not studied in 
                           <%=country_intent_tostudy %>
                           makes it very important that you have an accurate understanding of the visa requirements, conditions, language competency,  and what it is like to live and study in 
                           <%=country_intent_tostudy %>
                           .
                           <center><mark id="third">Severity = Low</mark></center>
                        </li>
                        <li class="limrg" id="page15_statement_3" runat="server" style="display:none;"> <span class="bullet">&#8226;</span>
                           <b>
                              Your parents live in 
                              <%=country_intent_tostudy %>
                              : 
                           </b>
                           Having parents living in 
                           <%=country_intent_tostudy %>
                           could be considered an incentive to not return to your home  country on completion of your studies.
                           <center><mark id="third">Severity = Low</mark></center>
                        </li>
                        <li class="limrg" id="page15_statement_4" runat="server" style="display:none;"> <span class="bullet">&#8226;</span>
                           <b>
                              You said that If an Immigration Officer were to ask you about what you know about 
                              <%=country_intent_tostudy %>
                              , you believe that you cannot reasonably communicate an acceptable understanding of the country: 
                           </b>
                           It is important that you have an accurate understanding of the visa requirements, conditions, language competency,  and what it is like to live and study in 
                           <%=country_intent_tostudy %>
                           .
                           <center><mark id="third">Severity = Low</mark></center>
                        </li>
                        <li class="limrg" id="page15_statement_5" runat="server" style="display:none;"> <span class="bullet">&#8226;</span>
                           <b>
                              You said that If an Immigration Officer were to ask you about what you know about 
                              <%=City%>
                              , you believe that you cannot reasonably communicate an acceptable  understanding of the  study destination: 
                           </b>
                           It is important that you have an  accurate understanding of your study destination.
                           <center><mark id="third">Severity = Low</mark></center>
                        </li>
                     </ul>
                  </td>
               </tr>
              
              
            </table>
         </div>
         <div id="page15" runat="server" class="certificate-wrpr" >
            
            <table class="certificate-table" cellspacing="0" cellpadding="0">
              
               
               <tr>
                  <td class="cer-sep cer-sep-1">
                     <ul id="page16_statement_1" runat="server" style="display:none;">
                         <li> <span class="bullet">&#8226;</span>
                           <b>
                              You said that If an Immigration Officer were to ask you about what you know about 
                              <%=universityname %>
                              , you believe that you cannot reasonably communicate an  acceptable understanding of the education provider you have chosen:  
                           </b>
                           It is important that you have an accurate understanding of your education provider and why you have decided to study there and not elsewhere.
                           <center><mark id="third">Severity = Low</mark></center>
                        </li>
                     </ul>
                  </td>
              
             
            </table>
         </div>
         <div id="page16" runat="server" class="certificate-wrpr" >
            
            <table class="certificate-table" cellspacing="0" cellpadding="0">
               
                
               <tr>
                  <td class="cer-sep cer-sep-1">
                     <ul>
                        <li class="limrg" id="page17_statement_1" runat="server" style="display:none;"><span class="bullet">&#8226;</span>
                           <b>
                              You said that If an Immigration Officer were to ask you about what you know about 
                              <Course>
                              , you believe that you cannot reasonably communicate an  acceptable understanding of the course you have decided to study:  
                           </b>
                           It is important that you have an accurate understanding of your chosen course and why you have decided to study that course instead of other available options.
                           <center><mark id="third">Severity = Low</mark></center>
                        </li>
                        <li class="limrg" id="page17_statement_2" runat="server" style="display:none;"><span class="bullet">&#8226;</span>
                           <b>
                              You said that you do not personally know at least one person who lives in 
                              <%=City%>
                              : 
                           </b>
                           Since you do not personally know anybody who lives in 
                           <%=City%>
                           , your transition into the new environment may be harder because of the absence of any existing social networks. Therefore it is very important that you have an accurate understanding of your study destination as that will help you transition better and quicker, into your new environment.
                           <center><mark id="third">Severity = Low</mark></center>
                        </li>
                        <li class="limrg" id="page17_statement_3" runat="server" style="display:none;"><span class="bullet">&#8226;</span>
                           <b>
                              You said that you do not personally know at least one person who is currently studying at 
                              <%=universityname %>
                              : 
                           </b>
                           Since you do not personally know anybody who is currently studying at 
                           <%=universityname %>
                           , your transition into the new environment may be harder because of the absence of any existing social networks. Therefore it is very important that you have an accurate understanding of your study destination as that will help you transition better and quicker, into your new environment.
                           <center><mark id="third">Severity = Low</mark></center>
                        </li>
                        <li class="limrg" id="page17_statement_4" runat="server" style="display:none;"><span class="bullet">&#8226;</span>
                           <b>
                              You said that you do not personally know at least one person who is currently planning to study at 
                              <%=universityname %>
                              :  
                           </b>
                           Since you do not personally know  anybody who is currently planning to study at 
                           <%=universityname %>
                           , your transition into the new environment may be harder because of the absence of any existing social networks. Therefore it is very important that you have an accurate understanding of your study destination as that will help you transition better and quicker, into your new environment.
                           <center><mark id="third">Severity = Low</mark></center>
                        </li>
                        <li class="limrg" id="page17_statement_5" runat="server" style="display:none;"><span class="bullet">&#8226;</span>
                           <b>You will be under 18 years old when your course starts:  </b> Since you will be under 18 years old at the time your course starts, special welfare arrangements will need to be put in place as per the visa requirements.
                           <center><mark id="fourth">Severity = Not Applicable/Mandatory Requirement</mark></center>
                        </li>
                        <li class="limrg" id="page17_statement_6" runat="server" style="display:none;">
                           <b>You got married less than 6 months ago:  </b> The decision to study in 
                           <%=country_intent_tostudy %>
                           so soon after your wedding may raise suspicions about the reasons for getting  married.
                           <center><mark id="third">Severity = Low</mark></center>
                        </li>
                        <li class="limrg" id="page17_statement_7" runat="server" style="display:none;"><span class="bullet">&#8226;</span>
                           <b>
                              You are married to a 
                              <%=country_intent_tostudy %>
                              citizen:
                           </b>
                           Since you are married to an 
                           <%=country_intent_tostudy %>
                           citizen, an explanation of why you are applying for a Student Visa instead of a Spouse Visa should be addressed. 
                           <center><mark id="second">Severity = Medium</mark></center>
                        </li>
                     </ul>
                  </td>
               </tr>
              
             
            </table>
         </div>
              <%--    </div>
              <div style="page-break-before: always; page-break-after: always;">--%>
         <div id="page17" runat="server" class="certificate-wrpr" >
            
            <table class="certificate-table" cellspacing="0" cellpadding="0">
              
                
               <tr>
                  <td class="cer-sep cer-sep-1">
                     <ul>
                        <li class="limrg" id="page18_statement_1" runat="server" style="display:none;"><span class="bullet">&#8226;</span>
                           <b>
                              You recently married a 
                              <%=country_intent_tostudy %>
                              citizen:
                           </b>
                           Since you recently married a 
                           <%=country_intent_tostudy %>
                           citizen, an explanation of why you are applying for a Student Visa instead of a Spouse Visa should be addressed. Your motives for getting married will also likely be a cause for concern.
                           <center><mark id="high">Severity = High</mark></center>
                        </li>
                        <li class="limrg" id="page18_statement_2" runat="server" style="display:none;"><span class="bullet">&#8226;</span>
                           <b>You have dependents under the age of 18:</b> Since you have dependents under the age of 18, evidence of access to additional funds to support them while you study will be required. Also, If your dependents (under 18) will be accompanying you to 
                           <%=country_intent_tostudy %>
                           , adequate schooling arrangements need to be made for them.
                           <center><mark id="fourth">Severity = Not Applicable/Mandatory Requirement</mark></center>
                        </li>
                     </ul>
                     <p class="heading-1 bg-color heading-upr">2.5 Immigration history</p>
                  </td>
               </tr>
               <tr>
                  <td>
                     <div class="overall-score-mrk"><b>Immigration history</b><br> </div>
                     <div class="overall-mrk"></div>
                     <div class="overall">
                        <p class="heading-small" runat="server" style="display:none;" id="immigration_1">Based on your responses*, the GTE Direct AI-system did not identify any risk factors for this criteria.</p>
                        <p class="heading-small" runat="server" style="display:none;" id="immigration_2">Based on your responses*, the GTE Direct AI-system has identified the following risk factors for this criteria: </p>
                        <p class="heading-small" runat="server" style="display:none;" id="immigration_3">
                           *If any of the risk factors identified in this section are a result of an incorrect response in your GTE Direct <span>Assessment</span> , please make sure that you edit your 
                            <%=country_intent_tostudy %> - Statement of purpose (SOP)
                           . That way, you will reduce the risk factors in your application by ensuring that your 
                            <%=country_intent_tostudy %> - Statement of purpose (SOP)
                           only contains information that is true, accurate and correct.
                        </p>
                     </div>
                  </td>
               </tr>
               <tr>
                  <td class="cer-sep cer-sep-1">
                     <ul>
                        <li class="limrg" id="page18_statement_3" runat="server" style="display:none;"><span class="bullet">&#8226;</span>
                           <b>
                              At the time of applying for the Student Visa you will be in 
                              <%=homcountry %>
                              : 
                           </b>
                           It will be important for you to attach "proof of address" with your visa application.
                           <center><mark id="third">Severity = Low</mark></center>
                        </li>
                        <li class="limrg" id="page18_statement_4" runat="server" style="display:none;"><span class="bullet">&#8226;</span>
                           <b>
                              At the time of applying for the Student Visa you will not be in 
                              <%=homcountry %>
                              :  
                           </b>
                           It will be important for you to attach "proof of address" with your visa application.
                           <center><mark id="third">Severity = Low</mark></center>
                        </li>
                        <li class="limrg" id="page18_statement_5" runat="server" style="display:none;"><span class="bullet">&#8226;</span>
                           <b>
                              At the time of applying for the Student Visa you will be in 
                              <%=country_intent_tostudy %>
                              : 
                           </b>
                           Since you will be in 
                           <%=country_intent_tostudy %>
                           at the time of your visa application, the decision-maker will be keen to check that you have been complying with your visa conditions. You must also be prepared to pay an additional visa application fee because the Department of Home Affairs often charge an extra fee for temporrary visa holders who apply for another temporary visa.
                           <center><mark id="third">Severity = Low</mark></center>
                        </li>
                     </ul>
                  </td>
               </tr>
              
              
            </table>
         </div>
         <div id="page18" runat="server" class="certificate-wrpr" >
            
            <table class="certificate-table" cellspacing="0" cellpadding="0">
               
               <tr>
                  <td class="cer-sep cer-sep-1">
                     <ul>
                        <li class="limrg" id="page19_statement_1" runat="server" style="display:none;"><span class="bullet">&#8226;</span>
                           <b>
                              You have travelled  to 
                              <%=country_intent_tostudy %>
                              before: 
                           </b>
                           Since you have travelled to  
                           <%=country_intent_tostudy %>
                           before, the decision-maker will be keen to check that you had complied with the conditions of the visa that you had (the one that enabled you to travel to the country).
                           <center><mark id="third">Severity = Low</mark></center>
                        </li>
                        <li class="limrg" id="page19_statement_2" runat="server" style="display:none;"><span class="bullet">&#8226;</span>
                           <b>You said that you have had one or more visa applications to travel to any foreign country refused or rejected before: </b>  The decision-maker will be interested in understanding why your previous visa application(s) was/were refused and to confirm if those reasons are also relevant to your student visa application to 
                           <%=country_intent_tostudy %>
                           .
                           <center><mark id="second">Severity = Medium</mark></center>
                        </li>
                        <li class="limrg" id="page19_statement_3" runat="server" style="display:none;"><span class="bullet">&#8226;</span>
                           <b>You have never travelled to any foreign country before:</b>  No history of international travel means that this particular aspect of your immigration history cannot be assessed by the GTE Direct artificial intelligence.
                           <center><mark id="third">Severity = Low</mark></center>
                        </li>
                        <li class="limrg" id="page19_statement_4" runat="server" style="display:none;"><span class="bullet">&#8226;</span>
                           <b>You have been deported from a foreign country before:   </b> Since you have been deported from a foreign country before, the decision-makers of your student visa and course applications will be interested in understanding why you were deported and to confirm if those reasons are also relevant to your student visa application to 
                           <%=country_intent_tostudy %>
                           .
                           <center><mark id="first">Severity = High</mark></center>
                        </li>
                        <li class="limrg" id="page19_statement_5" runat="server" style="display:none;"><span class="bullet">&#8226;</span>
                           <b>You said that you have not always complied with the visa conditions of your previous visas:  </b>  The lack of compliance with the conditions of your previous visa will raise concerns that you may also not comply with your student visa conditions for 
                           <%=country_intent_tostudy %>
                           .
                           <center><mark id="second">Severity = Medium</mark></center>
                        </li>
                        <li class="limrg" id="page19_statement_6" runat="server" style="display:none;"><span class="bullet">&#8226;</span>
                           <b>You said that a previous visa that you had was considered for cancellation: </b> The circumstances surrounding your possible previous visa cancellation needs to be explained to address any concerns a decision-maker might have regarding your intention to comply with your student visa conditions.
                           <center><mark id="third">Severity = Low</mark></center>
                        </li>
                        <li class="limrg" id="page19_statement_7" runat="server" style="display:none;"><span class="bullet">&#8226;</span>
                           <b>You said that you have previously over-stayed beyond the expiry date of a visa in a country: </b> The lack of compliance with the conditions of your previous visa will raise concerns that you may also not comply with your student visa conditions for 
                           <%=country_intent_tostudy %>
                           . 
                           <center><mark id="first">Severity = High</mark></center>
                        </li>
                        <li class="limrg" id="page19_statement_8" runat="server" style="display:none;">
                           <b>You said that a previous visa that you had was cancelled: </b>  The circumstances surrounding your  previous visa cancellation needs to be explained to  address any concerns a decision-maker might have regarding your intention to comply with your student visa conditions.
                           <center><mark id="second">Severity = Medium</mark></center>
                        </li>
                     </ul>
                  </td>
               </tr>
              
              
            </table>
         </div>
                  <%--</div>
              <div style="page-break-before: always; page-break-after: always;">--%>
         <div id="page19" runat="server" class="certificate-wrpr" >
            
            <table class="certificate-table" cellspacing="0" cellpadding="0">
              
               
               <tr>
                  <td class="cer-sep cer-sep-1">
                     <p class="heading-1 bg-color heading-upr">2.6 Character & criminal record</p>
                  </td>
               </tr>
               <tr>
                  <td>
                     <div class="overall-score-mrk"><b>Character & criminal record</b><br> </div>
                     <div class="overall-mrk"></div>
                     <div class="overall">
                        <p class="heading-small" runat="server" style="display:none;" id="criminal_1"> Based on your responses*, the GTE Direct AI-system did not identify any risk factors for this criteria.</p>
                        <p class="heading-small" runat="server" style="display:none;" id="criminal_2">Based on your responses*, the GTE Direct AI-system has identified the following risk factors for this criteria: </p>
                        <p class="heading-small" runat="server" style="display:none;" id="criminal_3">
                           *If any of the risk factors identified in this section are a result of an incorrect response in your GTE Direct <span>Assessment</span> , please make sure that you edit your 
                            <%=country_intent_tostudy %> - Statement of purpose (SOP)
                           . That way, you will reduce the risk factors in your application by ensuring that your 
                            <%=country_intent_tostudy %> - Statement of purpose (SOP)
                           only contains information that is true, accurate and correct.
                        </p>
                     </div>
                  </td>
               </tr>
               <tr>
                  <td class="cer-sep cer-sep-1">
                     <ul>
                        <li class="limrg" id="page20_statement_1" runat="server" style="display:none;"><span class="bullet">&#8226;</span>
                           <b>You said that you have been charged with a criminal offence that is currently awaiting legal action:</b>The circumstances surrounding the pending legal action against you must be explained to address any concerns about your character and your behaviour, and the potential impact that will have in the communities in 
                           <%=country_intent_tostudy %>
                           .
                           <center><mark id="first">Severity = High</mark></center>
                        </li>
                        <li class="limrg" id="page20_statement_2" runat="server" style="display:none;"><span class="bullet">&#8226;</span>
                           <b>You said that you have previously been convicted of a criminal offence:  </b>The circumstances surrounding your criminal conviction must be explained to address any concerns about your character and your behaviour, and the potential impact that will have in the communities in 
                           <%=country_intent_tostudy %>
                           .
                           <center><mark id="first">Severity = High</mark></center>
                        </li>
                        <li class="limrg" id="page20_statement_3" runat="server" style="display:none;"><span class="bullet">&#8226;</span>
                           <b>You said that you have been the subject of an arrest warrant or Interpol notice:</b> The circumstances surrounding your arrest warrant or Interpol notice must be explained to address any concerns about your character and your behaviour, and the potential impact that will have in the communities in 
                           <%=country_intent_tostudy %>
                           .
                           <center><mark id="first">Severity = High</mark></center>
                        </li>
                        <li class="limrg" id="page20_statement_4" runat="server" style="display:none;"><span class="bullet">&#8226;</span>
                           <b>You said that you have been found guilty of a sexually-based offence involving a child:</b> The circumstances surrounding the guitly verdict of a sexually-based offence involving a child must be explained to address any concerns about your character and behaviour, and the potential impact that will have in the communities in 
                           <%=country_intent_tostudy %>
                           .
                           <center><mark id="first">Severity = High</mark></center>
                        </li>
                        <li class="limrg" id="page20_statement_5" runat="server" style="display:none;"><span class="bullet">&#8226;</span>
                           <b>You said that you have been acquitted of an offence on the grounds of unsoundness of mind or insanity:</b> The circumstances surrounding your acquital must be explained to address any concerns about your character and your behaviour, and the potential impact that will have in the communities in 
                           <%=country_intent_tostudy %>
                           .
                           <center><mark id="first">Severity = High</mark></center>
                        </li>
                     </ul>
                  </td>
               </tr>
              
             
            </table>
         </div>
         <div id="page20" runat="server" class="certificate-wrpr" >
            
            <table class="certificate-table" cellspacing="0" cellpadding="0">
              
               
               <tr>
                  <td class="cer-sep cer-sep-1">
                     <ul>
                        <li class="limrg" id="page21_statement_1" runat="server" style="display:none;"><span class="bullet">&#8226;</span>
                           <b>
                              You said that you have been directly or indirectly involved in,  or associated with, activities which would represent a risk to the national security in 
                              <%=country_intent_tostudy %>
                              or any other country:
                           </b>
                           The nature and circumstances surrounding these activities must be explained to address any concerns about your character and your behaviour, and the potential impact that will have on the safety of communities in 
                           <%=country_intent_tostudy %>
                           .
                           <center><mark id="first">Severity = High</mark></center>
                        </li>
                        <li class="limrg" id="page21_statement_2" runat="server" style="display:none;"><span class="bullet">&#8226;</span>
                           <b>You said that you have been charged with, or indicted for, genocide, war crimes, crimes against humanity, torture, slavery, or any other crime that is otherwise of a serious international concern: </b> The nature and circumstances surrounding these offences must be explained to address any concerns about your character and your behaviour, and the potential impact that will have on the safety of communities in 
                           <%=country_intent_tostudy %>
                           .
                           <center><mark id="first">Severity = High</mark></center>
                        </li>
                        <li class="limrg" id="page21_statement_3" runat="server" style="display:none;"><span class="bullet">&#8226;</span>
                           <b>You said that you have been associated with a person, group or organisation that has been/is involved in criminal conduct:</b>  The nature and circumstances surrounding these associations must be explained to address any concerns  about your character and your behaviour, and the potential impact that will have on the safety of communities in 
                           <%=country_intent_tostudy %>
                           .
                           <center><mark id="first">Severity = High</mark></center>
                        </li>
                        <li class="limrg" id="page21_statement_4" runat="server" style="display:none;"><span class="bullet">&#8226;</span>
                           <b>
                              You said that you have been associated with an organisation engaged in violence or engaged in acts of violence (including war, insurgency, freedom fighting, terrorism, protest) either overseas or in 
                              <%=country_intent_tostudy %>
                              :
                           </b>
                           The nature and circumstances surrounding these associations and  activities must be explained to address any concerns  about your character and your behaviour, and the potential impact that will have on the safety of communities in 
                           <%=country_intent_tostudy %>
                           .
                           <center><mark id="first">Severity = High</mark></center>
                        </li>
                        <li class="limrg" id="page21_statement_5" runat="server" style="display:none;"><span class="bullet">&#8226;</span>
                           <b>You said that you have served in a military force, police force, state sponsored/private militia or intelligence agency (including secret police): </b> The details of your service in these types of organisations must be explained to address any concerns  about your training, character and your behaviour, and the potential  impact that will have on the safety of communities in  
                           <%=country_intent_tostudy %>
                           .
                           <center><mark id="first">Severity = High</mark></center>
                        </li>
                        <li class="limrg" id="page21_statement_6" runat="server" style="display:none;"><span class="bullet">&#8226;</span>
                           <b>You said that you have either undergone military/paramilitary training, or been trained in weapons/explosives or in the manufacture of chemical/biological products: </b>The details of your training and how you acquired this knowledge must be explained to address any concerns  about your training, character and your behaviour, and the potential impact that will have on the safety of communities in  
                           <%=country_intent_tostudy %>
                           .
                           <center><mark id="first">Severity = High</mark></center>
                        </li>
                     </ul>
                  </td>
               </tr>
              
             
            </table>
         </div>
                <%--  </div>--%>
         <div id="page21" runat="server" class="certificate-wrpr">

             <table class="certificate-table" cellspacing="0" cellpadding="0">


                 <tr>
                     <td class="cer-sep cer-sep-1">
                         <ul>
                             <li class="limrg" id="page22_statement_1" runat="server" style="display: none;"><span class="bullet">&#8226;</span>
                                 <b>You said that you have been involved in people smuggling or people trafficking offences:</b>The details of these people smuggling or people trafficking offences must be explained to address any concerns  about your character and your behaviour, and the potential impact that will have on the safety of communities in  
                           <%=country_intent_tostudy %>
                           .
                           <center><mark id="first">Severity = High</mark></center>
                             </li>
                             <li class="limrg" id="page22_statement_2" runat="server" style="display: none;"><span class="bullet">&#8226;</span>
                                 <b>You said that you have outstanding debts to the Government of 
                              <%=country_intent_tostudy %>
                              or other public authority in 
                              <%=country_intent_tostudy %>
                              : 
                                 </b>
                                 The details of these outstanding debts must be explained to address any concerns  about your character and/or your financial capacity to adequately fund the cost of living and studying in 
                           <%=country_intent_tostudy %>
                           .
                           <center><mark id="first">Severity = High</mark></center>
                             </li>
                         </ul>
                         <p class="heading-1 bg-color heading-upr">2.7 Commitment and consistency</p>
                     </td>
                 </tr>
                 <tr>
                     <td>
                         <div class="overall-score-mrk"><b>Commitment & consistency</b><br>
                         </div>
                         <div class="overall-mrk"></div>
                         <div class="overall">
                             <p class="heading-small" runat="server" style="display: none;" id="convention_1">Based on your responses*, the GTE Direct AI-system did not identify any risk factors for this criteria.</p>
                             <p class="heading-small" runat="server" style="display: none;" id="convention_2">Based on your responses*, the GTE Direct AI-system has identified the following risk factors for this criteria: </p>
                             <p class="heading-small" runat="server" style="display: none;" id="convention_3">
                                 *If any of the risk factors identified in this section are a result of an incorrect response in your GTE Direct <span>Assessment</span> , please make sure that you edit your 
                            <%=country_intent_tostudy %> - Statement of purpose (SOP)
                           . That way, you will reduce the risk factors in your application by ensuring that your 
                            <%=country_intent_tostudy %> - Statement of purpose (SOP)
                           only contains information that is true, accurate and correct.
                             </p>
                         </div>
                     </td>
                 </tr>
                 <tr>
                     <td class="cer-sep cer-sep-1">
                         <ul>
                             <li class="limrg" id="page22_statement_3" runat="server" style="display: none;"><span class="bullet">&#8226;</span>
                                 <b>You said that, in addition to 
                              <%=universityname %>
                               , you have also applied to study at other educational institutions in 
                              <%=country_intent_tostudy %>
                              : 
                                 </b>
                                 Once you have considered your options and have decided on which education institution and course you will study, it will be important to remain commited to that choice as much as possible. The reason why it is important to be committed and consistent is because you want to avoid having a track record that could be perceived as a non-genuine temporary entrant after your visa is granted.
                           <center><mark id="third">Severity = Low</mark></center>
                             </li>
                             <li class="limrg" id="page22_statement_4" runat="server" style="display: none;"><span class="bullet">&#8226;</span>
                                 <b>You said that, if before completing your course, you are offered a full time job in 
                              <%=country_intent_tostudy %>
                              , you will take it up, and drop out from your course: 
                                 </b>
                                 This response indicates that you prioritise full time work over studies. This apparent priority of work over study may be perceived as an indication that your student visa application is only a means of getting into 
                           <%=country_intent_tostudy %>
                           and that study is not your primary objective.
                           <center><mark id="second">Severity = Medium</mark></center>
                             </li>
                         </ul>
                     </td>
                 </tr>


             </table>
         </div>
         <div id="page22" runat="server" class="certificate-wrpr">

             <table class="certificate-table" cellspacing="0" cellpadding="0">

                 <tr>
                     <td class="cer-sep cer-sep-1">
                         <ul>
                             <li class="limrg" id="page23_statement_1" runat="server" style="display: none;"><span class="bullet">&#8226;</span>
                                 <b>You said that, if before completing your course, you are offered a full time job in 
                              <%=country_intent_tostudy %>
                              , you will take it up, and study part-time:
                                 </b>
                                 This response  indicates that you prioritise full time work over studies. This apparent priority  of work over study may be perceived as an indication that your student visa application is only a means of getting into 
                           <%=country_intent_tostudy %>
                           and that study is not your primary objective.
                           <center><mark id="second">Severity = Medium</mark></center>
                             </li>
                             <li class="limrg" id="page23_statement_2" runat="server" style="display: none;"><span class="bullet">&#8226;</span>
                                 <b>You said that, after starting your course, you will continue to look for more cost-effective course options and switch to other Educational Institution which allow you to save costs: </b>This response indicates that you may not be committed to your choice of course or education provider. Once you make a choice, it will be important to remain commited to that choice as much as possible. The reason why it is important to be committed and consistent is because you want to avoid having a track record that could be perceived as a non-genuine temporary entrant after your visa is granted.
                           <center><mark id="second">Severity = Medium</mark></center>
                             </li>
                             <li class="limrg" id="page23_statement_3" runat="server" style="display: none;"><span class="bullet">&#8226;</span>
                                 <b>You said that, once you get your Student Visa, you intend to change Educational  Institutions:  </b>Your stated intention to change education providers after visa is granted is contrary to the intentions of the visa requirements. If you have another education institution that you intend to study with, you should apply for your visa with that education institution.
                           <center><mark id="first">Severity = High</mark></center>
                             </li>
                         </ul>
                         <p class="heading-1 bg-color heading-upr">2.8 Level of knowledge and understanding of the student visa requirements and conditions</p>
                         <ul>
                             <li class="limrg" id="page23_statement_4" runat="server" style="display: none;"><span class="bullet">&#8226;</span>
                                 <b>You have not undertaken the GTE Direct Certification Test:</b>  At the time of your GTE  Direct Assessment, you had not undertaken the GTE Certification Test and therefore your level of understanding of the studet visa requirements and conditions for 
                           <%=country_intent_tostudy %>
                           are undetermined.
                           <center><mark id="first">Severity = High</mark></center>
                             </li>
                             <li class="limrg" id="page23_statement_5" runat="server" style="display: none;"><span class="bullet">&#8226;</span>
                                 <b>You have undertaken the GTE Direct Certification Test and your grade was "Fair (60-69%)": </b>At the time of your GTE Direct Assessment, you had undertaken the GTE Certification Test and you got between 60 and 69 percent of the questions correct. This grade means that you only have a fair understanding of the student visa requirements and conditions because of some inaccuracies and misunderstandings. Therefore, you run the risk of not complying with the visa requirements and conditions in unfamiliar situations.
                           <center><mark id="third">Severity = Low</mark></center>
                             </li>
                             <li class="limrg" id="page23_statement_6" runat="server" style="display: none;"><span class="bullet">&#8226;</span>
                                 <b>You have undertaken the GTE Direct Certification Test and your grade was  "Partial (50-59%)":</b>At the time of your GTE Direct Assessment, you had undertaken  the GTE Certification Test and you got between 50 and 59 percent of the questions correct. This grade means that you only have a partial understanding of the student visa requirements and conditions because you likely to make many mistakes. Therefore, there is a big risk that you will not comply with the visa requirements and conditions if you are granted a visa with your current level of knowledge and understanding.
                           <center><mark id="second">Severity = Medium</mark></center>
                             </li>
                             <li class="limrg" id="page23_statement_7" runat="server" style="display: none;"><span class="bullet">&#8226;</span>
                                 <b>You have undertaken the GTE Direct Certification Test and your grade was "Inadequate (40-49%)": </b>At the time of your GTE Direct Assessment, you had undertaken the GTE Certification Test and you got between 40 and 49 percent of the questions correct. This grade means that you an inadequate understanding of the student visa requirements and conditions because of frequent problems understanding the overall meaning of the visa requirements and conditions. Therefore, there is a very high risk that you will not comply with the visa requirements and conditions if you are granted a visa with your current level of knowledge and understanding.
                           <center><mark id="first">Severity = High</mark></center>
                             </li>
                             <li class="limrg" id="page23_statement_8" runat="server" style="display: none;"><span class="bullet">&#8226;</span>
                                 <b>You have undertaken the GTE Direct Certification Test and your grade was "Unacceptable (0-39%)":</b>At the time of your GTE Direct Assessment, you had undertaken the GTE Certification Test and you got between 0 and 39 percent of the questions correct. This grade means that you an unacceptable understanding of the student visa requirements and conditions. Therefore, there is an extremely high risk  that you will not comply with the visa requirements and conditions if you are granted a visa with your current level of knowledge and understanding.
                           <center><mark id="first">Severity = High</mark></center>
                             </li>
                         </ul>

                     </td>
                 </tr>
                
             </table>
         </div>         
         <div id="page23" class="certificate-wrpr" style="page-break-before: always; page-break-after: always;">

             <table class="certificate-table" cellspacing="0" cellpadding="0">
                  <tr>
                     <td>
                         <p class="heading-1 bg-color heading-upr">3.1 The importance of being truthful, honest and transparent</p>
                         <p>When addressing the risk factors identified in Section 2 of this report, it is better to be honest and transparent about them rather than attempt to be dishonest or to not disclose the facts. Honesty and transparency is important because these qualities breed trust. Trust in turn produces confidence in the decision-maker, which is likely to encourage him/her/them to give you the benefit of the doubt by approving your application thereby giving you the opportunity to fulfil your goals.</p>
                         <p>If you are either dishonest, or, if you fail to disclose a key piece of information, and the decision-maker gets to find out the truth during the assessment, the decision-maker will not trust you and will almost certainly reject your application. </p>
                         <p>An extreme case of dishonesty is "fraud".  In the context of your student visa and course application, fraud can be defined as:<br>
                             <b><i>"Fraud - Intentional deception or perversion of truth in order to induce the decision-maker to grant  you admission into a course, or to grant you a student visa".</i></b></p>
                         <p>
                             Needless to say, fraud is a serious offence. You will do well to avoid any temptation to commit any fraudulent act because the penalties are severe. For example, in
                        <%=country_intent_tostudy %>
                        , if your student visa application is found to be fraudulent, not only will your visa application be refused, but you could also potentially face a minimum of a 3-year ban from travelling to
                        <%=country_intent_tostudy %>
                        .
                         </p>
                         <p>As you can imagine, the costs associated with being dishonest are too high. Honesty is always the  best approach in life and it is with principle in mind that we make the following recommendations on how to address the risk factors identified in your GTE Direct Assessment.</p>
                     </td>
                 </tr>

                 <tr>
                     <td class="cer-sep cer-sep-1">
                         
                         <p class="heading-1 bg-color heading-upr">3.2 Suggestions on how you can address the risk factors to increase the probability of a successful outcome</p>
                         <p>Please find below, our recommendations of how you could approach addressing the respective risk factors in your application:</p>
                     </td>
                 </tr>
                 <tr>
                     <td>
                         <div class="container" style="display: block;">
                             <div id="page24_tab1" runat="server">
                                 <div class="table-responsive">
                                     <table class="table">
                                         <tr>
                                             <th class="head-table wid">Risk factor
                                             </th>
                                             <th class="head-table">Severity of Risk
                                             </th>
                                             <th class="head-table wd">How you could address the risk factor in your Australia - Statement of purpose (SOP)</th>
                                             <th>Possible supporting documents** that you could consider attaching to your application</th>
                                         </tr>
                                         <tr>
                                             <td class="border head-table">Study & Work Gaps
                                             </td>
                                             <td class="border head-table second">Medium
                                             </td>
                                             <td class="border">Provide an explanation for why you were neither working nor studying for any continuous period of 3 months or longer</td>
                                             <td class="border">Attach your most recent curriculum vitae or résumé outlining both employment and study for the past five years.</td>
                                         </tr>
                                     </table>
                                 </div>
                                 <br>
                             </div>
                             <div id="page24_tab2" runat="server" style="display: none;">
                                 <div class="table-responsive">
                                     <table class="table">
                                         <tr>
                                             <th class="head-table wid">Risk factor
                                             </th>
                                             <th class="head-table">Severity of Risk
                                             </th>
                                             <th class="head-table wd">How you could address the risk factor in your Australia - Statement of purpose (SOP)</th>
                                             <th>Possible supporting documents** that you could consider attaching to your application</th>
                                         </tr>
                                         <tr>
                                             <td class="border head-table">Started a course in
                              <%=country_intent_tostudy %>
                              but did not complete it
                                             </td>
                                             <td class="border head-table second">Medium
                                             </td>
                                             <td class="border">1. Provide an explanation for why you were unable to complete your previous studies; AND, 2. Reassure the decision-maker that you have every intention, and will do everything in your power, to ensure that you successfully complete your future studies in
                              <%=country_intent_tostudy %></td>
                                             <td class="border">Attach any documentary evidence that supports your explanation about why you were unable to complete your previous studies.</td>
                                         </tr>
                                     </table>
                                 </div>

                                 <br>
                             </div>
                             <div id="page24_tab3" runat="server" style="display: none;">
                                 <div class="table-responsive">
                                     <table class="table">
                                         <tr>
                                             <th class="head-table wid">Risk factor
                                             </th>
                                             <th class="head-table">Severity of Risk
                                             </th>
                                             <th class="head-table wd">How you could address the risk factor in your Australia - Statement of purpose (SOP)</th>
                                             <th>Possible supporting documents** that you could consider attaching to your application</th>
                                         </tr>
                                         <tr>
                                             <td class="border head-table">Course level applied is significantly lower than previous study
                                             </td>
                                             <td class="border head-table first">High
                                             </td>
                                             <td class="border">Provide an explanation for why you are choosing to pursue studies in
                              <%=country_intent_tostudy %>
                              that are at a level that is significantly lower than your previous highest education levels</td>
                                             <td class="border">Attach any documentary evidence that supports your explanation about why you are choosing to pursue studies in
                              <%=country_intent_tostudy %>
                              that are at a level that is significantly lower than your previous highest </td>
                                         </tr>
                                     </table>
                                 </div>

                                 <br>
                             </div>
                             <div id="page24_tab4" runat="server" style="display: none;">
                                 <div class="table-responsive">
                                     <table class="table">
                                         <tr>
                                             <th class="head-table wid">Risk factor
                                             </th>
                                             <th class="head-table">Severity of Risk
                                             </th>
                                             <th class="head-table wd">How you could address the risk factor in your Australia - Statement of purpose (SOP)</th>
                                             <th>Possible supporting documents** that you could consider attaching to your application</th>
                                         </tr>
                                         <tr>
                                             <td class="border head-table">Course level applied is lower than previous study
                                             </td>
                                             <td class="border head-table second">Medium
                                             </td>
                                             <td class="border">Provide an explanation for why you are choosing to pursue studies in
                              <%=country_intent_tostudy %>
                              that are at a level that is lower than your previous highest education levels.</td>
                                             <td class="border">Attach any documentary evidence that supports your explanation about why you are choosing to pursue studies in
                              <%=country_intent_tostudy %>
                              that are at a level that is lower than your previous highest education   </td>
                                         </tr>
                                     </table>
                                 </div>

                                 <br>
                             </div>
                             <div id="page24_tab5" runat="server" style="display: none;">
                                 <div class="table-responsive">
                                     <table class="table">
                                         <tr>
                                             <th class="head-table wid">Risk factor
                                             </th>
                                             <th class="head-table">Severity of Risk
                                             </th>
                                             <th class="head-table wd">How you could address the risk factor in your Australia - Statement of purpose (SOP)</th>
                                             <th>Possible supporting documents** that you could consider attaching to your application</th>
                                         </tr>
                                         <tr>
                                             <td class="border head-table">Course level applied is equal to level of previous study
                                             </td>
                                             <td class="border head-table third">Low
                                             </td>
                                             <td class="border">Provide an explanation for why you are choosing to pursue studies in
                              <%=country_intent_tostudy %>
                              that is at the same level than your previous highest education levels.</td>
                                             <td class="border">Attach any documentary evidence that supports your explanation about why you are choosing to pursue studies in
                              <%=country_intent_tostudy %>
                              that are at the same level than your previous highest education qualifications. </td>
                                         </tr>
                                     </table>
                                 </div>

                                 <br>
                             </div>
                             <div id="page24_tab6" runat="server" style="display: none;">
                                 <div class="table-responsive">
                                     <table class="table">
                                         <tr>
                                             <th class="head-table wid">Risk factor
                                             </th>
                                             <th class="head-table">Severity of Risk
                                             </th>
                                             <th class="head-table wd">How you could address the risk factor in your Australia - Statement of purpose (SOP)</th>
                                             <th>Possible supporting documents** that you could consider attaching to your application</th>
                                         </tr>
                                         <tr>
                                             <td class="border head-table">Broad field of study different from previous study
                                             </td>
                                             <td class="border head-table second">Medium
                                             </td>
                                             <td class="border">Provide an explanation for why you have decided to change your broad field of study.</td>
                                             <td class="border">Attach any documentary evidence that supports your explanation about why you have decided to change your broad field of study.  </td>
                                         </tr>
                                     </table>
                                 </div>

                                 <br>
                             </div>
                             <div id="page24_tab7" runat="server" style="display: none;">
                                 <div class="table-responsive">
                                     <table class="table">
                                         <tr>
                                             <th class="head-table wid">Risk factor
                                             </th>
                                             <th class="head-table">Severity of Risk
                                             </th>
                                             <th class="head-table wd">How you could address the risk factor in your Australia - Statement of purpose (SOP)</th>
                                             <th>Possible supporting documents** that you could consider attaching to your application</th>
                                         </tr>
                                         <tr>
                                             <td class="border head-table">Narrow field of study different from previous study
                                             </td>
                                             <td class="border head-table third">Low
                                             </td>
                                             <td class="border">Provide an explanation for why you have decided to change your narrow field of study.</td>
                                             <td class="border">Attach any documentary evidence that supports your explanation about why you have decided to change your narrow field of study.  </td>
                                         </tr>
                                     </table>
                                 </div>

                                 <br>
                             </div>
                             <div id="page24_tab8" runat="server" style="display: none;">
                                 <div class="table-responsive">
                                     <table class="table">
                                         <tr>
                                             <th class="head-table wid">Risk factor
                                             </th>
                                             <th class="head-table">Severity of Risk
                                             </th>
                                             <th class="head-table wd">How you could address the risk factor in your Australia - Statement of purpose (SOP)</th>
                                             <th>Possible supporting documents** that you could consider attaching to your application</th>
                                         </tr>
                                         <tr>
                                             <td class="border head-table">Started a course but did not complete it
                                             </td>
                                             <td class="border head-table third">Low
                                             </td>
                                             <td class="border">1. Provide an explanation for why you were unable to complete your previous studies; AND, 2. Reassure the decision-maker that you have every intention, and will do everything in your power, to ensure that you successfully complete your future studies in
                              <%=country_intent_tostudy %></td>
                                             <td class="border">Attach any documentary evidence that supports your explanation about why you were unable to complete your previous studies.  </td>
                                         </tr>
                                     </table>
                                 </div>

                             </div>
                         </div>
                     </td>
                 </tr>


             </table>
         </div>
         <div id="page24" runat="server" class="certificate-wrpr" >
         
         <table class="certificate-table" cellspacing="0" cellpadding="0">
         
           
            <tr>
               <td>
                  <div class="container">
                      <div id="page25_tab1" runat="server" style="display: none;">
                              <div class="table-responsive">
                             <table class="table">
                                 <tr>
                                          <th class="head-table wid">
                                         Risk factor
                                     </th>
                                        <th class="head-table">
                                         Severity of Risk
                                     </th>
                                        <th class="head-table wd">How you could address the risk factor in your Australia - Statement of purpose (SOP)</th>
                                     <th>Possible supporting documents** that you could consider attaching to your application</th>
                                 </tr>
                                 <tr>
                                    <td class="border head-table">
                                     Previous suspensions or expulsions from education institutions
                                     </td>
                                    <td class="border head-table second">
                                         Medium
                                     </td>
                                     <td class="border"> 1. Provide an explanation for why you were suspended or expelled from your previous studies; AND, 2. Reassure the decision-maker that your future behaviour should not be a cause for concern if they decide to study at
                           <%=universityname %></td>
                                     <td class="border"> Attach any documentary evidence that supports your explanation about why they should not be concerned about your future behaviour, if they decide to grant your admission to study at
                           <%=universityname %>  </td>
                                 </tr>
                             </table>
                         </div>
                     
                         <br>
                      </div>
                      <div id="page25_tab2" runat="server" style="display: none;">
                         <div class="table-responsive">
                             <table class="table">
                                 <tr>
                                      <th class="head-table wid">
                                         Risk factor
                                     </th>
                                       <th class="head-table">
                                         Severity of Risk
                                     </th>
                                     <th class="head-table wd">How you could address the risk factor in your Australia - Statement of purpose (SOP)</th>
                                     <th>Possible supporting documents** that you could consider attaching to your application</th>
                                 </tr>
                                 <tr>
                                    <td class="border head-table">
                                     Needing multiple attempts to pass subjects, units and courses
                                     </td>
                                    <td class="border head-table third">
                                         Low
                                     </td>
                                     <td class="border">1. Provide an explanation for why you were previously unable to pass your subjects, units or courses at the first attempt; AND, 2. Reassure the decision-maker about your ability to complete your future studies within the prescribed duration of the course(s).</td>
                                    <td class="border">Attach any documentary evidence that supports your explanation about why you were previously unable to pass your subjects, units or courses at the first attempt. </td>
                                 </tr>
                             </table>
                         </div>
                   
                         <br></div>
                      <div id="page25_tab2_1" runat="server" style="display: none;">
                        <div class="table-responsive">
                             <table class="table">
                                 <tr>
                                       <th class="head-table wid">
                                         Risk factor
                                     </th>
                                      <th class="head-table">
                                         Severity of Risk
                                     </th>
                                      <th class="head-table wd">How you could address the risk factor in your Australia - Statement of purpose (SOP)</th>
                                     <th>Possible supporting documents** that you could consider attaching to your application</th>
                                 </tr>
                                 <tr>
                                        <td class="border head-table">
                                     Track record of not attending classes
                                     </td>
                                      <td class="border head-table third">
                                         Low
                                     </td>
                                      <td class="border">1. Provide an explanation for why you were previously unable to diligently attend your classes; AND, 2. Reassure the decision-maker about your ability to attend all your classes at <%=universityname %> if you are admitted into the course that you have applied for.</td>
                                     
                                     <td class="border">Attach any documentary evidence that supports your explanation about why you were previously unable to attend your classes.  </td>
                                 </tr>
                             </table>
                         </div>
                   
                         <br></div>
                      <div id="page25_tab3" runat="server" style="display: none;">
                      <div class="table-responsive">
                             <table class="table">
                                 <tr>
                                      <th class="head-table wid">
                                         Risk factor
                                     </th>
                                        <th class="head-table">
                                         Severity of Risk
                                     </th>
                                        <th class="head-table wd">How you could address the risk factor in your Australia - Statement of purpose (SOP)</th>
                                     <th>Possible supporting documents** that you could consider attaching to your application</th>
                                 </tr>
                                 <tr>
                                         <td class="border head-table">
                                    Enrolled but not studying
                                     </td>
                                      <td class="border head-table third">
                                         Low
                                     </td>
                                      <td class="border"> 1. Provide an explanation for why you were previously enrolled in a course but was not studying; AND, 2.  Reassure the decision-maker that you will take your study commitments at
                           <%=universityname %></td>
                                     
                                     <td class="border">Attach any documentary evidence that supports your explanation about why you were previously enrolled in a course but was not studying.  </td>
                                 </tr>
                             </table>
                         </div>
                     
                         <br></div>
                      <div id="page25_tab4" runat="server" style="display: none;">
                         <div class="table-responsive">
                             <table class="table">
                                 <tr>
                                     <th class="head-table wid">
                                         Risk factor
                                     </th>
                                     <th class="head-table">
                                         Severity of Risk
                                     </th>
                                      <th class="head-table wd">How you could address the risk factor in your Australia - Statement of purpose (SOP)</th>
                                     <th>Possible supporting documents** that you could consider attaching to your application</th>
                                 </tr>
                                 <tr>
                                         <td class="border head-table">
                                  Previous deferral requests for reasons that were not true
                                     </td>
                                   <td class="border head-table third">
                                         Low
                                     </td>
                                    <td class="border">1. Provide an explanation for why you were previously enrolled in a course but was not studying; AND, 2.  Reassure the decision-maker that you will take your study commitments at
                           <%=universityname %>
                           seriously, if you are admitted into the course that you have applied for.</td>
                                     
                                    <td class="border">Attach any documentary evidence that supports your explanation about why you were previously enrolled in a course but was not studying. </td>
                                 </tr>
                             </table>
                         </div>
                   
                         <br></div>
                      <div id="page25_tab5" runat="server" style="display: none;">
                     <div class="table-responsive">
                             <table class="table">
                                 <tr>
                                       <th class="head-table wid">
                                         Risk factor
                                     </th>
                                       <th class="head-table">
                                         Severity of Risk
                                     </th>
                                    <th class="head-table wd">How you could address the risk factor in your Australia - Statement of purpose (SOP)</th>
                                     <th>Possible supporting documents** that you could consider attaching to your application</th>
                                 </tr>
                                 <tr>
                                     <td class="border head-table">
                                 Primary reason to study course is "cheapest cost possible"
                                     </td>
                                    <td class="border head-table first">
                                         high
                                     </td>
                                       <td class="border"> 1. Reassure the decision-maker that once you have made your decision on what to study, you will not keep looking for the next bargain; AND, 2. Address any concerns that the decision-maker might have regarding you using the student visa simply to find a cheap way of staying in
                           <%=country_intent_tostudy %>
                           seriously, if you are admitted into the course that you have applied for.</td>
                                     
                                      <td class="border">Attach any documentary evidence that supports your "cheapest cost possible" explanations you have provided in your Statement of Purpose (SOP). </td>
                                 </tr>
                             </table>
                         </div>
                   
                         
                     <p class="note"># Remember that if the decision-maker suspects that your intentions are for any outcomes other than study outcomes, he or she is likely to reject your application on the basis of them suspecting you to be a non-genuine student and a non-genuine temporary entrant.</p>
                     <br/></div>
                      <div id="page25_tab6" runat="server" style="display: none;">
                     <div class="table-responsive">
                             <table class="table">
                                 <tr>
                                     <th class="head-table wid">
                                         Risk factor
                                     </th>
                                      <th class="head-table">
                                         Severity of Risk
                                     </th>
                                      <th class="head-table wd">How you could address the risk factor in your Australia - Statement of purpose (SOP)</th>
                                     <th>Possible supporting documents** that you could consider attaching to your application</th>
                                 </tr>
                                 <tr>
                                     <td class="border head-table">
                                 Primary reason to study course is "increase my chances of migrating to
                           <%=country_intent_tostudy %>
                           "
                                     </td>
                                     <td class="border head-table second">
                                         Medium
                                     </td>
                                    <td class="border"> Reassure the decision-maker that you genuinely intend to study in
                           <%=country_intent_tostudy %>
                           and that you are not using the student visa simply as a means of getting a migration outcome.#</td>
                                     
                                      <td class="border">Attach any documentary evidence that supports your explanation about your genuine study intentions. </td>
                                 </tr>
                             </table>
                         </div>
                   
                     <p class="note"># Remember that if the decision-maker suspects that your intentions are for any outcomes other than study outcomes, he or she is likely to reject your application on the basis of them suspecting you to be a non-genuine student and a non-genuine temporary entrant.</p>
                     <br/></div>
                      <div id="page25_tab7" runat="server" style="display: none;">
                      <div class="table-responsive">
                             <table class="table">
                                 <tr>
                                   <th class="head-table wid">
                                         Risk factor
                                     </th>
                                     <th class="head-table">
                                         Severity of Risk
                                     </th>
                                      <th class="head-table wd">How you could address the risk factor in your Australia - Statement of purpose (SOP)</th>
                                     <th>Possible supporting documents** that you could consider attaching to your application</th>
                                 </tr>
                                 <tr>
                                     <td class="border head-table">
                                Primary reason to study course is "will help me secure a permanent job in  
                           <%=country_intent_tostudy %>
                           after completion of my studies"
                                     </td>
                                     <td class="border head-table third">
                                         Low
                                     </td>
                                    <td class="border">Reassure the decision-maker that you genuinely intend to study in
                           <%=country_intent_tostudy %>
                           and that you are not using the student visa simply as a means of getting a migration outcome.#</td>
                                     
                                    <td class="border">Attach any documentary evidence that supports your explanation about your genuine study intentions. </td>
                                 </tr>
                             </table>
                         </div>
                   
                     <p class="note"># Remember that if the decision-maker suspects that your intentions are for any outcomes other than study outcomes, he or she is likely to reject your application on the basis of them suspecting you to be a non-genuine student and a non-genuine temporary entrant.</p>
                     <br/></div>
                      <div id="page25_tab8" runat="server" style="display: none;">
                             <div class="table-responsive">
                             <table class="table">
                                 <tr>
                                     <th class="head-table wid">
                                         Risk factor
                                     </th>
                                   <th class="head-table">
                                         Severity of Risk
                                     </th>
                                    <th class="head-table wd">How you could address the risk factor in your
                            <%=country_intent_tostudy %> - Statement of purpose (SOP)</th>
                                     <th>Possible supporting documents** that you could consider attaching to your application</th>
                                 </tr>
                                 <tr>
                                      <td class="border head-table">
                                Primary reason to study course is "will help me secure a permanent job in  
                           <%=country_intent_tostudy %>
                           after completion of my studies"
                                     </td>
                                      <td class="border head-table first">
                                         High
                                     </td>
                                       <td class="border"> Address any concerns that the decision-maker might have regarding you using the student visa simply to find a cheap way of staying in
                           <%=country_intent_tostudy %>
                           .#</td>
                                     
                                     <td class="border">Attach any documentary evidence that supports your decision to study such a short (duration) course. </td>
                                 </tr>
                             </table>
                         </div>
                     
                   
                     <p class="note"># Remember that if the decision-maker suspects that your intentions are for any outcomes other than study outcomes, he or she is likely to reject your application on the basis of them suspecting you to be a non-genuine student and a non-genuine temporary entrant.</p>
                     <br/></div>
                      <div id="page25_tab9" runat="server" style="display: none;">
                         <div class="table-responsive">
                             <table class="table">
                                 <tr>
                                      <th class="head-table wid">
                                         Risk factor
                                     </th>
                                     <th class="head-table">
                                         Severity of Risk
                                     </th>
                                     <th class="head-table wd">How you could address the risk factor in your
                            <%=country_intent_tostudy %> - Statement of purpose (SOP)</th>
                                     <th>Possible supporting documents** that you could consider attaching to your application</th>
                                 </tr>
                                 <tr>
                                     <td class="border head-table">
                                Duration of study is "between 6 to 12 months
                                     </td>
                                      <td class="border head-table second">
                                         Medium
                                     </td>
                                     <td class="border">Address any concerns that the decision-maker might have regarding you using the student visa simply to find a cheap way of staying in
                           <%=country_intent_tostudy %>
                           .#</td>
                                     
                                     <td class="border">Attach any documentary evidence that supports your decision to study a short (duration) course. </td>
                                 </tr>
                             </table>
                         </div>
                   
                     <p class="note"># Remember that if the decision-maker suspects that your intentions are for any outcomes other than study outcomes, he or she is likely to reject your application on the basis of them suspecting you to be a non-genuine student and a non-genuine temporary entrant.</p>
                     <br/></div>
                      <div id="page25_tab10" runat="server" style="display: none;">
                      <div class="table-responsive">
                             <table class="table">
                                 <tr>
                                     <th class="head-table wid">
                                         Risk factor
                                     </th>
                                      <th class="head-table">
                                         Severity of Risk
                                     </th>
                                    <th class="head-table wd">How you could address the risk factor in your
                            <%=country_intent_tostudy %> - Statement of purpose (SOP)</th>
                                     <th>Possible supporting documents** that you could consider attaching to your application</th>
                                 </tr>
                                 <tr>
                                        <td class="border head-table">
                               Duration of study is "between 13-18 months"
                                     </td>
                                    <td class="border head-table third">
                                         Low
                                     </td>
                                    <td class="border"> Address any concerns that the decision-maker might have regarding you using the student visa simply to find a cheap way of staying in
                           <%=country_intent_tostudy %>
                           .#</td>
                                     
                                    <td class="border">Attach any documentary evidence that supports your decision to study a relatively short (duration) course. </td>
                                 </tr>
                             </table>
                         </div>
                   
                     <p class="note"># Remember that if the decision-maker suspects that your intentions are for any outcomes other than study outcomes, he or she is likely to reject your application on the basis of them suspecting you to be a non-genuine student and a non-genuine temporary entrant.</p>
                     <br/></div>
                      <div id="page25_tab11" runat="server" style="display: none;">
                     <div class="table-responsive">
                             <table class="table">
                                 <tr>
                                    <th class="head-table wid">
                                         Risk factor
                                     </th>
                                      <th class="head-table">
                                         Severity of Risk
                                     </th>
                                     <th class="head-table wd">How you could address the risk factor in your
                            <%=country_intent_tostudy %> - Statement of purpose (SOP)</th>
                                     <th>Possible supporting documents** that you could consider attaching to your application</th>
                                 </tr>
                                 <tr>
                                      <td class="border head-table">
                              Stated value of the course to your future is "explore options to continue to stay and work in
                           <%=country_intent_tostudy %>
                           "
                                     </td>
                                    <td class="border head-table first">
                                         High
                                     </td>
                                     <td class="border">Remember that the student visa is a conditional authorisation that grants you permission to enter a country for a specified period of time for the purposes of study. Therefore, if you are applying for visa with motives other than study, you could be considered ineligible for the student visa.</td>
                                     
                                    <td class="border">Attach any documentary evidence that supports your explanation about studybeing your motivation for applying for the student visa.</td>
                                 </tr>
                             </table>
                         </div>
                   
                     <p class="note"># Remember that if the decision-maker suspects that your intentions are for any outcomes other than study outcomes, he or she is likely to reject your application on the basis of them suspecting you to be a non-genuine student and a non-genuine temporary entrant.</p>
                     <br/></div>
                      <div id="page25_tab12" runat="server" style="display: none;">
                      <div class="table-responsive">
                             <table class="table">
                                 <tr>
                                      <th class="head-table wid">
                                         Risk factor
                                     </th>
                                     <th class="head-table">
                                         Severity of Risk
                                     </th>
                                     <th class="head-table wd">How you could address the risk factor in your
                            <%=country_intent_tostudy %> - Statement of purpose (SOP)</th>
                                     <th>Possible supporting documents** that you could consider attaching to your application</th>
                                 </tr>
                                 <tr>
                                     <td class="border head-table">
                             Stated value of the course to your future is to ultimately "apply for other visas to continue to stay in
                           <%=country_intent_tostudy %>
                           " permanently
                                     </td>
                                    <td class="border head-table second">
                                         Medium
                                     </td>
                                    <td class="border">Remember that the student visa is a conditional authorisation that grants you permission to enter a country for a specified period of time for the purposes of study. Therefore, if you are applying for visa with motives other than study, you could be considered ineligible for the student visa.</td>
                                     
                                     <td class="border">Attach any documentary evidence that supports your explanation about studybeing your motivation for applying for the student visa.</td>
                                 </tr>
                             </table>
                         </div>
                   
                     <p class="note"># Remember that if the decision-maker suspects that your intentions are for any outcomes other than study outcomes, he or she is likely to reject your application on the basis of them suspecting you to be a non-genuine student and a non-genuine temporary entrant.</p>
                     <br/></div>
                      <div id="page25_tab13" runat="server" style="display: none;">
                      <div class="table-responsive">
                             <table class="table">
                                 <tr>
                                      <th class="head-table wid">
                                         Risk factor
                                     </th>
                                    <th class="head-table">
                                         Severity of Risk
                                     </th>
                                       <th class="head-table wd">How you could address the risk factor in your
                            <%=country_intent_tostudy %> - Statement of purpose (SOP)</th>
                                     <th>Possible supporting documents** that you could consider attaching to your application</th>
                                 </tr>
                                 <tr>
                                       <td class="border head-table">
                             Stated primary reason for wanting to study in
                           <%=country_intent_tostudy %>
                           is "to secure Permanent Residency"
                                     </td>
                                     <td class="border head-table second">
                                         High
                                     </td>
                                     <td class="border">Remember that the student visa is a conditional authorisation that grants you permission to enter a country for a specified period of time for the purposes of study. Therefore, if you are applying for visa with motives other than study, you could be considered ineligible for the student visa.</td>
                                     
                                    <td class="border">Attach any documentary evidence that supports your explanation about studybeing your motivation for applying for the student visa.</td>
                                 </tr>
                             </table>
                         </div>
                 
                     <p class="note"># Remember that if the decision-maker suspects that your intentions are for any outcomes other than study outcomes, he or she is likely to reject your application on the basis of them suspecting you to be a non-genuine student and a non-genuine temporary entrant.</p>
                     <br/></div>
                      <div id="page25_tab14" runat="server" style="display: none;">
                         <div class="table-responsive">
                             <table class="table">
                                 <tr>
                                      <th class="head-table wid">
                                         Risk factor
                                     </th>
                                       <th class="head-table">
                                         Severity of Risk
                                     </th>
                                      <th class="head-table wd"> How you could address the risk factor in your
                            <%=country_intent_tostudy %> - Statement of purpose (SOP)</th>
                                     <th>Possible supporting documents** that you could consider attaching to your application</th>
                                 </tr>
                                 <tr>
                                  <td class="border head-table">
                           English language competency is "not very good"
                                     </td>
                                    <td class="border head-table second">
                                         Low
                                     </td>
                                   <td class="border"> Provide an explanation for how you intend to improve your English language proficiency  so that you can be successful in your studies, and can integrate well into society in
                           <%=country_intent_tostudy %></td>
                                     
                                     <td class="border">Attach any documentary evidence that supports your explanation about what steps you are taking to improve your English language competency.</td>
                                 </tr>
                             </table>
                         </div>
                   
                     <br/></div>
                      <div id="page25_tab15" runat="server" style="display: none;">
                           <div class="table-responsive">
                             <table class="table">
                                 <tr>
                                    <th class="head-table wid">
                                         Risk factor
                                     </th>
                                     <th class="head-table">
                                         Severity of Risk
                                     </th>
                                     <th class="head-table wd">How you could address the risk factor in your
                            <%=country_intent_tostudy %> - Statement of purpose (SOP)</th>
                                     <th>Possible supporting documents** that you could consider attaching to your application</th>
                                 </tr>
                                 <tr>
                                    <td class="border head-table">
                          Stated intention after completion of your studies is "I intend to look for full time employment opportunities in
                           <%=country_intent_tostudy %>
                           "
                                     </td>
                                     <td class="border head-table second">
                                         Medium
                                     </td>
                                     <td class="border">Address any concerns that the decision-maker might have regarding you using the student visa simply to be able to live and work in
                           <%=country_intent_tostudy %>
                           permanently.#</td>
                                     
                           <td class="border"> Attach any documentary evidence that supports your explanation about why the study outcomes are the reason why you have decided to study in
                           <%=country_intent_tostudy %></td>
                                 </tr>
                             </table>
                         </div>
                   
                     <p class="note"># Remember that if the decision-maker suspects that your intentions are for any outcomes other than study outcomes, he or she is likely to reject your application on the basis of them suspecting you to be a non-genuine student and a non-genuine temporary entrant.</p>
                     <br/></div>
                      <div id="page25_tab16" runat="server" style="display: none;">
                     <div class="table-responsive">
                             <table class="table">
                                 <tr>
                                    <th class="head-table wid">
                                         Risk factor
                                     </th>
                                     <th class="head-table">
                                         Severity of Risk
                                     </th>
                                     <th class="head-table wd">How you could address the risk factor in your
                            <%=country_intent_tostudy %> - Statement of purpose (SOP)</th>
                                     <th>Possible supporting documents** that you could consider attaching to your application</th>
                                 </tr>
                                 <tr>
                                    <td class="border head-table">
                          Less than 1 year of full-time work experience
                                     </td>
                                     <td class="border head-table third">
                                         Low
                                     </td>
                                     <td class="border"> Provide an explanation for why you have decided to pursue further study now instead of continuing to gain work experience.</td>
                                     
                                     <td class="border"> Wherever possible, attach any documentary evidence that supports your explanation about why you have decided to pursue further study now instead of continuing to gain work experience.</td>
                                 </tr>
                             </table>
                         </div>
                   
                     <br/></div>
                      <div id="page25_tab17" runat="server" style="display: none;">
                    <div class="table-responsive">
                             <table class="table">
                                 <tr>
                                    <th class="head-table wid">
                                         Risk factor
                                     </th>
                                     <th class="head-table">
                                         Severity of Risk
                                     </th>
                                     <th class="head-table wd"> How you could address the risk factor in your
                            <%=country_intent_tostudy %> - Statement of purpose (SOP)</th>
                                     <th>Possible supporting documents** that you could consider attaching to your application</th>
                                 </tr>
                                 <tr>
                                    <td class="border head-table">
                          Stated reason for planning to study this course in
                           <%=country_intent_tostudy %>
                           rather than in
                           <%=Nationality%>
                           is "my chances of migrating to Australia and securing a Permanent Residency visa will improve"
                                     </td>
                                     <td class="border head-table second">
                                         Medium
                                     </td>
                                     <td class="border"> Address any concerns that the decision-maker might have about your intentions and motivations for deciding to study in Australia and re-assure him/her that your study intentions are genuine#.</td>
                                     
                                     <td class="border"> Attach any documentary evidence that supports your explanation about why your study intentions are genuine.</td>
                                 </tr>
                             </table>
                         </div>
                   
                     <p class="note"># Remember that if the decision-maker suspects that your intentions are for any outcomes other than study outcomes, he or she is likely to reject your application on the basis of them suspecting you to be a non-genuine student and a non-genuine temporary entrant.</p>
                     <br/></div>
                      <div id="page25_tab18" runat="server" style="display: none;">
                        <div class="table-responsive">
                             <table class="table">
                                 <tr>
                                    <th class="head-table wid">
                                         Risk factor
                                     </th>
                                     <th class="head-table">
                                         Severity of Risk
                                     </th>
                                     <th class="head-table wd"> How you could address the risk factor in your
                            <%=country_intent_tostudy %> - Statement of purpose (SOP)</th>
                                     <th>Possible supporting documents** that you could consider attaching to your application</th>
                                 </tr>
                                 <tr>
                                    <td class="border head-table">
               Stated reason for planning to study this course in
                           <%=country_intent_tostudy %>
                           rather than in
                           <%=Nationality%>
                           is "these types of courses in
                           <%=Nationality%>
                           are not relevant to current industry demands"
                                     </td>
                                     <td class="border head-table third">
                                         Low
                                     </td>
                                     <td class="border"> Provide an explanation for why you are choosing to study this course even though there may be limited job opportunities for you when you return to your home country after you complete your studies in
                           <%=country_intent_tostudy %></td>
                                     
                           <td class="border"> Attach any documentary evidence that supports your explanation about why you are choosing to study this course even though there may be limited job opportunities for you when you return to your home country after you complete your studies in
                           <%=country_intent_tostudy %></td>
                                 </tr>
                             </table>
                         </div>
                 
                     <br/></div>
                      <div id="page25_tab19" runat="server" style="display: none;">
                         <div class="table-responsive">
                             <table class="table">
                                 <tr>
                                    <th class="head-table wid">
                                         Risk factor
                                     </th>
                                     <th class="head-table">
                                         Severity of Risk
                                     </th>
                                     <th class="head-table wd"> How you could address the risk factor in your
                            <%=country_intent_tostudy %> - Statement of purpose (SOP)</th>
                                     <th>Possible supporting documents** that you could consider attaching to your application</th>
                                 </tr>
                                 <tr>
                                    <td class="border head-table">
               Stated reason for planning to study this course in
                           <%=country_intent_tostudy %>
                           rather than in
                           <%=Nationality%>
                           is "I have family / friends already studying / living in
                           <%=country_intent_tostudy %>
                           ":
                                     </td>
                                     <td class="border head-table third">
                                         Low
                                     </td>
                                     <td class="border"> Provide details about the family or friends that you have in
                           <%=country_intent_tostudy %>
                           . Details such as their names, city that they live in, their relationship to you, and their citizenship and/or visa status in
                           <%=country_intent_tostudy %></td>
                                     
                           <td class="border"> Attach any "Proof of address" documents, or "Reference Letters" from the relevant family and friends as evidence that supports your declaration of having family and/or friends in
                           <%=country_intent_tostudy %></td>
                                 </tr>
                             </table>
                         </div>
                   
                     <br/></div>
                      <div id="page25_tab20" runat="server" style="display: none;">
                       <div class="table-responsive">
                             <table class="table">
                                 <tr>
                                    <th class="head-table wid">
                                         Risk factor
                                     </th>
                                     <th class="head-table">
                                         Severity of Risk
                                     </th>
                                     <th class="head-table wd">How you could address the risk factor in your
                            <%=country_intent_tostudy %> - Statement of purpose (SOP)</th>
                                     <th>Possible supporting documents** that you could consider attaching to your application</th>
                                 </tr>
                                 <tr>
                                    <td class="border head-table">
                Parents, brothers and sisters are mostly based in countries other than
                           <%=Nationality%>
                                     </td>
                                     <td class="border head-table first">
                                         High
                                     </td>
                                     <td class="border">  1. Provide details of your parents, brothers and/or sisters and where they live; AND 2. Provide an explanation for why you have decided to study in
                           <%=country_intent_tostudy %>
                           instead of studying in the country/countries where your parents, brothers and sisters live.</td>
                                     
                           <td class="border">Attach any documentary evidence that supports the information and explanation that you have provided in your
                            <%=country_intent_tostudy %> - Statement of purpose (SOP)
                           .</td>
                                 </tr>
                             </table>
                         </div>
                 
                     <br/></div>
                      <div id="page25_tab21" runat="server" style="display: none;">
                      <div class="table-responsive">
                             <table class="table">
                                 <tr>
                                    <th class="head-table wid">
                                         Risk factor
                                     </th>
                                     <th class="head-table">
                                         Severity of Risk
                                     </th>
                                     <th class="head-table wd"> How you could address the risk factor in your
                            <%=country_intent_tostudy %> - Statement of purpose (SOP)</th>
                                     <th>Possible supporting documents** that you could consider attaching to your application</th>
                                 </tr>
                                 <tr>
                                    <td class="border head-table">
               Your parents, brothers and sisters are not alive. You do not have any living parents, brothers or sisters
                                     </td>
                                     <td class="border head-table first">
                                         High
                                     </td>
                                     <td class="border">   Address any concerns that the decision-maker might have about a perceived lack of incentive for you to return to your home country after your studies in
                           <%=country_intent_tostudy %>
                           due to the fact that you do not have close family in your home country.</td>
                                     
                           <td class="border">Attach any documentary evidence that supports your explanation about why you still have significant ties to your home country that will be an incentive for yu to return there after you complete your studies in
                           <%=country_intent_tostudy %>
                           .</td>
                                 </tr>
                             </table>
                         </div>
                     
                    </div> <br>
                      <div id="page25_tab22" runat="server" style="display: none;">
                     <div class="table-responsive">
                             <table class="table">
                                 <tr>
                                    <th class="head-table wid">
                                         Risk factor
                                     </th>
                                     <th class="head-table">
                                         Severity of Risk
                                     </th>
                                     <th class="head-table wd"> How you could address the risk factor in your
                            <%=country_intent_tostudy %> - Statement of purpose (SOP)</th>
                                     <th>Possible supporting documents** that you could consider attaching to your application</th>
                                 </tr>
                                 <tr>
                                    <td class="border head-table">
              Parents, brothers and sisters are mainly based in other countries around the world, and one or two are based in
                           <%=Nationality%>
                                     </td>
                                     <td class="border head-table second">
                                         Medium
                                     </td>
                                     <td class="border"> 1. Provide details of your parents, brothers and/or sisters and where they live; AND 2. Provide an explanation for why you have decided to study in
                           <%=country_intent_tostudy %>
                           instead of studying in the country/countries where your parents, brothers and sisters live.</td>
                                     
                           <td class="border"> Attach any documentary evidence that supports the information and explanation that you have provided in your
                            <%=country_intent_tostudy %> - Statement of purpose (SOP)
                           .</td>
                                 </tr>
                             </table>
                         </div>
                   
                     <br/></div>
                      <div id="page25_tab23" runat="server" style="display: none;">
                        <div class="table-responsive">
                             <table class="table">
                                 <tr>
                                    <th class="head-table wid">
                                         Risk factor
                                     </th>
                                     <th class="head-table">
                                         Severity of Risk
                                     </th>
                                     <th class="head-table wd"> How you could address the risk factor in your
                            <%=country_intent_tostudy %> - Statement of purpose (SOP)</th>
                                     <th>Possible supporting documents** that you could consider attaching to your application</th>
                                 </tr>
                                 <tr>
                                    <td class="border head-table">
              Your parents, brothers and sisters are mainly based in
                           <%=Nationality%>
                           , and one or two live in other countries around the world
                                     </td>
                                     <td class="border head-table third">
                                         Low
                                     </td>
                                     <td class="border">    1. Provide details of your parents, brothers and/or sisters who live outside of
                           <%=Nationality%>
                           ; AND 2. Provide an explanation for why you have decided to study in
                           <%=country_intent_tostudy %>
                           instead of studying in the country/countries where your parents, brothers and sisters live.</td>
                                     
                           <td class="border"> Attach any documentary evidence that supports the information and explanation that you have provided in your
                            <%=country_intent_tostudy %> - Statement of purpose (SOP)
                           .</td>
                                 </tr>
                             </table>
                         </div>
                     
                    </div> <br>
                      <div id="page25_tab24" runat="server" style="display: none;">
                    <div class="table-responsive">
                             <table class="table">
                                 <tr>
                                    <th class="head-table wid">
                                         Risk factor
                                     </th>
                                     <th class="head-table">
                                         Severity of Risk
                                     </th>
                                     <th class="head-table wd">How you could address the risk factor in your
                            <%=country_intent_tostudy %> - Statement of purpose (SOP)</th>
                                     <th>Possible supporting documents** that you could consider attaching to your application</th>
                                 </tr>
                                 <tr>
                                    <td class="border head-table">
              Your parents, brothers and sisters almost equally based in
                           <%=Nationality%>
                           and other countries around the world
                                     </td>
                                     <td class="border head-table third">
                                         Low
                                     </td>
                                     <td class="border">   1. Provide details of your parents, brothers and/or sisters who live outside of
                           <%=Nationality%>
                           ; AND 2. Provide an explanation for why you have decided to study in
                           <%=country_intent_tostudy %>
                           instead of studying in the country/countries where your parents, brothers and sisters live.</td>
                                     
                           <td class="border">  Attach any documentary evidence that supports the information and explanation that you have provided in your
                            <%=country_intent_tostudy %> - Statement of purpose (SOP)
                           .</td>
                                 </tr>
                             </table>
                         </div>
                   
                     <br/></div>
                      <div id="page25_tab25" runat="server" style="display: none;">
                     <div class="table-responsive">
                             <table class="table">
                                 <tr>
                                    <th class="head-table wid">
                                         Risk factor
                                     </th>
                                     <th class="head-table">
                                         Severity of Risk
                                     </th>
                                     <th class="head-table wd"> How you could address the risk factor in your
                            <%=country_intent_tostudy %> - Statement of purpose (SOP)</th>
                                     <th>Possible supporting documents** that you could consider attaching to your application</th>
                                 </tr>
                                 <tr>
                                    <td class="border head-table">
             The current market value of your family's fixed assets is less than USD 100,000
                                     </td>
                                     <td class="border head-table second">
                                         Medium
                                     </td>
                                     <td class="border">   Despite the absence of significant assets in your family, provide an explanation for: 1. How you will be able to fund your studies in
                           <%=country_intent_tostudy %>
                           ; AND, 2. Why the lack of assets will not be a disincentive for you to return to your home country after completion of your studies in
                           <%=country_intent_tostudy %></td>
                                     
                           <td class="border"> Attach any documentary evidence that supports the information and explanation that you have provided in your Statement Of Purpose (SOP)
                           .</td>
                                 </tr>
                             </table>
                         </div>
                 
                     <br/></div>
                      <div id="page25_tab26" runat="server" style="display: none;">
                         <div class="table-responsive">
                             <table class="table">
                                 <tr>
                                    <th class="head-table wid">
                                         Risk factor
                                     </th>
                                     <th class="head-table">
                                         Severity of Risk
                                     </th>
                                     <th class="head-table wd">How you could address the risk factor in your
                            <%=country_intent_tostudy %> - Statement of purpose (SOP)</th>
                                     <th>Possible supporting documents** that you could consider attaching to your application</th>
                                 </tr>
                                 <tr>
                                    <td class="border head-table">
            The current market value of your family's fixed assets valued  between USD 100,00 to USD 500,000
                                     </td>
                                     <td class="border head-table third">
                                         Low
                                     </td>
                                     <td class="border">  Despite the absence of large-value assets in your family, provide an explanation for: 1. How you will be able to fund your studies in
                           <%=country_intent_tostudy %>
                           ; AND, 2. Why the lack of assets will not be a disincentive for you to return to your home country after completion of your studies in
                           <%=country_intent_tostudy %></td>
                                     
                           <td class="border">Attach any documentary evidence that supports the information and explanation that you have provided in your Statement Of Purpose (SOP)
                           .</td>
                                 </tr>
                             </table>
                         </div>
                 
                     <br/></div>
                      <div id="page25_tab26_1" runat="server" style="display: none;">
                     <div class="table-responsive">
                             <table class="table">
                                 <tr>
                                    <th class="head-table wid">
                                         Risk factor
                                     </th>
                                     <th class="head-table">
                                         Severity of Risk
                                     </th>
                                     <th class="head-table wd"> How you could address the risk factor in your
                            <%=country_intent_tostudy %> - Statement of purpose (SOP)</th>
                                     <th>Possible supporting documents** that you could consider attaching to your application</th>
                                 </tr>
                                 <tr>
                                    <td class="border head-table">
             The source of funding for your tuition fees and living expenses will be partly funded by your family and you intend to fund the remaining through part-time work in
                           <%=country_intent_tostudy %>
                                     </td>
                                     <td class="border head-table second">
                                         Medium
                                     </td>
                                     <td class="border">  Provide details about how you will be able to fund your studies without financial distress to yourself or your family, even if you are not able to find part-time work in
                           <%=country_intent_tostudy %></td>
                                     
                           <td class="border">Attach any documentary evidence that supports your explanation about how you will be able to fund your studies without financial distress to yourself or your family, even if you are not able to find part-time work in
                           <%=country_intent_tostudy %>
                           .</td>
                                 </tr>
                             </table>
                         </div>
                   
                     <br/></div>
                      <div id="page25_tab27" runat="server" style="display: none;">
                       <div class="table-responsive">
                             <table class="table">
                                 <tr>
                                    <th class="head-table wid">
                                         Risk factor
                                     </th>
                                     <th class="head-table">
                                         Severity of Risk
                                     </th>
                                     <th class="head-table wd"> How you could address the risk factor in your
                            <%=country_intent_tostudy %> - Statement of purpose (SOP)</th>
                                     <th>Possible supporting documents** that you could consider attaching to your application</th>
                                 </tr>
                                 <tr>
                                    <td class="border head-table">
             The source of funding for your tuition fees and living expenses will be sponsored by an individual who is not your parent, spouse, brother or sister
                                     </td>
                                     <td class="border head-table second">
                                         Medium
                                     </td>
                                     <td class="border"> Provide: 1. Details of who your sponsor is; AND 2. Reassurance about the reliability of your sponsor, even though they are not a very close family member.</td>
                                     
                                     <td class="border"> Attach: 1. A letter from your sponsor confirming that he/she/they will sponsor your studies in
                           <%=country_intent_tostudy %>
                           and the total amount that they are committing to the sponsorship; AND 2. Any documentary evidence, such as bank statements or pay slips, that proves that your sponsor has the capacity to fund your studies without financial distress to himself/herself or his/her family.
                           .</td>
                                 </tr>
                             </table>
                         </div>
                   
                     <br/></div>
                      <div id="page25_tab28" runat="server" style="display: none;">
                       <div class="table-responsive">
                             <table class="table">
                                 <tr>
                                    <th class="head-table wid">
                                         Risk factor
                                     </th>
                                     <th class="head-table">
                                         Severity of Risk
                                     </th>
                                     <th class="head-table wd"> How you could address the risk factor in your
                            <%=country_intent_tostudy %> - Statement of purpose (SOP)</th>
                                     <th>Possible supporting documents** that you could consider attaching to your application</th>
                                 </tr>
                                 <tr>
                                    <td class="border head-table">
            The source of funding for your tuition fees and living expenses will be funded using a mix of your family's own funds and loans/scholarships
                                     </td>
                                     <td class="border head-table third">
                                         Low
                                     </td>
                                     <td class="border"> Provide: 1. Details of who your sponsors are; AND 2. Reassurance about the reliability of your sponsors/sources of funds.</td>
                                     
                                     <td class="border"> Attach: 1. A letter from each of your your sponsors confirming that they will each sponsor your studies in
                           <%=country_intent_tostudy %>
                           and the total amount that they are committing to the sponsorship; AND 2. Any documentary evidence, such as bank statements, pay slips or loan documents, that proves that your sponsors have the capacity to fund your studies without financial distress to themselves or their families
                           .</td>
                                 </tr>
                             </table>
                         </div>
               
                     <br/></div>
                      <div id="page25_tab29" runat="server" style="display: none;">
                     <div class="table-responsive">
                             <table class="table">
                                 <tr>
                                    <th class="head-table wid">
                                         Risk factor
                                     </th>
                                     <th class="head-table">
                                         Severity of Risk
                                     </th>
                                     <th class="head-table wd"> How you could address the risk factor in your
                            <%=country_intent_tostudy %> - Statement of purpose (SOP)</th>
                                     <th>Possible supporting documents** that you could consider attaching to your application</th>
                                 </tr>
                                 <tr>
                                    <td class="border head-table">
            The source of funding for your tuition fees and living expenses will be funded largely through student loans and scholarships
                                     </td>
                                     <td class="border head-table third">
                                         Low
                                     </td>
                                     <td class="border"> Provide: 1. Details of the student loan(s) and/or scholarships you have secured; AND 2. Reassurance about the reliability of your sponsors/sources of funds.</td>
                                     
                                     <td class="border"> Attach confirmation of the loans and/or scholarships that you have secured and the total amount and duration that they are committing to the loan/scholarship.
                           .</td>
                                 </tr>
                             </table>
                         </div>
                     
                     <br/></div>
                      <div id="page25_tab30" runat="server" style="display: none;">
                     <div class="table-responsive">
                             <table class="table">
                                 <tr>
                                    <th class="head-table wid">
                                         Risk factor
                                     </th>
                                     <th class="head-table">
                                         Severity of Risk
                                     </th>
                                     <th class="head-table wd"> How you could address the risk factor in your
                            <%=country_intent_tostudy %> - Statement of purpose (SOP)</th>
                                     <th>Possible supporting documents** that you could consider attaching to your application</th>
                                 </tr>
                                 <tr>
                                    <td class="border head-table">
            Your sponsor's income in the last calendar year was less than USD 25,000
                                     </td>
                                     <td class="border head-table first">
                                         High
                                     </td>
                                     <td class="border">Provide an explanation for how you will be able to fund your studies without financial distress to yourself or your sponsor's family.</td>
                                     
                                     <td class="border">Attach any documentary evidence that supports your explanation about how you will be able to fund your studies without financial distress to yourself or your sponsor's family.
                           .</td>
                                 </tr>
                             </table>
                         </div>
                   
                     <br/></div>
                      <div id="page25_tab31" runat="server" style="display: none;">
                      <div class="table-responsive">
                             <table class="table">
                                 <tr>
                                    <th class="head-table wid">
                                         Risk factor
                                     </th>
                                     <th class="head-table">
                                         Severity of Risk
                                     </th>
                                     <th class="head-table wd"> How you could address the risk factor in your
                            <%=country_intent_tostudy %> - Statement of purpose (SOP)</th>
                                     <th>Possible supporting documents** that you could consider attaching to your application</th>
                                 </tr>
                                 <tr>
                                    <td class="border head-table">
           Your sponsor's income in the last calendar year was between USD25,001 to USD50,000
                                     </td>
                                     <td class="border head-table second">
                                         Medium
                                     </td>
                                     <td class="border">Provide an explanation for how you will be able to fund your studies without financial distress to yourself or your sponsor's family.</td>
                                     
                                     <td class="border">Attach any documentary evidence that supports your explanation about how you will be able to fund your studies without financial distress to yourself or your sponsor's family
                           .</td>
                                 </tr>
                             </table>
                         </div>
                   
                     <br/></div>
                      <div id="page25_tab32" runat="server" style="display: none;">
                      <div class="table-responsive">
                             <table class="table">
                                 <tr>
                                    <th class="head-table wid">
                                         Risk factor
                                     </th>
                                     <th class="head-table">
                                         Severity of Risk
                                     </th>
                                     <th class="head-table wd"> How you could address the risk factor in your
                            <%=country_intent_tostudy %> - Statement of purpose (SOP)</th>
                                     <th>Possible supporting documents** that you could consider attaching to your application</th>
                                 </tr>
                                 <tr>
                                    <td class="border head-table">
          Your sponsor's income in the last calendar year was between USD50,001 TO 75,000
                                     </td>
                                     <td class="border head-table third">
                                         Low
                                     </td>
                                     <td class="border">Provide an explanation for how you will be able to fund your studies without financial distress to yourself or your sponsor's family.</td>
                                     
                                     <td class="border">Attach any documentary evidence that supports your explanation about how you will be able to fund your studies without financial distress to yourself or your sponsor's family.
                           .</td>
                                 </tr>
                             </table>
                         </div>
                   
                     <br/></div><div id="page25_tab33" runat="server" style="display: none;">
                      <div class="table-responsive">
                             <table class="table">
                                 <tr>
                                    <th class="head-table wid">
                                         Risk factor
                                     </th>
                                     <th class="head-table">
                                         Severity of Risk
                                     </th>
                                     <th class="head-table wd"> How you could address the risk factor in your
                            <%=country_intent_tostudy %> - Statement of purpose (SOP)</th>
                                     <th>Possible supporting documents** that you could consider attaching to your application</th>
                                 </tr>
                                 <tr>
                                    <td class="border head-table">
          Your sponsor is a company or government department
                                     </td>
                                     <td class="border head-table third">
                                         Low
                                     </td>
                                     <td class="border">Provide the details of your sponsor. The following information will be useful: the name of your company or government sponsor; the amount they are sponsoring you for; the duration of the sponsorship; and the details of a contact person who can verify this information.</td>
                                     
                                     <td class="border">Attach any documentary evidence that supports the sponsorship details that you have provided in your Statement of Purpose (SOP).
                           .</td>
                                 </tr>
                             </table>
                         </div>
                     
                     <br/></div><div id="page25_tab34" runat="server" style="display: none;">
                      <div class="table-responsive">
                             <table class="table">
                                 <tr>
                                    <th class="head-table wid">
                                         Risk factor
                                     </th>
                                     <th class="head-table">
                                         Severity of Risk
                                     </th>
                                     <th class="head-table wd"> How you could address the risk factor in your
                            <%=country_intent_tostudy %> - Statement of purpose (SOP)</th>
                                     <th>Possible supporting documents** that you could consider attaching to your application</th>
                                 </tr>
                                 <tr>
                                    <td class="border head-table">
          Your sponsor is a scholarship awarding body/organisation
                                     </td>
                                     <td class="border head-table third">
                                         Low
                                     </td>
                                     <td class="border">Provide the details of your scholarship. The following information will be useful: the name of your scholarship provider; the monetary value of the scholarship; the duration of the scholarship; and the details of a contact person who can verify this information.</td>
                                     
                                     <td class="border">Attach any documentary evidence that supports the scholarship details that you have provided in your Statement of Purpose (SOP).
                           .</td>
                                 </tr>
                             </table>
                         </div>
                     
                     <br/></div><div id="page25_tab35" runat="server" style="display: none;">
                          <div class="table-responsive">
                             <table class="table">
                                 <tr>
                                    <th class="head-table wid">
                                         Risk factor
                                     </th>
                                     <th class="head-table">
                                         Severity of Risk
                                     </th>
                                     <th class="head-table wd"> How you could address the risk factor in your
                            <%=country_intent_tostudy %> - Statement of purpose (SOP)</th>
                                     <th>Possible supporting documents** that you could consider attaching to your application</th>
                                 </tr>
                                 <tr>
                                    <td class="border head-table">
        Your sponsor is a bank or financial lending institution
                                     </td>
                                     <td class="border head-table third">
                                         Low
                                     </td>
                                     <td class="border">Provide the details of your loan. The following information will be useful: the name of the financial institution providing the loan; the amount they are loaning you for your studies; the duration of the loan; and the details of a contact person who can verify this information.</td>
                                     
                                     <td class="border">Attach any documentary evidence that supports the loan details that you have provided in your Statement of Purpose (SOP).
                           .</td>
                                 </tr>
                             </table>
                         </div>
                     
                     <br/></div><div id="page25_tab36" runat="server" style="display: none;">
                       <div class="table-responsive">
                             <table class="table">
                                 <tr>
                                    <th class="head-table wid">
                                         Risk factor
                                     </th>
                                     <th class="head-table">
                                         Severity of Risk
                                     </th>
                                     <th class="head-table wd"> How you could address the risk factor in your
                            <%=country_intent_tostudy %> - Statement of purpose (SOP)</th>
                                     <th>Possible supporting documents** that you could consider attaching to your application</th>
                                 </tr>
                                 <tr>
                                    <td class="border head-table">
         In your home country
                           <%=Nationality%>
                           , you are required to do compulsory Military Service which is due in the next 12 months
                                     </td>
                                     <td class="border head-table second">
                                         Medium
                                     </td>
                                     <td class="border">Provide an explanation for why you are choosing to pursue further study now instead of fulfilling your obligations to undertake the forthcoming military service commitments in your home country.</td>
                                     
                                     <td class="border">Attach any documentary evidence that supports your explanation about why you are choosing to pursue further study now instead of fulfilling your obligations to undertake the forthcoming military service commitments in your home country
                           .</td>
                                 </tr>
                             </table>
                         </div>
                   
                     <br/></div><div id="page25_tab37" runat="server" style="display: none;">
                   <div class="table-responsive">
                             <table class="table">
                                 <tr>
                                    <th class="head-table wid">
                                         Risk factor
                                     </th>
                                     <th class="head-table">
                                         Severity of Risk
                                     </th>
                                     <th class="head-table wd">How you could address the risk factor in your
                            <%=country_intent_tostudy %> - Statement of purpose (SOP)</th>
                                     <th>Possible supporting documents** that you could consider attaching to your application</th>
                                 </tr>
                                 <tr>
                                    <td class="border head-table">
          In your home country
                           <%=Nationality%>
                           , your spouse is required to do compulsory Military Service which is due in the next 12 months
                                     </td>
                                     <td class="border head-table second">
                                         Medium
                                     </td>
                                     <td class="border">Provide an explanation for why you are choosing to pursue further study now instead of waiting for your spouse to fulfill his/her obligations to undertake the forthcoming military service commitments in your home country.</td>
                                     
                                     <td class="border">Attach any documentary evidence that supports your explanation about why you are choosing to pursue further study now instead of waiting for your spouse to fulfill his/her obligations to undertake the forthcoming military service commitments in your home country
                           .</td>
                                 </tr>
                             </table>
                         </div>
                   
                     <br/></div><div id="page25_tab38" runat="server" style="display: none;">
                       <div class="table-responsive">
                             <table class="table">
                                 <tr>
                                    <th class="head-table wid">
                                         Risk factor
                                     </th>
                                     <th class="head-table">
                                         Severity of Risk
                                     </th>
                                     <th class="head-table wd"> How you could address the risk factor in your
                            <%=country_intent_tostudy %> - Statement of purpose (SOP)</th>
                                     <th>Possible supporting documents** that you could consider attaching to your application</th>
                                 </tr>
                                 <tr>
                                    <td class="border head-table">
          In your home country
                           <%=Nationality%>
                           , you are required to do compulsory Military Service which is due in the next 24 months
                                     </td>
                                     <td class="border head-table third">
                                         Low
                                     </td>
                                     <td class="border">Provide an explanation for how you intend to fulfill your obligations to undertake your future military service commitments in your home country even though you are choosing to study now.</td>
                                     
                                     <td class="border">Attach any documentary evidence that supports your explanation about how you intend to fulfill your obligations to undertake your future military service commitments in your home country even though you are choosing to study now.
                           .</td>
                                 </tr>
                             </table>
                         </div>
                   
                     <br/></div><div id="page25_tab39" runat="server" style="display: none;">
                      <div class="table-responsive">
                             <table class="table">
                                 <tr>
                                    <th class="head-table wid">
                                         Risk factor
                                     </th>
                                     <th class="head-table">
                                         Severity of Risk
                                     </th>
                                     <th class="head-table wd"> How you could address the risk factor in your
                            <%=country_intent_tostudy %> - Statement of purpose (SOP)</th>
                                     <th>Possible supporting documents** that you could consider attaching to your application</th>
                                 </tr>
                                 <tr>
                                    <td class="border head-table">
        In your home country
                           <%=Nationality%>
                           , your spouse is required to do compulsory Military Service which is due in the next 24 months
                                     </td>
                                     <td class="border head-table third">
                                         Low
                                     </td>
                                     <td class="border">Provide an explanation for how your spouse intends to fulfill his/her obligations to undertake his/her future military service commitments in your home country even though you are choosing to study now.</td>
                                     
                                     <td class="border">Attach any documentary evidence that supports your explanation about  how your spouse intends to fulfill his/her obligations to undertake his/her future military service commitments in your home country even though you are choosing to study now.
                           .</td>
                                 </tr>
                             </table>
                         </div>
                   
                     <br/></div>
                     <%-- <div id="page25_tab39_1" runat="server" style="display: none;">
                     <div class="row border border-dark" id="heading1">
                        <div class="col-2 border border-dark">Risk factor</div>
                        <div class="col-2 border border-dark">Severity of Risk</div>
                        <div class="col-4 border border-dark">
                           How you could address the risk factor in your
                            <%=country_intent_tostudy %> - Statement of purpose (SOP)
                        </div>
                        <div class="col-4 border border-dark">Possible supporting documents** that you could consider attaching to your application</div>
                     </div>
                     <div class="row border border-dark">
                        <div class="col border border-dark centered">
                           In your home country
                           <%=Nationality%>
                           , your spouse is required to do compulsory Military Service which is due in the next 24 months
                        </div>
                        <div class="col-2 border border-dark centered" id="third">Low</div>
                        <div class="col border border-dark centered">Provide an explanation for how your spouse intends to fulfill his/her obligations to undertake his/her future military service commitments in your home country even though you are choosing to study now.</div>
                        <div class="col border border-dark centered">Attach any documentary evidence that supports your explanation about  how your spouse intends to fulfill his/her obligations to undertake his/her future military service commitments in your home country even though you are choosing to study now.
                        </div>
                     </div>
                     <br/></div>--%>
                      <div id="page25_tab40" runat="server" style="display: none;">
                        <div class="table-responsive">
                             <table class="table">
                                 <tr>
                                    <th class="head-table wid">
                                         Risk factor
                                     </th>
                                     <th class="head-table">
                                         Severity of Risk
                                     </th>
                                     <th class="head-table wd"> How you could address the risk factor in your
                            <%=country_intent_tostudy %> - Statement of purpose (SOP)</th>
                                     <th>Possible supporting documents** that you could consider attaching to your application</th>
                                 </tr>
                                 <tr>
                                    <td class="border head-table">
       You have said that the political and civil situation in
                           <%=Nationality%>
                           , your home country, is very bad, and there is risk to life and property. You would like to move out quickly
                                     </td>
                                     <td class="border head-table first">
                                         High
                                     </td>
                                     <td class="border"> Address any concerns that the decision-maker might have about your intentions and motivations for deciding to study in
                           <%=country_intent_tostudy %>
                           and re-assure him/her that your study intentions are genuine#.</td>
                                     
                           <td class="border">Attach any documentary evidence that supports your explanation about why your study intentions are genuine#.
                           .</td>
                                 </tr>
                             </table>
                         </div>
                   
                     <p class="note"># Remember that if the decision-maker suspects that your intentions are for any outcomes other than study outcomes, he or she is likely to reject your application on the basis of them suspecting you to be a non-genuine student and a non-genuine temporary entrant.</p>
                     <br/></div><div id="page25_tab41" runat="server" style="display: none;">
                        <div class="table-responsive">
                             <table class="table">
                                 <tr>
                                    <th class="head-table wid">
                                         Risk factor
                                     </th>
                                     <th class="head-table">
                                         Severity of Risk
                                     </th>
                                     <th class="head-table wd"> How you could address the risk factor in your
                            <%=country_intent_tostudy %> - Statement of purpose (SOP)</th>
                                     <th>Possible supporting documents** that you could consider attaching to your application</th>
                                 </tr>
                                 <tr>
                                    <td class="border head-table">
       You have said that the political and civil situation in
                           <%=Nationality%>
                           , your home country, is bad and you fear that your family and yourself would not be safe in  
                           <%=Nationality%>
                                     </td>
                                     <td class="border head-table first">
                                         High
                                     </td>
                                     <td class="border"> Address any concerns that the decision-maker might have about your intentions and motivations for deciding to study in
                           <%=country_intent_tostudy %>
                           and re-assure him/her that your study intentions are genuine#.</td>
                                     
                           <td class="border">Attach any documentary evidence that supports your explanation about why your study intentions are genuine#.
                           .</td>
                                 </tr>
                             </table>
                         </div>
                   
                     <p class="note"># Remember that if the decision-maker suspects that your intentions are for any outcomes other than study outcomes, he or she is likely to reject your application on the basis of them suspecting you to be a non-genuine student and a non-genuine temporary entrant.</p>
                     <br/></div><div id="page25_tab42" runat="server" style="display: none;">
                   <div class="table-responsive">
                             <table class="table">
                                 <tr>
                                    <th class="head-table wid">
                                         Risk factor
                                     </th>
                                     <th class="head-table">
                                         Severity of Risk
                                     </th>
                                     <th class="head-table wd"> How you could address the risk factor in your
                            <%=country_intent_tostudy %> - Statement of purpose (SOP)</th>
                                     <th>Possible supporting documents** that you could consider attaching to your application</th>
                                 </tr>
                                 <tr>
                                    <td class="border head-table">
       You have said that the political and civil situation in
                           <%=Nationality%>
                           , your home country, is deteriorating quickly, and you are worried about the future
                                     </td>
                                     <td class="border head-table second">
                                         Medium
                                     </td>
                                     <td class="border">Address any concerns that the decision-maker might have about your intentions and motivations for deciding to study in
                           <%=country_intent_tostudy %>
                           and re-assure him/her that your study intentions are genuine#.</td>
                                     
                           <td class="border">Attach any documentary evidence that supports your explanation about why your study intentions are genuine#.
                           .</td>
                                 </tr>
                             </table>
                         </div>
                   
                     <p class="note"># Remember that if the decision-maker suspects that your intentions are for any outcomes other than study outcomes, he or she is likely to reject your application on the basis of them suspecting you to be a non-genuine student and a non-genuine temporary entrant.</p>
                     <br/></div><div id="page25_tab43" runat="server" style="display: none;">
                          <div class="table-responsive">
                             <table class="table">
                                 <tr>
                                    <th class="head-table wid">
                                         Risk factor
                                     </th>
                                     <th class="head-table">
                                         Severity of Risk
                                     </th>
                                     <th class="head-table wd"> How you could address the risk factor in your
                            <%=country_intent_tostudy %> - Statement of purpose (SOP)</th>
                                     <th>Possible supporting documents** that you could consider attaching to your application</th>
                                 </tr>
                                 <tr>
                                    <td class="border head-table">
       You have said that the political and civil situation in
                           <%=Nationality%>
                           , your home country, is not good. You believe that you would risk your future if you continue to stay in
                           <%=Nationality%>
                                     </td>
                                     <td class="border head-table third">
                                         Low
                                     </td>
                                     <td class="border"> Address any concerns that the decision-maker might have about your intentions and motivations for deciding to study in
                           <%=country_intent_tostudy %>
                           and re-assure him/her that your study intentions are genuine#.</td>
                                     
                           <td class="border">Attach any documentary evidence that supports your explanation about why your study intentions are genuine#.
                           .</td>
                                 </tr>
                             </table>
                         </div>
                   
                     <p class="note"># Remember that if the decision-maker suspects that your intentions are for any outcomes other than study outcomes, he or she is likely to reject your application on the basis of them suspecting you to be a non-genuine student and a non-genuine temporary entrant.</p>
                     <br/></div><div id="page25_tab44" runat="server" style="display: none;">
                    <div class="table-responsive">
                             <table class="table">
                                 <tr>
                                    <th class="head-table wid">
                                         Risk factor
                                     </th>
                                     <th class="head-table">
                                         Severity of Risk
                                     </th>
                                     <th class="head-table wd"> How you could address the risk factor in your
                            <%=country_intent_tostudy %> - Statement of purpose (SOP)</th>
                                     <th>Possible supporting documents** that you could consider attaching to your application</th>
                                 </tr>
                                 <tr>
                                    <td class="border head-table">
     You have said that you are unwilling to return and stay in your home country due to a fear of being persecuted because of your race, religion, nationality, membership of a particular social group or political opinion
                                     </td>
                                     <td class="border head-table first">
                                         High
                                     </td>
                                     <td class="border">Address any concerns that the decision-maker might have about your intentions and motivations for deciding to study in
                           <%=country_intent_tostudy %>
                           and re-assure him/her that your study intentions are genuine#.</td>
                                     
                           <td class="border">Attach any documentary evidence that supports your explanation about why your study intentions are genuine#.
                           .</td>
                                 </tr>
                             </table>
                         </div>
                     
                     <p class="note"># Remember that if the decision-maker suspects that your intentions are for any outcomes other than study outcomes, he or she is likely to reject your application on the basis of them suspecting you to be a non-genuine student and a non-genuine temporary entrant.</p>
                     <br/></div><div id="page25_tab45" runat="server" style="display: none;">
                       <div class="table-responsive">
                             <table class="table">
                                 <tr>
                                    <th class="head-table wid">
                                         Risk factor
                                     </th>
                                     <th class="head-table">
                                         Severity of Risk
                                     </th>
                                     <th class="head-table wd"> How you could address the risk factor in your
                            <%=country_intent_tostudy %> - Statement of purpose (SOP)</th>
                                     <th>Possible supporting documents** that you could consider attaching to your application</th>
                                 </tr>
                                 <tr>
                                    <td class="border head-table">
      You said that while you study in
                           <%=country_intent_tostudy %>
                           , one or both your parents will join you and stay with you
                                     </td>
                                     <td class="border head-table second">
                                         Medium
                                     </td>
                                     <td class="border">Provide details of your parent(s) who will be joining you in
                           <%=country_intent_tostudy %>
                           and the type of visa that they will be applying for in order to join you in
                           <%=country_intent_tostudy %></td>
                                     
                           <td class="border"> Attach any documentary evidence that supports the information about your parent(s) who will be joining you in
                           <%=country_intent_tostudy %>
                           and the type of visa that they will be applying for in order to join you in
                           <%=country_intent_tostudy %>
                           .</td>
                                 </tr>
                             </table>
                         </div>
                   
                     <br/></div><div id="page25_tab46" runat="server" style="display: none;">
                    <div class="table-responsive">
                             <table class="table">
                                 <tr>
                                    <th class="head-table wid">
                                         Risk factor
                                     </th>
                                     <th class="head-table">
                                         Severity of Risk
                                     </th>
                                     <th class="head-table wd"> How you could address the risk factor in your
                            <%=country_intent_tostudy %> - Statement of purpose (SOP)</th>
                                     <th>Possible supporting documents** that you could consider attaching to your application</th>
                                 </tr>
                                 <tr>
                                    <td class="border head-table">
     You said that while you study in
                           <%=country_intent_tostudy %>
                           , your parents, spouse, and children will join you and stay with you
                                     </td>
                                     <td class="border head-table second">
                                         Medium
                                     </td>
                                     <td class="border">Provide details of your parent(s), spouse, and children who will be joining you in
                           <%=country_intent_tostudy %>
                           and the type of visa that they will be applying for in order to join you in
                           <%=country_intent_tostudy %></td>
                                     
                           <td class="border"> Attach any documentary evidence that supports the information about your parent(s), spouse and children who will be joining you in
                           <%=country_intent_tostudy %>
                           and the type of visa that they will be applying for in order to join you in
                           <%=country_intent_tostudy %>
                           .</td>
                                 </tr>
                             </table>
                         </div>
                 
                     <br/></div><div id="page25_tab47" runat="server" style="display: none;">
                      <div class="table-responsive">
                             <table class="table">
                                 <tr>
                                    <th class="head-table wid">
                                         Risk factor
                                     </th>
                                     <th class="head-table">
                                         Severity of Risk
                                     </th>
                                     <th class="head-table wd"> How you could address the risk factor in your
                            <%=country_intent_tostudy %> - Statement of purpose (SOP)</th>
                                     <th>Possible supporting documents** that you could consider attaching to your application</th>
                                 </tr>
                                 <tr>
                                    <td class="border head-table">
     You said that while you study in
                           <%=country_intent_tostudy %>
                           , your spouse and children/dependents will join you and stay with you
                                     </td>
                                     <td class="border head-table third">
                                         Low
                                     </td>
                                     <td class="border">Provide details of your spouse, and children who will be joining you in
                           <%=country_intent_tostudy %></td>
                                     
                           <td class="border">Attach: 1. Evidence of your relationship with your spouse/de facto partner. This could include a certified copy of your marriage certificate, Family Book, Household Booklet or other evidence of family composition; AND, 2. Birth certificates of your children/dependents; AND, 3. Evidence of enrolment of an accompanying dependent child 5 to 18 years of age at an
                           <%=country_intent_tostudy %>
                           school
                           .</td>
                                 </tr>
                             </table>
                         </div>
                 
                     <br/></div><div id="page25_tab48" runat="server" style="display: none;">
                        <div class="table-responsive">
                             <table class="table">
                                 <tr>
                                    <th class="head-table wid">
                                         Risk factor
                                     </th>
                                     <th class="head-table">
                                         Severity of Risk
                                     </th>
                                     <th class="head-table wd"> How you could address the risk factor in your
                            <%=country_intent_tostudy %> - Statement of purpose (SOP)</th>
                                     <th>Possible supporting documents** that you could consider attaching to your application</th>
                                 </tr>
                                 <tr>
                                    <td class="border head-table">
   You said that while you study in
                           <%=country_intent_tostudy %>
                           , your spouse will join you and stay with you
                                     </td>
                                     <td class="border head-table third">
                                         Low
                                     </td>
                                     <td class="border"> Provide details of your spouse, and children who will be joining you in
                           <%=country_intent_tostudy %></td>
                                     
                           <td class="border">Attach: 1. Evidence of your relationship with your spouse/de facto partner. This could include a certified copy of your marriage certificate, Family Book, Household Booklet or other evidence of family composition; AND, 2. Evidence that you have access to additional funds to support your spouse while in
                           <%=country_intent_tostudy %>
                           school
                           .</td>
                                 </tr>
                             </table>
                         </div>
                   
                     <br/></div><div id="page25_tab49" runat="server" style="display: none;">
                   <div class="table-responsive">
                             <table class="table">
                                 <tr>
                                    <th class="head-table wid">
                                         Risk factor
                                     </th>
                                     <th class="head-table">
                                         Severity of Risk
                                     </th>
                                     <th class="head-table wd"> How you could address the risk factor in your
                            <%=country_intent_tostudy %> - Statement of purpose (SOP)</th>
                                     <th>Possible supporting documents** that you could consider attaching to your application</th>
                                 </tr>
                                 <tr>
                                    <td class="border head-table">
  You said that your personal experience with
                           <%=country_intent_tostudy %>
                           does not exist because this is the first time I will be visiting
                           <%=country_intent_tostudy %>
                                     </td>
                                     <td class="border head-table third">
                                         Low
                                     </td>
                                     <td class="border">   Reassure the decision-maker that you have an accurate understanding of visa requirements, visa conditions and life in
                           <%=country_intent_tostudy %>
                           . It must be clear that you made an informed decision when you decided to study in
                           <%=country_intent_tostudy %>
                           .</td>
                                     
                           <td class="border"> Attach any documentary evidence that supports your explanation about your level of knowledge and understanding. For example, your GTE Direct Certificate of Understanding (COU).
                           school
                           .</td>
                                 </tr>
                             </table>
                         </div>
                 
                     <br/></div><div id="page25_tab50" runat="server" style="display: none;">
                  <div class="table-responsive">
                             <table class="table">
                                 <tr>
                                    <th class="head-table wid">
                                         Risk factor
                                     </th>
                                     <th class="head-table">
                                         Severity of Risk
                                     </th>
                                     <th class="head-table wd"> How you could address the risk factor in your
                            <%=country_intent_tostudy %> - Statement of purpose (SOP)</th>
                                     <th>Possible supporting documents** that you could consider attaching to your application</th>
                                 </tr>
                                 <tr>
                                    <td class="border head-table">
 You said that your personal experience with
                           <%=country_intent_tostudy %>
                           exists because you are currently living and have been studying in
                           <%=country_intent_tostudy %>
                           on a student visa
                                     </td>
                                     <td class="border head-table third">
                                         Low
                                     </td>
                                     <td class="border">Provide details of your current and/or previous student visa(s), the course(s) you have been studying and the education provider(s) of that/those course(s)
                           .</td>
                                     
                           <td class="border">Attach any documentary evidence that supports the information of your current and/or previous student visa(s), the course(s) you have been studying and the education provider(s) of that/those course(s).</td>
                                 </tr>
                             </table>
                         </div>
               
                     <br/></div><div id="page25_tab51" runat="server" style="display: none;">
                         <div class="table-responsive">
                             <table class="table">
                                 <tr>
                                     <th class="head-table wid">
                                         Risk factor
                                     </th>
                                     <th class="head-table">
                                         Severity of Risk
                                     </th>
                                   <th class="head-table wd">  How you could address the risk factor in your
                            <%=country_intent_tostudy %> - Statement of purpose (SOP)</th>
                                     <th>Possible supporting documents** that you could consider attaching to your application</th>
                                 </tr>
                                 <tr>
                                       <td class="border head-table">
 You said that your personal experience with
                           <%=country_intent_tostudy %>
                           exists because your spouse has linkages to
                           <%=country_intent_tostudy %>
                                     </td>
                                       <td class="border head-table third">
                                         Low
                                     </td>
                                     <td class="border">  Provide details of your spouse's connection to
                           <%=country_intent_tostudy %>
                           .</td>
                                     
                                      <td class="border"> Attach any documentary evidence that supports the details provided of your spouse's connection to
                           <%=country_intent_tostudy %>
                           .</td>
                                 </tr>
                             </table>
                         </div>
                   
                     <br/></div><div id="page25_tab52" runat="server" style="display: none;">
                       <div class="table-responsive">
                             <table class="table">
                                 <tr>
                                    <th class="head-table wid">
                                         Risk factor
                                     </th>
                                      <th class="head-table">
                                         Severity of Risk
                                     </th>
                                    <th class="head-table wd"> How you could address the risk factor in your
                            <%=country_intent_tostudy %> - Statement of purpose (SOP)</th>
                                     <th>Possible supporting documents** that you could consider attaching to your application</th>
                                 </tr>
                                 <tr>
                                     <td class="border head-table">
 You said that you have chosen to study in
                           <%=country_intent_tostudy %>
                           over other destinations because you plan to migrate to
                           <%=country_intent_tostudy %>
                           and apply for a Permanent Residency Visa after your course
                                     </td>
                                      <td class="border head-table first">
                                         High
                                     </td>
                                     <td class="border"> Address any concerns that the decision-maker might have about your intentions and motivations for deciding to study in
                           <%=country_intent_tostudy %>
                           and re-assure him/her that your study intentions are genuine#.</td>
                                     
                                       <td class="border">Attach any documentary evidence that supports your explanation about why your study intentions are genuine#
                           .</td>
                                 </tr>
                             </table>
                         </div>
                   
                     <p class="note"># Remember that if the decision-maker suspects that your intentions are for any outcomes other than study outcomes, he or she is likely to reject your application on the basis of them suspecting you to be a non-genuine student and a non-genuine temporary entrant.</p>
                     <br/></div><div id="page25_tab53" runat="server" style="display: none;">
                    <div class="table-responsive">
                             <table class="table">
                                 <tr>
                                     <th class="head-table wid">
                                         Risk factor
                                     </th>
                                     <th class="head-table">
                                         Severity of Risk
                                     </th>
                                     <th class="head-table wd"> How you could address the risk factor in your
                            <%=country_intent_tostudy %> - Statement of purpose (SOP)</th>
                                     <th>Possible supporting documents** that you could consider attaching to your application</th>
                                 </tr>
                                 <tr>
                                     <td class="border head-table">
  You said that you have chosen to study in
                           <%=country_intent_tostudy %>
                           over other destinations because
                           <%=country_intent_tostudy %>
                           will offer you a much better quality of life and career options than your Home Country
                                     </td>
                                       <td class="border head-table second">
                                         Medium
                                     </td>
                                    <td class="border"> Reassure the decision-maker that the better quality of life and career options in
                           <%=country_intent_tostudy %>
                           will not be an incentive for you to remain in
                           <%=country_intent_tostudy %>
                           instead of returning to your home country after your studies.</td>
                                     
                                    <td class="border"> Attach any documentary evidence that supports your explanation about why the better quality of life and career options in
                           <%=country_intent_tostudy %>
                           will not be an incentive for you to remain in
                           <%=country_intent_tostudy %>
                           instead of returning to your home country after your studies
                           .</td>
                                 </tr>
                             </table>
                         </div>
                 
                     <br/></div><div id="page25_tab54" runat="server" style="display: none;">
                      <div class="table-responsive">
                             <table class="table">
                                 <tr>
                                       <th class="head-table wid">
                                         Risk factor
                                     </th>
                                     <th class="head-table">
                                         Severity of Risk
                                     </th>
                                      <th class="head-table wd"> How you could address the risk factor in your
                            <%=country_intent_tostudy %> - Statement of purpose (SOP)</th>
                                     <th>Possible supporting documents** that you could consider attaching to your application</th>
                                 </tr>
                                 <tr>
                                     <td class="border head-table">
   You said that you have chosen to study in
                           <%=country_intent_tostudy %>
                           over other destinations because you already have friends and family living and studying in
                           <%=country_intent_tostudy %>
                                     </td>
                                      <td class="border head-table third">
                                         Low
                                     </td>
                                      <td class="border">  1. Provide details of your family and friends in
                           <%=country_intent_tostudy %>
                           ; AND, 2. Reassure the decision-maker that your family and friends in
                           <%=country_intent_tostudy %>
                           will not be an incentive for you to remain in
                           <%=country_intent_tostudy %>
                           instead of returning to your home country after your studies; AND, 3. If you are not going to study in the city where your family and friends live, provide an explanation for whyyou have chosen to study in a different city to where you have family and friends.</td>
                                     
                                      <td class="border">Attach any documentary evidence: 1. Of proof of address and/or reference or support letters from your family or friends; AND 2. that supports your explanation about why your family and friends in
                           <%=country_intent_tostudy %>
                           will not be an incentive for you to remain in
                           <%=country_intent_tostudy %>
                           instead of returning to your home country after your studies
                           .</td>
                                 </tr>
                             </table>
                         </div>
                   
                     <br/></div>
                      <div id="page25_tab55" runat="server" style="display: none;">
                        <div class="table-responsive">
                             <table class="table">
                                 <tr>
                                    <th class="head-table wid">
                                         Risk factor
                                     </th>
                                      <th class="head-table">
                                         Severity of Risk
                                     </th>
                                     <th class="head-table wd">How you could address the risk factor in your
                            <%=country_intent_tostudy %> - Statement of purpose (SOP)</th>
                                     <th>Possible supporting documents** that you could consider attaching to your application</th>
                                 </tr>
                                 <tr>
                                    <td class="border head-table">
   You said that your decision to study at
                           <%=universityname %>
                           is based on having friends and family living in
                           <%=City%>
                                     </td>
                                     <td class="border head-table third">
                                         Low
                                     </td>
                                     <td class="border"> 1. Provide details of your family and friends in
                           <%=City%>
                           ; AND, 2. Reassure the decision-maker that your family and friends in
                           <%=City%>
                           will not be an incentive for you to remain in
                           <%=City%>
                           instead of returning to your home country after your studies.</td>
                                     
                                     <td class="border">Attach any documentary evidence: 1. Of proof of address and/or reference or support letters from your family or friends; AND 2. that supports your explanation about why your family and friends in
                           <%=City%>
                           will not be an incentive for you to remain in
                           <%=City%>
                           instead of returning to your home country after your studies
                           .</td>
                                 </tr>
                             </table>
                         </div>
                   
                     <br/></div>
                    <%--  <div id="page25_tab56" runat="server" style="display: none;">
                     <div class="row border border-dark" id="heading1">
                        <div class="col-2 border border-dark">Risk factor</div>
                        <div class="col-2 border border-dark">Severity of Risk</div>
                        <div class="col-4 border border-dark">
                           How you could address the risk factor in your
                            <%=country_intent_tostudy %> - Statement of purpose (SOP)
                        </div>
                        <div class="col-4 border border-dark">Possible supporting documents** that you could consider attaching to your application</div>
                     </div>
                     <div class="row border border-dark">
                        <div class="col border border-dark centered">
                           You said that your decision to study at
                           <<%=universityname %>                           is based on it having the lowest tuition fee among your shortlisted institutions
                        </div>
                        <div class="col-2 border border-dark centered" id="third">Low</div>
                        <div class="col border border-dark centered">
                           Reassure the decision-maker that you are committed in your decision to study at
                           <%=universityname %>
                           and that you will not keep changing from one education provider to another chasing one cheap course after another.
                        </div>
                        <div class="col border border-dark centered">
                           Attach any documentary evidence that supports your explanation about how you are committed in your decision to study at
                           <%=universityname %>
                           and that you will not keep changing from one education provider to another chasing one cheap course after another.
                        </div>
                     </div>
                     <br/></div>--%>
                      <div id="page25_tab56" runat="server" style="display: none;">
                          <div class="table-responsive">
                             <table class="table">
                                 <tr>
                                      <th class="head-table wid">
                                         Risk factor
                                     </th>
                                      <th class="head-table">
                                         Severity of Risk
                                     </th>
                                    <th class="head-table wd">How you could address the risk factor in your
                            <%=country_intent_tostudy %> - Statement of purpose (SOP)</th>
                                     <th>Possible supporting documents** that you could consider attaching to your application</th>
                                 </tr>
                                 <tr>
                                       <td class="border head-table">
   You said that your decision to study at
                           <%=universityname %>                           is based on it having the lowest tuition fee among your shortlisted institutions
                                     </td>
                                        <td class="border head-table third">
                                         Low
                                     </td>
                                        <td class="border"> Reassure the decision-maker that you are committed in your decision to study at
                           <%=universityname %>
                           and that you will not keep changing from one education provider to another chasing one cheap course after another.</td>
                                     
                                       <td class="border">Attach any documentary evidence that supports your explanation about how you are committed in your decision to study at
                           <%=universityname %>
                           and that you will not keep changing from one education provider to another chasing one cheap course after another
                           .</td>
                                 </tr>
                             </table>
                         </div>
                         
                          <br />
                      </div>
                      <div id="page25_tab57" runat="server" style="display: none;">
                      <div class="table-responsive">
                             <table class="table">
                                 <tr>
                                      <th class="head-table wid">
                                         Risk factor
                                     </th>
                                      <th class="head-table">
                                         Severity of Risk
                                     </th>
                                      <th class="head-table wd"> How you could address the risk factor in your
                            <%=country_intent_tostudy %> - Statement of purpose (SOP)</th>
                                     <th>Possible supporting documents** that you could consider attaching to your application</th>
                                 </tr>
                                 <tr>
                                    <td class="border head-table">
   You will be less than 18 years old when you first arrive in
                           <%=country_intent_tostudy %>
                           to start your course
                                     </td>
                                      <td class="border head-table third">
                                         Low
                                     </td>
                                     <td class="border"> Provide an explanation for how your welfare requirements (as per the student visa conditions) will be met for the period of time where you will be under 18 years of age in
                           <%=country_intent_tostudy %>
                           .</td>
                                     
                                      <td class="border">Evidence of accommodation and welfare arrangements in
                           <%=country_intent_tostudy %>
                           if you are under 18 years of age must be provided to make a valid application.
                           This must be one of the following:
                           1. Form 157N - Nomination of a student guardian in
                           <%=country_intent_tostudy %>
                           ; OR
                           2. Confirmation of appropriate accommodation and welfare letter from your education provider</td>
                                 </tr>
                             </table>
                         </div>
                     
                     <br/></div>
                      <div id="page25_tab58" runat="server" style="display: none;">
                     <div class="table-responsive">
                             <table class="table">
                                 <tr>
                                     <th class="head-table wid">
                                         Risk factor
                                     </th>
                                      <th class="head-table">
                                         Severity of Risk
                                     </th>
                                    <th class="head-table wd"> How you could address the risk factor in your
                            <%=country_intent_tostudy %> - Statement of purpose (SOP)</th>
                                     <th>Possible supporting documents** that you could consider attaching to your application</th>
                                 </tr>
                                 <tr>
                                       <td class="border head-table">
   You have not studied in
                           <%=country_intent_tostudy %>
                           before
                                     </td>
                                     <td class="border head-table third">
                                         Low
                                     </td>
                                     <td class="border"> Reassure the decision-maker that you have an accurate understanding of visa requirements, visa conditions and life in
                           <%=country_intent_tostudy %>
                           . It must be clear that you made an informed decision when you decided to study in
                           <%=country_intent_tostudy %>
                           .</td>
                                     
                                     <td class="border">Attach any documentary evidence that supports your explanation about your level of knowledge and understanding. For example, your GTE Direct Certificate of Understanding (COU).</td>
                                 </tr>
                             </table>
                         </div>
                 
                     <br/></div>
                      <div id="page25_tab59" runat="server" style="display: none;">
                       <div class="table-responsive">
                             <table class="table">
                                 <tr>
                                    <th class="head-table wid">
                                         Risk factor
                                     </th>
                                     <th class="head-table">
                                         Severity of Risk
                                     </th>
                                     <th class="head-table wd"> How you could address the risk factor in your
                            <%=country_intent_tostudy %> - Statement of purpose (SOP)</th>
                                     <th>Possible supporting documents** that you could consider attaching to your application</th>
                                 </tr>
                                 <tr>
                                  <td class="border head-table">
   Your parents live in
                           <%=country_intent_tostudy %>
                                     </td>
                                         <td class="border head-table third">
                                         Low
                                     </td>
                                    <td class="border">Reassure the decision-maker that the presence of your parents in
                           <%=country_intent_tostudy %>
                           will not be an incentive for you to remain in
                           <%=country_intent_tostudy %>
                           instead of returning to your home country after your studies
                           .</td>
                                     
                                    <td class="border"> Attach any documentary evidence that supports your explanation about why the presence of your parents in
                           <%=country_intent_tostudy %>
                           will not be an incentive for you to remain in
                           <%=country_intent_tostudy %>
                           instead of returning to your home country after your studies.</td>
                                 </tr>
                             </table>
                         </div>
                 
                     <br/></div>
                      <div id="page25_tab60" runat="server" style="display: none;">
                    <div class="table-responsive">
                             <table class="table">
                                 <tr>
                                     <th class="head-table wid">
                                         Risk factor
                                     </th>
                                    <th class="head-table">
                                         Severity of Risk
                                     </th>
                                     <th class="head-table wd"> How you could address the risk factor in your
                            <%=country_intent_tostudy %> - Statement of purpose (SOP)</th>
                                     <th>Possible supporting documents** that you could consider attaching to your application</th>
                                 </tr>
                                 <tr>
                                 <td class="border head-table">
   You said that If an Immigration Officer were to ask you about what you know about
                           <%=country_intent_tostudy %>
                           , you believe that you cannot reasonably communicate an acceptable understanding of the country
                                     </td>
                                   <td class="border head-table third">
                                         Low
                                     </td>
                                    <td class="border"> Reassure the decision-maker that you have and will continue to study and learn all you can about
                           <%=country_intent_tostudy %>
                           and that you have an accurate understanding of visa requirements, visa conditions and life in
                           <%=country_intent_tostudy %>
                           . It must be clear that you made an informed decision when you decided to study in
                           <%=country_intent_tostudy %>
                           .</td>
                                     
                                      <td class="border">  Attach any documentary evidence that supports your explanation about your level of knowledge and understanding. For example, your GTE Direct Certificate of Understanding (COU).</td>
                                 </tr>
                             </table>
                         </div>
                 
                     <br/></div>
                      <div id="page25_tab61" runat="server" style="display: none;">
                       <div class="table-responsive">
                             <table class="table">
                                 <tr>
                                   <th class="head-table wid">
                                         Risk factor
                                     </th>
                                    <th class="head-table">
                                         Severity of Risk
                                     </th>
                                    <th class="head-table wd"> How you could address the risk factor in your
                            <%=country_intent_tostudy %> - Statement of purpose (SOP)</th>
                                     <th>Possible supporting documents** that you could consider attaching to your application</th>
                                 </tr>
                                 <tr>
                                     <td class="border head-table">
   You said that If an Immigration Officer were to ask you about what you know about
                           <%=City%>
                           , you believe that you cannot reasonably communicate an acceptable understanding of your study destination
                                     </td>
                                      <td class="border head-table third">
                                         Low
                                     </td>
                                       <td class="border">Reassure the decision-maker that you have and will continue to study and learn all you can about
                           <%=City%>
                           and that you have an accurate understanding of visa requirements, visa conditions and life in
                           <%=country_intent_tostudy %>
                           . It must be clear that you made an informed decision when you decided to study in
                           <%=City%>
                           
                           .</td>
                                     
                                    <td class="border">  Attach any documentary evidence that supports your explanation about your level of knowledge and understanding. For example, your GTE Direct Certificate of Understanding (COU).</td>
                                 </tr>
                             </table>
                         </div>
                   
                     <br/></div>
                      <div id="page25_tab62" runat="server" style="display: none;">
                     <div class="table-responsive">
                             <table class="table">
                                 <tr>
                                   <th class="head-table wid">
                                         Risk factor
                                     </th>
                                     <th class="head-table">
                                         Severity of Risk
                                     </th>
                                   <th class="head-table wd">  How you could address the risk factor in your
                            <%=country_intent_tostudy %> - Statement of purpose (SOP)</th>
                                     <th>Possible supporting documents** that you could consider attaching to your application</th>
                                 </tr>
                                 <tr>
                                  <td class="border head-table">
  You said that If an Immigration Officer were to ask you about what you know about
                           <%=universityname %>
                           , you believe that you cannot reasonably communicate an acceptable understanding of the education provider you have chosen
                                     </td>
                                     <td class="border head-table third">
                                         Low
                                     </td>
                                    <td class="border"> Reassure the decision-maker that you have and will continue to study and learn all you can about
                           <%=universityname %>
                           and that you have an accurate understanding of visa requirements, visa conditions and life in
                           <%=country_intent_tostudy %>
                           . It must be clear that you made an informed decision when you decided to study at
                           <%=universityname %>
                           
                           
                           .</td>
                                     
                                     <td class="border">  Attach any documentary evidence that supports your explanation about your level of knowledge and understanding. For example, your GTE Direct Certificate of Understanding (COU).</td>
                                 </tr>
                             </table>
                         </div>
                   
                     <br/></div><div id="page25_tab63" runat="server" style="display: none;">
                     <div class="table-responsive">
                             <table class="table">
                                 <tr>
                                      <th class="head-table wid">
                                         Risk factor
                                     </th>
                                     <th class="head-table">
                                         Severity of Risk
                                     </th>
                                     <th class="head-table wd">  How you could address the risk factor in your
                            <%=country_intent_tostudy %> - Statement of purpose (SOP)</th>
                                     <th>Possible supporting documents** that you could consider attaching to your application</th>
                                 </tr>
                                 <tr>
                                    <td class="border head-table">
You said that If an Immigration Officer were to ask you about what you know about
                           <Course>
                           , you believe that you cannot reasonably communicate an acceptable understanding of the course you have decided to study
                                     </td>
                                      <td class="border head-table third">
                                         Low
                                     </td>
                                     <td class="border"> Reassure the decision-maker that you have and will continue to study and learn all you can about
                           <Course>
                           and that you have an accurate understanding of visa requirements, visa conditions and life in
                           <%=country_intent_tostudy %>
                           . It must be clear that you made an informed decision when you decided to study  the
                           <Course>
                           
                           
                           
                           .</td>
                                     
                                     <td class="border">  Attach any documentary evidence that supports your explanation about your level of knowledge and understanding. For example, your GTE Direct Certificate of Understanding (COU).</td>
                                 </tr>
                             </table>
                         </div>
                   
                     <br/></div><div id="page25_tab64" runat="server" style="display: none;">
                    <div class="table-responsive">
                             <table class="table">
                                 <tr>
                                      <th class="head-table wid">
                                         Risk factor
                                     </th>
                                   <th class="head-table">
                                         Severity of Risk
                                     </th>
                                     <th class="head-table wd">  How you could address the risk factor in your
                            <%=country_intent_tostudy %> - Statement of purpose (SOP)</th>
                                     <th>Possible supporting documents** that you could consider attaching to your application</th>
                                 </tr>
                                 <tr>
                                    <td class="border head-table">
You said that you do notCCin
                           <%=City%>
                           :
                                     </td>
                                     <td class="border head-table third">
                                         Low
                                     </td>
                                      <td class="border">Reassure the decision-maker that you have an accurate understanding of visa requirements, visa conditions and life in
                           <%=country_intent_tostudy %>
                           . It must be clear that you made an informed decision when you decided to study in
                           <%=City%>
                           
                           
                           
                           
                           .</td>
                                     
                                     <td class="border">Attach any documentary evidence that supports your explanation about your level of knowledge and understanding. For example, your GTE Direct Certificate of Understanding (COU).</td>
                                 </tr>
                             </table>
                         </div>
                 
                     <br/></div><div id="page25_tab65" runat="server" style="display: none;">
                     <div class="table-responsive">
                             <table class="table">
                                 <tr>
                                     <th class="head-table wid">
                                         Risk factor
                                     </th>
                                      <th class="head-table">
                                         Severity of Risk
                                     </th>
                                    <th class="head-table wd">  How you could address the risk factor in your
                            <%=country_intent_tostudy %> - Statement of purpose (SOP)</th>
                                     <th>Possible supporting documents** that you could consider attaching to your application</th>
                                 </tr>
                                 <tr>
                                   <td class="border head-table">
You said that you do not personally know at least one person who is currently studying at
                           <%=universityname %>
                                     </td>
                                     <td class="border head-table third">
                                         Low
                                     </td>
                                    <td class="border"> Reassure the decision-maker that you have an accurate understanding of visa requirements, visa conditions and life in
                           <%=country_intent_tostudy %>
                           . It must be clear that you made an informed decision when you decided to study at
                           <%=universityname %>
                           
                           
                           
                           
                           .</td>
                                     
                                     <td class="border">Attach any documentary evidence that supports your explanation about your level of knowledge and understanding. For example, your GTE Direct Certificate of Understanding (COU).</td>
                                 </tr>
                             </table>
                         </div>
                   
                     <br/></div><div id="page25_tab66" runat="server" style="display: none;">
                     <div class="table-responsive">
                             <table class="table">
                                 <tr>
                                    <th class="head-table wid">
                                         Risk factor
                                     </th>
                                    <th class="head-table">
                                         Severity of Risk
                                     </th>
                                    <th class="head-table wd">How you could address the risk factor in your
                            <%=country_intent_tostudy %> - Statement of purpose (SOP)</th>
                                     <th>Possible supporting documents** that you could consider attaching to your application</th>
                                 </tr>
                                 <tr>
                                         <td class="border head-table">
 You said that you do not personally know at least one person who is currently planning to study at
                           <%=universityname %>
                                     </td>
                                          <td class="border head-table third">
                                         Low
                                     </td>
                                          <td class="border">Reassure the decision-maker that you have an accurate understanding of visa requirements, visa conditions and life in
                           <%=country_intent_tostudy %>
                           . It must be clear that you made an informed decision when you decided to study at
                           <%=universityname %>
                           
                           
                           
                           
                           .</td>
                                     
                                          <td class="border">Attach any documentary evidence that supports your explanation about your level of knowledge and understanding. For example, your GTE Direct Certificate of Understanding (COU).</td>
                                 </tr>
                             </table>
                         </div>
                   
                     <br/></div><div id="page25_tab67" runat="server" style="display: none;">
                     <div class="table-responsive">
                             <table class="table">
                                 <tr>
                                      <th class="head-table wid">
                                         Risk factor
                                     </th>
                                      <th class="head-table">
                                         Severity of Risk
                                     </th>
                                     <th class="head-table wd">How you could address the risk factor in your
                            <%=country_intent_tostudy %> - Statement of purpose (SOP)</th>
                                     <th>Possible supporting documents** that you could consider attaching to your application</th>
                                 </tr>
                                 <tr>
                                    <td class="border head-table">
You will be under 18 years old when your course starts
                                     </td>
                                      <td class="border head-table fourth">
                                         Not Applicable/Mandatory Requirement
                                     </td>
                                      <td class="border">Provide an explanation for how your welfare requirements (as per the student visa conditions) will be met for the period of time where you will be under 18 years of age in
                           <%=country_intent_tostudy %>
                           .</td>
                                     
                                     <td class="border">Evidence of accommodation and welfare arrangements in
                           <%=country_intent_tostudy %>
                           if you are under 18 years of age must be provided to make a valid application.
                           This must be one of the following:
                           1. Form 157N - Nomination of a student guardian in
                           <%=country_intent_tostudy %>
                           ; OR
                           2. Confirmation of appropriate accommodation and welfare letter from your education provider</td>
                                 </tr>
                             </table>
                         </div>
                     
                     <br/></div><div id="page25_tab68" runat="server" style="display: none;">
                    <div class="table-responsive">
                             <table class="table">
                                 <tr>
                                     <th class="head-table wid">
                                         Risk factor
                                     </th>
                                    <th class="head-table">
                                         Severity of Risk
                                     </th>
                                    <th class="head-table wd">How you could address the risk factor in your
                            <%=country_intent_tostudy %> - Statement of purpose (SOP)</th>
                                     <th>Possible supporting documents** that you could consider attaching to your application</th>
                                 </tr>
                                 <tr>
                                   <td class="border head-table">
You got married less than 6 months ago
                                     </td>
                                     <td class="border head-table third">
                                         Low
                                     </td>
                                     <td class="border">1. Provide an explanation for why you have decided to pursue further study so soon after your marriage; AND, 2. Reassure the decision-maker that your marriage is not a relationship that they should be suspicious of with regards to your student visa application
                           .</td>
                                     
                                      <td class="border">Attach any documentary evidence of your relationship with your spouse/de facto partner. This could include a certified copy of your marriage certificate, Family Book, Household Booklet or other evidence of family composition.</td>
                                 </tr>
                             </table>
                         </div>
                   
                     <br/></div><div id="page25_tab69" runat="server" style="display: none;">
                      <div class="table-responsive">
                             <table class="table">
                                 <tr>
                                    <th class="head-table wid">
                                         Risk factor
                                     </th>
                                    <th class="head-table">
                                         Severity of Risk
                                     </th>
                                     <th class="head-table wd"> How you could address the risk factor in your
                            <%=country_intent_tostudy %> - Statement of purpose (SOP)</th>
                                     <th>Possible supporting documents** that you could consider attaching to your application</th>
                                 </tr>
                                 <tr>
                                    <td class="border head-table">
You are married to a
                           <%=country_intent_tostudy %>
                           citizen
                                     </td>
                                     <td class="border head-table second">
                                         Medium
                                     </td>
                                      <td class="border">Provide an explanation for why you are applying for a student visa instead of a spouse visa
                           .</td>
                                     
                                      <td class="border">Attach any documentary evidence that supports your explanation about why you are applying for a student visa instead of a spouse visa.</td>
                                 </tr>
                             </table>
                         </div>
                 
                     <br/></div><div id="page25_tab70" runat="server" style="display: none;">
                         <div class="table-responsive">
                             <table class="table">
                                 <tr>
                                     <th class="head-table wid">
                                         Risk factor
                                     </th>
                                     <th class="head-table">
                                         Severity of Risk
                                     </th>
                                     <th class="head-table wd"> How you could address the risk factor in your
                            <%=country_intent_tostudy %> - Statement of purpose (SOP)</th>
                                     <th>Possible supporting documents** that you could consider attaching to your application</th>
                                 </tr>
                                 <tr>
                                      <td class="border head-table">
You recently married a
                           <%=country_intent_tostudy %>
                           citizen
                                     </td>
                                       <td class="border head-table first">
                                         High
                                     </td>
                                       <td class="border">1. Provide an explanation for why you are applying for a student visa instead of a spouse visa; AND, 2. Reassure the decision-maker that your marriage is not a relationship that they should be suspicious of with regards to your student visa application
                           .</td>
                                     
                                        <td class="border">Attach any documentary evidence of your relationship with your spouse/de facto partner. This could include a certified copy of your marriage certificate, Family Book, Household Booklet or other evidence of family composition.</td>
                                 </tr>
                             </table>
                         </div>
                   
                     <br/></div><div id="page25_tab71" runat="server" style="display: none;">
                    <div class="table-responsive">
                             <table class="table">
                                 <tr>
                                   <th class="head-table wid">
                                         Risk factor
                                     </th>
                                     <th class="head-table">
                                         Severity of Risk
                                     </th>
                                     <th class="head-table wd">How you could address the risk factor in your
                            <%=country_intent_tostudy %> - Statement of purpose (SOP)</th>
                                     <th>Possible supporting documents** that you could consider attaching to your application</th>
                                 </tr>
                                 <tr>
                                    <td class="border head-table">
You have dependents under the age of 18
                                     </td>
                                       <td class="border head-table fourth">
                                         Not Applicable/Mandatory Requirement
                                     </td>
                                       <td class="border">Provide an explanation for how: 1. You have access to additional funds to support your dependents; AND, 2. What schooling arrangements you have put in place for your dependents between the ages of 5 and 18.</td>
                                     
                                        <td class="border">Attach any documentary evidence that supports your explanation about how: 1. You have access to additional funds to support your dependents; AND, 2. What schooling arrangements you have put in place for your dependents between the ages of 5 and 18.</td>
                                 </tr>
                             </table>
                         </div>
                   
                     <br/></div><div id="page25_tab72" runat="server" style="display: none;">
                         <div class="table-responsive">
                             <table class="table">
                                 <tr>
                                    <th class="head-table wid">
                                         Risk factor
                                     </th>
                                     <th class="head-table">
                                         Severity of Risk
                                     </th>
                                      <th class="head-table wd"> How you could address the risk factor in your
                            <%=country_intent_tostudy %> - Statement of purpose (SOP)</th>
                                     <th>Possible supporting documents** that you could consider attaching to your application</th>
                                 </tr>
                                 <tr>
                                      <td class="border head-table">
At the time of applying for the Student Visa you will be in
                           <%=homcountry %>
                                     </td>
                                       <td class="border head-table third">
                                       Low
                                     </td>
                                       <td class="border">Provide an explanation for how: 1. You have access to additional funds to support your dependents; AND, 2. What schooling arrangements you have put in place for your dependents between the ages of 5 and 18.</td>
                                     
                                       <td class="border">Attach any evidence of "Proof of address" with your visa application.</td>
                                 </tr>
                             </table>
                         </div>
                   
                     <br/></div><div id="page25_tab73" runat="server" style="display: none;">
                     <div class="table-responsive">
                             <table class="table">
                                 <tr>
                                     <th class="head-table wid">
                                         Risk factor
                                     </th>
                                       <th class="head-table">
                                         Severity of Risk
                                     </th>
                                       <th class="head-table wd"> How you could address the risk factor in your
                            <%=country_intent_tostudy %> - Statement of purpose (SOP)</th>
                                     <th>Possible supporting documents** that you could consider attaching to your application</th>
                                 </tr>
                                 <tr>
                                     <td class="border head-table">
  At the time of applying for the Student Visa you will not be in
                           <%=homcountry %>
                                     </td>
                                     <td class="border head-table third">
                                       Low
                                     </td>
                                     <td class="border">Provide an explanation for why you will not be in
                           <%=homcountry %>
                           and state which country you will be in when you apply for your student visa.</td>
                                     
                                    <td class="border">Attach any documentary evidence that supports your explanation about why you will not be in
                           <%=homcountry %>
                           and state which country you will be in when you apply for your student visa.</td>
                                 </tr>
                             </table>
                         </div>
                     
                     <br/></div><div id="page25_tab74" runat="server" style="display: none;">
                     <div class="table-responsive">
                             <table class="table">
                                 <tr>
                                      <th class="head-table wid">
                                         Risk factor
                                     </th>
                                      <th class="head-table">
                                         Severity of Risk
                                     </th>
                                     <th class="head-table wd"> How you could address the risk factor in your
                            <%=country_intent_tostudy %> - Statement of purpose (SOP)</th>
                                     <th>Possible supporting documents** that you could consider attaching to your application</th>
                                 </tr>
                                 <tr>
                                     <td class="border head-table">
 At the time of applying for the Student Visa you will be in
                           <%=country_intent_tostudy %>
                                     </td>
                                      <td class="border head-table third">
                                       Low
                                     </td>
                                       <td class="border"> Provide details of your current visa that permits you be in
                           <%=country_intent_tostudy %>
                           at the time of your visa application.</td>
                                     
                                       <td class="border">Attach any documentary evidence with details of your current visa that permits you be in
                           <%=country_intent_tostudy %>
                           at the time of your visa application.</td>
                                 </tr>
                             </table>
                         </div>
                   
                     <br/></div><div id="page25_tab75" runat="server" style="display: none;">
                     <div class="table-responsive">
                             <table class="table">
                                 <tr>
                                    <th class="head-table wid">
                                         Risk factor
                                     </th>
                                      <th class="head-table">
                                         Severity of Risk
                                     </th>
                                    <th class="head-table wd"> How you could address the risk factor in your
                            <%=country_intent_tostudy %> - Statement of purpose (SOP)</th>
                                     <th>Possible supporting documents** that you could consider attaching to your application</th>
                                 </tr>
                                 <tr>
                                   <td class="border head-table">
 You have travelled  to
                           <%=country_intent_tostudy %>
                           before
                                     </td>
                                     <td class="border head-table third">
                                       Low
                                     </td>
                                      <td class="border">Provide details of your previous visit(s) to
                           <%=country_intent_tostudy %>
                           . For example: date(s) of arrival; date(s) of departure; purpose of travel; and visa type and details.</td>
                                     
                                     <td class="border">Attach any documentary evidence that supports your explanation about your previous visit(s) to
                           <%=country_intent_tostudy %>
                           .</td>
                                 </tr>
                             </table>
                         </div>
                     
                     <br/></div><div id="page25_tab76" runat="server" style="display: none;">
                           <div class="table-responsive">
                             <table class="table">
                                 <tr>
                                       <th class="head-table wid">
                                         Risk factor
                                     </th>
                                     <th class="head-table">
                                         Severity of Risk
                                     </th>
                                     <th class="head-table wd"> How you could address the risk factor in your
                            <%=country_intent_tostudy %> - Statement of purpose (SOP)</th>
                                     <th>Possible supporting documents** that you could consider attaching to your application</th>
                                 </tr>
                                 <tr>
                                     <td class="border head-table">
 You said that you have had one or more visa applications to travel to any foreign country refused or rejected before
                                     </td>
                                     <td class="border head-table second">
                                       Medium
                                     </td>
                                     <td class="border">Be transparent about your previous visa refusal(s) by providing an explanation for why your previous visa applicaions were rejected and reassure the decision-maker how and why this student visa application is different from your previous applications.</td>
                                     
                                      <td class="border">Attach any documentary evidence that supports your explanation about why your previous visa application(s) was/were rejected
                           .</td>
                                 </tr>
                             </table>
                         </div>
                   
                     <br/></div><div id="page25_tab77" runat="server" style="display: none;">
                     <div class="table-responsive">
                             <table class="table">
                                 <tr>
                                     <th class="head-table wid">
                                         Risk factor
                                     </th>
                                    <th class="head-table">
                                         Severity of Risk
                                     </th>
                                     <th class="head-table wd"> How you could address the risk factor in your
                            <%=country_intent_tostudy %> - Statement of purpose (SOP)</th>
                                     <th>Possible supporting documents** that you could consider attaching to your application</th>
                                 </tr>
                                 <tr>
                                      <td class="border head-table">
You have never travelled to any foreign country before
                                     </td>
                                      <td class="border head-table third">
                                       Low
                                     </td>
                                       <td class="border"> Reassure the decision-maker that you have an accurate understanding of visa requirements, visa conditions and life in
                           <%=country_intent_tostudy %>
                           . It must be clear that you made an informed decision when you decided to study at
                           <%=universityname %></td>
                                     
                                      <td class="border">Attach any documentary evidence that supports your explanation about your level of knowledge and understanding. For example, your GTE Direct Certificate of Understanding (COU)
                           .</td>
                                 </tr>
                             </table>
                         </div>
                   
                     <br/></div><div id="page25_tab78" runat="server" style="display: none;">
                       <div class="table-responsive">
                             <table class="table">
                                 <tr>
                                    <th class="head-table wid">
                                         Risk factor
                                     </th>
                                      <th class="head-table">
                                         Severity of Risk
                                     </th>
                                     <th class="head-table wd">  How you could address the risk factor in your
                            <%=country_intent_tostudy %> - Statement of purpose (SOP)</th>
                                     <th>Possible supporting documents** that you could consider attaching to your application</th>
                                 </tr>
                                 <tr>
                                      <td class="border head-table">
You have been deported from a foreign country before
                                     </td>
                                      <td class="border head-table first">
                                       High
                                     </td>
                                      <td class="border"> Be transparent about your previous deportation by providing an explanation for why you were deported, and reassure the decision-maker how and why you will comply with the student visa requirements and conditions if granted a visa to study in
                           <%=country_intent_tostudy %></td>
                                     
                                      <td class="border">Attach any documentary evidence that supports your explanation about why you were deported
                           .</td>
                                 </tr>
                             </table>
                         </div>
                   
                     <br/></div><div id="page25_tab79" runat="server" style="display: none;">
                          <div class="table-responsive">
                             <table class="table">
                                 <tr>
                                    <th class="head-table wid">
                                         Risk factor
                                     </th>
                                      <th class="head-table">
                                         Severity of Risk
                                     </th>
                                    <th class="head-table wd">How you could address the risk factor in your
                            <%=country_intent_tostudy %> - Statement of purpose (SOP)</th>
                                     <th>Possible supporting documents** that you could consider attaching to your application</th>
                                 </tr>
                                 <tr>
                                     <td class="border head-table">
You said that you have not always complied with the visa conditions of your previous visas
                                     </td>
                                      <td class="border head-table second">
                                       Medium
                                     </td>
                                      <td class="border"> 1. Provide an explanation for why  you have previously not complied with the visa conditions of your previous visas; AND, 2. Reassure the decision-maker how and why you will comply with the student visa requirements and conditions if granted a visa to study in
                           <%=country_intent_tostudy %></td>
                                     
                                       <td class="border">Attach any documentary evidence that supports your explanation about why you have previously not complied with the visa conditions of your previous visas
                           .</td>
                                 </tr>
                             </table>
                         </div>
                   
                     <br/></div><div id="page25_tab80" runat="server" style="display: none;">
                    <div class="table-responsive">
                             <table class="table">
                                 <tr>
                                        <th class="head-table wid">
                                         Risk factor
                                     </th>
                                      <th class="head-table">
                                         Severity of Risk
                                     </th>
                                      <th class="head-table wd"> How you could address the risk factor in your
                            <%=country_intent_tostudy %> - Statement of purpose (SOP)</th>
                                     <th>Possible supporting documents** that you could consider attaching to your application</th>
                                 </tr>
                                 <tr>
                                       <td class="border head-table">
You said that a previous visa that you had was considered for cancellation
                                     </td>
                                      <td class="border head-table third">
                                       Low
                                     </td>
                                       <td class="border">   1. Provide an explanation for why  your  previous visa was considered for cancellation; AND, 2. Reassure the decision-maker how and why you will comply with the student visa requirements and conditions if granted a visa to study in
                           <%=country_intent_tostudy %></td>
                                     
                                      <td class="border">Attach any documentary evidence that supports your explanation about why your  previous visa was considered for cancellation and the outcome of that investigation/consideration.
                           .</td>
                                 </tr>
                             </table>
                         </div>
                     
                     <br/></div><div id="page25_tab81" runat="server" style="display: none;">
                     <div class="table-responsive">
                             <table class="table">
                                 <tr>
                                      <th class="head-table wid">
                                         Risk factor
                                     </th>
                                     <th class="head-table">
                                         Severity of Risk
                                     </th>
                                     <th class="head-table wd"> How you could address the risk factor in your
                            <%=country_intent_tostudy %> - Statement of purpose (SOP)</th>
                                     <th>Possible supporting documents** that you could consider attaching to your application</th>
                                 </tr>
                                 <tr>
                                    <td class="border head-table">
You said that you have previously over-stayed beyond the expiry date of a visa in a country
                                     </td>
                                   <td class="border head-table first">
                                       High
                                     </td>
                                     <td class="border"> 1. Provide an explanation for why  you either did not leave the country, or, why you did not apply to extend or renew your  previous visa before the visa expired; AND, 2. Reassure the decision-maker how and why you will comply with the student visa requirements and conditions if granted a visa to study in
                           <%=country_intent_tostudy %></td>
                                     
                                    <td class="border">Attach any documentary evidence that supports your explanation about why you have previously over-stayed beyond the expiry date of a visa in a country.
                           .</td>
                                 </tr>
                             </table>
                         </div>
                   
                     <br/></div><div id="page25_tab82" runat="server" style="display: none;">
                        <div class="table-responsive">
                             <table class="table">
                                 <tr>
                                    <th class="head-table wid">
                                         Risk factor
                                     </th>
                                     <th class="head-table">
                                         Severity of Risk
                                     </th>
                                     <th class="head-table wd">How you could address the risk factor in your
                            <%=country_intent_tostudy %> - Statement of purpose (SOP)</th>
                                     <th>Possible supporting documents** that you could consider attaching to your application</th>
                                 </tr>
                                 <tr>
                                    <td class="border head-table">
You said that a previous visa that you had was cancelled
                                     </td>
                                      <td class="border head-table second">
                                       Medium
                                     </td>
                                     <td class="border">   1. Provide an explanation for why a previous visa that you had was cancelled; AND, 2. Reassure the decision-maker that your behaviour will not be a cause for concern for the authorities and communities in
                           <%=country_intent_tostudy %>
                           .</td>
                                     
                                      <td class="border">Attach any documentary evidence that supports your explanation about why a previous visa that you had was cancelled
                           .</td>
                                 </tr>
                             </table>
                         </div>
                   
                     <br/></div><div id="page25_tab83" runat="server" style="display: none;">
                          <div class="table-responsive">
                             <table class="table">
                                 <tr>
                                      <th class="head-table wid">
                                         Risk factor
                                     </th>
                                    <th class="head-table">
                                         Severity of Risk
                                     </th>
                                    <th class="head-table wd">How you could address the risk factor in your
                            <%=country_intent_tostudy %> - Statement of purpose (SOP)</th>
                                     <th>Possible supporting documents** that you could consider attaching to your application</th>
                                 </tr>
                                 <tr>
                                     <td class="border head-table">
You said that you have been charged with a criminal offence that is currently awaiting legal action
                                     </td>
                                     <td class="border head-table first">
                                       High
                                     </td>
                                    <td class="border">  Be transparent about the criminal offence you have been charged with by stating: 1. The nature of the offence you have been charged with; AND, 2. Full details of when court case/trial will be conducted.
                           .</td>
                                     
                                     <td class="border">Attach any documentary evidence that supports your explanation about  the criminal offence charge that is currently awaiting legal action
                           .</td>
                                 </tr>
                             </table>
                         </div>
                   
                     <br/></div><div id="page25_tab84" runat="server" style="display: none;">
                          <div class="table-responsive">
                             <table class="table">
                                 <tr>
                                    <th class="head-table wid">
                                         Risk factor
                                     </th>
                                     <th class="head-table">
                                         Severity of Risk
                                     </th>
                                     <th class="head-table wd">How you could address the risk factor in your
                            <%=country_intent_tostudy %> - Statement of purpose (SOP)</th>
                                     <th>Possible supporting documents** that you could consider attaching to your application</th>
                                 </tr>
                                 <tr>
                                       <td class="border head-table">
You said that you have previously been convicted of a criminal offence
                                     </td>
                                    <td class="border head-table first">
                                       High
                                     </td>
                                     <td class="border">Be transparent about the criminal offence you have been convicted of by stating: 1. The nature of the offence; AND, 2. Full details of the sentence; AND, 3.The dates of any period of imprisonment or other detention; AND, 4. Reassure the decision-maker that your behaviour will not be a cause for concern for the authorities and communities in
                           <%=country_intent_tostudy %>
                           .</td>
                                     
                                    <td class="border">Attach any documentary evidence that supports your disclosure of the criminal offence you have been convicted of
                           .</td>
                                 </tr>
                             </table>
                         </div>
                   
                     <br/></div><div id="page25_tab85" runat="server" style="display: none;">
                      <div class="table-responsive">
                             <table class="table">
                                 <tr>
                                     <th class="head-table wid">
                                         Risk factor
                                     </th>
                                      <th class="head-table">
                                         Severity of Risk
                                     </th>
                                     <th class="head-table wd">How you could address the risk factor in your
                            <%=country_intent_tostudy %> - Statement of purpose (SOP)</th>
                                     <th>Possible supporting documents** that you could consider attaching to your application</th>
                                 </tr>
                                 <tr>
                                     <td class="border head-table">
You said that you have been the subject of an arrest warrant or Interpol notice
                                     </td>
                                     <td class="border head-table first">
                                       High
                                     </td>
                                     <td class="border"> Be transparent about the arrest warrant or Interpol notice that was issued against you by stating: 1. The reason for the arrest warrant or Interpol notice; AND, 2. The outcome of the arrest warrant or Interpol notice; AND, 3.The dates of any period of imprisonment or other detention; AND, 4. Reassure the decision-maker that your behaviour will not be a cause for concern for the authorities and communities in
                           <%=country_intent_tostudy %>
                           .</td>
                                     
                                     <td class="border">Attach any documentary evidence that supports your disclosure of the arrest warrant or Interpol notice that was issued against you.
                           .</td>
                                 </tr>
                             </table>
                         </div>
                   
                     <br/></div><div id="page25_tab85_1" runat="server" style="display: none;">
                        <div class="table-responsive">
                             <table class="table">
                                 <tr>
                                       <th class="head-table wid">
                                         Risk factor
                                     </th>
                                      <th class="head-table">
                                         Severity of Risk
                                     </th>
                                      <th class="head-table wd"> How you could address the risk factor in your
                            <%=country_intent_tostudy %> - Statement of purpose (SOP)</th>
                                     <th>Possible supporting documents** that you could consider attaching to your application</th>
                                 </tr>
                                 <tr>
                                     <td class="border head-table">
You said that you have been found guilty of a sexually-based offence involving a child
                                     </td>
                                     <td class="border head-table first">
                                       High
                                     </td>
                                    <td class="border"> Be transparent about the sexually-based offence involving a child by stating: 1. The nature of the offence; AND, 2. Full details of the sentence; AND, 3.The dates of any period of imprisonment or other detention/penalty; AND, 4. Reassure the decision-maker that your behaviour will not be a cause for concern for the authorities and communities in
                           <%=country_intent_tostudy %>
                           .</td>
                                     
                                     <td class="border">Attach any documentary evidence that supports your disclosure of the sexually-based offence involving a child.</td>
                                 </tr>
                             </table>
                         </div>
                 
                     <br/></div><div id="page25_tab86" runat="server" style="display: none;">
                      <div class="table-responsive">
                             <table class="table">
                                 <tr>
                                        <th class="head-table wid">
                                         Risk factor
                                     </th>
                                       <th class="head-table">
                                         Severity of Risk
                                     </th>
                                       <th class="head-table wd"> How you could address the risk factor in your
                            <%=country_intent_tostudy %> - Statement of purpose (SOP)</th>
                                     <th>Possible supporting documents** that you could consider attaching to your application</th>
                                 </tr>
                                 <tr>
                                     <td class="border head-table">
You said that you have been acquitted of an offence on the grounds of unsoundness of mind or insanity
                                     </td>
                                      <td class="border head-table first">
                                       High
                                     </td>
                                      <td class="border"> Be transparent about being acquitted of an offence on the grounds of unsoundness of mind or insanity by stating: 1. The nature of the offence you were charged with; AND, 2. Full details of the acquital; AND, 3.The dates of when this matter was being tried in a court of law; AND, 4. Reassure the decision-maker that your behaviour will not be a cause for concern for the authorities and communities in
                           <%=country_intent_tostudy %>
                           .</td>
                                     
                                       <td class="border">Attach any documentary evidence that supports your disclosure of  being acquitted of an offence on the grounds of unsoundness of mind or insanity.</td>
                                 </tr>
                             </table>
                         </div>
               
                     <br/></div><div id="page25_tab87" runat="server" style="display: none;">
                         <div class="table-responsive">
                             <table class="table">
                                 <tr>
                                     <th class="head-table wid">
                                         Risk factor
                                     </th>
                                      <th class="head-table">
                                         Severity of Risk
                                     </th>
                                     <th class="head-table wd"> How you could address the risk factor in your
                            <%=country_intent_tostudy %> - Statement of purpose (SOP)</th>
                                     <th>Possible supporting documents** that you could consider attaching to your application</th>
                                 </tr>
                                 <tr>
                                   <td class="border head-table">
 You said that you have been directly or indirectly involved in,  or associated with, activities which would represent a risk to the national security in
                           <%=country_intent_tostudy %>
                           or any other country
                                     </td>
                                     <td class="border head-table first">
                                       High
                                     </td>
                                    <td class="border"> Be transparent about the activities which would represent a risk to the national security in
                           <%=country_intent_tostudy %>
                           or any other country by stating: 1. The nature of the activities that you have been directly or indirectly involved with; AND, 2. Full details of any sentence; AND, 3.The dates of any period of imprisonment or other detention; AND, 4. Reassure the decision-maker that your behaviour will not be a cause for concern for the authorities and communities in
                           <%=country_intent_tostudy %>
                           .</td>
                                     
                                    <td class="border">Attach any documentary evidence that supports your disclosure of the activities that you have been directly or indirectly involved with, which would represent a risk to the national security in
                           <%=country_intent_tostudy %></td>
                                 </tr>
                             </table>
                         </div>
                 
                     <<br/></div><div id="page25_tab88" runat="server" style="display: none;">
                      <div class="table-responsive">
                             <table class="table">
                                 <tr>
                                   <th class="head-table wid">
                                         Risk factor
                                     </th>
                                    <th class="head-table">
                                         Severity of Risk
                                     </th>
                                     <th class="head-table wd"> How you could address the risk factor in your
                            <%=country_intent_tostudy %> - Statement of purpose (SOP)</th>
                                     <th>Possible supporting documents** that you could consider attaching to your application</th>
                                 </tr>
                                 <tr>
                                     <td class="border head-table">
 You said that you have been charged with, or indicted for, genocide, war crimes, crimes against humanity, torture, slavery, or any other crime that is otherwise of a serious international concern
                                     </td>
                               <td class="border head-table first">
                                       High
                                     </td>
                                     <td class="border">  Be transparent about the crime of serious international concern that you have been charged with, or indicted for by stating: 1. The nature of the crime; AND, 2. Full details of any sentence; AND, 3.The dates of any period of imprisonment or other detention; AND, 4. Reassure the decision-maker that your behaviour will not be a cause for concern for the authorities and communities in
                           <%=country_intent_tostudy %>
                           .</td>
                                     
                                      <td class="border">Attach any documentary evidence that supports your disclosure of the crime(s) of serious international concern that you have been charged with, or indicted for.</td>
                                 </tr>
                             </table>
                         </div>
             
                    <br/></div><div id="page25_tab89" runat="server" style="display: none;">
                         <div class="table-responsive">
                             <table class="table">
                                 <tr>
                                     <th class="head-table wid">
                                         Risk factor
                                     </th>
                                    <th class="head-table">
                                         Severity of Risk
                                     </th>
                                    <th class="head-table wd">How you could address the risk factor in your
                            <%=country_intent_tostudy %> - Statement of purpose (SOP)</th>
                                     <th>Possible supporting documents** that you could consider attaching to your application</th>
                                 </tr>
                                 <tr>
                                     <td class="border head-table">
 You said that you have been associated with a person, group or organisation that has been/is involved in criminal conduct
                                     </td>
                                     <td class="border head-table first">
                                       High
                                     </td>
                                    <td class="border">   Be transparent about the person, group or organisation that has been/is involved in criminal conduct that you have been associated with by stating: 1. The name of the person, group or organisation; AND, 2. The nature of the criminal activity they were involved in; AND, 3.The nature of your association with this person, group or organisation; AND, 4. Reassure the decision-maker that your behaviour will not be a cause for concern for the authorities and communities in
                           <%=country_intent_tostudy %>
                           .</td>
                                     
                                     <td class="border"> Attach any documentary evidence that supports your disclosure of the criminal offence you have been convicted of</td>
                                 </tr>
                             </table>
                         </div>
                   
                     <br/></div><div id="page25_tab90" runat="server" style="display: none;">
                         <div class="table-responsive">
                             <table class="table">
                                 <tr>
                                    <th class="head-table wid">
                                         Risk factor
                                     </th>
                                     <th class="head-table">
                                         Severity of Risk
                                     </th>
                                     <th class="head-table wd">How you could address the risk factor in your
                            <%=country_intent_tostudy %> - Statement of purpose (SOP)</th>
                                     <th>Possible supporting documents** that you could consider attaching to your application</th>
                                 </tr>
                                 <tr>
                                       <td class="border head-table">
 You said that you have been associated with an organisation engaged in violence or engaged in acts of violence (including war, insurgency, freedom fighting, terrorism, protest) either overseas or in
                           <%=country_intent_tostudy %>
                                     </td>
                                       <td class="border head-table first">
                                       High
                                     </td>
                                       <td class="border"> Be transparent about the organisation that has been/is engaged in acts of violence you have been associated with by stating: 1. The name of the person, group or organisation; AND, 2. The nature of the violent activity they are involved in; AND, 3.The nature of your association with this person, group or organisation; AND, 4. Reassure the decision-maker that your behaviour will not be a cause for concern for the authorities and communities in
                           <%=country_intent_tostudy %>
                           .</td>
                                     
                                        <td class="border">Attach any documentary evidence that supports your disclosure of the organisation engaged in violence or engaged in acts of violence that you have been associated with</td>
                                 </tr>
                             </table>
                         </div>
                     
                    <br/></div><div id="page25_tab981" runat="server" style="display: none;">
                         <div class="table-responsive">
                             <table class="table">
                                 <tr>
                                     <th class="head-table wid">
                                         Risk factor
                                     </th>
                                      <th class="head-table">
                                         Severity of Risk
                                     </th>
                                      <th class="head-table wd"> How you could address the risk factor in your
                            <%=country_intent_tostudy %> - Statement of purpose (SOP)</th>
                                     <th>Possible supporting documents** that you could consider attaching to your application</th>
                                 </tr>
                                 <tr>
                                    <td class="border head-table">
 You said that you have served in a military force, police force, state sponsored/private militia or intelligence agency (including secret police)
                                     </td>
                                     <td class="border head-table first">
                                       High
                                     </td>
                                     <td class="border"> Provide details of the military force, police force, state sponsored/private militia or intelligence agency that you served in.
                           .</td>
                                     
                                      <td class="border"> Attach any documentary evidence that supports your disclosure of your service in the military, police, militia or intelligence agency.</td>
                                 </tr>
                             </table>
                         </div>
                 
                    <br/></div><div id="page25_tab92" runat="server" style="display: none;">
                     <div class="table-responsive">
                             <table class="table">
                                 <tr>
                                     <th class="head-table wid">
                                         Risk factor
                                     </th>
                                    <th class="head-table">
                                         Severity of Risk
                                     </th>
                                    <th class="head-table wd"> How you could address the risk factor in your
                            <%=country_intent_tostudy %> - Statement of purpose (SOP)</th>
                                     <th>Possible supporting documents** that you could consider attaching to your application</th>
                                 </tr>
                                 <tr>
                                    <td class="border head-table">
You said that you have either undergone military/paramilitary training, or been trained in weapons/explosives or in the manufacture of chemical/biological products
                                     </td>
                                   <td class="border head-table first">
                                       High
                                     </td>
                                      <td class="border">  1. Provide details of the nature of the training that you have undergone; AND, 2. Reassure the decision-maker that your behaviour will not be a cause for concern for the authorities and communities in
                           <%=country_intent_tostudy %></td>
                                     
                                      <td class="border"> Attach any documentary evidence that supports your disclosure of your training in military/paramilitary, or in weapons/explosives or in the manufacture of chemical/biological products.</td>
                                 </tr>
                             </table>
                         </div>
                   
                     <br/></div><div id="page25_tab93" runat="server" style="display: none;">
                    <div class="table-responsive">
                             <table class="table">
                                 <tr>
                                   <th class="head-table wid">
                                         Risk factor
                                     </th>
                                   <th class="head-table">
                                         Severity of Risk
                                     </th>
                                    <th class="head-table wd"> How you could address the risk factor in your
                            <%=country_intent_tostudy %> - Statement of purpose (SOP)</th>
                                     <th>Possible supporting documents** that you could consider attaching to your application</th>
                                 </tr>
                                 <tr>
                                     <td class="border head-table">
You said that you have been involved in people smuggling or people trafficking offences
                                     </td>
                                      <td class="border head-table first">
                                       High
                                     </td>
                                      <td class="border"> Be transparent about the people smuggling or people trafficking offences that you have been involved in by stating: 1. The nature of the offences; AND, 2. Full details of any sentence received; AND, 3.The dates of any period of imprisonment or other detention; AND, 4. Reassure the decision-maker that your behaviour will not be a cause for concern for the authorities and communities in
                           <%=country_intent_tostudy %></td>
                                     
                                      <td class="border"> Attach any documentary evidence that supports your disclosure of the people smuggling or people trafficking offences that you have been involved in</td>
                                 </tr>
                             </table>
                         </div>
                   
                   
                     <br/></div><div id="page25_tab94" runat="server" style="display: none;">
                      <div class="table-responsive">
                             <table class="table">
                                 <tr>
                                       <th class="head-table wid">
                                         Risk factor
                                     </th>
                                      <th class="head-table">
                                         Severity of Risk
                                     </th>
                                    <th class="head-table wd"> How you could address the risk factor in your
                            <%=country_intent_tostudy %> - Statement of purpose (SOP)</th>
                                     <th>Possible supporting documents** that you could consider attaching to your application</th>
                                 </tr>
                                 <tr>
                                      <td class="border head-table">
You said that you have outstanding debts to the Government of
                           <%=country_intent_tostudy %>
                           or other public authority in
                           <%=country_intent_tostudy %>
                                     </td>
                                     <td class="border head-table first">
                                       High
                                     </td>
                                     <td class="border"> Provide information about the amount of money owed; how and when the debt was incurred; and when the debt will be repaid</td>
                                     
                                   <td class="border"> Attach any documentary evidence that supports your disclosure of the outstanding debts to the Government of
                           <%=country_intent_tostudy %>
                           or other public authority in
                           <%=country_intent_tostudy %></td>
                                 </tr>
                             </table>
                         </div>
                     
                     <br/></div><div id="page25_tab95" runat="server" style="display: none;">
                             <div class="table-responsive">
                             <table class="table">
                                 <tr>
                                      <th class="head-table wid">
                                         Risk factor
                                     </th>
                                    <th class="head-table">
                                         Severity of Risk
                                     </th>
                                      <th class="head-table">Counsellor Comments and Remarks</th>
                                   
                                 </tr>
                                 <tr>
                                    <td class="border head-table">
 You said that, in addition to
                           <%=universityname %>
                           , you have also applied to study at other educational institutions in
                           <%=country_intent_tostudy %>
                                     </td>
                                     <td class="border head-table third">
                                       Low
                                     </td>
                                    <td class="border">When evaluating your offers to determine which one you will accept, make sure that you accept the offer that you will commit to for the entire duration of your course(s). Bear in mind that if there are subsequent visa applications that you will submit in future, the decision-makers will consider your behaviour in this visa to determine whether or not you are a genuine applicant. So, you do not want to have a track record of moving from one education institution to another, particularly before completing the course(s) that you committed to when accepting your offer letter.</td>
                                     
                                   
                                 </tr>
                             </table>
                         </div>
               
                     <br/></div><div id="page25_tab96" runat="server" style="display: none;">
                         <div class="table-responsive">
                             <table class="table">
                                 <tr>
                                     <th class="head-table wid">
                                         Risk factor
                                     </th>
                                       <th class="head-table">
                                         Severity of Risk
                                     </th>
                                      <th class="head-table"> Counsellor Comments and Remarks</th>
                                   
                                 </tr>
                                 <tr>
                                   <td class="border head-table">
 You said that, if before completing your course, you are offered a full time job in
                           <%=country_intent_tostudy %>
                           , you will take it up, and drop out from your course
                                     </td>
                                    <td class="border head-table second">
                                       Medium
                                     </td>
                                    <td class="border">Remember that the primary purpose for the student visa is to give you access to study in
                           <%=country_intent_tostudy %>
                           . There will be plenty of time to work after you have successfully completed your study. If a decision-maker suspects that you are applying for this student visa for any other outcomes other than study outcomes, he or she is likely to reject your application on the basis of them suspecting you to be a non-genuine student and a non-genuine temporary entrant. Also bear in mind that if there are subsequent visa applications that you will submit in future, the decision-makers will consider your behaviour in this visa to determine whether or not you are a genuine applicant. So, you do not want to have a track record of not completing your studies or not complying with your visa conditions, particularly before completing the course(s) that you committed to when accepting your offer letter.</td>
                                     
                                   
                                 </tr>
                             </table>
                         </div>
                   
                     <br/></div><div id="page25_tab97" runat="server" style="display: none;">
                      <div class="table-responsive">
                             <table class="table">
                                 <tr>
                                      <th class="head-table wid">
                                         Risk factor
                                     </th>
                                      <th class="head-table">
                                         Severity of Risk
                                     </th>
                                      <th class="head-table">Counsellor Comments and Remarks</th>
                                   
                                 </tr>
                                 <tr>
                                      <td class="border head-table">
  You said that, if before completing your course, you are offered a full time job in
                           <%=country_intent_tostudy %>
                           , you will take it up, and study part-time
                                     </td>
                                    <td class="border head-table second">
                                       Medium
                                     </td>
                                     <td class="border"> Remember that it is a condition of the student visa that you must be enrolled in a full-time approved course of study in
                           <%=country_intent_tostudy %>
                           . There will be plenty of time to work full-time after you have successfully completed your study. If a decision-maker suspects that you are applying for this student visa for any other outcomes other than study outcomes, he or she is likely to reject your application on the basis of them suspecting you to be a non-genuine student and a non-genuine temporary entrant. Also bear in mind that if there are subsequent visa applications that you will submit in future, the decision-makers will consider your behaviour in this visa to determine whether or not you are a genuine applicant. So, you do not want to have a track record of not completing your studies or not complying with your visa conditions, particularly before completing the course(s) that you committed to when accepting your offer letter.</td>
                                     
                                   
                                 </tr>
                             </table>
                         </div>
                     
                     <br/></div><div id="page25_tab98" runat="server" style="display: none;">
                     <div class="table-responsive">
                             <table class="table">
                                 <tr>
                                           <th class="head-table wid">
                                         Risk factor
                                     </th>
                                    <th class="head-table">
                                         Severity of Risk
                                     </th>
                                     <th class="head-table"> Counsellor Comments and Remarks</th>
                                   
                                 </tr>
                                 <tr>
                                   <td class="border head-table">
  You said that, after starting your course, you will continue to look for more cost-effective course options and switch to other Educational Institution which allow you to save costs
                                     </td>
                                    <td class="border head-table second">
                                       Medium
                                     </td>
                                     <td class="border">It is not uncommon if life that we often get what we pay for! Chasing one "bargain"after the next could ultimately be very detrimental to the success of your outcomes. When evaluating your offers to determine which one you will accept, make sure that you accept the offer that you will commit to for the entire duration of your course(s). Bear in mind that if there are subsequent visa applications that you will submit in future, the decision-makers will consider your behaviour in this visa to determine whether or not you are a genuine applicant. So, you do not want to have a track record of moving from one education institution to another, particularly before completing the course(s) that you committed to when accepting your offer letter.</td>
                                     
                                   
                                 </tr>
                             </table>
                         </div>
                   
                     <br/></div><div id="page25_tab99" runat="server" style="display: none;">
                     <div class="table-responsive">
                             <table class="table">
                                 <tr>
                                    <th class="head-table wid">
                                         Risk factor
                                     </th>
                                    <th class="head-table">
                                         Severity of Risk
                                     </th>
                                  <th class="head-table"> Counsellor Comments and Remarks</th>
                                   
                                 </tr>
                                 <tr>
                                 <td class="border head-table">
You said that, once you get your Student Visa, you intend to change Educational Institutions
                                     </td>
                                      <td class="border head-table first">
                                       High
                                     </td>
                                   <td class="border">When evaluating your offers to determine which one you will accept, make sure that you accept the offer that you will commit to for the entire duration of your course(s). Bear in mind that if there are subsequent visa applications that you will submit in future, the decision-makers will consider your behaviour in this visa to determine whether or not you are a genuine applicant. So, you do not want to have a track record of moving from one education institution to another, particularly before completing the course(s) that you committed to when accepting your offer letter.</td>
                                     
                                   
                                 </tr>
                             </table>
                         </div>
                 
                     <br/></div><div id="page25_tab100" runat="server" style="display: none;">
                      <div class="table-responsive">
                             <table class="table">
                                 <tr>
                                  <th class="head-table wid">
                                         Risk factor
                                     </th>
                                   <th class="head-table">
                                         Severity of Risk
                                     </th>
                                   <th class="head-table">Counsellor Comments and Remarks</th>
                                   
                                 </tr>
                                 <tr>
                                        <td class="border head-table">
You have not undertaken the GTE Direct Certification Test
                                     </td>
                                          <td class="border head-table first">
                                       High
                                     </td>
                                          <td class="border">The GTE Direct Certificate of Undertanding (COU) is an official document that attests to the level of awareness, knowledge and understanding of the Genuine Student (GS) and Genuine Temporary Entrant (GTE) criteria that the certificate-holder has. The reason why this certificate is important is because if the decision-maker is confident about your level and accuracy of your understanding of the visa reqiuirements and conditions, he or she will be reassured that you will be less likely to be non-compliant due to ignorance or lack of understanding. To find out about how you can undertake your GTE Direct Certification Test, please contact the GTE Direct Support team whose contact details are published at the end of this report.</td>
                                     
                                   
                                 </tr>
                             </table>
                         </div>
                   
                     <br/></div><div id="page25_tab101" runat="server" style="display: none;">
                        <div class="table-responsive">
                             <table class="table">
                                 <tr>
                                    <th class="head-table wid">
                                         Risk factor
                                     </th>
                                   <th class="head-table">
                                         Severity of Risk
                                     </th>
                                     <th class="head-table">Counsellor Comments and Remarks</th>
                                   
                                 </tr>
                                 <tr>
                                      <td class="border head-table">
You have undertaken the GTE Direct Certification Test and your grade was "Fair (60-69%)"
                                     </td>
                                      <td class="border head-table third">
                                       Low
                                     </td>
                                       <td class="border">The "Fair (60-69%)" grade in your GTE Direct Certificate of Understanding indicates that you have some inaccuracies and misunderstandings about the visa requirements and conditions. This means that the decision-maker is not likely to be confident about your level and accuracy of your understanding of the visa reqiuirements and conditions. In other words, he or she will believe that you will be less likely to be compliant due to ignorance or lack of understanding. To find out about how you can undertake another GTE Direct Certification Test, please contact the GTE Direct Support team whose contact details are published at the end of this report.</td>
                                     
                                   
                                 </tr>
                             </table>
                         </div>
                     
                     <br/></div><div id="page25_tab102" runat="server" style="display: none;">
                        <div class="table-responsive">
                             <table class="table">
                                 <tr>
                                      <th class="head-table wid">
                                         Risk factor
                                     </th>
                                   <th class="head-table">
                                         Severity of Risk
                                     </th>
                                   <th class="head-table"> Counsellor Comments and Remarks</th>
                                   
                                 </tr>
                                 <tr>
                                      <td class="border head-table">
You have undertaken the GTE Direct Certification Test and your grade was  "Partial (50-59%)"
                                     </td>
                                   <td class="border head-table second">
                                       Medium
                                     </td>
                                      <td class="border">The "Partial (50-59%)" grade in your GTE Direct Certificate of Understanding indicates that you you likely to make many mistakes concerning the visa requirements and conditions. This means that the decision-maker is not going to be confident about your level and accuracy of your understanding of the visa reqiuirements and conditions. In other words, he or she will believe that you will be likely to be non-compliant due to ignorance or lack of understanding. To find out about how you can undertake another GTE Direct Certification Test, please contact the GTE Direct Support team whose contact details are published at the end of this report.</td>
                                     
                                   
                                 </tr>
                             </table>
                         </div>
                   
                     <br/></div><div id="page25_tab103" runat="server" style="display: none;">
                       <div class="table-responsive">
                             <table class="table">
                                 <tr>
                                     <th class="head-table wid">
                                         Risk factor
                                     </th>
                                      <th class="head-table">
                                         Severity of Risk
                                     </th>
                                    <th class="head-table">  Counsellor Comments and Remarks</th>
                                   
                                 </tr>
                                 <tr>
                                     <td class="border head-table">
You have undertaken the GTE Direct Certification Test and your grade was "Inadequate (40-49%)"
                                     </td>
                                   <td class="border head-table first">
                                       High
                                     </td>
                                  <td class="border">The "Inadequate (40-49%)" grade in your GTE Direct Certificate of Understanding indicates that you have frequent problems understanding the overall meaning of the visa requirements and conditions. This means that the decision-maker is not going to be confident about your level and accuracy of your understanding of the visa reqiuirements and conditions. In other words, he or she will believe that you will be a high risk of non-compliance due to ignorance or lack of understanding. To find out about how you can undertake another GTE Direct Certification Test, please contact the GTE Direct Support team whose contact details are published at the end of this report.</td>
                                     
                                   
                                 </tr>
                             </table>
                         </div>
                 
                     <br/></div><div id="page25_tab104" runat="server" style="display: none;">
                     <div class="table-responsive">
                             <table class="table">
                                 <tr>
                                         <th class="head-table wid">
                                         Risk factor
                                     </th>
                                      <th class="head-table">
                                         Severity of Risk
                                     </th>
                                     <th class="head-table">  Counsellor Comments and Remarks</th>
                                   
                                 </tr>
                                 <tr>
                                        <td class="border head-table">
You have undertaken the GTE Direct Certification Test and your grade was "Unacceptable (0-39%)"
                                     </td>
                                       <td class="border head-table first">
                                       High
                                     </td>
                                        <td class="border">The "Unacceptable (0-39%)" grade in your GTE Direct Certificate of Understanding indicates that you have an unacceptable level of understanding of  the visa requirements and conditions. This means that the decision-maker is not going to be confident about your level and accuracy of your understanding of the visa reqiuirements and conditions. In other words, he or she will believe that you will be a very  high risk of non-compliance due to ignorance or lack of understanding. To find out about how you can undertake another GTE Direct Certification Test, please contact the GTE Direct Support team whose contact details are published at the end of this report.</td>
                                     
                                   
                                 </tr>
                             </table>
                         </div>
                 
                   
                     <br/></div>
                     <p class="note">** Kindly note that the supporting documents that we have suggested that you should attach in this section are additional supporting documents. In other words, they are additional to the ones already listed in your draft Statement of Purpose that the GTE Direct arificial intelligence helped to create based on your responses in the GTE Assessment.</p>
                      </div>
               </td>
            </tr>
         
           
         </table>
         </div>
         <%--<div style="page-break-before: always; page-break-after: always;">--%>
             <div id="page25" class="certificate-wrpr">

                 <table class="certificate-table" cellspacing="0" cellpadding="0">


                     <tr>
                         <td class="cer-sep cer-sep-1">
                             <h4 class="heading-1 bg-color heading-upr">4. What to do next</h4>
                             <p class="heading-1 bg-color heading-upr">
                                 4.1 If any of the identified risk factors or statements in your 
                            <%=country_intent_tostudy %> - Statement of purpose (SOP)
                           are incorrect, in accurate, or not true
                        
                             </p>
                             <p>
                                 It is not uncommon for candidates who read their GTE Direct Counselling Report or their draft 
                         <%=country_intent_tostudy %> - Statement of purpose (SOP)
                        to find statements that are either partially or entirely  untrue or inaccurate. The reason for inaccurate or untrue statements in your GTE Direct documentation is because you would have answered one or more questions in your GTE Direct assessment incorrectly.
                             </p>
                             <p>
                                 If any of the risk factors identified in this report are a result of an incorrect response in your GTE Direct Assessment, please make sure that you correct the error(s) by editing the relevant section(s) of your 
                         <%=country_intent_tostudy %> - Statement of purpose (SOP)
                        . That way, you will reduce the risk factors in your application by ensuring that your 
                         <%=country_intent_tostudy %> - Statement of purpose (SOP)
                        only contains information that is true, accurate and correct.
                             </p>
                             <p>
                                 Similarly, if any the statements in your draft 
                         <%=country_intent_tostudy %> - Statement of purpose (SOP)
                        are inaccurate or untrue, you must still correct the errors, even if the GTE Direct artificial intelligence has not identified that (statement) as a risk factor. That way, you will reduce the risk factors in your application by ensuring that your 
                         <%=country_intent_tostudy %> - Statement of purpose (SOP)
                        only contains information that is true, accurate and correct.
                             </p>
                             <p class="heading-1 bg-color heading-upr">
                                 4.2 For the identified risk factors or statements in your 
                            <%=country_intent_tostudy %> - Statement of purpose (SOP)
                           that are correct, accurate and true
                        
                        <br>
                                 <span>Now that you are aware of the risk factors in your application (refer to section 2 of this report for details), and how suggestions about how you can address those risk factors (refer to section 3 of this report for details), you can now: </span>
                             </p>
                             <ol>
                                 <li>Edit and update your 
                            <%=country_intent_tostudy %> - Statement of purpose (SOP)
                           to provide reasonable explanations that would address any concerns that the decision-maker might have regarding the identified risk factors; and 
                                 </li>
                                 <li>Attach documentation evidence that supports the claims that you make in your 
                            <%=country_intent_tostudy %> - Statement of purpose (SOP)
                                 </li>
                             </ol>
                             <p>
                                 Please also remember to attach as many of the supporting documents listed in the 
                         <%=country_intent_tostudy %> - Statement of purpose (SOP)
                        that the GTE Direct Service assisted you in producing.
                             </p>
                             <p>If you follow the recommendations made in this counselling report, you will give yourself the best possible chance of having successful outcomes for your course and visa applications. The reason why your  chances  of getting a successful outcome will be optimized is because you would have attended to all the risk factors in your application. Hopefully, the manner that you would have attended to the risk factors will be satisfactory to the decision-maker.</p>
                         </td>
                     </tr>


                 </table>
             </div>
         <%--</div>
         <div style="page-break-before: always; page-break-after: always;">--%>
             <div id="page26" class="certificate-wrpr">

                 <table class="certificate-table" cellspacing="0" cellpadding="0">


                     <tr>
                         <td class="cer-sep cer-sep-1">
                             <h4 class="heading-1 bg-color heading-upr">5. Concluding Remarks</h4>

                             <div id="page27_5_1" runat="server" style="display: none;">
                                 <p>
                                     You can access a copy of this GTE Direct Counsellor Report, your draft 
                         <%=country_intent_tostudy %> - Statement of purpose (SOP)
                        , and your GTE Direct Certificate by logging into your account in the GTE Direct Online Centre (GOC) anytime.
                                 </p>
                             </div>
                             <div id="page27_5_2" runat="server" style="display: none;">
                                 <p>
                                     You can access a copy of this GTE Direct Counsellor Report, and your draft 
                         <%=country_intent_tostudy %> - Statement of purpose (SOP)
                        , by logging into your account in the GTE Direct Online Centre (GOC) anytime.
                                 </p>
                             </div>
                             <p>
                                 We hope that your engagement with the GTE Direct service has helped inform you about the 
                        <%=country_intent_tostudy %>
                        Student Visa requirements and conditions, and that the service will result in you being better prepared to submit high quality course and visa applications.
                             </p>
                             <p>Specifically, we hope that we have been successful in achieving the 3 goals that we set out to achieve for you, namely:</p>
                             <ol>
                                 <li>That you are empowered to make well-informed decisions by ensuring that you have an accurate understanding of the student visa requirements and conditions for study in 
                           <%=country_intent_tostudy %>
                           . 
                                 </li>
                                 <li>That you are supported in preparing and producing a high quality student visa application so that you have the best probability for success.</li>
                                 <li>Finally, that we provide you with the opportunity of an increased chance of a positive study experience in 
                           <%=country_intent_tostudy %>
                           . 
                                 </li>
                             </ol>
                             <p>
                                 Should you have any questions about this GTE Direct Counsellor Report or any aspect of your GTE Direct evaluation, please do not hesitate to contact us by sending us an email to the email below:
                     
                    <br>
                                 <span class="email"><a href="mailto:support@gte.direct">support@gte.direct</a></span>
                             </p>
                             <p>
                                 You can also contact us, and find out more about the services we offer from our website:  
                     <br>
                                 <span class="email"><a href="https://www.gtedirect.com/">https://www.gtedirect.com/</a></span>
                             </p>
                             <p>We wish you all the best in all your future studies.</p>
                             <p>Kind Regards,<br>
                                 <strong>The GTE Direct Support Team</strong></p>
                         </td>
                     </tr>

                     <tr>
                         <td class="fst-pg-btm">
                             <table cellpadding="0" cellspacing="0" style="width: 100%;">
                                 <tr>
                                     <td class="third-row-table-td">
                                         <table cellpadding="0" cellspacing="0">

                                             <tr>
                                                 <td>
                                                     <p class="footer">GTE Direct Counsellor Report for <strong><%=fullname %> </strong></p>
                                                     <p class="footer">
                                                         GTE Direct Applicant ID: 
                                          <strong><%=ApplicantID%></strong>
                                                         <span>Education Institution: 
                                             <strong><%=universityname%></strong>
                                                         </span>
                                                     </p>
                                                 </td>
                                                 <td>
                                                     <div class="cr-sgn-wrpr">
                                                         <p>Date: <strong><%=reportdate%></strong></p>

                                                     </div>
                                                 </td>
                                             </tr>

                                         </table>
                                     </td>
                                 </tr>
                             </table>
                         </td>
                     </tr>
                 </table>
             </div>
         <%--</div>--%>
    <!-- Optional JavaScript; choose one of the two! -->
<%--        <script>
             window.onload = function () {
    document.getElementById("download")
        .addEventListener("click", () => {
            const invoice = this.document.getElementById("invoice");
            console.log(invoice);
            console.log(window);
            var opt = {
                margin: 1,
                filename: 'myfile.pdf',
                image: { type: 'jpeg', quality: 0.98 },
                html2canvas: { scale: 2 },
                jsPDF: { unit: 'in', format: 'letter', orientation: 'portrait' }
            };
            html2pdf().from(invoice).set(opt).save();
        })
}</script>--%>
      
    <!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>

    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <!--
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
    -->
              </form>
                </div>
      <script>

</script>
  </body>
</html>