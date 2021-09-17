<%@ Page Language="C#" AutoEventWireup="true" CodeFile="gte_tutorial.aspx.cs" Inherits="gte_tutorial" MasterPageFile="~/student.master"%>

<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">


    <div class="container-fluid page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">GS & GTE Tutorial </li>
        </ol>
       <%-- <h1 class="h2">GS & GTE Tutorial </h1>--%>
    </div>

    <div class="page" style="padding-top:0px;">
      <div class="container page__container">
        <div class="row">
            <div class="col-md-12">
                
                   <div class="card">
                      <p style="padding-left: 21px"><%=firstname  %>, the tutorial below is the industry's first and most comprehensive Genuine Student (GS) & Genuine Temporary Entrant (GTE) Tutorial Study Guide. This study guide gives you accurate information on GS and GTE requirements & Student Visa conditions for <%=nameofcountry %>. 
This tutorial, worth AU$50, is offered to you free of cost by <%=universityname  %>. It is the ultimate guide for international students who want to study in Australia.

                       </p>

                        <p style="padding-left: 21px"><%=firstname  %>, the Tutorial below includes the industry's first and most comprehensive Genuine
Student (GS) & Genuine Temporary Entrant (GTE) Tutorial, which will offer you first-hand
information on GS, GTE & Student Visa conditions. This Tutorial worth $50, is offered to you
free of cost by <%=universityname  %>. It is the ultimate guide for international students who want
to study in Australia.</p>
<p style="padding-left: 21px">Please go through this tutorial in detail, as it would help with your GTE Certification and
Assessment and also aid in producing better quality Course and Visa Applications.</p>
              
                   </div>
               
                <div class="card pdf-doc-wrpr" id="document" runat="server">
                   <%-- <h5> Please read the following documents:</h5>--%>
                    <div class="pdf-container clearfix">
                        <div style="display:block;text-align: center;">
                         <asp:DataList ID="questionList" runat="server">
                            <ItemTemplate>
                                <asp:Panel ID="options" runat="server">
                                    <div class="media align-items-center">

                                            <div class="media-body">
                                                <h4 class="card-title">
                                                   <div class="pdf-dcrp"><%# Eval("title") %></div>
                                                    <iframe src='<%# Eval("link") %>' runat="server" width="900" height="750" style="border: 1px solid #CCC; border-width: 1px; margin-bottom: 5px; max-width: 100%;" id="myframe"></iframe>
                                                    
                                                </h4>
                                            </div>
                                        </div>
                                </asp:Panel>
                            </ItemTemplate>
                         </asp:DataList>
                        </div>
                        <%for (int v = 0; v < allDocuments.Count; v++)
                            {
                            string docType = allDocuments[v].type;
                            if (docType == "ppt")
                            {
                            %>
                            <div class="pdf-wrpr">
                                <a href="Docs/GteTutorial/<%=allDocuments[v].documentpath %>" target="_blank"><i class="fa-file-pdf fa"></i></a>
                                <div class="pdf-dcrp"><%=allDocuments[v].title %></div>
                            </div>                            
                        <%} } %>
                        </div>
                </div>              
                
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
                            <asp:CheckBox ID="checkCondition" runat="server" Text="I HAVE READ THE DOCUMENTS GIVEN ABOVE AND DO FULLY UNDERSTAND THE INFORMATION CONTAINED IN THEM." class=" col-form-label form-label" />
                            
                            <div class="media align-items-center">  
                                <div class="form-row" style="align-content:center">
                                    <asp:Button ID="btnnext" runat="server" Text="Next" CssClass="btn btn-success" OnClick="btnnext_Click" />
                                    <%--<a href="gte_preliminaryquestion.aspx" class="btn btn-success" id="btnnext" runat="server">Next</a>                                      --%>
                                </div>
                            </div>
                        </div>
                    </div>
                 <%} %> 
                        
                          
            </div>
           <%-- <div class="col-md-4">               
                <div class="card">
                    <div class="card-body">
                        <label id="lblInstructionHeader" runat="server" class="instructn">Instructions:</label><br />
                        
                        <ol style="font-size:small; padding-left:15px">
                            <li>Completing this section is mandatory.</li><br/>
                            <li>Please read the given documents carefully.</li><br/>
                            <li>After you have read the required documents, accept the declaration below to proceed to the next step.</li>                            
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
            </div>--%>
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

            $('.sidebar-menu-item').removeClass('open');
            $('#Gte_new_list').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#Li2').addClass('active');

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