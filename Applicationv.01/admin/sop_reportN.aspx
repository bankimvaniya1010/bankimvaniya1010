<%@ Page Language="C#" AutoEventWireup="true" CodeFile="sop_reportN.aspx.cs" Inherits="admin_sop_reportN" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
    <style>
      
    </style>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" type="text/css" href="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/dashboard/css/bootstrap.min.css"/>
    <link type="text/css" href="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/css/app.css" rel="stylesheet"/>

    <!-- Google Tag Manager -->
    <script>
        (function (w, d, s, l, i) {
            w[l] = w[l] || [];
            w[l].push({ 'gtm.start': new Date().getTime(), event: 'gtm.js' });
            var f = d.getElementsByTagName(s)[0], j = d.createElement(s), dl = l != 'dataLayer' ? '&l=' + l : '';
            j.async = true;
            j.src = 'https://www.googletagmanager.com/gtm.js?id=' + i + dl;
            f.parentNode.insertBefore(j, f);
        })(window, document, 'script', 'dataLayer', '<%=Session["universityGoogleTagID"]%>');
    </script>
    <!-- End Google Tag Manager -->

</head>
<body>
    <form id="form1" runat="server">
        <div>

            <div class="row">
                <div class="col-md-12">
                    <div class="card" runat="server" id="sop_section">
                        <div class="card-body">
                        <span><b><%=gteEvalution_date %></b></span>
                        <br />

                        <div style="padding-left:42%; ">
                            <table>
                                <tr>
                                    <td><b>Name</b></td>
                                    <td>:<%=FirstName%> <%=MiddleName%> <%=FamilyName%></td>
                                </tr>
                                <tr>
                                    <td><b>Date of birth</b></td>
                                    <td>:<%=dateofbirth%></td>
                                </tr>
                                <tr>
                                    <td><b>Nationality</b></td>
                                    <td>:<%=Nationality%> </td>
                                </tr>
                                <tr>
                                    <td><b>Gender</b></td>
                                    <td>:<%=gender %></td>
                                </tr>
                                <tr>
                                    <td style="vertical-align: text-top;"><b>Postal Address</b></td>
                                    <td>:<%=postaladdress %></td>
                                </tr>
                                <tr>
                                    <td style="vertical-align: text-top;"><b>Email</b></td>
                                    <td>:<%=email %></td>
                                </tr>
                                <tr>
                                    <td><b>Mobile</b></td>
                                    <td>:<%=mobileno %></td>
                                </tr>

                            </table>

                        </div>
                        <br />
                        <h5 class="form-control col-md-4 h5bg h5ctrl">TO WHOM IT MAY CONCERN</h5>
                        <br />
                        <div>
                            In response to the Genuine Temporary Entrant Criteria for the student visa for <%=Country_where_you_are_applying_to_study%>, and in support of my course and student visa application, please find below my personal statement outlining my genuine reasons as to why I would like to pursue further study in:
                        </div>
                        <br />
                        <ul>
                            <li class="btm" >
                                <div>
                                    A principal course that is a <%=levelofcourse %>  level course
                                </div>
                                <br />
                            </li>
                            <li class="btm" >
                                <div>
                                    In the broad field of education of: <%=broadfiledofeducation %>
                                </div>
                                <br />
                            </li>
                            <li class="btm" >
                                <div>
                                    In the narrow field of education of: <%=narrowfieldofeducation%>
                                </div>
                                <br />
                            </li>
                            <li class="btm" >
                                <div>
                                    And a detailed field of education of: <%=detailedfieldofeducation %>
                                </div>
                                <br />
                            </li>
                            <li class="btm" >
                                <div>
                                    At <%=Education_Institution%> in <%=City %> in <%=Country %>
                                </div>
                                <br />
                            </li>
                            <li class="btm" >

                                <div>  
                                    I intend to commence the pathway to the above-mentioned studies in <%=dateyouintenttostartnextstudy %>
                                </div>

                            </li>

                        </ul>
                              <br />
                        <h5 class="form-control col-md-4 h5bg h5ctrl">Brief Introduction about myself</h5>
                        <div>
                            I am a citizen of <%=Nationality %> . I was born in <%=Country_of_birth %>  and I currently live in <%=Current_Residence_Country %>. At the time of writing this statement of purpose, I am
                            <%=age %> years old and my marital status is <%=MaritalStatus %>
                                                    </div> 
                 <div>
                     
                     <asp:Label ID="statement1" style="display:none;" runat="server"><ul><li class="btm" >I was married on <%=Date_of_Marriage %>  and my spouse is a citizen of <%=Nationality_of_Spouse %>.  </li></ul></asp:Label> 
                     <asp:Label ID="statement2" style="display:none;" runat="server"><ul><li class="btm" >I do not have any dependents under the age of 18.  </li></ul></asp:Label>
                     <asp:Label ID="statement3" style="display:none;" runat="server"><ul><li class="btm" >I have one dependent under the age of 18: <%=Answer_to_clarification_Question_42 %>  </li></ul></asp:Label>
                     <asp:Label ID="statement4" style="display:none;" runat="server"><ul><li class="btm" >I have two dependents under the age of 18: <%=Answer_to_clarification_Question_42 %>  </li></ul></asp:Label>
                     <asp:Label ID="statement5" style="display:none;" runat="server"><ul><li class="btm" >I have three dependents under the age of 18: <%=Answer_to_clarification_Question_42 %>  </li></ul></asp:Label>
                     <asp:Label ID="statement6" style="display:none;" runat="server"><ul><li class="btm" >I have the following dependents under the age of 18: <%=Answer_to_clarification_Question_42 %>  </li></ul></asp:Label>
                         
                 </div>
                        
  <br />
                 <h5 class="form-control col-md-4 h5bg h5ctrl">
                     Previous Study and Gaps
                 </h5>
                 
                <div>
                    The highest academic educational qualification I have achieved in my previous studies is a <%=Answer_to_Question_14_Section_1 %> level course, which is categorized in the broad field of education of  <%=Answer_to_Question_15_Section_1 %>, and a narrow field of education of <%=Answer_to_Question_16_Section_1 %> with a detailed field of education of <%=Answer_to_Question_17_Section_1 %>. 
                </div>
                <div>
                    I completed this education <%=xx_years_yymonthhighestqualificationdate %> ago from <%=Country_of_highest_educational_qualification %>.
                </div>
                <div id="previous_stat1" runat="server" style="display:none;">
                    I have opted to study a course in <%=Country_where_you_are_applying_to_study %> that is much lower level than my previous highest level of study because, <%=Answer_to_CQ_34 %>
                </div>
                <div id="previous_stat2" runat="server" style="display:none;">
                    I have opted to study a course in <%=Country_where_you_are_applying_to_study %>  that is a lower level than my highest level of study because, <%=Answer_to_CQ_35 %>
                </div>
                <div id="previous_stat3" runat="server" style="display:none;">
                    I have opted to study a course in <%=Country_where_you_are_applying_to_study %> that is at the same level of study as what I studied before because, <%=Answer_to_CQ_36  %>
                </div>
                <div id="previous_stat4" runat="server" style="display:none;">
                    I have opted to study a course in <%=Country_where_you_are_applying_to_study %>, higher than my highest level of study. This demonstrates my commitment to furthering and progressing my education.
                </div>
