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
        <div class="container page__container p-0">
            <div class="row m-0">
                <div class="col-lg container-fluid page__container">

                    <div class="card" style="width: 650px;">
                        <div class="list-group list-group-fit">

                            <asp:HiddenField ID="hdnemployer" runat="server" />
                            <asp:HiddenField ID="hdnRow" runat="server" />
                            <div class="list-group-item" id="PreviousEmployment">
                                <div class="form-group m-0" role="group" aria-labelledby="label-PreviousEmployment">
                                    <div class="form-row">



                                        <div class="form-row">

                                            <div class="col-md-9">
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
                            <a class="btn btn-success" style="width: 200px" data-toggle="collapse" href="#employment" role="button" aria-expanded="false" aria-controls="employment">Add work experience
                            </a>
                            <div id="employment" class="collapse">
                                <div class="list-group-item" id="employmentInfo" runat="server" style="display: none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-employment">
                                        <div class="form-row">
                                            <label id="labelemployment" runat="server" for="employment" class="col-md-3 col-form-label form-label">Do you wish to record any work experience that may be relevant to the course you are applying for?</label>
                                            <div class="col-md-6">
                                                <asp:RadioButton ID="rblEmploymentYes" runat="server" GroupName="Employment" Text="Yes" />
                                                <asp:RadioButton ID="rblEmploymentNo" runat="server" GroupName="Employment" Text="No" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item" id="employer" runat="server" style="display: none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-employer">
                                        <div class="form-row">
                                            <label id="labelemployer" runat="server" for="employer" class="col-md-3 col-form-label form-label">Name of Organization </label>
                                            <div class="col-md-6">
                                                <input id="txtEmployer" runat="server" type="text" class="form-control" placeholder="Name of Organization 

">
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
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item" id="employercity" runat="server" style="display: none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-employercity">
                                        <div class="form-row">
                                            <label id="labelemployercity" runat="server" for="employercity" class="col-md-3 col-form-label form-label">City</label>
                                            <div class="col-md-6">
                                                <input id="txtCity" runat="server" type="text" class="form-control" placeholder="City ">
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
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item" id="position" runat="server" style="display: none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-position">
                                        <div class="form-row">
                                            <label id="labelposition" runat="server" for="position" class="col-md-3 col-form-label form-label">Position/Role in</label>
                                            <div class="col-md-6">
                                                <input id="txtPosition" runat="server" type="text" class="form-control" placeholder="Position/Role in

">
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="list-group-item" id="startdate" runat="server" style="display: none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-startdate">
                                        <div class="form-row">
                                            <label id="labelstartdate" runat="server" for="startdate" class="col-md-3 col-form-label form-label">Start Date</label>
                                            <div class="col-md-6">
                                                <input id="txtStartDate" runat="server" type="text" class="form-control" placeholder="End Date" data-toggle="flatpickr" value="today">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item" id="endate" runat="server" style="display: none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-endate">
                                        <div class="form-row">
                                            <label id="labelendate" runat="server" for="endate" class="col-md-3 col-form-label form-label">End Date</label>
                                            <div class="col-md-6">
                                                <input id="txtEndate" runat="server" type="text" class="form-control" placeholder="End Date" data-toggle="flatpickr" value="today">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item" id="briefDescription" runat="server" style="display: none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-briefDescription">
                                        <div class="form-row">
                                            <label id="labelbriefDescription" runat="server" for="briefDescription" class="col-md-3 col-form-label form-label">Brief Description of what you did</label>
                                            <div class="col-md-6">
                                                <input id="txtbriefDescription" runat="server" type="text" class="form-control" placeholder="Brief Description of what you did

">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item" id="reportingmanger" runat="server" style="display: none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-reportingmanger">
                                        <div class="form-row">
                                            <label id="labelreportingmanger" runat="server" for="reportingmanger" class="col-md-3 col-form-label form-label">Name of your reporting Manager</label>
                                            <div class="col-md-6">
                                                <input id="txtreportingmanger" runat="server" type="text" class="form-control" placeholder="Name of your reporting Manager

">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item" id="employmentverification" runat="server" style="display: none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-employmentverification">
                                        <div class="form-row">
                                            <label id="labelemploymentverification" runat="server" for="employmentverification" class="col-md-3 col-form-label form-label">Name of Contact who can verify your employment </label>
                                            <div class="col-md-6">
                                                <input id="txtemploymentverification" runat="server" type="text" class="form-control" placeholder="Name of Contact who can verify your employment 

