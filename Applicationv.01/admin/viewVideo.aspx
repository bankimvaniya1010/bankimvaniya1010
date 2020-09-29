<%@ Page Language="C#" AutoEventWireup="true" CodeFile="viewVideo.aspx.cs" Inherits="admin_viewVideo" MasterPageFile="~/admin/admin.master" %>
<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">


    <div class="container-fluid page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">TUTORIAL</li>
        </ol>
        <h1 class="h2">TUTORIAL </h1>
    </div>

    <div class="page ">
      <div class="container page__container">
        <div class="row">
            <div class="col-md-10">

               
                <%
                    if (allDocuments.Count > 0)
                    {
                    %>
                <div class="card video-container" id="video" runat="server">
                     <h5>Please watch the following videos:</h5>
                       <div class="row">
                      <%for (int v = 0; v < allDocuments.Count; v++)
                          {
                              %>
                            <div class="col-md-4 col-6">
                                <video class="img-fluid video-img mx-auto d-block" src="<%=allDocuments[v].url %>" onclick="openLink('<%=allDocuments[v].url %>')"></video>
                                <%--<img class="img-fluid video-img mx-auto d-block" src="<%=allDocuments[v].url %>" onclick="openLink('<%=allDocuments[v].url %>')"/>                               --%>
                            </div>
                        <%
                            } %>
                    </div>
                </div>            <%} %>  
                
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
            $('body').append('<div class="modal" id="video-modal" tabindex="-1" role="dialog"><div class="modal-dialog" role="document"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button></div><div class="modal-body"><div class="embed-responsive embed-responsive-16by9"><iframe class="embed-responsive-item" src="' + url + '" allowfullscreen></iframe></div></div></div></div></div>');
            $('#video-modal').modal('show');
             $('#video-modal').on('hidden.bs.modal', function () {
                 $('#video-modal').remove();
        });
        }
          $(document).ready(function () {
              $('.sidebar-menu-item').removeClass('open');
              $('#dashboard_list').addClass('open');
              $('.sidebar-menu-item').removeClass('active');
              $('#helpingvideo').addClass('active');
          });
        
    </script>

</asp:Content>


