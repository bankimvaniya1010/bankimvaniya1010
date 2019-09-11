<%@ Page Language="C#" AutoEventWireup="true" CodeFile="preliminary.aspx.cs" Inherits="preliminary" MasterPageFile="~/student.master" %>

<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">


    <div class="container-fluid page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">Preliminary Step</li>
        </ol>
        <h1 class="h2">TUTORIAL (Step 1/3)</h1>
    </div>

    <div class="page ">
        <div class="row" style="margin-left:50px;">
            <div class="col-md-8">

                <%
                    if (otherDocCount > 0)
                    {
                    %>
                <div class="card pdf-doc-wrpr" id="document" runat="server">
                    <h5>Please Read The Following Documents:</h5>
                    <div class="pdf-container clearfix">
                        <%for (int v = 0; v < allDocuments.Count; v++)
                            {
                            string docType = allDocuments[v].type;
                            if (docType != "video")
                            {
                            %>
                            <div class="pdf-wrpr">
                                <a href="Docs/<%=allDocuments[v].documentpath %>" target="_blank"><i class="fa-file-pdf fa"></i></a>
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
                     <h5>Please Watch The Following Videos:</h5>
                       <div class="row">
                      <%for (int v = 0; v < allDocuments.Count; v++)
                          {
                              if (allDocuments[v].type == "video")
                              {
                              %>
                            <div class="col-md-4 col-6">
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
                        <label  style="font-size:small;">I have Read and fully Understood the information contained in the above documents and videos </label>
                        <div class="media align-items-center">  
                            <div class="form-row" style="align-content:center">
                                <a href="preliminaryquestion.aspx" class="btn btn-success">Next</a>                                      
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
                        <label id="lblInstruct1" runat="server" style="font-size:small;">1. Completing this section is mandatory.</label><br />
                        <label id="lblInstruct2" runat="server" style="font-size:small;">2. Read the attached documents and watch the videos carefully.</label><br />
                        <label id="lblInstruct3" runat="server" style="font-size:small;">3. Please accept the declaration that you have successfully reviewed and understood the information.</label><br />
                        <label id="lblInstruct4" runat="server" style="font-size:small;">4. Take a quick test to check your knowledge.</label><br />
                        <label id="lblInstruct5" runat="server" style="font-size:small;">5. To go to the next section you need to successfully answer the test question and achieve >65% grade.</label><br />
                        <label id="lblInstruct6" runat="server" style="font-size:small;">6. Else you would required to take the test again post going through the tutorial again.</label><br />
                        <label id="lblInstruct7" runat="server" style="font-size:small;">7. Lastly please accept the declarations.</label><br />
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
              $('.sidebar-menu-item').removeClass('open');
              $('#preliminary_list').addClass('open');
              $('.sidebar-menu-item').removeClass('active');
              $('#preliminarys').addClass('active');
          });
        
    </script>

</asp:Content>


