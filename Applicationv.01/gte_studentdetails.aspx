<%@ Page Language="C#" AutoEventWireup="true" CodeFile="gte_studentdetails.aspx.cs" Inherits="gte_studentdetails" MasterPageFile="~/student.master" EnableEventValidation="false"%>
<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="container-fluid page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">Student Details</li>
        </ol>
        <h1 class="h2">STUDENT DETAILS</h1>
    </div>

    <div class="page ">
        <div class="container page__container">
            <div class="row">
                <div class="col-md-8">

                    <div class="card">
                        <div class="card-body list-group list-group-fit">
                            <h5>Personal Particulars</h5>                            
                             <div class="list-group-item" id="dob">
                                <div class="form-group m-0" role="group" aria-labelledby="label-dob">
                                    <div class="form-row">
                                        <label id="lbldob" runat="server" for="dateofissue" class="col-md-3 col-form-label form-label">Date of Birth </label>
                                        <div class="col-md-6">
                                            <input id="txtdob" runat="server" type="text" class="form-control" placeholder="Date of Birth" data-toggle="flatpickr" value=""><span class="helpicon"><i id="icdob" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>                                                      
                            <div class="list-group-item" id="nationality">
                                <div class="form-group m-0" role="group" aria-labelledby="label-nationality">
                                    <div class="form-row">
                                        <label id="lblnationality" runat="server" for="nationality" class="col-md-3 col-form-label form-label">Country of Citizenship</label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlnationality" CssClass="form-control" runat="server">
                                            </asp:DropDownList>
                                            <span class="helpicon"><i id="icnationality" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="countryofdob">
                                <div class="form-group m-0" role="group" aria-labelledby="label-countryofdob">
                                    <div class="form-row">
                                        <label id="lblcountryofdob" runat="server" for="countryofdob" class="col-md-3 col-form-label form-label">Country of Birth </label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlcountryofdob" CssClass="form-control" runat="server">
                                            </asp:DropDownList>
                                            <span class="helpicon"><i id="iccountryofdob" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                             <div class="list-group-item" id="countryresidence">
                                <div class="form-group m-0" role="group" aria-labelledby="label-countryresidence">
                                    <div class="form-row">
                                        <label id="lblcountryresidence" runat="server" for="countryresidence" class="col-md-3 col-form-label form-label">Current Country of Residence  </label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlcountryresidence" CssClass="form-control" runat="server">
                                            </asp:DropDownList>
                                            <span class="helpicon"><i id="iccountryresidence" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                             <div class="list-group-item" id="maritalstatus">
                                <div class="form-group m-0" role="group" aria-labelledby="label-maritalstatus">
                                    <div class="form-row">
                                        <label id="lblmaritalstatus" runat="server" for="maritalstatus" class="col-md-3 col-form-label form-label">Marital Status  </label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlmaritalstatus" CssClass="form-control" runat="server">
                                            </asp:DropDownList>
                                            <span class="helpicon"><i id="icmaritalstatus" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        <div id="fieldcontainer" runat="server">
                            <div class="list-group-item" id="marriagedob" >
                                <div class="form-group m-0" role="group" aria-labelledby="label-marriagedob">
                                    <div class="form-row">
                                        <label id="lblmarriagedob" runat="server" for="marriagedob" class="col-md-3 col-form-label form-label">Date of Marriage </label>
                                        <div class="col-md-6">
                                             <input id="txtmarriagedob" runat="server" type="text" class="form-control" placeholder="Marriage Date" data-toggle="flatpickr" value="">
                                            <span class="helpicon"><i id="icmarriagedob" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                             <div class="list-group-item" id="spousenationality">
                                <div class="form-group m-0" role="group" aria-labelledby="label-spousenationality">
                                    <div class="form-row">
                                        <label id="lblspousenationality" runat="server" for="spousenationality" class="col-md-3 col-form-label form-label">Nationality of Spouse</label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlspousenationality" CssClass="form-control" runat="server">
                                            </asp:DropDownList>
                                            <span class="helpicon"><i id="icspousenationality" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                            <div class="list-group-item" id="profilepic">
                                <div class="form-group m-0" role="group" aria-labelledby="label-dob">
                                    <div class="form-row">
                                        <label id="Label1" runat="server" for="dateofissue" class="col-md-3 col-form-label form-label">Upload Profile Picture</label>
                                        <div class="col-md-6">
                                            <asp:Label ID="lblupload" runat="server" />
                                            <asp:FileUpload ID="FileUpload" runat="server" /> 
                                            <input type="hidden" id="hidDocumentPath" runat="server" />
                                            <asp:HyperLink runat="server" ID="uploadedFile" Target="_blank"></asp:HyperLink>
                                        </div>
                                    </div>
                                </div>
                            </div> 
                                <h5>Prior Qualifications</h5>
                             <div class="list-group-item" id="highestqualification" >
                                <div class="form-group m-0" role="group" aria-labelledby="label-highestqualification">
                                    <div class="form-row">
                                        <label id="lblhighestqualification" runat="server" for="highestqualification" class="col-md-3 col-form-label form-label">Name of Highest Qualification Completed  </label>
                                        <div class="col-md-6">
                                            <input id="txthighestqualification" runat="server" type="text" class="form-control" placeholder="Name of Highest Qualification Completed" />
                                            <span class="helpicon"><i id="ichighestqualification" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                             <div class="list-group-item" id="highestqualificationAchieved" >
                                <div class="form-group m-0" role="group" aria-labelledby="label-highestqualificationAchieved">
                                    <div class="form-row">
                                        <label id="lblhighestqualificationAchieved" runat="server" for="highestqualificationAchieved" class="col-md-3 col-form-label form-label">LEVEL OF HIGHEST QUALIFICATION ACHIEVED  </label>
                                        <div class="col-md-6">
                                           <asp:DropDownList ID="ddlhighestqualificationAchieved" CssClass="form-control" runat="server">
                                            </asp:DropDownList>
                                            <span class="helpicon"><i id="ichighestqualificationAchieved" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                             <div class="list-group-item" id="highestqualificationfield">
                                <div class="form-group m-0" role="group" aria-labelledby="label-highestqualificationfield">
                                    <div class="form-row">
                                        <label id="lblhighestqualificationfield" runat="server" for="highestqualificationfield" class="col-md-3 col-form-label form-label">FIELD OF STUDY OF HIGHEST QUALIFICATION</label>
                                        <div class="col-md-6">
                                             <asp:DropDownList ID="ddlhighestqualificationfield" CssClass="form-control" runat="server">
                                            </asp:DropDownList>                                            
                                            <span class="helpicon"><i id="ichighestqualificationfield" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="highestqualificationdate">
                                <div class="form-group m-0" role="group" aria-labelledby="label-highestqualificationdate">
                                    <div class="form-row">
                                        <label id="lblhighestqualificationdate" runat="server" for="highschoolendDate" class="col-md-3 col-form-label form-label">YEAR & MONTH THE HIGHEST QUALIFICATION WAS COMPLETED</label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlhighestqualificationmonth" CssClass="form-control" runat="server"></asp:DropDownList>
                                            <asp:DropDownList ID="ddlhighestqualificationYear" CssClass="form-control" runat="server"></asp:DropDownList>
                                            <span class="helpicon"><i id="ichighestqualificationdate" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="highestqualificationcountry">
                                <div class="form-group m-0" role="group" aria-labelledby="label-highestqualificationcountry">
                                    <div class="form-row">
                                        <label id="lblhighestqualificationcountry" runat="server" for="highestqualificationcountry" class="col-md-3 col-form-label form-label">country of highest Qualification </label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlhighestqualificationcountry" CssClass="form-control" runat="server">
                                            </asp:DropDownList>
                                            <span class="helpicon"><i id="ichighestqualificationcountry" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                             <div class="list-group-item" id="workexperience">
                                <div class="form-group m-0" role="group" aria-labelledby="label-workexperience">
                                    <div class="form-row">
                                        <label id="lblworkexperience" runat="server" for="workexperience" class="col-md-3 col-form-label form-label">WORK EXPERIENCE (NUMBER OF YEARS) </label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlworkexperience" CssClass="form-control" runat="server">
                                            </asp:DropDownList>
                                            <span class="helpicon"><i id="icworkexperience" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                             <div class="list-group-item" id="typeofworkexperience">
                                <div class="form-group m-0" role="group" aria-labelledby="label-typeofworkexperience">
                                    <div class="form-row">
                                        <label id="lbltypeofworkexperience" runat="server" for="typeofworkexperience" class="col-md-3 col-form-label form-label">TYPE OF WORK EXPERIENCE. </label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddltypeofworkexperience" CssClass="form-control" runat="server">
                                            </asp:DropDownList>
                                            <asp:HiddenField runat="server" ID="hidddltypeofworkexperience"/>
                                            <span class="helpicon"><i id="i1ctypeofworkexperience" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                                <h5>Course You Are Applying For</h5>
                            <div class="list-group-item" id="universityname" runat="server">
                                <div class="form-group m-0" role="group" aria-labelledby="label-universityname">
                                    <div class="form-row">
                                        <label id="lbluniversityname" runat="server" for="universityname" class="col-md-3 col-form-label form-label">NAME OF UNIVERSITY YOU ARE APPLYING TO  </label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddluniversityname" CssClass="form-control" runat="server">
                                            </asp:DropDownList>
                                            <span class="helpicon"><i id="icuniversityname" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>

                           <%-- <div class="list-group-item" id="universityCampus" runat="server">
                                <div class="form-group m-0" role="group" aria-labelledby="label-universitycampusname">
                                    <div class="form-row">
                                        <label id="lblCampusName" runat="server" for="universitycampusname" class="col-md-3 col-form-label form-label">Please select university campus you are applying to  </label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlUniversityCampus" CssClass="form-control" runat="server">
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                            </div>--%>
                            <div class="list-group-item" id="universityCountry" runat="server">
                                <div class="form-group m-0" role="group" aria-labelledby="label-universityCountry">
                                    <div class="form-row">
                                        <label id="lbluniversityCountry" runat="server" for="universityCountry" class="col-md-3 col-form-label form-label">Country where chosen Educational Institution is located  </label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddluniversityCountry" CssClass="form-control" runat="server">
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                            </div>
                              <div class="list-group-item" id="eduinstitutioncity">
                                <div class="form-group m-0" role="group" aria-labelledby="label-eduinstitutioncity">
                                    <div class="form-row">
                                        <label id="lbleduinstitutioncity" runat="server" for="eduinstitutioncity" class="col-md-3 col-form-label form-label">CITY WHERE CHOSEN UNIVERSITY IS LOCATED</label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddleduinstitutioncity" runat="server" class="form-control">
                                                <asp:ListItem Value="0">Please Select</asp:ListItem>
                                            </asp:DropDownList>                                            
                                            <asp:HiddenField ID="hidCityField" runat="server" />
                                            <span class="helpicon"><i id="iceduinstitutioncity" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                           

                            <div class="list-group-item" id="courseapplied">
                                <div class="form-group m-0" role="group" aria-labelledby="label-courseapplied">
                                    <div class="form-row">
                                        <label id="lblcourseapplied" runat="server" for="courseapplied" class="col-md-3 col-form-label form-label">Level of Course you are applying for </label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlcourseapplied" CssClass="form-control" runat="server">
                                            </asp:DropDownList>                                            
                                            <span class="helpicon"><i id="iccourseapplied" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="fieldofstudy">
                                <div class="form-group m-0" role="group" aria-labelledby="label-fieldofstudy">
                                    <div class="form-row">
                                        <label id="lblfieldofstudy" runat="server" for="fieldofstudey" class="col-md-3 col-form-label form-label">FIELD OF STUDY YOU ARE APPLYING TO </label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlfieldofstudy" CssClass="form-control" runat="server">
                                            </asp:DropDownList>
                                            <span class="helpicon"><i id="icfieldofstudy" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="nameofcourse">
                                <div class="form-group m-0" role="group" aria-labelledby="label-nameofcourse">
                                    <div class="form-row">
                                        <label id="lblnameofcourse" runat="server" for="nameofcourse" class="col-md-3 col-form-label form-label">Name of Course you are applying for (First Choice)</label>
                                        <div class="col-md-6">
                                            <input id="txtnameofcourse" runat="server" type="text" class="form-control" placeholder="Name Of Course">
                                           <%-- <asp:DropDownList runat="server" ID="ddlnameofcourse" CssClass="form-control">
                                                <asp:ListItem Value="">Please select</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:HiddenField ID="hidnameofcourse" runat="server"/>--%>
                                            <span class="helpicon"><i id="icnameofcourse" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="commencementdate" >
                                <div class="form-group m-0" role="group" aria-labelledby="label-commencementdate">
                                    <div class="form-row">
                                        <label id="lblcommencementdate" runat="server" for="commencementdate" class="col-md-3 col-form-label form-label">Date of course commencement </label>
                                        <div class="col-md-6">
                                           <%-- <input id="txtcommencementdate" runat="server" type="text" class="form-control" placeholder="Date of course commencement" data-toggle="flatpickr" value="">--%>
                                             <%--<asp:DropDownList runat="server" ID="ddlCommencementdate" CssClass="form-control">
                                                <asp:ListItem Value="0">Please Select </asp:ListItem>
                                            </asp:DropDownList>  
                                            <asp:HiddenField ID="hidCommencementDate" runat="server" />--%>
                                            <asp:DropDownList ID="ddlCommencementdateYear" CssClass="form-control" runat="server">                                                
                                            </asp:DropDownList>
                                            <asp:DropDownList ID="ddlCommencementdateMonth" CssClass="form-control" runat="server">
                                            </asp:DropDownList>       
                                            <span class="helpicon"><i id="iccommencementdate" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                          
                            <div class="list-group-item" id="annualfee">
                                <div class="form-group m-0" role="group" aria-labelledby="label-annualfee">
                                    <div class="form-row">
                                        <label id="lblannualfee" runat="server" for="annualfee" class="col-md-3 col-form-label form-label">ESTIMATED ANNUAL TUITION FEE AND LIVING COSTS </label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlannualfee" CssClass="form-control" runat="server">
                                            </asp:DropDownList>
                                            <span class="helpicon"><i id="icannualfee" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="agent" runat="server">
                                <div class="form-group m-0" role="group" aria-labelledby="label-agent">
                                    <div class="form-row">
                                        <label id="labelagent" runat="server" for="agent" class="col-md-3 col-form-label form-label">Are you reffered by Agent</label>
                                        <div class="col-md-6">
                                            <asp:RadioButton ID="rblAgentYes" runat="server" CssClass="form-control" GroupName="agent" Text="Yes" />
                                            <asp:RadioButton ID="rblAgentNo" runat="server" CssClass="form-control" GroupName="agent" Text="No" /><span class="helpicon"><i id="icAgent" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="agentList" runat="server">
                                <div class="form-group m-0" role="group" aria-labelledby="label-agentList">
                                    <div class="form-row">
                                        <label id="labelagentList" runat="server" for="agentList" class="col-md-3 col-form-label form-label">Agent Name</label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlAgent" runat="server" CssClass="form-control"></asp:DropDownList><span class="helpicon"><i id="icAgentList" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="addnewagent" runat="server">
                                <div class="form-group m-0" role="group" aria-labelledby="label-addnewagent">
                                    <div class="form-row">
                                        <label id="labeladdnewagent" runat="server" for="addnewagent" class="col-md-3 col-form-label form-label">If didn't find agent name in the list then add his email ID to sent registeration link</label>
                                        <div class="col-md-6">
                                            <asp:TextBox ID="txtAgentname" runat="server" CssClass="form-control"></asp:TextBox><span class="helpicon"><i id="icNewAgent" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                            &nbsp;
                                              <div class="col-md-6">
                                                  <asp:Button ID="btnNewAgent" runat="server" Text="Ask to Register" CssClass="btn btn-success" OnClientClick="return registeragentBysentEmail();"/>
                                              </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                           


                            <div id="mainDiv" runat="server"></div>
                            <div class="list-group-item" id="gteapplicantdetail">
                                <div class="form-group m-0" role="group" aria-labelledby="label-gteapplicantdetail">
                                    <div class="form-row">                                       
                                        
                                        <asp:Button ID="btngteapplicantdetail" runat="server" Text="Save Changes" CssClass="btn btn-success" OnClientClick="return validateForm()" OnClick="btngteapplicantdetail_Click" style="margin-right: 271px;" />                                        
                                       
                                        <div class="col-md-6">
                                            <asp:Label ID="lblMessage" runat="server" Visible="false"></asp:Label>
                                            <asp:Label ID="lblSaveTime" runat="server" Visible="false"></asp:Label>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="banImg-wrp">
                        <img src="/assets/images/Banner1.jpg" class="img-fluid">
                    </div>
                    <div class="card faq-qwrp" id="questions" runat="server">
                            <div class="card-body">
                            <%  if (allQuestions.Count > 0)
                                { %>
                            <div id="question" runat="server">
                                    <h5>Frequently Asked Questions (FAQs)</h5>
                                    <div class="">
                                    <%for (int q = 0; q < allQuestions.Count; q++)
                                        {%>  <div class="star-list">                                                             
                                                <label onclick="showFaqQuestion('<%=allQuestions[q].question%>','<%=allQuestions[q].answer.Replace(Environment.NewLine, "<br />") %>')">  <%=allQuestions[q].question%> </label>
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
        <div class="container page__container">
            <div class="footer">
            </div>

        </div>
    </div>

    <script>
        function registeragentBysentEmail() {
            if ($("#<%=txtAgentname.ClientID%>").val() != "") {
                var email = $("#<%=txtAgentname.ClientID%>").val();
                $.ajax({
                    type: "POST",
                    url: "gte_studentdetails.aspx/sendemailtoAgent",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: "{'email': '" + email + "'}",
                    success: function (result) {
                        if (result) {                            
                            alert("Request send to mention email id of agent");
                        }
                    }
                });
                return false;

            }
            else {
                alert("Please enter email id of agent to ask them to register");
                return false;
            }
        }
        $('#ContentPlaceHolder1_txtdob').flatpickr({       
            dateFormat: 'Y-m-d', defaultDate: "", altInput: true, altFormat: 'd/m/Y'
        });
              
        $('#ContentPlaceHolder1_txtmarriagedob').flatpickr({
            dateFormat: 'Y-m-d', defaultDate: ""
        });

        $('#ContentPlaceHolder1_txtcommencementdate').flatpickr({
            dateFormat: 'Y-m-d', defaultDate: ""
        });


        function validateForm() {
            var flag = false;
            if ($("#<%=txtdob.ClientID%>").val() == "")
                alert("Please Select Date OF Birth");
            else if ($("#<%=ddlnationality.ClientID%>").val() == "0")
                alert("Please Select Nationality");
            else if ($("#<%=ddlcountryofdob.ClientID%>").val() == "0")
                alert("Please Select Country Of Date Of Birth");
            else if ($("#<%=ddlmaritalstatus.ClientID%>").val() == "0")
                alert("Please Select Marital Status");            
            else if ($("#<%=txtmarriagedob.ClientID%>").val() == "" && $("#<%=ddlmaritalstatus.ClientID%> option:selected").text() == "Married")
                alert("Please Select Date OF Marriage");
            else if ($("#<%=ddlspousenationality.ClientID%>").val() == "0" && $("#<%=ddlmaritalstatus.ClientID%> option:selected").text() == "Married")
                alert("Please Select Spouse NationalityOF Birth"); 
            else if ($("#<%=FileUpload.ClientID%>").val() == "" && $("#<%=hidDocumentPath.ClientID%>").val() == "")
                alert("Please upload profile picture");
            else if (!validfileExtention($("#<%=FileUpload.ClientID%>").val(), $("#<%=hidDocumentPath.ClientID%>").val()))
                alert("Please upload valid file format");
            else if (!checkFileSize()) 
                alert("photo Size should be less than 16MB");                        
            else if ($("#<%=txthighestqualification.ClientID%>").val() == "")
                alert("Please Enter Highest Education Name");
            else if ($("#<%=ddlhighestqualificationAchieved.ClientID%>").val() == "0")
                alert("Please Select highest qualification Achieved");
            else if ($("#<%=ddlhighestqualificationfield.ClientID%>").val() == "0")
                alert("Please Select Fielf Of STudy Of Highest Qualification");
            else if ( $("#<%=ddlhighestqualificationcountry.ClientID%>").val() == "0")
                alert("Please Select country Of Highest QualificationBirth");
            else if ($("#<%=ddlcourseapplied.ClientID%>").val() == "0")
                alert("Please Select Level of Course you are applying for ");
            else  if ($("#<%=ddlfieldofstudy.ClientID%>").val() == "0")
                alert("Please Select Field of study Applying to");
            <%--else  if ($("#<%=ddlUniversityCampus.ClientID%>").val() == "0")
                alert("Please select university campus you are applying to");--%>
            else if ($("#<%=txtnameofcourse.ClientID%>").val() == "")
                alert("Please enter Name of Course you are applying for");
            else if ($("#<%=ddlCommencementdateMonth.ClientID%>").val() == "0" && $("#<%=ddlCommencementdateYear.ClientID%>").val() == "0")
                alert("Please Select Date of course commencement ");
            else if ($("#<%=ddlworkexperience.ClientID%>").val() == "0")
                alert("Please Select Work experience ");
            else if ($("#<%=ddlcountryresidence.ClientID%>").val() == "0")
                alert("Please Select Current Country of Residence ");
            else if ($("#<%=ddlannualfee.ClientID%>").val() == "0")
                alert("Please Select My Annual Tuition Fee and living costs is expected to be ");
            else if ($("#<%=ddluniversityname.ClientID%>").val() == "0")
                alert("Please Select Name of University Apply for ");
            else if ($("#<%=ddleduinstitutioncity.ClientID%>").val() == null && isNaN(parseInt($('#ContentPlaceHolder1_hidCityField').val())))
                alert("Please Select Name of City of Educational Institution");
            else if (!($("#<%=rblAgentYes.ClientID%>").is(':checked') || $("#<%=rblAgentNo.ClientID%>").is(':checked')))
                alert("Please Select Option to record reffrerd by agent");
            else if ($("#<%=rblAgentYes.ClientID%>").is(':checked') && ($("#<%=ddlAgent.ClientID%>").val() == "0"))
                alert("Please Select valid agent details");
            else
                flag = true;
           return flag;
        }

        function validfileExtention(filepath , hidDocumentPath) {
            if (filepath == "")
            {
               filepath = hidDocumentPath;
            }
            if (!filepath)
                return false;
            var fileExtension = filepath.substring(filepath.lastIndexOf(".") + 1).toString().toLowerCase();
            if (filepath != "")
            {
                if (fileExtension != "jpg" && fileExtension != "png" && fileExtension !="jpeg")                    
                    return false;                                   
            }
            return true;
        }
        function checkFileSize() {
            var fileSize = $("#ContentPlaceHolder1_FileUpload")[0].files[0].size;
            var fileSizeInMB = (fileSize / 1024) / 1024;
            return (fileSizeInMB < 16);
        }

        $(function () {
            $("input[name='ctl00$ContentPlaceHolder1$agent']").click(function () {
                if ($("#<%=rblAgentYes.ClientID%>").is(":checked")) {
                   $("#<%=agentList.ClientID%>").show(); $("#<%=addnewagent.ClientID%>").show();
                }
                else {
                    $("#<%=agentList.ClientID%>").hide(); $("#<%=addnewagent.ClientID%>").hide();
                }
            });
        });

        $(document).ready(function () {

            $('.fa-info-circle').tipso({
                position: 'right',
                background: 'rgba(0,0,0,0.8)',
                useTitle: false,
            });

            if ($("#<%=rblAgentYes.ClientID%>").is(':checked')) {
                    $("#<%=agentList.ClientID%>").show(); $("#<%=addnewagent.ClientID%>").show();
            } else { $("#<%=agentList.ClientID%>").hide(); $("#<%=addnewagent.ClientID%>").hide(); }

            var maritalStatus = $("#<%=ddlmaritalstatus.ClientID%> option:selected").text();
            $("#<%=ddlmaritalstatus.ClientID%>").change(function () {
                maritalStatus = $("#<%=ddlmaritalstatus.ClientID%> option:selected").text();
                if (maritalStatus == "Married")
                    $("#<%=fieldcontainer.ClientID%>").show();
                else {
                    $("#<%=fieldcontainer.ClientID%>").hide();                   
                }
            });

            <%--$("#<%=ddluniversityname.ClientID%>").change(function () {
                var universityID = $("#<%=ddluniversityname.ClientID%>").val()
                if (universityID > 0) {
                    $.ajax({
                        type: "GET",
                        url: "gte_studentdetails.aspx/GetUniversityCities",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: { universityId: universityID },
                        success: function (response) {
                            if (response.d) {
                                var result = JSON.parse(response.d);
                                if ($("#<%=ddleduinstitutioncity.ClientID%>").length >= 1) {
                                    $("#<%=ddleduinstitutioncity.ClientID%>").empty();
                                    $("#<%=ddleduinstitutioncity.ClientID%>").append($('<option selected="selected" disabled="disabled"></option>').val("0").html("Please Select City"));
                                }
                                for (var i = 0; i < result.length; i++)
                                    $("#<%=ddleduinstitutioncity.ClientID%>").append($("<option></option>").val(result[i].city_id).html(result[i].cityName));
                            }
                        }
                    });
                }
            });
            
            $("#<%=ddleduinstitutioncity.ClientID%>").change(function () {
                $("#<%=hidCityField.ClientID%>").val($("#<%=ddleduinstitutioncity.ClientID%>").val());
            });--%>

            if (maritalStatus == "Married") 
                $("#<%=fieldcontainer.ClientID%>").show();
            else
                $("#<%=fieldcontainer.ClientID%>").hide();
                      
        });
        
       var workstatus = $("#<%=ddlworkexperience.ClientID%> option:selected").text();
            $("#<%=ddlworkexperience.ClientID%>").change(function () {
            workstatus = $("#<%=ddlworkexperience.ClientID%> option:selected").text();
                if (workstatus == "None") {
                    $("#<%=ddltypeofworkexperience.ClientID%>").empty();
                    $("#<%=ddltypeofworkexperience.ClientID%>").append($('<option selected="selected"></option>').val(1).html("Not Applicable"));                    
                }
                else if(workstatus != "None" && workstatus != "Please Select")
                {
                        $.ajax({
                        type: "GET",
                        url: "gte_studentdetails.aspx/GetWorkTypeDropdown",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (response) 
                            {
                                if (response.d) 
                                {
                                    var result = JSON.parse(response.d);                            
                                    if ($("#<%=ddltypeofworkexperience.ClientID%>").length >= 1) {
                                        $("#<%=ddltypeofworkexperience.ClientID%>").empty();
                                        $("#<%=ddltypeofworkexperience.ClientID%>").append($('<option selected="selected"></option>').val(0).html("Please Select"));
                                    }
                                    for (var i = 0; i < result.length; i++) {
                                        $("#<%=ddltypeofworkexperience.ClientID%>").append($("<option></option>").val(result[i].id).html(result[i].description));
                                    }
                                }
                            }
                        });
                }
        });            
      $("#<%=ddltypeofworkexperience.ClientID%>").change(function () {
            $("#<%=hidddltypeofworkexperience.ClientID%>").val($("#<%=ddltypeofworkexperience.ClientID%>").val());
        });
       <%-- $("#<%=ddlcourseapplied.ClientID%>").change(function () {
            if ($("#<%=ddlfieldofstudy.ClientID%>").val() != "" && $("#<%=ddlUniversityCampus.ClientID%>").val() != "0") {
                var coursetype = $("#<%=ddlcourseapplied.ClientID%>").val();
                var majorid = $("#<%=ddlfieldofstudy.ClientID%>").val();
                var campusId = $("#<%=ddlUniversityCampus.ClientID%>").val();
                $.ajax({
                    type: "POST",
                    url: "gte_studentdetails.aspx/GetCourseDropdown",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: "{'coursetypeid': '" + coursetype + "','selectedMajorid': '" + majorid + "', 'campusId': '" + campusId + "'}",
                    success: function (response) {
                        if (response.d) {
                            var result = JSON.parse(response.d);
                            if ($("#<%=ddlnameofcourse.ClientID%>").length >= 1) {
                                $("#<%=ddlnameofcourse.ClientID%>").empty();
                                $("#<%=ddlnameofcourse.ClientID%>").append($('<option selected="selected"></option>').val(0).html("Select Course"));
                            }
                            for (var i = 0; i < result.length; i++) {
                                $("#<%=ddlnameofcourse.ClientID%>").append($("<option></option>").val(result[i].courseid).html(result[i].coursename));
                            }
                        }
                    }
                });
            }
        });--%>
       <%-- $("#<%=ddlfieldofstudy.ClientID%>").change(function () {
            if ($("#<%=ddlcourseapplied.ClientID%>").val() != "0" && $("#<%=ddlUniversityCampus.ClientID%>").val() != "0") {
                var coursetype = $("#<%=ddlcourseapplied.ClientID%>").val();
                var majorid = $("#<%=ddlfieldofstudy.ClientID%>").val();
                var campusId = $("#<%=ddlUniversityCampus.ClientID%>").val();
                $.ajax({
                    type: "POST",
                    url: "gte_studentdetails.aspx/GetCourseDropdown",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: "{'coursetypeid': '" + coursetype + "','selectedMajorid': '" + majorid + "', 'campusId': '" + campusId + "'}",
                    success: function (response) {
                        if (response.d) {
                            var result = JSON.parse(response.d);
                            if ($("#<%=ddlnameofcourse.ClientID%>").length >= 1) {
                                $("#<%=ddlnameofcourse.ClientID%>").empty();
                                $("#<%=ddlnameofcourse.ClientID%>").append($('<option selected="selected"></option>').val(0).html("Select Course"));
                            }
                            for (var i = 0; i < result.length; i++) {
                                $("#<%=ddlnameofcourse.ClientID%>").append($("<option></option>").val(result[i].courseid).html(result[i].coursename));
                            }
                        }
                    }
                });
            }
        });--%>

        <%--$("#<%=universityCampus.ClientID%>").change(function () {
            if ($("#<%=ddlfieldofstudy.ClientID%>").val() != "" && $("#<%=ddlcourseapplied.ClientID%>").val() != "0") {
                var coursetype = $("#<%=ddlcourseapplied.ClientID%>").val();
                var majorid = $("#<%=ddlfieldofstudy.ClientID%>").val();
                var campusId = $("#<%=ddlUniversityCampus.ClientID%>").val();
                $.ajax({
                    type: "POST",
                    url: "gte_studentdetails.aspx/GetCourseDropdown",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: "{'coursetypeid': '" + coursetype + "','selectedMajorid': '" + majorid + "', 'campusId': '" + campusId + "'}",
                    success: function (response) {
                        if (response.d) {
                            var result = JSON.parse(response.d);
                            if ($("#<%=ddlnameofcourse.ClientID%>").length >= 1) {
                                $("#<%=ddlnameofcourse.ClientID%>").empty();
                                $("#<%=ddlnameofcourse.ClientID%>").append($('<option selected="selected"></option>').val(0).html("Select Course"));
                            }
                            for (var i = 0; i < result.length; i++)
                                $("#<%=ddlnameofcourse.ClientID%>").append($("<option></option>").val(result[i].courseid).html(result[i].coursename));
                        }
                    }
                });
            }
        });

        $("#<%=ddlnameofcourse.ClientID%>").change(function () {
            $("#<%=hidnameofcourse.ClientID%>").val($("#<%=ddlnameofcourse.ClientID%>").val());
        });--%>

        //comm date
        <%-- $("#<%=ddlnameofcourse.ClientID%>").change(function () {
            $("#<%=hidnameofcourse.ClientID%>").val($("#<%=ddlnameofcourse.ClientID%>").val());

            if ($("#<%=hidnameofcourse.ClientID%>").val() != "") {
                var courseId = $("#<%=ddlnameofcourse.ClientID%>").val();
                $.ajax({
                    type: "POST",
                    url: "gte_studentdetails.aspx/GetCommenceDateDropdown",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: "{'courseid': '" + courseId + "'}",
                    success: function (response) {
                        if (response.d) {
                            var result = JSON.parse(response.d);
                            if ($("#<%=ddlCommencementdate.ClientID%>").length >= 1) {
                                $("#<%=ddlCommencementdate.ClientID%>").empty();
                                $("#<%=ddlCommencementdate.ClientID%>").append($('<option selected="selected"></option>').val(0).html("Please Select"));
                            }
                            for (var i = 0; i < result.length; i++)
                                $("#<%=ddlCommencementdate.ClientID%>").append($("<option></option>").val(result[i].id).html(result[i].commencementdate));
                        }
                    }
                });
            }
        });

        $("#<%=ddlCommencementdate.ClientID%>").change(function () {
            $("#<%=hidCommencementDate.ClientID%>").val($("#<%=ddlCommencementdate.ClientID%>").val());
        });--%>
        $("#<%=ddluniversityCountry.ClientID%>").change(function () {
            var countryid = $("#<%=ddluniversityCountry.ClientID%>").val();
            var universityid = 0;
            if (<%= isunigrouped%> == 1)                 
                    universityid = $("#<%=ddluniversityname.ClientID%>").val();
            else
                universityid = '<%= Utility.GetUniversityId()%>';
            if(universityid != 0)
                $.ajax({
                    type: "GET",
                    url: "gte_studentdetails.aspx/GetCityDropdown",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: {countryId: countryid, universityid: universityid},                    
                    success: function (response) {
                        if (response.d) {
                            var result = JSON.parse(response.d);
                            if ($("#<%=ddleduinstitutioncity.ClientID%>").length >= 1) {
                                $("#<%=ddleduinstitutioncity.ClientID%>").empty();
                                $("#<%=ddleduinstitutioncity.ClientID%>").append($('<option selected="selected" disabled="disabled"></option>').val(0).html("Please Select"));
                            }
                            for (var i = 0; i < result.length; i++) {
                                $("#<%=ddleduinstitutioncity.ClientID%>").append($("<option></option>").val(result[i].city_id).html(result[i].name));
                            }
                        }
                    }
                });

            });

            $("#<%=ddleduinstitutioncity.ClientID%>").change(function () {
                $("#<%=hidCityField.ClientID%>").val($("#<%=ddleduinstitutioncity.ClientID%>").val());
            });
        $(document).ready(function () {
            $('.sidebar-menu-item').removeClass('open');
            $('#Gte_list').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#gtestudentdetail').addClass('active');
        });
    </script>
</asp:Content>




