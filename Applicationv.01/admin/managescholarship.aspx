<%@ Page Language="C#" AutoEventWireup="true" CodeFile="managescholarship.aspx.cs" Inherits="admin_managescholarship" MasterPageFile="~/admin/admin.master" EnableEventValidation="false" %>

<asp:Content ID="content1" runat="server" ContentPlaceHolderID="head">
</asp:Content>
<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="container page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">My Dashboard</a></li>
            <li class="breadcrumb-item active">Scholarships</li>
        </ol>

        <h1 class="h2">Manage Scholarship</h1>

        <div class="card">
            <div class="tab-content card-body">
                <div class="tab-pane active">

                    <div class="form-group row">
                        <label for="scholarshipName" class="col-sm-3 col-form-label form-label">Scholarship Name</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <input id="txtScholarshipName" type="text" runat="server" class="form-control" placeholder="Scholarship Name" />
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="scholarshipDescription" class="col-sm-3 col-form-label form-label">Scholarship Description</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <input id="txtScholarshipDescription" type="text" runat="server" class="form-control" placeholder="Scholarship Description" />
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="scholarshipEligibility" class="col-sm-3 col-form-label form-label">Scholarship Eligibility</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <input id="txtScholarshipEligibility" type="text" runat="server" class="form-control" placeholder="Scholarship Eligibility" />
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="scholarshipAmount" class="col-sm-3 col-form-label form-label">Scholarship Amount</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <input id="txtScholarshipAmount" type="text" runat="server" class="form-control" placeholder="AU 1000 to 3000" />
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="form-group row">
                        <div class="col-md-8">
                            <div class="form-check-inline">
                                <asp:radiobutton groupname="awardGroup" id="rbtnUniversity" runat="server" cssclass="form-check-label" text="Scholarship by university" />
                            </div>
                            <div class="form-check-inline">
                                <asp:radiobutton groupname="awardGroup" id="rbtnUniversal" runat="server" cssclass="form-check-label" text="Universal Scholarship" />
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="scholarshipAwardedBy" class="col-sm-3 col-form-label form-label">Scholarship Awarded By </label>
                        <div class="col-md-4">
                            <asp:dropdownlist id="ddlUniversity" style="display: none" cssclass="form-control" runat="server"></asp:dropdownlist>
                            <input id="txtScholarshipAwardedBy" style="display: none" type="text" runat="server" class="form-control" placeholder="Scholarship Awarded By" />
                        </div>
                    </div>


                    <div class="form-group row">
                        <label for="scholarshipDeadline" class="col-sm-3 col-form-label form-label">Scholarship Application Deadline </label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <asp:dropdownlist id="ddlYear" cssclass="form-control" runat="server">
                                        <asp:ListItem Value="0" Selected="True">Select Year</asp:ListItem>
                                    </asp:dropdownlist>
                                    <asp:dropdownlist id="ddlMonth" cssclass="form-control" runat="server">
                                        <asp:ListItem Value="0" Selected="True">Select Month</asp:ListItem>
                                    </asp:dropdownlist>
                                    <asp:dropdownlist id="ddlDay" cssclass="form-control" runat="server"></asp:dropdownlist>
                                    <asp:hiddenfield runat="server" id="hidDeadLineDate" />
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="scholarshipForm" class="col-sm-3 col-form-label form-label">Scholarship Application Form </label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <asp:fileupload id="applicationForm" runat="server" cssclass="custom-file-input"/>
                                    <label for="applicationForm" runat="server" id="fileName" class="custom-file-label">Choose application form file</label>
                                    <asp:HiddenField ID="hidFileUploaded" runat="server" />
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="form-group row">
                        <div class="col-sm-8 offset-sm-3">
                            <div class="media align-items-center">
                                <div class="media-left">
                                    <asp:button id="btnSubmit" runat="server" text="Submit" cssclass="btn btn-primary btn-block" onclientclick="return validateForm()" onclick="btnSubmit_Click1" />
                                    <asp:label id="lblMessage" runat="server"></asp:label>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript">
        function getDaysInMonth(month, year) {
            return new Date(year, month, 0).getDate();
        };

        $("#<%=ddlMonth.ClientID%>").change(function () {
            $("#<%=ddlDay.ClientID%>").empty();
            var daysInSelectedMonth = getDaysInMonth($("#<%=ddlMonth.ClientID%>").val(), $("#<%=ddlYear.ClientID%>").val());
            $("#<%=ddlDay.ClientID%>").append($("<option></option>").attr("value", "0").text("Select Day"));
            for (var i = 1; i <= daysInSelectedMonth; i++)
                $("#<%=ddlDay.ClientID%>").append($("<option></option>").attr("value", i).text(i));
        });

        function validAwardedBy() {
            var txtScholarshipAwardedBy = $('#<%=txtScholarshipAwardedBy.ClientID%>').val();
            var universitySelection = $('#<%=ddlUniversity.ClientID%>').val();
            if (!($("#<%=rbtnUniversal.ClientID%>").is(':checked') || $("#<%=rbtnUniversity.ClientID%>").is(':checked')))
                return false;

            if ($("#<%=rbtnUniversal.ClientID%>").is(':checked') && txtScholarshipAwardedBy == '')
                return false;
            else if ($("#<%=rbtnUniversity.ClientID%>").is(':checked') && universitySelection == 0)
                return false;

            return true;
        }

        function validateForm() {

            var txtScholarshipName = $('#<%=txtScholarshipName.ClientID%>').val();
            var txtScholarshipDescription = $('#<%=txtScholarshipDescription.ClientID%>').val();
            var txtScholarshipEligibility = $('#<%=txtScholarshipEligibility.ClientID%>').val();
            var txtScholarshipAmount = $('#<%=txtScholarshipAmount.ClientID%>').val();
            var applicationFormFile = $('#<%=applicationForm.ClientID%>').val();

            if (txtScholarshipAmount == "" || !/^[a-zA-Z0-9 ]*$/.test(txtScholarshipAmount)) {
                alert("Please enter appropriate scholarship amount");
                return false;
            }
            else if (txtScholarshipName == '') {
                alert("Please enter name for Scholarship");
                return false;
            }
            else if (txtScholarshipDescription == '') {
                alert("Please enter Scholarship description");
                return false;
            }
            else if (txtScholarshipEligibility == '') {
                alert("Please enter Scholarship eligibility");
                return false;
            }
            else if (($("#<%=ddlMonth.ClientID%>").val() == "0") || ($("#<%=ddlYear.ClientID%>").val() == "0") || ($("#<%=hidDeadLineDate.ClientID%>").val() == "")) {
                alert("Please enter Scholarship application deadline date");
                return false;
            }
            else if (applicationFormFile == '' && $("#<%=hidFileUploaded.ClientID%>").val() == "") {
                alert("Please upload scholarship application form file");
                return false;
            }
            else if (!validAwardedBy()) {
                alert("Please enter scholarship awarded by");
                return false;
            }

            return true;
        }

        $(function () {
            $("input[name='ctl00$ContentPlaceHolder1$awardGroup']").click(function () {
                if ($("#<%=rbtnUniversal.ClientID%>").is(":checked")) {
                    $("#<%=ddlUniversity.ClientID%>").hide();
                    $("#<%=txtScholarshipAwardedBy.ClientID%>").show();
                    $("#<%=txtScholarshipAwardedBy.ClientID%>").val("");
                }
                else if ($("#<%=rbtnUniversity.ClientID%>").is(":checked")) {
                    $("#<%=ddlUniversity.ClientID%>").show();
                    $("#<%=ddlUniversity.ClientID%>").prop('selectedIndex', 0);
                    $("#<%=txtScholarshipAwardedBy.ClientID%>").hide();
                }
            });

        });

        $(document).ready(function () {
            if ($("#<%=rbtnUniversal.ClientID%>").is(":checked")) {
                $("#<%=ddlUniversity.ClientID%>").hide();
                $("#<%=txtScholarshipAwardedBy.ClientID%>").show();
            }
            else if ($("#<%=rbtnUniversity.ClientID%>").is(":checked")) {
                $("#<%=txtScholarshipAwardedBy.ClientID%>").hide();
                $("#<%=ddlUniversity.ClientID%>").show();
            }


            $("#<%=ddlDay.ClientID%>").change(function () {
                $("#<%=hidDeadLineDate.ClientID%>").val($("#<%=ddlDay.ClientID%>").val());
            });
        });
        $(document).ready(function () {
            $('.sidebar-menu-item').removeClass('open');
            $('#Scholarships_list').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#manageScholarships').addClass('active');

            $("#<%=applicationForm.ClientID%>").change(function (event) {
                var path = $(this).val();
                if (path != '' && path != null) {
                    var q = path.substring(path.lastIndexOf('\\') + 1);
                    $("#<%=fileName.ClientID%>").text(q);
                }
            });
        });
    </script>

</asp:Content>
