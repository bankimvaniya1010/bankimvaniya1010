﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="applicantsocial.aspx.cs" Inherits="applicantsocial" MasterPageFile="~/student.master" %>

<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">


    <div class="container-fluid page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">Social

            </li>
        </ol>
        <h1 class="h2">Social

        </h1>

    </div>
    <div class="page ">
        <div class="container page__container p-0">
            <div class="row m-0">
                <div class="col-lg container-fluid page__container">

                    <div class="card" style="width: 650px;">
                        <div class="list-group list-group-fit">


                            <div class="list-group-item" id="linkedin" runat="server" style="display:none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-linked">
                                    <div class="form-row">
                                        <label id="labellinked" runat="server" for="linked" class="col-md-3 col-form-label form-label">Link to your LinkedIn profile</label>
                                        <div class="col-md-6">
                                            <input id="txtLinkedin" runat="server" type="text" class="form-control" placeholder="Link to your LinkedIn profile ">
                                            <asp:CheckBox ID="chkLinkeIn" runat="server" Text="Does Not Have LinkedIn Account"/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="facebook" runat="server" style="display:none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-facebook">
                                    <div class="form-row">
                                        <label id="labelfacebook" runat="server" for="employer" class="col-md-3 col-form-label form-label">Link to your Facebook profile </label>
                                        <div class="col-md-6">
                                            <input id="txtFacebook" runat="server" type="text" class="form-control" placeholder="Link to your Facebook profile ">
                                            <asp:CheckBox ID="ChkFacebook" runat="server" Text="Does Not Have Facebook Account"/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="twitter" runat="server" style="display:none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-twitter">
                                    <div class="form-row">
                                        <label id="labeltwitter" runat="server" for="twitter" class="col-md-3 col-form-label form-label">Link to your twitter handle </label>
                                        <div class="col-md-6">
                                            <input id="txtTwitter" runat="server" type="text" class="form-control" placeholder="Link to your twitter handle ">
                                            <asp:CheckBox ID="chkTwitter" runat="server" Text="Does Not Have Twitter Account"/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="employerwebsite">
                                <div class="form-group m-0" role="group" aria-labelledby="label-employerwebsite">
                                    <div class="form-row">
                                        <a href="applicantreview.aspx" class="btn btn-success" style="margin-right: 10px;">Review</a>
                                        <asp:Button ID="btn_login" runat="server" Text="Save Changes" CssClass="btn btn-success" OnClick="btn_login_Click" OnClientClick="return validateForm()" />
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
            var flag = false; 
            if (!$("#<%=linkedin.ClientID%>").is(':hidden') && $("#<%=txtLinkedin.ClientID%>").val() == "" && !$("#<%=chkLinkeIn.ClientID%>").is(":checked"))
                alert("Please Enter LinkedIn Profile");
            else if (!$("#<%=facebook.ClientID%>").is(':hidden') && $("#<%=txtFacebook.ClientID%>").val() == "" && !$("#<%=ChkFacebook.ClientID%>").is(":checked"))
                alert("Please Enter Facebook Profile");
            else if (!$("#<%=twitter.ClientID%>").is(':hidden') && $("#<%=txtTwitter.ClientID%>").val() == "" && !$("#<%=chkTwitter.ClientID%>").is(":checked"))
                alert("Please Select Twitter Profile");            
            else 
                flag = true;           

            return flag;
        }   
       
        $(document).ready(function () {

            $(".form-control")
                .mouseover(function () {
                    var controlId = $(this).attr('id');
                    var title = $(this).attr('title');
                    $("#tooltip").text(title);
                });             

            $("#<%=chkLinkeIn.ClientID%>").change(function () {
                if ($(this).is(":checked")) {
                    $("#<%=txtLinkedin.ClientID%>").val("");
                    $("#<%=txtLinkedin.ClientID%>").attr("disabled", "disabled");
                }
                else
                    $("#<%=txtLinkedin.ClientID%>").removeAttr("disabled"); 
            });

            $("#<%=ChkFacebook.ClientID%>").change(function () {
                if ($(this).is(":checked")) {
                    $("#<%=txtFacebook.ClientID%>").val("");
                    $("#<%=txtFacebook.ClientID%>").attr("disabled", "disabled");
                }
                else
                    $("#<%=txtFacebook.ClientID%>").removeAttr("disabled"); 
            });

            $("#<%=chkTwitter.ClientID%>").change(function () {
                if ($(this).is(":checked")) {
                    $("#<%=txtTwitter.ClientID%>").val("");
                    $("#<%=txtTwitter.ClientID%>").attr("disabled", "disabled");
                }
                else
                    $("#<%=txtTwitter.ClientID%>").removeAttr("disabled"); 
            });
        }); 

    </script>
</asp:Content>
