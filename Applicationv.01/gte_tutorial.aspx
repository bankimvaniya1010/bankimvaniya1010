﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="gte_tutorial.aspx.cs" Inherits="gte_tutorial" MasterPageFile="~/student.master"%>

<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">


    <div class="container-fluid page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">GTE Preliminary Step</li>
        </ol>
        <h1 class="h2">TUTORIAL (STEP 1/3)</h1>
    </div>

    <div class="page ">
      <div class="container page__container">
        <div class="row">
            <div class="col-md-8">

                <%
                    if (otherDocCount > 0)
                    {
                    %>
                <div class="card pdf-doc-wrpr" id="document" runat="server">
                    <h5> Something For You To Read</h5>
                    <div class="pdf-container clearfix">
                        <%for (int v = 0; v < allDocuments.Count; v++)
                            {
                            string docType = allDocuments[v].type;
                            if (docType != "video")
                            {
                            %>
                            <div class="pdf-wrpr">
                                <a href="Docs/GteTutorial/<%=allDocuments[v].documentpath %>" target="_blank"><i class="fa-file-pdf fa"></i></a>
                                <div class="pdf-dcrp"><%=allDocuments[v].title %></div>
                            </div>                            
                        <%} } %>
                        </div>
                </div>                  <%} %> 
                
                <%
                    if (videoCount > 0)
                    {
                    %>
                <div class="card video-container" id="video" runat="server">
                     <h5>Watch these Videos</h5>
                       <div class="row">
                      <%for (int v = 0; v < allDocuments.Count; v++)
                          {
                              if (allDocuments[v].type == "video")
                              {
                              %>
                            <div class="col-md-5 col-6">
                                <img class="img-fluid video-img mx-auto d-block" src="http://i3.ytimg.com/vi/<%=allDocuments[v].videourl %>/0.jpg" onclick="openLink('<%=allDocuments[v].videourl %>')"/>                               
                            </div>
                        <%}
                            } %>
                    </div>
                </div>            <%} %>  
                
                
                <%
                    if (videoCount > 0 || otherDocCount > 0)
                    {
                    %>
                    <div class="card" id="declaration" runat="server">
                        <div class="card-body">
                            <asp:CheckBox ID="checkCondition" runat="server" Text="I have read the given documents, watched the given videos and do fully understand the information contained in them." class=" col-form-label form-label" />
                            
                            <div class="media align-items-center">  
                                <div class="form-row" style="align-content:center">
                                    <asp:Button ID="btnnext" runat="server" Text="Next Step" CssClass="btn btn-success" OnClick="btnnext_Click" />
                                    <%--<a href="gte_preliminaryquestion.aspx" class="btn btn-success" id="btnnext" runat="server">Next</a>                                      --%>
                                </div>
                            </div>
                        </div>
                    </div>
                 <%} %> 
                        
                 <% else {  %>
                        <div class="list-group-item" id="employerwebsite">
                            <div class="form-group m-0" role="group" aria-labelledby="label-employerwebsite">
                                <div class="form-row">                                                            
                                    <div class="col-md-6">
                                        <asp:Label ID="LabelMessage" runat="server" text="No Tutorial available"></asp:Label>                                                  
                                    </div>
                                </div>
                            </div>
                         </div>   
                    <%} %>                
            </div>
            <div class="col-md-4">               
                <div class="card">
                    <div class="card-body">
                        <label id="lblInstructionHeader" runat="server" style="font-size:medium;">Instructions:</label><br />
                        
                        <ol style="font-size:small; padding-left:15px">
                            <li>Completing this section is mandatory.</li><br/>
                            <li>Please Read the attached documents carefully and watch the recommended videos.</li><br/>
                            <li>Take a quick test to check the knowledge you have gained after reading the suggested documents and watching the videos. Please note that you can proceed to the next section only if you achieve a 65% above.</li><br/>
                            <li>Lastly, please accept the declarations given below.</li>
                        </ol>
                     </div>                     
                </div>
                <div class="banImg-wrp">
                    <img src="/assets/images/Banner1.jpg" class="img-fluid">
                </div>
                <div id="faq" class="card faq-qwrp">
                           <div class="faq-qwrp" id="Div1" runat="server">
                    
                                <div class="card-body">
                                <%  if (allQuestions.Count > 0)
                                    { %>
                                <div id="question" runat="server">
                                        <h5>FAQ's</h5>
                                        <div class="">
                                        <%for (int q = 0; q < allQuestions.Count; q++)
                                            {%>  <div class="star-list">                                                             
                                                   <label onclick="showFaqQuestion('<%=allQuestions[q].question%>','<%=allQuestions[q].answer%>')">  <%=allQuestions[q].question%> </label>
                                                </div>                                                  
                                        <%} %>
                                    </div>
                                </div>      
                                    <%} %>  
                                     
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
    </div>
    <script>
        function openLink(url) {
            $('body').append('<div class="modal" id="video-modal" tabindex="-1" role="dialog"><div class="modal-dialog" role="document"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button></div><div class="modal-body"><div class="embed-responsive embed-responsive-16by9"><iframe class="embed-responsive-item" src="https://www.youtube.com/embed/' + url + '" allowfullscreen></iframe></div></div></div></div></div>');
            $('#video-modal').modal('show');
             $('#video-modal').on('hidden.bs.modal', function () {
                 $('#video-modal').remove();
        });
        }

        $(document).ready(function () {
            $("#<%=btnnext.ClientID%>").attr("disabled", "disabled");
            $('.sidebar-menu-item').removeClass('open');
            $('#Gte_list').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#gtetutorial').addClass('active');
        });
        $("#<%=checkCondition.ClientID%>").change(function ()
     {
         if ($(this).is(":checked"))
             $("#<%=btnnext.ClientID%>").removeAttr("disabled");                
         else
             $("#<%=btnnext.ClientID%>").attr("disabled", "disabled");
     });
    </script>

</asp:Content>