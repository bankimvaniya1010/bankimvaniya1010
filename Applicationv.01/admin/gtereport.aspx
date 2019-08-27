<%@ Page Language="C#" AutoEventWireup="true" CodeFile="gtereport.aspx.cs" Inherits="admin_gtereport" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title></title>
    <style>
        @media print {

            /* Inhaltsbreite setzen, Floats und Margins aufheben */
            /* Achtung: Die Klassen und IDs variieren von Theme zu Theme. Hier also eigene Klassen setzen */
            #content, #page {
                width: 100%;
                margin: 0;
                float: none;
            }

            /** Seitenränder einstellen */
            @page {
                margin: 2cm
            }

            /* Font auf 16px/13pt setzen, Background auf Weiß und Schrift auf Schwarz setzen.*/
            /* Das spart Tinte */
            body {
                font: 13pt Georgia, "Times New Roman", Times, serif;
                line-height: 1.3;
                background: #fff !important;
                color: #000;
            }

            h1 {
                font-size: 24pt;
            }

            h2, h3, h4 {
                font-size: 14pt;
                margin-top: 25px;
            }

            /* Alle Seitenumbrüche definieren */
            a {
                page-break-inside: avoid
            }

            blockquote {
                page-break-inside: avoid;
            }

            h1, h2, h3, h4, h5, h6 {
                page-break-after: avoid;
                page-break-inside: avoid
            }

            img {
                page-break-inside: avoid;
                page-break-after: avoid;
            }

            table, pre {
                page-break-inside: avoid
            }

            ul, ol, dl {
                page-break-before: avoid
            }

            /* Linkfarbe und Linkverhalten darstellen */
            a:link, a:visited, a {
                background: transparent;
                color: #520;
                font-weight: bold;
                text-decoration: underline;
                text-align: left;
            }

            a {
                page-break-inside: avoid
            }

                a[href^=http]:after {
                    content: " <" attr(href) "> ";
                }

            $a:after > img {
                content: "";
            }

            article a[href^="#"]:after {
                content: "";
            }

            a:not(:local-link):after {
                content: " <" attr(href) "> ";
            }

            /**
 * Eingebundene Videos verschwinden lassen und den Whitespace der iframes auf null reduzieren.
 */
            .entry iframe, ins {
                display: none;
                width: 0 !important;
                height: 0 !important;
                overflow: hidden !important;
                line-height: 0pt !important;
                white-space: nowrap;
            }

            .embed-youtube, .embed-responsive {
                position: absolute;
                height: 0;
                overflow: hidden;
            }

            /* Unnötige Elemente ausblenden für den Druck */

            #header-widgets, nav, aside.mashsb-container,
            .sidebar, .mashshare-top, .mashshare-bottom,
            .content-ads, .make-comment, .author-bio,
            .heading, .related-posts, #decomments-form-add-comment,
            #breadcrumbs, #footer, .post-byline, .meta-single,
            .site-title img, .post-tags, .readability {
                display: none;
            }

            /* Benutzerdefinierte Nachrichten vor und nach dem Inhalt einfügen */
            .entry:after {
                content: "\ Alle Rechte vorbehalten. (c) 2014 - 2016 TechBrain - techbrain.de";
                color: #999 !important;
                font-size: 1em;
                padding-top: 30px;
            }

            #header:before {
                content: "\ Vielen herzlichen Dank für das Ausdrucken unseres Artikels. Wir hoffen, dass auch andere Artikel von uns Ihr Interesse wecken können.";
                color: #777 !important;
                font-size: 1em;
                padding-top: 30px;
                text-align: center !important;
            }

            /* Wichtige Elemente definieren */
            p, address, li, dt, dd, blockquote {
                font-size: 100%
            }

            /* Zeichensatz fuer Code Beispiele */
            code, pre {
                font-family: "Courier New", Courier, mono
            }

            ul, ol {
                list-style: square;
                margin-left: 18pt;
                margin-bottom: 20pt;
            }

            li {
                line-height: 1.6em;
            }
        }
    </style>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" type="text/css" href="<%=VirtualPathUtility.ToAbsolute("~/assets/dashboard/css/bootstrap.min.css")%>" />
    <link rel="stylesheet" type="text/css" href="<%=VirtualPathUtility.ToAbsolute("~/assets/dashboard/css/style.css")%>">
