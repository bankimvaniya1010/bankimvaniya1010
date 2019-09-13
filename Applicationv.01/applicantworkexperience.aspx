<%@ Page Language="C#" AutoEventWireup="true" CodeFile="applicantworkexperience.aspx.cs" Inherits="applicantworkexperience" MasterPageFile="~/student.master" %>

<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
   

    <div class="container-fluid page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">Work Experience/Employment Details

            </li>
        </ol>
        <h1 class="h2">Work Experience/Employment Details

        </h1>

    </div>
    <div class="page ">
        <div class="container page__container">
            <div class="row">
                <div class="col-md-8">

                    <div class="card">
                        <div class="list-group list-group-fit">

                            <asp:HiddenField ID="hdnemployer" runat="server" />
                            <asp:HiddenField ID="hdnRow" runat="server" />
                            <div class="card-body list-group-item" id="PreviousEmployment">
                                <div class="form-group m-0" role="group" aria-labelledby="label-PreviousEmployment">
                                    <div class="">
                                        <div class="">

                                            <div class="">
                                                <div class="table-responsive" data-toggle="lists" data-lists-values='["name"]'>
                                                    <asp:GridView ID="grdEmployment" DataKeyNames="employerId" runat="server" CssClass="table" AutoGenerateColumns="false" OnDataBound="grdEmployment_DataBound" OnRowDeleting="grdEmployment_RowDeleting" OnRowEditing="grdEmployment_RowEditing" OnRowCommand="grdEmployment_RowCommand">
                                                        <Columns>
                                                            <asp:TemplateField ItemStyle-Width="30px" HeaderText="Designation">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lbldesignation" runat="server"
                                                                        Text='<%#Eval("designation")%>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField ItemStyle-Width="30px" HeaderText="Organization">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblorganization" runat="server"
                                                                        Text='<%#Eval("organization")%>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField ItemStyle-Width="30px" HeaderText="Website">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblcontactpersonwithdetails" runat="server"
                                                                        Text='<%#Eval("website")%>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                            <asp:TemplateField HeaderText="From">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblStart" runat="server" Text='<%#Eval("durationfrom", "{0:dd/MM/yyyy}") %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="To">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lbldurationto" runat="server" Text='<%#Eval("durationto", "{0:dd/MM/yyyy}") %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Edit" ShowHeader="False">

                                                                <ItemTemplate>

                                                                    <asp:LinkButton ID="lnkEdit" runat="server" CausesValidation="False" CommandArgument='<%#Eval("employerId")%>' CommandName="Edit" Text="Edit"></asp:LinkButton>

                                                                </ItemTemplate>

                                                            </asp:TemplateField>

                                                            <asp:CommandField HeaderText="Delete" ShowDeleteButton="True" ShowHeader="True" />

                                                        </Columns>
                                                    </asp:GridView>

                                                </div>

                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                            <a class="btn btn-success" style="width: 200px" role="button" href="javascript:void(0)" onclick="toggleDisplay()">Add work experience</a>
                            <div id="employment" runat="server" style="display: none;">
                                <div class="list-group-item" id="employmentInfo" runat="server" style="display: none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-employment">
                                        <div class="form-row">
                                            <label id="labelemployment" runat="server" for="employment" class="col-md-3 col-form-label form-label">Do you wish to record any work experience that may be relevant to the course you are applying for?</label>
                                            <div class="col-md-6">
                                                <asp:RadioButton ID="rblEmploymentYes" runat="server" GroupName="Employment" Text="Yes" />
                                                <asp:RadioButton ID="rblEmploymentNo" runat="server" GroupName="Employment" Text="No" />
                                                <span class="helpicon"><i id="icemploymentInfo" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div id="fieldContainer" runat="server">
                                    <div class="list-group-item" id="yearsOfexp" runat="server" style="display: none;">
                                        <div class="form-group m-0" role="group" aria-labelledby="label-yearsOfexp">
                                            <div class="form-row">
                                                <label id="labelyearsOfexp" runat="server" for="yearsOfexp" class="col-md-3 col-form-label form-label">How many years of work experience Do You Wish To Record </label>
                                                <div class="col-md-6">
                                                    <asp:DropDownList ID="ddlworkexperience" CssClass="form-control" runat="server">
                                                    </asp:DropDownList>
                                                    <span class="helpicon"><i id="icyearsOfexp" runat="server" class="fa fa-info-circle" style="display: none"></i></span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="list-group-item" id="employer" runat="server" style="display: none;">
                                        <div class="form-group m-0" role="group" aria-labelledby="label-employer">
                                            <div class="form-row">
                                                <label id="labelemployer" runat="server" for="employer" class="col-md-3 col-form-label form-label">Name of Organization </label>
                                                <div class="col-md-6">
                                                    <input id="txtEmployer" runat="server" type="text" class="form-control" placeholder="Name of Organization ">
                                                    <span class="helpicon"><i id="icemployer" runat="server" class="fa fa-info-circle" style="display: none"></i></span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="list-group-item" id="employerwebsite" runat="server" style="display: none">
                                        <div class="form-group m-0" role="group" aria-labelledby="label-employerwebsite">
                                            <div class="form-row">
                                                <label id="labelemployerwebsite" runat="server" for="employerwebsite" class="col-md-3 col-form-label form-label">Website of the Organization</label>
                                                <div class="col-md-6">
                                                    <input id="txtemployerwebsite" runat="server" type="text" class="form-control" placeholder="Website" />
                                                    <asp:CheckBox ID="chkWebsite" runat="server" Text="Does Not Have Website" class="form-label"/>
                                                    <span class="helpicon"><i id="icemployerwebsite" runat="server" class="fa fa-info-circle" style="display: none"></i></span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="list-group-item" id="employercity" runat="server" style="display: none">
                                        <div class="form-group m-0" role="group" aria-labelledby="label-employercity">
                                            <div class="form-row">
                                                <label id="labelemployercity" runat="server" for="employercity" class="col-md-3 col-form-label form-label">City</label>
                                                <div class="col-md-6">
                                                    <input id="txtCity" runat="server" type="text" class="form-control" placeholder="City "><span class="helpicon"><i id="icemployercity" runat="server" class="fa fa-info-circle" style="display: none"></i></span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="list-group-item" id="employercountry" runat="server" style="display: none">
                                        <div class="form-group m-0" role="group" aria-labelledby="label-employercountry">
                                            <div class="form-row">
                                                <label id="labelemployercountry" runat="server" for="employercountry" class="col-md-3 col-form-label form-label">Country</label>
                                                <div class="col-md-6">
                                                    <asp:DropDownList ID="ddlCountry" runat="server" CssClass="form-control">
                                                    </asp:DropDownList><span class="helpicon"><i id="icemployercountry" runat="server" class="fa fa-info-circle" style="display: none"></i></span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="list-group-item" id="position" runat="server" style="display: none">
                                        <div class="form-group m-0" role="group" aria-labelledby="label-position">
                                            <div class="form-row">
                                                <label id="labelposition" runat="server" for="position" class="col-md-3 col-form-label form-label">Position/Role in</label>
                                                <div class="col-md-6">
                                                    <input id="txtPosition" runat="server" type="text" class="form-control" placeholder="Designation/Position"><span class="helpicon"><i id="icposition" runat="server" class="fa fa-info-circle" style="display: none"></i></span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="list-group-item" id="startdate" runat="server" style="display: none">
                                        <div class="form-group m-0" role="group" aria-labelledby="label-startdate">
                                            <div class="form-row">
                                                <label id="labelstartdate" runat="server" for="startdate" class="col-md-3 col-form-label form-label">Start Date</label>
                                                <div class="col-md-6">
                                                    <input id="txtStartDate" runat="server" type="text" class="form-control" placeholder="Start Date" data-toggle="flatpickr" value=""><span class="helpicon"><i id="icstartdate" runat="server" class="fa fa-info-circle" style="display: none"></i></span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="list-group-item" id="endate" runat="server" style="display: none">
                                        <div class="form-group m-0" role="group" aria-labelledby="label-endate">
                                            <div class="form-row">
                                                <label id="labelendate" runat="server" for="endate" class="col-md-3 col-form-label form-label">End Date</label>
                                                <div class="col-md-6">
                                                    <input id="txtEndate" runat="server" type="text" class="form-control" placeholder="End Date" data-toggle="flatpickr" value=""><span class="helpicon"><i id="icenddate" runat="server" class="fa fa-info-circle" style="display: none"></i></span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="list-group-item" id="briefDescription" runat="server" style="display: none">
                                        <div class="form-group m-0" role="group" aria-labelledby="label-briefDescription">
                                            <div class="form-row">
                                                <label id="labelbriefDescription" runat="server" for="briefDescription" class="col-md-3 col-form-label form-label">Brief Description of what you did</label>
                                                <div class="col-md-6">
                                                    <input id="txtbriefDescription" runat="server" type="text" class="form-control" placeholder="Brief Description of what you did"><span class="helpicon"><i id="icbriefDescription" runat="server" class="fa fa-info-circle" style="display: none"></i></span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="list-group-item" id="reportingmanger" runat="server" style="display: none">
                                        <div class="form-group m-0" role="group" aria-labelledby="label-reportingmanger">
                                            <div class="form-row">
                                                <label id="labelreportingmanger" runat="server" for="reportingmanger" class="col-md-3 col-form-label form-label">Name of your reporting Manager</label>
                                                <div class="col-md-6">
                                                    <input id="txtreportingmanger" runat="server" type="text" class="form-control" placeholder="Name of your reporting Manager"><span class="helpicon"><i id="icreportingmanger" runat="server" class="fa fa-info-circle" style="display: none"></i></span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="list-group-item" id="employmentverification" runat="server" style="display: none">
                                        <div class="form-group m-0" role="group" aria-labelledby="label-employmentverification">
                                            <div class="form-row">
                                                <label id="labelemploymentverification" runat="server" for="employmentverification" class="col-md-3 col-form-label form-label">Name of Contact who can verify your employment </label>
                                                <div class="col-md-6">
                                                    <input id="txtemploymentverification" runat="server" type="text" class="form-control" placeholder="Name of Contact who can verify your employment "><span class="helpicon"><i id="icemploymentverification" runat="server" class="fa fa-info-circle" style="display: none"></i></span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="list-group-item" id="relationship" runat="server" style="display: none">
                                        <div class="form-group m-0" role="group" aria-labelledby="label-relationship">
                                            <div class="form-row">
                                                <label id="labelrelationship" runat="server" for="relationship" class="col-md-3 col-form-label form-label">Relationship with the Contact  </label>
                                                <div class="col-md-6">
                                                    <asp:DropDownList ID="ddlRelationship" runat="server" CssClass="form-control">
                                                    </asp:DropDownList><span class="helpicon"><i id="icrelationship" runat="server" class="fa fa-info-circle" style="display: none"></i></span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="list-group-item" id="email" runat="server" style="display: none">
                                        <div class="form-group m-0" role="group" aria-labelledby="label-email">
                                            <div class="form-row">
                                                <label id="labelemail" runat="server" for="email" class="col-md-3 col-form-label form-label">Email ID of Contact who can verify your employment  </label>
                                                <div class="col-md-6">
                                                    <input id="txtEmail" runat="server" type="text" class="form-control" placeholder="Email ID of Contact who can verify your employment"><span class="helpicon"><i id="icemail" runat="server" class="fa fa-info-circle" style="display: none"></i></span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="list-group-item" id="linkedin" runat="server" style="display: none">
                                        <div class="form-group m-0" role="group" aria-labelledby="label-linkedin">
                                            <div class="form-row">
                                                <label id="labellinkedin" runat="server" for="linkedin" class="col-md-3 col-form-label form-label">LinkedIn Profile Link of the contact  </label>
                                                <div class="col-md-6">
                                                    <input id="txtlinkedin" runat="server" type="text" class="form-control" placeholder="LinkedIn Profile Link of the contact"><span class="helpicon"><i id="iclinkedin" runat="server" class="fa fa-info-circle" style="display: none"></i></span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="list-group-item">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-employerwebsite">
                                        <div class="form-row">
                                            <a href="applicantsocial.aspx?formid=8" class="btn btn-success" style="margin-right: 10px;">Social</a>
                                            <asp:Button ID="btn_Save" runat="server" Text="Save Changes" CssClass="btn btn-success" OnClick="btn_Save_Click" OnClientClick="return validateForm()" />
                                            <div class="col-md-6">
                                                <asp:Label ID="lblMessage" runat="server" Visible="false"></asp:Label>
                                                <asp:Label ID="lblSaveTime" runat="server"  Visible="false"></asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    </div>
                    <div class="col-md-4">
                    <div>
                        <img src="/assets/images/Banner1.jpg" class="img-fluid">
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
        <div class="container page__container">
            <div class="footer">
            </div>
        </div>
    </div>

    <script>

        function validateForm() {
            var emailRegex = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,10}(?:\.[a-z]{10})?)$/i;
            var flag = false;
            if (!$("#<%=employmentInfo.ClientID%>").is(':hidden') && !($("#<%=rblEmploymentYes.ClientID%>").is(':checked') || $("#<%=rblEmploymentNo.ClientID%>").is(':checked'))) {
                alert("Please Select Option to record any work experience");
            }
            else if ($("#<%=rblEmploymentYes.ClientID%>").is(":checked")) {
                if (!$("#<%=yearsOfexp.ClientID%>").is(':hidden') && $("#<%=ddlworkexperience.ClientID%>").val() == "0")
                    alert("Please Select years of work experience");
                else if (!$("#<%=employer.ClientID%>").is(':hidden') && $("#<%=txtEmployer.ClientID%>").val() == "")
                    alert("Please enter organization name");
                else if (!$("#<%=employerwebsite.ClientID%>").is(':hidden') && $("#<%=txtemployerwebsite.ClientID%>").val() == "" && !$("#<%=chkWebsite.ClientID%>").is(":checked"))
                    alert("Please Mention Website");
                else if (!$("#<%=employercity.ClientID%>").is(':hidden') && $("#<%=txtCity.ClientID%>").val() == "")
                    alert("Please Enter City Name");
                else if (!$("#<%=employercountry.ClientID%>").is(':hidden') && $("#<%=ddlCountry.ClientID%>").val() === "0")
                    alert("Please Select Country");
                else if (!$("#<%=position.ClientID%>").is(':hidden') && $("#<%=txtPosition.ClientID%>").val() == "")
                    alert("Please Enter Your Designation");
                else if (!$("#<%=startdate.ClientID%>").is(':hidden') && $("#<%=txtStartDate.ClientID%>").val() == "")
                    alert("Please Select Start Date");
                else if (!$("#<%=endate.ClientID%>").is(':hidden') && $("#<%=txtEndate.ClientID%>").val() == "")
                    alert("Please Select End Date");
                 else if ($("#<%=txtStartDate.ClientID%>").val() != "" && $("#<%=txtEndate.ClientID%>").val() != "" && $("#<%=txtStartDate.ClientID%>").val() > $("#<%=txtEndate.ClientID%>").val())
                    alert("Please Enter Valid end date");
                else if (!$("#<%=briefDescription.ClientID%>").is(':hidden') && $("#<%=txtbriefDescription.ClientID%>").val() == "")
                    alert("Please Enter Discription Of What You Did");
                else if (!$("#<%=reportingmanger.ClientID%>").is(':hidden') && $("#<%=txtreportingmanger.ClientID%>").val() == "")
                    alert("Please Mention Name Of Reporting Manager");
                else if (!$("#<%=employmentverification.ClientID%>").is(':hidden') && $("#<%=txtemploymentverification.ClientID%>").val() == "")
                    alert("Please Enter Name of Contact who can verify your employment");
                else if (!$("#<%=relationship.ClientID%>").is(':hidden') && $("#<%=ddlRelationship.ClientID%>").val() === "0")
                    alert("Please Select Relationship With Contact");
                else if (!$("#<%=email.ClientID%>").is(':hidden') && ($("#<%=txtEmail.ClientID%>").val() == ""  || !(emailRegex.test($("#<%=txtEmail.ClientID%>").val()))))
                    alert("Please Enter Valid Email ID of Contact");
                else if (!$("#<%=linkedin.ClientID%>").is(':hidden') && $("#<%=txtlinkedin.ClientID%>").val() == "")
                    alert("Please Enter LinkedIn Profile Link of the contact");
                else
                    flag = true;
            }
            else if ($("#<%=rblEmploymentNo.ClientID%>").is(":checked"))
                flag = true;

            return flag;
        }

        $(document).ready(function () {
          
              $('.fa-info-circle').tipso({
				position: 'right',
				background: 'rgba(0,0,0,0.8)',
				useTitle: false,
			});
            $("#<%=chkWebsite.ClientID%>").change(function () {
                if ($(this).is(":checked")) {
                    $("#<%=txtemployerwebsite.ClientID%>").val("");
                    $("#<%=txtemployerwebsite.ClientID%>").attr("disabled", "disabled");
                }
                else
                    $("#<%=txtemployerwebsite.ClientID%>").removeAttr("disabled");
            });

            var emp = $("#<%=hdnemployer.ClientID%>").val()
            if (emp != '') {
                $("#<%=fieldContainer.ClientID%>").show();
            }
            else {
                $("#<%=fieldContainer.ClientID%>").hide();
            }
        });

        $(function () {
            $("input[name='ctl00$ContentPlaceHolder1$Employment']").click(function () {
                if ($("#<%=rblEmploymentYes.ClientID%>").is(":checked")) {
                    $("#<%=fieldContainer.ClientID%>").show();
                }
                else {
                    $("#<%=fieldContainer.ClientID%>").hide();
                }
            });
        });

        $('#ContentPlaceHolder1_txtStartDate').flatpickr({

            dateFormat: 'Y-m-d', defaultDate: ""
        });

        $('#ContentPlaceHolder1_txtEndate').flatpickr({

            dateFormat: 'Y-m-d', defaultDate: ""
        });
        function ConfirmOnDelete(item) {
            if (confirm("Are you sure to delete: " + item + "?") == true)
                return true;
            else
                return false;
        }
        function toggleDisplay() {
                $("#<%=rblEmploymentYes.ClientID%>").prop("checked", false);
                $("#<%=rblEmploymentNo.ClientID%>").prop("checked", false);
                $("#<%=txtEmployer.ClientID%>").val("");
                $("#<%=txtemployerwebsite.ClientID%>").val("");
                $("#<%=txtCity.ClientID%>").val("");
                $("#<%=ddlCountry.ClientID%>").val("0");
                $("#<%=txtPosition.ClientID%>").val("");
                $("#<%=txtStartDate.ClientID%>").val("");
                $("#<%=txtEndate.ClientID%>").val("");
                $("#<%=txtbriefDescription.ClientID%>").val("");
                $("#<%=txtreportingmanger.ClientID%>").val("");
                $("#<%=txtemploymentverification.ClientID%>").val("");
                $("#<%=ddlRelationship.ClientID%>").val("0");
                $("#<%=txtEmail.ClientID%>").val("");
                $("#<%=txtlinkedin.ClientID%>").val("");
               // $("#<%=employment.ClientID%>").hide();
                $("#<%=hdnemployer.ClientID%>").val("");
                $("#<%=fieldContainer.ClientID%>").hide();
                $("#<%=lblSaveTime.ClientID%>").hide();
                $("#<%=lblMessage.ClientID%>").hide();

            if ($("#<%=employment.ClientID%>").is(':hidden'))
                $("#<%=employment.ClientID%>").show();
            else
                 $("#<%=employment.ClientID%>").hide();
        }
        $(document).ready(function () {
            $('.sidebar-menu-item').removeClass('open');
            $('#personal_menu_list').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#applicantworkexperience').addClass('active');
        });
    </script>
    <style type="text/css">
        .currRow {
            background-color: Gray;
            cursor: pointer;
        }
    </style>
</asp:Content>