">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item" id="relationship" runat="server" style="display: none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-relationship">
                                        <div class="form-row">
                                            <label id="labelrelationship" runat="server" for="relationship" class="col-md-3 col-form-label form-label">Relationship with the Contact  </label>
                                            <div class="col-md-6">
                                                <input id="txtrelationship" runat="server" type="text" class="form-control" placeholder="Relationship with the Contact

">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item" id="email" runat="server" style="display: none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-email">
                                        <div class="form-row">
                                            <label id="labelemail" runat="server" for="email" class="col-md-3 col-form-label form-label">Email ID of Contact who can verify your employment  </label>
                                            <div class="col-md-6">
                                                <input id="txtEmail" runat="server" type="text" class="form-control" placeholder="Email ID of Contact who can verify your employment

">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item" id="linkedin" runat="server" style="display: none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-linkedin">
                                        <div class="form-row">
                                            <label id="labellinkedin" runat="server" for="linkedin" class="col-md-3 col-form-label form-label">LinkedIn Profile Link of the contact  </label>
                                            <div class="col-md-6">
                                                <input id="txtlinkedin" runat="server" type="text" class="form-control" placeholder="LinkedIn Profile Link of the contact

">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-employerwebsite">
                                        <div class="form-row">
                                            <a href="applicantsocial.aspx" class="btn btn-success" style="margin-right: 10px;">Social</a>
                                            <asp:Button ID="btn_login" runat="server" Text="Save Changes" CssClass="btn btn-success" OnClick="btn_login_Click" />
                                            <div class="col-md-6">
                                                <asp:Label ID="lblMessage" runat="server" Visible="false"></asp:Label>
                                                <asp:Label ID="lblSaveTime" runat="server"></asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>


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
        $(document).ready(function () {
            $(".form-control")
                .mouseover(function () {
                    var controlId = $(this).attr('id');
                    var title = $(this).attr('title');
                    $("#tooltip").text(title);
                });

            var emp = $("#<%=hdnemployer.ClientID%>").val()

            if (emp != '') {
                $("#<%=position.ClientID%>").show();
                $("#<%=employer.ClientID%>").show();
                $("#<%=startdate.ClientID%>").show();
                $("#<%=endate.ClientID%>").show();
                $("#<%=briefDescription.ClientID%>").show();
                $("#<%=employercity.ClientID%>").show();
                $("#<%=employercountry.ClientID%>").show();
                $("#<%=reportingmanger.ClientID%>").show();
                $("#<%=employmentverification.ClientID%>").show();
                $("#<%=relationship.ClientID%>").show();
                $("#<%=email.ClientID%>").show();
                $("#<%=linkedin.ClientID%>").show();
                $("#PreviousEmployment").show();

                $('#employment').addClass("collapse show");;
                $("#<%=employerwebsite.ClientID%>").show();


            }
            else {
                $("#<%=employerwebsite.ClientID%>").hide();
                $("#<%=position.ClientID%>").hide();
                $("#<%=employer.ClientID%>").hide();
                $("#<%=startdate.ClientID%>").hide();
                $("#<%=endate.ClientID%>").hide();
                $("#<%=briefDescription.ClientID%>").hide();
                $("#<%=employercity.ClientID%>").hide();
                $("#<%=employercountry.ClientID%>").hide();
                $("#<%=reportingmanger.ClientID%>").hide();
                $("#<%=employmentverification.ClientID%>").hide();
                $("#<%=relationship.ClientID%>").hide();
                $("#<%=email.ClientID%>").hide();
                $("#<%=linkedin.ClientID%>").hide();

                $('#employment').addClass("collapse");;
            }

        });

        $(function () {
            $("input[name='ctl00$ContentPlaceHolder1$Employment']").click(function () {
                if ($("#<%=rblEmploymentYes.ClientID%>").is(":checked")) {
                    $("#<%=position.ClientID%>").show();
                    $("#<%=employer.ClientID%>").show();
                    $("#<%=startdate.ClientID%>").show();
                    $("#<%=endate.ClientID%>").show();
                    $("#<%=briefDescription.ClientID%>").show();
                    $("#<%=employercity.ClientID%>").show();
                    $("#<%=employercountry.ClientID%>").show();
                    $("#<%=reportingmanger.ClientID%>").show();
                    $("#<%=employmentverification.ClientID%>").show();
                    $("#<%=relationship.ClientID%>").show();
                    $("#<%=email.ClientID%>").show();
                    $("#<%=linkedin.ClientID%>").show();
                    $("#PreviousEmployment").show();
                    $("#<%=employerwebsite.ClientID%>").show();


                }
                else {
                    $("#<%=employerwebsite.ClientID%>").hide();
                    $("#<%=position.ClientID%>").hide();
                    $("#<%=employer.ClientID%>").hide();
                    $("#<%=startdate.ClientID%>").hide();
                    $("#<%=endate.ClientID%>").hide();
                    $("#<%=briefDescription.ClientID%>").hide();
                    $("#<%=employercity.ClientID%>").hide();
                    $("#<%=employercountry.ClientID%>").hide();
                    $("#<%=reportingmanger.ClientID%>").hide();
                    $("#<%=employmentverification.ClientID%>").hide();
                    $("#<%=relationship.ClientID%>").hide();
                    $("#<%=email.ClientID%>").hide();
                    $("#<%=linkedin.ClientID%>").hide();
                }
            });
        });

        $('#ContentPlaceHolder1_txtStartDate').flatpickr({

            dateFormat: 'Y-m-d'
        });

        $('#ContentPlaceHolder1_txtEndate').flatpickr({

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

        function ConfirmOnDelete(item) {
            if (confirm("Are you sure to delete: " + item + "?") == true)
                return true;
            else
                return false;
        }

        $(function () {
            $('#<%=btn_login.ClientID%>').click(function () {
                debugger;
                var summary = "";
                summary += isEmployerdetails();
                summary = summary.replace(/undefined/g, "");

                if (summary != "") {
                    alert(summary);
                    return false;
                }
                else {
                    return true;
                }
            });
        });
        function isEmployerdetails() {
            if ((($("#<%=rblEmploymentYes.ClientID%>").is(":checked")) || ($("#<%=rblEmploymentNo.ClientID%>").is(":checked")))) {
                {
                    if ($("#<%=rblEmploymentYes.ClientID%>").is(":checked")) {
                        if ($("#<%=txtEmployer.ClientID%>").val() == "") {
                            return ("Please enter  organization name" + "\n");
                        }
                        if ($("#<%=txtemployerwebsite.ClientID%>").val() == "") {
                            return ("Please enter website name" + "\n");
                        }
                        if ($("#<%=txtCity.ClientID%>").val() == "") {
                            return ("Please enter city name" + "\n");
                        }
                        if ($("#<%=ddlCountry.ClientID%>").val() == "0") {
                            return ("Please select country" + "\n");
                        }
                        if ($("#<%=txtPosition.ClientID%>").val() == "") {
                            return ("Please enter position details" + "\n");
                        }
                        if ($("#<%=txtStartDate.ClientID%>").val() == "") {
                            return ("Please enter employment start date" + "\n");
                        }
                        if ($("#<%=txtEndate.ClientID%>").val() == "") {
                            return ("Please enter employment end date" + "\n");
                        }
                        if ($("#<%=txtbriefDescription.ClientID%>").val() == "") {
                            return ("Please enter previous job description" + "\n");
                        }
                        if ($("#<%=txtemploymentverification.ClientID%>").val() == "") {
                            return ("Please enter details who can verify your employment" + "\n");
                        }
                        if ($("#<%=txtrelationship.ClientID%>").val() == "") {
                            return ("Please enter relations who can verify your employment" + "\n");
                        }
                        if ($("#<%=txtreportingmanger.ClientID%>").val() == "") {
                            return ("Please enter reporting manager name" + "\n");
                        }
                        if ($("#<%=txtlinkedin.ClientID%>").val() == "") {
                            return ("Please enter linkedin details" + "\n");
                        }
                    }
                }
            }
            else {
                return ("Please select if you have previous experince" + "\n");

            }
        }





    </script>

    <style type="text/css">
        .currRow {
            background-color: Gray;
            cursor: pointer;
        }
    </style>
</asp:Content>
