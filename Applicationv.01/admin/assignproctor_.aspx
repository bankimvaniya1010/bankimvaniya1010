<%@ Page Language="C#" AutoEventWireup="true" CodeFile="assignproctor_.aspx.cs" Inherits="admin_assignproctor_" MasterPageFile="~/admin/admin.master" %>

<asp:Content ID="content2" runat="server" ContentPlaceHolderID="head">
</asp:Content>
<asp:Content runat="server" ID="content1" ContentPlaceHolderID="ContentPlaceHolder1">

    <div class="container page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active"></li>
        </ol>
        <h1 class="h2">Assign Proctor</h1>

        <div class="card">
            <div class="tab-content card-body">
                <div class="tab-pane active" id="first">
                    <div class="form-group row" runat="server">
                        <label for="name" class="col-sm-3 col-form-label form-label">Institution Name</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <label id="ddlUniversity" runat="server" cssclass="form-control"></label>
                                    <label id="lbluniversityid" runat="server" cssclass="form-control" visible="false"></label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row" runat="server">
                        <label for="name" class="col-sm-3 col-form-label form-label">Applicant ID</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <label id="lblapplicantid" runat="server" cssclass="form-control"></label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row" runat="server">
                        <label for="name" class="col-sm-3 col-form-label form-label">Applicant Name</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <label id="lblstudentname" runat="server" cssclass="form-control"></label>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="form-group row" runat="server">
                        <label for="name" class="col-sm-3 col-form-label form-label">GTE ASSESSMENT TIME (UTC TIME ZONE)</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <label id="lblutcmeetingtime" runat="server" cssclass="form-control"></label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row" runat="server">
                        <label for="name" class="col-sm-3 col-form-label form-label">GTE ASSESSMENT TIME (STUDENT TIME ZONE)</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <label id="lblmeetingtime" runat="server" cssclass="form-control"></label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row" runat="server">
                        <label for="name" class="col-sm-3 col-form-label form-label">Proctor Name</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <asp:DropDownList ID="ddlproctor" runat="server" CssClass="form-control"></asp:DropDownList>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div id="proctorinfo" runat="server" style="display: none">
                        <div class="form-group row">
                            <label class="col-sm-3 col-form-label form-label">Proctor Id</label>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-md-6">
                                        <asp:Label runat="server" ID="lblproctorID"></asp:Label>
                                        <asp:HiddenField runat="server" ID="hidproctorname" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-3 col-form-label form-label">Proctor email</label>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-md-6">
                                        <asp:Label runat="server" ID="lblproctoremail"></asp:Label>
                                        <asp:HiddenField runat="server" ID="hidproctoremail" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-3 col-form-label form-label">proctor Mobile</label>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-md-6">
                                        <asp:Label runat="server" ID="lblproctormobile"></asp:Label>
                                        <asp:HiddenField runat="server" ID="Hidproctormobile" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label form-label">Virtual Meeting Information</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-10">
                                    <asp:TextBox runat="server" ID="txtmeetinglink" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="form-group row">
                        <div class="col-sm-8 offset-sm-3">
                            <div class="media align-items-center">
                                <div class="media-left">
                                    <asp:Button ID="btn_submit" runat="server" Text="Submit" CssClass="btn btn-primary btn-block" OnClick="btn_submit_Click" OnClientClick="return validateForm()" />
                                    <div class="col-md-20">
                                        <asp:Label ID="lblMessage" runat="server" Visible="false"></asp:Label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script>       
            function validateForm() {

                var flag = false;

                if ($("#<%=ddlproctor.ClientID%>").val() == "0")
                    alert("Please Select proctor");
                else if ($("#<%=txtmeetinglink.ClientID%>").val() == "")
                    alert("Please enter valid virtual meeting link");
                else
                    flag = true;
                return flag;
            }

            $(document).ready(function () {
                $('.sidebar-menu-item').removeClass('open');
                $('#managemeeting_schedule_list').addClass('open');
                $('.sidebar-menu-item').removeClass('active');
                $('#scheduledapplicant_list').addClass('active');

            });
            $("#<%=ddlproctor.ClientID%>").change(function () {
                var proctorid = $("#<%=ddlproctor.ClientID%>").val();
                if (proctorid != 0) {
                    $("#<%=proctorinfo.ClientID%>").show();
                    $.ajax({
                        type: "GET",
                        url: "assignproctor_.aspx/Getproctordetail",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: { proctorid: proctorid },
                        success: function (response) {
                            if (response.d) {
                                var result = JSON.parse(response.d);
                                $("#<%= hidproctorname.ClientID%>").val(result[0].proctorname).html(result[0].proctorname);
                                $("#<%= lblproctorID.ClientID%>").val(result[0].proctorID).html(result[0].proctorID);

                                $("#<%= lblproctoremail.ClientID%>").val(result[0].proctoremail).html(result[0].proctoremail);
                                $("#<%= hidproctoremail.ClientID%>").val(result[0].proctoremail).html(result[0].proctoremail);

                                $("#<%= lblproctormobile.ClientID%>").val(result[0].proctormobile).html(result[0].proctormobile);
                                $("#<%= Hidproctormobile.ClientID%>").val(result[0].proctormobile).html(result[0].proctormobile);
                            }
                        }
                    });
                }
                else
                    $("#<%=proctorinfo.ClientID%>").hide();
            });
        </script>
    </div>
</asp:Content>


