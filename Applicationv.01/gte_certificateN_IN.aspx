<%@ Page Language="C#" AutoEventWireup="true" CodeFile="gte_certificateN_IN.aspx.cs" Inherits="gte_certificateN_IN" MasterPageFile="~/student.master"%>

<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <!-- Bootstrap -->
    <link href="https://fonts.googleapis.com/css?family=Parisienne&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Lato:400,700|Parisienne&display=swap" rel="stylesheet">
    <link href="assets/dashboard/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .certificate-container {width: 960px;height: 686px;margin: 50px auto;background-image: url('../assets/images/certificate-bg.jpg');padding: 50px 80px;}
        .certi-heading {text-align: center;position: relative;margin-top: 40px;font-size: 40px;font-family: 'Lato', sans-serif;font-weight: 700;color: #262626;}
        .certi-heading:before, .certi-heading:after {content: '';position: absolute;background-color: transparent;border-top: 3px solid #f2f2f2;border-bottom: 3px solid #f2f2f2;width: 251px;height: 97px;left: 87px;top: 3px;}
        .certi-heading span {font-family: 'Parisienne', cursive;font-size: 81px;display: inline-block;vertical-align: middle;margin: 0 15px;color: #653a95;}
        .certi-heading:after {left: auto;right: 86px;width: 288px;}
        .partici-name {font-size: 40px;font-family: 'lato';font-weight: 700;margin: 30px 0;position: relative;color: #262626;}
        .partici-name:before {content: '';left: 0;right: 0;position: absolute;height: 3px;background-color: #f2f2f2;bottom: -9px;}
        .gte-dcrb {font-size: 16px;text-align: center;font-family: lato;}
        .gte-dcrb span {font-weight: 700;}
        .usr-inf-txt {font-size: 20px;text-align: center;font-weight: 700;font-family: lato;margin-top: 16px;}
        .usr-inf-txt1 {font-size: 16px;font-weight: 700;text-align: center;font-family: lato;}
        .certi-info-wrpr {width: 580px;float: left;}
        .certi-info-txt {margin-top: 20px;width: 485px;color: #262626;position: relative;}
        .certi-info-txt-t1 {float: left;width: 200px;font-family: lato;font-weight: 700;font-size: 16px;}
        .certi-info-txt-t2 {float: right;width: 284px;text-align: center;font-size: 16px;}
        .certi-info-txt:before {content: '';position: absolute;left: 0;right: 0;bottom: -11px;height: 3px;background-color: #f2f2f2;width: 100%;}
        .certi-info-txt-mt-50 {margin-top: 50px;}
        .certi-logo-img {float: right;}
        .certi-logo-img img {max-width: 180px;max-height: 180px;display: block;}
    </style>
    <script src="assets/js/qrcode.min.js"></script>
    <script src="assets/js/qrcode.js"></script>

    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="assets/gteCertificate_images/style.css">
    
    <div class="col-lg container-fluid page__container">
        <ol class="breadcrumb" style="    margin-top: -22px;    margin-bottom: 14px;">
            <li class="breadcrumb-item"><a href="default.aspx">Home</a></li>
            <li class="breadcrumb-item active">Certification</li>
        </ol>
         <div runat="server" id="lblDiv" style="display:none;">
                  <asp:Label runat="server">Please Scan again...</asp:Label>
              </div>
    <div runat="server" id="btnDiv" class="form-row justify-content-between certificatbtn" style="display: none;    margin-left: 164px;">            
            <asp:Button ID="btnDownload" runat="server" CssClass="btn btn-success" Text="Download Certificate" OnClick="btnDownload_Click" />
        <input id="backNavLink" runat="server" type="button" class="btn btn-success" value="Next" onclick="return window.location = '/gte_questions1.aspx?formid=22';"/>
        </div>
     <div id="DivCertificate" class="certificate-wrpr" runat="server" style="display:none;">
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
                                                                            <td class="cr-last-label">What does this rating imply? </td>
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

        <%--old--%>
  <div class="certificate-container" id="Div_OLD_Certificate" runat="server" style="display:none;">
            <div class="certi-heading">CERTIFICATE <span>of</span> PARTICIPATION</div>
            <div class="partici-name text-center"><%=_studentName %></div>
            <div class="gte-dcrb">Has successfully completed the Genuine Student and Genuine Temporary Entrant Orientation program and has demonstrated <span><%=_performanceCategory %></span> understanding of the Australian Student Visa Conditions.</div>
            <div class="usr-inf-txt">GTE DIRECT CERTIFICATE # <%=_certificateNumber %></div>
            <%--<div class="usr-inf-txt1">PASSPORT NUMBER GH80098Y; DATE OF BIRTH 05/NOVEMBER/1976</div>--%>
            <div class="clearfix">
                <div class="certi-info-wrpr">
                    <div class="certi-info-txt certi-info-txt-mt-50 clearfix"><span class="certi-info-txt-t1">PRESENTED BY:</span><span class="certi-info-txt-t2">Richard Geddes – Principal Instructor</span></div>
                    <div class="certi-info-txt clearfix"><span class="certi-info-txt-t1">ON THIS DAY:</span><span class="certi-info-txt-t2"><%=_certificateCreationDate %></span></div>
                </div>
                <div class="certi-logo-img">
                    <img src="../assets/images/gte_direct_logo.png">
                </div>
            </div>
        </div>
    </div>
    
    <script>
       
          $(document).ready(function () {
            $('.sidebar-menu-item').removeClass('open');
            $('#Dashboard').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
              $('#Dashboard').addClass('active');

              $('.sidebar-menu-item').removeClass('open');
            $('#Gte_new_list').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#Li5').addClass('active');
        });

    </script>
</asp:Content>
