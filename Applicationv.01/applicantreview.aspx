<%@ Page Language="C#" AutoEventWireup="true" CodeFile="applicantreview.aspx.cs" Inherits="applicantreview" MasterPageFile="~/student.master" %>

<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">


    <div class="container-fluid page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">Review Application

            </li>
        </ol>
        <h1 class="h2">Review Application

        </h1>

    </div>
    <div class="page ">
        <div class="container page__container p-0">
            <div class="row m-0">
                <div class="col-lg container-fluid page__container">

                    <div class="card" style="width: 650px;">
                        <div class="list-group list-group-fit">
                            <div class="accordion" id="review">
                                <div class="card z-depth-0 bordered">
                                    <div class="card-header" id="review1">
                                        <h5 class="mb-0">
                                            <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#personalDetails"
                                                aria-expanded="true" aria-controls="personalDetails">
                                                Pesonal Details
                                            </button>
                                        </h5>
                                    </div>
                                    <div id="personalDetails" class="collapse" aria-labelledby="review1" data-parent="#review">


                                        <div class="list-group-item">
                                            <div class="form-group m-0" role="group" aria-labelledby="label-highschool">
                                                <div class="form-row">

                                                    <div class="col-md-6">
                                                        Full Name:<%=FullName %>
                                                    </div>
                                                    <div class="col-md-6">
                                                        PREFERRED NAME:<%= objApplicant[0].prefferedname == null ? "" : objApplicant[0].prefferedname.ToString() %>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="list-group-item">
                                            <div class="form-group m-0" role="group" aria-labelledby="label-highschool">
                                                <div class="form-row">

                                                    <div class="col-md-6">
                                                        OTHER MIDDLE NAMES: <%= objApplicant[0].middlename == null ? "" : objApplicant[0].middlename.ToString() %>
                                                    </div>
                                                    <div class="col-md-6">
                                                        DATE OF BIRTH:<%=objApplicant[0].dateofbirth == null ? "" : Convert.ToDateTime(objApplicant[0].dateofbirth).ToString("yyyy-MM-dd") %>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="list-group-item">
                                            <div class="form-group m-0" role="group" aria-labelledby="label-highschool">
                                                <div class="form-row">

                                                    <div class="col-md-6">
                                                        GENDER:<%= objApplicant[0].gender.ToString() == "1" ? "Male" : "Female" %>
                                                    </div>
                                                    <div class="col-md-6">
                                                        NATIONALITY AND CITIZENSHIP:<%=objComm.GetCountryDiscription(objApplicant[0].nationality) %>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="list-group-item">
                                            <div class="form-group m-0" role="group" aria-labelledby="label-highschool">
                                                <div class="form-row">

                                                    <div class="col-md-6">
                                                        COUNTRY OF BIRTH:<%=objComm.GetCountryDiscription(objApplicant[0].countryofbirth) %>
                                                    </div>
                                                    <div class="col-md-6">
                                                        MARITAL STATUS: <%=objComm.GetMaritalStatus(Convert.ToInt32(objApplicant[0].maritalstatus)) %>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="list-group-item">
                                            <div class="form-group m-0" role="group" aria-labelledby="label-highschool">
                                                <div class="form-row">

                                                    <div class="col-md-6">
                                                        HAVE ANY DISABILITY:<%= objApplicant[0].isdisable.ToString() == "1" ? "Yes" : "No" %>
                                                    </div>
                                                    <div class="col-md-6">
                                                        DISABILITY DESCRIPTION:<%=objComm.GetDisability(Convert.ToInt32(objApplicant[0].disabilitydescription)) %>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="card z-depth-0 bordered">
                                    <div class="card-header" id="review2">
                                        <h5 class="mb-0">
                                            <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#contactDetails"
                                                aria-expanded="true" aria-controls="contactDetails">
                                                Contact Details
                                            </button>
                                        </h5>
                                    </div>
                                    <div id="contactDetails" class="collapse" aria-labelledby="review2" data-parent="#review">
                                        <div class="list-group-item">
                                            <div class="form-group m-0" role="group" aria-labelledby="label-highschool">
                                                <div class="form-row">

                                                    <div class="col-md-6">
                                                        EMAIL:<%= objApplicant[0].email == null ? "" : objApplicant[0].email.ToString()  %>
                                                    </div>
                                                    <div class="col-md-6">
                                                        MOBILE/CELLULAR NUMBER: <%= objApplicant[0].mobileno == null ? "" : objApplicant[0].mobileno.ToString() %>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="list-group-item">
                                            <div class="form-group m-0" role="group" aria-labelledby="label-highschool">
                                                <div class="form-row">

                                                    <div class="col-md-6">
                                                        Skype ID: <%= objApplicant[0].skypeid == null ? "" : objApplicant[0].skypeid.ToString() %>
                                                    </div>
                                                    <div class="col-md-6">
                                                        Another Whatsapp no<%= objApplicant[0].whatsappno == null ? "" : objApplicant[0].whatsappno.ToString() %>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="list-group-item">
                                            <div class="form-group m-0" role="group" aria-labelledby="label-highschool">
                                                <div class="form-row">

                                                    <div class="col-md-6">
                                                        POSTAL ADDRESS: <%=PostalAddress %>
                                                    </div>
                                                    <div class="col-md-6">
                                                        CURRENT RESIDENTIAL ADDRESS:<%=ResidentailAddress %>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="list-group-item">
                                            <div class="form-group m-0" role="group" aria-labelledby="label-highschool">
                                                <div class="form-row">

                                                    <div class="col-md-6">
                                                        GUARDIAN FULL NAME:<%= objApplicant[0].nomineefullname == null ? "" : objApplicant[0].nomineefullname.ToString() %>
                                                    </div>
                                                    <div class="col-md-6">
                                                        RELATIONSHIP WITH GUARDIAN:<%= objApplicant[0].relationshipwithnominee == null ? "" : objApplicant[0].relationshipwithnominee.ToString() %>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="list-group-item">
                                            <div class="form-group m-0" role="group" aria-labelledby="label-highschool">
                                                <div class="form-row">

                                                    <div class="col-md-6">
                                                        EMAIL OF GUARDIAN:<%= objApplicant[0].nomineeemail == null ? "" : objApplicant[0].nomineeemail.ToString() %>
                                                    </div>
                                                    <div class="col-md-6">
                                                        MOBILE/CELLULAR NUMBER OF GUARDIAN <%= objApplicant[0].nomineemobile == null ? "" : objApplicant[0].mobileno.ToString().ToString() %>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="card z-depth-0 bordered">
                                    <div class="card-header" id="review3">
                                        <h5 class="mb-0">
                                            <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#IdetificationDetails"
                                                aria-expanded="true" aria-controls="IdetificationDetails">
                                                Idetification Details:
                                            </button>
                                        </h5>
                                    </div>
                                    <div id="IdetificationDetails" class="collapse" aria-labelledby="review3" data-parent="#review">
                                        <div class="list-group-item">
                                            <div class="form-group m-0" role="group" aria-labelledby="label-highschool">
                                                <div class="form-row">

                                                    <div class="col-md-6">
                                                        PASSPORT NUMBER:<%= objApplicant[0].passportno == null ? "" : objApplicant[0].passportno.ToString()%>
                                                    </div>
                                                    <div class="col-md-6">
                                                        DATE OF ISSUE:<%= Convert.ToDateTime(objApplicant[0].passportissuedate).ToString("yyyy-MM-dd") %>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="list-group-item">
                                            <div class="form-group m-0" role="group" aria-labelledby="label-highschool">
                                                <div class="form-row">

                                                    <div class="col-md-6">
                                                        EXPIRY DATE: <%= Convert.ToDateTime(objApplicant[0].passportexpirydate).ToString("yyyy-MM-dd") %>
                                                    </div>
                                                    <div class="col-md-6">
                                                        COUNTRY OF ISSUE:<%=objComm.GetCountryDiscription(objApplicant[0].passportissuecountry) %>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="list-group-item">
                                            <div class="form-group m-0" role="group" aria-labelledby="label-highschool">
                                                <div class="form-row">

                                                    <div class="col-md-6">
                                                        CITY OF ISSUE: <%= objApplicant[0].passportissuecity == null ? "" : objApplicant[0].passportissuecity.ToString() %>
                                                    </div>
                                                    <div class="col-md-6">
                                                        Alternate ID Proof:<%= objApplicant[0].alternativeiddentiproof.ToString() == "1" ? "Yes" : "No" %>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="list-group-item">
                                            <div class="form-group m-0" role="group" aria-labelledby="label-highschool">
                                                <div class="form-row">

                                                    <div class="col-md-6">
                                                        IDENTITY TYPE:<%=objComm.GetIdentityProof(Convert.ToInt32(objApplicant[0].alternativeprooftype)) %>
                                                    </div>
                                                    <div class="col-md-6">
                                                        IDENTITY NUMBER:<%= objApplicant[0].alternativeproofno == null ? "" : objApplicant[0].alternativeproofno.ToString()%>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="list-group-item">
                                            <div class="form-group m-0" role="group" aria-labelledby="label-highschool">
                                                <div class="form-row">

                                                    <div class="col-md-6">
                                                        ALTERNATIVE PROOF OF DATE OF BIRTH: <%= objApplicant[0].alternativedobproof.ToString() == "1" ? "Yes" : "No" %>
                                                    </div>
                                                    <div class="col-md-6">
                                                        IDENTITY TYPE:<%=objComm.GetDOBProof(Convert.ToInt32(objApplicant[0].alternativeproofdobtype)) %>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="list-group-item">
                                            <div class="form-group m-0" role="group" aria-labelledby="label-highschool">
                                                <div class="form-row">

                                                    <div class="col-md-6">
                                                        IDENTITY NUMBER:<%= objApplicant[0].alternativeproofdobno == null ? "" : objApplicant[0].alternativeproofdobno.ToString() %>
                                                    </div>
                                                    <div class="col-md-6">
                                                        ALTERNATIVE PROOF OF RESIDENCE:<%= objApplicant[0].alternativedobproof.ToString() == "1" ? "Yes" : "No" %>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="list-group-item">
                                            <div class="form-group m-0" role="group" aria-labelledby="label-highschool">
                                                <div class="form-row">

                                                    <div class="col-md-6">
                                                        IDENTITY TYPE:<%=objComm.GetAddressProof(Convert.ToInt32(objApplicant[0].alternativeproofdobtype)) %>
                                                    </div>
                                                    <div class="col-md-6">
                                                        IDENTITY NUMBER:<%= objApplicant[0].alternativeresidenceproofno == null ? "" : objApplicant[0].alternativeresidenceproofno.ToString() %>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="card z-depth-0 bordered">
                                    <div class="card-header" id="review4">
                                        <h5 class="mb-0">
                                            <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#EducationDetails"
                                                aria-expanded="true" aria-controls="EducationDetails">
                                                Education Details
                                            </button>
                                        </h5>
                                    </div>
                                    <div id="EducationDetails" class="collapse" aria-labelledby="review4" data-parent="#review">
                                        <%if (objEdu[0].ishighschooldone == 1)
                                            {%>
                                        <div class="list-group-item">
                                            <div class="form-group m-0" role="group" aria-labelledby="label-highschool">
                                                <div class="form-row">

                                                    <div class="col-md-6">
                                                        Completed High School:<%= objEdu[0].ishighschooldone.ToString() == "1" ? "Yes" : "No" %>
                                                    </div>
                                                    <div class="col-md-6">
                                                        COUNTRY OF HIGH SCHOOL EDUCATION:<%=objComm.GetCountryDiscription(objEdu[0].highschoolcountry) %>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="list-group-item">
                                            <div class="form-group m-0" role="group" aria-labelledby="label-highschool">
                                                <div class="form-row">

                                                    <div class="col-md-6">
                                                        START DATE:<%= objEdu[0].highschoolstartdate == null ? "" : Convert.ToDateTime(objEdu[0].highschoolstartdate).ToString("yyyy-MM-dd") %>
                                                    </div>
                                                    <div class="col-md-6">
                                                        END DATE:<%= objEdu[0].highschoolendate == null ? "" : Convert.ToDateTime(objEdu[0].highschoolendate).ToString("yyyy-MM-dd") %>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="list-group-item">
                                            <div class="form-group m-0" role="group" aria-labelledby="label-highschool">
                                                <div class="form-row">

                                                    <div class="col-md-6">
                                                        NAME OF SCHOOL:<%= objEdu[0].highschoolname == null ? "" : objEdu[0].highschoolname.ToString() %>
                                                    </div>
                                                    <div class="col-md-6">
                                                        QUALIFICATION TYPE:<%= objEdu[0].highschoolqualificationtype == null ? "" : objEdu[0].highschoolqualificationtype.ToString() %>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="list-group-item">
                                            <div class="form-group m-0" role="group" aria-labelledby="label-highschool">
                                                <div class="form-row">

                                                    <div class="col-md-6">
                                                        MODE OF STUDY:<%=objComm.GetStudyMode(Convert.ToInt32(objEdu[0].highschoolmodeid)) %>
                                                    </div>
                                                    <div class="col-md-6">
                                                        LANGUAGE (MEDIUM) OF STUDY:<%=objComm.GetStudyMedium(Convert.ToInt32(objEdu[0].highschoolmodeid)) %>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="list-group-item">
                                            <div class="form-group m-0" role="group" aria-labelledby="label-highschool">
                                                <div class="form-row">

                                                    <div class="col-md-6">
                                                        GRADE TYPE:<%=objComm.GetGrade(Convert.ToInt32(objEdu[0].highschoolgradetypeid)) %>
                                                    </div>
                                                    <div class="col-md-6">
                                                        FINAL GRADE ACHIEVED:<%= objEdu[0].highschoolgradedeclared.ToString() == "1" ? "Yes" : "No" %>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="list-group-item">
                                            <div class="form-group m-0" role="group" aria-labelledby="label-highschool">
                                                <div class="form-row">

                                                    <div class="col-md-6">
                                                        EXPECTED DATES WHEN RESULTS WILL BE DECLARED:<%= objEdu[0].highschoolreusltdate == null ? "" : Convert.ToDateTime(objEdu[0].highschoolreusltdate).ToString("yyyy-MM-dd") %>
                                                    </div>
                                                    <div class="col-md-6">
                                                        NAME OF CONTACT WHO CAN VERIFY THIS QUALIFICATION:<%= objEdu[0].highschoolverificationname == null ? "" : objEdu[0].highschoolverificationname.ToString() %>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="list-group-item">
                                            <div class="form-group m-0" role="group" aria-labelledby="label-highschool">
                                                <div class="form-row">

                                                    <div class="col-md-6">
                                                        RELATIONSHIP WITH THE CONTACT:<%= objEdu[0].highschoolrelationship == null ? "" : objEdu[0].highschoolrelationship.ToString() %>
                                                    </div>
                                                    <div class="col-md-6">
                                                        EMAIL ID OF CONTACT WHO CAN VERIFY YOUR QUALIFICATION:<%= objEdu[0].highschoolverificationemail == null ? "" : objEdu[0].highschoolverificationemail.ToString() %>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="list-group-item">
                                            <div class="form-group m-0" role="group" aria-labelledby="label-highschool">
                                                <div class="form-row">


                                                    <div class="col-md-6">
                                                        MOBILE/CELLULAR NUMBER OF CONTACT WHO CAN VERIFY YOUR QUALIFICATION:<%= objEdu[0].highschoolverificationmobile == null ? "" : objEdu[0].highschoolverificationmobile.ToString() %>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <%}
                                            if (objEdu[0].issecondarydone == 1)
                                            {%>
                                        <div class="list-group-item">
                                            <div class="form-group m-0" role="group" aria-labelledby="label-highschool">
                                                <div class="form-row">

                                                    <div class="col-md-6">
                                                        HAVE YOU COMPLETED SENIOR SECONDARY SCHOOL? (YEAR 12)?:<%= objEdu[0].issecondarydone.ToString() == "1" ? "Yes" : "No" %>
                                                    </div>
                                                    <div class="col-md-6">
                                                        COUNTRY OF SENIOR SECONDARY SCHOOL:<%=objComm.GetCountryDiscription(objEdu[0].secondarycountry) %>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="list-group-item">
                                            <div class="form-group m-0" role="group" aria-labelledby="label-highschool">
                                                <div class="form-row">

                                                    <div class="col-md-6">
                                                        START DATE:<%= objEdu[0].secondarystartdate == null ? "" : Convert.ToDateTime(objEdu[0].secondarystartdate).ToString("yyyy-MM-dd") %>
                                                    </div>
                                                    <div class="col-md-6">
                                                        END DATE:<%= objEdu[0].secondaryendate == null ? "" : Convert.ToDateTime(objEdu[0].secondaryendate).ToString("yyyy-MM-dd") %>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="list-group-item">
                                            <div class="form-group m-0" role="group" aria-labelledby="label-highschool">
                                                <div class="form-row">

                                                    <div class="col-md-6">
                                                        NAME OF SCHOOL:<%= objEdu[0].secondaryname == null ? "" : objEdu[0].secondaryname.ToString() %>
                                                    </div>
                                                    <div class="col-md-6">
                                                        QUALIFICATION TYPE:<%= objEdu[0].secondaryqualificationtype == null ? "" : objEdu[0].secondaryqualificationtype.ToString() %>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="list-group-item">
                                            <div class="form-group m-0" role="group" aria-labelledby="label-highschool">
                                                <div class="form-row">

                                                    <div class="col-md-6">
                                                        MODE OF STUDY:<%=objComm.GetStudyMode(Convert.ToInt32(objEdu[0].secondarymodestudy)) %>
                                                    </div>
                                                    <div class="col-md-6">
                                                        LANGUAGE (MEDIUM) OF STUDY:<%=objComm.GetStudyMedium(Convert.ToInt32(objEdu[0].secondarymediumstudy)) %>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="list-group-item">
                                            <div class="form-group m-0" role="group" aria-labelledby="label-highschool">
                                                <div class="form-row">

                                                    <div class="col-md-6">
                                                        GRADE TYPE:<%=objComm.GetGrade(Convert.ToInt32(objEdu[0].secondarygradetypeid)) %>
                                                    </div>
                                                    <div class="col-md-6">
                                                        FINAL GRADE ACHIEVED:<%= objEdu[0].secondarygradedeclared.ToString() == "1" ? "Yes" : "No" %>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="list-group-item">
                                            <div class="form-group m-0" role="group" aria-labelledby="label-highschool">
                                                <div class="form-row">

                                                    <div class="col-md-6">
                                                        EXPECTED DATES WHEN RESULTS WILL BE DECLARED:<%= objEdu[0].secondaryresultdate == null ? "" : Convert.ToDateTime(objEdu[0].secondaryresultdate).ToString("yyyy-MM-dd") %>
                                                    </div>
                                                    <div class="col-md-6">
                                                        NAME OF CONTACT WHO CAN VERIFY THIS QUALIFICATION:<%= objEdu[0].secondaryverificationname == null ? "" : objEdu[0].secondaryverificationname.ToString() %>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="list-group-item">
                                            <div class="form-group m-0" role="group" aria-labelledby="label-highschool">
                                                <div class="form-row">

                                                    <div class="col-md-6">
                                                        RELATIONSHIP WITH THE CONTACT:<%= objEdu[0].relationshipwitnsecondaryverification == null ? "" : objEdu[0].relationshipwitnsecondaryverification.ToString() %>
                                                    </div>
                                                    <div class="col-md-6">
                                                        EMAIL ID OF CONTACT WHO CAN VERIFY YOUR QUALIFICATION:<%= objEdu[0].secondaryverificationemail == null ? "" : objEdu[0].secondaryverificationemail.ToString() %>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="list-group-item">
                                            <div class="form-group m-0" role="group" aria-labelledby="label-highschool">
                                                <div class="form-row">


                                                    <div class="col-md-6">
                                                        MOBILE/CELLULAR NUMBER OF CONTACT WHO CAN VERIFY YOUR QUALIFICATION:<%= objEdu[0].secondaryverificationmobile == null ? "" : objEdu[0].secondaryverificationmobile.ToString() %>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <%}
                                            if (objEdu[0].ishighereducation == 1)
                                            {
                                                for (int i = 0; i < objHigherEdu.Count; i++)
                                                {%>
                                        <div class="list-group-item">
                                            <div class="form-group m-0" role="group" aria-labelledby="label-highschool">
                                                <div class="form-row">

                                                    <div class="col-md-6">
                                                        Completed  HIGHER DEGREE  QUALIFICATION:<%= objComm.GetQualification(objHigherEdu[i].coursename.ToString()) %>
                                                    </div>
                                                    <div class="col-md-6">
                                                        COUNTRY OF  HIGHER DEGREE:<%=objComm.GetCountryDiscription(objHigherEdu[i].countryofhighereducation) %>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="list-group-item">
                                            <div class="form-group m-0" role="group" aria-labelledby="label-highschool">
                                                <div class="form-row">

                                                    <div class="col-md-6">
                                                        START DATE:<%= objHigherEdu[i].startdate == null ? "" : Convert.ToDateTime(objHigherEdu[i].startdate).ToString("yyyy-MM-dd") %>
                                                    </div>
                                                    <div class="col-md-6">
                                                        END DATE:<%= objHigherEdu[i].endate == null ? "" : Convert.ToDateTime(objHigherEdu[i].endate).ToString("yyyy-MM-dd") %>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="list-group-item">
                                            <div class="form-group m-0" role="group" aria-labelledby="label-highschool">
                                                <div class="form-row">

                                                    <div class="col-md-6">
                                                        NAME OF SCHOOL:<%= objHigherEdu[i].schoolname == null ? "" :objHigherEdu[i].schoolname.ToString() %>
                                                    </div>
                                                    <div class="col-md-6">
                                                        QUALIFICATION TYPE:<%= objHigherEdu[i].qualificationtype == null ? "" : objHigherEdu[i].qualificationtype.ToString() %>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="list-group-item">
                                            <div class="form-group m-0" role="group" aria-labelledby="label-highschool">
                                                <div class="form-row">

                                                    <div class="col-md-6">
                                                        MODE OF STUDY:<%=objComm.GetStudyMode(Convert.ToInt32(objHigherEdu[i].studymodeid)) %>
                                                    </div>
                                                    <div class="col-md-6">
                                                        LANGUAGE (MEDIUM) OF STUDY:<%=objComm.GetStudyMedium(Convert.ToInt32(objHigherEdu[i].studymediumid)) %>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="list-group-item">
                                            <div class="form-group m-0" role="group" aria-labelledby="label-highschool">
                                                <div class="form-row">

                                                    <div class="col-md-6">
                                                        GRADE TYPE:<%=objComm.GetGrade(Convert.ToInt32(objHigherEdu[i].gradetypeid)) %>
                                                    </div>
                                                    <div class="col-md-6">
                                                        FINAL GRADE ACHIEVED:<%= objHigherEdu[i].finalgradeacheived.ToString() == "1" ? "Yes" : "No" %>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="list-group-item">
                                            <div class="form-group m-0" role="group" aria-labelledby="label-highschool">
                                                <div class="form-row">

                                                    <div class="col-md-6">
                                                        EXPECTED DATES WHEN RESULTS WILL BE DECLARED:<%= objHigherEdu[i].resultdate == null ? "" : Convert.ToDateTime(objHigherEdu[i].resultdate).ToString("yyyy-MM-dd") %>
                                                    </div>
                                                    <div class="col-md-6">
                                                        NAME OF CONTACT WHO CAN VERIFY THIS QUALIFICATION:<%= objHigherEdu[i].verificationname == null ? "" : objHigherEdu[i].verificationname.ToString() %>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="list-group-item">
                                            <div class="form-group m-0" role="group" aria-labelledby="label-highschool">
                                                <div class="form-row">

                                                    <div class="col-md-6">
                                                        RELATIONSHIP WITH THE CONTACT:<%= objHigherEdu[i].relationshipwithverification == null ? "" : objHigherEdu[i].relationshipwithverification.ToString() %>
                                                    </div>
                                                    <div class="col-md-6">
                                                        EMAIL ID OF CONTACT WHO CAN VERIFY YOUR QUALIFICATION:<%= objHigherEdu[i].verificationemail == null ? "" : objHigherEdu[i].verificationemail.ToString() %>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="list-group-item">
                                            <div class="form-group m-0" role="group" aria-labelledby="label-highschool">
                                                <div class="form-row">


                                                    <div class="col-md-6">
                                                        MOBILE/CELLULAR NUMBER OF CONTACT WHO CAN VERIFY YOUR QUALIFICATION:<%= objHigherEdu[i].verificationmobile == null ? "" : objHigherEdu[i].verificationmobile.ToString() %>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <%}
                                            }
                                            if (objEdu[0].isdiplomadone == 1)
                                            { %>
                                        <div class="list-group-item">
                                            <div class="form-group m-0" role="group" aria-labelledby="label-highschool">
                                                <div class="form-row">

                                                    <div class="col-md-6">
                                                        Completed  DIPLOMA OR CERTIFICATE PROGRAMS :<%= objEdu[0].isdiplomadone.ToString() == "1" ? "Yes" : "No" %>
                                                    </div>
                                                    <div class="col-md-6">
                                                        COUNTRY OF DIPLOMA OR CERTIFICATE PROGRAMS :<%=objComm.GetCountryDiscription(objEdu[0].diplomacountry) %>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="list-group-item">
                                            <div class="form-group m-0" role="group" aria-labelledby="label-highschool">
                                                <div class="form-row">

                                                    <div class="col-md-6">
                                                        START DATE:<%= objEdu[0].diplomastartdate == null ? "" : Convert.ToDateTime(objEdu[0].diplomastartdate).ToString("yyyy-MM-dd") %>
                                                    </div>
                                                    <div class="col-md-6">
                                                        END DATE:<%= objEdu[0].diplomaendate == null ? "" : Convert.ToDateTime(objEdu[0].diplomaendate).ToString("yyyy-MM-dd") %>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="list-group-item">
                                            <div class="form-group m-0" role="group" aria-labelledby="label-highschool">
                                                <div class="form-row">

                                                    <div class="col-md-6">
                                                        NAME OF SCHOOL:<%= objEdu[0].diplomaschoolname == null ? "" : objEdu[0].diplomaschoolname.ToString() %>
                                                    </div>
                                                    <div class="col-md-6">
                                                        QUALIFICATION TYPE:<%= objEdu[0].diplomaqualificationtype == null ? "" : objEdu[0].diplomaqualificationtype.ToString() %>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="list-group-item">
                                            <div class="form-group m-0" role="group" aria-labelledby="label-highschool">
                                                <div class="form-row">

                                                    <div class="col-md-6">
                                                        MODE OF STUDY:<%=objComm.GetStudyMode(Convert.ToInt32(objEdu[0].diplomastudymodeid)) %>
                                                    </div>
                                                    <div class="col-md-6">
                                                        LANGUAGE (MEDIUM) OF STUDY:<%=objComm.GetStudyMedium(Convert.ToInt32(objEdu[0].diplomamediumid)) %>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="list-group-item">
                                            <div class="form-group m-0" role="group" aria-labelledby="label-highschool">
                                                <div class="form-row">

                                                    <div class="col-md-6">
                                                        GRADE TYPE:<%=objComm.GetGrade(Convert.ToInt32(objEdu[0].diplomagradetypeid)) %>
                                                    </div>
                                                    <div class="col-md-6">
                                                        FINAL GRADE ACHIEVED:<%= objEdu[0].diplomagradeachieved.ToString() == "1" ? "Yes" : "No" %>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="list-group-item">
                                            <div class="form-group m-0" role="group" aria-labelledby="label-highschool">
                                                <div class="form-row">

                                                    <div class="col-md-6">
                                                        EXPECTED DATES WHEN RESULTS WILL BE DECLARED:<%= objEdu[0].diplomaresultdate == null ? "" : Convert.ToDateTime(objEdu[0].diplomaresultdate).ToString("yyyy-MM-dd") %>
                                                    </div>
                                                    <div class="col-md-6">
                                                        NAME OF CONTACT WHO CAN VERIFY THIS QUALIFICATION:<%= objEdu[0].diplomaverificationname == null ? "" : objEdu[0].diplomaverificationname.ToString() %>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="list-group-item">
                                            <div class="form-group m-0" role="group" aria-labelledby="label-highschool">
                                                <div class="form-row">

                                                    <div class="col-md-6">
                                                        RELATIONSHIP WITH THE CONTACT:<%= objEdu[0].relationshipwithdiplomaverification == null ? "" : objEdu[0].relationshipwithdiplomaverification.ToString() %>
                                                    </div>
                                                    <div class="col-md-6">
                                                        EMAIL ID OF CONTACT WHO CAN VERIFY YOUR QUALIFICATION:<%= objEdu[0].diplomaverificationemail == null ? "" : objEdu[0].diplomaverificationemail.ToString() %>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="list-group-item">
                                            <div class="form-group m-0" role="group" aria-labelledby="label-highschool">
                                                <div class="form-row">


                                                    <div class="col-md-6">
                                                        MOBILE/CELLULAR NUMBER OF CONTACT WHO CAN VERIFY YOUR QUALIFICATION:<%= objEdu[0].diplomaverificationmobile == null ? "" : objEdu[0].diplomaverificationmobile.ToString() %>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <%} %>
                                    </div>
                                </div>

                                <%if (objLanguage.Count > 0)
                                    {%>
                                <div class="card z-depth-0 bordered">
                                    <div class="card-header" id="review5">
                                        <h5 class="mb-0">
                                            <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#LanuguageDetails"
                                                aria-expanded="true" aria-controls="LanuguageDetails">
                                                Language Details
                                            </button>
                                        </h5>
                                    </div>
                                    <div id="LanuguageDetails" class="collapse" aria-labelledby="review5" data-parent="#review">
                                        <div class="list-group-item">
                                            <div class="form-group m-0" role="group" aria-labelledby="label-highschool">
                                                <div class="form-row">

                                                    <div class="col-md-6">
                                                        WHAT LANGUAGE DO YOU SPEAK AT HOME:<%=objLanguage[0].homelanuage==null?"":objLanguage[0].homelanuage.ToString() %>
                                                    </div>
                                                    <div class="col-md-6">
                                                        HAVE YOU STUDIED AN ENGLISH LANGUAGE INTENSIVE COURSE FOR STUDENTS FROM NON-ENGLISH SPEAKING BACKGROUNDS:<%=objLanguage[0].isenglishintesive==1?"Yes":"No" %>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="list-group-item">
                                            <div class="form-group m-0" role="group" aria-labelledby="label-highschool">
                                                <div class="form-row">

                                                    <div class="col-md-6">
                                                        COUNTRY OF ENGLISH LANGUAGE INTENSIVE COURSE:<%=objComm.GetCountryDiscription(objLanguage[0].countryofcourse) %>
                                                    </div>
                                                    <div class="col-md-6">
                                                        YEAR OF COMPLETION/EXPECTED:<%=objLanguage[0].yearofcompletion==null?"":Convert.ToDateTime(objLanguage[0].yearofcompletion).ToString("yyyy-MM-dd") %>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="list-group-item">
                                            <div class="form-group m-0" role="group" aria-labelledby="label-highschool">
                                                <div class="form-row">

                                                    <div class="col-md-6">
                                                        NAME OF COLLEGE OR UNIVERSITY:<%=objLanguage[0].instituename==null?"":objLanguage[0].instituename.ToString() %>
                                                    </div>
                                                    <div class="col-md-6">
                                                        MODE OF STUDY:<%=objComm.GetStudyMode(Convert.ToInt32(objLanguage[0].studymode)) %>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="list-group-item">
                                            <div class="form-group m-0" role="group" aria-labelledby="label-highschool">
                                                <div class="form-row">

                                                    <div class="col-md-6">
                                                        QUALIFICATION TYPE:<%=objLanguage[0].qualificationtype==null?"":objLanguage[0].qualificationtype.ToString() %>
                                                    </div>
                                                    <div class="col-md-6">
                                                        GRADE TYPE:<%=objComm.GetGrade(Convert.ToInt32(objLanguage[0].gradetype)) %>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="list-group-item">
                                            <div class="form-group m-0" role="group" aria-labelledby="label-highschool">
                                                <div class="form-row">

                                                    <div class="col-md-6">
                                                        FINAL GRADE ACHIEVED:<%=objLanguage[0].isfinalgradeachieved==1?"Yes":"No" %>
                                                    </div>
                                                    <div class="col-md-6">
                                                        HAVE YOU SAT ANY ONE OF THE FOLLOWING ENGLISH LANGUAGE COMPETENCY TESTS:<%=objLanguage[0].testname==null?"":objLanguage[0].testname.ToString() %>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="list-group-item">
                                            <div class="form-group m-0" role="group" aria-labelledby="label-highschool">
                                                <div class="form-row">

                                                    <div class="col-md-6">
                                                        TEST NAME:<%=objLanguage[0].testname==null?"":objLanguage[0].testname.ToString() %>
                                                    </div>
                                                    <div class="col-md-6">
                                                        CENTRE NO:<%=objLanguage[0].centerno==null?"":objLanguage[0].centerno.ToString() %>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="list-group-item">
                                            <div class="form-group m-0" role="group" aria-labelledby="label-highschool">
                                                <div class="form-row">

                                                    <div class="col-md-6">
                                                        CANDIDATE NO:<%=objLanguage[0].candidateno==null?"":objLanguage[0].candidateno.ToString() %>
                                                    </div>
                                                    <div class="col-md-6">
                                                        CANDIDATE ID:<%=objLanguage[0].candidateid==null?"":objLanguage[0].candidateid.ToString() %>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="list-group-item">
                                            <div class="form-group m-0" role="group" aria-labelledby="label-highschool">
                                                <div class="form-row">

                                                    <div class="col-md-6">
                                                        TEST DATE:<%=objLanguage[0].examdate==null?"":Convert.ToDateTime(objLanguage[0].examdate).ToString("yyyy-MM-dd") %>
                                                    </div>
                                                    <div class="col-md-6">
                                                        OVERALL SCORE:<%=objLanguage[0].overallscore==null?"":objLanguage[0].overallscore.ToString() %>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="list-group-item">
                                            <div class="form-group m-0" role="group" aria-labelledby="label-highschool">
                                                <div class="form-row">

                                                    <div class="col-md-6">
                                                        SPEAKING SCORE:<%=objLanguage[0].speakingscore==null?"":objLanguage[0].speakingscore.ToString() %>
                                                    </div>
                                                    <div class="col-md-6">
                                                        LISTENING SCORE:<%=objLanguage[0].listeningscore==null?"":objLanguage[0].listeningscore.ToString() %>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="list-group-item">
                                            <div class="form-group m-0" role="group" aria-labelledby="label-highschool">
                                                <div class="form-row">

                                                    <div class="col-md-6">
                                                        READING SCORE:<%=objLanguage[0].readingscore==null?"":objLanguage[0].readingscore.ToString() %>
                                                    </div>
                                                    <div class="col-md-6">
                                                        WRITING SCORE:<%=objLanguage[0].writingscore==null?"":objLanguage[0].writingscore.ToString() %>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="list-group-item">
                                            <div class="form-group m-0" role="group" aria-labelledby="label-highschool">
                                                <div class="form-row">

                                                    <div class="col-md-6">
                                                        CEFR LEVEL:<%=objLanguage[0].homelanuage==null?"":objLanguage[0].homelanuage.ToString() %>
                                                    </div>
                                                    <div class="col-md-6">
                                                        TEST REPORT REFERENCE NO:<%=objLanguage[0].testreportreferenceno==null?"":objLanguage[0].testreportreferenceno.ToString() %>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <%}%>
                                <%if (objEmployer.Count > 0)
                                    { %>
                                <div class="card z-depth-0 bordered">
                                    <div class="card-header" id="review6">
                                        <h5 class="mb-0">
                                            <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#EmploymentDetails"
                                                aria-expanded="true" aria-controls="EmploymentDetails">
                                                Employment Details
                                            </button>
                                        </h5>
                                    </div>

                                    <div id="EmploymentDetails" class="collapse" aria-labelledby="review5" data-parent="#review">
                                        <%for (int k = 0; k < objEmployer.Count; k++)
                                            { %>
                                        <div class="list-group-item">
                                            <div class="form-group m-0" role="group" aria-labelledby="label-highschool">
                                                <div class="form-row">

                                                    <div class="col-md-6">
                                                        NAME OF ORGANIZATION:<%=objEmployer[k].organization==null?"":objEmployer[k].organization.ToString() %>
                                                    </div>
                                                    <div class="col-md-6">
                                                        CITY: <%=objEmployer[k].city==null?"":objEmployer[k].city.ToString() %>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="list-group-item">
                                            <div class="form-group m-0" role="group" aria-labelledby="label-highschool">
                                                <div class="form-row">

                                                    <div class="col-md-6">
                                                        COUNTRY:<%=objComm.GetCountryDiscription(objEmployer[k].country) %>
                                                    </div>
                                                    <div class="col-md-6">
                                                        POSITION/ROLE IN:<%=objEmployer[k].designation==null?"":objEmployer[k].designation.ToString() %>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="list-group-item">
                                            <div class="form-group m-0" role="group" aria-labelledby="label-highschool">
                                                <div class="form-row">

                                                    <div class="col-md-6">
                                                        START DATE:<%=objEmployer[k].durationfrom==null?"":Convert.ToDateTime(objEmployer[k].durationfrom).ToString("yyyy-MM-dd") %>
                                                    </div>
                                                    <div class="col-md-6">
                                                        END DATE:<%=objEmployer[k].durationto==null?"":Convert.ToDateTime(objEmployer[k].durationto).ToString("yyyy-MM-dd") %>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="list-group-item">
                                            <div class="form-group m-0" role="group" aria-labelledby="label-highschool">
                                                <div class="form-row">

                                                    <div class="col-md-6">
                                                        BRIEF DESCRIPTION OF WHAT YOU DID:<%=objEmployer[k].briefdescription==null?"":objEmployer[k].briefdescription.ToString() %>
                                                    </div>
                                                    <div class="col-md-6">
                                                        NAME OF YOUR REPORTING MANAGER:<%=objEmployer[k].nameofreportingmanger==null?"":objEmployer[k].nameofreportingmanger.ToString() %>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="list-group-item">
                                            <div class="form-group m-0" role="group" aria-labelledby="label-highschool">
                                                <div class="form-row">

                                                    <div class="col-md-6">
                                                        NAME OF CONTACT WHO CAN VERIFY YOUR EMPLOYMENT:<%=objEmployer[k].contactpersonwithdetails==null?"":objEmployer[k].contactpersonwithdetails.ToString() %>
                                                    </div>
                                                    <div class="col-md-6">
                                                        RELATIONSHIP WITH THE CONTACT:<%=objEmployer[k].relationshipwithcontact==null?"":objEmployer[k].relationshipwithcontact.ToString() %>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="list-group-item">
                                            <div class="form-group m-0" role="group" aria-labelledby="label-highschool">
                                                <div class="form-row">


                                                    <div class="col-md-6">
                                                        LINKEDIN PROFILE LINK OF THE CONTACT:<%=objEmployer[k].linkedinidofcontact==null?"":objEmployer[k].linkedinidofcontact.ToString() %>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <%} %>
                                    </div>

                                </div>
                                <%} %>
                                <div class="card z-depth-1 bordered">
                                    <div class="card-header" id="review7">
                                        <h5 class="mb-0">
                                            <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#Social"
                                                aria-expanded="true" aria-controls="Social">
                                                Social
                                            </button>
                                        </h5>
                                    </div>

                                    <div id="Social" class="collapse" aria-labelledby="review7" data-parent="#review">

                                        <div class="list-group-item">
                                            <div class="form-group m-0" role="group" aria-labelledby="label-highschool">
                                                <div class="form-row">

                                                    <div class="col-md-6">
                                                        FaceBook:<%=objApplicant[0].facebookprofle==null?"":objApplicant[0].facebookprofle.ToString() %>
                                                    </div>
                                                    <div class="col-md-6">
                                                        Twitter: <%=objApplicant[0].twiterprofile==null?"":objApplicant[0].twiterprofile.ToString() %>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="list-group-item">
                                            <div class="form-group m-0" role="group" aria-labelledby="label-highschool">
                                                <div class="form-row">

                                                    <div class="col-md-6">
                                                        Linked:<%=objApplicant[0].linkedprofile==null?"":objApplicant[0].linkedprofile.ToString() %>
                                                    </div>
                                                    <div class="col-md-6">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>



                                    </div>

                                </div>
                            </div>
                            <div class="list-group-item">
                                <div class="form-group m-0" role="group" aria-labelledby="label-employment">
                                    <div class="form-row">

                                        <div class="col-md-9">
                                            <label id="applicant" runat="server">1. I, #NameofApplicant#, declare that the information provided in this application is true and complete in every detail</label><br />
                                             <label id="applicantverify" runat="server">2. I authorise #NameofInstitution# to verify information about me from educational and other institutions which I can included in this application and/or accompanying documentation.</label>
                                            <br />
                                            <label id="applicantacknowledge" runat="server"> 3. I acknowledge that  #NameofInstitution# reserves the right at any stage to vary or reverse any decision regarding admission or enrolment made on the basis of incorrect or incomplete information</label>
                                            <br />
                                            <label id="applicantaware" runat="server"> 4. I am aware of the cost and conditions relating to my application and admission and agree to pay all fees for which I am liable.</label>
                                            <br />
                                           <label id="applicantawareConfirm" runat="server">  5. I acknowledge that  #NameofInstitution# may require me to submit or show evidence of original documents at a later date for any documents that I have submitted electronically. As such, I will maintain original copies and make them available if requested. Failure to do so may result in withdrawal of any offer of a place and, if admitted to  #NameofInstitution#, cancellation of my enrolment</label>
                                            <br />
                                           <label id="applicantresponsible" runat="server">  6. I acknowledge that I am responsible for keeping  #NameofInstitution# up-to-date with any change to my contact details</label><br />
                                            <asp:CheckBox ID="chkDeclration" runat="server" />
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="list-group-item" id="employerwebsite">
                                <div class="form-group m-0" role="group" aria-labelledby="label-employerwebsite">
                                    <div class="form-row">
                                        <asp:Button ID="btn_login" runat="server" Text="Save Changes" CssClass="btn btn-success" />
                                        <div class="col-md-6">
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


    <div class="container page__container">
        <div class="footer">
        </div>

    </div>

    <script>
        $("#studentID").hide();
        $("#studentcoursename").hide();
        $("#coursenstartDate").hide();
        $("#coursenendDate").hide();
        $("#applybefore").show();
        $("#applyStudentID").hide();

        $(function () {
            $("input[name='ctl00$ContentPlaceHolder1$study']").click(function () {
                if ($("#ContentPlaceHolder1_rblStudyYes").is(":checked")) {
                    $("#studentID").show();
                    $("#studentcoursename").show();
                    $("#coursenstartDate").show();
                    $("#coursenendDate").show();
                    $("#applybefore").hide();
                    $("#applyStudentID").hide();
                } else {
                    $("#studentID").hide();
                    $("#studentcoursename").hide();
                    $("#coursenstartDate").hide();
                    $("#coursenendDate").hide();
                    $("#applybefore").show();
                }
            });
        });
        $(function () {
            $("input[name='ctl00$ContentPlaceHolder1$apply']").click(function () {
                if ($("#ContentPlaceHolder1_rblApplyYes").is(":checked")) {
                    $("#applyStudentID").show();;

                } else {
                    $("#applyStudentID").hide();

                }
            });
        });
        $('#ContentPlaceHolder1_dob').flatpickr({

            dateFormat: 'Y-m-d'
        });



        //document.getElementById("ContentPlaceHolder1_dob").flatpickr({
        //    wrap: true,
        //    weekNumbers: true,
        //    enableTime: true, // enables timepicker default is false    
        //    time_24hr: true, // set to false for AM PM default is false
        //    onChange: function (selectedDates, dateStr, instance) {
        //        console.log("changed");
        //    }
        //});



    </script>


</asp:Content>
