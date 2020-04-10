<%@ Page Language="C#" AutoEventWireup="true" CodeFile="sop_report.aspx.cs" Inherits="sop_report"%>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title></title>
    <style>
      
    </style>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" type="text/css" href="<%=VirtualPathUtility.ToAbsolute("~/assets/dashboard/css/bootstrap.min.css")%>" />
    <link rel="stylesheet" type="text/css" href="<%=VirtualPathUtility.ToAbsolute("~/assets/dashboard/css/style.css")%>">

    <!-- Google Tag Manager -->
    <script>
        (function (w, d, s, l, i) {
            w[l] = w[l] || [];
            w[l].push({ 'gtm.start': new Date().getTime(), event: 'gtm.js' });
            var f = d.getElementsByTagName(s)[0], j = d.createElement(s), dl = l != 'dataLayer' ? '&l=' + l : '';
            j.async = true;
            j.src = 'https://www.googletagmanager.com/gtm.js?id=' + i + dl;
            f.parentNode.insertBefore(j, f);
        })(window, document, 'script', 'dataLayer', '<%=Session["universityGoogleTagID"]%>');
    </script>
    <!-- End Google Tag Manager -->

</head>
<body>
    <form runat="server">
   <div>       
        <table cellspacing="0" cellpadding="0" width="100%" class="report-table" style="margin-top: 84px;margin-left: 80px;">
            <tr>
                <td>
                     <div class="sop-descptn-wrp">
                        <div class="ttl text-left" style="font-size: 20px">SOP based on Student Statements <span class="d-inline-block"></span></div>                        
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <div class="sop-descptn-wrp">
                        <div class="ttl text-left" style="font-size: 20px">Genuine Student Assessment: <span class="d-inline-block"></span></div>
                        <div class="txt text-left" style="margin-bottom: 30px;margin-right: 220px;font-size: 18px;">
                            <%=_genuineStudentAssesment %>
                        </div>
                    </div>
                    <div class="sop-descptn-wrp">
                        <div class="ttl text-left" style="font-size: 20px">Situation in Home Country: <span class="d-inline-block"></span></div>
                        <div class="txt text-left" style="margin-bottom: 30px;margin-right: 220px;font-size: 18px;">
                            <%=_situationStudentAssesment %>
                        </div>
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <div class="sop-descptn-wrp">
                        <div class="ttl text-left" style="font-size: 20px">Potential Situation in Australia & Value of the course: <span class="d-inline-block"></span></div>
                        <div class="txt text-left" style="margin-bottom: 30px;margin-right: 220px;font-size: 18px;">
                            <%=_potentialStudentAssesment %>
                        </div>
                    </div>
                    <div class="sop-descptn-wrp">
                        <div class="ttl text-left" style="font-size: 20px">Immigration History & Links to Australia: <span class="d-inline-block"></span></div>
                        <div class="txt text-left" style="margin-bottom: 30px;margin-right: 220px;font-size: 18px;">
                            <%=_paragraph4 %>
                        </div>
                    </div>
                    <div class="sop-descptn-wrp">
                        <div class="ttl text-left" style="font-size: 20px">Character Assessment & Declarations: <span class="d-inline-block"></span></div>
                        <div class="txt text-left" style="margin-bottom: 50px;margin-right: 220px;font-size: 18px;">
                            <%=_paragraph5 %>
                        </div>
                    </div>
                </td>
            </tr>                    
        </table>
    </div>
    </form>
    <!-- Google Tag Manager (noscript) -->
    <noscript>
        <iframe src="https://www.googletagmanager.com/ns.html?id=<%=Session["universityGoogleTagID"]%>" height="0" width="0" style="display: none; visibility: hidden"></iframe>
    </noscript>
    <!-- End Google Tag Manager (noscript) -->

</body>
</html>

