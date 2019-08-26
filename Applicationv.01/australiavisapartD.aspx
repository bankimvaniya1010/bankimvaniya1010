<%@ Page Language="C#" AutoEventWireup="true" CodeFile="australiavisapartD.aspx.cs" Inherits="australiavisapartD" MasterPageFile="~/student.master"%>

<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">


    <div class="container-fluid page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">Visa Detail PartD
            </li>
        </ol>
    </div>
    <div class="page ">
        <div class="container page__container p-0">
            <div class="row m-0">
                <div class="col-lg container-fluid page__container">
                    <div class="card faq-lftcard" style="width: 650px;">

                       <div class="list-group list-group-fit">
                        <div class="row" id="partc">
                            <div class="col-12 step-txt">Part D – To be completed BY All Applicant
                                Health Declaration
                            </div>
                             <div class="col-12">
                               <%--50--%>
                               <div class="form-group">
                                    <label><b class="ques-lbl">50)</b> In the last 5 years, have you, or has any member of your family unit included in this application, visited or lived outside your country of usual residence for more than 3 consecutive months?</label>
                                    <div class="form-check-inline">
                                        <label class="form-check-label">
                                        <input type="radio" class="form-check-input" name="outsidecountry" runat="server" id="rboutsidecountryNo">No
                                        </label>
                                    </div>
                                    <div class="form-check-inline">
                                        <label class="form-check-label">
                                        <input type="radio" class="form-check-input" name="outsidecountry" runat="server" id="rboutsidecountryYes">Yes
                                        </label>
                                    </div>
                                    <div id="showControls" runat="server">
                                        <div>
                                            <div class="form-group">
                                                <label>Name</label>
                                                <input type="text" name="" class="form-control" runat="server" id="txtfamilymembername">
                                            </div>
                                            <div class="form-group">
                                                <label>Country</label>
                                                <asp:DropDownList ID="ddlfamilyresidencecountry" CssClass="form-control" runat="server"></asp:DropDownList>
                                            </div>
                                            <div class="form-group">
                                                <label>Date</label>
                                                <div class="row">
                                                <div class="col-6">
                                                <label>From</label>
                                                <input id="txtfamilyresidenceFrom" runat="server" type="text" class="form-control" placeholder="DAY/MONTH/YEAR" data-toggle="flatpickr" value="">
                                                </div>
                                                <div class="col-6">
                                                <label>To</label>
                                                <input id="txtfamilyresidenceTo" runat="server" type="text" class="form-control" placeholder="DAY/MONTH/YEAR" data-toggle="flatpickr" value="">
                                                </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div>
                                            <div class="form-group">
                                                <label>Name</label>
                                                <input type="text" name="" class="form-control" runat="server" id="familymembername1">
                                            </div>
                                            <div class="form-group">
                                                <label>Country</label>
                                                <asp:DropDownList ID="ddlfamilyresidencecountry1" CssClass="form-control" runat="server"></asp:DropDownList>
                                            </div>
                                            <div class="form-group">
                                                <label>Date</label>
                                                <div class="row">
                                                <div class="col-6">
                                                <label>From</label>
                                                <input id="familyresidenceFrom1" runat="server" type="text" class="form-control" placeholder="DAY/MONTH/YEAR" data-toggle="flatpickr" value="">
                                                </div>
                                                <div class="col-6">
                                                <label>To</label>
                                                <input id="familyresidenceTo1" runat="server" type="text" class="form-control" placeholder="DAY/MONTH/YEAR" data-toggle="flatpickr" value="">
                                                </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div>
                                            <div class="form-group">
                                                <label>Name</label>
                                                <input type="text" name="" class="form-control" runat="server" id="familymembername2">
                                            </div>
                                            <div class="form-group">
                                                <label>Country</label>
                                                <asp:DropDownList ID="ddlfamilyresidencecountry2" CssClass="form-control" runat="server"></asp:DropDownList>
                                            </div>
                                            <div class="form-group">
                                                <label>Date</label>
                                                <div class="row">
                                                <div class="col-6">
                                                <label>From</label>
                                                <input id="familyresidenceFrom2" runat="server" type="text" class="form-control" placeholder="DAY/MONTH/YEAR" data-toggle="flatpickr" value="">
                                                </div>
                                                <div class="col-6">
                                                <label>To</label>
                                                <input id="familyresidenceTo2" runat="server" type="text" class="form-control" placeholder="DAY/MONTH/YEAR" data-toggle="flatpickr" value="">
                                                </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                               </div>

                               <%--51--%>
                                 <div class="form-group">
                                    <label><b class="ques-lbl">51)</b> Do you, or any member of your family unit included in this application, intend entering an Australian hospital (including nursing homes) for work, training, treatment or visiting?</label>
                                    <div class="form-check-inline">
                                        <label class="form-check-label">
                                        <input type="radio" class="form-check-input" name="workforaustralianhospital" runat="server" id="rbworkforaustralianhospitalNo">No
                                        </label>
                                    </div>
                                    <div class="form-check-inline">
                                        <label class="form-check-label">
                                        <input type="radio" class="form-check-input" name="workforaustralianhospital" runat="server" id="rbworkforaustralianhospitalYes">Yes
                                        </label>
                                    </div>
                                    <div id="showhospitaldetailsControls" runat="server">
                                        <div class="form-group">
                                            <label>Give full Details</label>
                                            <textarea name="" class="form-control" runat="server" id="txtdescriptionofhospitalwork"></textarea>
                                        </div>
                                    </div>  
                                </div>
                                <%--52--%>
                                <div class="form-group">
                                    <label><b class="ques-lbl">52)</b> Do you, or any member of your family unit included in this application, intend to work in an Australian preschool-aged child care centre (including preschools and creches) as an employee or trainee?</label>
                                    <div class="form-check-inline">
                                        <label class="form-check-label">
                                        <input type="radio" class="form-check-input" name="workforaustralianpreschool" runat="server" id="rbworkforaustralianpreschoolNo">No
                                        </label>
                                    </div>
                                    <div class="form-check-inline">
                                        <label class="form-check-label">
                                        <input type="radio" class="form-check-input" name="workforaustralianpreschool" runat="server" id="rbworkforaustralianpreschoolYes">Yes
                                        </label>
                                    </div>
                                    <div id="showpreschooldetailsControls" runat="server">
                                        <div class="form-group">
                                            <label>Give full Details</label>
                                            <textarea name="" class="form-control" runat="server" id="txtdescriptionofpreschoolwork"></textarea>
                                        </div>
                                    </div>
                                </div>
                                <%--53--%>
                                 <div class="form-group">
                                    <label><b class="ques-lbl">53)</b> Have you, or any member of your family unit included in this application:</label>
                                        <ul>
                                            <li>ever had, or do you currently have, tuberculosis?</li>
                                            <li>been in close contact with a person who has, or has had, active tuberculosis?</li>
                                            <li>ever had a chest x-ray which showed an abnormality?</li>
                                        </ul>
                                    
                                    <div class="form-check-inline">
                                        <label class="form-check-label">
                                        <input type="radio" class="form-check-input" name="haveanyhealthissue" runat="server" id="rbhaveanyhealthissueNO">No
                                        </label>
                                    </div>
                                    <div class="form-check-inline">
                                        <label class="form-check-label">
                                        <input type="radio" class="form-check-input" name="haveanyhealthissue" runat="server" id="rbhaveanyhealthissueYes">Yes
                                        </label>
                                    </div>
                                    <div id="showhealthissueControls" runat="server">
                                        <div class="form-group">
                                            <label>Give full Details</label>
                                            <textarea name="" class="form-control" runat="server" id="txtdetailofhealthissue"></textarea>
                                        </div>
                                    </div>  
                                </div>
                                 <%--54--%>
                                 <div class="form-group">
                                    <label><b class="ques-lbl">54)</b> Do you require assistance with mobility and/or care</label>
                                    <div class="form-check-inline">
                                        <label class="form-check-label">
                                        <input type="radio" class="form-check-input" name="requiremobility" runat="server" id="rbrequiremobilityNo">No
                                        </label>
                                    </div>
                                    <div class="form-check-inline">
                                        <label class="form-check-label">
                                        <input type="radio" class="form-check-input" name="requiremobility" runat="server" id="rbrequiremobilityYes">Yes
                                        </label>
                                    </div>
                                    <div id="showrequiremobilityControls" runat="server">
                                            <div class="form-group">
                                                <label>Provide details of the mobility/care concerns that apply to you and how they are addressed</label>
                                                <textarea name="" class="form-control" runat="server" id="txtdescriptionofmobility"></textarea>
                                            </div>                                       
                                    </div>  
                                </div>
                                <%-- 55--%>
                                 <div class="form-group">
                                    <label><b class="ques-lbl">55)</b> Do you intend performing medical procedures (eg. as a practising/trainee doctor, dentist, nurse) during your stay in Australia?</label>
                                    <div class="form-check-inline">
                                        <label class="form-check-label">
                                        <input type="radio" class="form-check-input" name="medicalprocedures" runat="server" id="rbmedicalproceduresNo">No
                                        </label>
                                    </div>
                                    <div class="form-check-inline">
                                        <label class="form-check-label">
                                        <input type="radio" class="form-check-input" name="medicalprocedures" runat="server" id="rbmedicalproceduresYes">Yes
                                        </label>
                                    </div>
                                    <div id="showmedicalproceduresControls" runat="server">                                        
                                            <div class="form-group">
                                                <label>Provide details of the medical/dental/nursing procedures you may be involved with in Australia</label>
                                                <textarea name="" class="form-control" runat="server" id="txtproceduresdescription"></textarea>
                                            </div>                                        
                                    </div>  
                                </div>
                                <%--56--%>
                                 <div class="form-group">
                                    <label><b class="ques-lbl">56)</b> Have you, or any member of your family unit included in this application:56	During your proposed visit to Australia, do you, or any children included in this application, expect to incur medical costs, or require treatment or medical follow up for:</label>
                                        <ul>
                                            <li>	blood disorder</li>
                                            <li>	cancer</li>
                                            <li>	heart disease</li>
                                        </ul>
                                    
                                    <div class="form-check-inline">
                                        <label class="form-check-label">
                                        <input type="radio" class="form-check-input" name="medicalfollowup" runat="server" id="rbmedicalfollowupNo">No
                                        </label>
                                    </div>
                                    <div class="form-check-inline">
                                        <label class="form-check-label">
                                        <input type="radio" class="form-check-input" name="medicalfollowup" runat="server" id="rbmedicalfollowupYes">Yes
                                        </label>
                                    </div>
                                    <div id="showmedicalfollowupControls" runat="server">
                                        <div class="form-group">
                                            <label>Give Details</label>
                                            <textarea name="" class="form-control" runat="server" id="txtmedicalfollowupdescription"></textarea>
                                        </div>
                                        <div class="form-group">
                                            <label>You are strongly advised to carry certification of your vaccination status, especially for children attending Australian child care centres (including preschools and creches) and schools. Vaccination against polio, tetanus, measles, mumps, rubella, diphtheria, pertussis (whooping cough), Haemophilus influenzae hypo B (Hib), and Hepatitis B is recommended for children, with certification sought at time of child care centre (including preschool and creche) and school enrolment. Vaccination against rubella is also recommended for women of child bearing age.</label>
                                            
                                        </div>
                                    </div>
                                </div>
                                 <%--57--%>
                                 <div class="form-group">
                                    <label><b class="ques-lbl">57)</b> Have you, or any member of your family unit 57	Have you, or any member of your family unit</label>
                                    <div>
                                        <label>
                                         	•  been convicted of a crime or offence in any country (including any conviction which is now removed from official records)?
                                        </label>
                                    </div>
                                    <div class="form-check-inline">
                                        <label class="form-check-label">
                                        <input type="radio" class="form-check-input" name="convicted" runat="server" id="rbconvictedNo">No
                                        </label>
                                    </div>
                                    <div class="form-check-inline">
                                        <label class="form-check-label">
                                        <input type="radio" class="form-check-input" name="convicted" runat="server" id="rbconvictedYes">Yes
                                        </label>
                                    </div>
                                    <div>
                                        <label>
                                          	•	been charged with any offence that is currently awaiting legal action?
                                        </label>
                                    </div>
                                    <div class="form-check-inline">
                                        <label class="form-check-label">
                                        <input type="radio" class="form-check-input" name="chargeoffence" runat="server" id="rbchargeoffenceNo">No
                                        </label>
                                    </div>
                                    <div class="form-check-inline">
                                        <label class="form-check-label">
                                        <input type="radio" class="form-check-input" name="chargeoffence" runat="server" id="rbchargeoffenceYes">Yes
                                        </label>
                                    </div>
                                     <div>
                                        <label>
                                         	• 	been acquitted of any criminal offence or other offence on the grounds of mental been acquitted of any criminal offence or other offence on the grounds of mental
                                        </label>
                                    </div>
                                    <div class="form-check-inline">
                                        <label class="form-check-label">
                                        <input type="radio" class="form-check-input" name="criminaloffence" runat="server" id="rbcriminaloffenceNo">No
                                        </label>
                                    </div>
                                    <div class="form-check-inline">
                                        <label class="form-check-label">
                                        <input type="radio" class="form-check-input" name="criminaloffence" runat="server" id="rbcriminaloffenceYes">Yes
                                        </label>
                                    </div>
                                     <div>
                                        <label>
                                          		•	been removed or deported from any country (including Australia)?
                                        </label>
                                    </div>
                                    <div class="form-check-inline">
                                        <label class="form-check-label">
                                        <input type="radio" class="form-check-input" name="removedfromcountry" runat="server" id="rbremovedfromcountryNo">No
                                        </label>
                                    </div>
                                    <div class="form-check-inline">
                                        <label class="form-check-label">
                                        <input type="radio" class="form-check-input" name="removedfromcountry" runat="server" id="rbremovedfromcountryYes">Yes
                                        </label>
                                    </div>
                                    <div>
                                        <label>
                                          		•	left any country to avoid being removed or deported?
                                        </label>
                                    </div>
                                    <div class="form-check-inline">
                                        <label class="form-check-label">
                                        <input type="radio" class="form-check-input" name="toavoidbeingremoved" runat="server" id="rbtoavoidbeingremovedNo">No
                                        </label>
                                    </div>
                                    <div class="form-check-inline">
                                        <label class="form-check-label">
                                        <input type="radio" class="form-check-input" name="toavoidbeingremoved" runat="server" id="rbtoavoidbeingremovedYes">Yes
                                        </label>
                                    </div>
                                    <div>
                                        <label>
                                          		•	been excluded from or asked to leave any country (including Australia)?
                                        </label>
                                    </div>
                                    <div class="form-check-inline">
                                        <label class="form-check-label">
                                        <input type="radio" class="form-check-input" name="beenexcluded" runat="server" id="rbbeenexcludedNo">No
                                        </label>
                                    </div>
                                    <div class="form-check-inline">
                                        <label class="form-check-label">
                                        <input type="radio" class="form-check-input" name="beenexcluded" runat="server" id="rbbeenexcludedYes">Yes
                                        </label>
                                    </div>
                                    <div>
                                        <label>
                                          		•	committed, or been involved in the commission of war crimes or crimes against humanity or human rights
                                        </label>
                                    </div>
                                    <div class="form-check-inline">
                                        <label class="form-check-label">
                                        <input type="radio" class="form-check-input" name="humanrightscrime" runat="server" id="rbhumanrightscrimeNo">No
                                        </label>
                                    </div>
                                    <div class="form-check-inline">
                                        <label class="form-check-label">
                                        <input type="radio" class="form-check-input" name="humanrightscrime" runat="server" id="rbhumanrightscrimeYes">Yes
                                        </label>
                                    </div>
                                    <div>
                                        <label>
                                          		•	been involved in any activities that would represent a risk to Australian national security
                                        </label>
                                    </div>
                                    <div class="form-check-inline">
                                        <label class="form-check-label">
                                        <input type="radio" class="form-check-input" name="risktonationalsecurity" runat="server" id="rbrisktonationalsecurityNo">No
                                        </label>
                                    </div>
                                    <div class="form-check-inline">
                                        <label class="form-check-label">
                                        <input type="radio" class="form-check-input" name="risktonationalsecurity" runat="server" id="rbrisktonationalsecurityYes">Yes
                                        </label>
                                    </div>
                                     <div>
                                        <label>
                                         •	had any outstanding debts to the Australian Government or any public authority in Australia?
                                        </label>
                                    </div>
                                    <div class="form-check-inline">
                                        <label class="form-check-label">
                                        <input type="radio" class="form-check-input" name="outstandingdebets" runat="server" id="rboutstandingdebetsNo">No
                                        </label>
                                    </div>
                                    <div class="form-check-inline">
                                        <label class="form-check-label">
                                        <input type="radio" class="form-check-input" name="outstandingdebets" runat="server" id="rboutstandingdebetsYes">Yes
                                        </label>
                                    </div>
                                    <div>
                                        <label>
                                        •	been involved in any activity, or been convicted of any offence, relating to the illegal movement of people to any country (including Australia)?

                                        </label>
                                    </div>
                                    <div class="form-check-inline">
                                        <label class="form-check-label">
                                        <input type="radio" class="form-check-input" name="convictedoffence" runat="server" id="rbconvictedoffenceNo">No
                                        </label>
                                    </div>
                                    <div class="form-check-inline">
                                        <label class="form-check-label">
                                        <input type="radio" class="form-check-input" name="convictedoffence" runat="server" id="rbconvictedoffenceYes">Yes
                                        </label>
                                    </div>
                                     <div>
                                        <label>
                                      •	served in a military force or state sponsored/private militia, undergone any military/paramilitary training, or been trained in weapons/explosives use (however described)?
                                        </label>
                                    </div>
                                    <div class="form-check-inline">
                                        <label class="form-check-label">
                                        <input type="radio" class="form-check-input" name="servedinmilitaryforce" runat="server" id="rbservedinmilitaryforceNo">No
                                        </label>
                                    </div>
                                    <div class="form-check-inline">
                                        <label class="form-check-label">
                                        <input type="radio" class="form-check-input" name="servedinmilitaryforce" runat="server" id="rbservedinmilitaryforceYes">Yes
                                        </label>
                                    </div>
                                     <div>
                                        <label>
                                     If you answered ‘Yes’ to any of the above questions, you must state who it applies to and give ALL relevant details.
                                            If the matter relates to a criminal conviction, please give the nature of the offence, 
                                            full details of sentence and dates of any period of imprisonment or other detention.
                                If insufficient space, attach an additional statement.

                                        </label>
                                    </div>
                                    <div class="form-check-inline">
                                        <label class="form-check-label">
                                            <textarea id="descripofcharacterdeclaration" runat="server" class="form-control" rows="3"> </textarea>
                                        </label>
                                    </div>
                                    
                                </div>
                                 <div class="frm-lblttl">Accommodation/welfare arrangements for students under 18 years of age</div>
                                 <%--58--%>
                                 <div class="form-group">
                                    <label><b class="ques-lbl">58)</b>Are you under 18 years of age?<br>
                                        Note: Depending on your Assessment Level, you may need to meet a minimum age or education standard requirement. Refer to information
                                        form 1219i Overseas Student Program – Assessment Levels and the department’s website for more details.
                                    </label>
                                    <div class="form-check-inline">
                                        <label class="form-check-label">
                                        <input type="radio" class="form-check-input" name="under18age" runat="server" id="rbunder18ageNo">No
                                        </label>
                                    </div>
                                    <div class="form-check-inline">
                                        <label class="form-check-label">
                                        <input type="radio" class="form-check-input" name="under18age" runat="server" id="rbunder18ageYes">Yes
                                        </label>
                                    </div>
                                    <div id="showYes" runat="server">
                                        <div class="form-group">
                                            <label>Questions 59 (and either question 60, 61, 63 or 64) and the declaration at 65 must be completed on your behalf by your parents or a person(s) who has legal custody of you, 
                                                as you are under 18 years of age. If your parents or a person(s) who has legal custody of you have not made adequate
                                                arrangements for your accommodation, support and general welfare while in Australia, a student visa cannot be granted. Evidence of their relationship to you must be provided.
                                            </label>
                                           
                                        </div>                                       
                                    </div>
                                    <div id="showNo" runat="server">
                                        <div class="form-group">
                                            <label>Go to Question 68</label>                                            
                                        </div>                                       
                                    </div> 
                                </div>
                                 <%--59--%>
                                 <div class="form-group" runat="server" id="question59">
                                     <label><b class="ques-lbl">59)</b> This question, and other questions as indicated,<b>must be completed by the parents, or person(s) who has legal custody of the applicant under 18 years of age</b></label>
                                     <br>
                                     <label>Which statement best explains your situation?</label>                                     
                                    <div class="form-check-inline">
                                        <label class="form-check-label">
                                        <label>I am a parent or person who has legal custody of the student applicant and I am going to accompany the child to Australia</label>
                                        <input type="radio" class="form-check-input" name="gotoquestion" runat="server" id="gotoquestion60">>Go to Question 60
                                        </label>
                                    </div>
                                    <div class="form-check-inline">
                                        <label class="form-check-label">
                                         <label> I am a parent or person who has legal custody of the student applicant and have made arrangements for the child to stay in Australia with a relative* who is 21 years of age or older</label>                                            
                                        <input type="radio" class="form-check-input" name="gotoquestion" runat="server" id="gotoquestion61">Go to Question 61

                                          <label> * A relative is defined under the Migration Regulations as a spouse, child, adopted child, parent, brother, sister, step-child, step-parent,
                                              step-brother, step-sister, grandparent, grandchild, aunt, uncle, niece or nephew, or a step-grandparent, step-grandchild, step-aunt, step-uncle, step-niece or step-nephew
                                          </label>  
                                        </label>
                                    </div>
                                    <div class="form-check-inline">
                                        <label class="form-check-label">
                                         <label> The student applicant will not be accompanied by either a parent or a person who has legal custody, and will not stay in Australia with a relative who is 21 years of age or older. </label>                                            
                                         <input type="radio" class="form-check-input" name="gotoquestion" runat="server" id="gotoquestion64">Go to Question 64
                                        </label>
                                    </div>
                                 </div>

                                 <%--60--%>
                                  <div class="form-group" runat="server" id="question60">
                                    <label><b class="ques-lbl">60)</b> As the parent or a person who has legal custody of a student applicant under 18 years of age, do you hold or have you applied for a visa (eg. Student Guardian visa – subclass 580) to accompany your child during their stay in Australia?</label>
                                    <div class="form-check-inline">
                                        <label class="form-check-label">
                                        <input type="radio" class="form-check-input" name="holdorappliedVisa" runat="server" id="rbholdorappliedVisaNo">No
                                        </label>
                                    </div>
                                    <div class="form-check-inline">
                                        <label class="form-check-label">
                                        <input type="radio" class="form-check-input" name="holdorappliedVisa" runat="server" id="rbholdorappliedVisaYes">Yes
                                        </label>
                                    </div>
                                    <div id="controls" runat="server">
                                        <div class="form-group">
                                            <label>family Name</label>
                                            <input type="text" name="" class="form-control" runat="server" id="txtfamilyname"/>
                                        </div>
                                        <div class="form-group">
                                            <label>Given Name</label>
                                            <input type="text" name="" class="form-control" runat="server" id="txtgivenname"/>
                                        </div>
                                        <div class="form-group">
                                            <label>Date of birth</label>
							                <input id="txtdob" runat="server" type="text" class="form-control" placeholder="Birth Date" data-toggle="flatpickr" value="">
                                        </div>
                                        <div class="form-group">
                                            <label>Your intended address in Australia</label>
                                          <textarea id="txtaddressinaustralia" runat="server" class="form-control"></textarea>
                                        </div>
                                         <div class="form-check-inline">
                                            <label class="form-check-label">
                                            <input type="radio" class="form-check-input" name="visastatus" runat="server" id="rbvisastatusgranted">Granted
                                            </label>
                                        </div>
                                        <div class="form-check-inline">
                                            <label class="form-check-label">
                                            <input type="radio" class="form-check-input" name="visastatus" runat="server" id="rbvisastatusnmotyetdecided">Not Yet Decided
                                            </label>
                                        </div>
                                        <div class="form-group" id="grantedcontrols" runat="server">
                                             <div class="form-group">
                                                <label>Visa label Number</label>
							                    <input type="text" name="" id="visanumber" runat="server" class="form-control"/>
                                                 <label>If granted a visa without a label, provide the 13-digit visa grant number (as shown on the letter notifying you of visa grant).</label>
                                                 <input type="text" name="" id="digitvisano" runat="server" class="form-control"/>
                                            </div>
                                            <div class="form-group">
                                                <label>period of stay</label>
                                                <input type="text" name="" class="form-control" runat="server" id="txtperiodofstay"/>
                                            </div>
                                            <div class="form-group">
                                                <label>Expiry Date</label>
							                    <input id="txtvisaexpirydate" runat="server" type="text" class="form-control" placeholder="DAY/MONTH/YEAR" data-toggle="flatpickr" value="">
                                            </div>
                                        </div>
                                        <div class="form-group" id="notdecidedcontrols" runat="server">
                                            <div class="form-group">
                                                <label>Australian Government office where application lodged </label>
                                                <input type="text" name="" class="form-control" runat="server" id="txtgovermentofficename"/>
                                            </div>
                                        </div>
                                    </div>  
                                </div>
                                 <%--61--%>
                                  <div class="form-group" runat="server" id="question61">
                                    <label><b class="ques-lbl">61)</b>As the parents or a person(s) who has legal custody of a student applicant under 18 years of age, have you made arrangements with a relative who is at least 21 years of age and of good character with whom your child will stay in Australia?</label>
                                    <div class="form-check-inline">
                                        <label class="form-check-label">
                                        <input type="radio" class="form-check-input" name="arrangementwithrelative" runat="server" id="rbarrangementwithrelativeNo">No
                                        </label>
                                    </div>
                                    <div class="form-check-inline">
                                        <label class="form-check-label">
                                        <input type="radio" class="form-check-input" name="arrangementwithrelative" runat="server" id="rbarrangementwithrelativeYes">Yes
                                        </label>
                                    </div>
                                    <div id="arrangementwithrelativeControls" runat="server">
                                        <div class="form-group">
                                            <label>Family Name</label>
                                             <input type="text" name="" class="form-control" runat="server" id="txtfamilyNameofrelative"/>
                                        </div>
                                        <div class="form-group">
                                            <label>Family Name</label>
                                             <input type="text" name="" class="form-control" runat="server" id="txtgivenNameofrelative"/>
                                        </div>
                                       <div class="form-group">
                                            <label>Date of birth</label>
							                <input id="txtdateOfBirth" runat="server" type="text" class="form-control" placeholder="Birth Date" data-toggle="flatpickr" value="">
                                       </div>
                                        <div class="form-group">
                                            <label>Address of Relative in australia</label>
                                             <textarea name="" class="form-control" runat="server" id="txtaddressofRelative"></textarea>
                                        </div>
                                        <div class="form-group">
                                            <label>Relationship of relative to the child</label>
                                             <input type="text" name="" class="form-control" runat="server" id="txtrelationshipofrelative"/>
                                        </div>
                                    </div>  
                                </div>
    
                                 <%--62--%>
                                  <div class="form-group" runat="server" id="question62">
                                    <label><b class="ques-lbl">62)</b> Will your relative reside in Australia as:</label>
                                    <div class="form-check-inline">
                                        <label class="form-check-label">
                                        <input type="radio" class="form-check-input" name="relativeresideas" runat="server" id="permanentresident">an Australian citizen or permanent resident
                                        </label>
                                    </div>
                                    <div class="form-check-inline">
                                        <label class="form-check-label">
                                        <input type="radio" class="form-check-input" name="relativeresideas" runat="server" id="Temporaryresident">a Temporary resident
                                        </label>
                                    </div>
                                    <div id="relativeresideasControls" runat="server">                                        
                                        <div class="form-group">
                                            <label>How long are they permitted to stay in Australia?</label>
                                            <input type="text" name="" class="form-control" runat="server" id="txtpermitedtostay"/>
                                        </div> 
                                        <div class="form-group">
                                            <label>OR until</label>
                                             <input id="txtuntildate" runat="server" type="text" class="form-control" placeholder="DAY/MONTH/YEAR" data-toggle="flatpickr" value="">
                                        </div> 
                                    </div>  
                                </div>
                                 <%--63--%>
                                 <div class="form-group" runat="server" id="question63">
                                    <label><b class="ques-lbl">63)</b>Give details of your relative’s Student Guardian visa application?</label>
                                    <div class="form-check-inline">
                                        <label class="form-check-label">
                                        <input type="radio" class="form-check-input" name="guardianvisasatus" runat="server" id="rbguardianvisagranted">granted
                                        </label>
                                    </div>
                                    <div class="form-check-inline">
                                        <label class="form-check-label">
                                        <input type="radio" class="form-check-input" name="guardianvisasatus" runat="server" id="rbguardianvisanotyrtdecided">Note Yet Decided
                                        </label>
                                    </div>
                                    <div id="guardianvisagrantedControls" runat="server">                                        
                                        <div class="form-group">
                                            <label>VIsa Label Number</label>
                                            <input type="text" name="" class="form-control" runat="server" id="txtguardianvisano"/>
                                        </div> 
                                        <div class="form-group">
                                            <label>period of stay</label>
                                            <input type="text" name="" class="form-control" runat="server" id="txtguardianvisaperiodofstay"/>
                                        </div>
                                        <div class="form-group">
                                            <label>Expiry Date</label>
							                <input id="txtguardianvisaexpirydate" runat="server" type="text" class="form-control" placeholder="DAY/MONTH/YEAR" data-toggle="flatpickr" value="">
                                        </div>
                                    </div> 
                                    <div id="guardianvisanotyrtdecidedControls" runat="server">         
                                        <div class="form-group">
                                            <label>Australian Government office where application lodged</label>
                                            <input type="text" name="" class="form-control" runat="server" id="txtgovermentoffName"/>
                                        </div> 
                                        <div class="form-group">
                                            <label>Period of stay sought</label>
                                            <input type="text" name="" class="form-control" runat="server" id="txtperiodofstayofguardian" placeholder="months"/>
                                        </div>                                        
                                    </div>
                                </div>

                                 <%--64--%>
                                  <div class="form-group" runat="server" id="question64">
                                    <label><b class="ques-lbl">64)</b> As the parents or a person(s) who has legal custody of a student applicant under 18 years of age, who is neither being accompanied by you nor staying with a relative who is at least 21 years of age, have you obtained a written statement from your child’s education provider(s) that accommodation, support and general welfare arrangements for your child are appropriate?</label>
                                    <div class="form-check-inline">
                                        <label class="form-check-label">
                                        <input type="radio" class="form-check-input" name="welfarearrangements" runat="server" id="rbwelfarearrangementsNo">No
                                        </label>
                                    </div>
                                    <div class="form-check-inline">
                                        <label class="form-check-label">
                                        <input type="radio" class="form-check-input" name="welfarearrangements" runat="server" id="rbwelfarearrangementsYes">Yes
                                        </label>
                                    </div>
                                    <div id="welfarearrangementsIfYesShow" runat="server">
                                        <div class="form-group">
                                            <label>Please attach the original signed undertaking from the education provider</label>                                                
                                        </div>                                       
                                    </div>  
                                </div>
                                 <%--65--%>
                                  <div class="form-group" runat="server" id="question65">
                                      <label><b class="ques-lbl">65)</b> I am satisfied with the reception, care and support arrangements that have been made in Australia for my dependent child under 18 years of age.
                                          <br><b>Note: Both parents must sign this declaration.</b>
                                      </label>
                                      <div class="form-group">
                                          <label>Signature of parent/person who has legal custody</label>
                                          <textarea runat="server" class="form-control" id="parentsignature"></textarea>
                                      </div>
                                      <div class="form-group">
                                          <label>Date</label>
                                          <input id="date" runat="server" type="text" class="form-control" placeholder="" data-toggle="flatpickr" value="">
                                      </div>
                                      <div class="form-group">
                                        <label>Full name (print in English)</label>
                                        <input type="text" name="" class="form-control" runat="server" id="txtparentfullname"/>
                                     </div>
                                     <div class="form-group">
                                        <label>Relationship to student applicant</label>
                                        <input type="text" name="" class="form-control" runat="server" id="txtrelationwithstudent"/>
                                     </div>
                                      <div class="form-group"  runat="server">
                                            <label><b>Signature of parent/person who has legal custody</b></label>
                                             <input type="text" name="" id="parentsignature1" class="form-control" runat="server">
                                      </div>                                      
                                      <div class="form-group">
                                          <label>Date</label>
                                          <input id="date1" runat="server" type="text" class="form-control" placeholder="" data-toggle="flatpickr" value="">
                                      </div>
                                      <div class="form-group">
                                        <label>Full name (print in English)</label>
                                        <input type="text" name="" class="form-control" runat="server" id="txtparentfullname1"/>
                                     </div>
                                     <div class="form-group">
                                        <label>Relationship to student applicant</label>
                                        <input type="text" name="" class="form-control" runat="server" id="txtrelationwithstudent1"/>
                                     </div>
                                 </div>
                                
                                 <%-- 66--%>
                                 <div class="form-group" runat="server" id="question66">
                                     <div class="frm-lblttl">Custody arrangements for students under 18 years of age</div>
                                     <label> <b class="ques-lbl">66)</b>	Do you have the sole legal right to determine where the applicant will live or to remove the applicant from their country of usual residence?</label>                                    
                                    <div class="form-check-inline">
                                        <label class="form-check-label">
                                        <input type="radio" class="form-check-input" name="solelegalrights" runat="server" id="rbsolelegalrightsNo">No
                                        </label>
                                    </div>
                                    <div class="form-check-inline">
                                        <label class="form-check-label">
                                        <input type="radio" class="form-check-input" name="solelegalrights" runat="server" id="rbsolelegalrightsYes">Yes
                                        </label>
                                    </div>
                                    <div runat="server" id="solelegalrightscontrols">
                                        <label>Provide details of ALL other people who have custody, access or guardianship rights in relation to the applicantIf there is more than one person, please attach details.</label>
                                        <div class="form-group">
                                            <label>Name</label>
                                            <input type="text" name="" class="form-control" runat="server" id="txtpersonname"/>
                                         </div>
                                        <div class="form-group">
                                            <label>Address</label>
                                            <input type="text" name="" class="form-control" runat="server" id="txtpersonaddress"/>
                                         </div>
                                        <div class="form-group">
                                            <label>Telephone Number</label>
                                            <input type="text" name="" class="form-control" runat="server" id="txtpersoncontactno"/>
                                         </div>
                                        <div class="form-group">
                                            <label>Relationship</label>
                                            <input type="text" name="" class="form-control" runat="server" id="txtpersonrelationship"/>
                                         </div>
                                        <div class="form-group">
                                            <label>Nature of legal rights</label>
                                            <input type="text" name="" class="form-control" runat="server" id="txtpersonnatureoflegalrights"/>
                                         </div>
                                     </div>
                                 </div>

                                 <%--67--%>
                                 <div class="form-group" runat="server" id="question67">
                                      <label><b class="ques-lbl">67)</b>	Declaration by the parent(s) or person(s) with legal custody of a student visa applicant under 18 years of age
                                          I am not aware of any reason why the visa applicant should not travel to Australia (the custody/access/guardianship rights of another person are not affected).
                                      </label>
                                      <div class="form-group">
                                          <label>Signature of parent/person who has legal custody</label>
                                          <input type="text" runat="server" class="form-control" id="txtparentsignatur67"/>
                                      </div>
                                      <div class="form-group">
                                          <label>Date</label>
                                          <input id="txtsignDate" runat="server" type="text" class="form-control" placeholder="" data-toggle="flatpickr" value="">
                                      </div>
                                      <div class="form-group">
                                        <label>Full name (print in English)</label>
                                        <input type="text" name="" class="form-control" runat="server" id="txtfullname67"/>
                                     </div>
                                     <div class="form-group">
                                        <label>Relationship to student applicant</label>
                                        <input type="text" name="" class="form-control" runat="server" id="txtrelationship67"/>
                                     </div>
                                      <div class="form-group"  runat="server">
                                            <label><b>Signature of parent/person who has legal custody</b></label>
                                            <input type="text" class="form-control" name="" id="parentsignatur67" runat="server">
                                      </div>                                          
                                      <div class="form-group">
                                          <label>Date</label>
                                          <input id="txtsignDate1" runat="server" type="text" class="form-control" placeholder="" data-toggle="flatpickr" value="">
                                      </div>
                                      <div class="form-group">
                                        <label>Full name (print in English)</label>
                                        <input type="text" name="" class="form-control" runat="server" id="fullname67"/>
                                     </div>
                                     <div class="form-group">
                                        <label>Relationship to student applicant</label>
                                        <input type="text" name="" class="form-control" runat="server" id="relationship67"/>
                                     </div>
                                 </div>
                                 <div class="frm-lblttl">Assistance with this form</div>
                                 <%--68--%>
                                  <div class="form-group" runat="server" id="question68">
                                     <label> <b class="ques-lbl">68)</b> Did you receive assistance in completing this form?</label>                                    
                                    <div class="form-check-inline">
                                        <label class="form-check-label">
                                        <input type="radio" class="form-check-input" name="receiveassistance" runat="server" id="rbreceiveassistanceNo">No
                                        </label>
                                    </div>
                                    <div class="form-check-inline">
                                        <label class="form-check-label">
                                        <input type="radio" class="form-check-input" name="receiveassistance" runat="server" id="rbreceiveassistanceYes">Yes
                                        </label>
                                    </div>
                                    <div class="form-group" runat="server" id="receiveassistanceontrols">
                                        <div class="form-group">
                                        <label>Title</label>
                                        <asp:DropDownList runat="server" ID="ddltitle"></asp:DropDownList>
                                     </div>
                                     <div class="form-group">
                                        <label>family name</label>
                                        <input type="text" name="" class="form-control" runat="server" id="txtassistedpersonfamilyname"/>
                                     </div>
                                     <div class="form-group">
                                        <label>given name</label>
                                        <input type="text" name="" class="form-control" runat="server" id="txtassistedpersongivenname"/>
                                     </div>
                                    <div class="form-group">
                                        <label>Address</label>
                                        <textarea runat="server" id="txtaddress"></textarea>
                                     </div>
                                    <div class="form-group">
                                        <label>Telephone number or daytime contact</label>
                                        <label>Office Hourse</label>
                                        <input type="text" name="" class="form-control" runat="server" id="txtassistedpersonofficeno"/>
                                        </div>
                                    <div class="form-group">
                                        <label>Mobile Numebr</label>
                                        <input type="text" name="" class="form-control" runat="server" id="txtassistedpersonmobileno"/>
                                     </div>
                                    </div>
                                 </div>
                                 <%--69--%>
                                 <div class="form-group" runat="server" id="question69">
                                     <label> <b class="ques-lbl">69)</b>Is your agent registered with the Migration Agents Registration Authority (MARA)?</label>                                    
                                    <div class="form-check-inline">
                                        <label class="form-check-label">
                                        <input type="radio" class="form-check-input" name="mara" runat="server" id="maraNO">No
                                        </label>
                                    </div>
                                    <div class="form-check-inline">
                                        <label class="form-check-label">
                                        <input type="radio" class="form-check-input" name="mara" runat="server" id="maraYes">Yes
                                        </label>
                                    </div>
                                  </div>
                                    <%--70--%>
                                 <div class="form-group" runat="server" id="question70">
                                     <label> <b class="ques-lbl">70)</b> Is the person an education agent? </label>                                    
                                    <div class="form-check-inline">
                                        <label class="form-check-label">
                                        <input type="radio" class="form-check-input" name="educationagent" runat="server" id="rbeducationagentNo">No
                                        </label>
                                    </div>
                                    <div class="form-check-inline">
                                        <label class="form-check-label">
                                        <input type="radio" class="form-check-input" name="educationagent" runat="server" id="rbeducationagentYes">Yes
                                        </label>
                                    </div>
                                    <div class="form-group" runat="server" id="educationagentcontrols">
                                        
                                     <div class="form-group">
                                        <label>Education Agency Business Name</label>
                                        <input type="text" name="" class="form-control" runat="server" id="txtbusinessname"/>
                                     </div>
                                     <div class="form-group">
                                        <label>Education Agent Registration Number (if known)</label>
                                        <input type="text" name="" class="form-control" runat="server" id="txtregistrationno"/>
                                     </div>
                                    <div class="form-group">
                                        <label>Address (if different from address given in Question 68)</label>
                                        <textarea runat="server" id="txteducationagentaddress"></textarea>
                                     </div>
                                    <div class="form-group">
                                        <label>E-mail address</label>
                                        <input type="text" runat="server" id="txteducationagentemail" />
                                     </div>
                                    <div class="form-group">
                                        <label>Telephone number or daytime contact</label>
                                        <label>Office Hourse</label>
                                        <input type="text" name="" class="form-control" runat="server" id="txteducationagentofficeno"/>

                                        <label>Mobile Numebr</label>
                                        <input type="text" name="" class="form-control" runat="server" id="txteducationagentphoneno"/>

                                        <label>Fax Number</label>
                                         <input type="text" name="" class="form-control" runat="server" id="txteducationagentfaxno"/>
                                     </div>
                                    </div>
                                 </div>
                                 <%--71--%>
                                  <div class="form-group" runat="server" id="question71">
                                     <label> <b class="ques-lbl">71)</b> Is your agent in Australia?</label>                                    
                                    <div class="form-check-inline">
                                        <label class="form-check-label">
                                        <input type="radio" class="form-check-input" name="agentinauttalia" runat="server" id="rbagentinauttaliaNo">No
                                        </label>
                                    </div>
                                    <div class="form-check-inline">
                                        <label class="form-check-label">
                                        <input type="radio" class="form-check-input" name="agentinauttalia" runat="server" id="rbagentinauttaliaYes">Yes
                                        </label>
                                    </div>
                                  </div>
                                 <%--72--%>
                                 <div class="form-group" runat="server" id="question72">
                                     <label> <b class="ques-lbl">72)</b> Did you pay the person and/or give a gift for this assistance? </label>                                    
                                    <div class="form-check-inline">
                                        <label class="form-check-label">
                                        <input type="radio" class="form-check-input" name="paytoassistance" runat="server" id="rbpaytoassistanceNo">No
                                        </label>
                                    </div>
                                    <div class="form-check-inline">
                                        <label class="form-check-label">
                                        <input type="radio" class="form-check-input" name="paytoassistance" runat="server" id="rbpaytoassistanceYes">Yes
                                        </label>
                                    </div>
                                     <div id="paytoassistanceContreols" runat="server">
                                         <div class="form-group">
                                          <label>How much did you pay?</label>
                                          <input type="text" name="" class="form-control" runat="server" id="txthowmuchyoupay" placeholder="A$"/>
                                        </div>
                                         <div class="form-group">
                                             <label>What kind of gift did you give? (eg. jewellery)</label>
                                             <input type="text" name="" class="form-control" runat="server" id="txtgiftgiven" />
                                         </div>
                                         <div class="form-group">
                                            <label>Value of gift (approximately)</label>
                                            <input type="text" name="" class="form-control" runat="server" id="txtvalueofgift" placeholder="A$"/>
                                        </div>
                                     </div>
                                  </div>

                                 <div class="frm-lblttl">Options for receiving written communications</div>
                                 <%--73--%>
                                 <div class="form-group" runat="server" id="question73"> 
                                     <label><b class="ques-lbl">73)</b>All written communications about this application should be sent to:(Tick one box only) </label>                               
                                    <div class="form-check">
                                        <label class="form-check-label">                                        
                                        <input type="radio" class="form-check-input" name="writtencommunications" runat="server" id="rbmyself">Myself
                                            <label> All written communications will be sent to the address for communications that you have provided in this form.Go to Question 81</label>
                                        </label>
                                    </div>
                                    <div class="form-check">
                                        <label class="form-check-label">
                                        <input type="radio" class="form-check-input" name="writtencommunications" runat="server" id="rbmigrationagent">Australian registered migration agent
                                            <label>Go to Question 78</label>
                                        </label>
                                    </div>
                                    <div class="form-check">
                                        <label class="form-check-label">
                                        <input type="radio" class="form-check-input" name="writtencommunications" runat="server" id="rbOffshoreagent">Offshore agent
                                            <label>Go to Question 78</label>
                                        </label>
                                    </div>
                                        <div class="form-check">
                                        <label class="form-check-label">
                                        <input type="radio" class="form-check-input" name="writtencommunications" runat="server" id="rbAgentexempted">Agent exempted from registration
                                            <label>You must complete form 956 Appointment of a migration agent and attach it to this application form. Go to Question 81</label>
                                        </label>
                                    </div>
                                    <div class="form-check">
                                        <label class="form-check-label">
                                        <input type="radio" class="form-check-input" name="writtencommunications" runat="server" id="rbAuthorisedrecipient">Authorised recipient
                                            <label> This is a person authorised to only receive written communications. All written communications that would otherwise have been sent to you in relation to this application will be sent to that person</label>
                                        </label>
                                    </div>
                                 </div>
                                 <%--74--%>
                                  <div class="form-group" runat="server" id="question74">
                                     <label> <b class="ques-lbl">74)</b> Do you want the authorised person to receive health and/or character information about you, your spouse or your dependants, that may arise, or be revealed, in the course of this application (for example, requests for medical investigation, other health information about you, or the results of criminal history checks)?</label>                                    
                                    <div class="form-check-inline">
                                        <label class="form-check-label">
                                        <input type="radio" class="form-check-input" name="authorisedperson" runat="server" id="rbauthorisedpersonNo">No
                                        </label>
                                    </div>
                                    <div class="form-check-inline">
                                        <label class="form-check-label">
                                        <input type="radio" class="form-check-input" name="authorisedperson" runat="server" id="rbauthorisedpersonYes">Yes
                                        </label>
                                    </div>
                                 </div>

                                 <%--75--%>
                                 <div class="form-group" runat="server" id="question75">
                                     
                                 <h5>Authorised recipient details
                                    <b>Note: Do NOT complete this section if you are acting as a migration agent, go to Question 78 </b></h5>
                                     <label> <b class="ques-lbl">75)</b> Provide details of the person who is authorised on your behalf to receive all written communications about this application.</label>                                                                        
                                      <div class="form-group">
                                        <label>Title</label>
                                        <asp:DropDownList runat="server" ID="ddltitle1" CssClass="form-control"></asp:DropDownList>
                                     </div>
                                     <div class="form-group">
                                        <label>family name</label>
                                        <input type="text" name="" class="form-control" runat="server" id="txtauthorisedpersofamilynname"/>
                                     </div>
                                     <div class="form-group">
                                        <label>given name</label>
                                        <input type="text" name="" class="form-control" runat="server" id="txtauthorisedpersongivenname"/>
                                     </div>
                                    <div class="form-group">
                                        <label>Address</label>
                                        <textarea runat="server" id="txtauthorisedpersonaddress" class="form-control" rows="3"></textarea>
                                     </div>
                                    <div class="form-group">
                                        <label>Telephone number or daytime contact</label>
                                        <label>Office Hourse</label>
                                        <input type="text" name="" class="form-control" runat="server" id="txtauthorisedpersonofficeno"/>

                                        <label>Mobile Numebr</label>
                                        <input type="text" name="" class="form-control" runat="server" id="txtauthorisedpersonmobileno"/>
                                     </div>
                                </div>
                                 
                               <%--76--%>
                                <div class="form-group" runat="server" id="question76">
                                    <div class="frm-lblttl">Authorised recipient consent</div>
                                     <label> <b class="ques-lbl">76)</b> 	As the authorised recipient named on this form, do you agree to the department communicating with you by fax, e-mail or other electronic means?</label>                                    
                                    <div class="form-check-inline">
                                        <label class="form-check-label">
                                        <input type="radio" class="form-check-input" name="agreetocommunicate" runat="server" id="rbagreetocommunicateNO">No
                                        </label>
                                    </div>
                                    <div class="form-check-inline">
                                        <label class="form-check-label">
                                        <input type="radio" class="form-check-input" name="agreetocommunicate" runat="server" id="rbagreetocommunicateYes">Yes
                                        </label>
                                    </div>
                                     <div id="agreetocommunicatecontrols" runat="server">                                         
                                         <div class="form-group">
                                             <label>Fax number</label>
                                             <input type="text" name="" class="form-control" runat="server" id="txtFaxnumber" />
                                         </div>
                                         <div class="form-group">
                                            <label>E-mail address</label>
                                            <input type="text" name="" class="form-control" runat="server" id="txtEmailaddress"/>
                                        </div>
                                     </div>
                                  </div>
                                 <%--77--%>
                                 <div class="form-group" runat="server" id="question77">
                                     <label> <b class="ques-lbl">77)</b>I understand and accept that I am the person appointed by the applicant to receive all written communications.</label>                                    
                                     <div class="form-group"  runat="server">
                                            <label><b>Signature of authorised recipient</b></label>
                                             <input type="text" name="" id="txtsignatureauthorizedperson" class="form-control" runat="server">
                                      </div>                                      
                                     <div class="form-check-inline">
                                        <label> Date</label>
                                        <input id="txtdateofsign" runat="server" type="text" class="form-control" placeholder="" data-toggle="flatpickr" value="">
                                    </div>
                                     <label>>> Now go to Question 81</label>
                                  </div>

                                
                                 <%--78--%>
                                 <div class="form-group" runat="server" id="question78">
                                      <div class="frm-lblttl"> Agent details</div>
                                     <label><b class="ques-lbl">78)</b> Provide the details requested below about the agent who is authorised to act on your behalf and to receive all written communications about this application.</label>
                                      <div class="form-group">
                                            <label>Migration Agent Registration Number (MARN)</label>
                                          <input type="text" runat="server" class="form-control" id="txtmarnNo">
                                      </div>
                                     OR
                                     <div class="form-group">
                                            <label>Offshore Agent ID Number(if allocated by the department)</label>
                                          <input type="text" runat="server" class="form-control" id="txtoffshoreagentId">
                                      </div>
                                      <div class="form-group">
                                        <label>Title</label>
                                        <asp:DropDownList runat="server" ID="ddltitle3" CssClass="form-control"></asp:DropDownList>
                                     </div>
                                     <div class="form-group">
                                        <label>family name</label>
                                        <input type="text" name="" class="form-control" runat="server" id="txtagentfamilyname"/>
                                     </div>
                                     <div class="form-group">
                                        <label>given name</label>
                                        <input type="text" name="" class="form-control" runat="server" id="txtagentgivenname"/>
                                     </div>
                                     <div class="form-group">
                                        <label>Business or company name</label>
                                        <input type="text" name="" class="form-control" runat="server" id="txtagentcompanyname"/>
                                     </div>
                                    <div class="form-group">
                                        <label>Address</label>
                                        <textarea runat="server" id="txtagenntaddress" class="form-control" rows="3"></textarea>
                                     </div>
                                    <div class="form-group">
                                        <label>Telephone number or daytime contact</label>
                                        <label>Office Hourse</label>
                                        <input type="text" name="" class="form-control" runat="server" id="txtagentofficeno"/>

                                        <label>Mobile Numebr</label>
                                        <input type="text" name="" class="form-control" runat="server" id="txtagentmobileno"/>
                                     </div>
                                 </div>

                                 
                                 <%--79--%>
                                  <div class="form-group" runat="server" id="question79">
                                      <div class="frm-lblttl">Agent consent</div>
                                     <label> <b class="ques-lbl">79)</b> As the agent named on this form, do you agree to the department communicating with you by fax, e-mail or other electronic means? </label>                                    
                                    <div class="form-check-inline">
                                        <label class="form-check-label">
                                        <input type="radio" class="form-check-input" name="agentagreetocommunicate" runat="server" id="rbagentagreetocommunicateNo">No
                                        </label>
                                    </div>
                                    <div class="form-check-inline">
                                        <label class="form-check-label">
                                        <input type="radio" class="form-check-input" name="agentagreetocommunicate" runat="server" id="rbagentagreetocommunicateYes">Yes
                                        </label>
                                    </div>
                                     <div id="agentagreetocommunicateControls" runat="server">                                       
                                         <div class="form-group">
                                             <label>Fax number</label>
                                             <input type="text" name="" class="form-control" runat="server" id="txtagentfaxno" />
                                         </div>
                                         <div class="form-group">
                                            <label>E-mail address</label>
                                            <input type="text" name="" class="form-control" runat="server" id="txtagentemailaddress"/>
                                        </div>
                                     </div>
                                  </div>
                                 <%--80--%>
                                 <div class="form-group" runat="server" id="question80">
                                     <label> <b class="ques-lbl">80)</b>80	I understand and accept that I am the person appointed by the applicant to receive all written communications and act as his/her agent. </label>                                    
                                     <div class="form-group"  runat="server">
                                            <label><b>Signature of agent</b></label>
                                            <input type="text" name="" id="txtagentsignatures" class="form-control" runat="server">
                                      </div>                                        
                                     <div class="form-check-inline">
                                        <label> Date</label>
                                        <input id="txtagentsigndate" runat="server" type="text" class="form-control" placeholder="" data-toggle="flatpickr" value="">
                                    </div>                                     
                                  </div>

                                 <div class="frm-lblttl">Payment details</div>
                                 <%--81--%>
                                 <div class="form-group" runat="server" id="question81">
                                     <label><b class="ques-lbl">81</b>	How will you pay your application charge? (If applying in Australia, debit card or credit card are the preferred methods of payment.)</label>
                                     <div class="form-group">
                                         <div class="form-check-inline">
                                            <label class="form-check-label">
                                            <input type="radio" class="form-check-input" name="paymentmethod" runat="server" id="rbBankcheque">Bank cheque
                                                <label>If applying outside Australia, please check with the Australian Government office where you intend to lodge your application that you may pay by cheque.</label>
                                            </label>
                                        </div>
                                        <div class="form-check-inline">
                                            <label class="form-check-label">
                                            <input type="radio" class="form-check-input" name="paymentmethod" runat="server" id="rbMoneyorder">Money order 
                                            </label>
                                        </div>
                                        <div class="form-check-inline">
                                            <label class="form-check-label">
                                            <input type="radio" class="form-check-input" name="paymentmethod" runat="server" id="rbDebitcard">Debit card
                                                <label> This option is available in Australia only. It is not available for mailed applications.</label>
                                            </label>
                                        </div>
                                        <div class="form-check-inline">
                                            <label class="form-check-label">
                                            <input type="radio" class="form-check-input" name="paymentmethod" runat="server" id="rbCreditcard">Credit card 
                                                <label> Give details below.
                                                Note: This option is available where applications are made in Australia. If you are making the application outside Australia and wish to pay by credit card, please check with the Australian Government office about the availability of this option.</label>
                                            </label>
                                        </div>
                                     </div>
                                     <div class="form-group" runat="server" id="creditcardcontrols">
                                         <label>payment by</label>
                                          <div class="form-check-inline">
                                            <label class="form-check-label">
                                            <input type="radio" class="form-check-input" name="paymentby" runat="server" id="rbMasterCard">MasterCard                                              
                                            </label>
                                         </div>
                                         <div class="form-check-inline">
                                            <label class="form-check-label">
                                            <input type="radio" class="form-check-input" name="paymentby" runat="server" id="rbBankcard">Bankcard                                               
                                            </label>
                                         </div>
                                         <div class="form-check-inline">
                                            <label class="form-check-label">
                                            <input type="radio" class="form-check-input" name="paymentby" runat="server" id="rbAmericanExpress">American  Express                                              
                                            </label>
                                         </div>
                                         <div class="form-check-inline">
                                            <label class="form-check-label">
                                            <input type="radio" class="form-check-input" name="paymentby" runat="server" id="rbVisa">Visa                                               
                                            </label>
                                         </div>
                                         <div class="form-check-inline">
                                            <label class="form-check-label">
                                            <input type="radio" class="form-check-input" name="paymentby" runat="server" id="rbDinersClub">Diners Club                                              
                                            </label>
                                         </div>
                                         <div class="form-check-inline">
                                            <label class="form-check-label">
                                            <input type="radio" class="form-check-input" name="paymentby" runat="server" id="rbJCB">JCB                                              
                                            </label>
                                         </div>
                                         <div class="form-check-inline">
                                             <label>Australian Dollars</label>
                                             <input type="text" runat="server" id="txtamountinaustraliandollars">
                                             </div>
                                         <div class="form-check-inline">
                                             <label>Credit card number</label>
                                             <input type="text" runat="server" id="txtcreditcardno">
                                             </div>
                                          <div class="form-check-inline">
                                             <label>Expiry date</label>
                                             <input id="txtcreditcardexpirydate" runat="server" type="text" class="form-control" placeholder="" data-toggle="flatpickr" value="">
                                             </div>
                                          <div class="form-check-inline">
                                             <label>Cardholder’s name</label>
                                             <input type="text" runat="server" id="txtcardholdarname">
                                             </div>
                                         <div class="form-check-inline">
                                             <label>Telephone </label>
                                             <input type="text" runat="server" id="txtcontactnumber">
                                             </div>
                                         <div class="form-check-inline">
                                             <label>Address</label>
                                             <input type="text" runat="server" id="txtaddressofcardholder">
                                             </div>
                                         <div class="form-group"  runat="server">
                                            <label><b>Signature</b></label>
                                            <div class="fil-upload">
                                            <input type="file" name="" id="txtsignatureofcardholder" class="d-none" runat="server">
                                            <label for="txtsignatureofcardholder"></label>
                                            </div>
                                      </div>  
                                         
                                     </div>
                                 </div>
                               
                                 <%--82--%>
                                 <div class="form-group" runat="server" id="question82">
                                       <h5 class="frm-lblttl">Declaration</h5>
                                     <div class="comm-txt"><b> Before signing the declaration refer to the department’s website to ensure that you have attached all documentation listed for your Assessment Level and Education Sector visa subclass.</b></div>
                                    <label><b class="ques-lbl">82)</b>82	The following declaration must be signed and dated by all people over 18 years of age included in this application.</label>
                                    <div class="comm-txt">Both parents or any person who has legal custody must complete the declaration on behalf of any children under 18 years of age or any person who lacks the legal capacity to sign on their own behalf.</div>
                                     <ul class="italic">
                                         <li>I certify the information supplied on or with this form is correct.</li>
                                         <li>If granted a visa, I acknowledge that I am required to abide by its conditions as outlined in the information form 1160i Applying for a student visa.</li>
                                         <li>I declare that I have made adequate arrangements for health insurance for the period of my stay in Australia and I acknowledge that I am required to maintain these arrangements while in Australia as the holder of a student visa.</li>
                                         <li>I have attached all documentary evidence as specified on the department’s website for my Assessment Level and the visa subclass under which I am applying.</li>
                                         <li>I acknowledge that I understand that if the 8534 visa condition is imposed on my visa, it will be indicated by the condition code ‘8534’ and by the short description ‘No Further Stay’. I acknowledge that this means that the 8534 condition has been imposed on my visa and that I will not, while in Australia, be entitled to the grant of any other visa 1, apart from:
                                             <ul>
                                                 <li>a further student visa with permission to work, the application for which was made on form 157P; or</li>
                                                 <li>a subclass 497 (Graduate–Skilled) visa.</li>
                                             </ul>
                                         </li>
                                         <li>I understand that the effect of the 8534 visa condition is that it will not be possible for me to apply to remain in Australia beyond the date authorised by my visa1 and that I will be required to depart Australia on or before that date. I agree to having this condition included on any visa issued to me as a result of this application if the department decides to impose it as a condition of grant of a visa.</li>
                                         <li>I acknowledge that I understand that if the 8535 visa condition is imposed on my visa, it will be indicated by the condition code ‘8535’ and by the short description ‘No Further Stay’. I acknowledge that this means that the 8535 condition has been imposed on my visa and that I will not, while in Australia, be entitled to be granted any other visa 1, apart from:
                                             <ul>
                                                 <li>a further student visa with permission to work, the application for which was made on form 157P; or</li>
                                                 <li>a further student visa, with the consent of my sponsor.</li>
                                             </ul>
                                         </li>
                                         <li>I understand that the effect of the 8535 visa condition is that it will not be possible for me to remain in Australia beyond the date authorised by my visa1, unless I am applying for a further student visa with the consent of my sponsor, and that I will be required to depart Australia on or before the authorised date. I agree to having this condition included on any visa issued to me as a result of this application if the department decides to impose it as a condition of grant of a visa.</li>
                                         <li>I am aware that I must immediately advise the department if I become aware that any information provided in this form is incorrect or if there is a change in my circumstances that are relevant to this application at any time.</li>                                         
                                     </ul>
                                     <div class="form-group">
									    <label><b>Signature</b></label>      
                                          <input type="text" name="" id="txtdeclarationsignature" class="form-control" runat="server">
									    
								    </div>
                                     <div class="form-group">
                                       <label>Date</label>
                                      <input id="txtdeclarationdate" runat="server" type="text" class="form-control" placeholder="DAY/MONTH/YEAR" data-toggle="flatpickr" value="">
                                    </div>
                                     <%--1--%>
                                     <div class="form-group">
									    <label><b>Signature</b></label>
                                         <input type="text" name="" id="txtdeclarationsignature1" class="form-control" runat="server">
									   
								    </div>
                                     <div class="form-group">
                                       <label>Date</label>
                                      <input id="txtdeclarationdate1" runat="server" type="text" class="form-control" placeholder="DAY/MONTH/YEAR" data-toggle="flatpickr" value="">
                                    </div>
                                     <%--2--%>
                                     <div class="form-group">
									    <label><b>Signature</b></label>
                                           <input type="text" name="" id="txtdeclarationsignature2" class="form-control" runat="server">
									   
								    </div>
                                     <div class="form-group">
                                       <label>Date</label>
                                      <input id="txtdeclarationdate2" runat="server" type="text" class="form-control" placeholder="DAY/MONTH/YEAR" data-toggle="flatpickr" value="">
                                    </div>
                                     <%--3--%>
                                     <div class="form-group">
									    <label><b>Signature</b></label>
                                          <input type="text" name="" id="txtdeclarationsignature3" class="form-control" runat="server">
									   
								    </div>
                                     <div class="form-group">
                                       <label>Date</label>
                                      <input id="txtdeclarationdate3" runat="server" type="text" class="form-control" placeholder="DAY/MONTH/YEAR" data-toggle="flatpickr" value="">
                                    </div>
                                 </div>
                             </div>
                        </div>
	
                        <%--Button--%>
	                        <div class="list-group-item">
                                <div class="form-group m-0" role="group" aria-labelledby="label-employerwebsite">
                                    <div class="form-row">  
                                      <asp:Button ID="btngoBackTo" runat="server" Text="Back" OnClick="btngoBackTo_Click"/>
                                        <asp:Button ID="btnvisadetails" runat="server" Text="Save Changes" CssClass="btn btn-success" OnClick="btnvisadetails_Click" OnClientClick="return validateForm()"/>
                                        <div class="col-md-6">
                                            <asp:Label ID="lblMessage" runat="server" Visible="false"></asp:Label>                                               
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>

                    </div>
                    <div class="card faq-qwrp" id="questions" runat="server">
                            <div class="card-body">
                            <%  if (allQuestions.Count > 0)
                                { %>
                            <div id="question" runat="server">
                                    <h5>FAQ's</h5>
                                    <div class="">
                                    <%for (int q = 0; q < allQuestions.Count; q++)
                                        {%>  <div>                                                             
                                                <label onclick="showFaqQuestion('<%=allQuestions[q].question%>','<%=allQuestions[q].answer%>')"> * <%=allQuestions[q].question%> </label>
                                            </div>                                                  
                                    <%} %>
                                </div>
                            </div>      
                                <%} %>  
                                     
                            </div>
                        </div>
                </div>
                <div id="page-nav" class="col-lg-auto page-nav">
                    <div>
                        <span id="tooltip"></span>
                    </div>
                </div>
            </div>
        </div>      
    </div>

    <script>
        $(document).ready(function () {

            //50
            if ($("#<%=rboutsidecountryYes.ClientID%>").is(":checked")) 
                    $("#<%=showControls.ClientID%>").show();
            else 
                    $("#<%=showControls.ClientID%>").hide();
            //51
            if ($("#<%=rbworkforaustralianhospitalYes.ClientID%>").is(":checked")) 
                $("#<%=showhospitaldetailsControls.ClientID%>").show();
            else 
                $("#<%=showhospitaldetailsControls.ClientID%>").hide();
            //52
            if ($("#<%=rbworkforaustralianpreschoolYes.ClientID%>").is(":checked")) 
                $("#<%=showpreschooldetailsControls.ClientID%>").show();
            else 
                $("#<%=showpreschooldetailsControls.ClientID%>").hide();
            //53
            if ($("#<%=rbhaveanyhealthissueYes.ClientID%>").is(":checked")) 
                $("#<%=showhealthissueControls.ClientID%>").show();
            else 
                $("#<%=showhealthissueControls.ClientID%>").hide();
            //54
            if ($("#<%=rbrequiremobilityYes.ClientID%>").is(":checked")) 
                $("#<%=showrequiremobilityControls.ClientID%>").show();
            else 
                $("#<%=showrequiremobilityControls.ClientID%>").hide();
            //55
            if ($("#<%=rbmedicalproceduresYes.ClientID%>").is(":checked")) 
                $("#<%=showmedicalproceduresControls.ClientID%>").show();
            else 
                $("#<%=showmedicalproceduresControls.ClientID%>").hide();
            //56
            if ($("#<%=rbmedicalfollowupYes.ClientID%>").is(":checked")) 
                $("#<%=showmedicalfollowupControls.ClientID%>").show();
            else 
                $("#<%=showmedicalfollowupControls.ClientID%>").hide();
            //60
            if ($("#<%=rbholdorappliedVisaYes.ClientID%>").is(":checked")) 
                $("#<%=controls.ClientID%>").show();
            else 
                $("#<%=controls.ClientID%>").hide();
            if ($("#<%=rbvisastatusgranted.ClientID%>").is(":checked")) 
                 $("#<%=grantedcontrols.ClientID%>").show();
            else 
                $("#<%=grantedcontrols.ClientID%>").hide();
            if ($("#<%=rbvisastatusnmotyetdecided.ClientID%>").is(":checked")) 
                $("#<%=notdecidedcontrols.ClientID%>").show();
            else 
                $("#<%=notdecidedcontrols.ClientID%>").hide();
            //61
            if ($("#<%=rbarrangementwithrelativeYes.ClientID%>").is(":checked")) 
                 $("#<%=arrangementwithrelativeControls.ClientID%>").show();
            else 
                $("#<%=arrangementwithrelativeControls.ClientID%>").hide();
            //63
            if ($("#<%=rbguardianvisagranted.ClientID%>").is(":checked")) 
                $("#<%=guardianvisagrantedControls.ClientID%>").show();
            else 
                $("#<%=guardianvisagrantedControls.ClientID%>").hide();
            if ($("#<%=rbguardianvisanotyrtdecided.ClientID%>").is(":checked")) 
                $("#<%=guardianvisanotyrtdecidedControls.ClientID%>").show();
            else 
                $("#<%=guardianvisanotyrtdecidedControls.ClientID%>").hide();
            //64
            if ($("#<%=rbwelfarearrangementsYes.ClientID%>").is(":checked")) 
                $("#<%=welfarearrangementsIfYesShow.ClientID%>").show();
            else 
                $("#<%=welfarearrangementsIfYesShow.ClientID%>").hide();
            //62
             if ($("#<%=Temporaryresident.ClientID%>").is(":checked")) 
                 $("#<%=relativeresideasControls.ClientID%>").show();
             else 
                 $("#<%=relativeresideasControls.ClientID%>").hide();
            //79
            if ($("#<%=rbagentagreetocommunicateYes.ClientID%>").is(":checked")) 
                $("#<%=agentagreetocommunicateControls.ClientID%>").show();
            else 
                $("#<%=agentagreetocommunicateControls.ClientID%>").hide();
            //76
            if ($("#<%=rbagentagreetocommunicateYes.ClientID%>").is(":checked")) 
                 $("#<%=agreetocommunicatecontrols.ClientID%>").show();
            else 
                $("#<%=agreetocommunicatecontrols.ClientID%>").hide();

            //72
            if ($("#<%=rbpaytoassistanceYes.ClientID%>").is(":checked")) 
                $("#<%=paytoassistanceContreols.ClientID%>").show();
            else 
                $("#<%=paytoassistanceContreols.ClientID%>").hide();
            //68
             if ($("#<%=rbreceiveassistanceYes.ClientID%>").is(":checked")) 
                 $("#<%=receiveassistanceontrols.ClientID%>").show();
             else 
                $("#<%=receiveassistanceontrols.ClientID%>").hide();
            //70
            if ($("#<%=rbeducationagentYes.ClientID%>").is(":checked")) 
                $("#<%=educationagentcontrols.ClientID%>").show();
            else 
                $("#<%=educationagentcontrols.ClientID%>").hide();
            //81
             if ($("#<%=rbCreditcard.ClientID%>").is(":checked")) 
                 $("#<%=creditcardcontrols.ClientID%>").show();
             else 
                $("#<%=creditcardcontrols.ClientID%>").hide();
            //58
            if ($("#<%=rbunder18ageYes.ClientID%>").is(":checked")) 
                $("#<%=showYes.ClientID%>").show();
            else 
                $("#<%=showYes.ClientID%>").hide();

            if ($("#<%=rbunder18ageNo.ClientID%>").is(":checked")) 
                $("#<%=showNo.ClientID%>").show();
            else 
                $("#<%=showNo.ClientID%>").hide();
            //66
            if ($("#<%=rbsolelegalrightsNo.ClientID%>").is(":checked")) 
                $("#<%=solelegalrightscontrols.ClientID%>").show();
            else 
                $("#<%=solelegalrightscontrols.ClientID%>").hide();
        });
        //71  
        $(function () {
         $("input[name='ctl00$ContentPlaceHolder1$agentinauttalia']").click(function () {
             if ($("#<%=rbagentinauttaliaNo.ClientID%>").is(":checked"))
                 $("#<%=question72.ClientID%>").hide();
             else 
                $("#<%=question72.ClientID%>").show();
             });
        });
        //58
        $(function () {
         $("input[name='ctl00$ContentPlaceHolder1$under18age']").click(function () {
             if ($("#<%=rbunder18ageNo.ClientID%>").is(":checked")) {
                  $("#<%=showNo.ClientID%>").show();
                 $("#<%=question59.ClientID%>").hide();
                 $("#<%=question60.ClientID%>").hide();
                 $("#<%=question61.ClientID%>").hide();
                 $("#<%=question62.ClientID%>").hide();
                 $("#<%=question63.ClientID%>").hide();
                 $("#<%=question64.ClientID%>").hide();
                 $("#<%=question65.ClientID%>").hide();
                 $("#<%=question66.ClientID%>").hide();
                 $("#<%=question67.ClientID%>").hide();

             }
             else 
             {
                 $("#<%=showNo.ClientID%>").hide();
                 $("#<%=question59.ClientID%>").show();
                 $("#<%=question60.ClientID%>").show();
                 $("#<%=question61.ClientID%>").show();
                 $("#<%=question62.ClientID%>").show();
                 $("#<%=question63.ClientID%>").show();
                 $("#<%=question64.ClientID%>").show();
                 $("#<%=question65.ClientID%>").show();
                 $("#<%=question66.ClientID%>").show();
                 $("#<%=question67.ClientID%>").show();
                 
             }
                
             });
        });
        //66
        $(function () {
         $("input[name='ctl00$ContentPlaceHolder1$solelegalrights']").click(function () {
             if ($("#<%=rbsolelegalrightsNo.ClientID%>").is(":checked")) 
                 $("#<%=solelegalrightscontrols.ClientID%>").show();
             else 
                 $("#<%=solelegalrightscontrols.ClientID%>").hide();
             });
        });
        //73  
      $(function () {
         $("input[name='ctl00$ContentPlaceHolder1$writtencommunications']").click(function () {
             if ($("#<%=rbmyself.ClientID%>").is(":checked") || $("#<%=rbAgentexempted.ClientID%>").is(":checked")) {
                 $("#<%=question74.ClientID%>").hide();
                 $("#<%=question75.ClientID%>").hide();
                 $("#<%=question76.ClientID%>").hide();
                 $("#<%=question77.ClientID%>").hide();
                 $("#<%=question78.ClientID%>").hide();
                 $("#<%=question79.ClientID%>").hide();
                 $("#<%=question80.ClientID%>").hide();
             }
            else
             {
                 $("#<%=question74.ClientID%>").show();
                 $("#<%=question75.ClientID%>").show();
                 $("#<%=question76.ClientID%>").show();
                 $("#<%=question77.ClientID%>").show();
                 $("#<%=question78.ClientID%>").show();
                 $("#<%=question79.ClientID%>").show();
                 $("#<%=question80.ClientID%>").show();
             }
             });
        });
      
        $(function () {
            $("input[name='ctl00$ContentPlaceHolder1$writtencommunications']").click(function () {
                if ($("#<%=rbmigrationagent.ClientID%>").is(":checked") || $("#<%=rbOffshoreagent.ClientID%>").is(":checked"))
                {
                     $("#<%=question74.ClientID%>").hide();
                     $("#<%=question75.ClientID%>").hide();
                     $("#<%=question76.ClientID%>").hide();
                     $("#<%=question77.ClientID%>").hide();
                }               
             });
        });       
         
        //68   
        $(function () {
         $("input[name='ctl00$ContentPlaceHolder1$receiveassistance']").click(function () {
             if ($("#<%=rbreceiveassistanceNo.ClientID%>").is(":checked")) {
                 $("#<%=question69.ClientID%>").hide();
                 $("#<%=question70.ClientID%>").hide();
                 $("#<%=question71.ClientID%>").hide();
                 $("#<%=question72.ClientID%>").hide();
             }
             else
             {
                 $("#<%=question69.ClientID%>").show();
                 $("#<%=question70.ClientID%>").show();
                 $("#<%=question71.ClientID%>").show();
                 $("#<%=question72.ClientID%>").show();
             }
             });
        });

        //69 
         $(function () {
         $("input[name='ctl00$ContentPlaceHolder1$mara']").click(function () {
             if ($("#<%=maraYes.ClientID%>").is(":checked")) {
                 $("#<%=question70.ClientID%>").hide();
                 $("#<%=question71.ClientID%>").hide();
                 $("#<%=question72.ClientID%>").hide();

             }             
             else {
                 $("#<%=question70.ClientID%>").show();
                 $("#<%=question71.ClientID%>").show();
                 $("#<%=question72.ClientID%>").show();

             }             
             });
        });


        //59
         $(function () {
         $("input[name='ctl00$ContentPlaceHolder1$gotoquestion']").click(function () {
             if ($("#<%=gotoquestion61.ClientID%>").is(":checked"))
                 $("#<%=question60.ClientID%>").hide();
             else
                 $("#<%=question60.ClientID%>").show();
             });
        });
         $(function () {
         $("input[name='ctl00$ContentPlaceHolder1$gotoquestion']").click(function () {
             if ($("#<%=gotoquestion64.ClientID%>").is(":checked")) {
                 $("#<%=question60.ClientID%>").hide();
                 $("#<%=question61.ClientID%>").hide();
                 $("#<%=question62.ClientID%>").hide();
                 $("#<%=question63.ClientID%>").hide();
             }
             else {
                 
                 $("#<%=question61.ClientID%>").show();
                 $("#<%=question62.ClientID%>").show();
                 $("#<%=question63.ClientID%>").show();
             }
             
             });
        });
        $(function () {
         $("input[name='ctl00$ContentPlaceHolder1$under18age']").click(function () {
             if ($("#<%=rbunder18ageYes.ClientID%>").is(":checked")) 
                 $("#<%=showYes.ClientID%>").show();
             else 
                 $("#<%=showYes.ClientID%>").hide();
             });
        });
        //60 
        $(function () {
        $("input[name='ctl00$ContentPlaceHolder1$holdorappliedVisa']").click(function () {
            if ($("#<%=rbholdorappliedVisaYes.ClientID%>").is(":checked")) {
                 $("#<%=question61.ClientID%>").hide(); 
                 $("#<%=question62.ClientID%>").hide();
                 $("#<%=question63.ClientID%>").hide();
                 $("#<%=question64.ClientID%>").hide();
             }
             else {
                 $("#<%=question61.ClientID%>").show();
                 $("#<%=question62.ClientID%>").show();
                 $("#<%=question63.ClientID%>").show();
                 $("#<%=question64.ClientID%>").show();
             }
             
             });
        });

        //81        
        $(function () {
         $("input[name='ctl00$ContentPlaceHolder1$paymentmethod']").click(function () {
             if ($("#<%=rbCreditcard.ClientID%>").is(":checked")) 
                 $("#<%=creditcardcontrols.ClientID%>").show();
             else 
                 $("#<%=creditcardcontrols.ClientID%>").hide();
             });
        });
        //70  
        $(function () {
         $("input[name='ctl00$ContentPlaceHolder1$educationagent']").click(function () {
             if ($("#<%=rbeducationagentYes.ClientID%>").is(":checked")) 
                 $("#<%=educationagentcontrols.ClientID%>").show();
             else 
                 $("#<%=educationagentcontrols.ClientID%>").hide();
             });
        });
        //68  
        $(function () {
         $("input[name='ctl00$ContentPlaceHolder1$receiveassistance']").click(function () {
             if ($("#<%=rbreceiveassistanceYes.ClientID%>").is(":checked")) 
                 $("#<%=receiveassistanceontrols.ClientID%>").show();
             else 
                 $("#<%=receiveassistanceontrols.ClientID%>").hide();
             });
        });
        //72
        $(function () {
         $("input[name='ctl00$ContentPlaceHolder1$paytoassistance']").click(function () {
             if ($("#<%=rbpaytoassistanceYes.ClientID%>").is(":checked")) 
                 $("#<%=paytoassistanceContreols.ClientID%>").show();
             else 
                 $("#<%=paytoassistanceContreols.ClientID%>").hide();
             });
        });
        //76
        $(function () {
         $("input[name='ctl00$ContentPlaceHolder1$agreetocommunicate']").click(function () {
             if ($("#<%=rbagreetocommunicateYes.ClientID%>").is(":checked")) 
                 $("#<%=agreetocommunicatecontrols.ClientID%>").show();
             else 
                 $("#<%=agreetocommunicatecontrols.ClientID%>").hide();
             });
        });
        //79
        $(function () {
         $("input[name='ctl00$ContentPlaceHolder1$agentagreetocommunicate']").click(function () {
             if ($("#<%=rbagentagreetocommunicateYes.ClientID%>").is(":checked")) 
                 $("#<%=agentagreetocommunicateControls.ClientID%>").show();
             else 
                 $("#<%=agentagreetocommunicateControls.ClientID%>").hide();
             });
        });
        //62    
         $(function () {
         $("input[name='ctl00$ContentPlaceHolder1$relativeresideas']").click(function () {
             if ($("#<%=Temporaryresident.ClientID%>").is(":checked")) 
                 $("#<%=relativeresideasControls.ClientID%>").show();
             else 
                 $("#<%=relativeresideasControls.ClientID%>").hide();
             });
        });
        //50
        $(function () {
         $("input[name='ctl00$ContentPlaceHolder1$outsidecountry']").click(function () {
             if ($("#<%=rboutsidecountryYes.ClientID%>").is(":checked")) 
                 $("#<%=showControls.ClientID%>").show();
             else 
                 $("#<%=showControls.ClientID%>").hide();
             });
        });
        //51
        $(function () {
         $("input[name='ctl00$ContentPlaceHolder1$workforaustralianhospital']").click(function () {
             if ($("#<%=rbworkforaustralianhospitalYes.ClientID%>").is(":checked")) 
                 $("#<%=showhospitaldetailsControls.ClientID%>").show();
             else 
                 $("#<%=showhospitaldetailsControls.ClientID%>").hide();
             });
        });
        //52
        $(function () {
         $("input[name='ctl00$ContentPlaceHolder1$workforaustralianpreschool']").click(function () {
             if ($("#<%=rbworkforaustralianpreschoolYes.ClientID%>").is(":checked")) 
                 $("#<%=showpreschooldetailsControls.ClientID%>").show();
             else 
                 $("#<%=showpreschooldetailsControls.ClientID%>").hide();
             });
        });
        //53
        $(function () {
         $("input[name='ctl00$ContentPlaceHolder1$haveanyhealthissue']").click(function () {
             if ($("#<%=rbhaveanyhealthissueYes.ClientID%>").is(":checked")) 
                 $("#<%=showhealthissueControls.ClientID%>").show();
             else 
                 $("#<%=showhealthissueControls.ClientID%>").hide();
             });
        });
        //54
        $(function () {
         $("input[name='ctl00$ContentPlaceHolder1$requiremobility']").click(function () {
             if ($("#<%=rbrequiremobilityYes.ClientID%>").is(":checked")) 
                 $("#<%=showrequiremobilityControls.ClientID%>").show();
             else 
                 $("#<%=showrequiremobilityControls.ClientID%>").hide();
             });
        });
        //55
        $(function () {
         $("input[name='ctl00$ContentPlaceHolder1$medicalprocedures']").click(function () {
             if ($("#<%=rbmedicalproceduresYes.ClientID%>").is(":checked")) 
                 $("#<%=showmedicalproceduresControls.ClientID%>").show();
             else 
                 $("#<%=showmedicalproceduresControls.ClientID%>").hide();
             });
        });
        //56
        $(function () {
         $("input[name='ctl00$ContentPlaceHolder1$medicalfollowup']").click(function () {
             if ($("#<%=rbmedicalfollowupYes.ClientID%>").is(":checked")) 
                 $("#<%=showmedicalfollowupControls.ClientID%>").show();
             else 
                 $("#<%=showmedicalfollowupControls.ClientID%>").hide();
             });
        });
        //60  
        
        $(function () {
         $("input[name='ctl00$ContentPlaceHolder1$holdorappliedVisa']").click(function () {
             if ($("#<%=rbholdorappliedVisaYes.ClientID%>").is(":checked")) 
                 $("#<%=controls.ClientID%>").show();
             else 
                 $("#<%=controls.ClientID%>").hide();
             });
        });
        $(function () {
         $("input[name='ctl00$ContentPlaceHolder1$visastatus']").click(function () {
             if ($("#<%=rbvisastatusgranted.ClientID%>").is(":checked")) 
                 $("#<%=grantedcontrols.ClientID%>").show();
             else 
                 $("#<%=grantedcontrols.ClientID%>").hide();
             });
        });
        $(function () {
         $("input[name='ctl00$ContentPlaceHolder1$visastatus']").click(function () {
             if ($("#<%=rbvisastatusnmotyetdecided.ClientID%>").is(":checked")) 
                 $("#<%=notdecidedcontrols.ClientID%>").show();
             else 
                 $("#<%=notdecidedcontrols.ClientID%>").hide();
             });
        }); 
        //61
        $(function () {
         $("input[name='ctl00$ContentPlaceHolder1$arrangementwithrelative']").click(function () {
             if ($("#<%=rbarrangementwithrelativeYes.ClientID%>").is(":checked")) 
                 $("#<%=arrangementwithrelativeControls.ClientID%>").show();
             else 
                 $("#<%=arrangementwithrelativeControls.ClientID%>").hide();
             });
        });
        //63
        $(function () {
         $("input[name='ctl00$ContentPlaceHolder1$guardianvisasatus']").click(function () {
             if ($("#<%=rbguardianvisagranted.ClientID%>").is(":checked")) 
                 $("#<%=guardianvisagrantedControls.ClientID%>").show();
             else 
                 $("#<%=guardianvisagrantedControls.ClientID%>").hide();
             });
        });
         $(function () {
         $("input[name='ctl00$ContentPlaceHolder1$guardianvisasatus']").click(function () {
             if ($("#<%=rbguardianvisanotyrtdecided.ClientID%>").is(":checked")) 
                 $("#<%=guardianvisanotyrtdecidedControls.ClientID%>").show();
             else 
                 $("#<%=guardianvisanotyrtdecidedControls.ClientID%>").hide();
             });
        });
        //64 
          $(function () {
         $("input[name='ctl00$ContentPlaceHolder1$welfarearrangements']").click(function () {
             if ($("#<%=rbwelfarearrangementsYes.ClientID%>").is(":checked")) 
                 $("#<%=welfarearrangementsIfYesShow.ClientID%>").show();
             else 
                 $("#<%=welfarearrangementsIfYesShow.ClientID%>").hide();
             });
        });   


        $('#ContentPlaceHolder1_txtdeclarationdate').flatpickr({
            dateFormat: 'Y-m-d', defaultDate: ""
        });
        $('#ContentPlaceHolder1_txtcreditcardexpirydate').flatpickr({
            dateFormat: 'Y-m-d', defaultDate: ""
        });
        $('#ContentPlaceHolder1_txtfamilyresidenceFrom').flatpickr({
            dateFormat: 'Y-m-d', defaultDate: ""
        });
        $('#ContentPlaceHolder1_txtfamilyresidenceTo').flatpickr({
            dateFormat: 'Y-m-d', defaultDate: ""
        });
        $('#ContentPlaceHolder1_familyresidenceFrom1').flatpickr({
            dateFormat: 'Y-m-d', defaultDate: ""
        });
        $('#ContentPlaceHolder1_familyresidenceTo1').flatpickr({
            dateFormat: 'Y-m-d', defaultDate: ""
        });
        $('#ContentPlaceHolder1_familyresidenceFrom2').flatpickr({
            dateFormat: 'Y-m-d', defaultDate: ""
        });
        $('#ContentPlaceHolder1_familyresidenceTo2').flatpickr({
            dateFormat: 'Y-m-d', defaultDate: ""
        });
        $('#ContentPlaceHolder1_txtdob').flatpickr({
            dateFormat: 'Y-m-d', defaultDate: ""
        });
        $('#ContentPlaceHolder1_txtdateOfBirth').flatpickr({
            dateFormat: 'Y-m-d', defaultDate: ""
        });
        $('#ContentPlaceHolder1_date').flatpickr({
            dateFormat: 'Y-m-d', defaultDate: ""
        });
        $('#ContentPlaceHolder1_date1').flatpickr({
            dateFormat: 'Y-m-d', defaultDate: ""
        });
        $('#ContentPlaceHolder1_txtguardianvisaexpirydate').flatpickr({
            dateFormat: 'Y-m-d', defaultDate: ""
        });
        $('#ContentPlaceHolder1_txtuntildate').flatpickr({
            dateFormat: 'Y-m-d', defaultDate: ""
        });
       
        $('#ContentPlaceHolder1_txtsignDate').flatpickr({
            dateFormat: 'Y-m-d', defaultDate: ""
        });
        $('#ContentPlaceHolder1_txtsignDate1').flatpickr({
            dateFormat: 'Y-m-d', defaultDate: ""
        });
        
        $('#ContentPlaceHolder1_txtagentsigndate ').flatpickr({
            dateFormat: 'Y-m-d', defaultDate: ""
        });
        $('#ContentPlaceHolder1_txtdateofsign').flatpickr({
            dateFormat: 'Y-m-d', defaultDate: ""
        });
        $('#ContentPlaceHolder1_txtdeclarationdate').flatpickr({
            dateFormat: 'Y-m-d', defaultDate: ""
        });
        $('#ContentPlaceHolder1_txtdeclarationdate1').flatpickr({
            dateFormat: 'Y-m-d', defaultDate: ""
        });
        $('#ContentPlaceHolder1_txtdeclarationdate2').flatpickr({
            dateFormat: 'Y-m-d', defaultDate: ""
        });
         $('#ContentPlaceHolder1_txtdeclarationdate3').flatpickr({
            dateFormat: 'Y-m-d', defaultDate: ""
        });
        var emailRegex = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
        function validauthorizedrecipientQ73() {
            var valid1 = false;
            if ($("#<%=rbAuthorisedrecipient.ClientID%>").is(':checked')) {
                //74
                if (!($("#<%=rbauthorisedpersonNo.ClientID%>").is(':checked') || $("#<%=rbauthorisedpersonYes.ClientID%>").is(':checked')))
                    alert("please select Do you want the authorised person to receive health and/or character information about you, your spouse or your dependants, that may arise, or be revealed, in the course of this application  of field 74");
                //75
                else if ($("#<%=ddltitle1.ClientID%>").val() == "0")
                    alert("Please select title of field 75");
                else if ($("#<%=txtauthorisedpersofamilynname.ClientID%>").val() == "")
                    alert("Please select Family name of field 75");
                else if ($("#<%=txtauthorisedpersongivenname.ClientID%>").val() == "")
                    alert("Please select Family name of field 75");
                else if ($("#<%=txtauthorisedpersonaddress.ClientID%>").val() == "")
                    alert("Please select Authorised recipient’s postal address of field 75");
                else if ($("#<%=txtauthorisedpersonofficeno.ClientID%>").val() == "")
                    alert("Please select Office hours of field 75");
                else if ($("#<%=txtauthorisedpersonmobileno.ClientID%>").val() == "")
                    alert("Please select Mobile phone of field 75");
                //76 77
                else if (!($("#<%=rbagreetocommunicateNO.ClientID%>").is(':checked') || $("#<%=rbagreetocommunicateYes.ClientID%>").is(':checked')))
                    alert("Please select As the authorised recipient named on this form, do you agree to the department communicating with you by fax, e-mail or other electronic means? of field 76");
                else if ($("#<%=rbagreetocommunicateYes.ClientID%>").is(':checked') && $("#<%=txtFaxnumber.ClientID%>").val() == "")
                    alert("Please enter fax number of field 76");
                else if (($("#<%=rbagreetocommunicateYes.ClientID%>").is(':checked') && $("#<%=txtEmailaddress.ClientID%>").val() == "") || !(emailRegex.test($("#<%=txtEmailaddress.ClientID%>").val()))))
                    alert("Please enter valid Email address of field 76");

                else if ($("#<%=txtsignatureauthorizedperson.ClientID%>").val() == "")
                    alert("Please enter signature of authorized user   of field 77");
                else if ($("#<%=txtdateofsign.ClientID%>").val() == "")
                    alert("Please select date of field 77");

                else
                    valid1 = true;
            }
            else
                valid1 = true;
            return valid1;

        }
        function validquestion78() {
            var validque = false;
            if ($("#<%=rbAuthorisedrecipient.ClientID%>").is(':checked') || $("#<%=rbmigrationagent.ClientID%>").is(':checked') || $("#<%=rbOffshoreagent.ClientID%>").is(':checked')) {//78
                if ($("#<%=txtmarnNo.ClientID%>").val() == "")
                    alert("Please enter Migration Agent Registration Number (MARN) of field 78");
                else if ($("#<%=txtoffshoreagentId.ClientID%>").val() == "")
                    alert("Please enter Offshore Agent ID Number (if allocated by the department) of field 78");
                else if ($("#<%=ddltitle3.ClientID%>").val() == "0")
                    alert("Please enter  Title of field 78");
                else if ($("#<%=txtagentfamilyname.ClientID%>").val() == "")
                    alert("Please enter Family name  of field 78");
                else if ($("#<%=txtagentgivenname.ClientID%>").val() == "")
                    alert("Please enter Given names of field 78");
                else if ($("#<%=txtagentcompanyname.ClientID%>").val() == "")
                    alert("Please enter company name of field 78");
                else if ($("#<%=txtagenntaddress.ClientID%>").val() == "")
                    alert("Please enter Postal address of field 78");
                else if ($("#<%=txtagentofficeno.ClientID%>").val() == "")
                    alert("Please enterOffice hours  of field 78");
                else if ($("#<%=txtagentmobileno.ClientID%>").val() == "")
                    alert("Please enter Mobile phone of field 78");
                //79 80 
                else if (!($("#<%=rbagentagreetocommunicateNo.ClientID%>").is(':checked') || $("#<%=rbagentagreetocommunicateYes.ClientID%>").is(':checked')))
                    alert("Please select As the agent named on this form, do you agree to the department communicating with you by fax, e-mail or other electronic means of field 79");
                else if ($("#<%=rbagentagreetocommunicateYes.ClientID%>").is(':checked') && $("#<%=txtagentfaxno.ClientID%>").val() == "")
                    alert("Please enter fax Number of field 79");
                else if (($("#<%=rbagentagreetocommunicateYes.ClientID%>").is(':checked') && $("#<%=txtagentemailaddress.ClientID%>").val() == "") || !(emailRegex.test($("#<%=txtagentemailaddress.ClientID%>").val()))))
                    alert("Please enter valid email address of field 79");

                else if ($("#<%=txtagentsignatures.ClientID%>").val() == "")
                    alert("Please enter signature of field 80");
                else if ($("#<%=txtagentsigndate.ClientID%>").val() == "")
                    alert("Please enter date of field 80");
                else
                    validque = true;
            }
            else
                validque = true;
            return validque;
        }
        function validquestion68() {
            var validquestion = false;
            if ($("#<%=rbreceiveassistanceYes.ClientID%>").is(':checked'))
            {
                if ($("#<%=ddltitle.ClientID%>").val() == "0")
                    alert("Please select title of field 68");
                else if ($("#<%=txtassistedpersonfamilyname.ClientID%>").val() == "")
                    alert("Please enter family name of field 68");
                else if ($("#<%=txtassistedpersongivenname.ClientID%>").val() == "")
                    alert("Please enter Given name of field 68");
                else if ($("#<%=txtaddress.ClientID%>").val() == "")
                    alert("Please enter address of field 68");
                else if ($("#<%=txtassistedpersonofficeno.ClientID%>").val() == "")
                    alert("Please enter office number of field 68");
                else if ($("#<%=txtassistedpersonmobileno.ClientID%>").val() == "")
                    alert("Please enter mobile number of field 68");
                //69
                else if (!($("#<%=maraNO.ClientID%>").is(':checked') || $("#<%=maraYes.ClientID%>").is(':checked')))
                    alert("Please select Is your agent registered with the Migration Agents Registration Authority (MARA)? of field 69");
                //70               
                else if ($("#<%=maraNO.ClientID%>").is(':checked') && !($("#<%=rbeducationagentNo.ClientID%>").is(':checked') || $("#<%=rbeducationagentYes.ClientID%>").is(':checked')))
                    alert("Please select Is the person an education agent?  of field 70");
                else if ($("#<%=maraNO.ClientID%>").is(':checked') && $("#<%=rbeducationagentYes.ClientID%>").is(':checked') && $("#<%=txtbusinessname.ClientID%>").val() == "")
                    alert("Please enter Education Agency Business Name of field 70");
                else if (($("#<%=maraNO.ClientID%>").is(':checked') && $("#<%=rbeducationagentYes.ClientID%>").is(':checked') && $("#<%=txteducationagentemail.ClientID%>").val() == "") || !(emailRegex.test($("#<%=txteducationagentemail.ClientID%>").val())))
                    alert("Please enter valid E-mail address of field 70");
                else if ($("#<%=maraNO.ClientID%>").is(':checked') && $("#<%=rbeducationagentYes.ClientID%>").is(':checked') && $("#<%=txteducationagentofficeno.ClientID%>").val() == "")
                    alert("Please enter Office hours of field 70");
                else if ($("#<%=maraNO.ClientID%>").is(':checked') && $("#<%=rbeducationagentYes.ClientID%>").is(':checked') && $("#<%=txteducationagentphoneno.ClientID%>").val() == "")
                    alert("Please enter Mobile phone of field 70");
                else if ($("#<%=maraNO.ClientID%>").is(':checked') && $("#<%=rbeducationagentYes.ClientID%>").is(':checked') && $("#<%=txteducationagentfaxno.ClientID%>").val() == "")
                    alert("Please enter Fax number of field 70");

                //71
                else if ($("#<%=maraNO.ClientID%>").is(':checked') && !($("#<%=rbagentinauttaliaNo.ClientID%>").is(':checked') || $("#<%=rbagentinauttaliaYes.ClientID%>").is(':checked')))
                    alert("Please select is your  agent in australia of field 71");
                //72
                else if ($("#<%=maraYes.ClientID%>").is(':checked') && !($("#<%=rbpaytoassistanceNo.ClientID%>").is(':checked') || $("#<%=rbpaytoassistanceYes.ClientID%>").is(':checked')))
                    alert("Please select Did you pay the person and/or give a gift for this assistance?   of field 72");
                else if ($("#<%=maraYes.ClientID%>").is(':checked') && $("#<%=rbpaytoassistanceYes.ClientID%>").is(':checked') && $("#<%=txthowmuchyoupay.ClientID%>").val() == "")
                    alert("Please enter How much did you pay of field 72");
                else if ($("#<%=maraYes.ClientID%>").is(':checked') && $("#<%=rbpaytoassistanceYes.ClientID%>").is(':checked') && $("#<%=txtgiftgiven.ClientID%>").val() == "")
                    alert("Please enter What kind of gift did you give? (eg. jewellery) of field 72");
                else if ($("#<%=maraYes.ClientID%>").is(':checked') && $("#<%=rbpaytoassistanceYes.ClientID%>").is(':checked') && $("#<%=txtvalueofgift.ClientID%>").val() == "")
                    alert("Please enter Value of gift (approximately) of field 72");               
                else
                    validquestion = true;
            }  
            else
                validquestion = true;

            return validquestion;
        }
       
        function validate18YearsOfAgeForm() {
            var valid = false;
            if ($("#<%=rbunder18ageYes.ClientID%>").is(':checked'))
            {     //59
                if (!($("#<%=gotoquestion60.ClientID%>").is(':checked') || $("#<%=gotoquestion61.ClientID%>").is(':checked') || $("#<%=gotoquestion64.ClientID%>").is(':checked')))
                    alert("Please select Which statement best explains your situation of field 59");
                //60
                else if ($("#<%=gotoquestion60.ClientID%>").is(':checked') && !($("#<%=rbholdorappliedVisaYes.ClientID%>").is(':checked') || $("#<%=rbholdorappliedVisaNo.ClientID%>").is(':checked')))
                    alert("Please select option of field 60");
                else if ($("#<%=gotoquestion60.ClientID%>").is(':checked') && $("#<%=rbholdorappliedVisaYes.ClientID%>").is(':checked') && $("#<%=txtfamilyname.ClientID%>").val() == "")
                    alert("Please enter Family name  of field 60");
                else if ($("#<%=gotoquestion60.ClientID%>").is(':checked') && $("#<%=rbholdorappliedVisaYes.ClientID%>").is(':checked') && $("#<%=txtgivenname.ClientID%>").val() == "")
                    alert("Please enter Given name of field 60");
                else if ($("#<%=gotoquestion60.ClientID%>").is(':checked') && $("#<%=rbholdorappliedVisaYes.ClientID%>").is(':checked') && $("#<%=txtdob.ClientID%>").val() == "")
                    alert("Please enter Date of birth of field 60");
                else if ($("#<%=gotoquestion60.ClientID%>").is(':checked') && $("#<%=rbholdorappliedVisaYes.ClientID%>").is(':checked') && $("#<%=txtaddressinaustralia.ClientID%>").val() == "")
                    alert("Please enter Your intended address in Australia of field 60");
                else if ($("#<%=gotoquestion60.ClientID%>").is(':checked') && $("#<%=rbholdorappliedVisaYes.ClientID%>").is(':checked') && !($("#<%=rbvisastatusgranted.ClientID%>").is(':checked') || $("#<%=rbvisastatusnmotyetdecided.ClientID%>").is(':checked')))
                    alert("Please Select Application status of field 60");
                else if ($("#<%=gotoquestion60.ClientID%>").is(':checked') && $("#<%=rbholdorappliedVisaYes.ClientID%>").is(':checked') && $("#<%=rbvisastatusgranted.ClientID%>").is(':checked') && $("#<%=visanumber.ClientID%>").val() == "")
                    alert("Please enter Visa label number of field 60");
                else if ($("#<%=gotoquestion60.ClientID%>").is(':checked') && $("#<%=rbholdorappliedVisaYes.ClientID%>").is(':checked') && $("#<%=rbvisastatusgranted.ClientID%>").is(':checked') && $("#<%=digitvisano.ClientID%>").val() == "")
                    alert("Please enter provide the 13-digit visa grant number of field 60");
                else if ($("#<%=gotoquestion60.ClientID%>").is(':checked') && $("#<%=rbholdorappliedVisaYes.ClientID%>").is(':checked') && $("#<%=rbvisastatusgranted.ClientID%>").is(':checked') && $("#<%=txtperiodofstay.ClientID%>").val() == "")
                    alert("Please enter Period of stay of field 60");
                else if ($("#<%=gotoquestion60.ClientID%>").is(':checked') && $("#<%=rbholdorappliedVisaYes.ClientID%>").is(':checked') && $("#<%=rbvisastatusgranted.ClientID%>").is(':checked') && $("#<%=txtvisaexpirydate.ClientID%>").val() == "")
                    alert("Please enter Expiry date (DAY/MONTH/YEAR) of field 60");
                else if ($("#<%=gotoquestion60.ClientID%>").is(':checked') && $("#<%=rbholdorappliedVisaYes.ClientID%>").is(':checked') && $("#<%=rbvisastatusnmotyetdecided.ClientID%>").is(':checked') && $("#<%=txtgovermentofficename.ClientID%>").val() == "")
                    alert("Please enter Australian Government office where application lodged  of field 60");
                //61

                else if (!$("#<%=gotoquestion64.ClientID%>").is(':checked') && !($("#<%=rbarrangementwithrelativeNo.ClientID%>").is(':checked') || $("#<%=rbarrangementwithrelativeYes.ClientID%>").is(':checked')))
                    alert("Please select option of field 61");
                else if (!$("#<%=gotoquestion64.ClientID%>").is(':checked') && $("#<%=rbarrangementwithrelativeYes.ClientID%>").is(':checked') && $("#<%=txtfamilyNameofrelative.ClientID%>").val() == "")
                    alert("Please enter Family name  of field 61");
                else if (!$("#<%=gotoquestion64.ClientID%>").is(':checked') && $("#<%=rbarrangementwithrelativeYes.ClientID%>").is(':checked') && $("#<%=txtgivenNameofrelative.ClientID%>").val() == "")
                    alert("Please enter Given Name of field 61");
                else if (!$("#<%=gotoquestion64.ClientID%>").is(':checked') && $("#<%=rbarrangementwithrelativeYes.ClientID%>").is(':checked') && $("#<%=txtdateOfBirth.ClientID%>").val() == "")
                    alert("Please enter Date of birth of field 61");
                else if (!$("#<%=gotoquestion64.ClientID%>").is(':checked') && $("#<%=rbarrangementwithrelativeYes.ClientID%>").is(':checked') && $("#<%=txtaddressofRelative.ClientID%>").val() == "")
                    alert("Please enter Address of relative in Australia of field 61");
                else if (!$("#<%=gotoquestion64.ClientID%>").is(':checked') && $("#<%=rbarrangementwithrelativeYes.ClientID%>").is(':checked') && $("#<%=txtrelationshipofrelative.ClientID%>").val() == "")
                    alert("Please enter Relationship of relative to the child of field 61");
                //62
                else if (!$("#<%=gotoquestion64.ClientID%>").is(':checked') && !($("#<%=permanentresident.ClientID%>").is(':checked') || $("#<%=Temporaryresident.ClientID%>").is(':checked')))
                    alert("Please select Will your relative reside in Australia as: of field 62");
                else if (!$("#<%=gotoquestion64.ClientID%>").is(':checked') && $("#<%=Temporaryresident.ClientID%>").is(':checked') && $("#<%=txtpermitedtostay.ClientID%>").val() == "")
                    alert("Please enter How long are they permitted to stay in Australia? of field 62");
                else if (!$("#<%=gotoquestion64.ClientID%>").is(':checked') && $("#<%=Temporaryresident.ClientID%>").is(':checked') && $("#<%=txtuntildate.ClientID%>").val() == "")
                    alert("Please enter OR until of field 62");
                //63

                else if (!$("#<%=gotoquestion64.ClientID%>").is(':checked') && !($("#<%=rbguardianvisagranted.ClientID%>").is(':checked') || $("#<%=rbguardianvisanotyrtdecided.ClientID%>").is(':checked')))
                    alert("Please select option of field 63");
                else if (!$("#<%=gotoquestion64.ClientID%>").is(':checked') && $("#<%=rbguardianvisagranted.ClientID%>").is(':checked') && $("#<%=txtguardianvisano.ClientID%>").val() == "")
                    alert("Please enter visa label no of field 63");
                else if (!$("#<%=gotoquestion64.ClientID%>").is(':checked') && $("#<%=rbguardianvisagranted.ClientID%>").is(':checked') && $("#<%=txtguardianvisaperiodofstay.ClientID%>").val() == "")
                    alert("Please enter Period of stay of field 63");
                else if (!$("#<%=gotoquestion64.ClientID%>").is(':checked') && $("#<%=rbguardianvisagranted.ClientID%>").is(':checked') && $("#<%=txtguardianvisaexpirydate.ClientID%>").val() == "")
                    alert("Please enter Expiry date (DAY/MONTH/YEAR) of field 63");
                else if (!$("#<%=gotoquestion64.ClientID%>").is(':checked') && $("#<%=rbguardianvisanotyrtdecided.ClientID%>").is(':checked') && $("#<%=txtgovermentoffName.ClientID%>").val() == "")
                    alert("Please enter Australian Government office where application lodged of field 63");
                else if (!$("#<%=gotoquestion64.ClientID%>").is(':checked') && $("#<%=rbguardianvisanotyrtdecided.ClientID%>").is(':checked') && $("#<%=txtperiodofstayofguardian.ClientID%>").val() == "")
                    alert("Please enter Period of stay sought of field 63");
                //64
                else if ($("#<%=gotoquestion64.ClientID%>").is(':checked') && !($("#<%=rbwelfarearrangementsNo.ClientID%>").is(':checked') || $("#<%=rbwelfarearrangementsYes.ClientID%>").is(':checked')))
                    alert("Please select option of field 64");
                //65
                else if ($("#<%=gotoquestion64.ClientID%>").is(':checked') && $("#<%=parentsignature.ClientID%>").val() == "")
                    alert("Please enter signature of parent of field 65");
                else if ($("#<%=gotoquestion64.ClientID%>").is(':checked') && $("#<%=date.ClientID%>").val() == "")
                    alert("Please enter date  of field 65");
                else if ($("#<%=gotoquestion64.ClientID%>").is(':checked') && $("#<%=txtparentfullname.ClientID%>").val() == "")
                    alert("Please enter Full name (print in English) of field 65");
                else if ($("#<%=gotoquestion64.ClientID%>").is(':checked') && $("#<%=txtrelationwithstudent.ClientID%>").val() == "")
                    alert("Please enter Relationship to student applicant  of field 65");
                //66
                else if ($("#<%=gotoquestion64.ClientID%>").is(':checked') && !($("#<%=rbsolelegalrightsNo.ClientID%>").is(':checked') || $("#<%=rbsolelegalrightsYes.ClientID%>").is(':checked')))
                    alert("Please select Do you have the sole legal right to determine where the applicant will live or to remove the applicant from their country of usual residence? of field 66");
                else if ($("#<%=gotoquestion64.ClientID%>").is(':checked') && $("#<%=rbsolelegalrightsNo.ClientID%>").is(':checked') && $("#<%=txtpersonname.ClientID%>").val() == "")
                    alert("Please enter name of field 66");
                else if ($("#<%=gotoquestion64.ClientID%>").is(':checked') && $("#<%=rbsolelegalrightsNo.ClientID%>").is(':checked') && $("#<%=txtpersonaddress.ClientID%>").val() == "")
                    alert("Please enter address of field 66");
                else if ($("#<%=gotoquestion64.ClientID%>").is(':checked') && $("#<%=rbsolelegalrightsNo.ClientID%>").is(':checked') && $("#<%=txtpersoncontactno.ClientID%>").val() == "")
                    alert("Please enter contact number of field 66");
                else if ($("#<%=gotoquestion64.ClientID%>").is(':checked') && $("#<%=rbsolelegalrightsNo.ClientID%>").is(':checked') && $("#<%=txtpersonrelationship.ClientID%>").val() == "")
                    alert("Please enter relationship of field 66");
                else if ($("#<%=gotoquestion64.ClientID%>").is(':checked') && $("#<%=rbsolelegalrightsNo.ClientID%>").is(':checked') && $("#<%=txtpersonnatureoflegalrights.ClientID%>").val() == "")
                    alert("Please enter Nature of legal rights of field 66");
                //67
                else if ($("#<%=gotoquestion64.ClientID%>").is(':checked') && $("#<%=txtparentsignatur67.ClientID%>").val() == "")
                    alert("Please enter signature of field 67");
                else if ($("#<%=gotoquestion64.ClientID%>").is(':checked') && $("#<%=txtsignDate.ClientID%>").val() == "")
                    alert("Please enter Date of field 67");
                else if ($("#<%=gotoquestion64.ClientID%>").is(':checked') && $("#<%=txtfullname67.ClientID%>").val() == "")
                    alert("Please enter full name of field 67");
                else if ($("#<%=gotoquestion64.ClientID%>").is(':checked') && $("#<%=txtrelationship67.ClientID%>").val() == "")
                    alert("Please enter relationshipto student applicant of field 67");
                else
                    valid = true;
            }
            else
                valid = true;

            return valid;
        }
        

        function validateForm() {

            var flag = false
            if (!($("#<%=rboutsidecountryNo.ClientID%>").is(':checked') || $("#<%=rboutsidecountryYes.ClientID%>").is(':checked')))
                alert("please select In the last 5 years, have you, or has any member of your family unit included in this application, visited or lived outside your country of usual residence for more than 3 consecutive months of field 50");
            else if ($("#<%=rboutsidecountryYes.ClientID%>").is(':checked') && $("#<%=txtfamilymembername.ClientID%>").val() == "")
                alert("please select name of field 50");
            else if ($("#<%=rboutsidecountryYes.ClientID%>").is(':checked') && $("#<%=ddlfamilyresidencecountry.ClientID%>").val() == "0")
                alert("please select country of field 50");
            else if ($("#<%=rboutsidecountryYes.ClientID%>").is(':checked') && $("#<%=txtfamilyresidenceFrom.ClientID%>").val() == "")
                alert("please select from date of field 50");
            else if ($("#<%=rboutsidecountryYes.ClientID%>").is(':checked') && $("#<%=txtfamilyresidenceTo.ClientID%>").val() == "")
                alert("please select to date of field 50");
            else if (!($("#<%=rbworkforaustralianhospitalNo.ClientID%>").is(':checked') || $("#<%=rbworkforaustralianhospitalYes.ClientID%>").is(':checked')))
                alert("please select Do you, or any member of your family unit included in this application, intend entering an Australian hospital (including nursing homes) for work, training, treatment or visiting of field 51");
            else if ($("#<%=rbworkforaustralianhospitalYes.ClientID%>").is(':checked') && $("#<%=txtdescriptionofhospitalwork.ClientID%>").val() == "")
                alert("please enter description of field 51");
            else if (!($("#<%=rbworkforaustralianpreschoolNo.ClientID%>").is(':checked') || $("#<%=rbworkforaustralianpreschoolYes.ClientID%>").is(':checked')))
                alert("please select Do you, or any member of your family unit included in this application, intend to work in an Australian preschool-aged child care centre (including preschools and creches) as an employee or trainee? of field 52");
            else if ($("#<%=rbworkforaustralianpreschoolYes.ClientID%>").is(':checked') && $("#<%=txtdescriptionofpreschoolwork.ClientID%>").val() == "")
                alert("please enter description of field 52");
            else if (!($("#<%=rbhaveanyhealthissueNO.ClientID%>").is(':checked') || $("#<%=rbhaveanyhealthissueYes.ClientID%>").is(':checked')))
                alert("please select Have you, or any member of your family unit included in this application: of field 53");
            else if ($("#<%=rbhaveanyhealthissueYes.ClientID%>").is(':checked') && $("#<%=txtdetailofhealthissue.ClientID%>").val() == "")
                alert("please enter description of field 53");
            else if (!($("#<%=rbrequiremobilityNo.ClientID%>").is(':checked') || $("#<%=rbrequiremobilityYes.ClientID%>").is(':checked')))
                alert("please select Do you require assistance with mobility and/or care of field 54");
            else if ($("#<%=rbrequiremobilityYes.ClientID%>").is(':checked') && $("#<%=txtdescriptionofmobility.ClientID%>").val() == "")
                alert("please enter description of field 54");
            else if (!($("#<%=rbmedicalproceduresNo.ClientID%>").is(':checked') || $("#<%=rbmedicalproceduresYes.ClientID%>").is(':checked')))
                alert("please select Do you intend performing medical procedures (eg. as a practising/trainee doctor, dentist, nurse) during your stay in Australia of field 55");
            else if ($("#<%=rbmedicalproceduresYes.ClientID%>").is(':checked') && $("#<%=txtproceduresdescription.ClientID%>").val() == "")
                alert("please enter description of field 55");
            else if (!($("#<%=rbmedicalfollowupNo.ClientID%>").is(':checked') || $("#<%=rbmedicalfollowupYes.ClientID%>").is(':checked')))
                alert("please select During your proposed visit to Australia, do you, or any children included in this application, expect to incur medical costs, or require treatment or medical follow up for of field 56");
            else if ($("#<%=rbmedicalfollowupYes.ClientID%>").is(':checked') && $("#<%=txtmedicalfollowupdescription.ClientID%>").val() == "")
                alert("please enter description of field 56");
            //57
            else if (!($("#<%=rbconvictedNo.ClientID%>").is(':checked') || $("#<%=rbconvictedYes.ClientID%>").is(':checked')))
                alert("Please select been convicted of a crime or offence in any country (including any conviction which is now removed from official records)of field 57 ");
            else if (!($("#<%=rbchargeoffenceNo.ClientID%>").is(':checked') || $("#<%=rbchargeoffenceYes.ClientID%>").is(':checked')))
                alert("Please select been charged with any offence that is currently awaiting legal action of field 57 ");
            else if (!($("#<%=rbcriminaloffenceNo.ClientID%>").is(':checked') || $("#<%=rbcriminaloffenceYes.ClientID%>").is(':checked')))
                alert("Please select option of field 57 ");
            else if (!($("#<%=rbremovedfromcountryNo.ClientID%>").is(':checked') || $("#<%=rbremovedfromcountryYes.ClientID%>").is(':checked')))
                alert("Please select option of field 57 ");
            else if (!($("#<%=rbtoavoidbeingremovedNo.ClientID%>").is(':checked') || $("#<%=rbtoavoidbeingremovedYes.ClientID%>").is(':checked')))
                alert("Please select option of field 57 ");
            else if (!($("#<%=rbbeenexcludedNo.ClientID%>").is(':checked') || $("#<%=rbbeenexcludedYes.ClientID%>").is(':checked')))
                alert("Please select option of field 57 ");
            else if (!($("#<%=rbhumanrightscrimeNo.ClientID%>").is(':checked') || $("#<%=rbhumanrightscrimeYes.ClientID%>").is(':checked')))
                alert("Please select option of field 57 ");
            else if (!($("#<%=rbrisktonationalsecurityNo.ClientID%>").is(':checked') || $("#<%=rbrisktonationalsecurityYes.ClientID%>").is(':checked')))
                alert("Please select option of field 57 ");
            else if (!($("#<%=rboutstandingdebetsNo.ClientID%>").is(':checked') || $("#<%=rboutstandingdebetsYes.ClientID%>").is(':checked')))
                alert("Please select option  of field 57 ");
            else if (!($("#<%=rbconvictedoffenceNo.ClientID%>").is(':checked') || $("#<%=rbconvictedoffenceYes.ClientID%>").is(':checked')))
                alert("Please select option of field 57 ");
            else if (!($("#<%=rbservedinmilitaryforceNo.ClientID%>").is(':checked') || $("#<%=rbservedinmilitaryforceYes.ClientID%>").is(':checked')))
                alert("Please select option of field 57 ");
            //58 
            else if (!($("#<%=rbunder18ageNo.ClientID%>").is(':checked') || $("#<%=rbunder18ageYes.ClientID%>").is(':checked')))
                alert("Please select Are you under 18 years of age? of field 58");

            else if (!validate18YearsOfAgeForm()) {}

            //68
            else if (!($("#<%=rbreceiveassistanceNo.ClientID%>").is(':checked') || $("#<%=rbreceiveassistanceYes.ClientID%>").is(':checked')))
                alert("Please select Did you receive assistance in completing this form of field 68");

            else if (!validquestion68()) { }

            //73
            else if (!($("#<%=rbmyself.ClientID%>").is(':checked') || $("#<%=rbmigrationagent.ClientID%>").is(':checked') || $("#<%=rbOffshoreagent.ClientID%>").is(':checked') || $("#<%=rbAgentexempted.ClientID%>").is(':checked') || $("#<%=rbAuthorisedrecipient.ClientID%>").is(':checked')))
                alert("Please select All written communications about this application should be sent to: of field 73");

            else if (!validauthorizedrecipientQ73()) { }
            else if (!validquestion78()) { }
           
            //81                
            else if (!($("#<%=rbBankcheque.ClientID%>").is(':checked') || $("#<%=rbMoneyorder.ClientID%>").is(':checked') || $("#<%=rbDebitcard.ClientID%>").is(':checked') || $("#<%=rbCreditcard.ClientID%>").is(':checked')))
                alert("Please select methods of payment of field 81");
            else if ($("#<%=rbCreditcard.ClientID%>").is(':checked'))
            {
                if (!($("#<%=rbMasterCard.ClientID%>").is(':checked') || $("#<%=rbBankcard.ClientID%>").is(':checked') || $("#<%=rbAmericanExpress.ClientID%>").is(':checked') || $("#<%=rbVisa.ClientID%>").is(':checked') || $("#<%=rbDinersClub.ClientID%>").is(':checked') || $("#<%=rbJCB.ClientID%>").is(':checked')))
                    alert("Please select  of field 81");
                else if ($("#<%=txtamountinaustraliandollars.ClientID%>").val() == "")
                    alert("Please enter of field 81");
                else if ($("#<%=txtcreditcardno.ClientID%>").val() == "")
                    alert("Please enter of field 81");
                else if ($("#<%=txtcreditcardexpirydate.ClientID%>").val() == "")
                    alert("Please enter of field 81");
                else if ($("#<%=txtcardholdarname.ClientID%>").val() == "")
                    alert("Please enter of field 81");
                else if ($("#<%=txtcontactnumber.ClientID%>").val() == "")
                    alert("Please enter of field 81");
                else if ($("#<%=txtaddressofcardholder.ClientID%>").val() == "")
                    alert("Please enter of field 81");
                else if ($("#<%=txtsignatureofcardholder.ClientID%>").val() == "")
                    alert("Please enter of field 81");
            }
                //82
            else if ($("#<%=txtdeclarationsignature.ClientID%>").val() == "")
                alert("Please upload signature of field 82");
            else if ($("#<%=txtdeclarationdate.ClientID%>").val() == "")
                alert("Please select date of field 82");
            else
                flag = true;
            return flag;
        }
        $(document).ready(function () {
            $('.sidebar-menu-item').removeClass('open');
            $('#Application_list').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#applicantvisa').addClass('active');
        });
    </script>
</asp:Content>