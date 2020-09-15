<%@ Page Language="C#" AutoEventWireup="true" CodeFile="view_gteapplicantdocuments.aspx.cs" Inherits="admin_view_gteapplicantdocuments" MasterPageFile="~/admin/admin.master" %>

<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">


    <div class="container-fluid page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">View Applicants Documnets 

            </li>
        </ol>
        <h1 class="h2">View Applicants Documents

        </h1>

    </div>

    <div class="page ">

        <div class="container page__container">
            <div class="row">
                <div class="col-md-12">
                    <div class="">
                        <div class="">                           
                             <div class="list-group-item" runat="server" id="doclist">                                 
                                <div style="margin-top: 10px;" class="table-responsive" data-toggle="lists" data-lists-values='["name"]'>
                                             
                                                <table class="table" border="1" style="border-collapse:collapse;">
		                                        <tbody>                                                       
                                                    <tr>
			                                            <th scope="col">Document Name</th>
                                                        <th scope="col" style="width: 3%;">Document FIle</th>                                                        
		                                            </tr>
                                                   <%-- <tr>
                                                        <td>GTE Certificate</td>
                                                        <td style="width: 3%;">
                                                            <asp:HyperLink ID="gtecertificatelink" runat="server" Target="_blank"/>                                                           
                                                        </td>  
                                                    </tr>   --%>
                                                     <%if (documentlist.Count > 0)
    {
        for (var i = 0; i < documentlist.Count; i++)
        { %>
                                                    <tr id="grade_tr_<%=documentlist[i].documentid %>">
                                                        <td><%=documentlist[i].documentname %></td>
                                                        <td style="width: 3%;">
                                                           <a href="<%=documentlist[i].documentpath %>" target="_blank">View</a>
                                                        </td>                                                       
                                                    </tr>

                                                    <% }

    }
    else
    {%>
                                                   <tr>
                                                        <td colspan="2">No Documents uploded by applicant.</td>
                                                    </tr>    
                                                    <%} %>
		                                        </tbody>
                                            </table>
                                            </div>    
                               
                            </div>
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
        $(document).ready(function () {           
            $('.sidebar-menu-item').removeClass('open');
            $('#manageapplicantions_list').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#applicantlist').addClass('active');
        });
    </script>
</asp:Content>