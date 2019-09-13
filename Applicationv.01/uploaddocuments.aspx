﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="uploaddocuments.aspx.cs" Inherits="uploaddocuments" MasterPageFile="~/student.master" %>

<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">


    <div class="container-fluid page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">Upload Document

            </li>
        </ol>
        <h1 class="h2">Upload Document

        </h1>

    </div>

    <div class="page ">

        <div class="container page__container p-0">
            <div class="row m-8">
                <div class="col-lg container-fluid page__container">

                    <div class="card">
                        <ul class="nav nav-tabs nav-tabs-card">
                            <li class="nav-item">
                                <a class="nav-link active" href="#first" data-toggle="tab">Upload Document</a>
                            </li>

                        </ul>
                        <div class="tab-content card-body">
                            <div class="tab-pane active" id="first">


                                <div class="form-group row">
                                    <label for="name" class="col-sm-3 col-form-label form-label">Document Name</label>
                                    <div class="col-sm-9">
                                        <div class="row" style="padding-left:0px;">
                                            <div class="col-md-6">
                                                <asp:DropDownList ID="ddlDocuments" CssClass="form-control" runat="server"></asp:DropDownList>
                                            </div>

                                        </div>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="avatar" class="col-sm-3 col-form-label form-label">Documents</label>
                                    <div class="col-sm-9">
                                        <div class="media align-items-center">
                                           
                                            <div class="media-body">
                                                <div class="custom-file" style="width: auto;">
                                                <asp:Label ID="lblavatar" runat="server" />
                                                <asp:FileUpload ID="avatar" runat="server" />                                                
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <div class="col-sm-8 offset-sm-3">
                                        <div class="media align-items-center">
                                            <div class="media-left">
                                                <asp:Button ID="btn_login" runat="server" Text="Save Documents" CssClass="btn btn-success" OnClick="btn_login_Click" OnClientClick="return validateUploadedFile()"/>

                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <div class="col-sm-8 offset-sm-3">
                                        <div class="media align-items-center">
                                            <div class="media-left">
                                                <asp:Repeater ID="rptVideo" runat="server">
                                                    <HeaderTemplate>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>

                                                        <table class="table">
                                                            <tr>
                                                                <td>
                                                                    <asp:Label ID="lblSubject" runat="server" Text='<%#Eval("documentname") %>' Font-Bold="true" />
                                                                </td>
                                                                <td>
                                                                    <asp:LinkButton ID="btnDownoad" CommandArgument='<%#Eval("filename") %>' runat="server" OnClick="Download">View Documents</asp:LinkButton>
                                                                </td>
                                                            </tr>
                                                        </table>


                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                    </FooterTemplate>
                                                </asp:Repeater>
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
                    
                    <div class="container page__container">
                        <div class="footer">
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <script>
         function validateUploadedFile() {
            var flag = false;
            if ($("#<%=ddlDocuments.ClientID%>").val() == "0")
                alert("Please select document name");
            else if ($("#<%=avatar.ClientID%>").val() == "")
                alert("Please upload valid document");
            else
                flag = true;

            return flag;
        }
        $(document).ready(function () {
            $('.sidebar-menu-item').removeClass('open');
            $('#personal_menu_list').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#uploaddocuments').addClass('active');
        });
    </script>
</asp:Content>



