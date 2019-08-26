<%@ Page Language="C#" AutoEventWireup="true" CodeFile="gte_studentdetails.aspx.cs" Inherits="gte_studentdetails" MasterPageFile="~/student.master"%>
<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="container-fluid page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">Student Details</li>
        </ol>
        <h1 class="h2">Student Details</h1>
    </div>

    <div class="page ">
        <div class="container page__container p-0">
            <div class="row m-0">
                <div class="col-lg container-fluid page__container">

                    <div class="card faq-lftcard" style="width: 650px;">
                        <div class="list-group list-group-fit">
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
                                        <label id="lblnationality" runat="server" for="nationality" class="col-md-3 col-form-label form-label">Nationality</label>
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
                                        <label id="lblhighestqualificationAchieved" runat="server" for="highestqualificationAchieved" class="col-md-3 col-form-label form-label">Highest Qualification Achieved  </label>
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
                                        <label id="lblhighestqualificationfield" runat="server" for="highestqualificationfield" class="col-md-3 col-form-label form-label">Field of study of Highest Education </label>
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
                                        <label id="lblhighestqualificationdate" runat="server" for="highschoolendDate" class="col-md-3 col-form-label form-label">Year & Month of highest Qualification</label>
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
                                        <label id="lblfieldofstudy" runat="server" for="fieldofstudey" class="col-md-3 col-form-label form-label">Field of study Applying to </label>
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
                                            <input id="txtcommencementdate" runat="server" type="text" class="form-control" placeholder="Date of course commencement" data-toggle="flatpickr" value="">
                                            <span class="helpicon"><i id="iccommencementdate" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="workexperience">
                                <div class="form-group m-0" role="group" aria-labelledby="label-workexperience">
                                    <div class="form-row">
                                        <label id="lblworkexperience" runat="server" for="workexperience" class="col-md-3 col-form-label form-label">Work experience (no of years) </label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlworkexperience" CssClass="form-control" runat="server">
                                            </asp:DropDownList>
                                            <span class="helpicon"><i id="icworkexperience" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
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
                            <div class="list-group-item" id="annualfee">
                                <div class="form-group m-0" role="group" aria-labelledby="label-annualfee">
                                    <div class="form-row">
                                        <label id="lblannualfee" runat="server" for="annualfee" class="col-md-3 col-form-label form-label">My Annual Tuition Fee and living costs is expected to be </label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlannualfee" CssClass="form-control" runat="server">
                                            </asp:DropDownList>
                                            <span class="helpicon"><i id="icannualfee" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="universityname">
                                <div class="form-group m-0" role="group" aria-labelledby="label-universityname">
                                    <div class="form-row">
                                        <label id="lbluniversityname" runat="server" for="universityname" class="col-md-3 col-form-label form-label">Name of University Apply for  </label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddluniversityname" CssClass="form-control" runat="server">
                                            </asp:DropDownList>
                                            <span class="helpicon"><i id="icuniversityname" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="eduinstitutioncity">
                                <div class="form-group m-0" role="group" aria-labelledby="label-eduinstitutioncity">
                                    <div class="form-row">
                                        <label id="lbleduinstitutioncity" runat="server" for="eduinstitutioncity" class="col-md-3 col-form-label form-label">Name of City of Educational Institution  </label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddleduinstitutioncity" CssClass="form-control" runat="server">
                                            </asp:DropDownList>
                                            <span class="helpicon"><i id="iceduinstitutioncity" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div id="mainDiv" runat="server"></div>
                            <div class="list-group-item" id="gteapplicantdetail">
                                <div class="form-group m-0" role="group" aria-labelledby="label-gteapplicantdetail">
                                    <div class="form-row">                                       
                                        
                                        <asp:Button ID="btngteapplicantdetail" runat="server" Text="Save Changes" CssClass="btn btn-success" OnClientClick="return validateForm()" OnClick="btngteapplicantdetail_Click" style="margin-right: 271px;" />
                                        <a href="gte_questions1.aspx" class="btn btn-success">Next</a>
                                        <div class="col-md-6">
                                            <asp:Label ID="lblMessage" runat="server" Visible="false"></asp:Label>
                                            <asp:Label ID="lblSaveTime" runat="server" Visible="false"></asp:Label>
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
                                                <label onclick="openLink('<%=allQuestions[q].answer%>')"> * <%=allQuestions[q].question%> </label>                                                             
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
          function openLink(url) {
            $('body').append('<div class="modal" id="video-modal" tabindex="-1" role="dialog"><div class="modal-dialog" role="document"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button></div><div class="modal-body"><div class="">Ans:' +url+ '</div></div></div></div></div>'  );
            $('#video-modal').modal('show');
             $('#video-modal').on('hidden.bs.modal', function () {
                 $('#video-modal').remove();
            });
        }

        $('#ContentPlaceHolder1_txtdob').flatpickr({       
            dateFormat: 'Y-m-d', defaultDate: ""
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
            else if ($("#<%=txtnameofcourse.ClientID%>").val() == "")
                alert("Please Select Name of Course you are applying for");
            else if ($("#<%=txtcommencementdate.ClientID%>").val() == "")
                alert("Please Select Date of course commencement ");
            else if ($("#<%=ddlworkexperience.ClientID%>").val() == "0")
                alert("Please Select Work experience ");
            else if ($("#<%=ddlcountryresidence.ClientID%>").val() == "0")
                alert("Please Select Current Country of Residence ");
            else if ($("#<%=ddlannualfee.ClientID%>").val() == "0")
                alert("Please Select My Annual Tuition Fee and living costs is expected to be ");
            else if ($("#<%=ddluniversityname.ClientID%>").val() == "0")
                alert("Please Select Name of University Apply for ");
            else if ($("#<%=ddleduinstitutioncity.ClientID%>").val() == "0")
                alert("Please Select Name of City of Educational Institution");         
            else
                flag = true;
           return flag;
        }
       
        $(document).ready(function () {

            $('.fa-info-circle').tipso({
                position: 'right',
                background: 'rgba(0,0,0,0.8)',
                useTitle: false,
            });

            var maritalStatus = $("#<%=ddlmaritalstatus.ClientID%> option:selected").text();
            $("#<%=ddlmaritalstatus.ClientID%>").change(function () {
                maritalStatus = $("#<%=ddlmaritalstatus.ClientID%> option:selected").text();
                if (maritalStatus == "Married")
                    $("#<%=fieldcontainer.ClientID%>").show();
                else {
                    $("#<%=fieldcontainer.ClientID%>").hide();                   
                }
            });
            
            if (maritalStatus == "Married") 
                $("#<%=fieldcontainer.ClientID%>").show();
            else
                $("#<%=fieldcontainer.ClientID%>").hide();
                      
        });
        $(document).ready(function () {
            $('.sidebar-menu-item').removeClass('open');
            $('#Gte_list').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#gtestudentdetail').addClass('active');
        });
    </script>
</asp:Content>




