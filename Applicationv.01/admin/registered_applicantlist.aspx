<%@ Page Language="C#" AutoEventWireup="true" CodeFile="registered_applicantlist.aspx.cs" Inherits="admin_registered_applicantlist" MasterPageFile="~/admin/admin.master"%>

<asp:Content ID="content1" runat="server" ContentPlaceHolderID="head">
    <title></title>   
</asp:Content>
<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="container page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">List of Registered Applicants</li>
        </ol>
        <h1 class="h2">List of Registered Applicants</h1>

        <div class="card">            
            <div class="tab-content card-body">
                
                   <asp:Button runat="server" ID="downloadbtn" Text ="Download List" OnClick="downloadbtn_Click" CssClass="btn btn-success" Visible="true"/>
                <div>
                    <div class="list-group-item" id="Div4" runat="server">
                                <div class="form-group m-0" role="group" aria-labelledby="label-title">
                                    <div class="form-row">
                                        <label runat="server" id="label4" for="title" class="col-md-3 col-form-label form-label">SUBSCRIBED REGISTRATIONS: </label>
                                        <div class="col-md-6">                                            
                                            <label runat="server" id="lbltotal"></label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                    <div class="list-group-item" id="Div1" runat="server">
                                <div class="form-group m-0" role="group" aria-labelledby="label-title">
                                    <div class="form-row">
                                        <label runat="server" id="label1" for="title" class="col-md-3 col-form-label form-label">AVAILABLE REGISTRATIONS</label>
                                        <div class="col-md-6">                                            
                                             <label runat="server" id="lblavailable"></label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                </div>
                <div class="tab-pane active" id="first">
                 
                    <div class="table-responsive" id="applicantlist" runat="server">
                        <table class="table" style="border-width:1px;border-style:None;">
                            <tr>
                                <th class="bordertb">Applicant ID</th>
                                <th class="bordertb">University Name</th>
                                <th class="bordertb">First Name</th>
                                <th class="bordertb">Last Name</th>
                                <th class="bordertb">Email</th>
                                <th class="bordertb">Mobile</th>
                                <th class="bordertb">Enrollment Date</th>
                                <th class="bordertb">Country of Residence</th>
                                <th class="bordertb">Status</th>
                            </tr>
                            <%if (applicant.Count > 0)
                                    {
                                        for (int i = 0; i < applicant.Count; i++)
                                        {
                                    %>
                            <tr>
                                <td class="bordertb">
                                    <span><%=applicant[i].applicantid%> </span>
                                </td>
                                <td class="bordertb">
                                    <span><%=applicant[i].university_name%> </span>
                                </td>
                                  <td class="bordertb">
                                    <span><%=applicant[i].firstname %></span>
                                </td>
                                 <td class="bordertb">
                                    <span><%=applicant[i].lastname %></span>
                                </td>
                                  <td class="bordertb">
                                    <span><%=applicant[i].email%> </span>
                                </td>
                                  <td class="bordertb">
                                    <span><%=applicant[i].mobile %></span>
                                </td>
                                 <td class="bordertb">
                                    <span><%=applicant[i].registereDate%> </span>
                                </td>
                                  <td class="bordertb">
                                    <span><%=applicant[i].countryofresidence%> </span>
                                </td>
                                 <td class="bordertb">
                                    <span><%=applicant[i].Status%> </span>
                                </td>
                            </tr>
                            <%}
                                    }%> 
                        </table>
                    </div>
                </div>
            </div>
        </div>

    </div>
    <script>
		$(document).ready(function () {
	            $('.sidebar-menu-item').removeClass('open');
	            $('#manageregistration_list').addClass('open');
	            $('.sidebar-menu-item').removeClass('active');
	            $('#registeredapplicants').addClass('active');
	        });
	</script>

</asp:Content>

