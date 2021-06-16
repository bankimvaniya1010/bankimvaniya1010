<%@ Page Language="C#" AutoEventWireup="true" CodeFile="gte_certificateN.aspx.cs" Inherits="gte_certificateN" %>

<!doctype html>
<html lang="en">
  <head>
    <script src="assets/js/qrcode.min.js"></script>
    <script src="assets/js/qrcode.js"></script>

    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="assets/gteCertificate_images/style.css">
    <title></title>
  </head>
  <body>
          <form runat="server">
              <div runat="server" id="lblDiv" style="display:none;">
                  <asp:Label runat="server">Please Scan again...</asp:Label>
              </div>
    <div runat="server" id="btnDiv" class="form-row justify-content-between" style="display: none;margin: auto;width: 50%;padding: 10px;">
            <input id="backNavLink" runat="server" type="button" class="btn btn-success" value="Back" onclick="return window.location = '/default.aspx';"/>
            <asp:Button ID="btnDownload" runat="server" CssClass="btn btn-success" Text="Download Certificate" OnClick="btnDownload_Click" />
        </div>
    <div class="certificate-wrpr" runat="server" id="DivCertificate">
        <table class="certificate-table" cellspacing="0" cellpadding="0">
            <tr>
                <td>
                    <table cellspacing="0" cellpadding="0" class="first-row-table">
                        <tr class="first-row">
                            <td class="min-20">
                                <img src="assets/gteCertificate_images/logo.png" class="cer-logo">
                            </td>
                            <td class="min-60">
                                <span class="cer-ttl">Certification of Understanding</span>
                                <span class="cer-sub-ttl">of Australian Genuine Student &amp;</span>
                                <span class="cer-sub-ttl">Genuine Temporary Entrant Criteria</span>
                            </td>
                            <td class="min-20">
                                <div class="cer-flg-wrpr clearfix">
                                    <img src="<%=institutionLogo %>" class="cer-flag">
                                    <%--<img src="assets/gteCertificate_images/flag.png" class="cer-flag">--%>
                                </div>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <div class="cer-note-wrpr">
                        <span>NOTE:</span> GTE Direct reserves the right to cancel this Certificate in the event of an error, or in the case of information that brings into question the integrity and validity of the Certification Test results. To view detailed terms of use please visit <a href="https://www.gtedirect.com/cou-terms-of-use" target="_blank">https://www.gtedirect.com/cou-terms-of-use</a>
                    </div>
                </td>
            </tr>
            <tr>
                <td class="third-row-table-td">
                    <table class="third-row-table" cellspacing="0" cellpadding="0">
                        <tr>
                            <td class="third-row-label">CANDIDATE No</td>
                            <td class="third-row-input"><%=candidateno %></td>
                            <td class="third-row-label">CERTIFICATION DATE</td>
                            <td class="third-row-input"><%=certificationdate %></td>
                            <td class="third-row-label">INSTITUTION No</td>
                            <td class="third-row-input"><%=institutionNo %></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td class="cer-sep">
                    <div></div>
                </td>
            </tr>
            <tr>
                <td>
                    <table cellspacing="0" cellpadding="0" class="usr-info-table">
                        <tr>
                            <td class="lft-ttl"><img src="assets/gteCertificate_images/txt1.png"></td>
                            <td>
                                <table cellpadding="0" cellspacing="0" class="frm-tab-cer">
                                    <tr>
                                       <td>
                                           <table cellpadding="0" cellspacing="0" class="frm-tab-cer-inner frm-tab-cer-inner-1">
                                               <tr>
                                                   <td class="third-row-label">FAMILY NAME</td>
                                                   <td class="third-row-input">
                                                       <%=familyname %>
                                                   </td>
                                               </tr>
                                           </table>
                                       </td>
                                    </tr>
                                    <tr>
                                       <td>
                                           <table cellpadding="0" cellspacing="0" class="frm-tab-cer-inner frm-tab-cer-inner-1">
                                               <tr>
                                                   <td class="third-row-label">FIRST NAME</td>
                                                   <td class="third-row-input">
                                                       <%=firstname %>
                                                   </td>
                                               </tr>
                                           </table>
                                       </td>
                                    </tr>
                                    <tr>
                                       <td>
                                           <table cellpadding="0" cellspacing="0" class="frm-tab-cer-inner frm-tab-cer-inner-1">
                                               <tr>
                                                   <td class="third-row-label">MIDDLE NAME/S</td>
                                                   <td class="third-row-input">
                                                       <%=middlename %>
                                                   </td>
                                               </tr>
                                           </table>
                                       </td>
                                    </tr>
                                    <tr>
                                       <td>
                                           <table cellpadding="0" cellspacing="0" class="frm-tab-cer-inner frm-tab-cer-inner-2">
                                               <tr>
                                                   <td class="third-row-label wid157">DATE OF BIRTH</td>
                                                   <td class="third-row-input">
                                                       <%=dateofbirth %>
                                                   </td>
                                                   <td class="third-row-label">GENDER</td>
                                                   <td class="third-row-input">
                                                       <%=gender %>
                                                   </td>
                                               </tr>
                                           </table>
                                       </td>
                                    </tr>
                                    <tr>
                                       <td>
                                           <table cellpadding="0" cellspacing="0" class="frm-tab-cer-inner frm-tab-cer-inner-1">
                                               <tr>
                                                   <td class="third-row-label">NATIONALITY</td>
                                                   <td class="third-row-input">
                                                       <%=nationality %>
                                                   </td>
                                               </tr>
                                           </table>
                                       </td>
                                    </tr>
                                    <tr>
                                       <td>
                                           <table cellpadding="0" cellspacing="0" class="frm-tab-cer-inner frm-tab-cer-inner-1">
                                               <tr>
                                                   <td class="third-row-label">COUNTRY OF RESIDENCE</td>
                                                   <td class="third-row-input">
                                                       <%=countryofresidence %>
                                                   </td>
                                               </tr>
                                           </table>
                                       </td>
                                    </tr>
                                    <tr>
                                       <td>
                                           <table cellpadding="0" cellspacing="0" class="frm-tab-cer-inner frm-tab-cer-inner-1">
                                               <tr>
                                                   <td class="third-row-label">PASSPORT NO.</td>
                                                   <td class="third-row-input">
                                                       <%=passportno %>
                                                   </td>
                                               </tr>
                                           </table>
                                       </td>
                                    </tr>
                                    <tr>
                                       <td>
                                           <table cellpadding="0" cellspacing="0" class="frm-tab-cer-inner frm-tab-cer-inner-1">
                                               <tr>
                                                   <td class="third-row-label">SPONSORING CLIENT</td>
                                                   <td class="third-row-input">
                                                       <%=sponsoringclient %>
                                                   </td>
                                               </tr>
                                           </table>
                                       </td>
                                    </tr>
                                   <%-- <tr> 
                                       <td>
                                           <table cellpadding="0" cellspacing="0" class="frm-tab-cer-inner frm-tab-cer-inner-1">
                                               <tr>
                                                   <td class="third-row-label">FACILITATING AGENT</td>
                                                   <td class="third-row-input">
                                                       <%=facilitingagent %>
                                                   </td>
                                               </tr>
                                           </table>
                                       </td>
                                    </tr>--%>
                                </table>
                            </td>
                            <td class="rgt-img"><img src="<%=profileimage %>" width="150px" height="200px"></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td class="cer-sep cer-sep-1">
                    <div></div>
                </td>
            </tr>
            <tr>
                <td>
                    <table cellpadding="0" cellspacing="0">
                        <tr>
                            <td class="lft-ttl">
                               <img src="assets/gteCertificate_images/txt2.png"> 
                            </td>
                            <td class="text-center">
                                <div class="cer-code-txt">
                                    GTE-COU-<%=GTECertificateNO %>
                                </div>
                                <div class="cer-code-subtxt">
                                    To validate this report please scan the QR code using any QR code scanner. You will be shown the original certificate online on the undermentioned url <a href="<%=QRURL %>" target="_blank"><%=QRURL %></a>
                                </div>
                                <div class="cer-code-subtxt">
                                    In case you see the certificate on any other url, it may not be the original, Please report the instance to <a href="mailto:support@gte.direct">support@gte.direct</a> immediately with a screenshot
                                </div>
                            </td>
                            <td class="barcoder-wrpr">
                                <div id="qrcode"></div>
                                <%--<img src="assets/gteCertificate_images/barcoder.png">--%>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td class="cer-sep cer-sep-1">
                    <div></div>
                </td>
            </tr>
            <tr>
                <td class="pb-30">
                    <table cellpadding="0" cellspacing="0" cl>
                        <tr>
                            <td class="lft-ttl">
                                <img src="assets/gteCertificate_images/txt3.png">
                            </td>
                            <td>
                                <table cellpadding="0" cellspacing="0" class="cer-btm-txt1">
                                    <tr>
                                        <td class="cer-btm-txt-1"><b><%=StudentName %></b> has successfully completed the fully-proctored and independently-verified GTE Certification Test and has demonstrated an <b><%=grade %></b> understanding of the Australian Student Visa Requirements and Conditions.</td>
                                        <%--<td class="cer-btm-txt-1"><b><%=StudentName %></b> has successfully completed the Genuine Student and Genuine Temporary Entrant Tutorial and has having completed a fully proctored test has demonstrated <b><%=grade %></b> understanding of the Australian Student Visa Conditions.</td>--%>
                                    </tr>
                                    <tr>
                                        <td class="lst-btm-txt-wrpr">
                                            <table cellspacing="0" cellpadding="0">
                                                <tr>
                                                    <td>
                                                        <div class="overall-score-wrpr cr-last-label">Overall Score</div>
                                                        <div class="overall-score-mrk"><%=overallscore %></div>
                                                    </td>
                                                    <td class="pl-l-15">
                                                        <table cellpadding="0" cellspacing="0">
                                                            <tr>
                                                                <td>
                                                                    <table cellpadding="0" cellspacing="0" class="overall-score-right">
                                                                        <tr>
                                                                            <td class="cr-last-label">What does this rating imply?</td>
                                                                            <td class="cr-last-label">Proctor No:</td>
                                                                            <td class="third-row-input"><%=proctorno %></td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td><div class="cr-genuine-txt"><%=ratingimplies %></div></td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="overall-score-wrpr cr-last-label">
                                            Level of Understanding of various criteria.
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <table cellspacing="0" cellpadding="0">
                                                <tr>
                                                    <td>
                                                        <div class="cr-list-wrpr">
                                                            <div class="cr-list-item clearfix">
                                                                <div class="cr-list-item-l"><%=tag1 %></div>
                                                                <div class="cr-list-item-r"><%=tag1_score %></div>
                                                            </div>
                                                            <div class="cr-list-item clearfix">
                                                                <div class="cr-list-item-l"><%=tag2 %></div>
                                                                <div class="cr-list-item-r"><%=tag2_score %></div>
                                                            </div>
                                                            <div class="cr-list-item clearfix">
                                                                <div class="cr-list-item-l"><%=tag3 %></div>
                                                                <div class="cr-list-item-r"><%=tag3_score %></div>
                                                            </div>
                                                            <div class="cr-list-item clearfix">
                                                                <div class="cr-list-item-l"><%=tag4 %></div>
                                                                <div class="cr-list-item-r"><%=tag4_score %></div>
                                                            </div>
                                                            <div class="cr-list-item clearfix">
                                                                <div class="cr-list-item-l"><%=tag5 %></div>
                                                                <div class="cr-list-item-r"><%=tag5_score %></div>
                                                            </div>
                                                            <div class="cr-list-item clearfix">
                                                                <div class="cr-list-item-l"><%=tag6 %></div>
                                                                <div class="cr-list-item-r"><%=tag6_score %></div>
                                                            </div>
                                                            <div class="cr-list-item clearfix">
                                                                <div class="cr-list-item-l"><%=tag7 %></div>
                                                                <div class="cr-list-item-r"><%=tag7_score %></div>
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <img src="assets/gteCertificate_images/id-passed.png" class="id-check-p-f">
                                                    </td>
                                                    <td>
                                                        <img src="assets/gteCertificate_images/assessment-passed.png" class="assessment-check-p-f">
                                                    </td>
                                                    <td>
                                                        <div class="cr-sgn-wrpr">
                                                            <img src="assets/gteCertificate_images/sgn.png">
                                                        </div>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>

    <!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>

    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <!--
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
    -->
              </form>
      <script>
             $(document).ready(function () {
           
            new QRCode(document.getElementById("qrcode"), "<%=webURL%>gte_certificateN.aspx?CID=<%=CID%>");
                 
        });
      </script>
  </body>
</html>