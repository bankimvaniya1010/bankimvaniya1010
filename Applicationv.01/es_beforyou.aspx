<%@ Page Title="" Language="C#" MasterPageFile="~/student.master" AutoEventWireup="true" CodeFile="es_beforyou.aspx.cs" Inherits="es_beforyou" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container-fluid page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">My Dashboard</a></li>
            <li class="breadcrumb-item active">BEFORE YOU START</li>
        </ol>
        <h1 class="h2">Before You Start </h1>
    </div>
    <div class="page ">
        <div class="container page__container">
            <div class="row">
                <div class="col-md-12">
                    <%
                        if (allDocumentssuparmaster.Count > 0)
                        {
                    %>
                    <div class="card pdf-doc-wrpr" id="document" runat="server">
                        <h5>Please view the following Material(s) from XLLYT:</h5>
                        <div class="pdf-container clearfix">
                            <%for (int v = 0; v < allDocumentssuparmaster.Count; v++)
                                {
                                    if(allDocumentssuparmaster.Count<=5)
                                    { }
                            %>
                            <div class="pdf-wrpr">
                                <a href="<%=allDocumentssuparmaster[v].Get_Material_link %>" target="_blank"><i class="fa-file-pdf fa"></i></a>
                                <div class="pdf-dcrp"><%=allDocumentssuparmaster[v].title %></div>
                            </div>
                            <%}
                                 %>
                        </div>
                    </div>
                    <%}
                        else
                        {  %>
                    <div class="card pdf-doc-wrpr" id="Div1" runat="server">
                        <h5>Please view the following Material(s) from XLLYT:</h5>
                        <div class="pdf-container clearfix">
                            <div class="pdf-wrpr">
                                <div class="pdf-dcrp">No Data Found</div>
                            </div>
                        </div>
                    </div>
                    <%}
                    %>
                    <%
                        if (tutorial_list.Count > 0)
                        {
                    %>
                    <div class="card video-container" id="video" runat="server">
                        <h5>Please view the following Material(s) from Aspire Hub Education:</h5>
                        <div class="pdf-container clearfix">
                            <%for (int v = 0; v < tutorial_list.Count; v++)
                                {
                            %>
                            <div class="pdf-wrpr">
                                <a href="<%=tutorial_list[v].Get_Material_link %>" target="_blank"><i class="fa-file-pdf fa"></i></a>
                                <div class="pdf-dcrp"><%=tutorial_list[v].title %></div>
                            </div>
                            <%} %>
                        </div>
                    </div>
                    <%}
                        else
                        { %>
                    <div class="card video-container" id="Div2" runat="server">
                        <h5>Please view the following Material(s) from Aspire Hub Education:</h5>
                        <div class="row">
                            <div class="pdf-wrpr">
                                <div class="pdf-dcrp">No Record Found</div>
                            </div>
                        </div>
                    </div>
                    <% 
                        }
                    %>
                    <div class="card video-container">
                        <label style="color: slateblue; font-weight: bold; margin-bottom: 18px;">
                            <%=yesornolbl %> fully read and understood the information given above.

                        </label>
                    </div>
                    <div style="margin-left: 40px;" id="btnDiv" runat="server">
                        <asp:Button ID="btn_yes" runat="server" Text="Yes, I Have" CssClass="btn btn-success" Style="margin-right: 10px;" OnClick="btn_yes_Click" />
                        <asp:Button ID="btn_no" runat="server" Text="No, I Do Not Accept" CssClass="btn btn-success" Style="margin-right: 10px;" OnClick="btn_no_Click" />
                    </div>
                </div>
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
            $('#ec_beforyou').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#ec_beforyou').addClass('active');
        });
    </script>
</asp:Content>

