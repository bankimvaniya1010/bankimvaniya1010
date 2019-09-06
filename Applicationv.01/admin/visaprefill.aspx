<%@ Page Language="C#" AutoEventWireup="true" CodeFile="visaprefill.aspx.cs" Inherits="visaprefill" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title></title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
   
    <link rel="stylesheet" type="text/css" href="<%=VirtualPathUtility.ToAbsolute("~/assets/dashboard/css/bootstrap.min.css")%>" />
    <link rel="stylesheet" type="text/css" href="<%=VirtualPathUtility.ToAbsolute("~/assets/dashboard/css/style.css")%>">
    
</head>
<body>
    <table align="center" border="0" cellpadding="0" cellspacing="0" width="100%" style="padding: 0 0 40px; background-color: #ffffff;">
        <tr>
            <td style="width: 100%;">
                <table border="0" cellpadding="0" cellspacing="0" style="padding: 0 0 40px; background-color: #ffffff; width: 850px; margin: 0 auto;">
                    <tr>
                        <td>
                            <img src="/assets/dashboard/img/pdf-head.jpg" style="width:100%;">
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table border="0" cellpadding="0" cellspacing="0" style="padding: 0 0 40px; background-color: #ffffff; width: 850px; margin: 0 auto;">
                    <tr>
                        <td style="vertical-align: top; width: 50%; padding: 0 15px;">
                            <h3 class="visaInfo-ttl">Applying online</h3>
                            <p class="visaInfo-descp">The Department of Immigration and Multicultural Affairs (the department) offers a number of convenient  services for student visa applicants. To find out whether you are eligible to apply online for a student visa, refer to the department’s website www.immi.gov.au/e_visa/students.htm</p>
                            <p class="visaInfo-descp">
                                If you wish to enter Australia or extend your stay as a student and you are not eligible to apply online, complete this form in
							ENGLISH using BLOCK LETTERS.
                            </p>
                            <p class="visaInfo-descp">
                                To complete this form you must first read these notes and information form 1160i Applying for a student visa. Detailed
							information is also available on the department’s website
							www.immi.gov.au/study/
                            </p>
                            <h3 class="visaInfo-ttl">Who can use this form?</h3>
                            <p class="visaInfo-descp">
                                You should use this form if you wish to apply for a student visa
								and be assessed against one of the following subclasses:
									<ul>
                                        <li>Independent ELICOS visa (subclass 570);</li>
                                        <li>Schools visa (subclass 571);</li>
                                        <li>Vocational Education and Training visa (subclass 572);</li>
                                        <li>Higher Education visa (subclass 573);</li>
                                        <li>Postgraduate Research visa (subclass 574);</li>
                                        <li>Non-Award visa (subclass 575);</li>
                                        <li>AusAID or Defence visa (subclass 576).</li>
                                    </ul>
                                Each subclass is linked to the type of course you intend to
								undertake in Australia as your main course of study.
                            </p>
                            <p class="visaInfo-descp">Each subclass is linked to the type of course you intend to undertake in Australia as your main course of study.</p>
                            <p class="visaInfo-descp">
                                You are not able to use this form to apply for a Student Guardian visa (subclass 580). Form 157G <i>Application for a Student
							Guardian visa</i> is the only valid form for a Student Guardian visa application.
                            </p>
                            <p class="visaInfo-descp">
                                If you are applying for a visa that can be granted in Australia and you are making this application in Australia, this form also
							serves as an application form for any class of bridging visa
							(classes A, C or E) for which you may be eligible to apply – see
							the information form 1024i <i>Bridging visas</i>, which is available
							on the department’s website <b>www.immi.gov.au/allforms/</b>
                            </p>
                            <p class="visaInfo-descp">
                                Please refer to information form 1160i <i>Applying for a student visa</i> for further information about Australia’s student visa
							program.
                            </p>
                            <h3 class="visaInfo-ttl">Working while studying</h3>
                            <p class="visaInfo-descp">If you already hold a student visa and now want permission to work, you and your family members can apply online <b>www.immi.gov.au/e_visa/students.htm</b></p>
                            <p class="visaInfo-descp">
                                To be eligible for permission to work while studying in Australia, you must first have commenced your course. More information
								about permission to work while studying is available on the
								department’s website <b>www.immi.gov.au/study/working/</b>
                            </p>
                        </td>
                        <td style="vertical-align: top; width: 50%; padding: 0 15px;">
                            <h3 class="visaInfo-ttl">Changing education provider</h3>
                            <p class="visaInfo-descp">
                                If you hold a student visa and wish to change education provider, you may need to seek the department’s permission first. You must seek permission if your visa is subject to condition 8206 and you wish to change education provider either:
								<ul>
                                    <li>while studying any preliminary courses; or</li>
                                    <li>during the first 12 months of your principal course.</li>
                                </ul>
                                If you wish to change education provider but continue studying the same type of course, you must apply on form 157C <i>Application for a student visa with permission to change education provider.</i>
                            </p>
                            <p class="visaInfo-descp">If you wish to change both your provider and the type of course you are studying, you must apply for a new student visa using this form (form 157A).</p>
                            <p class="visaInfo-descp">In either case, you must demonstrate that exceptional reasons exist to justify your change in enrolment.</p>
                            <h3 class="visaInfo-ttl">Changing course type (education sector)</h3>
                            <p class="visaInfo-descp">Your student visa is linked to the type of course you are studying. Each student visa subclass covers specific types of course only. If you wish to change your principal course at any time to a course in a different education sector, you must first apply for a new student visa using this form (form 157A).</p>
                            <p class="visaInfo-descp">For information on course types and their relationship to the different student visa subclasses, refer to the department’s website <b>www.immi.gov.au/study/</b></p>
                            <h3 class="visaInfo-ttl">Applying for a student visa</h3>
                            <p class="visaInfo-descp">To help you lodge your application and communicate with the department while your application is being processed you should read information form 1025i <i>Making and processing visa applications</i>, which is available from your nearest Australian Government office or the department’s website</p>
                            <p class="visaInfo-descp">All student visa applicants must satisfy the criteria for grant of one of the student visa subclasses. These criteria include (but are not limited to) financial ability, English language proficiency, intention to comply with visa conditions and other relevant matters. Information on these criteria and the conditions that may be attached to your visa can be found in the information form 1160i <i>Applying for a student visa</i> and on the department’s website.</p>
                            <p class="visaInfo-descp"><b>Note:</b> If you are required to provide the results of an English language test, <b>you must sit the test before you lodge your visa application</b>. If you sit a test after you have lodged your application, the results of this test cannot be taken into account.</p>
                            <p class="visaInfo-descp">If you wish to study in Australia, your application will be assessed against one of 5 assessment levels for each visa subclass. Before completing this form, you must refer to information form 1219i <i>Overseas Student Program – Assessment Levels</i> for information on which Assessment Level applies to you. Information on assessment levels can be found on the department’s website.</p>
                        </td>
                    </tr>
                    <tr>
                        <td style="vertical-align: top; width: 50%; padding: 0 15px;">
                            <p class="visaInfo-descp">In certain circumstances you may be requested to complete a supplementary information form. You will be advised by the visa processing office if this is necessary.</p>
                            <p class="visaInfo-descp">
                                Your application may be decided solely on the basis of information provided in this application. Failure to answer a
							question may result in your application being refused if the decision-maker cannot be satisfied that you meet all of the
							criteria for grant of the visa. The provision of information to the department that is incorrect may result in cancellation of your visa if it is granted. If you need more space to answer any question, write the details on a separate sheet, sign it and attach it to the application form.
                            </p>
                            <p class="visaInfo-descp">You must provide all of the documentation necessary to support your application (originals or certified or notarised copies) and you must declare that you have done so. Failure to do so may result in your application being refused. The documentation required may vary depending on your Assessment Level and the subclass appropriate to your course of study. Information on documentation required is available on the department’s website. A decision on your application will be made on the basis of all the information you provide, your circumstances and the legal requirements that apply. If your circumstances change in any way after you make your application you must inform the department immediately. Failure to do so can lead to cancellation of your visa (if it is granted).</p>
                            <p class="visaInfo-descp">
                                <b>Applicants who provide false or misleading information may either have their applications refused, or their visa permitting them to remain in Australia cancelled.</b>
                                <br>
                                If you:
								<ul>
                                    <li>are applying in Australia;</li>
                                    <li>do not already hold a student visa; and</li>
                                    <li>you are in Assessment Level 2, 3, 4 or 5</li>
                                </ul>
                                you must provide exceptional reasons for the grant of your visa
								in Australia.
                            </p>
                            <h3 class="visaInfo-ttl">Photographs</h3>
                            <p class="visaInfo-descp"><b>Applying outside Australia – </b>enclose 4 recent passport-sized photographs of yourself and all family members included in this application.</p>
                            <p class="visaInfo-descp"><b>Applying in Australia – </b>enclose one recent passport-sized photograph of yourself and all family members included in this application.</p>
                            <h3 class="visaInfo-ttl">Health requirements</h3>
                            <p class="visaInfo-descp">All applicants must meet Australia’s health requirements. You and any family members included in this application may be required to undergo a chest x-ray and medical examination. Refer to form 1163i <i>Health requirement for temporary entry to Australia </i>for further details</p>
                            <p class="visaInfo-descp">If applying outside Australia under Assessment Level 3, 4 or 5, you should not undertake your medical or x-ray examinations until advised to do so by the Australian Government office processing your visa application.</p>
                            <h3 class="visaInfo-ttl">Members of your family unit</h3>
                            <p class="visaInfo-descp">The term ‘members of the family unit’ covers your spouse (including a de facto spouse) and dependent children of you or your spouse, who are unmarried and have not turned 18 years of age. School-age dependants are unmarried dependent children of you or your spouse who have turned 5, but have not yet turned 18.</p>
                            <p class="visaInfo-descp">Members of your family unit may apply for visas that will allow them to join you in Australia. They may apply for visas at the same time as you, or after you have arrived in Australia and</p>
                        </td>
                        <td style="vertical-align: top; width: 50%; padding: 0 15px;">
                            <p class="visaInfo-descp">commenced your course of study. If you are in Australia and your family members intend to apply to join you after you have commenced your course, you will need to complete form 919 <i>Nomination of student dependant(s)</i>. You must send this form and other necessary documentary evidence to your family members for them to lodge at the relevant Australian Government office.</p>
                            <p class="visaInfo-descp"><b>Note:</b> If you are processed at Assessment Level 3, 4 or 5 and intend to undertake a course of 12 months or less in duration, members of the family unit are not permitted to accompany you to Australia on a student visa.</p>
                            <p class="visaInfo-descp"><b>All members of your family unit must be declared on your application form</b>, whether or not they intend to travel to Australia with you. A member who is not declared will not be eligible for entry to Australia as a family unit member, unless they were not your spouse or child at the time you lodged your application but have since become so.</p>
                            <p class="visaInfo-descp">A school-age family unit member joining you in Australia is expected to attend school in Australia. You must provide evidence of enrolment for them if you wish them to be granted a student visa as a family unit member. You are responsible for their education costs in accordance with the charging policy of the relevant Australian state or territory.</p>
                            <p class="visaInfo-descp">Your spouse will have a condition placed on their visa that limits their period of study in Australia to a maximum of 3 months. If they wish to undertake study beyond this period they must apply for a student visa in their own right.</p>
                            <p class="visaInfo-descp">If you are an AusAID or Defence-sponsored student, members  of your family unit must provide evidence of support by the relevant Minister for them to be granted a visa as your dependant.</p>
                            <h3 class="visaInfo-ttl">‘No further stay’ conditions</h3>
                            <p class="visaInfo-descp">Your visa will be subject to a number of visa conditions. Information on these conditions can be found in the information form 1160i <i>Applying for a student visa</i> and on the department’s website.</p>
                            <p class="visaInfo-descp">In certain circumstances, your visa may be subject to the ‘no further stay’ condition 8534 or 8535.</p>
                            <h3 class="visaInfo-ttl">Condition 8534</h3>
                            <p class="visaInfo-descp">If you are an Assessment Level 3, 4 or 5 student whose overall intended period of study is 10 months or less, you will usually be subject to this ‘no further stay’ condition. This means that after entering Australia, you may not be granted any other visa while you remain in Australia, other than a further student visa with permission to work or a Graduate – Skilled visa 1 . If you are an Assessment Level 3 student you may be exempt from the mandatory imposition of the ‘no further stay’ if you can show an additional A$12,000 and funds to cover living and school costs for a 12-month period in addition to the period of your intended study in Australia.</p>
                            <p class="visaInfo-descp">A ‘no further stay’ condition may also be imposed on your visa, irrespective of your Assessment Level or period of study, if the decision maker considers this appropriate.</p>
                            <h3 class="visaInfo-ttl">Condition 8535</h3>
                            <p class="visaInfo-descp">If you are sponsored by the Australian Government or the government of your home country, you may be subject to this ‘no further stay’ condition. This means that after entering Australia, you will not be entitled to be granted any other visa while you remain in Australia apart from a further student visa with permission to work or a further student visa with the consent of your sponsor<sup>1</sup> .</p>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 50%; vertical-align: top; padding: 0 15px;">
                            <h3 class="visaInfo-ttl">Visa application charge</h3>
                            <p class="visaInfo-descp">Your completed application form, together with the correct visa application charge, can be lodged at the nearest Australian Government office if applying outside Australia, or at the nearest office of the department if applying in Australia. You can check the visa application charge with your nearest office of the department, or from form 990i Charges, which is available in the Forms section of the department’s website <b>www.immi.gov.au/allforms/</b></p>
                            <p class="visaInfo-descp">Payment must accompany your application and is generally not refunded if the application is unsuccessful. If you have paid enrolment or tuition fees, it is your responsibility to get a refund of these fees.</p>
                            <p class="visaInfo-descp">To make a payment in Australia, please pay by credit card, debit card or by bank cheque or money order made payable to the Department of Immigration and Multicultural Affairs. <b>Please do not pay by cash or personal cheque.</b></p>
                            <p class="visaInfo-descp">For clients outside Australia, before you make a payment, please contact the Australian Government office to find out what methods of payment can be accepted at that office.</p>
                            <h3 class="visaInfo-ttl">Authorisation of a person to only receive written communications</h3>
                            <p class="visaInfo-descp">You may authorise another person to only receive all written communications about your application for a student visa with the department. That person will be known as your authorised recipient. To do this, you will need to complete Question 73 <i>Options for receiving written communications</i> and Question 75 <i>Authorised recipient details</i> in this form. The authorised recipient will need to sign at Question 77 Authorised recipient consent. You can only appoint one authorised recipient at any time. The department will communicate with the most recently appointed authorised recipient.</p>
                            <p class="visaInfo-descp">The department is required under section 494D of the <i>Migration Act 1958</i> (the Act) to send your authorised recipient any written communications relating to your application that would otherwise have been sent to you (but a copy of that communication may also be sent to you). If your authorised recipient agrees to it at Question 76, this communication may take place by fax or e-mail.</p>
                            <p class="visaInfo-descp">The department will send your authorised recipient only information which you are entitled to receive. For example, if you are a visa applicant and have a sponsor, your authorised recipient will not receive personal information about your sponsor, unless your sponsor also appointed the same authorised recipient.</p>
                            <p class="visaInfo-descp">If you decide to change your nominated authorised recipient, after you have lodged this application, you must promptly advise the department in writing. You may use form 1231 Appointment of authorised recipient for this purpose, which is available from the department’s website <b>www.immi.gov.au/allforms/</b> or from any office of the department or Australian mission.</p>
                        </td>
                        <td style="width: 50%; vertical-align: top; padding: 0 15px;">
                            <h3 class="visaInfo-ttl">Authorisation of a migration agent to act on your behalf</h3>
                            <p class="visaInfo-descp">If you have a migration agent acting on your behalf in relation to your application for a student visa, you need to complete Question 73 <i>Options for receiving written communications </i>and Question 78 <i>Agent details</i>. The migration agent will need to sign at Question 80 <i>Agent consent</i>.</p>
                            <p class="visaInfo-descp">Appointing a migration agent to act on your behalf includes authorising the department to:</p>
                            <ul>
                                <li>discuss your student visa application with the migration agent and seek further information from them; and</li>
                                <li>send your migration agent written communications about your student visa application that would otherwise have been 
								sent to you.</li>
                            </ul>
                            <p class="visaInfo-descp"><b>Note:</b> Your migration agent will be your authorised recipient for written communication under section 494D of the Act and, in accordance with that same provision, you will be taken to have received any documents sent to them.</p>
                            <p class="visaInfo-descp">If you change your migration agent or end his/her appointment, after you have lodged this application, you must promptly advise the department in writing, preferably by using form 956 <i>Appointment of a migration agent</i>, which is available on the department’s website <b>www.immi.gov.au/allforms/</b> or from your migration agent.</p>
                            <p class="visaInfo-descp">The department will communicate with your migration agent about your application, including your personal information such as health, police checks, financial viability and personal relationships. If your agent authorises it at Question 79 this communication may take place by e-mail or fax.</p>
                            <p class="visaInfo-descp">The department will send to your migration agent only information which you are entitled to receive. For example, if you are a visa applicant and have a sponsor, your agent will not receive personal information about your sponsor, unless your sponsor has also appointed the same migration agent.</p>
                            <p class="visaInfo-descp">In some situations, departmental staff will need to speak with you directly rather than with your migration agent. For example, if you are applying for a visa the department may interview you. In some situations, the department will also send documents to you directly (for example, your passport) instead of to your migration agent, but it will inform your migration agent that it has done so.</p>
                            <p class="visaInfo-descp">If you have appointed a migration agent to act for you, you are still responsible for the accuracy of information and supporting documentation that you give to your migration agent to forward to the department.</p>
                            <p class="visaInfo-descp">
                                When you provide the details of your migration agent, please make sure you include their 7-digit:
							<ul>
                                <li>migration agent registration number (if they are a registered migration agent); or</li>
                                <li>offshore agent ID number (if they have been allocated one by the department).</li>
                            </ul>
                            </p>
                            <p class="visaInfo-descp"><b>Note:</b> Migration agents who operate overseas do not need to be registered. However, they may have been allocated an ID number by the department.</p>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 50%; vertical-align: top; padding: 0 15px;">
                            <p class="visaInfo-ttl">Using a migration agent</p>
                            <p class="visaInfo-descp">You are not required to use a migration agent. However, if you use a migration agent, the department encourages you to use a registered migration agent. Registered migration agents are bound by the Migration Agents Code of Conduct, which requires them to act in the lawful best interests of their clients and act professionally.</p>
                            <p class="visaInfo-descp">A list of registered migration agents is available from the Migration Agents Registration Authority (MARA) website www.themara.com.au</p>
                            <p class="visaInfo-descp">
                                You can contact the MARA at:
                                <pre>
E-mail:  themara@themara.com.au

PO Box Q1551
QVB NSW 1230
AUSTRALIA

Telephone:  61 2 9299 5446
Fax:        61 2 9299 8448