</head>
<body>
    <form runat="server">
    <div>
        <table cellspacing="0" cellpadding="0" width="100%" class="report-table">
            <tr>
                <td>
                    <table cellpadding="0" cellspacing="0" class="table">
                        <tr>
                            <td class="width25">
                                <a href="#" class="d-inline-block">
                                    <img src="/assets/dashboard/img/gte-logo.jpg" class="img-fluid">
                                </a>
                            </td>
                            <td class="width50 au-hedr">
                                <div class="text-center hd font-bold">AU-GTE</div>
                                <div class="text-center txt font-bold">Genuine Student & Genuine Temporary Entrant Assessment for Australian Institutions</div>
                            </td>
                            <td class="width25">
                                <a href="#" class="d-inline-block">
                                    <img src="/assets/dashboard/img/aiwt-logo.jpg" class="img-fluid">
                                </a>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <table cellpadding="0" cellspacing="0" class="table">
                        <tr>
                            <td class="width25">
                                <table cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td class="width33 txt">Institution ID</td>
                                        <td class="width66">
                                            <div style="background: rgba(0, 0, 0, 0.25);"><%=_institutionID %></div>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td class="width25">
                                <table cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td class="width33 txt">REPORT TYPE</td>
                                        <td class="width66">
                                            <div style="background: rgba(0, 0, 0, 0.25);"><%=_reportType %></div>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td class="width25">
                                <table cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td class="width33 txt">REPORT DATE</td>
                                        <td class="width66">
                                            <div style="background: rgba(0, 0, 0, 0.25);"><%=_reportDate %></div>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td class="width25">
                                <table cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td class="width33 txt">REPORT NUMBER</td>
                                        <td class="width66">
                                            <div style="background: rgba(0, 0, 0, 0.25);"><%=_reportNo %></div>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <div class="nots-ttl">
                        <div class="col text-center">NOTES &amp; DISCLAIMERS</div>
                        <br/>
                        <%=_notesDisclaimer %>
                    </div>
                </td>
            </tr>
            <tr>
                <td class="std-ddtwrp">
                    <table class="table" cellpadding="0" cellspacing="0">
                        <tr>
                            <td class="width50" style="width:40%;">
                                <div class="ovr-rate">
                                    <div class="hd text-center font-bold">OVERALL RATINGS</div>
                                    <asp:Chart ID="OverAll" runat="server">
                                        <Series>
                                            <asp:Series Name="SeriesOverAll" YValuesPerPoint="6">
                                            </asp:Series>
                                        </Series>
                                        <ChartAreas>
                                            <asp:ChartArea Name="ChartAreaOverAll">
                                            </asp:ChartArea>
                                        </ChartAreas>
                                    </asp:Chart>
                                </div>
                            </td>
                            <td class="width25">
                                <div class="recommndtn">
                                    <div class="text-center text-uppercase hd font-bold">Final Recommendation</div>
                                    <div class="txt text-center d-flex align-items-center justify-content-center">
                                        <div class="txt" runat="server" id="studentRecommendedPDF"> <%=_studentRecommended %> </div>
                                        <textarea runat="server" id="studentRecommended"></textarea>
                                    </div>
                                </div>
                                <div class="recommndtn remrk">
                                    <div class="txt text-center d-flex align-items-center justify-content-center">
                                        <div class="txt" runat="server" id="recommendationRemarkPDF"> <%=_recommendationRemark %> </div>
                                        <textarea runat="server" id="recommendationRemark" placeholder="Recommendation Remark"></textarea>
                                    </div>
                                </div>
                            </td>
                            <td class="width25">
                                <div class="student-dtls">
                                    <div class="text-center hd text-uppercase font-bold">Student Information</div>
                                    <div class="pic d-flex align-items-center justify-content-center">
                                        <div class="text-uppercase">Student Photo</div>
                                    </div>
                                    <div class="nm" style="text-align:center"><%=_studentName %></div>
                                </div>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <table cellspacing="0" cellspacing="0" class="table">
                        <tr>
                            <td class="width25">
                                <div class="rating">
                                    <div class="ttl text-center">Genuine Student</div>
                                    <asp:Chart ID="Genuine" runat="server"
                                        BorderlineWidth="0" Height="240px"
                                        Width="280px">
                                        <Series>
                                            <asp:Series Name="SeriesGenuine" YValuesPerPoint="6">
                                            </asp:Series>
                                        </Series>
                                        <ChartAreas>
                                            <asp:ChartArea Name="ChartAreaGenuine">
                                            </asp:ChartArea>
                                        </ChartAreas>
                                    </asp:Chart>
                                </div>
                            </td>
                            <td class="width25">
                                <div class="rating">
                                    <div class="ttl text-center">Compliance to Visa Conditions</div>
                                    <asp:Chart ID="Compliance" runat="server" BorderlineWidth="0" Height="240px"
                                        Width="280px">
                                        <Series>
                                            <asp:Series Name="SeriesCompliance" YValuesPerPoint="6">
                                            </asp:Series>
                                        </Series>
                                        <ChartAreas>
                                            <asp:ChartArea Name="ChartAreaCompliance">
                                            </asp:ChartArea>
                                        </ChartAreas>
                                    </asp:Chart>
                                </div>
                            </td>
                            <td class="width25">
                                <div class="rating">
                                    <div class="ttl text-center">Retention Risk</div>
                                    <asp:Chart ID="Retention" runat="server" BorderlineWidth="0" Height="240px"
                                        Width="280px">
                                        <Series>
                                            <asp:Series Name="SeriesRetention" YValuesPerPoint="6">
                                            </asp:Series>
                                        </Series>
                                        <ChartAreas>
                                            <asp:ChartArea Name="ChartAreaRetention">
                                            </asp:ChartArea>
                                        </ChartAreas>
                                    </asp:Chart>
                                </div>
                            </td>
                            <td class="width25">
                                <div class="rating">
                                    <div class="ttl text-center">Immigration History</div>
                                    <asp:Chart ID="Immigration" runat="server" BorderlineWidth="0" Height="240px"
                                        Width="280px">
                                        <Series>
                                            <asp:Series Name="SeriesImmigration" YValuesPerPoint="6">
                                            </asp:Series>
                                        </Series>
                                        <ChartAreas>
                                            <asp:ChartArea Name="ChartAreaImmigration">
                                            </asp:ChartArea>
                                        </ChartAreas>
                                    </asp:Chart>
                                </div>
                            </td>
                        </tr>
                    </table>
                    <table cellspacing="0" cellspacing="0" class="table">
                        <tr>
                            <td class="width25">
                                <div class="rating">
                                    <div class="ttl text-center">Situation in the Home Country</div>
                                    <asp:Chart ID="Situation" runat="server"
                                        Height="240px" Palette="None"
                                        Width="280px">
                                        <Series>
                                            <asp:Series Name="SeriesSituation" YValuesPerPoint="6">
                                            </asp:Series>
                                        </Series>
                                        <ChartAreas>
                                            <asp:ChartArea Name="ChartAreaSituation">
                                            </asp:ChartArea>
                                        </ChartAreas>
                                    </asp:Chart>
                                </div>
                            </td>
                            <td class="width25">
                                <div class="rating">
                                    <div class="ttl text-center">Potential Situation in Australia</div>
                                    <asp:Chart ID="Potential" runat="server" BorderlineWidth="0" Height="240px"
                                        Width="280px">
                                        <Series>
                                            <asp:Series Name="SeriesPotential" YValuesPerPoint="6">
                                            </asp:Series>
                                        </Series>
                                        <ChartAreas>
                                            <asp:ChartArea Name="ChartAreaPotential">
                                            </asp:ChartArea>
                                        </ChartAreas>
                                    </asp:Chart>
                                </div>
                            </td>
                            <td class="width25">
                                <div class="rating">
                                    <div class="ttl text-center">Value of the course </div>
                                    <asp:Chart ID="courseValue" runat="server" BorderlineWidth="0" Height="240px"
                                        Width="280px">
                                        <Series>
                                            <asp:Series Name="SeriescourseValue" YValuesPerPoint="6">
                                            </asp:Series>
                                        </Series>
                                        <ChartAreas>
                                            <asp:ChartArea Name="ChartAreacourseValue">
                                            </asp:ChartArea>
                                        </ChartAreas>
                                    </asp:Chart>
                                </div>
                            </td>
                            <td class="width25">
                                <div class="rating">
                                    <div class="ttl text-center">Character & Criminal Record</div>
                                    <asp:Chart ID="Character" runat="server" BorderlineWidth="0" Height="240px"
                                        Width="280px">
                                        <Series>
                                            <asp:Series Name="SeriesCharacter" YValuesPerPoint="6">
                                            </asp:Series>
                                        </Series>
                                        <ChartAreas>
                                            <asp:ChartArea Name="ChartAreaCharacter">
                                            </asp:ChartArea>
                                        </ChartAreas>
                                    </asp:Chart>
                                </div>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <table class="table" cellpadding="0" cellspacing="0">
                        <tr>
                            <td>
                                <div class="descptn-wrp">
                                    <div class="ttl text-left">Genuine Student Assessment: <span class="d-inline-block">Student Statements & Counsellor Review</span></div>
                                    <div class="txt text-left">
                                        <%=_genuineStudentAssesment %>
                                    </div>
                                    <div>
                                        <div class="text-left" style="border-top: 1px solid #000;" runat="server" id="paragraphComment1PDF"><%=_paragraphComment1 %></div>
                                        <textarea runat="server" id="para1Comments" placeholder="Comments"></textarea>
                                    </div>
                                </div>
                                <div class="descptn-wrp">
                                    <div class="ttl text-left">Situation in Home Country: <span class="d-inline-block">Student Statements & Counsellor Review</span></div>
                                    <div class="txt text-left">
                                        <%=_situationStudentAssesment %>
                                    </div>
                                    <div>
                                        <div class="text-left" style="border-top: 1px solid #000;" runat="server" id="paragraphComment2PDF"><%=_paragraphComment2 %></div>
                                        <textarea runat="server" id="para2Comments" placeholder="Comments"></textarea>
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <div style='page-break-after: always;'>&nbsp;</div>
                    <table cellpadding="0" cellspacing="0" class="table">
                        <tr>
                            <td class="width25">
                                <a href="#" class="d-inline-block">
                                    <img src="/assets/dashboard/img/gte-logo.jpg" class="img-fluid">
                                </a>
                            </td>
                            <td class="width50 au-hedr">
                                <div class="text-center hd font-bold">AU-GTE</div>
                                <div class="text-center txt font-bold">Genuine Student & Genuine Temporary Entrant Assessment for Australian Institutions</div>
                            </td>
                            <td class="width25">
                                <a href="#" class="d-inline-block">
                                    <img src="/assets/dashboard/img/aiwt-logo.jpg" class="img-fluid">
                                </a>
                            </td>
                        </tr>
                    </table>
                    <table cellpadding="0" cellspacing="0" class="table">
                        <tr>
                            <td>
                                <div class="descptn-wrp">
                                    <div class="ttl text-left">Potential Student Assessment: <span class="d-inline-block">Student Statements & Counsellor Review</span></div>
                                    <div class="txt text-left">
                                        <%=_potentialStudentAssesment %>
                                    </div>
                                    <div>
                                        <div class="text-left" runat="server" style="border-top: 1px solid #000;" id="paragraphComment3PDF"><%=_paragraphComment3 %></div>
                                        <textarea runat="server" id="para3Comments" placeholder="Comments"></textarea>
                                    </div>
                                </div>
                                <div class="descptn-wrp">
                                    <div class="ttl text-left">Genuine Student Assessment: <span class="d-inline-block">Student Statements & Counsellor Review</span></div>
                                    <div class="txt text-left">
                                        <%=_paragraph4 %>
                                    </div>
                                    <div>
                                        <div class="text-left" runat="server" style="border-top: 1px solid #000;" id="paragraphComment4PDF"><%=_paragraphComment4 %></div>
                                        <textarea runat="server" id="para4Comments" placeholder="Comments"></textarea>
                                    </div>
                                </div>
                                <div class="descptn-wrp">
                                    <div class="ttl text-left">Genuine Student Assessment: <span class="d-inline-block">Student Statements & Counsellor Review</span></div>
                                    <div class="txt text-left">
                                        <%=_paragraph5 %>
                                    </div>
                                    <div>
                                        <div class="text-left" runat="server" style="border-top: 1px solid #000;" id="paragraphComment5PDF"><%=_paragraphComment5 %></div>
                                        <textarea runat="server" id="para5Comments" placeholder="Comments"></textarea>
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </table>
                    <table cellpadding="0" cellspacing="0" class="table">
                        <tr>
                            <td class="width50">
                                <div class="reviw-wrp">
                                    <div class="hd">STUDENT VIDEO REVIEW </div>
                                    <div class="revw-sectn" runat="server" id="studentVideoReviewPDF"> <%=_studentVideoReview %> </div>
                                    <textarea class="revw-sectn" runat="server" id="studentVideoReview" placeholder="Video is perfect"></textarea>
                                </div>
                            </td>
                            <td class="width50">
                                <div class="reviw-wrp">
                                    <div class="hd">STUDENT DOCUMENTS VALIDATIONS</div>
                                    <div class="revw-sectn" runat="server" id="studentDocumentsValidationsPDF"> <%=_studentDocumentsValidations %> </div>
                                    <textarea class="revw-sectn" runat="server" id="studentDocumentsValidations" placeholder="Documents are validated"></textarea>
                                </div>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>
        <asp:Button ID="btn_Save" runat="server" Text="Save Changes" CssClass="btn btn-success" Style="position: relative;margin-left: 10px;margin-bottom: 20px;" OnClick="btn_Save_Click" />
    </form>

</body>
</html>
