﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="gte_sop.aspx.cs" Inherits="gte_sop" MasterPageFile="~/student.master" %>

<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <div class="container-fluid page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">Statement Of Purpose</li>
        </ol>
        <h1 class="h2">Statement Of Purpose

        </h1>
    </div>

    <div class="page ">
        <div class="card faq-lftcard">
        <div class="row" style="margin-left: 0;margin-right:0;padding-left:0;">
            <div class="col-md-12">
                <div class="card" runat="server">
                    <asp:TextBox ID="txtPara1" runat="server" ReadOnly="true" TextMode="MultiLine" Width="100%" Height="300px" Font-Size="Medium"></asp:TextBox>
                </div>
            </div>
        </div>

        <div class="row" style="margin-left: 0;margin-right:0;padding-left:0;">
            <div class="col-md-12">
                <div class="card" runat="server">
                    <asp:TextBox ID="txtPara2" runat="server" ReadOnly="true" TextMode="MultiLine" Width="100%" Height="300px" Font-Size="Medium"></asp:TextBox>
                </div>
            </div>
            
        </div>

        <div class="row" style="margin-left: 0;margin-right:0;padding-left:0;">
            <div class="col-md-12">
                <div class="card" runat="server">
                    <asp:TextBox ID="txtPara3" runat="server" ReadOnly="true" TextMode="MultiLine" Width="100%" Height="300px" Font-Size="Medium"></asp:TextBox>                    
                </div>
            </div>
            
        </div>

        <div class="row" style="margin-left: 0;margin-right:0;padding-left:0;">
            <div class="col-md-12">
                <div class="card" runat="server">
                    <asp:TextBox ID="txtPara4" runat="server" ReadOnly="true" TextMode="MultiLine" Width="100%" Height="300px" Font-Size="Medium"></asp:TextBox>
                </div>
            </div>
            
        </div>

        <div class="row" style="margin-left: 0;margin-right:0;padding-left:0;">
            <div class="col-md-12">
                <div class="card" runat="server">
                    <asp:TextBox ID="txtPara5" runat="server" ReadOnly="true" TextMode="MultiLine" Width="100%" Height="300px" Font-Size="Medium"></asp:TextBox>
                </div>
            </div>
            
        </div>

        <div class="form-group m-0" role="group">
            <div class="form-row">
                <input id="btnEdit" type="button" runat="server" class="btn btn-success" value="Edit" style="margin-left:60px" />
                <asp:Button ID="btnSave" runat="server" CssClass="btn btn-success" Text="Save" OnClick="btnSave_Click" style="margin-left:65px" />
                <asp:Button ID="btnsubmit" runat="server" CssClass="btn btn-success" Text="Submit" OnClick="btnsubmit_Click" style="margin-left:20px"/>
            </div>
        </div>

        <div class="container page__container">
            <div class="footer">
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

            


    <script>
        function openLink(url) {
            $('body').append('<div class="modal" id="video-modal" tabindex="-1" role="dialog"><div class="modal-dialog" role="document"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button></div><div class="modal-body"><div class="">Ans:' +url+ '</div></div></div></div></div>'  );
            $('#video-modal').modal('show');
             $('#video-modal').on('hidden.bs.modal', function () {
                 $('#video-modal').remove();
            });
        }
        $(document).ready(function () {

            $("#<%=btnEdit.ClientID%>").click(function () {
                var btnEdit = this;
                btnEdit.style.display = "none";

                $("#<%=btnsubmit.ClientID%>").hide();
                $("#<%=btnSave.ClientID%>").show();

                $("#<%=txtPara1.ClientID%>").attr('readonly', false);
                $("#<%=txtPara2.ClientID%>").attr('readonly', false);
                $("#<%=txtPara3.ClientID%>").attr('readonly', false);
                $("#<%=txtPara4.ClientID%>").attr('readonly', false);
                $("#<%=txtPara5.ClientID%>").attr('readonly', false);

            });

        });
    </script>
</asp:Content>