</pre>
                            </p>

                            <h3 class="visaInfo-ttl">Restrictions on giving immigration assistance</h3>
                            <p class="visaInfo-descp">In Australia, anyone (including a lawyer) who uses knowledge of migration procedure to offer immigration assistance to a visa or cancellation review applicant, sponsor or nominator, must be registered, unless exempted from registration requirements by law. There are serious criminal penalties under Part 3 of the Act for breaching the law, including possible imprisonment if the unregistered person asks for, or receives, a fee or reward for their services.</p>
                            <h3 class="visaInfo-ttl">Using an agent exempted from registration</h3>
                            <p class="visaInfo-descp">Certain people, such as officials, parliamentarians, diplomats, close family members (that is, only your spouse, child, adopted child, parent, brother or sister), sponsors and nominators, are able to provide you with immigration assistance as long as they do not ask or receive a fee or reward. If you wish to appoint an ‘exempted agent’, you must complete form 956 <i>Appointment of a migration agent</i>, which is available from the department’s website <b>www.immi.gov.au/allforms/</b> and attach it to this application form.</p>
                            <h3 class="visaInfo-ttl">Applications for multiple visas</h3>
                            <p class="visaInfo-descp">If you are a dependant applicant (for example, the spouse of a primary applicant) and you wish to appoint a different migration agent to the primary applicant, you must fill out a separate form 956 <i>Appointment of a migration agent</i>, which is available from the department’s website <b>www.immi.gov.au/allforms/</b> or advise the department in writing. Otherwise, the migration agent appointed by the principal applicant will have the authority to act for all persons included in the application.</p>

                        </td>
                        <td style="width: 50%; vertical-align: top; padding: 0 15px;">
                            <h3 class="visaInfo-ttl">Notification of giving immigration assistance</h3>
                            <p class="visaInfo-descp">Under section 312A of the Act, a registered agent has a duty to notify the department when lodging an application on behalf of a client, or within 28 days of commencing to act on behalf of a visa applicant. This notification can be done by completing, and your agent signing, the relevant sections of this application form.</p>
                            <h3 class="visaInfo-ttl">Residential address</h3>
                            <p class="visaInfo-descp">You must tell the department where you intend to live while your application is being dealt with. Failure to give a residential address will result in your application being invalid. A post office box address will not be accepted as your residential address.</p>
                            <h3 class="visaInfo-ttl">Consent to communicate electronically</h3>
                            <p class="visaInfo-descp">The department may use a range of means to communicate with you. However, electronic means such as fax or e-mail will only be used if you indicate your agreement to receiving communication in this way.</p>
                            <p class="visaInfo-descp">To process your application the department may need to communicate with you about sensitive information, for example, health, police checks, financial viability and personal relationships. Electronic communications, unless adequately encrypted, are not secure and may be viewed by others or interfered with. If you agree to the department communicating with you by electronic means, the details you provide will only be used by the department for the purpose for which you have provided them, unless there is a legal obligation or necessity to use them for another purpose, or you have consented to use for another purpose. They will not be added to any mailing list.</p>
                            <p class="visaInfo-descp">The Australian Government accepts no responsibility for the security or integrity of any information sent to the department over the internet or by other electronic means.</p>
                            <p class="visaInfo-descp">If you authorise another person to receive documents on your behalf and they wish to be contacted electronically, their signature is required on the form to indicate their consent to this form of communication.</p>
                            <h3 class="visaInfo-ttl">About the information you give to the department</h3>
                            <p class="visaInfo-descp">The department is authorised to collect information provided on this form under Part 2 of the Migration Act 1958. The information collected will be used for assessing your eligibility for a student visa to travel to and enter and/or remain in Australia, to monitor the conduct of migration agents, and for other purposes relating to the administration of the Migration Act.</p>
                            <p class="visaInfo-descp">The information collected might also be disclosed to agencies who are authorised to receive information relating to adoption, border control, business skills, citizenship, education, health assessment, health insurance, health services, law enforcement, payment of pensions and benefits, taxation, review of decisions and registration of migration agents. It will also be disclosed to any agency of the Australian Government, or of a state or territory, that is responsible for or otherwise concerned with the regulation of education providers.</p>
                            <p class="visaInfo-descp">Relevant information about you will be disclosed to federal, state and territory police to assist in your location and possible detention in the event that you become an unlawful non-citizen. You will become an unlawful non-citizen if your visa ceases (for example, by cancellation for breach of visa condition) or expires and you do not hold another visa authorising you to remain in Australia.</p>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <p class="visaInfo-descp">The information on this form, including the results of any tests for Human Immunodeficiency Virus (HIV), will be used to assess your health for an Australian visa. A positive HIV <b>or other</b> test result will not necessarily lead to a visa being denied. Your result(s) may be disclosed to the relevant Australian Government state and territory health agencies.</p>
                            <p class="visaInfo-descp">In addition, the relevant registered education provider(s) may be told whether or not your visa has been granted. The collection, access, storage, use and disclosure by the department of the information you provide in this form is governed by the <i>Privacy Act 1988</i> and, in particular, by the 11 Information Privacy Principles. The information form 993i <i>Safeguarding your personal information</i> gives details of agencies to which your personal information might be disclosed. This form is available from the department’s website <b>www.immi.gov.au/allforms/</b> or from any departmental office or Australian mission overseas.</p>
                            <p class="visaInfo-descp">The department has authority under the <i>Migration Act</i> 1958 to collect a range of personal identifiers from non-citizens, including visa applicants, in certain circumstances. For more detailed information you should read information form 1243i <i>Your personal identifying information</i>. This form is available from the department’s website <b>www.immi.gov.au/allforms/</b> or from any departmental office or Australian mission overseas.</p>
                            <p class="visaInfo-descp">The <i>Freedom of Information Act</i> 1982 (FOI Act) also relates to your personal information. Under the FOI Act you can apply for access to documents containing your personal information. You or someone authorised by you to access information on your behalf can apply to do this at any departmental office in Australia. There is no fee for accessing your own information. If you are overseas, you must also provide the Australian mission with an address in Australia to which copies of personal records can be sent. More information on how to make a request under the FOI Act is given on form 424A <i>Request for access to documents under the Freedom of Information Act</i> 1982 which is available from the department’s website <b>www.immi.gov.au/allforms/</b> or from any departmental office or  Australian mission overseas.</p>
                            <h3 class="visaInfo-ttl">Review rights</h3>
                            <p class="visaInfo-descp">If you apply for a student visa in Australia and you are refused the visa, you may apply for a review of the decision. You will be notified of your review rights in writing and the time limits for lodging such an appeal.</p>
                            <p class="visaInfo-descp">There are no review rights for decisions to refuse a student visa where the application is made outside Australia.</p>
                            <table cellpadding="0" cellspacing="0" width="100%" style="border: 1px solid #000; margin-top: 20px;">
                                <tr>
                                    <td style="width: 30%; text-align: right; padding: 5px; font-size: 15px;">
                                        <i>Home page</i>
                                    </td>
                                    <td style="width: 70%; padding: 5px 5px 5px 10px; font-size: 16px;">
                                        <b>www.immi.gov.au</b>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 30%; text-align: right; padding: 5px; font-size: 15px; vertical-align: top;">
                                        <i>General enquiry line</i>
                                    </td>
                                    <td style="width: 70%; padding: 5px 5px 5px 10px; font-size: 13px;">Telephone <b>131 881</b> during business hours in Australia to speak to an operator (recorded
information available outside these hours). If you are outside Australia, please contact your nearest Australian mission.

                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td></td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>

    <table align="center" border="0" cellpadding="0" cellspacing="0" width="100%" style="padding: 0 0 40px; background-color: #ffffff;">
        <tr>
            <td style="width: 100%;">
                <table border="0" cellpadding="0" cellspacing="0" style="padding: 0 0 40px; background-color: #ffffff; width: 850px; margin: 0 auto;">
                    <tr>
                        <td style="width: 25%; vertical-align: middle;">
                            <img src="/assets/dashboard/img/pdf-head.jpg" style="width:100%;">
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table border="0" cellpadding="0" cellspacing="0" style="padding: 0 0 40px; background-color: #ffffff; width: 850px; margin: 0 auto;" class="form-table">
                    <!-- Start Form here -->
                    <tr style="padding-top: 15px;">
                        <td style="width: 50%; vertical-align: top; padding: 0 15px;">
                            <h2 class="part"><i>Part A – To be completed by
                                <br>
                                all applicants</i></h2>
                            <h6 class="part-sub"><i>Application details</i></h6>
                            <p class="txt" style="margin-bottom: 10px;">
                                <span class="num-ques">1</span>How many people are included in this application?  &nbsp; &nbsp;
                                <input type="text" name="" id="noofpeopleincluded" runat="server">
                            </p>
                            <p class="txt" style="margin-bottom: 2px;">
                                <span class="num-ques">2</span>
                                Are you applying
                            </p>
                            <p class="txt" style="margin-bottom: 10px;">
                                <label style="width: 155px; text-align: right; padding-right: 7px;">for yourself as a student? </label>
                                <input type="radio" id="rblyourself" runat="server" name="family" style="vertical-align: middle;"><i class="fas fa-caret-right" style="font-size: 18px; vertical-align: middle; margin-left: 3px;"></i> <span class="txt" style="vertical-align: middle;">Complete Parts A, B and D </span>
                                <br>
                                <label style="width: 155px; text-align: right; padding-right: 7px;">for yourself and family?</label><input type="radio" id="rblselfwithFamily" name="family" runat="server" style="vertical-align: middle;"><i class="fas fa-caret-right" style="font-size: 18px; vertical-align: middle; margin-left: 3px;"></i> <span class="txt" style="vertical-align: middle;">Complete Parts A, B and D</span><br>
                                <label style="width: 155px; text-align: right; padding-right: 7px;">as a member of a student’s family unit?</label><input type="radio" id="rblyourfamily" name="family" runat="server" style="vertical-align: middle;"><i class="fas fa-caret-right" style="font-size: 18px; vertical-align: middle; margin-left: 3px;"></i> <span class="txt" style="vertical-align: middle;">Complete Parts A, C and D</span><br>
                            </p>
                        </td>
                        <td style="width: 50%; vertical-align: top; padding: 0 15px; text-align: right;">
                            <img src="/assets/dashboard/img/photo1.jpg">
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 50%; vertical-align: top; padding: 0 15px;">
                            <h6 class="part-sub"><i>Your personal details</i></h6>
                            <p class="txt" style="margin-top: 10px;"><b class="num-ques">3</b>Your full name in English</p>
                            <p class="txt" style="margin-top: 10px;">
                                <label style="width: 100px;">Family Name</label>
                                <input type="text" id="familyname" runat="server" style="width: 240px; margin-bottom: 5px;">
                            </p>
                            <p class="txt">
                                <label style="width: 100px;">Given Names</label>
                                <input type="text" id="givenname" runat="server" name="" style="width: 240px;">
                            </p>
                            <p class="txt">
                                <label style="width: 100px;"></label>
                                <input type="text" name="" style="width: 240px;">
                            </p>
                            <p class="txt" style="margin-top: 10px;"><b class="num-ques">4</b> Name in your own language or script (if applicable) </p>
                            <p class="txt">
                                <input type="text" name="" style="width: 340px;">
                            </p>
                            <p class="txt">
                                <input type="text" name="" style="width: 340px;">
                            </p>
                            <p class="txt" style="margin-top: 10px;">
                                <b class="num-ques">5</b> Have you been known by any other names? </br>
				              <em>(including name at birth, previous married names, aliases)</em>
                            </p>
                            <p class="txt">
                                <label style="width: 30px;">Yes</label>
                                <input type="checkbox" id="chkanothernameyes" runat="server" name="" style="vertical-align: middle;">
                                <br>
                                <label style="width: 30px;">No</label>
                                <input type="checkbox" id="chkanothernameno" runat="server" name="" style="vertical-align: middle;">
                                <i class="fas fa-caret-right" style="font-size: 18px; vertical-align: middle; margin-left: 3px;"></i><span class="txt" style="vertical-align: middle;">Give details and provide supporting evidence eg. birth certificate/marriage certificate</span>
                            </p>
                            <p class="txt">
                                <label style="width: 100px;">Family Name</label>
                                <input type="text" id="anotherfamilyname" runat="server" name="" style="width: 240px; margin-bottom: 5px;">
                            </p>
                            <p class="txt">
                                <label style="width: 100px;">Given Names</label>
                                <input type="text" id="anothergivenname" runat="server" style="width: 240px;">
                            </p>
                            <p class="txt">
                                <label style="width: 100px;"></label>
                                <input type="text" id="ownlanguagename1" runat="server" name="" style="width: 240px;">
                            </p>
                            <p class="txt" style="margin-top: 10px;">
                                <b class="num-ques">6</b>
                                <label style="width: 50px;">Sex</label>
                                <label style="width: 30px;">Male</label>
                                <input type="checkbox" id="chkMale" runat="server" name="" style="margin-right: 20px; vertical-align: middle;">
                                <label style="width: 50px;">Female</label>
                                <input type="checkbox" id="chkFemale" runat="server" name="" style="vertical-align: middle;">
                            </p>
                            <p class="txt" style="margin-top: 10px;">
                                <b class="num-ques">7</b>
                                <label style="width: 80px;">Date of birth</label>
                                <input type="text" name="" id="dateofbirth" runat="server" style="width: 110px; font-size: 10px;" placeholder="DAY / MONTH / YEAR">
                            </p>
                            <p class="txt" style="margin-top: 10px;"><b class="num-ques">8</b>Place of birth</p>
                            <p class="txt">
                                <label style="width: 100px;">Town/city </label>
                                <input type="text" name="" id="cityofbirth" runat="server" style="width: 240px; margin-bottom: 5px;">
                            </p>
                            <p class="txt">
                                <label style="width: 100px;">Country</label>
                                <input type="text" name="" style="width: 240px;" id="countryofbirth" runat="server">
                            </p>
                            <p class="txt" style="margin-top: 10px;"><b class="num-ques">9</b>Marital status </p>
                            <p class="txt">
                                <label style="width: 60px;">Married</label>
                                <input type="checkbox" id="chkMarried" runat="server" name="" style="margin-right: 10px; font-size: 11px; vertical-align: middle;">
                                <label style="width: 60px;">Separated</label>
                                <input type="checkbox" id="chkSeparated" runat="server" name="" style="margin-right: 10px; font-size: 11px; vertical-align: middle;">
                                <label style="width: 90px;">Windowed</label>
                                <input type="checkbox" id="chkWidowed" runat="server" name="" style="vertical-align: middle;">
                                <br>
                                <label style="width: 60px;">Engaged</label>
                                <input type="checkbox" id="chkEngaged" runat="server" name="" style="margin-right: 10px; font-size: 11px; vertical-align: middle;">
                                <label style="width: 60px;">Divorced</label>
                                <input type="checkbox" id="chkDivorced" runat="server" name="" style="margin-right: 10px; font-size: 11px; vertical-align: middle;">
                                <label style="width: 90px;">Never Married</label>
                                <input type="checkbox" id="chkNever" runat="server" name="" style="vertical-align: middle;">
                                <br>
                                <label style="width: 60px">De facto</label>
                                <input type="checkbox" id="chkDefacto" runat="server" name="" style="margin-right: 10px; font-size: 11px; vertical-align: middle;">
                            </p>
                        </td>
                        <td style="width: 50%; vertical-align: top; padding: 0 15px 0 30px;">

                            <p class="txt" style="margin-top: 10px;"><b class="num-ques">10</b> Your present country of citizenship  </p>
                            <p class="txt">
                                <input type="text" id="countryofcitizenship" runat="server" name="" style="width: 330px;">
                            </p>
                            <p class="txt" style="margin-top: 10px;"><b class="num-ques">11</b> Do you hold any other citizenship  </p>
                            <p class="txt">
                                <label style="width: 30px;">No</label>
                                <input type="checkbox" id="chkAnotherCitizenNo" runat="server" name="" style="vertical-align: middle;">
                                <br>
                                <label style="width: 30px;">Yes</label>
                                <input type="checkbox" id="chkAnotherCitizenYes" runat="server" name="" style="vertical-align: middle;">
                                <i class="fas fa-caret-right" style="font-size: 18px; vertical-align: middle; margin-left: 3px;"></i><span class="txt" style="vertical-align: middle;">Which countries? </span>
                            </p>
                            <p class="txt">
                                <input type="text" id="anothercountryofcitizenship" runat="server" name="" style="width: 270px; margin-left: 60px;">
                            </p>

                            <p class="txt" style="margin-top: 10px;"><b class="num-ques">12</b>Do you have a passport?  </p>
                            <p class="txt">
                                <label style="width: 30px;">No</label>
                                <input type="checkbox" id="chkPassposrtNo" runat="server" name="" style="vertical-align: middle;">
                                <br>
                                <label style="width: 30px;">Yes</label>
                                <input type="checkbox" id="chkPassposrtYes" runat="server" name="" style="vertical-align: middle;">
                                <i class="fas fa-caret-right" style="font-size: 18px; vertical-align: middle; margin-left: 3px;"></i><span class="txt" style="vertical-align: middle;">Details from your passport </span>
                            </p>
                            <p class="txt">
                                <label style="margin-left: 60px;">Passport number </label>
                                <input type="text" name="" id="passportno" runat="server" style="width: 270px; margin-left: 60px;">
                            </p>
                            <p class="txt">
                                <label style="margin-left: 60px;">Country of passport </label>
                                <input type="text" name="" id="countryofpassport" runat="server" style="width: 270px; margin-left: 60px; margin-bottom: 5px;">
                            </p>
                            <p class="txt">
                                <label style="width: 100px; margin-left: 60px;">
                                    Date of issue  
                                </label>
                                <input type="text" name="" id="dateofissue" runat="server" style="width: 160px; margin-bottom: 5px;" placeholder="Day/ Month / YEAR ">
                            </p>
                            <p class="txt">
                                <label style="width: 100px; margin-left: 60px;">Date of expiry</label>
                                <input type="text" name="" id="dateofexpiry" runat="server" style="width: 160px;" placeholder="Day/ Month / YEAR ">
                            </p>


                            <p class="txt" style="margin-left: 60px;">Issuing authority/Place of issue as shown in passport</p>
                            <input type="text" name="" id="placeofissue" runat="server" style="width: 270px; margin-left: 60px;">
                            <input type="text" name="" style="width: 270px; margin-left: 60px;">
                            <p class="txt" style="margin-top: 10px;"><b class="num-ques">13</b> Where applicable, give your identification number  </p>
                            <p class="txt">
                                <input type="text" id="applicableidentificationno" runat="server" name="" style="width: 330px;">
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 50%; vertical-align: top; padding: 0 15px;">
                            <p class="txt" style="margin-top: 10px;"><b class="num-ques">14</b>If you have any other identity numbers required by your government, give details: </p>
                            <p class="txt">
                                <label style="width: 100px;">Type of number</label>
                                <input type="text" name="" id="anotherIdentitytype1" runat="server" style="width: 240px;">
                            </p>
                            <p class="txt">
                                <label style="width: 100px;">Your number </label>
                                <input type="text" name="" id="anotherIdentityNo1" runat="server" style="width: 240px; margin-bottom: 5px;">
                            </p>
                            <p class="txt">
                                <label style="width: 100px;">Type of number</label>
                                <input type="text" name="" id="anotherIdentitytype2" runat="server" style="width: 240px;">
                            </p>
                            <p class="txt">
                                <label style="width: 100px;">Your number </label>
                                <input type="text" name="" id="anotherIdentityNo2" runat="server" style="width: 240px;">
                            </p>
                            <p class="txt" style="margin-top: 10px;"><b class="num-ques">15</b> Your country of usual residence </p>
                            <p class="txt">
                                <input type="text" name="" id="residencecountry" runat="server" style="width: 100%;">
                            </p>
                            <p class="txt" style="margin-top: 10px;"><b class="num-ques">16</b> Your residential address in your home country</p>
                            <p class="txt"><strong>Note:</strong> A post office box address is not acceptable as a residential address. Failure to give a residential address will result in your Citizenship(s) application being invalid.  </p>
                            <p class="txt">
                                <input type="text" id="residenceaddressLine1" runat="server" name="" style="width: 340px;">
                            </p>
                            <p class="txt">
                                <input type="text" id="residenceaddressLine2" runat="server" name="" style="width: 340px;">
                            </p>
                            <p class="txt">
                                <input type="text" id="residenceaddresspostalcode" runat="server" name="" style="width: 340px;">
                            </p>
                            <p class="txt" style="margin-top: 10px;"><b class="num-ques">17</b>Your telephone numbers outside Australia </p>
                            <p class="txt">
                                <label style="width: 100px;">Office hours  </label>
                                <input type="text" id="officehoursContactNoOutsideaustralia" runat="server" name="" style="width: 240px; font-size: 12px" placeholder="(COUNTRY CODE) (AREA CODE) NUMBER ">
                            </p>
                            <p class="txt">
                                <label style="width: 100px;">After hours </label>
                                <input type="text" id="afterhoursContactNoOutsideaustralia" runat="server" name="" style="width: 240px;" placeholder="(             ) (             )">
                            </p>
                            <p class="txt" style="margin-top: 10px;"><b class="num-ques">18</b> Your residential address in Australia (if known)</p>
                            <p class="txt">
                                <input type="text" id="australiaresidentialaddline1" runat="server" name="" style="width: 340px;">
                            </p>
                            <p class="txt">
                                <input type="text" id="australiaresidentialaddline2" runat="server" name="" style="width: 340px;">
                            </p>
                            <p class="txt">
                                <input type="text" id="australiaresidentialpostalcode" runat="server" name="" style="width: 340px;" placeholder="POSTCODE ">
                            </p>
                            <p class="txt" style="margin-top: 10px;"><b class="num-ques">19</b>Your telephone numbers outside Australia </p>
                            <p class="txt">
                                <label style="width: 100px;">Office hours  </label>
                                <input type="text" id="officehrContactNoInAustralia" runat="server" name="" style="width: 240px;" placeholder="(AREA CODE              ) ">
                            </p>
                            <p class="txt">
                                <label style="width: 100px;">After hours </label>
                                <input type="text" id="afterhrContactNoInAustralia" runat="server" name="" style="width: 240px;" placeholder="( AREA CODE             )">
                            </p>
                            <p class="txt" style="margin-top: 10px;"><b class="num-ques">20</b> Address for correspondence    </p>
                            <p class="txt">
                                <input type="text" id="correspondenceaddressline1" runat="server" name="" style="width: 340px;">
                            </p>
                            <p class="txt">
                                <input type="text" id="correspondenceaddressline2" runat="server" name="" style="width: 340px;">
                            </p>
                            <p class="txt">
                                <input type="text" id="correspondenceaddresspoastalcode" runat="server" name="" style="width: 340px;" placeholder="POSTCODE ">
                            </p>
                            <p class="txt" style="margin-top: 10px;"><b class="num-ques">21</b> Do you agree to the department communicating with you by fax, e-mail or other electronic means?  </p>
                            <p class="txt">
                                <label style="width: 30px;">No</label>
                                <input type="checkbox" id="chkagreetocommunicateNo" runat="server" name="" style="vertical-align: middle;">
                                <br>
                                <label style="width: 30px;">Yes</label>
                                <input type="checkbox" name="" id="chkagreetocommunicateYes" runat="server" style="vertical-align: middle;">
                                <i class="fas fa-caret-right" style="font-size: 18px; vertical-align: middle; margin-left: 3px;"></i><span class="txt" style="vertical-align: middle;">Give details</span>
                            </p>
                            <p class="txt">
                                <label style="width: 100px;">Fax number </label>
                                <input type="text" id="faxno" runat="server" name="" style="width: 240px; font-size: 12px" placeholder="(COUNTRY CODE) (AREA CODE) NUMBER ">
                            </p>
                            <p class="txt">
                                <label style="width: 100px;">E-mail address </label>
                                <input type="text" id="emailaddress" runat="server" name="" style="width: 240px;">
                            </p>
                            <p class="txt">
                                <strong>Note:</strong> If this visa application is refused, you will be notified by mail 
                            </p>

                        </td>
                        <td style="width: 50%; vertical-align: top; padding: 0 15px 0 30px;">
                            <h6 class="part-sub"><i>About your family</i></h6>
                            <p class="txt"><b class="num-ques">22</b>Give details of all members of your family unit whether or not they intend to accompany you to Australia.</p>
                            <p><em>Members of the family unit are your spouse (including a de facto spouse) and any unmarried dependent children of you or your spouse who have not yet turned 18 years of age.</em> </p>
                            <p class="txt">
                                <label style="width: 80px;">Family name </label>
                                <input type="text" id="aboutfamilyname1" runat="server" name="" style="width: 240px; margin-bottom: 5px;">
                            </p>
                            <p class="txt">
                                <label style="width: 80px;">Given names </label>
                                <input type="text" id="aboutfamilygivenname1" runat="server" name="" style="width: 240px;">
                            </p>
                            <p class="txt">
                                <label style="width: 80px;"></label>
                                <input type="text" style="width: 240px; margin-bottom: 5px;">
                            </p>
                            <p class="txt">
                                <label style="width: 80px;">Relationship to you </label>
                                <input type="text" id="relationshiptoyou1" runat="server" name="" style="width: 240px; margin-bottom: 5px;">
                            </p>
                            <p class="txt">
                                <label style="width: 80px;">Citizenship(s)  </label>
                                <input type="text" id="citizenship1" runat="server" name="" style="width: 240px; margin-bottom: 5px;">
                            </p>
                            <p class="txt">
                                <label style="width: 80px;">Date of Birth </label>
                                <input type="text" id="dobfamilymember1" runat="server" name="" style="width: 240px;" placeholder="Day/ Month / YEAR ">
                            </p>
                            <p class="txt">Is this person included in this application?   </p>
                            <p class="txt">
                                <label style="width: 30px;">No</label>
                                <input type="checkbox" id="chkfamily1No" runat="server" name="" style="vertical-align: middle;">
                                <br>
                                <label style="width: 30px;">Yes</label>
                                <input type="checkbox" id="chkfamily1Yes" runat="server" name="" style="vertical-align: middle;">
                                <i class="fas fa-caret-right" style="font-size: 18px; vertical-align: middle; margin-left: 3px;"></i><span class="txt" style="vertical-align: middle;">Details from passport </span>
                            </p>
                            <p class="txt">
                                <label style="margin-left: 60px;">Passport number </label>
                                <input type="text" id="familypassportno1" runat="server" name="" style="width: 270px; margin-left: 60px;">
                            </p>
                            <p class="txt">
                                <label style="margin-left: 60px;">Country of passport </label>
                                <input type="text" id="familycountryofpassport1" runat="server" name="" style="width: 270px; margin-left: 60px;">
                            </p>
                            <p class="txt">
                                <label style="width: 100px; margin-left: 60px;">Date of issue</label>
                                <input type="text" id="passportdateofissue1" runat="server" name="" style="width: 160px;" placeholder="Day/ Month / YEAR ">
                            </p>
                            <p class="txt">
                                <label style="width: 100px; margin-left: 60px;">Date of expiry</label>
                                <input type="text" id="passportdateofexpiry1" runat="server" name="" style="width: 160px;" placeholder="Day/ Month / YEAR ">
                            </p>
                            <p class="txt" style="margin-left: 60px;">
                                Issuing authority/Place of issue as shown in passport<br>
                                <input type="text" id="passportplaceofissue1" runat="server" name="" style="width: 270px; margin-left: 60px;">
                                <input type="text" name="" style="width: 270px; margin-left: 60px;">
                            </p>

                            <p class="txt">
                                <label style="width: 200px;">Does this person intend to study in Australia for more than 3 months? </label>
                                <label style="width: 20px; margin-left: 20px;">No</label>
                                <input type="checkbox" id="chkFamilyStudy1No" runat="server" name="" style="margin-right: 15px; vertical-align: middle;">
                                <label style="width: 25px;">Yes</label>
                                <input type="checkbox" id="chkFamilyStudy1Yes" runat="server" name="" style="vertical-align: middle;">
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 50%; vertical-align: top; padding: 0 15px;">
                            <p class="txt" style="margin-top: 10px;">
                                <label style="width: 100px;">2 Family name</label>
                                <input type="text" id="aboutfamilyname2" runat="server" name="" style="width: 240px; margin-bottom: 5px;">
                            </p>
                            <p class="txt">
                                <label style="width: 100px;">Given names</label>
                                <input type="text" id="aboutfamilygivenname2" runat="server" name="" style="width: 240px;">
                            </p>
                            <p class="txt">
                                <label style="width: 100px;"></label>
                                <input type="text" name="" style="width: 240px;">
                            </p>
                            <p class="txt" style="margin-top: 10px;">
                                <label style="width: 100px;">Relationship to you</label>
                                <input type="text" id="relationshiptoyou2" runat="server" name="" style="width: 240px; margin-bottom: 5px;">
                            </p>
                            <p class="txt">
                                <label style="width: 100px;">Citizenship(s)</label>
                                <input type="text" id="citizenship2" runat="server" name="" style="width: 240px; margin-bottom: 5px;">
                            </p>
                            <p class="txt">
                                <label style="width: 100px;">Date of birth</label>
                                <input type="text" id="dobfamilymember2" runat="server" name="" style="width: 160px;" placeholder="DAY / MONTH / YEAR ">
                            </p>
                            <p class="txt">Is this person included in this application?</p>
                            <p class="txt">
                                <label style="width: 30px;">No</label>
                                <input type="checkbox" id="chkfamily2No" runat="server" name="" style="vertical-align: middle;">
                                <br>
                                <label style="width: 30px;">Yes</label>
                                <input type="checkbox" id="chkfamily2Yes" runat="server" name="" style="vertical-align: middle;">
                                <i class="fas fa-caret-right" style="font-size: 18px; vertical-align: middle; margin-left: 3px;"></i><span class="txt" style="vertical-align: middle;">Details from passport </span>
                            </p>
                            <p class="txt" style="margin-bottom: 8px;">
                                <label style="margin-left: 60px;">Passport number </label>
                                <input type="text" name="" id="familypassportno2" runat="server" style="width: 270px; margin-left: 60px; margin-bottom: 5px;">
                            </p>
                            <p class="txt">
                                <label style="margin-left: 60px;">Country of passport </label>
                                <input type="text" name="" id="familycountryofpassport2" runat="server" style="width: 270px; margin-left: 60px;">
                            </p>
                            <p class="txt">
                                <label style="width: 100px; margin-left: 60px;">Date of issue </label>
                                <input type="text" name="" id="passportdateofissue2" runat="server" style="width: 160px;" placeholder="DAY / MONTH / YEAR ">
                            </p>
                            <p class="txt">
                                <label style="width: 100px; margin-left: 60px;">Date of expiry</label>
                                <input type="text" name="" id="passportdateofexpiry2" runat="server" style="width: 160px;" placeholder="DAY / MONTH / YEAR ">
                            </p>
                            <p class="txt" style="margin-left: 60px;">Issuing authority/Place of issue as shown in passport</p>
                            <input type="text" name="" id="passportplaceofissue2" runat="server" style="width: 270px; margin-left: 60px;">
                            <input type="text" name="" style="width: 270px; margin-left: 60px;">
                            <hr style="border-color: #000">
                            <p class="txt">
                                <label style="width: 200px; margin-top: 20px;">Does this person intend to study in Australia for more than 3 months? </label>
                                <label style="width: 20px; margin-left: 20px;">No</label>
                                <input type="checkbox" id="chkFamilyStudy2No" runat="server" name="" style="margin-right: 15px; vertical-align: middle;">
                                <label style="width: 25px;">Yes</label>
                                <input type="checkbox" id="chkFamilyStudy2Yes" runat="server" name="" style="vertical-align: middle;">
                            </p>
                            <p class="txt" style="margin-top: 10px;">
                                <label style="width: 100px;">3 Family name</label>
                                <input type="text" id="aboutfamilyname3" runat="server" name="" style="width: 240px;">
                            </p>
                            <p class="txt">
                                <label style="width: 100px;">Given names</label>
                                <input type="text" id="aboutfamilygivenname3" runat="server" name="" style="width: 240px;">
                            </p>
                            <p class="txt">
                                <label style="width: 100px;"></label>
                                <input type="text" name="" style="width: 240px;">
                            </p>
                            <p class="txt" style="margin-top: 10px;">
                                <label style="width: 100px;">Relationship to you</label>
                                <input type="text" id="relationshiptoyou3" runat="server" name="" style="width: 240px;">
                            </p>
                            <p class="txt">
                                <label style="width: 100px;">Citizenship(s)</label>
                                <input type="text" id="citizenship3" runat="server" name="" style="width: 240px;">
                            </p>
                            <p class="txt">
                                <label style="width: 100px;">Date of birth</label>
                                <input type="text" id="dobfamilymember3" runat="server" name="" style="width: 160px;" placeholder="DAY / MONTH / YEAR ">
                            </p>
                            <p class="txt">Is this person included in this application?   </p>
                            <p class="txt">
                                <label style="width: 30px;">No</label>
                                <input type="checkbox" id="chkfamily3No" runat="server" name="" style="vertical-align: middle;">
                                <br>
                                <label style="width: 30px;">Yes</label>
                                <input type="checkbox" id="chkfamily3Yes" runat="server" name="" style="vertical-align: middle;">
                                <i class="fas fa-caret-right" style="font-size: 18px; vertical-align: middle; margin-left: 3px;"></i><span class="txt" style="vertical-align: middle;">Details from passport </span>
                            </p>
                            <p class="txt">
                                <label style="margin-left: 60px;">Passport number </label>
                                <input type="text" id="familypassportno3" runat="server" name="" style="width: 270px; margin-left: 60px;">
                            </p>
                            <p class="txt">
                                <label style="margin-left: 60px;">Country of passport </label>
                                <input type="text" id="familycountryofpassport3" runat="server" name="" style="width: 270px; margin-left: 60px;">
                            </p>
                            <p class="txt">
                                <label style="width: 100px; margin-left: 60px;">Date of issue </label>
                                <input type="text" id="passportdateofissue3" runat="server" name="" style="width: 160px;" placeholder="DAY / MONTH / YEAR ">
                            </p>
                            <p class="txt">
                                <label style="width: 100px; margin-left: 60px;">Date of expiry</label>
                                <input type="text" id="passportdateofexpiry3" runat="server" name="" style="width: 160px;" placeholder="DAY / MONTH / YEAR ">
                            </p>
                            <p class="txt" style="margin-left: 60px;">Issuing authority/Place of issue as shown in passport</p>
                            <input type="text" name="" id="passportplaceofissue3" runat="server" style="width: 270px; margin-left: 60px;">
                            <input type="text" name="" style="width: 270px; margin-left: 60px;">
                            <p class="txt" style="">
                                <label style="width: 200px; margin-top: 20px;">Does this person intend to study in Australia for more than 3 months? </label>
                                <label style="width: 20px; margin-left: 20px;">No</label>
                                <input type="checkbox" id="chkFamilyStudy3No" runat="server" name="" style="margin-right: 15px; vertical-align: middle;">
                                <label style="width: 25px;">Yes</label>
                                <input type="checkbox" id="chkFamilyStudy3Yes" runat="server" name="" style="vertical-align: middle;">
                            </p>
                        </td>
                        <td style="width: 50%; vertical-align: top; padding: 0 15px 0 30px;">
                            <h6 class="part-sub"><i>Dependants under 18 year of age</i></h6>
                            <p class="txt" style="margin-top: 10px;"><b class="num-ques">23</b>Have any school age dependants (that is, those who have turned 5 but who have not yet turned 18 years of age) included in this application been enrolled in a school in Australia?  </p>
                            <p class="txt">
                                <label style="width: 30px;">No</label>
                                <input type="checkbox" id="chkEnrollNo" runat="server" name="" style="vertical-align: middle;">
                                <br>
                                <label style="width: 30px;">Yes</label>
                                <input type="checkbox" id="chkEnrolYes" runat="server" name="" style="vertical-align: middle;">
                                <i class="fas fa-caret-right" style="font-size: 18px; vertical-align: middle; margin-left: 3px;"></i><span class="txt" style="vertical-align: middle;">You<strong> must</strong> provide evidence (eg. enrolment advice, offer letter) </span>
                            </p>


                            <p class="txt" style="margin-top: 10px;"><b class="num-ques">24</b>Do you have the sole legal right to determine where any dependants under 18 years of age who are included in this application will live or to remove each such dependant from their country of usual residence?   </p>
                            <p class="txt">
                                <label style="width: 30px;">No</label>
                                <input type="checkbox" id="chkSoleRightNo" runat="server" name="" style="vertical-align: middle;">
                                <i class="fas fa-caret-right" style="font-size: 18px; vertical-align: middle; margin-left: 3px;"></i><span class="txt" style="vertical-align: middle;">Give details below </span>
                            </p>
                            <br>
                                <p class="txt">
                                    <label style="width: 30px;">Yes</label>
                                    <input type="checkbox" id="chkSoleRightYes" runat="server" name="" style="vertical-align: middle;">
                                    <i class="fas fa-caret-right" style="font-size: 18px; vertical-align: middle; margin-left: 3px;"></i><span class="txt" style="vertical-align: middle;">Go to Question 25 </span>
                                </p>
                                <p class="txt">Give details of ALL other people not included in this application who have custody, access or guardianship rights in relation to the dependant(s).</p>
                                <br>
                                    <em>Attach a statutory declaration from each of these people giving permission for the dependant to accompany you to Australia. </em></p>
							<hr style="border-color: #000">
                                    <p class="txt" style="margin-top: 10px;">
                                        <label style="width: 80px;">Family name</label>
                                        <input type="text" id="guardiansfamilyname" runat="server" name="" style="width: 240px; margin-bottom: 5px;">
                                    </p>
                                    <p class="txt">
                                        <label style="width: 80px;">Given names</label>
                                        <input type="text" id="guardiansgivenname" runat="server" name="" style="width: 240px; margin-bottom: 5px;">
                                    </p>

                                    <p class="txt">
                                        <label style="width: 80px; margin-top: 10px;">Residential</label>
                                        <input type="text" id="guardiansresidentialaddress" runat="server" name="" style="width: 240px;">
                                    </p>

                                    <p class="txt">
                                        <label style="width: 80px;">address</label>
                                        <input type="text" name="" style="width: 240px;">
                                    </p>
                                    <p class="txt">
                                        <label style="width: 80px;"></label>
                                        <input type="text" id="guardianspostalcode" runat="server" name="" placeholder="POSTAL CODE" style="width: 240px; margin-bottom: 5px;">
                                    </p>
                                </br>
                                <p class="txt">
                                    <label style="width: 80px;">Telephone </label>
                                    <input type="text" name="" id="guardianscontactnumber" runat="server" style="width: 240px; font-size: 12px; margin-bottom: 5px;" placeholder="(COUNTRY CODE) (AREA CODE) NUMBER ">
                                </p>
                                <p class="txt">
                                    <label style="width: 80px;">Relationship to dependant</label>
                                    <input type="text" name="" id="guardiansrealtionwithstudent" runat="server" style="width: 240px; margin-bottom: 5px;">
                                </p>
                                <p class="txt">
                                    <label style="width: 80px;">Nature of legal right </label>
                                    <input type="text" name="" id="guardiansnatureoflegalrights" runat="server" style="width: 240px; margin-bottom: 5px;">
                                </p>
                                <p class="txt" style="border-bottom: 1px solid #000; padding-bottom: 10px;">
                                    <label style="width: 230px;">Statutory declaration attached? </label>
                                    <label style="width: 20px;">No</label>
                                    <input type="checkbox" id="chkstatutory1No" runat="server" name="" style="margin-right: 8px; vertical-align: middle;">
                                    <label style="width: 25px;">Yes</label>
                                    <input type="checkbox" id="chkstatutory1Yes" runat="server" name="" style="margin-right: 0px; vertical-align: middle;">
                                </p>
                                <p class="txt" style="margin-top: 10px;">
                                    <label style="width: 80px;">Family name</label>
                                    <input type="text" id="guardiansfamilyname1" runat="server" name="" style="width: 240px;">
                                </p>
                                <p class="txt">
                                    <label style="width: 80px;">Given names</label>
                                    <input type="text" id="guardiansgivenname1" runat="server" name="" style="width: 240px;">
                                </p>

                                <p class="txt" style="margin-top: 10px;">
                                    <label style="width: 80px; margin-top: 10px;">Residantial </label>
                                    <input type="text" id="guardiansresidentialaddress1" runat="server" name="" style="width: 240px;">
                                </p>

                                <p class="txt">
                                    <label style="width: 80px;">address</label>
                                    <input type="text" name="" style="width: 240px;">
                                </p>
                                <p class="txt">
                                    <label style="width: 80px;"></label>
                                    <input type="text" id="guardianspostalcode1" runat="server" name="" placeholder="POSTAL CODE" style="width: 240px; margin-bottom: 5px;">
                                </p>
                            </br>
                            <p class="txt" style="margin-top: 20px;">
                                <label style="width: 80px;">Telephone </label>
                                <input type="text" id="guardianscontactnumber1" runat="server" name="" style="width: 240px; font-size: 12px" placeholder="(COUNTRY CODE) (AREA CODE) NUMBER ">
                            </p>
                            <p class="txt">
                                <label style="width: 80px;">Relationship to dependant</label>
                                <input type="text" id="guardiansrealtionwithstudent1" runat="server" name="" style="width: 240px;">
                            </p>
                            <p class="txt" style="margin-bottom: 8px;">
                                <label style="width: 80px;">Nature of legal right </label>
                                <input type="text" id="guardiansnatureoflegalrights1" runat="server" name="" style="width: 240px;">
                            </p>

                            <p class="txt">
                                <label style="width: 230px;">Statutory declaration attached? </label>
                                <label style="width: 20px;">No</label>
                                <input type="checkbox" id="chkstatutory2No" runat="server" name="" style="margin-right: 8px; vertical-align: middle;">
                                <label style="width: 25px;">Yes</label>
                                <input type="checkbox" id="chkstatutory2Yes" runat="server" name="" style="margin-right: 0px; vertical-align: middle;">
                            </p>

                            <p class="txt" style="margin-top: 10px;"><b class="num-ques">25</b>Are any of your dependants who are under 18 years of age, and who are included in this application, the subject of a court order giving you:  </p>
                            <ul style="padding-left: 0px; font-size: 12px;">
                                <li>the sole legal right to determine where they will live; or </li>
                                <li>the right to remove them from their country of usual residence? </li>
                            </ul>
                            <p class="txt">
                                <label style="width: 30px;">No</label>
                                <input type="checkbox" id="chkcourtorderNo" runat="server" name="" style="vertical-align: middle;">
                            </p>
                            <p class="txt">
                                <label style="width: 30px;">Yes</label>
                                <input type="checkbox" id="chkcourtorderYes" runat="server" name="" style="vertical-align: middle;">
                                <i class="fas fa-caret-right" style="font-size: 18px; vertical-align: middle; margin-left: 3px;"></i><span class="txt" style="vertical-align: middle;">Attach a certified copy of the court order(s)</span>
                            </p>
                        </td>
                    </tr>

                    <tr>
                        <td style="width: 50%; vertical-align: top; padding: 0 15px;">
                            <h3 class="part-sub"><i>Previous visa applications </i></h3>
                            <p class="txt"><strong>Warning</strong> — In general, a person can only hold one visa at a time. If you are granted a visa while you already have another, the first visa will cease automatically when the new visa is granted. </p>
                            <p class="txt" style="">
                                <label style="width: 200px; margin-top: 20px;">
                                    <b class="num-ques">26</b>Have you or any other person included  in this application previously applied 
	 							for any type of Australian visa?
                                </label>
                                <label style="width: 20px; margin-left: 20px;">No</label>
                                <input type="checkbox" id="chkappliesNo" runat="server" name="" style="margin-right: 15px; vertical-align: middle;">
                                <label style="width: 25px;">Yes</label>
                                <input type="checkbox" id="chkappliesYes" runat="server" name="" style="vertical-align: middle;">
                            </p>
                            <p class="txt" style="">
                                <label style="width: 200px; margin-top: 20px;">Do you currently hold a visa?</label>
                                <label style="width: 20px; margin-left: 20px;">No</label>
                                <input type="checkbox" id="chkHoldNo" runat="server" name="" style="margin-right: 15px; vertical-align: middle;">
                                <label style="width: 25px;">Yes</label>
                                <input type="checkbox" id="chkHoldYes" runat="server" name="" style="vertical-align: middle;">
                            </p>
                            <p class="txt" style="">
                                <label style="width: 200px; margin-top: 20px;">Are you currently awaiting a decision on another visa application? </label>
                                <label style="width: 20px; margin-left: 20px;">No</label>
                                <input type="checkbox" name="" id="chkAwaitingNo" runat="server" style="margin-right: 15px; vertical-align: middle;">
                                <label style="width: 25px;">Yes</label>
                                <input type="checkbox" name="" id="chkAwaitingYes" runat="server" style="vertical-align: middle;">
                            </p>
                            <p class="txt">If you answered <strong>‘Yes’</strong> to any of the above questions, give details below </p>
                            <p class="txt" style="margin-top: 10px;">
                                <label style="width: 100px;">Name</label>
                                <input type="text" id="nameonvisa" runat="server" name="" style="width: 240px;">
                            </p>
                            <p class="txt" style="margin-top: 10px;">
                                <label style="width: 100px;">Type of visa </label>
                                <input type="text" id="typeofvisa" runat="server" name="" style="width: 240px;">
                            </p>
                            <p class="txt" style="margin-top: 10px;">
                                <label style="width: 100px;">Place of issue </label>
                                <input type="text" id="placeofissuevisa" runat="server" name="" style="width: 240px; margin-bottom: 5px;">
                            </p>
                            <p class="txt">
                                <label style="width: 100px;">Date of issue</label>
                                <input type="text" name="" id="dateissuevisa" runat="server" style="width: 160px;" placeholder="DAY / MONTH / YEAR ">
                            </p>
                            <p class="txt" style="margin-top: 10px;">
                                <label style="width: 100px;">Application </label>
                                <label style="width: 55px;">Refused </label>
                                <input type="checkbox" id="chkvisa1refused" runat="server" name="" style="vertical-align: middle;">
                            </p>
                            <p class="txt">
                                <label style="width: 56px; margin-left: 102px;">Granted </label>
                                <input type="checkbox" id="chkvisa1granted" runat="server" name="" style="vertical-align: middle;">
                                <i class="fas fa-caret-right" style="font-size: 18px; vertical-align: middle; margin-left: 3px;"></i>
                                <span class="txt" style="vertical-align: middle;">Visa label number</span>
                            </p>
                            </p>

				              <p class="txt" style="margin-top: 10px;">
                                  <label style="width: 100px;"></label>
                                  <input type="text" id="grantedvisalabelno" runat="server" name="" style="width: 240px;" placeholder="V">
                              </p>
                            <p class="txt" style="margin-left: 100px; width: 240px;">If granted a visa without a label, provide the 13-digit visa grant number (as shown on the letter notifying you of Highest qualification visa grant). </p>
                            <p class="txt" style="margin-top: 10px;">
                                <label style="width: 100px;"></label>
                                <input type="text" id="visagrantnumber" runat="server" name="" style="width: 240px;" placeholder="V">
                            </p>
                            <hr style="border-color: #000">
                            <p class="txt" style="margin-top: 10px;">
                                <label style="width: 100px;">Name</label>
                                <input type="text" id="nameonvisa1" runat="server" name="" style="width: 240px;">
                            </p>
                            <p class="txt" style="margin-top: 10px;">
                                <label style="width: 100px;">Type of visa </label>
                                <input type="text" id="typeofvisa1" runat="server" name="" style="width: 240px;">
                            </p>
                            <p class="txt" style="margin-top: 10px;">
                                <label style="width: 100px;">Place of issue </label>
                                <input type="text" id="placeofissuevisa1" runat="server" name="" style="width: 240px; margin-bottom: 5px;">
                            </p>
                            <p class="txt">
                                <label style="width: 100px;">Date of issue</label>
                                <input type="text" id="dateissuevisa1" runat="server" name="" style="width: 160px;" placeholder="DAY / MONTH / YEAR ">
                            </p>
                            <p class="txt" style="margin-top: 10px;">
                                <label style="width: 100px;">Application </label>
                                <label style="width: 55px;">Refused </label>
                                <input type="checkbox" id="chkvisa2refused" runat="server" name="" style="vertical-align: middle;">
                            </p>
                            <p class="txt">
                                <label style="width: 56px; margin-left: 102px;">Granted </label>
                                <input type="checkbox" id="chkvisa2granted" runat="server" name="" style="vertical-align: middle;">
                                <i class="fas fa-caret-right" style="font-size: 18px; vertical-align: middle; margin-left: 3px;"></i>
                                <span class="txt" style="vertical-align: middle;">Visa label number</span>
                            </p>
                            <p class="txt" style="margin-top: 10px;">
                                <label style="width: 100px;"></label>
                                <input type="text" id="grantedvisalabelno1" runat="server" name="" style="width: 240px;" placeholder="V">
                            </p>
                            <p class="txt" style="margin-left: 100px; width: 240px;">If granted a visa without a label, provide the 13-digit visa grant number (as shown on the letter notifying you of Highest qualification visa grant). </p>
                            <p class="txt" style="margin-top: 10px;">
                                <label style="width: 100px;"></label>
                                <input type="text" id="visagrantnumber1" runat="server" name="" style="width: 240px;" placeholder="V">
                            </p>
                            <p class="txt" style="margin-top: 10px;">
                                <label><b class="num-ques">27</b>If you are applying:   </label>
                                <br>
                                <label style="width: 230px;">as a member of the family unit of a student  </label>
                                <input type="checkbox" id="chkPartC" runat="server" name="" style="vertical-align: middle;">
                                <i class="fas fa-caret-right" style="font-size: 18px; vertical-align: middle; margin-left: 3px;"></i>
                                <span class="txt" style="vertical-align: middle;">Go to Part C </span>
                            </p>
                            <p class="txt">
                                <label style="width: 220px; text-align: right; margin-right: 10px;">in all other cases </label>
                                <input type="checkbox" id="chkPartB" runat="server" name="" style="vertical-align: middle;">
                                <i class="fas fa-caret-right" style="font-size: 18px; vertical-align: middle; margin-left: 3px;"></i>
                                <span class="txt" style="vertical-align: middle;">Go to Part B</span>
                            </p>
                        </td>

                        <td style="width: 50%; vertical-align: top; padding: 0 15px 0 30px;">
                            <h3 class="part"><i>Part B – To be completed by the student</i></h3>
                            <p class="txt" style="margin-top: 10px;"><b class="num-ques">28</b> Are you applying in Australia?  </p>
                            <p class="txt">
                                <label style="width: 30px;">No</label>
                                <input type="checkbox" id="chkapplyingNo" runat="server" name="" style="vertical-align: middle;">
                                <i class="fas fa-caret-right" style="font-size: 18px; vertical-align: middle; margin-left: 3px;"></i><span class="txt" style="vertical-align: middle;">Go to Question 30  </span>
                                <br>
                                <label style="width: 30px;">Yes</label>
                                <input type="checkbox" id="chkapplyingYes" runat="server" name="" style="vertical-align: middle;">
                                <br>
                            </p>
                            <p class="txt" style="margin-top: 10px;"><b class="num-ques">29</b>Do you currently hold a student visa?   </p>
                            <p class="txt">
                                <label style="width: 30px;">No</label>
                                <input type="checkbox" id="chkcurrentlyholdNo" runat="server" name="" style="vertical-align: middle;">
                                <i class="fas fa-caret-right" style="font-size: 18px; vertical-align: middle; margin-left: 3px;"></i><span class="txt" style="vertical-align: middle;">If you are in Assessment Level 2, 3, 4 or 5 you will be 
									required at Question 43 to provide exceptional reasons why you should be granted a student visa in Australia.</span>
                                <br>
                                <label style="width: 30px;">Yes</label>
                                <input type="checkbox" id="chkcurrentlyholdYes" runat="server" name="" style="vertical-align: middle;">
                                <br>
                            </p>
                            <p class="txt" style="margin-top: 10px;"><b class="num-ques">30</b>Provide details of your highest qualification obtained outside Australia, as well as all other studies and training obtained outside Australia  </p>
                            <p class="txt" style="margin-top: 10px;">You <strong>must</strong> provide<strong> evidence </strong>of your study and training, including academic records, if you are: </p>
                            <ul style="padding-left: 15px; font-size: 12px;">
                                <li>in Assessment Level 3, 4 or 5; or </li>
                                <li>in Assessment Level 2 seeking to undertake studies in the postgraduate research sector.</li>
                            </ul>
                            <p class="txt" style="margin-top: 10px;">All other applicants may be requested to provide evidence where considered necessary. Granted Visa label number </p>
                            <p class="txt" style="margin-top: 10px; border-bottom: 1px solid #000; padding-bottom: 10px;">In certain limited circumstances, you may be requested to provide copies of any published works written by you. </p>
                            <p class="txt" style="margin-top: 10px;">Highest qualification  </p>
                            <p class="txt">
                                <input type="text" id="highestqualification" runat="server" name="" style="width: 330px;">
                            </p>
                            <p class="txt" style="margin-top: 10px;">Name of education provider or training body </p>
                            <p class="txt">
                                <input type="text" id="nameofeducationprovider1" runat="server" name="" style="width: 330px;">
                                <input type="text" id="nameofeducationprovider2" runat="server" name="" style="width: 330px;">
                            </p>
                            <p class="txt" style="margin-top: 10px;">Address of education provider or training body </p>
                            <p class="txt">
                                <input type="text" id="addressofeducationprovider" runat="server" name="" style="width: 330px;">
                                <input type="text" name="" style="width: 330px;">
                                <input type="text" id="educationproviderpostalcode" runat="server" name="" style="width: 330px;" placeholder="PINCODE">
                            </p>
                            <p class="txt" style="margin-top: 10px;">
                                <label style="width: 130px;">Commencement Date</label>
                                <input type="text" id="commencementdate" runat="server" name="" style="width: 160px;" placeholder="DAY / MONTH / YEAR ">
                            </p>

                            <p class="txt" style="margin-top: 10px;">
                                <label style="width: 130px;">Finish  Date</label>
                                <input type="text" id="finishdate" runat="server" name="" style="width: 160px;" placeholder="DAY / MONTH / YEAR ">
                            </p>

                            <p class="txt">
                                <label style="width: 230px;">Documentation attached?  </label>
                                <label style="width: 20px;">No</label>
                                <input type="checkbox" id="chkeducationdocumentattachedNo" runat="server" name="" style="margin-right: 8px; vertical-align: middle;">
                                <label style="width: 25px;">Yes</label>
                                <input type="checkbox" id="chkeducationdocumentattachedYes" runat="server" name="" style="margin-right: 0px; vertical-align: middle;">
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 50%; vertical-align: top; padding: 0 15px;">
                            <p class="txt" style="margin-top: 10px;">Other course undertaken outside Australia</p>
                            <p class="txt">
                                <input type="text" id="otherundertakcoursename1" runat="server" name="" style="width: 330px;">
                            </p>
                            <p class="txt" style="margin-top: 10px;">Name of education provider or training body </p>
                            <p class="txt">
                                <input type="text" id="othernameofeducationprovider1" runat="server" name="" style="width: 330px;">
                                <input type="text" id="othernameofeducationprovider2" runat="server" name="" style="width: 330px;">
                            </p>
                            <p class="txt" style="margin-top: 10px;">Address of education provider or training body </p>
                            <p class="txt">
                                <input type="text" id="otheraddressofeducationprovider1" runat="server" name="" style="width: 330px;">
                                <input type="text" name="" style="width: 330px;">
                                <input type="text" id="othereduproviderpostalcode1" runat="server" name="" style="width: 330px;" placeholder="PINCODE">
                            </p>
                            <p class="txt" style="margin-top: 10px;">
                                <label style="width: 130px;">Commencement Date</label>
                                <input type="text" name="" id="othercommencementdate1" runat="server" style="width: 160px;" placeholder="DAY / MONTH / YEAR ">
                            </p>
                            <p class="txt" style="margin-top: 10px;">
                                <label style="width: 130px;">Finish  Date</label>
                                <input type="text" name="" id="otherfinishdate1" runat="server" style="width: 160px;" placeholder="DAY / MONTH / YEAR ">
                            </p>
                            <p class="txt" style="margin-top: 10px; border-bottom: 1px solid #000; padding-bottom: 10px;">
                                <label style="width: 230px;">Documentation attached?  </label>
                                <label style="width: 20px;">No</label>
                                <input type="checkbox" id="chkotherdocumentattached1No" runat="server" name="" style="margin-right: 8px; vertical-align: middle;">
                                <label style="width: 25px;">Yes</label>
                                <input type="checkbox" id="chkotherdocumentattached1Yes" runat="server" name="" style="margin-right: 0px; vertical-align: middle;">
                            </p>
                            <p class="txt" style="margin-top: 10px;">Other course undertaken outside Australia  </p>
                            <p class="txt">
                                <input type="text" id="otherundertakcoursename2" runat="server" name="" style="width: 330px;">
                            </p>
                            <p class="txt" style="margin-top: 10px;">Name of education provider or training body</p>
                            <p class="txt">
                                <input type="text" id="othernameofeducationprovider21" runat="server" name="" style="width: 330px;">
                                <input type="text" id="othernameofeducationprovider22" runat="server" name="" style="width: 330px;">
                            </p>
                            <p class="txt" style="margin-top: 10px;">Address of education provider or training body </p>
                            <p class="txt">
                                <input type="text" id="otheraddressofeducationprovider2" runat="server" name="" style="width: 330px;">
                                <input type="text" name="" style="width: 330px;">
                                <input type="text" id="othereduproviderpostalcode2" runat="server" name="" style="width: 330px;" placeholder="PINCODE">
                            </p>
                            <p class="txt" style="margin-top: 10px;">
                                <label style="width: 130px;">Commencement Date</label>
                                <input type="text" id="othercommencementdate2" runat="server" name="" style="width: 160px;" placeholder="DAY / MONTH / YEAR ">
                            </p>

                            <p class="txt" style="margin-top: 10px;">
                                <label style="width: 130px;">Finish  Date</label>
                                <input type="text" id="otherfinishdate2" runat="server" name="" style="width: 160px;" placeholder="DAY / MONTH / YEAR ">
                            </p>

                            <p class="txt">
                                <label style="width: 230px;">Documentation attached?  </label>
                                <label style="width: 20px;">No</label>
                                <input type="checkbox" id="chkotherdocumentattached2No" runat="server" name="" style="margin-right: 8px; vertical-align: middle;">
                                <label style="width: 25px;">Yes</label>
                                <input type="checkbox" id="chkotherdocumentattached2Yes" runat="server" name="" style="margin-right: 0px; vertical-align: middle;">
                            </p>
                            <p class="txt"><b class="num-ques">31</b> Have you previously studied in Australia?   </p>
                            <p class="txt">
                                <label style="width: 30px;">No</label>
                                <input type="checkbox" id="chkispreviouslyNo" runat="server" name="" style="vertical-align: middle;">
                                <br>
                                <label style="width: 30px;">Yes</label>
                                <input type="checkbox" id="chkispreviouslyYes" runat="server" name="" style="vertical-align: middle;">
                                <i class="fas fa-caret-right" style="font-size: 18px; vertical-align: middle; margin-left: 3px;"></i><span class="txt" style="vertical-align: middle;">Give details below </span>
                            </p>
                            <p class="txt" style="margin-left: 60px; padding-bottom: 10px; border-bottom: 1px solid #000;">You <strong>must</strong> provide evidence of your studies and training, including academic records </p>
                            <p class="txt">
                                <label style="margin-left: 60px; margin-top: 10px;">Previous course in Australia  </label>
                                <input type="text" id="previouslycoursename" runat="server" name="" style="width: 270px; margin-left: 60px;">
                            </p>
                            <p class="txt">
                                <label style="margin-left: 60px; margin-top: 10px;">Name of education provider or training body  </label>
                                <input type="text" id="previouslycourseeducationproviderName" runat="server" name="" style="width: 270px; margin-left: 60px;">
                            </p>
                            <p class="txt" style="margin-left: 60px; margin-top: 10px;">Period of study </p>
                            <p class="txt">
                                <label style="width: 35px; margin-left: 60px;">From </label>
                                <input type="text" id="previouslycourseDateFrom" runat="server" name="" style="width: 101px; margin-right: 3px;" placeholder="MONTH / YEAR ">
                                <label style="width: 17px; margin-left: 0px;">to</label>
                                <input type="text" id="previouslycourseDateTo" runat="server" name="" style="width: 103px;" placeholder=" MONTH / YEAR ">
                            </p>
                        </td>
                        <td style="width: 50%; vertical-align: top; padding: 0 15px 0 30px;">
                            <p class="txt" style="margin-top: 10px;">Previous course in Australia   </p>
                            <p class="txt">
                                <input type="text" id="previouslycoursename1" runat="server" name="" style="width: 330px;">
                            </p>
                            <p class="txt" style="margin-top: 10px;">Name of education provider or training body</p>
                            <p class="txt">
                                <input type="text" id="previouslycourseeducationproviderName1" runat="server" name="" style="width: 330px;">
                                <input type="text" name="" style="width: 330px;">
                            </p>
                            <p class="txt" style="margin-top: 10px;">Period of study </p>
                            <p class="txt" style="padding-bottom: 10px; border-bottom: 1px solid #000;">
                                <label style="width: 35px; margin-top: 10px;">From</label>
                                <input type="text" name="" id="previouslycourseDateFrom1" runat="server" style="width: 101px; margin-right: 3px;" placeholder="MONTH / YEAR ">
                                <label style="width: 17px; margin-left: 0px;">to</label>
                                <input type="text" name="" id="previouslycourseDateTo1" runat="server" style="width: 103px;" placeholder=" MONTH / YEAR ">
                            </p>
                            <p class="txt" style="margin-top: 10px;">Previous course in Australia   </p>
                            <p class="txt">
                                <input type="text" name="" style="width: 330px;">
                            </p>
                            <p class="txt" style="margin-top: 10px;">Name of education provider or training body</p>
                            <p class="txt">
                                <input type="text" name="" style="width: 330px;">
                                <input type="text" name="" style="width: 330px;">
                            </p>
                            <p class="txt" style="margin-top: 10px;">Period of study </p>
                            <p class="txt">
                                <label style="width: 35px; margin-top: 10px;">From </label>
                                <input type="text" name="" style="width: 101px; margin-right: 3px;" placeholder="MONTH / YEAR ">
                                <label style="width: 17px; margin-left: 0px;">to</label>
                                <input type="text" name="" style="width: 103px;" placeholder=" MONTH / YEAR ">
                            </p>
                            <p class="txt" style="margin-top: 10px;"><b class="num-ques">32</b>Give details of your intended courses of study in Australia </p>
                            <p class="txt">You must provide evidence of enrolment. Unless you are seeking to study in Australia as a secondary school exchange student or as a student sponsored by AusAID or the Australian Department of Defence, you <strong>must</strong> attach: </p>
                            <ul style="padding-left: 15px; font-size: 12px;">
                                <li><strong>if applying in Australia, or outside Australia as an Assessment Level 1 or 2 student,</strong> the electronic confirmation of enrolment certificate from your education provider. If you propose to study more than one course you must provide either an electronic confirmation of enrolment certificate, or an original ‘offer of a place in a course’ letter from your education provider for each additional course; or  </li>
                                <li><strong>if applying outside Australia as an Assessment Level 3 or 4 student,</strong> the original ‘offer of a place in a course’ letter from your education provider. If you are assessed as a genuine student, the Australian Government office will provide you with a letter of genuineness. Only at this stage should you pay any tuition fees and obtain an electronic Confirmation of Enrolment
                                </li>
                            </ul>
                            <p class="txt" style="margin-top: 10px;">If you are seeking to study as an exchange student, you must attach to this application the Acceptance Advice Secondary Exchange Student (AASES) form as evidence of enrolment.   </p>
                            <br>
                            <p class="txt" style="padding-bottom: 10px; border-bottom: 1px solid #000;">If you wish to study in Australia as a student sponsored by AusAID or the Australian Department of Defence, you must attach evidence of sponsorship from AusAID or the Department of Defence. </p>
                            <p class="txt" style="margin-top: 10px;">Intended course</p>
                            <p class="txt">
                                <input type="text" id="intendcoursename" runat="server" name="" style="width: 330px;">
                            </p>
                            <p class="txt" style="margin-top: 10px;">Name of education provider or training body  </p>
                            <p class="txt">
                                <input type="text" id="intendedprovidername" runat="server" name="" style="width: 330px;">
                                <input type="text" name="" style="width: 330px;">
                            </p>
                            <p class="txt" style="margin-top: 10px;">
                                <label style="width: 130px;">Commencement Date</label>
                                <input type="text" id="intendedcommencementdate" runat="server" name="" style="width: 160px;" placeholder="DAY / MONTH / YEAR ">
                            </p>

                            <p class="txt" style="margin-top: 10px;">
                                <label style="width: 130px;">Finish  Date</label>
                                <input type="text" id="intendedfinishdate" runat="server" name="" style="width: 160px;" placeholder="DAY / MONTH / YEAR ">
                            </p>
                            <p class="txt"><b class="num-ques">31</b> Have you enrolled?   </p>
                            <br>
                            <p class="txt">
                                <label style="width: 30px;">No</label>
                                <input type="checkbox" id="chkhaveenrolmentNo" runat="server" name="" style="vertical-align: middle;">
                                <i class="fas fa-caret-right" style="font-size: 18px; vertical-align: middle; margin-left: 3px;"></i><span class="txt" style="vertical-align: middle;">Attach letter of ‘offer of a place in a course’  </span>
                            </p>
                            <p class="txt">
                                <label style="width: 30px;">Yes</label>
                                <input type="checkbox" id="chkhaveenrolmentYes" runat="server" name="" style="vertical-align: middle;">
                                <i class="fas fa-caret-right" style="font-size: 18px; vertical-align: middle; margin-left: 3px;"></i><span class="txt" style="vertical-align: middle;">Is evidence of enrolment attached?  </span>

                                <label style="width: 20px;">No</label>
                                <input type="checkbox" id="chkhaveenrolmentevidenceNo" runat="server" name="" style="margin-right: 8px; vertical-align: middle;">
                                <label style="width: 25px;">Yes</label>
                                <input type="checkbox" id="chkhaveenrolmentevidenceYes" runat="server" name="" style="margin-right: 0px; vertical-align: middle;">
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 50%; vertical-align: top; padding: 0 15px;">
                            <p class="txt" style="margin-top: 10px;">Intended course</p>
                            <p class="txt">
                                <input type="text" id="intendcoursename1" runat="server" name="" style="width: 330px;">
                            </p>
                            <p class="txt" style="margin-top: 10px;">Name of education provider or training body  </p>
                            <p class="txt">
                                <input type="text" id="intendedprovidername1" runat="server" name="" style="width: 330px;">
                                <input type="text" style="width: 330px;">
                            </p>
                            <p class="txt" style="margin-top: 10px;">
                                <label style="width: 130px;">Commencement Date</label>
                                <input type="text" id="intendedcommencementdate1" runat="server" name="" style="width: 160px;" placeholder="DAY / MONTH / YEAR ">
                            </p>

                            <p class="txt" style="margin-top: 10px;">
                                <label style="width: 130px;">Finish  Date</label>
                                <input type="text" id="intendedfinishdate1" runat="server" name="" style="width: 160px;" placeholder="DAY / MONTH / YEAR ">
                            </p>
                            <p class="txt"><b class="num-ques">31</b> Have you enrolled?   </p>
                            <br>
                            <p class="txt">
                                <label style="width: 30px;">No</label>
                                <input type="checkbox" id="chkhaveenrolment1No" runat="server" name="" style="vertical-align: middle;">
                                <i class="fas fa-caret-right" style="font-size: 18px; vertical-align: middle; margin-left: 3px;"></i><span class="txt" style="vertical-align: middle;">Attach letter of ‘offer of a place in a course’  </span>
                            </p>
                            <p class="txt">
                                <label style="width: 30px;">Yes</label>
                                <input type="checkbox" id="chkhaveenrolment1Yes" runat="server" name="" style="vertical-align: middle;">
                                <i class="fas fa-caret-right" style="font-size: 18px; vertical-align: middle; margin-left: 3px;"></i><span class="txt" style="vertical-align: middle;">Is evidence of enrolment attached?  </span>

                                <label style="width: 20px;">No</label>
                                <input type="checkbox" id="chkhaveenrolmentevidence1No" runat="server" name="" style="margin-right: 8px; vertical-align: middle;">
                                <label style="width: 25px;">Yes</label>
                                <input type="checkbox" id="chkhaveenrolmentevidence1Yes" runat="server" name="" style="margin-right: 0px; vertical-align: middle;">
                            </p>
                            <hr style="border-color: #000">
                            <p class="txt" style="margin-top: 10px;">Intended course</p>
                            <p class="txt">
                                <input type="text" id="intendcoursename2" runat="server" name="" style="width: 330px;">
                            </p>
                            <p class="txt" style="margin-top: 10px;">Name of education provider or training body  </p>
                            <p class="txt">
                                <input type="text" id="intendedprovidername2" runat="server" name="" style="width: 330px;">
                                <input type="text" name="" style="width: 330px;">
                            </p>
                            <p class="txt" style="margin-top: 10px;">
                                <label style="width: 130px;">Commencement Date</label>
                                <input type="text" id="intendedcommencementdate2" runat="server" name="" style="width: 160px;" placeholder="DAY / MONTH / YEAR ">
                            </p>
                            <p class="txt" style="margin-top: 10px;">
                                <label style="width: 130px;">Finish  Date</label>
                                <input type="text" id="intendedfinishdate2" runat="server" name="" style="width: 160px;" placeholder="DAY / MONTH / YEAR ">
                            </p>
                            <p class="txt"><b class="num-ques">31</b> Have you enrolled?   </p>
                            <br>
                            <p class="txt">
                                <label style="width: 30px;">No</label>
                                <input type="checkbox" id="chkhaveenrolment2No" runat="server" name="" style="vertical-align: middle;">
                                <i class="fas fa-caret-right" style="font-size: 18px; vertical-align: middle; margin-left: 3px;"></i><span class="txt" style="vertical-align: middle;">Attach letter of ‘offer of a place in a course’  </span>
                            </p>
                            <p class="txt">
                                <label style="width: 30px;">Yes</label>
                                <input type="checkbox" id="chkhaveenrolment2Yes" runat="server" name="" style="vertical-align: middle;">
                                <i class="fas fa-caret-right" style="font-size: 18px; vertical-align: middle; margin-left: 3px;"></i><span class="txt" style="vertical-align: middle;">Is evidence of enrolment attached?  </span>
                                <br>
                                <label style="width: 20px;">No</label>
                                <input type="checkbox" id="chkhaveenrolmentevidence2No" runat="server" name="" style="margin-right: 8px; vertical-align: middle;">
                                <label style="width: 25px;">Yes</label>
                                <input type="checkbox" id="chkhaveenrolmentevidence2Yes" runat="server" name="" style="margin-right: 0px; vertical-align: middle;">
                            </p>
                            <h4 class="part-sub" style="margin-top: 20px;"><em>Your English language details</em></h4>
                            <p class="txt"><b class="num-ques">33</b> Are you an applicant in Assessment Level 1 or 2?    </p>
                            <br>
                            <p class="txt">
                                <label style="width: 30px;">No</label>
                                <input type="checkbox" id="chkapplicantassesmentlevelNo" runat="server" name="" style="vertical-align: middle;">
                                <br>

                                <label style="width: 30px;">Yes</label>
                                <input type="checkbox" id="chkapplicantassesmentlevelYes" runat="server" name="" style="vertical-align: middle;">
                                <i class="fas fa-caret-right" style="font-size: 18px; vertical-align: middle; margin-left: 3px;"></i><span class="txt" style="vertical-align: middle;">Go to Question 36   </span>
                            </p>
                            <p class="txt" style="margin-top: 10px;"><b class="num-ques">34</b> Have you undertaken an English language proficiency test within the last 24 months?   </p>
                            <br>
                            <p class="txt">
                                <label style="width: 30px;">No</label>
                                <input type="checkbox" id="chkenglishlangtestNo" runat="server" name="" style="vertical-align: middle;"><br>
                                <label style="width: 30px;">Yes</label>
                                <input type="checkbox" id="chkenglishlangtestYes" runat="server" name="" style="vertical-align: middle;">
                                <i class="fas fa-caret-right" style="font-size: 18px; vertical-align: middle; margin-left: 3px;"></i><span class="txt" style="vertical-align: middle;">Name of test  </span>
                            </p>
                            <input type="text" id="englishlangtestname" runat="server" name="" style="width: 270px; margin-left: 60px;">
                            <p class="txt" style="margin-top: 10px;">
                                <label style="width: 130px; margin-left: 60px;">Date of  test</label>
                                <input type="text" id="englishlangtestDate" runat="server" name="" style="width: 135px;" placeholder="DAY / MONTH / YEAR ">
                            </p>
                            <p class="txt">
                                <label style="margin-left: 60px; margin-top: 10px;">Test certificate number </label>
                            </p>
                            <input type="text" id="englishlangtestcetificateno" runat="server" name="" style="width: 270px; margin-left: 60px;">
                            <p class="txt">
                                <label style="margin-left: 60px; margin-top: 10px;"><strong>Note:</strong> You <strong>must</strong> attach a certificate showing that you have completed an English language proficiency test.   </label>
                            </p>
                        </td>

                        <td style="width: 50%; vertical-align: top; padding: 0 15px 0 30px;">
                            <p class="txt" style="margin-top: 10px;"><b class="num-ques">35</b> Have you studied for at least 5 years (in the English language) in one or more of the following countries: </p>
                            <ul style="padding-left: 15px; font-size: 14px;">
                                <li>Australia;</li>
                                <li>Canada;</li>
                                <li>New Zealand;</li>
                                <li>South Africa;</li>
                                <li>the Republic of Ireland; </li>
                                <li>the United Kingdom; or </li>
                                <li>the United States of America? </li>
                            </ul>
                            <p class="txt" style="margin-bottom: 20px;">
                                <label style="width: 30px;">No</label>
                                <input type="checkbox" id="chkstudiedmorethan5yrinothercountryNo" runat="server" name="" style="vertical-align: middle;">
                                <br>

                                <label style="width: 30px;">Yes</label>
                                <input type="checkbox" id="chkstudiedmorethan5yrinothercountryYes" runat="server" name="" style="vertical-align: middle;">
                                <i class="fas fa-caret-right" style="font-size: 18px; vertical-align: middle; margin-left: 3px;"></i><span class="txt" style="vertical-align: middle;">Attach evidence</span>
                            </p>
                            <h4 class="part-sub"><em>Your employment details </em></h4>
                            <p class="txt" style="padding-bottom: 10px; border-bottom: 1px solid #000;"><span class="num-ques">36</span>Give details of your employment history since leaving school/college/university. </p>
                            <p class="txt" style="margin-left: 0px; margin-top: 10px;">
                                Period 
				               <label style="width: 35px; margin-left: 10px;">From </label>
                                <input type="text" name="" id="employmenthistoryFromDate" runat="server" style="width: 101px; margin-right: 4px;" placeholder="MONTH / YEAR ">
                                <label style="width: 15px; margin-left: 0px;">to</label>
                                <input type="text" name="" id="employmenthistoryToDate" runat="server" style="width: 103px;" placeholder=" MONTH / YEAR ">
                            </p>
                            <p class="txt" style="margin-top: 10px;">Name and address of employer </p>
                            <p class="txt">
                                <input type="text" id="employerInfoL0" runat="server" name="" style="width: 330px;">
                                <input type="text" id="employerInfoL1" runat="server" name="" style="width: 330px;">
                                <input type="text" name="" style="width: 330px;" placeholder="PINCODE">
                            </p>

                            <p class="txt" style="margin-top: 10px;">
                                <label style="width: 120px;">Type of business </label>
                                <input type="text" id="typeofbusiness" runat="server" name="" style="width: 205px;">
                            </p>

                            <p class="txt" style="margin-top: 10px;">
                                <label style="width: 120px;">Occupation  </label>
                                <input type="text" id="employeroccupation" runat="server" name="" style="width: 205px;">
                            </p>

                            <p class="txt" style="margin-top: 10px;">
                                <label style="width: 120px;">Salary level  </label>
                                <input type="text" id="salarylevel" runat="server" name="" style="width: 205px;">
                            </p>

                            <p class="txt" style="margin-top: 10px; padding-bottom: 10px; border-bottom: 1px solid #000;">
                                <label style="width: 230px;">Documentation attached?  </label>
                                <label style="width: 20px;">No</label>
                                <input type="checkbox" id="chkleavingdocAttchNo" runat="server" name="" style="margin-right: 8px; vertical-align: middle;">
                                <label style="width: 25px;">Yes</label>
                                <input type="checkbox" id="chkleavingdocAttchYes" runat="server" name="" style="margin-right: 0px; vertical-align: middle;">
                            </p>
                            <p class="txt" style="margin-left: 0px; margin-top: 10px;">
                                Period 
				               <label style="width: 35px; margin-left: 10px;">From </label>
                                <input type="text" id="employmenthistoryFromDate1" runat="server" name="" style="width: 101px; margin-right: 4px;" placeholder="MONTH / YEAR ">
                                <label style="width: 15px; margin-left: 0px;">to</label>
                                <input type="text" id="employmenthistoryToDate1" runat="server" name="" style="width: 103px;" placeholder=" MONTH / YEAR ">
                            </p>
                            <p class="txt" style="margin-top: 10px;">Name and address of employer </p>
                            <p class="txt">
                                <input type="text" id="employerInfoL2" runat="server" name="" style="width: 330px;">
                                <input type="text" id="employerInfoL3" runat="server" name="" style="width: 330px;">
                                <input type="text" name="" style="width: 330px;" placeholder="PINCODE">
                            </p>
                            <p class="txt" style="margin-top: 10px;">
                                <label style="width: 120px;">Type of business </label>
                                <input type="text" id="typeofbusiness1" runat="server" name="" style="width: 205px;">
                            </p>

                            <p class="txt" style="margin-top: 10px;">
                                <label style="width: 120px;">Occupation  </label>
                                <input type="text" id="employeroccupation1" runat="server" name="" style="width: 205px;">
                            </p>

                            <p class="txt" style="margin-top: 10px;">
                                <label style="width: 120px;">Salary level  </label>
                                <input type="text" id="salarylevel1" runat="server" name="" style="width: 205px;">
                            </p>

                            <p class="txt" style="margin-top: 10px;">
                                <label style="width: 230px;">Documentation attached?  </label>
                                <label style="width: 20px;">No</label>
                                <input type="checkbox" id="chkleavingdocAttch1No" runat="server" name="" style="margin-right: 8px; vertical-align: middle;">
                                <label style="width: 25px;">Yes</label>
                                <input type="checkbox" id="chkleavingdocAttch1Yes" runat="server" name="" style="margin-right: 0px; vertical-align: middle;">
                            </p>

                        </td>
                    </tr>


                    <tr>
                        <td style="width: 50%; vertical-align: top; padding: 0 15px;">
                            <p class="txt"><span class="num-ques">37</span>Are you currently employed?</p>
                            <p class="txt">
                                <label style="width: 30px;">No</label>
                                <input type="checkbox" id="chkcurrentlyemployedNo" runat="server" name="" style="vertical-align: middle;">
                                <i class="fas fa-caret-right" style="font-size: 18px; vertical-align: middle; margin-left: 3px;"></i><span class="txt" style="vertical-align: middle;">Are you</span>
                            </p>
                            <p class="txt" style="margin-bottom: 5px;">
                                a student
                                <input type="radio" id="rblStudent" runat="server" name="" style="vertical-align: middle; margin-right: 10px;">
                                unemployed
                                <input type="radio" id="rblunemployed" runat="server" name="" style="vertical-align: middle; margin-right: 10px;">
                                other
                                <input type="radio" id="rblOther" runat="server" name="" style="vertical-align: middle; margin-right: 10px;">
                                <i class="fas fa-caret-right" style="font-size: 18px; vertical-align: middle; margin-left: 3px;"></i><span class="txt" style="vertical-align: middle;">Please describe</span>
                                <br>
                                <input type="text" name="" id="otherdescription1" runat="server" style="width: 100%; margin-top: 5px; margin-bottom: 5px;">
                                <label>Why do you wish to undertake the course of study you have nominated? <i>If insufficient space, attach additional details.</i></label>
                                <input type="text" id="otherdescription2" runat="server" name="" style="width: 100%;">
                                <input type="text" name="" style="width: 100%;">
                                <input type="text" name="" style="width: 100%;">
                                <input type="text" name="" style="width: 100%;">
                                <input type="text" name="" style="width: 100%; margin-bottom: 5px;">
                            </p>
                            <p class="txt" style="margin-bottom: 10px;"><i class="fas fa-angle-double-right"></i>Now go to Question 39</p>
                            <br>
                            <p class="txt">
                                <label style="width: 30px;">Yes</label>
                                <input type="checkbox" id="chkcurrentlyemployedYes" runat="server" name="" style="vertical-align: middle;">
                                <i class="fas fa-caret-right" style="font-size: 18px; vertical-align: middle; margin-left: 3px;"></i><span class="txt" style="vertical-align: middle;">Your position</span>
                                <input type="text" id="position" runat="server" name="" style="width: 100%; margin-bottom: 5px;">
                                <label>Name, address and telephone number of your employer</label>

                            </p>
                            <p class="txt">
                                <input type="text" id="employername" runat="server" name="" style="width: 100%;">
                                <input type="text" id="employeraddress" runat="server" name="" style="width: 100%;">
                                <input type="text" name="" style="width: 100%;" placeholder="PINCODE">
                                <input type="text" id="employercontactno" runat="server" name="" style="width: 100%; font-size: 9px; margin-bottom: 5px; height: 25px;" placeholder="( COUNTRY CODE ) ( AREA CODE )      Number ">
                            </p>
                            <p class="txt" style="margin-bottom: 5px;">
                                Have you attached evidence of your employment details?<br>
                                <label style="width: 20px;">No</label>
                                <input type="radio" id="rblevidenceofemployementNo" runat="server" name="" style="vertical-align: middle;">
                                <label style="width: 30px; text-align: right;">Yes</label>
                                <input type="radio" id="rblevidenceofemployementYes" runat="server" name="" style="vertical-align: middle;">
                            </p>
                            <p class="txt" style="margin-bottom: 15px;">
                                Are you currently a student in Australia?<br>
                                <label style="width: 20px;">No</label>
                                <input type="radio" id="rblcurrentlystudentinaustraliaNo" runat="server" name="" style="vertical-align: middle;">
                                <label style="width: 30px; text-align: right;">Yes</label>
                                <input type="radio" id="rblcurrentlystudentinaustraliaYes" runat="server" name="" style="vertical-align: middle;">
                            </p>
                            <p class="txt" style="margin-top: 10px;"><b class="num-ques">38</b> Have you been offered a job for when you return home at the completion of your course?  </p>
                            <label style="width: 30px;">No</label>
                            <input type="checkbox" id="chkjobofferedNo" runat="server" name="" style="vertical-align: middle;">
                            <i class="fas fa-caret-right" style="font-size: 18px; vertical-align: middle; margin-left: 3px;"></i><span class="txt" style="vertical-align: middle;">What kind of employment will you be seeking on your return to your home country?  </span>
                            <input type="text" id="kindofemployementseeking" runat="server" name="" style="width: 270px; margin-left: 60px;">
                            <input type="text" name="" style="width: 270px; margin-left: 60px;">
                            <input type="text" name="" style="width: 270px; margin-left: 60px;">
                            <input type="text" name="" style="width: 270px; margin-left: 60px;">

                            <label style="width: 30px;">Yes</label>
                            <input type="checkbox" id="chkjobofferedYes" runat="server" name="" style="vertical-align: middle;">
                            <i class="fas fa-caret-right" style="font-size: 18px; vertical-align: middle; margin-left: 3px;"></i><span class="txt" style="vertical-align: middle;">Name, address and telephone number of your employer  </span>
                            <input type="text" id="jobofferedname" runat="server" name="" style="width: 270px; margin-left: 60px;">
                            <input type="text" id="jobofferedaddress" runat="server" name="" style="width: 270px; margin-left: 60px;">
                            <input type="text"  name="" style="width: 270px; margin-left: 60px;">
                            <input type="text" name="" style="width: 270px; margin-left: 60px;" placeholder="POSTAL CODE">

                            <input type="text" id="jobofferedcontactno" runat="server" name="" style="width: 270px; margin-top: 10px; margin-left: 60px; font-size: 12px" placeholder="(COUNTRY CODE) (AREA CODE) NUMBER ">

                            <p class="txt" style="margin-top: 10px; margin-left: 60px;">Title of position offered</p>
                            <p class="txt">
                                <input type="text" id="titleofpositionofferef" runat="server" name="" style="width: 270px; margin-left: 60px;">
                            </p>
                        </td>

                        <td style="width: 50%; vertical-align: top; padding: 0 15px 0 30px;">
                            <h4 class="part-sub"><em><strong>Other address details </strong></em></h4>
                            <p class="txt" style="padding-bottom: 10px; border-bottom: 1px solid #000;">
                                <b class="num-ques">39</b>Give details of any immediate relatives in Australia
 							<em>(ie. parent, spouse, child, brother or sister)</em>
                            </p>
                            <p class="txt" style="margin-top: 10px;">
                                <label style="width: 120px;">Name</label>
                                <input type="text" id="immediaterelativename" runat="server" name="" style="width: 205px;">
                            </p>

                            <p class="txt" style="margin-top: 10px;">
                                <label style="width: 120px;">Relationship to you </label>
                                <input type="text" id="immediaterelativerelationship" runat="server" name="" style="width: 205px;">
                            </p>

                            <p class="txt" style="margin-top: 10px;">
                                <label style="width: 120px;">Date of birth </label>
                                <input type="text" id="immediaterelativeDob" runat="server" name="" style="width: 160px;" placeholder="DAY / MONTH / YEAR ">
                            </p>

                            <p class="txt" style="margin-top: 10px;">Address  </p>
                            <p class="txt">
                                <input type="text" id="immediaterelativeaddress" runat="server" name="" style="width: 330px;">
                                <input type="text" name="" style="width: 330px;">
                                <input type="text" id="immediaterelativepostalcode" runat="server" name="" style="width: 330px;" placeholder="PINCODE">
                            </p>
                            <p class="txt" style="margin-top: 10px;">Immigration status in Australia <em>(eg. temporary or permanent resident, Australian citizen)  </em></p>
                            <input type="text" id="immediaterelativeimmigrationstatus" runat="server" name="" style="width: 325px;" placeholder="">
                            </p>

				            <p class="txt" style="margin-top: 10px; border-bottom: 1px solid #000; padding-bottom: 10px;">
                                <label style="width: 120px;">Date of arrival  </label>
                                <input type="text" id="immediaterelativeDateofarrival" runat="server" name="" style="width: 160px;" placeholder="DAY / MONTH / YEAR ">
                            </p>


                            <p class="txt" style="margin-top: 10px;">
                                <label style="width: 120px;">Name</label>
                                <input type="text" id="immediaterelativename1" runat="server" name="" style="width: 205px;">
                            </p>

                            <p class="txt" style="margin-top: 10px;">
                                <label style="width: 120px;">Relationship to you </label>
                                <input type="text" id="immediaterelativerelationship1" runat="server" name="" style="width: 205px;">
                            </p>

                            <p class="txt" style="margin-top: 10px;">
                                <label style="width: 120px;">Date of birth </label>
                                <input type="text" id="immediaterelativeDob1" runat="server" name="" style="width: 160px;" placeholder="DAY / MONTH / YEAR ">
                            </p>

                            <p class="txt" style="margin-top: 10px;">Address  </p>
                            <p class="txt">
                                <input type="text" id="immediaterelativeaddress1" runat="server" name="" style="width: 330px;">
                                <input type="text" name="" style="width: 330px;">
                                <input type="text" id="immediaterelativepostalcode1" runat="server" name="" style="width: 330px;" placeholder="PINCODE">
                            </p>
                            <p class="txt" style="margin-top: 10px;">Immigration status in Australia <em>(eg. temporary or permanent resident, Australian citizen)  </em></p>
                            <input type="text" id="immediaterelativeimmigrationstatus1" runat="server" name="" style="width: 325px;" placeholder="">
                            </p>

				            <p class="txt" style="margin-top: 10px; border-bottom: 1px solid #000; padding-bottom: 10px;">
                                <label style="width: 120px;">Date of arrival  </label>
                                <input type="text" id="immediaterelativedateofarrival1" runat="server" name="" style="width: 160px;" placeholder="DAY / MONTH / YEAR ">
                            </p>
                            <p class="txt" style="margin-top: 10px;"><b class="num-ques">40</b>Give details of your closest relative in your home country who is neither accompanying nor joining you in Australia  </p>

                            <p class="txt" style="margin-top: 10px;">
                                <label style="width: 120px;">Name</label>
                                <input type="text" id="closestrelativename" runat="server" name="" style="width: 205px;">
                            </p>

                            <p class="txt" style="margin-top: 10px;">
                                <label style="width: 120px;">Relationship to you </label>
                                <input type="text" id="closestrelativerelationship" runat="server" name="" style="width: 205px;">
                            </p>
                            <p class="txt" style="margin-top: 10px;">Address  </p>
                            <p class="txt">
                                <input type="text" id="closestrelativeaddress" runat="server" name="" style="width: 330px;">
                                <input type="text" name="" style="width: 330px;">
                                <input type="text" id="closestrelativepostalcode" runat="server" name="" style="width: 330px;" placeholder="PINCODE">
                            </p>

                            <p class="txt" style="margin-top: 10px;">
                                <label style="width: 75px;">Telephone  </label>
                                <input type="text" id="closestrelativecontactnumber" runat="server" name="" style="width: 250px; font-size: 12px" placeholder="(COUNTRY CODE) (AREA CODE) NUMBER ">
                            </p>
                        </td>
                    </tr>


                    <tr>
                        <td style="width: 50%; vertical-align: top; padding: 0 15px;">
                            <h4 class="part-sub"><em>Financial details</em></h4>
                            <p class="txt"><b class="num-ques">41</b>Are you applying to study in Australia as a secondary school exchange student?    </p>
                            <br>
                            <p class="txt">
                                <label style="width: 30px;">No</label>
                                <input type="checkbox" id="chkapplyinaustraliaassecschoolNo" runat="server" name="" style="vertical-align: middle;">
                                <br>
                                <label style="width: 30px;">Yes</label>
                                <input type="checkbox" id="chkapplyinaustraliaassecschoolYes" runat="server" name="" style="vertical-align: middle;">
                                <i class="fas fa-caret-right" style="font-size: 18px; vertical-align: middle; margin-left: 3px;"></i><span class="txt" style="vertical-align: middle;">Go to Question 43   </span>
                            </p>
                            <p class="txt"><b class="num-ques">42</b>Do you have access to sufficient funds to support you and your family unit members for the TOTAL period of your stay in Australia (including proposed course fees for you and any school-age family members, living costs and travel costs, regardless of whether your dependants intend to accompany you to  Australia)? </p>
                            <br>
                            <p class="txt">
                                <label style="width: 30px;">No</label>
                                <input type="checkbox" id="chkissufficientfundNo" runat="server" name="" style="vertical-align: middle;">
                                <i class="fas fa-caret-right" style="font-size: 18px; vertical-align: middle; margin-left: 3px;"></i><span class="txt" style="vertical-align: middle;">Go to Question 43   </span>
                                <br>
                                <label style="width: 30px;">Yes</label>
                                <input type="checkbox" id="chkissufficientfundYes" runat="server" name="" style="vertical-align: middle;">
                                <i class="fas fa-caret-right" style="font-size: 18px; vertical-align: middle; margin-left: 3px;"></i><span class="txt" style="vertical-align: middle;">Go to Question 43   </span>
                                <br>
                            </p>
                            <hr style="border-color: #000">
                            <p class="txt" style="margin-left: 60px;">
                                If you are under 18 years of age, this declaration must be signed on your behalf by your parents or a person(s) who has legal custody of you. 
                            </p>
                            <br>
                            <p class="txt" style="margin-left: 60px;">
                                If you are in Assessment Level 2–5, you <strong>must</strong> provide documentary <strong>evidence</strong> that you have sufficient funds (unless you are a secondary school exchange student). It is important that you refer to the department’s website <strong>www.immi.gov.au/study/</strong> for details regarding the level of funds you are required to demonstrate, acceptable sources of funds and of the length of time funds must have been held.
                            </p>
                            <br>
                            <p class="txt" style="margin-left: 60px;">
                                I declare that I have access to sufficient funds to support myself and my family unit members (regardless of whether they are accompanying me to Australia) for the total period of my stay in Australia. 
                            </p>
                            <p class="txt" style="margin-left: 60px; margin-top: 10px;">
                                <h6 style="margin-left: 60px;"><strong>Your signature </strong></h6>
                            </p>
                            <input type="text" name="" style="width: 280px; height: 100px; margin-left: 60px;">
                            <p class="txt" style="margin-top: 10px;">
                                <label style="width: 60px;">Date</label>
                                <input type="text" id="declarationDate42" runat="server" name="" style="width: 160px;" placeholder="DAY / MONTH / YEAR ">
                            </p>
                        </td>
                        <td style="width: 50%; vertical-align: top; padding: 0 15px 0 30px;">
                            <h3 class="part-sub"><em>Additional information</em></h3>
                            <p class="txt">
                                <b class="num-ques">43</b>If there is any other information or documentation you would like taken into consideration in assessing your application attach it to the application. 
                            </p>
                            <p class="txt" style="margin-top: 10px;">Remember that a decision may be based solely on the information you provide in this application. </p>
                            <p class="txt" style="margin-top: 10px;">
                                <strong>Note:</strong> If you are in Australia as the holder of a student subclass 570–576 visa and you wish to change your principal course within the first 12 months of that course, and your new principal course will be in a new education sector, then as part of this application you must provide exceptional circumstances to justify the change of course. 
                            </p>
                            <p class="txt" style="margin-top: 10px;">If you are applying in Australia as an Assessment Level 2–5 applicant and do not hold a student visa, you must provide exceptional reasons to justify the grant of your visa.  </p>

                            <p class="txt" style="margin-top: 10px;">
                                <i class="fas fa-caret-right" style="font-size: 18px; vertical-align: middle;"></i>
                                <i class="fas fa-caret-right" style="font-size: 18px; vertical-align: middle;"></i>Now go to Part D 
                            </p>
                        </td>
                    </tr>

                    <tr>
                        <td style="width: 50%; vertical-align: top; padding: 0 15px;">
                            <h5 class="part"><em><strong>Part C – To be completed only if you are a family unit member joining a student in Australia</strong></em> </h5>
                            <br>
                            <p class="txt"><b class="num-ques">44</b>Has the student you are joining, who is a member of your family unit, completed form 919 Nomination of student dependants? </p>
                            <p class="txt">
                                <label style="width: 30px;">No</label>
                                <input type="checkbox" id="chkFamilyunitcompletedformpartCNo" runat="server" name="" style="vertical-align: middle;">
                                <i class="fas fa-caret-right" style="font-size: 18px; vertical-align: middle; margin-left: 3px;"></i><span class="txt" style="vertical-align: middle;">If applying outside Australia, you must provide a completed form 919 with this application  </span>
                                <br>
                                <label style="width: 30px;">Yes</label>
                                <input type="checkbox" id="chkFamilyunitcompletedformpartCYes" runat="server" name="" style="vertical-align: middle;">
                                <i class="fas fa-caret-right" style="font-size: 18px; vertical-align: middle; margin-left: 3px;"></i><span class="txt" style="vertical-align: middle;">Attach the completed form 919 to this application    </span>
                                <br>
                            </p>
                            <p class="txt" style="margin-top: 20px;"><b class="num-ques">45</b>Do you intend to study in Australia for more than 3 months?  </p>
                            <p class="txt">
                                <label style="width: 30px;">No</label>
                                <input type="checkbox" id="chkstudymorethanthreemonthpartCNo" runat="server" name="" style="vertical-align: middle;">
                                <br>
                                <label style="width: 30px;">Yes</label>
                                <input type="checkbox" id="chkstudymorethanthreemonthpartCYes" runat="server" name="" style="vertical-align: middle;">
                                <i class="fas fa-caret-right" style="font-size: 18px; vertical-align: middle; margin-left: 3px;"></i><span class="txt" style="vertical-align: middle;">If you are 5 years up to 18 years of age, please provide documentary evidence of school enrolment in Australia. 
                                </span>
                            </p>
                            <p class="txt" style="margin-top: 10px;">If you are 18 years of age or older and you intend to study of time funds must be held. in Australia for more than 3 months, you must apply for a student visa as a principal applicant, rather than as a family unit member. </p>
                            <p class="txt" style="margin-top: 20px;"><b class="num-ques">46</b>Provide details of the student you are joining in Australia  </p>
                            <p class="txt" style="margin-top: 10px;">
                                <label style="width: 100px;">Name</label>
                                <input type="text" id="studentnamepartC" runat="server" name="" style="width: 228px;">
                            </p>

                            <p class="txt" style="margin-top: 10px;">
                                <label style="width: 100px;">Relationship to you </label>
                                <input type="text" id="relationshiptostudentpartC" runat="server" name="" style="width: 228px;">
                            </p>

                            <p class="txt" style="margin-top: 10px;">
                                <label style="width: 100px;">Date of Birth</label>
                                <input type="text" id="studentdobpartC" runat="server" name="" style="width: 160px;" placeholder="DAY / MONTH / YEAR ">
                            </p>

                            <p class="txt" style="margin-top: 10px;">
                                <label style="width: 100px;">Citizenship(s)  </label>
                                <input type="text" id="citizenshipofstudentpartC" runat="server" name="" style="width: 228px;">
                            </p>
                            <p class="txt" style="margin-top: 10px;">Address </p>
                            <p class="txt">
                                <input type="text" id="studentaddresspartC" runat="server" name="" style="width: 330px;">
                                <input type="text" name="" style="width: 330px;">
                                <input type="text" id="studentaddpostalcodepartC" runat="server" name="" style="width: 330px;" placeholder="PINCODE">
                            </p>

                            <p class="txt" style="margin-top: 10px;">
                                <label style="width: 150px;">Type of student visa held  </label>
                                <input type="text" id="typeofstudentvisaheldpartC" runat="server" name="" style="width: 177px;">
                            </p>

                            <p class="txt" style="margin-top: 10px;">
                                <label style="width: 150px;">What Assessment Level were they assessed against (if known)? </label>
                                <input type="text" id="assessmentlevelpartC" runat="server" name="" style="width: 177px;">
                            </p>

                            <p class="txt" style="margin-top: 10px;">
                                <label style="width: 100px;">Date granted </label>
                                <input type="text" id="assessmentgrantdatepartC" runat="server" name="" style="width: 160px;" placeholder="DAY / MONTH / YEAR ">
                            </p>

                            <p class="txt" style="margin-top: 10px;">
                                <label style="width: 100px;">Expiry date </label>
                                <input type="text" id="assessmentexpirydatepartC" runat="server" name="" style="width: 160px;" placeholder="DAY / MONTH / YEAR ">
                            </p>

                            <p class="txt" style="margin-top: 10px;">
                                <strong>Note:</strong> You cannot join your family unit member in Australia on a student visa if they are in Assessment Levels 3–5 unless the total duration of the course(s) they are undertaking in Australia is at least 12 months or more.
                            </p>

                            <p class="txt" style="margin-top: 10px;"><b class="num-ques">47</b>Did the student you are joining declare in their initial student visa application you and other members of their family unit included in this application?  </p>

                            <p class="txt" style="margin-top: 10px;">
                                <label style="width: 30px;">No</label>
                                <input type="checkbox" id="chkisstudentjoiningdeclarepartCNo" runat="server" name="" style="vertical-align: middle;">
                                <br>
                                <label style="width: 30px;">Yes</label>
                                <input type="checkbox" id="chkisstudentjoiningdeclarepartCYes" runat="server" name="" style="vertical-align: middle;">
                            </p>
                        </td>

                        <td style="width: 50%; vertical-align: top; padding: 0 15px 0 30px;">
                            <p class="txt" style="margin-top: 10px;">
                                <b class="num-ques">48</b>
                                Is the student you are joining: 
                            </p>
                            <ul style="padding-left: 0px; font-size: 12px;">
                                <li>the holder of an International Postgraduate Research Scholarship;</li>
                                <li>sponsored by AusAID or the Australian Department of Defence; </li>
                                <li>fully sponsored by the federal, or a state or territory government of Australia; </li>
                                <li>fully sponsored by the government of your home country, or by a state or provincial government of your home country; </li>
                                <li>fully sponsored by a multilateral organisation eg. the United Nations, World Bank? </li>
                            </ul>
                            <p class="txt">
                                <label style="width: 30px;">No</label>
                                <input type="checkbox" id="chkisstudentjoiningsatisfiedconditionpartCNo" runat="server" name="" style="vertical-align: middle;">


                                <br>
                                <label style="width: 30px;">Yes</label>
                                <input type="checkbox" name="" id="chkisstudentjoiningsatisfiedconditionpartCYes" runat="server" style="vertical-align: middle;">
                                <i class="fas fa-caret-right" style="font-size: 18px; vertical-align: middle; margin-left: 3px;"></i><span class="txt" style="vertical-align: middle;">If the student you are joining is in Assessment Level 2–5 and was granted their visa after 1 December 2003, there are specific financial evidentiary requirements that you must meet. Please go to the department’s website for details on the levels of funds you are required to demonstrate, acceptable sources of funds and the length of time funds must be held. </span>
                            </p>
                            <p class="txt" style="margin-top: 10px;">
                                <i class="fas fa-caret-right" style="font-size: 18px; vertical-align: middle;"></i>
                                <i class="fas fa-caret-right" style="font-size: 18px; vertical-align: middle;"></i>Now go to Part D 
                            </p>
                            <p class="txt" style="margin-top: 20px;"><b class="num-ques">49</b>Does the student you are joining have sufficient funds to financially support themselves, you and any other family members included in this application, for the remainder of his or her stay in Australia?  </p>
                            <p class="txt" style="margin-top: 20px;">
                                <label style="width: 30px;">No</label>
                                <input type="checkbox" id="chksuficientfundpartCNo" runat="server" name="" style="vertical-align: middle;">
                                <br>
                                <label style="width: 30px;">Yes</label>
                                <input type="checkbox" id="chksuficientfundpartCYes" runat="server" name="" style="vertical-align: middle;">
                                <i class="fas fa-caret-right" style="font-size: 18px; vertical-align: middle; margin-left: 3px;"></i><span class="txt" style="vertical-align: middle;">You must attach evidence of this financial support </span>
                            </p>

                        </td>
                    </tr>
                    <tr>
                        <td style="width: 50%; vertical-align: top; padding: 0 15px 0 30px;">
                            <h2 class="part"><i>Part D – To be completed by all applicants</i></h2>
                            <h6 class="part-sub"><i>Health declaration</i></h6>
                            <p class="txt">In the last 5 years, have you, or has any member of your family unit included in this application, visited or lived outside your country of usual residence for more than 3 consecutive months?</p>
                            <p class="txt">
                                <b class="num-ques">50</b>
                                <label style="width: 30px;">No</label><input id="rbllivedoutsidecountrycNo" runat="server" type="radio" name="" style="vertical-align: middle; margin-bottom: 5px;">
                                <br>
                                <label style="width: 30px;">Yes</label><input id="rbllivedoutsidecountrycYes" runat="server" type="radio" name="" style="vertical-align: middle;"><i class="fas fa-caret-right" style="font-size: 18px; vertical-align: middle; margin-left: 3px;"></i> <span class="txt" style="vertical-align: middle;">Give Details</span>
                            </p>
                            <hr style="border-color: #000">
                            <p class="txt">
                                <label style="width: 80px;">Name</label><input type="text" id="familymembername" runat="server" name="" style="width: 250px; margin-bottom: 5px;"><br>
                                <label style="width: 80px;">Countries</label><input type="text" id="familyresidencecountry" runat="server" name="" style="width: 250px; margin-bottom: 5px;"><br>
                                <label style="width: 80px;">Date</label><input type="text" name="" id="familyresidenceFromdate" runat="server" style="width: 110px; font-size: 10px;" placeholder="DAY / MONTH / YEAR">
                                <label style="width: 26px; text-align: center;">to</label><input id="familyresidenceTodate" runat="server" type="text" name="" style="width: 110px; font-size: 10px;" placeholder="DAY / MONTH / YEAR">
                            </p>
                            <hr style="border-color: #000">
                            <p class="txt">
                                <label style="width: 80px;">Name</label><input id="familymembername1" runat="server" type="text" name="" style="width: 250px; margin-bottom: 5px;"><br>
                                <label style="width: 80px;">Countries</label><input id="familyresidencecountry1" runat="server" type="text" name="" style="width: 250px; margin-bottom: 5px;"><br>
                                <label style="width: 80px;">Date</label><input type="text" id="familyresidenceFromdate1" runat="server" name="" style="width: 110px; font-size: 10px;" placeholder="DAY / MONTH / YEAR">
                                <label style="width: 26px; text-align: center;">to</label><input id="familyresidenceTodate1" runat="server" type="text" name="" style="width: 110px; font-size: 10px;" placeholder="DAY / MONTH / YEAR">
                            </p>
                            <hr style="border-color: #000">
                            <p class="txt">
                                <label style="width: 80px;">Name</label><input id="familymembername2" runat="server" type="text" name="" style="width: 250px; margin-bottom: 5px;"><br>
                                <label style="width: 80px;">Countries</label><input id="familyresidencecountry2" runat="server" type="text" name="" style="width: 250px; margin-bottom: 5px;"><br>
                                <label style="width: 80px;">Date</label><input type="text" id="familyresidenceFromdate2" runat="server" name="" style="width: 110px; font-size: 10px;" placeholder="DAY / MONTH / YEAR">
                                <label style="width: 26px; text-align: center;">to</label><input id="familyresidenceTodate2" runat="server" type="text" name="" style="width: 110px; font-size: 10px;" placeholder="DAY / MONTH / YEAR">
                            </p>
                            <br>
                            <p class="txt">
                                <span class="num-ques">51</span> Do you, or any member of your family unit included in this application, intend entering an Australian hospital (including nursing homes) for work, training, treatment or visiting?
                                <br>
                                <label style="width: 30px;">No</label><input id="rblhaveworkforaustralianhospitalNo" runat="server" type="radio" name="" style="vertical-align: middle;">
                                <br>
                                <label style="width: 30px;">Yes</label><input id="rblhaveworkforaustralianhospitalYes" runat="server" type="radio" name="" style="vertical-align: middle;"><i class="fas fa-caret-right" style="font-size: 18px; vertical-align: middle; margin-left: 3px;"></i> <span class="txt" style="vertical-align: middle;">Give full details</span>
                            </p>
                            <p class="txt">
                                <input type="text" id="descriptionofhospitalwork" runat="server" name="" style="width: 100%;"><br>
                                <input type="text" name="" style="width: 100%;"><br>
                                <input type="text" name="" style="width: 100%;"><br>
                                <input type="text" name="" style="width: 100%;"><br>
                                <input type="text" name="" style="width: 100%;"><br>
                                <input type="text" name="" style="width: 100%;">
                            </p>
                            <br>
                            <p class="txt">
                                <span class="num-ques">52</span> Do you, or any member of your family unit included in this application, intend to work in an Australian preschool-aged child care centre (including preschools and creches) as an employee or trainee?<br>
                                <label style="width: 30px;">No</label><input type="radio" id="rblhaveworkforaustralianpreschoolNo" runat="server" name="" style="vertical-align: middle;">
                                <br>
                                <label style="width: 30px;">Yes</label><input type="radio" id="rblhaveworkforaustralianpreschoolYes" runat="server" name="" style="vertical-align: middle;"><i class="fas fa-caret-right" style="font-size: 18px; vertical-align: middle; margin-left: 3px;"></i> <span class="txt" style="vertical-align: middle;">Give full details</span>
                            </p>
                            <p class="txt">
                                <input type="text" id="descriptionofpreschoolwork" runat="server" name="" style="width: 100%;"><br>
                                <input type="text" name="" style="width: 100%;"><br>
                                <input type="text" name="" style="width: 100%;"><br>
                                <input type="text" name="" style="width: 100%;"><br>
                                <input type="text" name="" style="width: 100%;"><br>
                                <input type="text" name="" style="width: 100%;">
                            </p>

                            <br>
                        </td>
                        <td style="width: 50%; vertical-align: top; padding: 0 15px 0 30px;">
                            <p class="txt">
                                <span class="num-ques">53</span> Have you, or any member of your family unit included in this application:
								<ul>
                                    <li>ever had, or do you currently have, tuberculosis?</li>
                                    <li>been in close contact with a person who has, or has had, active tuberculosis?</li>
                                    <li>ever had a chest x-ray which showed an abnormality?</li>
                                </ul>
                                <label style="width: 30px;">No</label><input id="rblhaveanyhealthissueNo" runat="server" type="radio" name="" style="vertical-align: middle;">
                                <br>
                                <label style="width: 30px;">Yes</label><input id="rblhaveanyhealthissueYes" runat="server" type="radio" name="" style="vertical-align: middle;"><i class="fas fa-caret-right" style="font-size: 18px; vertical-align: middle; margin-left: 3px;"></i> <span class="txt" style="vertical-align: middle;">Give full details</span>
                            </p>
                            <p class="txt">
                                <input type="text" id="detailofhealthissue" runat="server" name="" style="width: 100%;"><br>
                                <input type="text" name="" style="width: 100%;"><br>
                                <input type="text" name="" style="width: 100%;"><br>
                                <input type="text" name="" style="width: 100%;"><br>
                                <input type="text" name="" style="width: 100%;"><br>
                                <input type="text" name="" style="width: 100%;">
                            </p>
                            <br>
                            <p class="txt">
                                <span class="num-ques">54</span> Do you require assistance with mobility and/or care?
                                <br>
                                <label style="width: 30px;">No</label><input type="radio" id="rblrequireassistancewithmobilityNo" runat="server" name="" style="vertical-align: middle;">
                                <br>
                                <label style="width: 30px;">Yes</label><input type="radio" id="rblrequireassistancewithmobilityYes" runat="server" name="" style="vertical-align: middle;"><i class="fas fa-caret-right" style="font-size: 18px; vertical-align: middle; margin-left: 3px;"></i> <span class="txt" style="vertical-align: middle;">Provide details of the mobility/care concerns that apply to you and how they are addressed </span>
                            </p>
                            <p class="txt">
                                <input type="text" id="descriptionofmobility" runat="server" name="" style="width: 100%;"><br>
                                <input type="text" name="" style="width: 100%;"><br>
                                <input type="text" name="" style="width: 100%;"><br>
                                <input type="text" name="" style="width: 100%;"><br>
                                <input type="text" name="" style="width: 100%;"><br>
                                <input type="text" name="" style="width: 100%;">
                            </p>
                            <br>
                            <p class="txt">
                                <span class="num-ques">55</span> Do you intend performing medical procedures (eg. as a practising/trainee doctor, dentist, nurse) during your stay in Australia?
                                <br>
                                <label style="width: 30px;">No</label><input type="radio" id="rblhaevmedicalproceduresNo" runat="server" name="" style="vertical-align: middle;">
                                <br>
                                <label style="width: 30px;">Yes</label><input type="radio" id="rblhaevmedicalproceduresYes" runat="server" name="" style="vertical-align: middle;"><i class="fas fa-caret-right" style="font-size: 18px; vertical-align: middle; margin-left: 3px;"></i> <span class="txt" style="vertical-align: middle;">Provide details of the medical/dental/nursing procedures you may be involved with in Australia</span>
                            </p>
                            <p class="txt">
                                <input type="text" id="proceduresdescription" runat="server" name="" style="width: 100%;"><br>
                                <input type="text" name="" style="width: 100%;"><br>
                                <input type="text" name="" style="width: 100%;"><br>
                                <input type="text" name="" style="width: 100%;"><br>
                                <input type="text" name="" style="width: 100%;"><br>
                                <input type="text" name="" style="width: 100%;">
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 50%; vertical-align: top; padding: 0 15px 0 30px;">
                            <p class="txt">
                                <span class="num-ques">56</span> 56	During your proposed visit to Australia, do you, or any children included in this application, expect to incur medical costs, or require treatment or medical follow up for:
                            </p>
                            <h6 class="clearfix" style="font-weight: 400;">
                                <ul style="width: 50%; float: left; margin: 0;">
                                    <li>blood disorder</li>
                                    <li>cancer</li>
                                    <li>heart disease</li>
                                    <li>hepatitis</li>
                                    <li>HIV infection, including AIDS</li>
                                    <li>kidney disease, including dialysis</li>
                                    <li>liver disease</li>
                                </ul>
                                <ul style="width: 50%; float: left; margin: 0;">
                                    <li>mental illness</li>
                                    <li>pregnancy</li>
                                    <li>respiratory disease that has required hospital admission</li>
                                    <li>any form of surgery</li>
                                    <li>any other health concerns?</li>
                                </ul>
                            </h6>
                            <p class="txt" style="margin-bottom: 10px;">
                                <label style="width: 30px;">No</label><input id="rblhavemedicalfollowupNo" runat="server" type="radio" name="" style="vertical-align: middle;">
                                <br>
                                <label style="width: 30px;">Yes</label><input id="rblhavemedicalfollowupYes" runat="server" type="radio" name="" style="vertical-align: middle;"><i class="fas fa-caret-right" style="font-size: 18px; vertical-align: middle; margin-left: 3px;"></i> <span class="txt" style="vertical-align: middle;">Give Details</span><br>
                            </p>
                            <p class="txt" style="margin-bottom: 10px;">
                                <input type="text" id="medicalfollowupdescription" runat="server" name="" style="width: 100%;"><br>
                                <input type="text" name="" style="width: 100%;"><br>
                                <input type="text" name="" style="width: 100%;"><br>
                                <input type="text" name="" style="width: 100%;"><br>
                                <input type="text" name="" style="width: 100%;"><br>
                                <input type="text" name="" style="width: 100%;"><br>
                                <input type="text" name="" style="width: 100%;"><br>
                                <input type="text" name="" style="width: 100%;"><br>
                                <input type="text" name="" style="width: 100%;"><br>
                                <input type="text" name="" style="width: 100%;"><br>
                                <input type="text" name="" style="width: 100%;"><br>
                                <input type="text" name="" style="width: 100%;">
                            </p>
                            <p class="txt">
                                <i>You are strongly advised to carry certification of your vaccination status, especially for children attending Australian child care centres (including preschools and creches) and schools. Vaccination against polio, tetanus, measles, mumps, rubella, diphtheria, pertussis (whooping cough), Haemophilus influenzae hypo B (Hib), and Hepatitis B is recommended for children, with certification sought at time of child care centre (including preschool and creche) and school enrolment. Vaccination against rubella is also recommended for women of child bearing age.</i>
                            </p>
                        </td>
                        <td style="width: 50%; vertical-align: top; padding: 0 15px 0 30px;">
                            <h6 class="part-sub"><i>Character declaration</i></h6>
                            <p class="txt">
                                <span class="num-ques">57</span>
                                Have you, or any member of your family unit included in this application, ever:
                            </p>
                            <ul>
                                <li style="margin-bottom: 5px;">
                                    <span>been convicted of a crime or offence in any country (including any conviction which is now removed from official records)?</span>
                                    <span style="display: inline-block; padding-left: 10px;">
                                        <label style="width: 20px;">No</label>
                                        <input type="radio" id="rblhaveconvictedofcrimeNo" runat="server" name="" style="vertical-align: middle;">
                                        <label style="width: 30px; text-align: right;">Yes</label>
                                        <input type="radio" id="rblhaveconvictedofcrimeYes" runat="server" name="" style="vertical-align: middle;">
                                    </span>
                                </li>
                                <li style="margin-bottom: 5px;">
                                    <span>been charged with any offence that is currently awaiting legal action?</span>
                                    <span style="display: inline-block; padding-left: 10px;">
                                        <label style="width: 20px;">No</label>
                                        <input type="radio" id="rblhavechargeoffenceNo" runat="server" name="" style="vertical-align: middle;">
                                        <label style="width: 30px; text-align: right;">Yes</label>
                                        <input type="radio" id="rblhavechargeoffenceYes" runat="server" name="" style="vertical-align: middle;">
                                    </span>
                                </li>
                                <li style="margin-bottom: 5px;">
                                    <span>been acquitted of any criminal offence or other offence on the grounds of mental illness, insanity or unsoundness of mind?</span>
                                    <span style="display: inline-block; padding-left: 10px;">
                                        <label style="width: 20px;">No</label>
                                        <input type="radio" id="rblhavecriminaloffenceNo" runat="server" name="" style="vertical-align: middle;">
                                        <label style="width: 30px; text-align: right;">Yes</label>
                                        <input type="radio" id="chkhavecriminaloffenceYes" runat="server" name="" style="vertical-align: middle;">
                                    </span>
                                </li>
                                <li style="margin-bottom: 5px;">
                                    <span>been removed or deported from any country (including Australia)?</span>
                                    <span style="display: inline-block; padding-left: 10px;">
                                        <label style="width: 20px;">No</label>
                                        <input type="radio" id="rblhaveremovedfromcountryNo" runat="server" name="" style="vertical-align: middle;">
                                        <label style="width: 30px; text-align: right;">Yes</label>
                                        <input type="radio" id="rblhaveremovedfromcountryYes" runat="server" name="" style="vertical-align: middle;">
                                    </span>
                                </li>
                                <li style="margin-bottom: 5px;">
                                    <span>left any country to avoid being removed or deported?</span>
                                    <span style="display: inline-block; padding-left: 10px;">
                                        <label style="width: 20px;">No</label>
                                        <input type="radio" id="rblhavetoavoidbeingremovedNo" runat="server" name="" style="vertical-align: middle;">
                                        <label style="width: 30px; text-align: right;">Yes</label>
                                        <input type="radio" id="rblhavetoavoidbeingremovedYes" runat="server" name="" style="vertical-align: middle;">
                                    </span>
                                </li>
                                <li style="margin-bottom: 5px;">
                                    <span>been excluded from or asked to leave any country (including Australia)?</span>
                                    <span style="display: inline-block; padding-left: 10px;">
                                        <label style="width: 20px;">No</label>
                                        <input type="radio" id="rblhavebeenexcludedNo" runat="server" name="" style="vertical-align: middle;">
                                        <label style="width: 30px; text-align: right;">Yes</label>
                                        <input type="radio" id="rblhavebeenexcludedYes" runat="server" name="" style="vertical-align: middle;">
                                    </span>
                                </li>
                                <li style="margin-bottom: 5px;">
                                    <span>committed, or been involved in the commission of war crimes or crimes against humanity or human rights?</span>
                                    <span style="display: inline-block; padding-left: 10px;">
                                        <label style="width: 20px;">No</label>
                                        <input type="radio" id="rblhavehumanrightscrimeNo" runat="server" name="" style="vertical-align: middle;">
                                        <label style="width: 30px; text-align: right;">Yes</label>
                                        <input type="radio" id="rblhavehumanrightscrimeYes" runat="server" name="" style="vertical-align: middle;">
                                    </span>
                                </li>
                                <li style="margin-bottom: 5px;">
                                    <span>been involved in any activities that would represent a risk to Australian national security?</span>
                                    <span style="display: inline-block; padding-left: 10px;">
                                        <label style="width: 20px;">No</label>
                                        <input type="radio" id="rblhaverisktonationalsecurityNo" runat="server" name="" style="vertical-align: middle;">
                                        <label style="width: 30px; text-align: right;">Yes</label>
                                        <input type="radio" id="rblhaverisktonationalsecurityYes" runat="server" name="" style="vertical-align: middle;">
                                    </span>
                                </li>
                                <li style="margin-bottom: 5px;">
                                    <span>had any outstanding debts to the Australian Government or any public authority in Australia?</span>
                                    <span style="display: inline-block; padding-left: 10px;">
                                        <label style="width: 20px;">No</label>
                                        <input type="radio" id="rblhaveoutstandingdebetsNo" runat="server" name="" style="vertical-align: middle;">
                                        <label style="width: 30px; text-align: right;">Yes</label>
                                        <input type="radio" id="rblhaveoutstandingdebetsYes" runat="server" name="" style="vertical-align: middle;">
                                    </span>
                                </li>
                                <li style="margin-bottom: 5px;">
                                    <span>been involved in any activity, or been convicted of any offence, relating to the illegal movement of people to any country (including Australia)? </span>
                                    <span style="display: inline-block; padding-left: 10px;">
                                        <label style="width: 20px;">No</label>
                                        <input type="radio" id="rblhaveconvictedoffenceNo" runat="server" name="" style="vertical-align: middle;">
                                        <label style="width: 30px; text-align: right;">Yes</label>
                                        <input type="radio" id="chkhaveconvictedoffenceYes" runat="server" name="" style="vertical-align: middle;">
                                    </span>
                                </li>
                                <li style="margin-bottom: 5px;">
                                    <span>served in a military force or state sponsored/private militia, undergone any military/paramilitary training, or been trained in weapons/explosives use (however described)? </span>
                                    <span style="display: inline-block; padding-left: 10px;">
                                        <label style="width: 20px;">No</label>
                                        <input type="radio" id="rblhaveservedinmilitaryforceNo" runat="server" name="" style="vertical-align: middle;">
                                        <label style="width: 30px; text-align: right;">Yes</label>
                                        <input type="radio" id="rblhaveservedinmilitaryforceYes" runat="server" name="" style="vertical-align: middle;">
                                    </span>
                                </li>
                            </ul>
                            <p class="txt">
                                If you answered ‘Yes’ to any of the above questions, you must state who it applies to and give ALL relevant details. If the matter relates to a criminal conviction, please give the nature of the offence, full details of sentence and dates of any period of imprisonment or other detention.
							<br>
                                <i>If insufficient space, attach an additional statement.</i><br>
                                <br>
                            </p>
                            <p>
                                <input type="text" id="descripofcharacterdeclaration" runat="server" name="" style="width: 100%;"><br>
                                <input type="text" name="" style="width: 100%;"><br>
                                <input type="text" name="" style="width: 100%;"><br>
                                <input type="text" name="" style="width: 100%;"><br>
                                <input type="text" name="" style="width: 100%;"><br>
                                <input type="text" name="" style="width: 100%;"><br>
                                <input type="text" name="" style="width: 100%;"><br>
                                <input type="text" name="" style="width: 100%;"><br>
                                <input type="text" name="" style="width: 100%;"><br>
                                <input type="text" name="" style="width: 100%;"><br>
                                <input type="text" name="" style="width: 100%;"><br>
                                <input type="text" name="" style="width: 100%;"><br>
                                <input type="text" name="" style="width: 100%;"><br>
                                <input type="text" name="" style="width: 100%;"><br>
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 50%; vertical-align: top; padding: 0 15px 0 30px;">
                            <h6 class="part-sub"><i>Accommodation/welfare arrangements for students under 18 years of age</i></h6>
                            <p class="txt"><span class="num-ques">58</span>Are you under 18 years of age?</p>
                            <p class="txt" style="margin-bottom: 5px;"><b>Note:</b> Depending on your Assessment Level, you may need to meet a minimum age or education standard requirement. Refer to information form 1219i <i>Overseas Student Program – Assessment Levels</i> and the department’s website for more details.</p>
                            <p class="txt" style="margin-bottom: 10px;">
                                <label style="width: 30px;">No</label><input id="rblunder18ageNo" runat="server" type="radio" name="" style="vertical-align: middle;"><i class="fas fa-caret-right" style="font-size: 18px; vertical-align: middle; margin-left: 3px;"></i> <span class="txt" style="vertical-align: middle;">Go to Question 68</span>
                                <br>
                                <label style="width: 30px;">Yes</label><input id="rblunder18ageYes" runat="server" type="radio" name="" style="vertical-align: middle;"><i class="fas fa-caret-right" style="font-size: 18px; vertical-align: middle; margin-left: 3px;"></i> <span class="txt" style="vertical-align: top;">Questions 59 (and either question 60, 61, 63 or 64) and the declaration at 65 must be completed on your behalf by your parents or a person(s) who has legal custody of you, as you are under 18 years of age. If your parents or a person(s) who has legal custody of you have not made adequate arrangements for your accommodation, support and general welfare while in Australia, a student visa cannot be granted. Evidence of their relationship to you must be provided.</span><br>
                            </p>
                            <p class="txt" style="margin-bottom: 5px;">
                                This question, and other questions as indicated, <b>must be completed by the parents, or person(s) who has legal custody of the applicant under 18 years of age.</b>
                            </p>
                            <p class="txt" style="margin-bottom: 5px;">Which statement best explains your situation?</p>
                            <p class="txt">
                                I am a parent or person who has legal custody of the student applicant and I am going to accompany the child to Australia. &nbsp;&nbsp;
                                <input type="radio" id="rblparentsituationNo" runat="server" style="vertical-align: middle;"><i class="fas fa-caret-right" style="font-size: 18px; vertical-align: middle; margin-left: 3px;"></i> <span class="txt" style="vertical-align: middle;">Go to Question 60</span>
                            </p>
                            <hr style="border-color: #000">
                            <p class="txt">
                                I am a parent or person who has legal custody of the student applicant and have made arrangements for the child to stay in Australia with a relative* who is 21 years of age or older. &nbsp;&nbsp;
                                <input type="radio" id="rblparentsituationYes" runat="server" style="vertical-align: middle;"><i class="fas fa-caret-right" style="font-size: 18px; vertical-align: middle; margin-left: 3px;"></i> <span class="txt" style="vertical-align: middle;">Go to Question 61</span>
                            </p>
                            <br>
                            <p>* A relative is defined under the Migration Regulations as a spouse, child, adopted child, parent, brother, sister, step-child, step-parent, step-brother, step-sister, grandparent, grandchild, aunt, uncle, niece or nephew, or a step-grandparent, step-grandchild, step-aunt, step-uncle, step-niece or step-nephew.</p>
                            <hr style="border-color: #000">
                            <p class="txt">
                                The student applicant will not be accompanied by either a parent or a person who has legal custody, and will not stay in Australia with a relative who is 21 years of age or older. &nbsp;&nbsp;
                                <input type="radio" id="rblparentsituationNot" runat="server" style="vertical-align: middle;"><i class="fas fa-caret-right" style="font-size: 18px; vertical-align: middle; margin-left: 3px;"></i> <span class="txt" style="vertical-align: middle;">Go to Question 64</span>
                            </p>
                        </td>
                        <td style="width: 50%; vertical-align: top; padding: 0 15px 0 30px;">
                            <p class="txt"><span class="num-ques">60</span> As the parent or a person who has legal custody of a student applicant under 18 years of age, do you hold or have you applied for a visa (eg. Student Guardian visa – subclass 580) to accompany your child during their stay in Australia? </p>
                            <p class="txt">
                                <label style="width: 30px;">No</label><input type="radio" id="rblholdorappliedVisaNo" runat="server" name="" style="vertical-align: middle;">
                                <br>
                                <label style="width: 30px;">Yes</label><input type="radio" id="rblholdorappliedVisaYes" runat="server" name="" style="vertical-align: middle;"><i class="fas fa-caret-right" style="font-size: 18px; vertical-align: middle; margin-left: 3px;"></i> <span class="txt" style="vertical-align: middle;">Please give your details below, then go to Question 65</span>
                            </p>
                            <hr style="border-color: #000">
                            <p class="txt">
                                <label style="width: 80px;">Family name </label>
                                <input type="text" id="parentfamilynamePartD" runat="server" name="" style="width: 250px; margin-bottom: 5px;"><br>
                                <label style="width: 80px;">Given names</label><input id="parentgivennamePartD" runat="server" type="text" name="" style="width: 250px;"><br>
                                <label style="width: 80px;"></label>
                                <input type="text" name="" style="width: 250px; margin-bottom: 5px;"><br>
                                <label style="width: 80px;">Date of birth</label><input type="text" id="parentDateofBirthpartD" runat="server" name="" style="width: 250px; font-size: 10px; margin-bottom: 10px;" placeholder="DAY / MONTH / YEAR"><br>
                            </p>
                            <p class="txt">
                                Your intended address in Australia<br>
                                <input type="text" id="parentaddresspartD" runat="server" name="" style="width: 100%;"><br>
                                <input type="text" name="" style="width: 100%;"><br>
                                <input type="text" name="" style="width: 100%;"><br>
                            </p>
                            <p class="txt">
                                Application:
                                <br>
                                Granted &nbsp;&nbsp;<input type="radio" id="rblparentvisastatusPartDYes" runat="server" name="" style="vertical-align: middle;"><i class="fas fa-caret-right" style="font-size: 18px; vertical-align: middle; margin-left: 3px;"></i><span class="txt" style="vertical-align: middle;">Visa label number</span>
                                <br>
                                <input type="text" name="" id="parentvisalabelno" runat="server" style="width: 100%;">
                                If granted a visa without a label, provide the 13-digit visa grant number (as shown on the letter notifying you of visa grant).
								<input type="text" id="parentvisadigitno" runat="server" name="" style="width: 100%;">
                            </p>
                            <p class="txt clearfix" style="margin-bottom: 10px;">
                                <span style="width: 48%; float: left;">Period of stay<br>
                                    <input type="text" id="parentvisaperiodofstay" runat="server" name="" style="width: 100%;">
                                </span>
                                <span style="width: 48%; float: right;">Expiry date <small style="font-size: 8px;">(DAY/MONTH/YEAR)</small><br>
                                    <input type="text" id="parentvisaexpirydate" runat="server" name="" style="width: 100%;">
                                </span>
                            </p>
                            <p class="txt" style="margin-bottom: 5px;">
                                Not yet decided  &nbsp;&nbsp;<input type="radio" id="rblparentvisastatusPartDNo" runat="server" name="" style="vertical-align: middle;"><i class="fas fa-caret-right" style="font-size: 18px; vertical-align: middle; margin-left: 3px;"></i><span class="txt" style="vertical-align: middle;">Australian Government office where application lodged </span>
                                <br>
                                <input type="text" id="parentvisaappliedgovtofficename" runat="server" name="" style="width: 100%;">
                            </p>
                            <p class="txt" style="margin-bottom: 10px;"><i class="fas fa-angle-double-right"></i>Now go to Question 65</p>
                            <p class="txt"><span class="num-ques">61</span> As the parents or a person(s) who has legal custody of a student applicant under 18 years of age, have you made arrangements with a relative who is at least 21 years of age and of good character with whom your child will stay in Australia?</p>
                            <p class="txt" style="margin-bottom: 10px;">
                                <label style="width: 30px;">No</label><input type="radio" id="rblhavearrangementwithrelativeNo" runat="server" name="" style="vertical-align: middle;">
                                <br>
                                <label style="width: 30px;">Yes</label><input type="radio" id="rblhavearrangementwithrelativeYes" runat="server" name="" style="vertical-align: middle;"><i class="fas fa-caret-right" style="font-size: 18px; vertical-align: middle; margin-left: 3px;"></i> <span class="txt" style="vertical-align: middle;">Please give details of the relative</span><br>
                            </p>
                            <p class="txt">
                                <label style="width: 80px;">Family name </label>
                                <input type="text" id="familyNameofrelative" runat="server" name="" style="width: 250px; margin-bottom: 5px;"><br>
                                <label style="width: 80px;">Given names</label><input id="givenNameofrelative" runat="server" type="text" name="" style="width: 250px;"><br>
                                <label style="width: 80px;"></label>
                                <input type="text" name="" style="width: 250px; margin-bottom: 5px;"><br>
                                <label style="width: 80px;">Date of birth</label><input id="dateOfBirthofrelative" runat="server" type="text" name="" style="width: 250px; font-size: 10px; margin-bottom: 10px;" placeholder="DAY / MONTH / YEAR"><br>
                            </p>
                            <p class="txt">
                                Your intended address in Australia<br>
                                <input type="text" id="addressofRelative" runat="server" name="" style="width: 100%;"><br>
                                <input type="text" name="" style="width: 100%;"><br>
                                <input type="text" name="" style="width: 100%; margin-bottom: 5px;"><br>
                            </p>
                            <p class="txt">
                                <label>Relationship of relative to the child</label>
                                <input type="text" id="relationshipofrelative" runat="server" name="" style="width: 100%; margin-bottom: 5px;">
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 50%; vertical-align: top; padding: 0 15px 0 30px;">
                            <p class="tx"><span class="num-ques">62</span>Will your relative reside in Australia as:</p>

                            <p class="txt" style="margin-bottom: 10px;">
                                <label style="width: 131px;">an Australian citizen or permanent resident</label><input type="radio" id="rblrelativeresideasstatusPerm" runat="server" name="" style="vertical-align: middle;">
                                <br>
                                <label style="width: 30px;">Yes</label><input type="radio" id="rblrelativeresideasstatusTemp" runat="server" name="" style="vertical-align: middle;"><i class="fas fa-caret-right" style="font-size: 18px; vertical-align: middle; margin-left: 3px;"></i> <span class="txt" style="vertical-align: middle;">How long are they permitted to stay in Australia?</span><br>
                                <input type="text" id="permitedtostayfor" runat="server" name="" style="width: 100%;">
                                <span style="display: block; text-align: center; line-height: 1.9">OR until</span>
                                <input type="text" id="permitedtostayDate" runat="server" name="" style="width: 100%; font-size: 10px;" placeholder="DAY / MONTH / YEAR">
                            </p>
                            <p class="txt">You <b>must</b> attach evidence:</p>
                            <ul class="txt">
                                <li>that your relative is of good character eg. police clearance; and</li>
                                <li>of your relative’s residence status in Australia.</li>
                            </ul>
                            <p class="txt"><span class="num-ques">63</span>Give details of your relative’s Student Guardian visa application?</p>
                            <p class="txt" style="margin-bottom: 10px;">
                                <label style="width: 80px;">Granted</label><input id="rblguardianvisasatusGranted" runat="server" type="radio" name="" style="vertical-align: middle;">
                                <br>
                                Visa label number
                                <br>
                                <input type="text" id="guardianvisano" runat="server" name="" style="width: 100%">
                                <span class="txt clearfix" style="margin-bottom: 10px; width: 100%; display: block;">
                                    <span style="width: 48%; float: left;">Period of stay<br>
                                        <input id="guardianvisaperiodofstay" runat="server" type="text" name="" style="width: 100%;">
                                    </span>
                                    <span style="width: 48%; float: right;">Expiry date <small style="font-size: 8px;">(DAY/MONTH/YEAR)</small><br>
                                        <input id="guardianvisaperiodofstayDate" runat="server" type="text" name="" style="width: 100%;">
                                    </span>
                                </span>
                                <label style="width: 104px;">Not yet decided</label><input id="rblkguardianvisasatusNot" runat="server" type="radio" name="" style="vertical-align: middle;"><i class="fas fa-caret-right" style="font-size: 18px; vertical-align: middle; margin-left: 3px;"></i> <span class="txt" style="vertical-align: middle;">
                                    <br>
                                    Australian Government office where application lodged</span><br>
                                <input type="text" id="govermentoffName" runat="server" name="" style="width: 100%; margin-bottom: 5px;">
                                <label style="width: 133px;">Period of stay sought </label>
                                <input type="text" id="periodofstayofguardian" runat="server" name="" style="width: 197px; margin-bottom: 5px;"><br>
                            </p>
                            <p class="txt" style="margin-bottom: 10px;"><i class="fas fa-angle-double-right"></i>Now go to Question 65</p>
                            <p class="txt"><span class="num-ques">64</span>As the parents or a person(s) who has legal custody of a student applicant under 18 years of age, who is neither being accompanied by you nor staying with a relative who is at least 21 years of age, have you obtained a written statement from your child’s education provider(s) that accommodation, support and general welfare arrangements for your child are appropriate?</p>
                            <p class="txt" style="margin-bottom: 10px;">
                                <label style="width: 30px;">No</label><input id="rblhavewelfarearrangementsNo" runat="server" type="radio" name="" style="vertical-align: middle;">
                                <br>
                                <label style="width: 30px;">Yes</label><input id="rblhavewelfarearrangementsYes" runat="server" type="radio" name="" style="vertical-align: middle;"><i class="fas fa-caret-right" style="font-size: 18px; vertical-align: middle; margin-left: 3px;"></i> <span class="txt" style="vertical-align: middle;">Please attach the original signed undertaking from the education provider</span><br>
                            </p>
                        </td>
                        <td style="width: 50%; vertical-align: top; padding: 0 15px 0 30px;">
                            <p class="txt" style="margin-bottom: 5px;"><span class="num-ques">65</span><i>I am satisfied with the reception, care and support arrangements that have been made in Australia for my dependent child under 18 years of age.</i></p>
                            <p class="txt" style="margin-bottom: 10px;"><b>Note: Both parents must sign this declaration</b></p>
                            <p class="txt">
                                <label style="width: 90px; font-weight: 600; vertical-align: top; padding-right: 10px;">Signature of parent/person who has legal custody </label>
                                <textarea id="parentsignature" runat="server" rows="4" style="width: 236px; margin-bottom: 5px;"></textarea>
                            </p>
                            <p class="txt">
                                <label style="width: 93px; text-align: right; padding-right: 10px;">Date</label><input id="parentsignatureDate" runat="server" type="text" name="" style="width: 236px; font-size: 10px; margin-bottom: 5px;" placeholder="DAY / MONTH / YEAR">
                            </p>
                            <p class="txt">
                                <label>Full name <i>(print in English)</i></label><br>
                                <input id="parentFullname" runat="server" type="text" name="" style="width: 100%; margin-bottom: 3px;">
                            </p>
                            <p class="txt">
                                <label>Relationship to student applicant</label><br>
                                <input id="parentRelationshipwithstudent" runat="server" type="text" name="" style="width: 100%; margin-bottom: 10px;">
                            </p>
                            <p class="txt">
                                <label style="width: 90px; font-weight: 600; vertical-align: top; padding-right: 10px;">Signature of parent/person who has legal custody </label>
                                <textarea id="parentsignature1" runat="server" rows="4" style="width: 236px; margin-bottom: 5px;"></textarea>
                            </p>
                            <p class="txt">
                                <label style="width: 93px; text-align: right; padding-right: 10px;">Date</label><input  id="parentsignatureDate1" runat="server" type="text" name="" style="width: 236px; font-size: 10px; margin-bottom: 5px;" placeholder="DAY / MONTH / YEAR">
                            </p>
                            <p class="txt">
                                <label>Full name <i>(print in English)</i></label><br>
                                <input id="parentFullname1" runat="server" type="text" name="" style="width: 100%; margin-bottom: 3px;">
                            </p>
                            <p class="txt">
                                <label>Relationship to student applicant</label><br>
                                <input id="parentRelationshipwithstudent1" runat="server" type="text" name="" style="width: 100%; margin-bottom: 10px;">
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 50%; vertical-align: top; padding: 0 15px 0 30px;">
                            <h6 class="part-sub"><i>Custody arrangements for students under 18 years of age</i></h6>
                            <p class="txt" style="margin-bottom: 5px;"><span class="num-ques">66</span>Do you have the <b>sole legal right</b> to determine where the applicant will live or to remove the applicant from their country of usual residence?</p>
                            <p class="txt">
                                <label style="width: 30px;">No</label><input type="radio" id="rblhavesolelegalrightsNo" runat="server" name="" style="vertical-align: middle;"><i class="fas fa-caret-right" style="font-size: 18px; vertical-align: middle; margin-left: 3px;"></i> <span class="txt" style="vertical-align: middle;">Provide details of ALL other people who have custody, access or guardianship rights in relation to the applicant</span>
                                <br>
                                <i style="margin: 8px 0; display: block;">If there is more than one person, please attach details.</i>
                            </p>
                            <p class="txt" style="margin-bottom: 8px;">
                                <label>Name</label>
                                <input type="text" id="personname" runat="server" name="" style="width: 100%; margin-bottom: 4px;">
                                <label>Residential address</label>
                                <input type="text" id="personaddress" runat="server" name="" style="width: 100%;">
                                <input type="text" name="" style="width: 100%;">
                                <input type="text"  name="" style="width: 100%; margin-bottom: 4px;">
                                <label>Telephone Number</label>
                                <input type="text" id="personcontactno" runat="server" name="" style="width: 100%; font-size: 9px; margin-bottom: 4px; height: 25px;" placeholder="( COUNTRY CODE ) ( AREA CODE )      Number ">
                                <label>Relationship to student visa applicant </label>
                                <input type="text" id="personrelationship" runat="server" name="" style="width: 100%; margin-bottom: 4px;">
                                <label>Nature of legal right</label>
                                <input type="text" id="personnatureoflegalrights" runat="server" name="" style="width: 100%;">
                            </p>
                            <p class="txt" style="margin-bottom: 8px;">Nature of legal right</p>
                            <p class="txt" style="margin-bottom: 8px;">All other people who have custody, access or guardianship rights in relation to the applicant must also sign the declaration at Question 67.</p>
                            <p class="txt"><i>If any of these people are unable to complete the declaration at Question 67 for any reason, you must attach a statutory declaration from them giving permission for the applicant to travel to Australia as a student.</i></p>
                            <hr style="border-color: #000">
                            <label style="width: 30px;">Yes</label><input type="radio" id="rblhavesolelegalrightsYes" runat="server" name="" style="vertical-align: middle;"><i class="fas fa-caret-right" style="font-size: 18px; vertical-align: middle; margin-left: 3px;"></i> <span class="txt" style="vertical-align: middle;">Complete the declaration at Question 67</span>
                        </td>
                        <td style="width: 50%; vertical-align: top; padding: 0 15px 0 30px;">
                            <p class="txt" style="margin-bottom: 10px;">
                                <span class="num-ques">67</span> <b>Declaration by the parent(s) or person(s) with legal custody of a student visa applicant under 18 years of age</b><br>
                                <i>I am not aware of any reason why the visa applicant should not travel to Australia (the custody/access/guardianship rights of another person are not affected).</i>
                            </p>
                            <p class="txt">
                                <label style="width: 90px; font-weight: 600; vertical-align: top; padding-right: 10px;">Signature of parent/person who has legal custody </label>
                                <textarea id="parentsignatur67" runat="server" rows="4" style="width: 236px; margin-bottom: 5px;"></textarea>
                            </p>
                            <p class="txt">
                                <label style="width: 93px; text-align: right; padding-right: 10px;">Date</label><input id="signDate" runat="server" type="text" name="" style="width: 236px; font-size: 10px; margin-bottom: 5px;" placeholder="DAY / MONTH / YEAR">
                            </p>
                            <p class="txt">
                                <label>Full name <i>(print in English)</i></label><br>
                                <input id="fullname67" runat="server" type="text" name="" style="width: 100%; margin-bottom: 3px;">
                            </p>
                            <p class="txt">
                                <label>Relationship to student applicant</label><br>
                                <input id="relationship67" runat="server" type="text" name="" style="width: 100%; margin-bottom: 10px;">
                            </p>
                            <hr style="border-color: #000">
                            <p class="txt">
                                <label style="width: 90px; font-weight: 600; vertical-align: top; padding-right: 10px;">Signature of parent/person who has legal custody </label>
                                <textarea id="parentsignatur671" runat="server"  rows="4" style="width: 236px; margin-bottom: 5px;"></textarea>
                            </p>
                            <p class="txt">
                                <label style="width: 93px; text-align: right; padding-right: 10px;">Date</label><input id="signDate1" runat="server" type="text" name="" style="width: 236px; font-size: 10px; margin-bottom: 5px;" placeholder="DAY / MONTH / YEAR">
                            </p>
                            <p class="txt">
                                <label>Full name <i>(print in English)</i></label><br>
                                <input id="fullname671" runat="server" type="text" name="" style="width: 100%; margin-bottom: 3px;">
                            </p>
                            <p class="txt">
                                <label>Relationship to student applicant</label><br>
                                <input id="relationship671" runat="server" type="text" name="" style="width: 100%; margin-bottom: 10px;">
                            </p>
                            <p class="txt"><i>If more than 2 people have custody, access or guardianship rights in relation to the applicant, please attach a statutory declaration from them giving permission for the applicant to travel to Australia as a student.</i></p>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 50%; vertical-align: top; padding: 0 15px 0 30px;">
                            <h6 class="part-sub"><i>Assistance with this form</i></h6>
                            <p class="txt"><span class="num-ques">68</span> Did you receive assistance in completing this form?</p>
                            <p class="txt">
                                <label style="width: 30px;">No</label><input id="rblhavereceiveassistanceNo" runat="server" type="radio" name="" style="vertical-align: middle;">
                                <i class="fas fa-caret-right" style="font-size: 18px; vertical-align: middle; margin-left: 3px;"></i><span class="txt" style="vertical-align: middle;">Go to Question 73</span><br>
                                <label style="width: 30px;">Yes</label><input id="rblhavereceiveassistanceYes" runat="server" type="radio" name="" style="vertical-align: middle;"><i class="fas fa-caret-right" style="font-size: 18px; vertical-align: middle; margin-left: 3px;"></i> <span class="txt" style="vertical-align: middle;">Please give details of the person who assisted you</span>
                            </p>
                            <p class="txt">
                                Title: Mr
                                <input  id="rblTitleMr" runat="server"  type="radio" name="Title" style="vertical-align: middle; margin-right: 10px;">
                                Mrs
                                <input id="rblTitleMrs" runat="server"  type="radio" name="Title" style="vertical-align: middle; margin-right: 10px;">
                                Miss
                                <input id="rblTitleMiss" runat="server"  type="radio" name="Title" style="vertical-align: middle; margin-right: 10px;">
                                Ms
                                <input id="rblTitleMs" runat="server"  type="radio" name="Title" style="vertical-align: middle; margin-right: 10px;">
                                Other
                                <input id="rblTitleOther" runat="server"  type="radio" name="Title" style="vertical-align: middle; margin-right: 10px;">
                            </p>
                            <p class="txt" style="margin-bottom: 8px;">
                                <label style="width: 80px;">Family name</label><input id="assistedpersonfamilyname" runat="server" type="text" name="" style="width: 250px; margin-bottom: 5px;"><br>
                                <label style="width: 80px;">Given names </label>
                                <input type="text" name="" id="assistedpersongivenname" runat="server" style="width: 250px; margin-bottom: 5px;"><br>
                                <label>Address</label>
                                <input type="text" id="assistedpersonaddress" runat="server" name="" style="width: 100%;">
                                <input type="text" name="" style="width: 100%;">
                                <input type="text"  name="" style="width: 100%;">
                            </p>
                            <p class="txt" style="margin-bottom: 10px;">
                                <label>Telephone number or daytime contact</label><br>
                                <label style="width: 80px;">Office hours </label>
                                <input type="text" id="assistedpersonofficeno" runat="server" name="" style="width: 250px; font-size: 9px; margin-bottom: 5px; height: 25px;" placeholder="( COUNTRY CODE ) ( AREA CODE )      Number ">
                                <label style="width: 80px;">Mobile phone</label><input id="assistedpersonmobileno" runat="server" type="text" name="" style="width: 250px; margin-bottom: 5px;">
                            </p>
                            <p class="txt" style="margin-bottom: 10px;">
                                <span class="num-ques">69</span>Is your agent registered with the Migration Agents Registration Authority (MARA)?
                            </p>
                            <p class="txt" style="margin-bottom: 10px;">
                                <label style="width: 30px;">No</label><input type="radio" id="rblisregisteredwithMARANo" runat="server" name="" style="vertical-align: middle;">
                                <br>
                                <label style="width: 30px;">Yes</label><input type="radio" id="rblisregisteredwithMARAYes" runat="server" name="" style="vertical-align: middle;"><i class="fas fa-caret-right" style="font-size: 18px; vertical-align: middle; margin-left: 3px;"></i> <span class="txt" style="vertical-align: middle;">Go to Question 73</span><br>
                            </p>
                            <p class="txt">
                                <span class="num-ques">70</span>Is the person an education agent?
                            </p>
                            <p class="txt" style="margin-bottom: 10px;">
                                <label style="width: 30px;">No</label><input type="radio" id="rblhaveeducationagentNo" runat="server"  name="" style="vertical-align: middle;">
                                <br>
                                <label style="width: 30px;">Yes</label><input type="radio" id="rblhaveeducationagentYes" runat="server"  name="" style="vertical-align: middle;"><i class="fas fa-caret-right" style="font-size: 18px; vertical-align: middle; margin-left: 3px;"></i> <span class="txt" style="vertical-align: middle;">Please give details below </span>
                                <br>
                                <label>Education Agency Business Name</label>
                                <input type="text" id="businessname" runat="server" name="" style="width: 100%; margin-bottom: 5px;">
                                <label>Education Agent Registration Number <i>(if known)</i></label>
                                <input type="text" id="registrationno" runat="server" name="" style="width: 100%; margin-bottom: 5px;">
                                <label>Address <i>(if different from address given in Question 68)</i></label>
                                <input type="text" id="educationagentaddress" runat="server" name="" style="width: 100%">
                                <input type="text" name="" style="width: 100%">
                                <input type="text"  name="" style="width: 100%; margin-bottom: 5px;">
                                <label>E-mail address</label>
                                <input type="text" id="educationagentemail" runat="server" name="" style="width: 100%; margin-bottom: 5px;">
                                <label>Telephone number or daytime contact </label>
                                <label>Office hours</label>
                                <input type="text" id="educationagentofficeno" runat="server" name="" style="width: 100%; font-size: 9px; margin-bottom: 4px; height: 25px;" placeholder="( COUNTRY CODE ) ( AREA CODE )      Number ">
                                <label>Mobile phone</label>
                                <input type="text" name="" id="educationagentphoneno" runat="server" style="width: 100%; margin-bottom: 5px;">
                                <label>Fax Number</label>
                                <input type="text" name="" id="educationagentfaxno" runat="server" style="width: 100%; font-size: 9px; height: 25px;" placeholder="( COUNTRY CODE ) ( AREA CODE )      Number ">
                            </p>

                            <p class="txt"><span class="num-ques">71</span>Is your agent in Australia?</p>
                            <p class="txt" style="margin-bottom: 10px;">
                                <label style="width: 30px;">No</label><input id="rblhaveagentinaustraliaNo" runat="server" type="radio" name="" style="vertical-align: middle;"><i class="fas fa-caret-right" style="font-size: 18px; vertical-align: middle; margin-left: 3px;"></i> <span class="txt" style="vertical-align: middle;">Go to Question 73 </span>
                                <br>
                                <label style="width: 30px;">Yes</label><input id="rblhaveagentinaustraliaYes" runat="server" type="radio" name="" style="vertical-align: middle;"><br>
                            </p>

                        </td>
                        <td style="width: 50%; vertical-align: top; padding: 0 15px 0 30px;">
                            <p class="txt"><span class="num-ques">72</span>Did you pay the person and/or give a gift for this assistance? </p>
                            <p class="txt" style="margin-bottom: 10px;">
                                <label style="width: 30px;">No</label><input id="rblhavepaytoassistanceNo" runat="server" type="radio" name="" style="vertical-align: middle;">
                                <br>
                                <label style="width: 30px;">Yes</label><input id="rblhavepaytoassistanceYes" runat="server" type="radio" name="" style="vertical-align: middle;"><i class="fas fa-caret-right" style="font-size: 18px; vertical-align: middle; margin-left: 3px;"></i> <span class="txt" style="vertical-align: middle;">How much did you pay?</span><br>
                                <input type="text" id="howmuchyoupay" runat="server" name="" style="width: 250px;" placeholder="A$">
                                <span style="width: 80px;">AND / OR</span>
                                <label style="margin-top: 4px;">What kind of gift did you give? (eg. jewellery)</label>
                                <input type="text"  id="giftgiven" runat="server" name="" style="width: 100%; margin-bottom: 5px;">
                                <label>Value of gift (approximately)</label>
                                <input type="text"  id="valueofgift" runat="server" name="" style="width: 100%;" placeholder="A$">
                            </p>
                            <h6 class="part-sub"><i>Options for receiving written communications</i></h6>
                            <p class="txt">
                                <span class="num-ques">73</span>All written communications about this application should be sent to:<i>(Tick one box only)</i>
                            </p>
                            <p class="txt" style="margin-bottom: 10px;">
                                <label>Myself</label><input type="radio" id="rblhavewrittencommunicationsMyself" runat="server" name="" style="vertical-align: middle;"><i class="fas fa-caret-right" style="font-size: 18px; vertical-align: middle; margin-left: 3px;"></i> <span class="txt" style="vertical-align: middle;">All written communications will be sent to the address for communications that you have provided in this form. Go to Question 81 </span>
                                <br>
                                <label>Australian registered migration agent</label><input id="rblhavewrittencommunicationsMigrationagent" runat="server" type="radio" name="" style="vertical-align: middle;"><i class="fas fa-caret-right" style="font-size: 18px; vertical-align: middle; margin-left: 3px;"></i> <span class="txt" style="vertical-align: middle;">Go to Question 78</span><br>
                                <label>Offshore agent</label><input type="radio" id="rblhavewrittencommunicationsOffshoreagent" runat="server" name="" style="vertical-align: middle;"><i class="fas fa-caret-right" style="font-size: 18px; vertical-align: middle; margin-left: 3px;"></i> <span class="txt" style="vertical-align: middle;">Go to Question 78</span><br>
                                <label>Agent exempted from registration</label><input type="radio" id="rblhavewrittencommunicationsAgentExmpted" runat="server" name="" style="vertical-align: middle;"><i class="fas fa-caret-right" style="font-size: 18px; vertical-align: middle; margin-left: 3px;"></i> <span class="txt" style="vertical-align: middle;">You must complete form 956 Appointment <i>of a migration agent </i>and attach it to this application form. Go to Question 81</span><br>
                                <label>Authorised recipient</label><i class="fas fa-caret-right" style="font-size: 18px; vertical-align: middle; margin-left: 3px;"><input type="radio" id="rblhavewrittencommunicationsAuthorised" runat="server" name="" style="vertical-align: middle;"></i> <span class="txt" style="vertical-align: middle;">This is a person authorised to only receive written communications. All written communications that would otherwise have been sent to you in relation to this application will be sent to that person.</span>
                            </p>
                            <p class="txt"><span>74</span> Do you want the authorised person to receive health and/or character information about you, your spouse or your dependants, that may arise, or be revealed, in the course of this application (for example, requests for medical investigation, other health information about you, or the results of criminal history checks)?</p>
                            <p class="txt" style="margin-bottom: 10px;">
                                <label style="width: 30px;">No</label><input id="rblhaveauthorisedpersonNo" runat="server" type="radio" name="" style="vertical-align: middle;">
                                <br>
                                <label style="width: 30px;">Yes</label><input id="rblhaveauthorisedpersonYes" runat="server" type="radio" name="" style="vertical-align: middle;"><br>
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 50%; vertical-align: top; padding: 0 15px 0 30px;">
                            <h6 class="part-sub"><i>Authorised recipient details</i></h6>
                            <p class="txt" style="margin-bottom: 8px;"><b>Note:</b> Do NOT complete this section if you are acting as a migration agent, go to Question 78</p>
                            <p class="txt" style="margin-bottom: 5px;"><span class="num-ques">75</span> Provide details of the person who is authorised on your behalf to receive all written communications about this application.</p>
                            <p class="txt" style="margin-bottom: 5px;">
                                Title: Mr
                                <input type="radio" id="rblauthorisedTitleMr" runat="server" name="authorisedTitle" style="vertical-align: middle; margin-right: 10px;">
                                Mrs
                                <input type="radio" id="rblauthorisedTitleMrs" runat="server" name="authorisedTitle" style="vertical-align: middle; margin-right: 10px;">
                                Miss
                                <input type="radio" id="rblauthorisedTitleMiss" runat="server" name="authorisedTitle" style="vertical-align: middle; margin-right: 10px;">
                                Ms
                                <input type="radio" id="rblauthorisedTitleMs" runat="server" name="authorisedTitle" style="vertical-align: middle; margin-right: 10px;">
                                Other
                                <input type="radio" id="rblauthorisedTitleOther" runat="server" name="authorisedTitle" style="vertical-align: middle; margin-right: 10px;">
                            </p>
                            <p class="txt" style="margin-bottom: 8px;">
                                <label style="width: 80px;">Family name</label><input type="text" id="authorisedpersofamilynname" runat="server" name="" style="width: 250px; margin-bottom: 5px;"><br>
                                <label style="width: 80px;">Given names </label>
                                <input type="text" name="" id="authorisedpersongivenname" runat="server" style="width: 250px; margin-bottom: 5px;"><br>
                                <label>Authorised recipient’s postal address</label>
                                <input type="text" id="authorisedpersonaddress" runat="server" name="" style="width: 100%;">
                                <input type="text" name="" style="width: 100%;">
                                <input type="text" name="" style="width: 100%;">
                            </p>
                            <p class="txt" style="margin-bottom: 10px;">
                                <label>Telephone number or daytime contact</label><br>
                                <label style="width: 80px;">Office hours </label>
                                <input type="text" id="authorisedpersonofficeno" runat="server" name="" style="width: 250px; font-size: 9px; margin-bottom: 5px; height: 25px;" placeholder="( COUNTRY CODE ) ( AREA CODE )      Number ">
                                <label style="width: 80px;">Mobile phone</label><input type="text" id="authorisedpersonmobileno" runat="server" name="" style="width: 250px; margin-bottom: 5px;">
                            </p>
                            <h6 class="part-sub"><i>Authorised recipient consent</i></h6>
                            <p class="txt"><span class="num-ques">76</span>As the authorised recipient named on this form, do you agree to the department communicating with you by fax, e-mail or other electronic means?</p>
                            <p class="txt" style="margin-bottom: 8px;">
                                <label style="width: 30px;">No</label><input type="radio" id="rblhaveagreetocommunicateNo" runat="server" name="" style="vertical-align: middle;"><br>
                                <label style="width: 30px;">Yes</label><input type="radio" id="rblhaveagreetocommunicateYes" runat="server" name="" style="vertical-align: middle;"><i class="fas fa-caret-right" style="font-size: 18px; vertical-align: middle; margin-left: 3px;"></i> <span class="txt" style="vertical-align: middle;">GGive details</span>
                                <br>
                            </p>
                            <p class="txt" style="margin-bottom: 10px;">
                                <label style="width: 80px;">Fax number</label>
                                <input type="text" id="Faxnumber" runat="server" name="" style="width: 250px; margin-bottom: 5px;" placeholder="( COUNTRY CODE ) ( AREA CODE )      Number ">
                                <label style="width: 80px;">E-mail address</label>
                                <input type="text" id="authorizedpersonEmailaddress" runat="server" name="" style="width: 250px; margin-bottom: 5px;">
                            </p>
                            <p class="txt" style="margin-bottom: 8px;">
                                <span class="num-ques">77</span><i>I understand and accept that I am the person appointed by the applicant to receive all written communications.</i>
                            </p>
                            <p class="txt">
                                <label style="width: 90px; font-weight: 600; vertical-align: top; padding-right: 10px;">Signature of authorised recipient</label>
                                <textarea id="signatureauthorizedperson" runat="server"   rows="4" style="width: 236px; margin-bottom: 5px;"></textarea>
                            </p>
                            <p class="txt" style="margin-bottom: 8px;">
                                <label style="width: 93px; text-align: right; padding-right: 10px;">Date</label><input id="dateofsign" runat="server"  type="text" name="" style="width: 236px; font-size: 10px; margin-bottom: 5px;" placeholder="DAY / MONTH / YEAR">
                            </p>
                            <p class="txt" style="margin-bottom: 10px;"><i class="fas fa-angle-double-right"></i>Now go to Question 81</p>
                        </td>
                        <td style="width: 50%; vertical-align: top; padding: 0 15px 0 30px;">
                            <h6 class="part-sub"><i>Agent details</i></h6>
                            <p class="txt" style="margin-bottom: 5px;"><span class="num-ques">78</span> Provide the details requested below about the agent who is authorised to act on your behalf and to receive all written communications about this application.</p>
                            <p class="txt">
                                <label style="width: 180px;">Migration Agent Registration Number (MARN)</label>
                                <input type="text" id="migratioagentNo" runat="server" name="" style="width: 40px;" placeholder="     :    ">
                                <input type="" name="" style="width: 103px;" placeholder="     :      :     :     :    ">
                            </p>
                            <p class="txt">OR</p>
                            <p class="txt" style="margin-bottom: 8px;">
                                <label style="width: 180px;">Offshore Agent ID Number (if allocated by the department) </label>
                                <input type="text" id="offshoreagentId" runat="server" name="" style="width: 40px;" placeholder="     :    ">
                                <input type="" name="" style="width: 103px;" placeholder="     :      :     :     :    ">
                            </p>
                            <p class="txt" style="margin-bottom: 5px;">
                                Title: Mr
                                <input type="radio" id="rblagentTitleMr" runat="server" name="agentTitle" style="vertical-align: middle; margin-right: 10px;">
                                Mrs
                                <input type="radio" id="rblagentTitleMrs" runat="server" name="agentTitle" style="vertical-align: middle; margin-right: 10px;">
                                Miss
                                <input type="radio" id="rblagentTitleMiss" runat="server" name="agentTitle" style="vertical-align: middle; margin-right: 10px;">
                                Ms
                                <input type="radio" id="rblagentTitleMs" runat="server" name="agentTitle" style="vertical-align: middle; margin-right: 10px;">
                                Other
                                <input type="radio" id="rblagentTitleOther" runat="server" name="agentTitle" style="vertical-align: middle; margin-right: 10px;">
                            </p>
                            <p class="txt" style="margin-bottom: 5px;">
                                <label style="width: 80px;">Family name</label><input type="text" id="agentfamilyname" runat="server" name="" style="width: 250px; margin-bottom: 5px;"><br>
                                <label style="width: 80px;">Given names</label><input type="text" id="agentgivenname" runat="server" name="" style="width: 250px; margin-bottom: 5px;"><br>
                                <label style="width: 80px;">Business or company name</label><input id="agentcompanyname" runat="server" type="text" name="" style="width: 250px; margin-bottom: 5px;"><br>
                                <label>Postal Address</label>
                                <input type="text" id="agenntaddress" runat="server" name="" style="width: 100%;">
                                <input type="text" name="" style="width: 100%;">
                                <input type="text" name="" style="width: 100%;">
                            </p>
                            <p class="txt" style="margin-bottom: 10px;">
                                <label>Telephone number or daytime contact</label><br>
                                <label style="width: 80px;">Office hours </label>
                                <input type="text" id="agentofficeno" runat="server" name="" style="width: 250px; font-size: 9px; margin-bottom: 5px; height: 25px;" placeholder="( COUNTRY CODE ) ( AREA CODE )      Number ">
                                <label style="width: 80px;">Mobile phone</label><input type="text" id="agentmobileno" runat="server" name="" style="width: 250px; margin-bottom: 5px;">
                            </p>
                            <h6 class="part-sub"><i>Agent consent</i></h6>
                            <p class="txt"><span class="num-ques">79</span>As the agent named on this form, do you agree to the department communicating with you by fax, e-mail or other electronic means? </p>
                            <p class="txt" style="margin-bottom: 8px;">
                                <label style="width: 30px;">No</label><input id="rblagentagreetocommunicateNo" runat="server" type="radio" name="" style="vertical-align: middle;"><br>
                                <label style="width: 30px;">Yes</label><input id="rblagentagreetocommunicateYes" runat="server" type="radio" name="" style="vertical-align: middle;"><i class="fas fa-caret-right" style="font-size: 18px; vertical-align: middle; margin-left: 3px;"></i> <span class="txt" style="vertical-align: middle;">Give details</span>
                                <br>
                            </p>
                            <p class="txt" style="margin-bottom: 10px;">
                                <label style="width: 80px;">Fax number</label>
                                <input type="text" id="agentfaxno" runat="server" name="" style="width: 250px; margin-bottom: 5px;" placeholder="( COUNTRY CODE ) ( AREA CODE )      Number ">
                                <label style="width: 80px;">E-mail address</label>
                                <input type="text" name="" id="agentemailaddress" runat="server" style="width: 250px; margin-bottom: 5px;">
                            </p>
                            <p class="txt" style="margin-bottom: 10px;"><span class="num-ques">80</span><i>I understand and accept that I am the person appointed by the applicant to receive all written communications and act as his/her agent.</i></p>
                            <p class="txt">
                                <label style="width: 90px; font-weight: 600; vertical-align: top; padding-right: 10px;">Signature of agent </label>
                                <textarea id="agentsignature" runat="server" rows="4" style="width: 236px; margin-bottom: 5px;"></textarea>
                            </p>
                            <p class="txt">
                                <label style="width: 93px; text-align: right; padding-right: 10px;">Date</label><input id="agentsigndate" runat="server" type="text" name="" style="width: 236px; font-size: 10px; margin-bottom: 5px;" placeholder="DAY / MONTH / YEAR">
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 50%; vertical-align: top; padding: 0 15px 0 30px;">
                            <h6 class="part-sub"><i>Payment details</i></h6>
                            <p class="txt">
                                <span class="num-ques">81</span> How will you pay your application charge? <em>(If applying in Australia, debit card or credit card are the preferred methods of payment.) </em>
                                <br>
                                <label style="width: 90px;">Bank cheque</label>
                                <input type="radio" id="rblpaymentmethodBankCheque" runat="server" name="" style="vertical-align: middle;">
                                <i class="fas fa-caret-right" style="font-size: 18px; vertical-align: middle; margin-left: 3px;"></i><span class="txt" style="vertical-align: middle;">If applying outside Australia, please check with 
              the Australian Government office where you intend to lodge your application that you may pay by cheque. </span>
                                <br>
                                <label style="width: 90px;">Money order</label>
                                <input type="radio" id="rblpaymentmethodMoneyOrder" runat="server" name="" style="vertical-align: middle;">
                                <br>
                                <label style="width: 90px;">Debit card </label>
                                <input type="radio" name="" id="rblpaymentmethodDC" runat="server" style="vertical-align: middle;">
                                <i class="fas fa-caret-right" style="font-size: 18px; vertical-align: middle; margin-left: 3px;"></i><span class="txt" style="vertical-align: middle;">This option is available in Australia only. It is 
              not available for mailed applications. </span>
                                <br>
                                <label style="width: 90px;">Credit card </label>
                                <input type="radio" name="" id="rblpaymentmethodCC" runat="server" style="vertical-align: middle;">
                                <i class="fas fa-caret-right" style="font-size: 18px; vertical-align: middle; margin-left: 3px;"></i><span class="txt" style="vertical-align: middle;">Give details below.
                                    <br>
                                    <strong>Note:</strong> This option is available where applications are made in Australia. If you are making the application outside Australia and wish to pay by credit card, please check with the Australian Government office about the availability of this option. </span>
                            </p>
                            <p class="txt" style="font-size:12px;">
                                <span style="border: 1px solid #000; margin-right: 5px; display: inline-block; width: 250px; padding: 5px;">
                                    <label>Payment by (tick one box)</label><br>
                                    <label style="text-align: right; width: 125px;">
                                        Master Card
                                        <input type="radio" id="rblpaymentbyMC" runat="server" name="" style="float: right; vertical-align: middle; margin-left: 10px;"></label>
                                    <label style="text-align: right; width: 109px;">
                                        Visa
                                        <input type="radio" id="rblpaymentVI" runat="server" name="" style="float: right; vertical-align: middle; margin-left: 10px;"></label>
                                    <label style="text-align: right; width: 125px;">
                                        Bankcard
                                        <input type="radio" id="rblpaymentbyBC" runat="server" name="" style="float: right; vertical-align: middle; margin-left: 10px;"></label>
                                    <label style="text-align: right; width: 109px;">Diners Club<input type="radio" id="rblpaymentbyDC" runat="server" name="" style="float: right; vertical-align: middle; margin-left: 10px;"></label>
                                    <label style="text-align: left; width: 125px;">
                                        American Express
                                        <input type="radio" id="rblpaymentbyAM" runat="server" name="" style="float: right; vertical-align: middle; margin-left: 7px;"></label>
                                    <label style="text-align: right; width: 109px;">JCB<input type="radio" id="rblpaymentbyJCB" runat="server" name="" style="float: right; vertical-align: middle; margin-left: 10px;"></label>
                                </span>
                                <span style="display: inline-block; border: 1px solid #000; padding: 5px; width: 99px; height: 88px; vertical-align: bottom;">
                                    <label>Australian Dollars</label><br>
                                    <input type="text" id="amountinaustraliandollars" runat="server" name="" style="width: 100%;" placeholder="A$">
                                </span>
                            </p>

                            <p class="txt" style="margin-bottom: 10px; margin-top: 10px;">
                                <label style="width: 100%;">Credit Card number</label>
                                <input type="text" id="creditcardno" runat="server" name="" style="width: 100%; margin-bottom: 5px;">
                            </p>
                            <p class="txt" style="margin-bottom: 10px; margin-top: 10px;">
                                <label style="width: 100%;">Cardholder's number</label>
                                <input type="text" id="contactnumber" runat="server" name="" style="width: 100%; margin-bottom: 5px;">
                            </p>
                            <p class="txt" style="margin-bottom: 10px; margin-top: 10px;">
                                <label style="width: 100%;">Expirydate</label>
                                <input type="text" id="creditcardexpirydate" runat="server" name="" style="width: 100%; margin-bottom: 5px;">
                            </p>
                            <p class="txt" style="margin-bottom: 10px; margin-top: 10px;">
                                <label style="width: 100%;">Cardholder's Name</label>
                                <input type="text" id="cardholdarname" runat="server" name="" style="width: 100%; margin-bottom: 5px;">
                            </p>
                            <p class="txt" style="margin-bottom: 8px;">
                                <label>Address</label>
                                <input type="text" id="addressofcardholder" runat="server" name="" style="width: 100%;">
                                <input type="text" name="" style="width: 100%;">
                                <input type="text" name="" style="width: 100%;" placeholder="PINCODE">
                            </p>
                            <p class="txt">
                                <label style="width: 90px; font-weight: 600; vertical-align: top; padding-right: 10px; margin-top: 30px;">Signature of Cardholder </label>
                                <textarea rows="4" id="signatureofcardholder" runat="server" style="width: 236px; margin-bottom: 5px; resize: none;"></textarea>
                            </p>
                            <p class="txt" style="margin-bottom: 10px;">Credit card information will be used for charge paying purposes only. </p>
                        </td>
                        <td style="width: 50%; vertical-align: top; padding: 0 15px 0 30px;"></td>
                    </tr>
                    <tr>
                        <td style="width: 50%; vertical-align: top; padding: 0 15px 0 30px;">
                            <h6 class="part-sub"><i>Declaration </i></h6>
                            <strong>Before signing the declaration refer to the department’s website to ensure that you have attached all documentation listed for your Assessment Level and Education Sector visa subclass. </strong>
                            <br>
                            <p class="txt" style="margin-top: 10px;">
                                <span class="num-ques">82</span> The following declaration must be signed and dated by all people over 
              18 years of age included in this application.
                                <br>
                                <br>
                                Both parents or any person who has legal custody must complete the declaration on behalf of any children under 18 years of age or any person who lacks the legal capacity to sign on their own behalf.
                                <br>

                                <ul style="padding-left: 0px; font-size: 12px; margin-top: 20px;">
                                    <li style="margin-bottom: 5px;"><em>I certify the information supplied on or with this form is correct. </em></li>
                                    <li style="margin-bottom: 5px;"><em>If granted a visa, I acknowledge that I am required to abide by its conditions as outlined in the information form 1160i Applying for a student visa.</em></li>
                                    <li style="margin-bottom: 5px;"><em>I declare that I have made adequate arrangements for health insurance for the period of my stay in Australia and I acknowledge that I am required to maintain these arrangements while in Australia as the holder of a student visa.</em> </li>
                                    <li style="margin-bottom: 5px;"><em>I have attached all documentary evidence as specified on the department’s website for my Assessment Level and the visa subclass under which I am applying. </li>
                                    <li style="margin-bottom: 5px;"><em>I acknowledge that I understand that if the 8534 visa condition is imposed on my visa, it will be indicated by the condition code ‘8534’ and by the short description ‘No Further Stay’. I acknowledge that this means that the 8534 condition has been imposed on my visa and that I will not, while in Australia, be entitled to the grant of any other visa 1, apart from:<br>
                                        <ul style="padding-left: 0px; list-style: none;">
                                            <li>– a further student visa with permission to work, the application for 
                    which was made on form 157P; or</li>
                                            <li>– a  subclass 497 (Graduate–Skilled) visa.</li>
                                    </em>
                                </ul>
                                </li>
              <li style="margin-bottom: 5px;"><em>I understand that the effect of the 8534 visa condition is that it will not be possible for me to apply to remain in Australia beyond the date authorised by my visa1 and that I will be required to depart Australia on or before that date. I agree to having this condition included on any visa issued to me as a result of this application if the department decides to impose it as a condition of grant of a visa. </em></li>
                                <li>I acknowledge that I understand that if the 8535 visa condition is imposed on my visa, it will be indicated by the condition code ‘8535’ and by the short description ‘No Further Stay’. I acknowledge that this means that the 8535 condition has been imposed on my visa and that I will not, while in Australia, be entitled to be granted any other visa 1, apart from:
                <ul style="padding-left: 0px; list-style: none;">
                    <li>– a further student visa with permission to work, the application for 
                    which was made on form 157P; or</li>
                    <li>
                    – a  subclass 497 (Graduate–Skilled) visa.– a further student visa, with the consent of my sponsor.</em>
                </ul>
                                </li>
                                <li style="margin-bottom: 5px; margin-top: 5px;"><em>I understand that the effect of the 8535 visa condition is that it will not be possible for me to remain in Australia beyond the date authorised by my visa1, unless I am applying for a further student visa with the consent of my sponsor, and that I will be required to depart Australia on or before the authorised date. I agree to having this condition included on any visa issued to me as a result of this application if the department decides to impose it as a condition of grant of a visa.</em> </li>
                                <li style="margin-bottom: 5px;"><em>I am aware that I must immediately advise the department if I become aware that any information provided in this form is incorrect or if there is a change in my circumstances that are relevant to this application at any time.</em> </li>
                                </ul>
            <p class="txt" style="border-top: 1px solid #000; padding-top: 10px;">1 To engage Australia’s protection obligation under the 1951 UN convention relating to the status of refugees. </em></p>
                            </p>
                        </td>
                        <td style="width: 50%; vertical-align: top; padding: 0 15px 0 30px;">
                            <p class="txt">
                                <label style="width: 90px; font-weight: 600; vertical-align: top; padding-right: 10px; margin-top: 30px;">Signature </label>
                                <textarea id="declarationsignature" runat="server" rows="4" style="width: 236px; margin-bottom: 5px; resize: none;"></textarea>
                            </p>
                            <p class="txt">
                                <label style="width: 93px; text-align: right; padding-right: 10px;">Date</label>
                                <input type="text" id="declarationdate" runat="server" name="" style="width: 136px; font-size: 10px; margin-bottom: 5px;" placeholder="DAY / MONTH / YEAR">
                            </p>
                            <p class="txt" style="margin-top: 20px;">
                                <label style="width: 90px; font-weight: 600; vertical-align: top; padding-right: 10px; margin-top: 30px;">Signature </label>
                                <textarea rows="4" id="declarationsignature1" runat="server"  style="width: 236px; margin-bottom: 5px; resize: none;"></textarea>
                            </p>
                            <p class="txt">
                                <label style="width: 93px; text-align: right; padding-right: 10px;">Date</label>
                                <input type="text" id="declarationdate1" runat="server" name="" style="width: 136px; font-size: 10px; margin-bottom: 5px;" placeholder="DAY / MONTH / YEAR">
                            </p>
                            <p class="txt" style="margin-top: 20px;">
                                <label style="width: 90px; font-weight: 600; vertical-align: top; padding-right: 10px; margin-top: 30px;">Signature </label>
                                <textarea rows="4" id="declarationsignature2" runat="server" style="width: 236px; margin-bottom: 5px; resize: none;"></textarea>
                            </p>
                            <p class="txt">
                                <label style="width: 93px; text-align: right; padding-right: 10px;">Date</label>
                                <input type="text" id="declarationdate2" runat="server" name="" style="width: 136px; font-size: 10px; margin-bottom: 5px;" placeholder="DAY / MONTH / YEAR">
                            </p>
                            <p class="txt" style="margin-top: 20px;">
                                <label style="width: 90px; font-weight: 600; vertical-align: top; margin-top: 30px; padding-right: 10px;">Signature </label>
                                <textarea rows="4" id="declarationsignature3" runat="server" style="width: 236px; margin-bottom: 5px; resize: none;"></textarea>
                            </p>
                            <p class="txt">
                                <label style="width: 93px; text-align: right; padding-right: 10px;">Date</label>
                                <input type="text" id="declarationdate3" runat="server" name="" style="width: 136px; font-size: 10px; margin-bottom: 5px;" placeholder="DAY / MONTH / YEAR">
                            </p>
                        </td>
                    </tr>
                    <!-- End Form here -->
                </table>
            </td>
        </tr>
    </table>


    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
</body>
</html>
