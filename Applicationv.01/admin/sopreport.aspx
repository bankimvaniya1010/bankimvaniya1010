<%@ Page Language="C#" AutoEventWireup="true" CodeFile="sopreport.aspx.cs" Inherits="admin_sopreport" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title></title>
    <style>
      
    </style>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
   <%-- <link rel="stylesheet" type="text/css" href="<%=VirtualPathUtility.ToAbsolute("~/assets/dashboard/css/bootstrap.min.css")%>" />
    <link rel="stylesheet" type="text/css" href="<%=VirtualPathUtility.ToAbsolute("~/assets/dashboard/css/style.css")%>">--%>

    <link rel="stylesheet" type="text/css" href="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/dashboard/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/dashboard/css/style.css">
    <link rel="stylesheet" type="text/css" href="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/gteCertificate_images/style.css">
</head>
<body>
    <form runat="server">
        <div runat="server" id="btnDiv" class="" style="margin: auto;padding: 10px;margin-left: 70%;" visible="false">
            <%--<asp:Button ID="backNavLink" runat="server" class="btn btn-success" Text="Back" onclick="backNavLink_Click"/>--%>
            <asp:Button ID="btnDownload" runat="server" CssClass="btn btn-success" Text="Download SOP" OnClick="btnDownload_Click" Visible="false"/>
        </div>
  
        <div class="certificate-wrpr" runat="server" id="DivCertificate" style="max-width: 1000px !important;">
            <div class="card" runat="server" id="sop_section" style="border: 2px solid #979797 !important;">
                <div class="card-body">
                    <table cellspacing="0" cellpadding="0" width="100%" class="report-table" style="margin-top: 22px; margin-left: 15px;">
                        <tr>
                            <td>
                                <div class="sop-descptn-wrp">
                                    <div class="ttl text-left" style="font-size: 20px">Genuine Student Assessment: <span class="d-inline-block">Student Statements & Counsellor Review</span></div>
                                    <div class="txt text-left" style="margin-bottom: 30px; margin-right: 41px; font-size: 18px;">
                                        <%=_genuineStudentAssesment %>
                                    </div>
                                </div>
                                <div class="sop-descptn-wrp">
                                    <div class="ttl text-left" style="font-size: 20px">Situation in Home Country: <span class="d-inline-block">Student Statements & Counsellor Review</span></div>
                                    <div class="txt text-left" style="margin-bottom: 30px; margin-right: 41px; font-size: 18px;">
                                        <%=_situationStudentAssesment %>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="sop-descptn-wrp">
                                    <div class="ttl text-left" style="font-size: 20px">Potential Situation in Australia & Value of the course: <span class="d-inline-block">Student Statements & Counsellor Review</span></div>
                                    <div class="txt text-left" style="margin-bottom: 30px; margin-right: 41px; font-size: 18px;">
                                        <%=_potentialStudentAssesment %>
                                    </div>
                                </div>
                                <div class="sop-descptn-wrp">
                                    <div class="ttl text-left" style="font-size: 20px">Immigration History & Links to Australia: <span class="d-inline-block">Student Statements & Counsellor Review</span></div>
                                    <div class="txt text-left" style="margin-bottom: 30px; margin-right: 41px; font-size: 18px;">
                                        <%=_paragraph4 %>
                                    </div>
                                </div>
                                <div class="sop-descptn-wrp">
                                    <div class="ttl text-left" style="font-size: 20px">Character Assessment & Declarations: <span class="d-inline-block">Student Statements & Counsellor Review</span></div>
                                    <div class="txt text-left" style="margin-bottom: 50px; margin-right: 41px; font-size: 18px;">
                                        <%=_paragraph5 %>
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>

    </form>
</body>
</html>