<br />
                        <div id="previous_stat5" runat="server" style="display:none;">
                            I have chosen a broad field of study in <%=Country_where_you_are_applying_to_study %>, that is different than what I have  studied before, because <%=Answer_to_CQ_12 %>
                        </div>
                        <div id="previous_stat6" runat="server" style="display:none;">
                            The broad field of study I have chosen to study in <%=Country_where_you_are_applying_to_study %>, is the same broad field of education to what I have  studied before, <%=Answer_to_Question_21_Section_1 %>
                        </div>

                        
                        <div id="previous_stat7" runat="server" style="display:none;">
                            I have chosen a narrow field of study in <%=Country_where_you_are_applying_to_study %>, that is different than what I have  studied before, because <%=Answer_to_CQ_13 %>
                        </div>
                        <div id="previous_stat8" runat="server" style="display:none;">
                            The narrow field of study I have chosen to study in <%=Country_where_you_are_applying_to_study %>, is the same narrow field of education to what I have  studied before, <%=Answer_to_Questio_22_Section_1 %>
                        </div>
                        
                        <div id="previous_stat9" runat="server" style="display:none;">
                            There have been gaps of 3 months or longer where I was not studying or working. The reason(s) for the gap(s) in my study or work is/are <%=Answer_to_Clarification_Question_CQ1_Section_3 %> 
                        </div>
                        <div id="previous_stat10" runat="server" style="display:none;">There have been no gaps of 3 months or longer where I was not studying or working.</div>
                        
                        <div id="previous_stat11" runat="server" style="display:none;">When enrolled in previous courses, I very rarely missed my classes. My attendance record was very good.</div>
                        <div id="previous_stat12" runat="server" style="display:none;">When enrolled in previous courses, I often missed my classes. My attendance record was not very good. The reason for my bad attendance record was <%=Answer_to_Clarification_Question_CQ2_Section_3 %> </div>

                        <div id="previous_stat13" runat="server" style="display:none;">
                            I have never started studying a course and then failed to complete it.
                        </div>
                        <div id="previous_stat14" runat="server" style="display:none;">I have previously started studying a course and then failed to complete it. The reason(s) for failing to complete my previous studies is/are <%=Answer_to_Clarification_Question_CQ36_Section_3 %> </div>
                        
                        <div id="previous_stat15" runat="server" style="display:none;">I regularly pass and successfully complete courses, units or subjects that I study at my first attempt.</div>
                        <div id="previous_stat16" runat="server" style="display:none;">In the past, I have not passed and successfully completed my courses, units or subjects that I study at my first attempt. The reason for this is <%=Answer_to_Question_CQ38_Section_3 %> </div>
                        

                        <div id="previous_stat17" runat="server" style="display:none;">I have never been been suspended or expelled from an education institution.</div>
                        <div id="previous_stat18" runat="server" style="display:none;">I have previously been suspended or expelled from an education institution. The reason for my suspension/expulsion was <%=Answer_to_Clarification_Question_CQ37_Section_3 %> </div>
                        
                        <div id="previous_stat19" runat="server" style="display:none;">There has never been a period of time when I was enrolled in a course but not actually studying or engaging in it.</div>
                        <div id="previous_stat20" runat="server" style="display:none;">There has been a period of time when I was enrolled in a course but not actually studying or engaging in it. The reason for this was <%=Answer_to_Clarification_Question_CQ4_Section_3 %> </div>
                        
                        <div id="previous_stat21" runat="server" style="display:none;">I have never requested a deferral (pause) in my studies for a reason that was not true.</div>
                        <div id="previous_stat22" runat="server" style="display:none;">I have previously requested a deferral (pause) in my studies for a reason that was not true. The reason for this was <%=Answer_to_Clarification_Question_CQ8_Section_3 %> </div>
                        
                        <div id="previous_stat23" runat="server" style="display:none;">I have studied in Australia before. The details of my previous Australian study are:  <%=Answer_to_Clarification_Question_CQ6_Section_3 %> </div>
                        <div id="previous_stat24" runat="server" style="display:none;">
                            I have not studied in Australia before.
                        </div>
                        <div id="previous_stat25" runat="server" style="display:none;">Though I have previously enrolled in a course in Australia, i did not complete it. The reason for not completing the course is  <%=Answer_to_Clarification_Question_CQ5_Section_3 %> </div>
                          <br />
                        <h5 class="form-control col-md-8 h5bg h5ctrl"> Employment & Value of the Course to my future</h5>
                        
                        <div>The primary reason for wanting to study in Australia <%=Answer_to_Question_16_Section_2 %></div>
                        
                        <div>The course I have selected  <%=Answer_to_Question_13_Section_2 %>.</div>
                        <div>The duration of my study is <%=Answer_to_Question_14_Section_2%>.</div>
                        
                        <div>After completing my course I plan to  <%=Answer_to_Question_15_Section_2 %></div>
                        <div>After I complete my studies in Australia, <%=Answer_to_Question_18_Section_2 %></div>
                        <br/><div>My English language competencies are <%=Answer_to_Question_17_Section_2 %></div>
                        
                        <div id="employment_stat1" runat="server" style="display:none;">I do not have any work experience.</div>
                        <div id="employment_stat2" runat="server" style="display:none;">My total work experience so far is <%=Work_Experience %> </div>
                        
                        <div id="employment_stat3" runat="server" style="display:none;">I am currently working in a full-time job. The details of my current full time employment are: <%=Answer_to_Clarification_Question_CQ43_Section_1 %></div>
                        <div id="employment_stat4" runat="server" style="display:none;">I am not currently working in a full-time job.</div>
                        
                        <div id="employment_stat5" runat="server" style="display:none;">I have a job offer or guaranteed job to return to after I have completed my studies. Details of this job offer are: <%=Answer_to_Clarification_Question_CQ44_Section_1 %></div>
                          <br />
                        <h5 class="form-control col-md-8 h5bg h5ctrl">Ties to, and Situations in, my Home Country or Country of Residence</h5>
                        
                        <div>I plan to study this course in Australia and not in <%=Nationality %> because <%=Answer_to_Question_1_Section_2 %></div>
                        <div>My parents, brothers and sisters are <%=Answer_to_Question_2_Section_2 %></div>
                        <div>The current market value of my family's fixed assets Residential/Commercial/Agricultural is <%=Answer_to_Question_3_Section_2 %></div>
                        
                        <div>The source of funding for my tuition fees and living expenses will <%=Answer_to_Question_4_Section_2 %></div>
                        <div>My sponsor <%=Answer_to_Question_6_Section_2 %></div>
                        <div>My sponsor's income in the last calendar year was <%=Answer_to_Question_5_Section_2 %></div>
                        <div>
                            In my home country <%=Nationality %>, <%=Answer_to_Question_7_Section_2 %>
                        </div>

                        <div>The political and civil situation in <%=Nationality %> my home country <%=Answer_to_Question_8_Section_2%></div>

                        <div id="ties_stat1" runat="server" style="display:none;">I am unwilling to return and stay in my home country due to a fear of being persecuted because of my race, religion, nationality, membership of a particular social group or political opinion. Specifically, <%=Answer_to_Clarification_Question_CQ33_Section_3 %></div>
                        <div id="ties_stat2" runat="server" style="display:none;">I am willing and able to to return and stay in <%=Home_Country %> after I complete my studies. In <%=Home_Country %>, i do not fear being persecuted because of my race, religion, nationality, membership of a particular social group or political opinion.</div>
                        
  <br />
                        <h5 class="form-control col-md-4 h5bg h5ctrl">Potential Situation in Australia</h5>
                        
                        <div>I have chosen to study in <%=Country_where_you_are_applying_to_study %> over other destinations because <%=Answer_to_Question_11_Section_2 %>.</div>
                        <div id="potential_state1" runat="server" style="display:none;">If an Immigration Officer were to ask me about what I know about <%=Country_where_you_are_applying_to_study %>, i believe that i can reasonably communicate an acceptable understanding of the country.</div>
                        <div id="potential_state2" runat="server" style="display:none;">If an Immigration Officer were to ask me about what I know about <%=Country_where_you_are_applying_to_study %>, i am not confident that i will be able to reasonably communicate an acceptable understanding of the country.</div>
                        
                        <div>My personal experience with <%=Country_where_you_are_applying_to_study %> <%=Answer_to_Question_10_Section_2 %>.</div>
                        <div>I am currently living in <%=Answer_to_Question_8_Section_1 %>.</div>
                        <div id="potential_state3" runat="server" style="display:none;">I have studied in <%=Country_where_you_are_applying_to_study %>  before, the details of which are as follows: <%=Answer_to_Clarification_Question6_CQ6_Section_3 %>.</div>
                        <div id="potential_state4" runat="server" style="display:none;">I have not studied in <%=Country_where_you_are_applying_to_study %> before.</div>
                        
                        <div id="potential_state5" runat="server" style="display:none;">My parents reside in <%=Country_where_you_are_applying_to_study %>. <%=Answer_to_CQ9_Section_3 %> </div>
                        <div id="potential_state6" runat="server" style="display:none;">My parents do not reside in <%=Country_where_you_are_applying_to_study %>. </div>
                        
                        <div id="potential_state7" runat="server" style="display:none;">If an Immigration Officer were to ask me about what I know about <%=City %>, i believe that i can reasonably communicate an acceptable understanding of the study destination</div>
                        <div id="potential_state8" runat="server" style="display:none;">If an Immigration Officer were to ask me about what I know about <%=City %>, i am not confident that i will be able to reasonably communicate an acceptable understanding of the destination.</div>                        
                        <div id="potential_state9" runat="server" style="display:none;">I personally know at least one person who lives in <%=City %>. Their name(s) and relationship to me are as follows: <%=Answer_to_Clarification_Question45_CQ45_Section_3 %>.</div>
                        <div id="potential_state10" runat="server" style="display:none;">I currently do not know anyone who lives in <%=City %>.</div>
                        
                        <div>My decision to study at <%=Educational_Institution %> is based on <%=Answer_Q12_Section_2 %></div>
                        <div id="potential_state11" runat="server" style="display:none;">I personally know at least one person who is currently studying at <%=Education_Institution %></div>
                        <div id="potential_state12" runat="server" style="display:none;">I currently do not know anyone who currently studies at <%=Answer_to_Question26_Section_1 %>.</div>
                        <div id="potential_state13" runat="server" style="display:none;">I personally know at least one person who is planning to go and study at <%=Education_Institution %>.</div>
                        <div id="potential_state14" runat="server" style="display:none;">I currently do not know anyone who is also planning to study at <%=Education_Institution %>.</div>
                        <div id="potential_state15" runat="server" style="display:none;">If an Immigration Officer were to ask me about what I know about <%=Education_Institution %>, i believe that i can reasonably communicate an acceptable understanding of the study destination</div>
                        <div id="potential_state16" runat="server" style="display:none;">If an Immigration Officer were to ask me about what I know about <%=Education_Institution %>, i am not confident that i will be able to reasonably communicate an acceptable understanding of the destination.</div>
                        
                        <div>While I will study in <%=Country_where_you_are_applying_to_study %> <%=Answer_to_Question9_Section_2 %></div>
                        
                        <div id="potential_state17" runat="server" style="display:none;">If an Immigration Officer were to ask me about what I know about the course I want to study, i believe that i can reasonably communicate an acceptable understanding of the course.</div>
                        <div id="potential_state18" runat="server" style="display:none;">If an Immigration Officer were to ask me about what I know about the course I want to study, i am not confident that i will be able to reasonably communicate an acceptable understanding of the course.</div>
                        
                        <div id="potential_state19" runat="server" style="display:none;">I will be 18 years or older when I first arrive in <%=Country_where_you_are_applying_to_study %>  to start my course </div>
                        <div id="potential_state20" runat="server" style="display:none;">I will be less than 18 years or older when I first arrive in <%=Country_where_you_are_applying_to_study %> to start my course </div>
                        
                              <br />
                        <h5 class="form-control col-md-4 h5bg h5ctrl"> Immigration History </h5>
                        

                        <div id="immi_stat1" runat="server" style="display:none">I have never travelled to any foreign country before.</div>
                        <div id="immi_stat2" runat="server" style="display:none">I have travelled to a foreign country before. Specifically, I have previously travelled to <%=Answer_Clarification_Question48_CQ48_Section_3 %></div>
                        
                        <div id="immi_stat3" runat="server" style="display:none">I have never had any visa application to travel to any foreign country refused or rejected before</div>
                        <div id="immi_stat4" runat="server" style="display:none">I have had a previous visa application to travel to any foreign country refused or rejected before. The details of the visa refusal(s) is/are: <%=Answer_to_Clarification_Question13_CQ13_Section_3 %></div>
                        
                        <div id="immi_stat5" runat="server" style="display:none">I have never been deported from any foreign country </div>
                        <div id="immi_stat6" runat="server" style="display:none">I have been deported from a foreign country countryt before. The details of the deportation(s) is/are: <%=Answer_to_Clarification_Question16_CQ16_Section_3 %></div>
                        
                        <div id="immi_stat7" runat="server" style="display:none">I have always complied with the visa conditions of my previous visas. </div>
                        <div id="immi_stat8" runat="server" style="display:none">I have not always complied with the visa conditions of my previous visas. The details of the visa non-compliance is/are: <%=Answer_to_Clarification_Question11_CQ11_Section_3 %></div>
                        
                        <div id="immi_stat9" runat="server" style="display:none">None of my previous visas have ever been cancelled </div>
                        <div id="immi_stat10" runat="server" style="display:none">I have had a previous visa cancelled because  <%=Answer_to_Clarification_Question17_CQ17_Section_3 %></div>
                        
                        <div id="immi_stat11" runat="server" style="display:none">I have never over-stayed beyond the expiry date of a visa in any country</div>
                        <div id="immi_stat12" runat="server" style="display:none">I have over-stayed beyond the expiry date of a visa in any country. This was because <%=Answer_to_Clarification_Question31_CQ31_Section_3 %></div>
                        
                        <div id="immi_stat13" runat="server" style="display:none">A previous visa that I had was considered for cancellation. The details of this cancellation are <%=Answer_to_Clarification_Question18_CQ18_Section_3 %></div>
                        <div id="immi_stat14" runat="server" style="display:none">I have never had a previous visa that was considered for cancellation.</div>
                        
                        <div id="immi_stat15" runat="server" style="display:none">I have travelled  to <%=Country_where_you_are_applying_to_study %> before. The details of my previous travel to <%=Country_where_you_are_applying_to_study %> are: <%=Answer_to_Clarification_Question10_CQ10_Section3 %></div>
                        <div id="immi_stat16" runat="server" style="display:none">I have never travelled  to <%=Country_where_you_are_applying_to_study %> before </div>
                        
                        <div id="immi_stat17" runat="server" style="display:none">At the time of applying for the Student Visa I will be in <%=Home_Country %></div>
                        <div id="immi_stat18" runat="server" style="display:none">At the time of applying for the Student Visa I will be in <%=Country_where_you_are_applying_to_study %></div>
                        
  <br />
                        <h5 class="form-control col-md-4 h5bg h5ctrl">Character & Criminal Record</h5>
                        
                        <div id="criminal_statement1" runat="server" style="display:none;">I declare that I do not have any criminal record, have not been involved in any direct or indirect activities which may prove to be a risk to the national security or social harmony of <%=Country_where_you_are_applying_to_study %>, have not in the past been associated with intelligence operations of any country and have not had any outstanding debts to the Government or any public authority in <%=Country_where_you_are_applying_to_study %>.</div>
                        
                        <div id="criminal_statement2" runat="server" style="display:none;">Regarding my character and criminal record, I declare the following:</div>
                        <div id="criminal_statement3" runat="server" style="display:none;">
                            <ul><li class="btm">I have been charged with a criminal offence that is currently awaiting legal action. The details of this are: <%=Answer_to_CQ_19 %></li></ul>
                        </div>
                        <div id="criminal_statement4" runat="server" style="display:none;">
                            <ul><li class="btm" >I have previously been convicted of a criminal offence. The details of this conviction are: <%=Answer_to_CQ_20 %></li></ul>
                        </div>
                        <div id="criminal_statement5" runat="server" style="display:none;">
                            <ul><li class="btm" >I have been the subject of an arrest warrant or Interpol notice. <%=Answer_to_CQ_21 %></li></ul>
                        </div>
                        <div id="criminal_statement6" runat="server" style="display:none;"><ul><li class="btm" >I have been found guilty of a sexually based offence involving a child. <%=Answer_to_CQ_22 %></li></ul></div>
                        <div id="criminal_statement7" runat="server" style="display:none;"><ul><li class="btm" >I have been acquitted of an offence on the grounds of unsoundness of mind or insanity. <%=Answer_to_CQ_23 %></li></ul></div>
                        <div id="criminal_statement8" runat="server" style="display:none;"><ul><li class="btm" >I have been directly or indirectly involved in,  or associated with, activities which would represent a risk to national security in Australia or any other country. <%=Answer_to_CQ_24 %></li></ul></div>
                        <div id="criminal_statement9" runat="server" style="display:none;"><ul><li class="btm" >I have been charged with, or indicted for: genocide, war crimes, crimes against humanity, torture, slavery, or any other crime that is otherwise of a serious international concern. <%=Answer_to_CQ_25 %></li></ul></div>
                        <div id="criminal_statement10" runat="server" style="display:none;"><ul><li class="btm" >I have been associated with a person, group or organisation that has been/is involved in criminal conduct. <%=Answer_to_CQ_26 %></li></ul></div>
                        <div id="criminal_statement11" runat="server" style="display:none;"><ul><li class="btm" >I have been associated with an organisation engaged in violence or engaged in acts of violence (including war, insurgency, freedom fighting, terrorism, protest) either overseas or in terrorism, protest) either overseas or in Australia. <%=Answer_to_CQ_27 %></li></ul></div>
                        <div id="criminal_statement12" runat="server" style="display:none;"><ul><li class="btm" >I have served in a military force, police force, state sponsored/private militia or intelligence agency (including secret police). <%=Answer_to_CQ_28 %></li></ul></div>
                        <div id="criminal_statement13" runat="server" style="display:none;"><ul><li class="btm" >I have undergone military/paramilitary training or been trained in weapons/explosives or in the manufacture of chemical/biological products. <%=Answer_to_CQ_29 %></li></ul></div>
                        <div id="criminal_statement14" runat="server" style="display:none;"><ul><li class="btm" >I have been involved in people smuggling or people trafficking offences. <%=Answer_to_CQ_30 %></li></ul></div>
                        <div id="criminal_statement15" runat="server" style="display:none;"><ul><li class="btm" >I have had an outstanding debts to the Australian Government or any public authority in Australia. <%=Answer_to_CQ_32 %></li></ul></div>
                          <br />

                        <h5 class="form-control col-md-8 h5bg h5ctrl">Understanding of Student Visa Requirements & Conditions</h5>
                        
                        <div>At the time of writing this Statement of Purpose:</div>
                        <div id="studentvisarequirement1" style="display:none;" runat="server">I had not undertaken the independent Genuine Student Training Direct Certification Test offered by GTE Direct. Therefore, my level of understanding of the student visa requirements and conditions for <%=Country_where_you_are_applying_to_study %> has not been evaluated or independently verified.</div>
                        <div id="studentvisarequirement2" style="display:none;" runat="server">I have undertaken the independent Genuine Student Training Direct Certification Test offered by GTE Direct. Therefore, my level of understanding of the student visa requirements and conditions for <%=Country_where_you_are_applying_to_study %> have been evaluated and independently verified. The details of my GTE Direct Certification Test results are as below:</div>
                        
                        <div id="studentvisarequirement3" style="display:none;" runat="server"><b>Percentage Score: </b><%=Percentage_Score %></div>
                        <div id="studentvisarequirement4" style="display:none;" runat="server"><b>Level of Understanding: <%=Level_of_Understanding %></b></div>
                        <div id="studentvisarequirement5" style="display:none;" runat="server">Description of Level of Understanding: <%=Description_of_Level_of_Understanding%></div>

                              <br />
                        <h5 class="form-control col-md-4 h5bg h5ctrl">Conclusion</h5>
                        
                        <div id="ifAgentYes" runat="server" style="display:none;">Should you require further information and/or clarification on any of the matters addressed in this Statement of Purpose, please do not hesitate to contact my authorized education agent, who will in turn notify me accordingly.</div>
                        <div id="ifAgentNo" runat="server" style="display:none;">Should you require further information and/or clarification on any of the matters addressed in this Statement of Purpose, please do not hesitate to contact me.</div>
                        

                        <div>I hope that my application will meet with a favourable response from you so that I may be given the opportunity to fulfill on my goal of studying in <%=Country_where_you_are_applying_to_study %>.</div>

                        <br/>
                        <div>Yours sincerely,</div>
                        <div><%=FirstName %> <%=MiddleName %> <%=FamilyName %></div>
                            
                         

                               <div style="display: none;" runat="server">
                <div class="modal" id="IELTS-modal" tabindex="-1" role="dialog">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="faq-modal-header modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            </div>
                            <div class="modal-body">
                                <div class="">
                                    <table border="1">
                                        <tr>
                                            <td>*Academic International English Language Testing System (IELTS)</td>
                                            <td>6.0 with no band below 6.0 for Reading and Writing and no band below 5.5 in Speaking and Listening</td>
                                        </tr>
                                        <tr>
                                            <td>*Cambridge Advanced English prior to January 2015 (CAE)</td>
                                            <td>52 with no section less than Borderline</td>
                                        </tr>
                                        <tr>
                                            <td>*Cambridge Advanced English after January 2015 (CAE)</td>
                                            <td>169 with no band below 162</td>
                                        </tr>
                                        <tr>
                                            <td>*Pearson Test of English (PTE)</td>
                                            <td>54 with no band below 46</td>
                                        </tr>
                                        <tr>
                                            <td>*Test of English as a Foreign Language - IBT (TOEFL IBT)</td>
                                            <td>73 with no band less than 16</td>
                                        </tr>
                                        <tr>
                                            <td>* *Test of English as a Foreign Language - Paper Based (TOEFL - Paper Based)</td>
                                            <td>534 (Test of Written English 4.0)</td>
                                        </tr>
                                        <tr>
                                            <td>Occupational English Test (OET)</td>
                                            <td>OET with a minimum of C in the four components</td>
                                        </tr>
                                        <tr>
                                            <td>Special Tertiary Admissions Test (STAT)</td>
                                            <td>Written English Score 140</td>
                                        </tr>
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
                <div class="col-md-4">
                </div>
            </div>
               
        </div>
    </form>
    <script>
         $('#lblClick').click(function () {
                var IELTSModal = $('#IELTS-modal');
                $('body').append(IELTSModal);
                $('#IELTS-modal').modal('show');
            });
       
       
    </script>
</body>
</html>
