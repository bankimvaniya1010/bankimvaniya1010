<%@ Page Language="C#" AutoEventWireup="true" CodeFile="gte_report_feedback.aspx.cs" Inherits="admin_gte_report_feedback" %>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

       <script src="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/js/qrcode.min.js"></script>
    <script src="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/js/qrcode.js"></script>


    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/GTEReport/style.css">
    <title>Student - Dashboard</title>
  </head>
  <body>
      <form runat="server" >
          <div style="margin-left: 45%;">
          <asp:Button id="backNavLink" runat="server" class="btn btn-success" Text="Back to Manage " onclick="backNavLink_Click"/></div>
    <%--1--%>
    <div class="certificate-wrpr">
        <div class="water-mark"><%=gtereportNo %></div>
        <table class="certificate-table" cellspacing="0" cellpadding="0">
            <tr>
                <td>
                    <table cellspacing="0" cellpadding="0" class="first-row-table">
                        <tr class="first-row">
                            <td class="min-20">
                                <img src="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/GTEReport/logo.png" class="cer-logo">
                            </td>
                            <td class="min-60">
                                <span class="cer-ttl">Assessment Report</span>
                                <span class="cer-sub-ttl">of for Australian Genuine Student amp;</span>
                                <span class="cer-sub-ttl">Genuine Temporary Entrant Criteria</span>
                            </td>
                            <td class="min-20">
                                <div class="cer-flg-wrpr clearfix">
                                    <img src="<%=logourl %>" class="cer-flag">
                                </div>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <div class="cer-note-wrpr">
                        <span>NOTE:</span> This Assessment Report is privileged and confidential and generated for the exclusive use of <%=instutionname %>. Assessments are made subject to an assumption that: 1) Thecandidate’s responses were: a) truthful and honest b) accurate and correct; and 2. The candidate will be able to submit documentation to support all factual information provided in the assessment. View terms of use <a href="https://www.gtedirect.com/gte-ar-terms-of-use">https://www.gtedirect.com/gte-ar-terms-of-use</a> 
                      
                    </div>
                </td>
            </tr>
            <tr>
                <td class="third-row-table-td">
                    <table class="third-row-table" cellspacing="0" cellpadding="0">
                        <tr>
                            <td class="third-row-label">CANDIDATE NO</td>
                            <td class="third-row-input"><%=candidateno %></td>
                            <td class="third-row-label">REPORT NO</td>
                            <td class="third-row-input"><%=gtereportNo %></td>
                            <td class="third-row-label">INSTITUTION NO</td>
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
                            <td class="lft-ttl"><img src="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/GTEReport/txt1.png"></td>
                            <td class="wid-460">
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
                                                   <td class="third-row-label wid-157">DATE OF BIRTH</td>
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
                                                   <td class="third-row-label">INSTITUTION APPLIED</td>
                                                   <td class="third-row-input">
                                                       <%=sponsoringclient %>
                                                   </td>
                                               </tr>
                                           </table>
                                       </td>
                                    </tr>
                                    <tr> 
                                       <td>
                                           <table cellpadding="0" cellspacing="0" class="frm-tab-cer-inner frm-tab-cer-inner-1">
                                               <tr>
                                                   <td class="third-row-label">COURSE APPLIED</td>
                                                   <td class="third-row-input">
                                                       <%=courseapplied %>
                                                   </td>
                                               </tr>
                                           </table>
                                       </td>
                                    </tr>
                                    <tr> 
                                       <td>
                                           <table cellpadding="0" cellspacing="0" class="frm-tab-cer-inner frm-tab-cer-inner-1">
                                               <tr>
                                                   <td class="third-row-label">PACKAGE APPLIED</td>
                                                   <td class="third-row-input">
                                                       <%=packagapplied %>
                                                   </td>
                                               </tr>
                                           </table>
                                       </td>
                                    </tr>
                                    <%--<tr> 
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
                            <td class="rgt-img"><img src="<%=recommendationURL %>" /></td>
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
                                  <img src="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/GTEReport/txt4.png">
                            </td>
                            <td class="text-center">
                              <table cellpadding="0" cellspacing="0">
                                <tr>
                                  <td>
                                    <table cellpadding="0" cellspacing="0">
                                      <tr>
                                        <td class="recm-txt-img">
                                          <div class="section-ttle"><span>1</span>OVERALL <br>ASSESSMENT OUTCOME</div>                           
                                        </td>
                                        <td>
                                          <div class="clearfix">
                                            <div class="<%=blck_cls_risk_final %>">
                                              <div class="box-info-label">
                                                LEVEL OF RISK
                                              </div>
                                              <div class="box-info-ttl">
                                                <%=block_risk_final %>
                                              </div>
                                              <div class="box-info-mrk">
                                                <%=risk_final %>
                                              </div>
                                            </div>
                                            <div class="<%=blck_cls_satisfaction_final %>">
                                              <div class="box-info-label">
                                                SATISFACTION
                                              </div>
                                              <div class="box-info-ttl">
                                               <%=block_satisfaction_final %>
                                              </div>
                                              <div class="box-info-mrk">
                                               <%=satisfaction_final %>
                                              </div>
                                            </div>
                                           <div class="<%=blck_cls_servity_final %>">
                                              <div class="box-info-label">
                                                SEVERITY
                                              </div>
                                              <div class="box-info-ttl">
                                              <%=block_servity_final %>
                                              </div>
                                              <div class="box-info-mrk">
                                                <%=servity_final %>
                                              </div>
                                            </div>
                                            <div class="recm-caaut-wrpr" style="padding:0px !important;">
                                              <asp:DropDownList runat="server" ID="ddlrecommended" CssClass="form-group">
                                                  <asp:ListItem Value="0">Please Select</asp:ListItem>
                                                  <asp:ListItem Value="1">Recommended</asp:ListItem>
                                                  <asp:ListItem Value="2"> Recommended with caution</asp:ListItem>
                                                  <asp:ListItem Value="3">Not Recommended</asp:ListItem>
                                              </asp:DropDownList>
                                              
                                            </div>
                                          </div>
                                        </td>
                                      </tr>
                                    </table>
                                    
                                  </td>
                                </tr>
                                <tr>
                                  <td>
                                    <div class="gry-txt-wrpr">
                                    We find <span><%=block_satisfaction_final %> level of satisfaction</span> and <span><%=block_risk_final %> level of risk</span> in the case of <span><%=StudentName %></span> based on a detailed artificial intelligence driven proctor based assessment using published Genuine Student & Genuine Temporary Entrant Criteria. The <span>severity of the risk is classified as <%=block_servity_final %>.</span><span runat="server" id="tagtext"> Specific areas of concern are:</span> <span> <b><%=high_taglist %></b>. <%=grade %> level of understanding of student visa requirements and conditions is demonstrated.</span> We expect <%=StudentName %> to <span><%=retrentionrisk_decision %> a Retention Risk</span>.
                                  </div>
                                  </td>
                                </tr>
                                <tr>
                                  <td>
                                    <div class="clearfix rsk-div-wrpr">
                                      <img src="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/GTEReport/hgl-txt.png">
                                      <div class="dt-info-wrpr">
                                        <div class="dt-info-ttl">REPORT DATE</div>
                                        <div class="dt-info-dd-mm"><%=GTEFeedback_reportdate %></div>
                                      </div>
                                    </div>
                                  </td>
                                </tr>
                                <tr>
                                  <td>
                                    <table cellpadding="0" cellspacing="0">
                                      <tr>
                                        <td>
                                          <table cellpadding="0" cellspacing="0" class="criteria-tbl">
                                            <thead>
                                              <tr>
                                                <td class="criteria-tbl-lb">GTE CRITERIA</td>
                                                <td class="criteria-tbl-hdng"><div>LEVEL OF RISK</div></td>
                                                <td class="criteria-tbl-hdng"><div>SATISFACTION</div></td>
                                                <td class="criteria-tbl-hdng"><div>SEVERITY</div></td>
                                              </tr>
                                            </thead>
                                            <tbody>
                                              <tr>
                                                <td class="criteria-tbl-sb-hding">Previous Study and Gaps</td>
                                                <td>
                                                  <div class="<%= blck_cls_1 %>">
                                                    <div class="criteria-tbl-box-lb">
                                                     <%= block_1 %>
                                                    </div>
                                                    <div class="criteria-tbl-box-txt">
                                                    <%=risk_1 %>
                                                    </div>
                                                  </div>
                                                </td>
                                                <td>
                                                  <div class="<%= blck_cls_2 %>">
                                                    <div class="criteria-tbl-box-lb">
                                                    <%= block_2 %>
                                                    </div>
                                                    <div class="criteria-tbl-box-txt">
                                                     <%=satisfaction_1 %>
                                                    </div>
                                                  </div>
                                                </td>
                                                <td>
                                                  <div class="<%= blck_cls_3 %>">
                                                    <div class="criteria-tbl-box-lb">
                                                    <%= block_3 %>
                                                    </div>
                                                    <div class="criteria-tbl-box-txt">
                                                    <%=servity_tag_1 %>
                                                    </div>
                                                  </div>
                                                </td>
                                              </tr>
                                              <tr>
                                                <td class="criteria-tbl-sb-hding">Value of Course</td>
                                                <td>
                                                  <div class="<%= blck_cls_4 %>">
                                                    <div class="criteria-tbl-box-lb">
                                                    <%= block_4 %>
                                                    </div>
                                                    <div class="criteria-tbl-box-txt">
                                                    <%=risk_2 %>
                                                    </div>
                                                  </div>
                                                </td>
                                                <td>
                                                  <div class="<%= blck_cls_5 %>">
                                                    <div class="criteria-tbl-box-lb">
                                                    <%= block_5 %>
                                                    </div>
                                                    <div class="criteria-tbl-box-txt">
                                                     <%=satisfaction_2 %>
                                                    </div>
                                                  </div>
                                                </td>
                                                <td>
                                                  <div class="<%= blck_cls_6 %>">
                                                    <div class="criteria-tbl-box-lb">
                                                    <%= block_6 %>
                                                    </div>
                                                    <div class="criteria-tbl-box-txt">
                                                    <%=servity_tag_2 %>
                                                    </div>
                                                  </div>
                                                </td>
                                              </tr>
                                              <tr>
                                                <td class="criteria-tbl-sb-hding">Situations in Home Country</td>
                                                <td>
                                                  <div class="<%= blck_cls_7 %>">
                                                    <div class="criteria-tbl-box-lb">
                                                    <%= block_7 %>
                                                    </div>
                                                    <div class="criteria-tbl-box-txt">
                                                   <%=risk_3 %>
                                                    </div>
                                                  </div>
                                                </td>
                                                <td>
                                                  <div class="<%= blck_cls_8 %>">
                                                    <div class="criteria-tbl-box-lb">
                                                    <%= block_8 %>
                                                    </div>
                                                    <div class="criteria-tbl-box-txt">
                                                     <%=satisfaction_3 %>
                                                    </div>
                                                  </div>
                                                </td>
                                                <td>
                                                  <div class="<%= blck_cls_9 %>">
                                                    <div class="criteria-tbl-box-lb">
                                                    <%= block_9 %>
                                                    </div>
                                                    <div class="criteria-tbl-box-txt">
                                                    <%=servity_tag_3 %>
                                                    </div>
                                                  </div>
                                                </td>
                                              </tr>
                                              <tr>
                                                <td class="criteria-tbl-sb-hding">Potential Situation in Australia</td>
                                                <td>
                                                  <div class="<%= blck_cls_10 %>">
                                                    <div class="criteria-tbl-box-lb">
                                                    <%= block_10 %>
                                                    </div>
                                                    <div class="criteria-tbl-box-txt">
                                                    <%=risk_4 %>
                                                    </div>
                                                  </div>
                                                </td>
                                                <td>
                                                  <div class="<%= blck_cls_11 %>">
                                                    <div class="criteria-tbl-box-lb">
                                                    <%= block_11 %>
                                                    </div>
                                                    <div class="criteria-tbl-box-txt">
                                                     <%=satisfaction_4 %>
                                                    </div>
                                                  </div>
                                                </td>
                                                <td>
                                                  <div class="<%= blck_cls_12 %>">
                                                    <div class="criteria-tbl-box-lb">
                                                    <%= block_12 %>
                                                    </div>
                                                    <div class="criteria-tbl-box-txt">
                                                     <%=servity_tag_4 %>
                                                    </div>
                                                  </div>
                                                </td>
                                              </tr>
                                              <tr>
                                                <td class="criteria-tbl-sb-hding">Immigration History</td>
                                                <td>
                                                  <div class="<%= blck_cls_13 %>">
                                                    <div class="criteria-tbl-box-lb">
                                                    <%= block_13 %>
                                                    </div>
                                                    <div class="criteria-tbl-box-txt">
                                                    <%=risk_5 %>
                                                    </div>
                                                  </div>
                                                </td>
                                                <td>
                                                  <div class="<%= blck_cls_14 %>">
                                                    <div class="criteria-tbl-box-lb">
                                                    <%= block_14 %>
                                                    </div>
                                                    <div class="criteria-tbl-box-txt">
                                                     <%=satisfaction_5 %>
                                                    </div>
                                                  </div>
                                                </td>
                                                <td>
                                                  <div class="<%= blck_cls_15 %>">
                                                    <div class="criteria-tbl-box-lb">
                                                    <%= block_15 %>
                                                    </div>
                                                    <div class="criteria-tbl-box-txt">
                                                    <%=servity_tag_5 %>
                                                    </div>
                                                  </div>
                                                </td>
                                              </tr>
                                              <tr>
                                                <td class="criteria-tbl-sb-hding">Conversion & Retention Risk</td>
                                                <td>
                                                  <div class="<%= blck_cls_16 %>">
                                                    <div class="criteria-tbl-box-lb">
                                                    <%= block_16 %>
                                                    </div>
                                                    <div class="criteria-tbl-box-txt">
                                                   <%=risk_6 %>
                                                    </div>
                                                  </div>
                                                </td>
                                                <td>
                                                  <div class="<%= blck_cls_17 %>">
                                                    <div class="criteria-tbl-box-lb">
                                                    <%= block_17 %>
                                                    </div>
                                                    <div class="criteria-tbl-box-txt">
                                                     <%=satisfaction_6 %>
                                                    </div>
                                                  </div>
                                                </td>
                                                <td>
                                                  <div class="<%= blck_cls_18 %>">
                                                    <div class="criteria-tbl-box-lb">
                                                    <%= block_18 %>
                                                    </div>
                                                    <div class="criteria-tbl-box-txt">
                                                    <%=servity_tag_6 %>
                                                    </div>
                                                  </div>
                                                </td>
                                              </tr>
                                              <tr>
                                                <td class="criteria-tbl-sb-hding">Character & Criminal Record</td>
                                                <td>
                                                  <div class="<%= blck_cls_19 %>">
                                                    <div class="criteria-tbl-box-lb">
                                                    <%= block_19 %>
                                                    </div>
                                                    <div class="criteria-tbl-box-txt">
                                                     <%=risk_7 %>
                                                    </div>
                                                  </div>
                                                </td>
                                                <td>
                                                  <div class="<%= blck_cls_20 %>">
                                                    <div class="criteria-tbl-box-lb">
                                                    <%= block_20 %>
                                                    </div>
                                                    <div class="criteria-tbl-box-txt">
                                                     <%=satisfaction_7 %>
                                                    </div>
                                                  </div>
                                                </td>
                                                <td>
                                                  <div class="<%= blck_cls_21 %>">
                                                    <div class="criteria-tbl-box-lb">
                                                    <%= block_21 %>
                                                    </div>
                                                    <div class="criteria-tbl-box-txt">
                                                    <%=servity_tag_7 %>
                                                    </div>
                                                  </div>
                                                </td>
                                              </tr>
                                              <tr>
                                                <td class="criteria-tbl-sb-hding">Understanding of Visa Requirements</td>
                                                <td>
                                                   <div class="<%= blck_cls_22 %>">
                                                    <div class="criteria-tbl-box-lb">
                                                    <%= block_22 %>
                                                    </div>
                                                    <div class="criteria-tbl-box-txt">
                                                     <%=risk_8 %>
                                                    </div>
                                                  </div>
                                                </td>
                                                <td>
                                                  <div class="<%= blck_cls_23 %>">
                                                    <div class="criteria-tbl-box-lb">
                                                    <%= block_23 %>
                                                    </div>
                                                    <div class="criteria-tbl-box-txt">
                                                     <%=satisfaction_8 %>
                                                    </div>
                                                  </div>
                                                </td>
                                                <td>
                                                  <div class="<%= blck_cls_24 %>">
                                                    <div class="criteria-tbl-box-lb">
                                                    <%= block_24 %>
                                                    </div>
                                                    <div class="criteria-tbl-box-txt">
                                                     <%=servity_tag_8 %>
                                                    </div>
                                                  </div>
                                                </td>
                                              </tr>
                                            </tbody>
                                          </table>
                                        </td>
                                          <td class="graph-td" style="display:none;">
                                             <asp:Chart ID="Chart1" runat="server" BackGradientStyle="LeftRight"
                                                  BorderlineWidth="0" Height="360px" Palette="None" PaletteCustomColors="128, 64, 0"
                                                  Width="380px" BorderlineColor="Black" BorderlineDashStyle="Dot" >
                                                  <Series>
                                                      <asp:Series ChartArea="ChartArea1" ChartType="FastPoint" Name="Series2" YValuesPerPoint="2">
                                                      </asp:Series>
                                                      <asp:Series ChartArea="ChartArea1" ChartType="Bubble" Name="Series3" YValuesPerPoint="2">
                                                      </asp:Series>
                                                  </Series>
                                                 <ChartAreas>
                                                      
                                                      <asp:ChartArea Name="ChartArea1">
                                                         
                                                          <AxisY Title="<----LOW-----SATISFACTION LEVEL -----HIGH---->" Interval="10" IntervalType="Number" Maximum="100" Minimum="0" >
                                                          </AxisY>
                                                          <AxisX Interval="20" IntervalType="Number" Maximum="100" Minimum="0" Title="&lt;--LOW--RISK LEVEL--&gt;HIGH">
                                                          </AxisX>
                                                         
                                                      </asp:ChartArea>

                                                  </ChartAreas>
                                                  
                                              </asp:Chart>
                                              <%--<img src="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>\assets\GTEReport\graph.jpg">--%>
                                        </td>
                                          <td style="display:none;">
                                              <table>
                                                  <tr>
                                                      <td>
                                                          <div class="criteria-tbl-box" style="width: 2px;height: 6px; color:lightblue">
                                                          </div>
                                                      </td>
                                                      <td class="criteria-tbl-sb-hding">Previous Study and Gaps</td>
                                                  </tr>
                                                  <tr>
                                                      <td>
                                                          <div class="criteria-tbl-box" style="width: 2px;height: 6px; color:orange">
                                                          </div>
                                                      </td>
                                                      <td class="criteria-tbl-sb-hding">Value of Course</td>
                                                   </tr>
                                                   <tr>
                                                          <td>
                                                              <div class="criteria-tbl-box" style="width: 2px;height: 6px; color:dimgray">
                                                              </div>
                                                          </td>
                                                          <td class="criteria-tbl-sb-hding">Situations in Home Country</td>
                                                   </tr>
                                                  <tr>
                                                      <td>
                                                          <div class="criteria-tbl-box" style="width: 2px;height: 6px; color:yellow">
                                                          </div>
                                                      </td>
                                                      <td class="criteria-tbl-sb-hding">Potential Situation in Australia</td>
                                                  </tr>
                                                  <tr>
                                                      <td>
                                                          <div class="criteria-tbl-box" style="width: 2px;height: 6px; color:cornflowerblue">
                                                          </div>
                                                      </td>
                                                      <td class="criteria-tbl-sb-hding">Immigration History</td>
                                                  </tr>
                                                  <tr>
                                                      <td>
                                                          <div class="criteria-tbl-box" style="width: 2px;height: 6px; color:lightgreen">
                                                          </div>
                                                      </td>
                                                      <td class="criteria-tbl-sb-hding">Conversion & Retention Risk</td>
                                                  </tr>
                                                  <tr>
                                                      <td>
                                                          <div class="criteria-tbl-box" style="width: 2px;height: 6px; color:blueviolet">
                                                          </div>
                                                      </td>
                                                      <td class="criteria-tbl-sb-hding">Character &amp; Criminal Record</td>
                                                  </tr>
                                                  <tr>
                                                      <td>
                                                          <div class="criteria-tbl-box" style="width: 2px;height: 6px; color:chocolate">
                                                          </div>
                                                      </td>
                                                      <td class="criteria-tbl-sb-hding">Understanding of Visa Requirements</td>
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
                </td>
            </tr>
             <tr>
                <td class="cer-sep cer-sep-1">
                    <div></div>
                </td>
            </tr>
            <tr>
                <td class="fst-pg-btm">
                    <table cellpadding="0" cellspacing="0">
                        <tr>
                            <td class="text-center">
                                <div class="cer-code-txt">
                                   <%=gtereportNo %>
                                </div>
                                <div class="cer-code-subtxt">
                                    To validate this report please scan the QR code using any QR code scanner. You will be shown the original certificate online on the undermentioned url <a href="<%=webURL%>gte_ReportN.aspx?CID=<%=CID%>"><%=webURL%>gte_ReportN.aspx?CID=<%=CID%></a> In case you see the certificate on any other url, it may not be the original, Please report the instance to <a href="mailto:support@gte.direct">support@gte.direct</a> immediately with a screenshot
                                </div>
                            </td>
                            <td class="barcoder-wrpr">
                                  <div id="qrcode"></div>
                                <%--<img src="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>\assets\GTEReport\barcoder.png">--%>
                            </td>
                            <td>
                                <img src="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/GTEReport/id-passed.png" class="id-check-p-f">
                            </td>
                            <td>
                              <div class="cr-sgn-wrpr">
                                  <img src="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/GTEReport/sgn_Resize.png">                                  
                              </div>
                                <br/>
                                  <b>Richard Geddes</b>
                                  <br/>
                                  <b>Chief Proctor</b>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>
      <%--2--%>
    <div class="certificate-wrpr" runat="server" id="page2_fd">
        <div class="water-mark"><%=gtereportNo %></div>
        <table class="certificate-table" cellspacing="0" cellpadding="0">
            <tr>
                <td>
                    <table cellspacing="0" cellpadding="0" class="first-row-table">
                        <tr class="first-row">
                            <td class="min-20">
                                <img src="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/GTEReport/logo.png" class="cer-logo">
                            </td>
                            <td class="min-60">
                                <span class="cer-ttl">Assessment Report</span>
                                <span class="cer-sub-ttl">of for Australian Genuine Student amp;</span>
                                <span class="cer-sub-ttl">Genuine Temporary Entrant Criteria</span>
                            </td>
                            <td class="min-20">
                                <div class="cer-flg-wrpr clearfix">
                                    <img src="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/GTEReport/flag.png" class="cer-flag">
                                </div>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <div class="cer-note-wrpr">
                         <span>NOTE:</span> This Assessment Report is privileged and confidential and generated for the exclusive use of <%=instutionname %>. Assessments are made subject to an assumption that: 1) Thecandidate’s responses were: a) truthful and honest b) accurate and correct; and 2. The candidate will be able to submit documentation to support all factual information provided in the assessment. View terms of use <a href="https://www.gtedirect.com/gte-ar-terms-of-use">https://www.gtedirect.com/gte-ar-terms-of-use</a> 
                    </div>
                </td>
            </tr>
            <tr>
                <td class="third-row-table-td">
                    <table class="third-row-table" cellspacing="0" cellpadding="0">
                         <tr>
                            <td class="third-row-label">CANDIDATE NO</td>
                            <td class="third-row-input"><%=candidateno %></td>
                            <td class="third-row-label">REPORT NO</td>
                            <td class="third-row-input"><%=gtereportNo %></td>
                            <td class="third-row-label">INSTITUTION NO</td>
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
                <table cellpadding="0" cellspacing="0">
                  <tr>
                    <td class="lft-ttl">
                       <img src="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/GTEReport/txt5.png"> 
                    </td>
                    <td>
                      <table cellpadding="0" cellspacing="0">
                        <tr>
                          <td>
                            <table cellpadding="0" cellspacing="0">
                              <tr>
                                <td>
                                  <img src="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/GTEReport/dcl-txt.png">
                                  <div class="std-bx-wrpr">
                                    <span><%=StudentName %></span> has made a declaration and accepted the terms of use at: <span><%=reportsubmitteddate %> using IP address: <%=ipaddress %></span> 
                                  </div>
                                </td>
                                <td class="pr-15">
                                  <img src="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/GTEReport/accepted.png">
                                </td>
                              </tr>
                            </table>
                          </td>
                        </tr>
                        <tr>
                          <td class="ptb-15">
                            <img src="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/GTEReport/id-txt.png">
                          </td>
                        </tr>
                        <tr>
                          <td>
                            <table cellpadding="0" cellspacing="0" class="tb-chb-wrpr">
                              <tr>
                                <td>
                                  <div class="chb-wrpr">
                                   <input type="checkbox" runat="server" id="chk4_1">
                                    <div>Proctor based realtime verification of <%=StudentName %> done with Photo ID</div>
                                  </div>
                                </td>
                                <td>
                                  <div class="chb-wrpr">
                                    <input type="checkbox" runat="server" id="chk4_2">
                                    <div>AI based facial recognition of the <%=StudentName %> at time of assessment.</div>
                                  </div>
                                </td>
                                <td>
                                  <div class="chb-wrpr">
                                    <input type="checkbox" runat="server" id="chk4_3">
                                    <div>Human Proctor based verification of <%=StudentName %> during the assessment.</div>
                                  </div>
                                </td>
                                <td class="pr-15">
                                  <img src="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/GTEReport/id-passed.png">
                                </td>
                              </tr>
                            </table>
                          </td>
                        </tr>
                        <tr>
                          <td class="ptb-15">
                            <table cellpadding="0" cellspacing="0" class="tb-chb-wrpr">
                              <tr>
                                <td>
                                  <img src="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/GTEReport/suit.png">
                                </td>
                                <td>
                                  <div class="fm-txt-box">
                                      <textarea runat="server" id="txtproctorremarks_verified" style="width: 588px; height: 77px;"></textarea>                                    
                                  </div>
                                </td>
                              </tr>
                            </table>
                          </td>
                        </tr>
                        <tr>
                          <td>
                            <div class="section-ttle"><span>5</span>AI-Based TEST INTEGRITY REPORT</div> 
                          </td>
                        </tr>
                        <tr>
                          <td>
                            <table cellpadding="0" cellspacing="0" class="tb-chb-wrpr">
                              <tr>
                                <td>
                                  <table cellpadding="0" cellspacing="0" class="tw-rw-ch-tbl">
                                    <tr>
                                      <td>
                                        <div class="chb-wrpr">
                                          <input type="checkbox" runat="server" id="chk5_1">
                                          <div>Face / Voice Match during the session </div>
                                        </div>
                                      </td>
                                      <td>
                                        <div class="chb-wrpr">
                                          <input type="checkbox" runat="server" id="chk5_2">
                                          <div>Background noise and environment integrity </div>
                                        </div>
                                      </td>
                                      <td>
                                        <div class="chb-wrpr">
                                          <input type="checkbox" runat="server" id="chk5_3">
                                          <div>Browser Integrity during the session </div>
                                        </div>
                                      </td>
                                    </tr>
                                    <tr>
                                      <td>
                                        <div class="chb-wrpr">
                                          <input type="checkbox" runat="server" id="chk5_4">
                                          <div>No multiple faces detected  </div>
                                        </div>
                                      </td>
                                      <td>
                                        <div class="chb-wrpr">
                                          <input type="checkbox" runat="server" id="chk5_5">
                                          <div>Candidate present during entire session </div>
                                        </div>
                                      </td>
                                      <td>
                                        <div class="chb-wrpr">
                                          <input type="checkbox" runat="server" id="chk5_6">
                                          <div>No copy / paste session attempts </div>
                                        </div>
                                      </td>
                                    </tr>
                                  </table>
                                </td>
                                <td class="pr-15">
                                  <img src="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/GTEReport/id-passed.png">
                                </td>
                              </tr>
                          </table>
                          </td>
                        </tr>
                        <tr>
                          <td>
                            <table cellpadding="0" cellspacing="0">
                              <tr>
                                <td>
                                  <table cellpadding="0" cellspacing="0">
                                    <tr>
                                      <td>
                                        <div class="qr-ingo-txt">
                                          The full assessment session’s video record, with event flags and logs related to session integrity is available. To view simply scan the QR code and enter your admin password. 
                                        </div>
                                      </td>
                                    </tr>
                                    <tr>
                                      <td class="ptb-15">
                                        <table cellpadding="0" cellspacing="0" class="tb-chb-wrpr">
                                          <tr>
                                            <td>
                                              <img src="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/GTEReport/suit.png">
                                            </td>
                                            <td>
                                                <div class="fm-txt-box fm-txt-box-1">
                                                    <textarea runat="server" id="txtproctorremarks_disqualify" style="width: 440px; height: 77px;"></textarea>
                                                </div>                                             
                                            </td>
                                          </tr>
                                        </table>
                                      </td>
                                    </tr>
                                  </table>
                                </td>
                                <td class="barcoder-wrpr" id="QR_verificationDiv" runat="server">
                                      <div id="qrcode1"></div>
                                  <%--<img src="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>\assets\GTEReport\barcoder-y.png">--%>
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
                       <img src="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/GTEReport/txt6.png"> 
                    </td>
                    <td>
                      <table cellpadding="0" cellspacing="0">
                        <tr>
                          <td>
                            <table cellpadding="0" cellspacing="0">
                              <tr>
                                <td>
                                  <div class="sec-6-img">
                                    <img src="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/GTEReport/crm-rec.png">  
                                  </div>
                                  
                                </td>
                                <td>
                                  <div class="clearfix">
                                    <div class="us-lvl-box">
                                      <div class="us-lvl-label">
                                        LEVEL OF RISK
                                      </div>
                                       <div class="<%=criminal_class1 %>">
                                        <div class="us-lvl-box-inner-l">
                                          <%=block_19 %>
                                        </div>
                                        <div class="us-lvl-box-inner-txt">
                                          <%=risk_7 %>
                                        </div>
                                       </div>
                                    </div>
                                    <div class="us-lvl-box">
                                      <div class="us-lvl-label">
                                        SATISFACTION
                                      </div>
                                       <div class="<%=criminal_class2 %>">
                                        <div class="us-lvl-box-inner-l">
                                          <%=block_20 %>
                                        </div>
                                        <div class="us-lvl-box-inner-txt">
                                          <%=satisfaction_7 %>
                                        </div>
                                       </div>
                                    </div>
                                    <div class="us-lvl-box">
                                      <div class="us-lvl-label">
                                        SEVERITY
                                      </div>
                                       <div class="<%=criminal_class3 %>">
                                        <div class="us-lvl-box-inner-l">
                                          <%=block_21 %>
                                        </div>
                                        <div class="us-lvl-box-inner-txt">
                                          <%=servity_tag_7 %>
                                        </div>
                                       </div>
                                    </div>
                                  </div>
                                </td>
                              </tr>
                            </table>
                          </td>
                        </tr>
                        <tr>
                          <td class="ptb-15">
                            <div class="clearfix">
                              <div class="<%=pg2_s3_31 %>">
                                <img src="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/GTEReport/zoom.png">
                                <div class="<%=div31 %>">Charged with a criminal offence, that is awaiting action.</div>
                              </div>
                              <div class="<%=pg2_s3_32 %>">
                                <img src="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/GTEReport/cross.png">
                                <div class="<%=div32 %>">Convicted of a criminal offence, previously.</div>
                              </div>
                              <div class="<%=pg2_s3_33 %>">
                                <img src="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/GTEReport/doc.png">
                                <div class="<%=div33 %>">Subject of an arrest warrant or Interpol notice.</div>
                              </div>
                              <div class="<%=pg2_s3_34 %>">
                                <img src="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/GTEReport/user-m.png">
                                <div class="<%=div34 %>">Guilty of a sexually offence involving a child</div>
                              </div>
                            </div>
                            <div class="clearfix">
                              <div class="<%=pg2_s3_35 %>">
                                <img src="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/GTEReport/peng.png">
                                <div class="<%=div35 %>">Acquitted of an offence due to unsound mind.</div>
                              </div>
                              <div class="<%=pg2_s3_36 %>">
                                <img src="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/GTEReport/bomb.png">
                                <div class="<%=div36 %>">Associated with, activities that concern national security  </div>
                              </div>
                              <div class="<%=pg2_s3_37 %>">
                                <img src="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/GTEReport/fire.png">
                                <div class="<%=div37 %>">Charged with, genocide, crimes against humanity</div>
                              </div>
                              <div class="<%=pg2_s3_3839 %>">
                                <img src="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/GTEReport/mulit-user.png">
                                <div class="<%=div3839 %>">Associated with person or groups involved with crime.</div>
                              </div>
                            </div>
                            <div class="clearfix">
                              <div class="<%=pg2_s3_40 %>">
                                <img src="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/GTEReport/suit-b.png">
                                <div class="<%=div40 %>">Served in a military force, police force, intelligence agency. </div>
                              </div>
                              <div class="<%=pg2_s3_41 %>">
                                <img src="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/GTEReport/user-add.png">
                                <div class="<%=div41 %>">Undergone military/paramilitary training</div>
                              </div>
                              <div class="<%=pg2_s3_42 %>">
                                <img src="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/GTEReport/smuggling.png">
                                <div class="<%=div42 %>">Involved in people smuggling or people trafficking.</div>
                              </div>
                              <div class="<%=pg2_s3_44 %>">
                                <img src="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/GTEReport/dollar-pot.png">
                                <div class="<%=div44 %>">Outstanding debt to the Australian Government.</div>
                              </div>
                            </div>
                          </td>
                        </tr>
                        <tr>
                          <td>
                            <div class="tb-mn-ttl">APPLICANT DECLARATION</div>
                          </td>
                        </tr>
                        <tr>
                          <td class="pb-15">
                            <table cellpadding="0" cellspacing="0">
                              <tr>
                                <td class="va-bottom">
                                  <img src="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/GTEReport/user-msg.png">
                                </td>
                                <td>
                                  <div class="us-msg-wrpr">                                     
                                     I declare that I do not have any criminal record, have not been involved in any direct or indirect activities which may prove to be a risk to the 
national security or social harmony of <%=CountryIamapplyingtoStudy %>,I have not in the past been associated with intelligence operations of any 
country and have not had any outstanding debts to the Government or any public authority in <%=CountryIamapplyingtoStudy %>. 

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
          <%--3--%>
      <%--3--%>
    <div class="certificate-wrpr">
        <div class="water-mark"><%=gtereportNo %></div>
        <table class="certificate-table" cellspacing="0" cellpadding="0">
            <tr>
                <td>
                    <table cellspacing="0" cellpadding="0" class="first-row-table">
                        <tr class="first-row">
                            <td class="min-20">
                                <img src="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/GTEReport/logo.png" class="cer-logo">
                            </td>
                            <td class="min-60">
                                <span class="cer-ttl">Assessment Report</span>
                                <span class="cer-sub-ttl">for Australian Genuine Student &</span>
                                <span class="cer-sub-ttl">Genuine Temporary Entrant Criteria</span>
                            </td>
                            <td class="min-20">
                                <div class="cer-flg-wrpr clearfix">
                                    <img src="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/GTEReport/flag.png" class="cer-flag">
                                </div>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <div class="cer-note-wrpr">
                         <span>NOTE:</span> This Assessment Report is privileged and confidential and generated for the exclusive use of <%=instutionname %>. Assessments are made subject to an assumption that: 1) Thecandidate’s responses were: a) truthful and honest b) accurate and correct; and 2. The candidate will be able to submit documentation to support all factual information provided in the assessment. View terms of use <a href="https://www.gtedirect.com/gte-ar-terms-of-use">https://www.gtedirect.com/gte-ar-terms-of-use</a> 
                    </div>
                </td>
            </tr>
            <tr>
                <td class="third-row-table-td">
                    <table class="third-row-table" cellspacing="0" cellpadding="0">
                       <tr>
                            <td class="third-row-label">CANDIDATE NO</td>
                            <td class="third-row-input"><%=candidateno %></td>
                            <td class="third-row-label">REPORT NO</td>
                            <td class="third-row-input"><%=gtereportNo %></td>
                            <td class="third-row-label">INSTITUTION NO</td>
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
                <table cellpadding="0" cellspacing="0">
                  <tr>
                    <td class="lft-ttl">
                       <img src="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/GTEReport/txt7.png"> 
                    </td>
                    <td>
                      <table cellpadding="0" cellspacing="0">
                        <tr>
                          <td>
                            <table cellpadding="0" cellspacing="0">
                              <tr>
                                <td>
                                  <div class="sec-6-img">
                                   <div class="">
                                       <img src="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/GTEReport/cer-txt.png"> 
                                   </div> 
                                  </div>
                                  
                                </td>
                                <td>
                                  <div class="clearfix">
                                    <div class="us-lvl-box">
                                      <div class="us-lvl-label">
                                        LEVEL OF RISK
                                      </div>
                                       <div class="<%= tag8_class1%>">
                                        <div class="us-lvl-box-inner-l">
                                         <%= block_22 %>
                                        </div>
                                        <div class="us-lvl-box-inner-txt">
                                          <%= risk_8 %>
                                        </div>
                                       </div>
                                    </div>
                                    <div class="us-lvl-box">
                                      <div class="us-lvl-label">
                                        SATISFACTION
                                      </div>
                                      <div class="<%= tag8_class2%>"> 
                                        <div class="us-lvl-box-inner-l">
                                          <%= block_23 %>
                                        </div>
                                        <div class="us-lvl-box-inner-txt">
                                          <%= satisfaction_8 %>
                                        </div>
                                       </div>
                                    </div>
                                    <div class="us-lvl-box">
                                      <div class="us-lvl-label">
                                        SEVERITY
                                      </div>
                                       <div class="<%= tag8_class3%>">
                                        <div class="us-lvl-box-inner-l">
                                          <%= block_24 %>
                                        </div>
                                        <div class="us-lvl-box-inner-txt">
                                          <%= servity_tag_8 %>
                                        </div>
                                       </div>
                                    </div>
                                  </div>
                                </td>
                              </tr>
                            </table>
                          </td>
                        </tr>
                        <tr>
                          <td class="pt-20">
                                <table cellpadding="0" cellspacing="0" class="cer-btm-txt1">
                                    <tr>
                                        <td class="cer-btm-txt-1"><b><%=StudentName %></b> has successfully completed the Genuine Student and Genuine Temporary Entrant Tutorial and having completed a fully proctored test has demonstrated <b><%=grade %> <%=rangeofpercentage %></b> understanding of the Australian Student Visa Conditions.</td>
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
                                                                            <td class="cr-last-label">What does the rating imply</td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td><div class="cr-genuine-txt"><%=ratingimplies %></div></td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                        <td>
                                            <table cellspacing="0" cellpadding="0">
                                              <tr>
                                                <td class="cr-last-label">
                                                  Level of Understanding of various criteria
                                                </td>
                                              </tr>
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
                                                </tr>
                                            </table>
                                        </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                      <td>
                                        <div class="cer-note-wrpr pt-20">NOTE: The Genuine Student and Genuine Temporary Entrant Tutorial and Certification of Understanding helps in reducing risk related to Visa Cancellations and Turning unlawful. These factors account for 40% of education provider risk based on the SSVF framework.</div>
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
            <tr>
                <td class="cer-sep">
                    <div></div>
                </td>
            </tr>
            <tr>
              <td>
                <table cellpadding="0" cellspacing="0">
                  <tbody><tr>
                   <td class="lft-ttl">
                       <img src="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/GTEReport/txt8.png">
                    </td>

                    <td>
                      <table cellpadding="0" cellspacing="0">
                        <tbody>
                          <tr>
                            <td>
                            <table cellpadding="0" cellspacing="0">
                              <tbody><tr>
                                <td>
                                  <div class="sec-6-img">
                                     <div class="section-ttle">
                                         <img src="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/GTEReport/understanding-txt.png">
                                     </div> 
                                  </div>
                                  <div class="clearfix cd-info-box-wrpr">
                                    <div class="cd-info-box">
                                      <div class="cd-info-ttl">CITIZENSHIP</div>
                                      <div class="cd-info-subttl"><%=citizenship %></div>
                                      <div class="cd-info-subtt2"><%=AL_Level %></div>
                                    </div>
                                    <div class="cd-info-box">
                                      <div class="cd-info-ttl">CANDIDATE’S AGE</div>
                                      <div class="cd-info-subtt3"><%=age %></div>
                                      <div class="cd-info-subtt1">YEARS</div>
                                    </div>
                                    <div class="cd-info-box">
                                      <div class="cd-info-ttl">OFFSHORE</div>
                                      <div class="cd-info-subttl3"><%=Isoffshore %></div>
                                    </div>
                                    <div class="cd-info-box">
                                      <div class="cd-info-ttl">MARITAL STATUS</div>
                                      <div class="cd-info-subttl"><%=maritalstatus %></div>
                                      <div class="cd-info-subttl"><%=marriedyears %></div>
                                    </div>
                                    <div class="cd-info-box">
                                      <div class="cd-info-ttl">CITIZENSHIP OF SPOUSE</div>
                                      <div class="cd-info-subttl"><%=spousecitizenship %></div>
                                      <div class="cd-info-subtt2"></div>
                                    </div>
                                    <div class="cd-info-box">
                                      <div class="cd-info-ttl">DEPENDENTS BELOW 18 YRS</div>
                                      <div class="cd-info-subtt2"><%=Isdependent %></div>
                                    </div>
                                    <div class="cd-info-box">
                                      <div class="cd-info-ttl">NO OF DEPENDENTS BELOW 18 YRS.</div>
                                      <div class="cd-info-subtt2"><%=noofdependents %></div>
                                    </div>
                                  </div>
                                </td>
                              </tr>
                            </tbody></table>
                          </td>
                        </tr>
                      </tbody>
                    </table>
                    </td>
                  </tr>
                </tbody></table>
              </td>
            </tr>
            <tr>
                <td class="cer-sep">
                    <div></div>
                </td>
            </tr>
            <tr>
              <td>
                <table cellpadding="0" cellspacing="0">
                  <tr>
                    <td class="lft-ttl">
                       <img src="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/GTEReport/img/PREVIOUS_STUDY_AND_GAPS.png">
                    </td>
                    <td>
                      <table cellpadding="0" cellspacing="0">
                        <tr>
                          <td>
                            <table cellpadding="0" cellspacing="0">
                              <tr>
                                <td>
                                  <div class="sec-6-img">
                                    <div class="section-ttle">
                                        <img src="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/GTEReport/img/10_PREVIOUS_STUDY_AND_GAPS.png">
                                    </div> 
                                  </div>
                                  
                                </td>
                                <td>
                                  <div class="clearfix">
                                    <div class="us-lvl-box">
                                      <div class="us-lvl-label">
                                        LEVEL OF RISK
                                      </div>
                                       <div class="<%=previous_blockclass1 %>">
                                        <div class="us-lvl-box-inner-l">
                                          <%=previous_score1 %>
                                        </div>
                                        <div class="us-lvl-box-inner-txt">
                                          <%=previous_percentage1 %>
                                        </div>
                                       </div>
                                    </div>
                                    <div class="us-lvl-box">
                                      <div class="us-lvl-label">
                                        SATISFACTION
                                      </div>
                                       <div class="<%=previous_blockclass2 %>">
                                        <div class="us-lvl-box-inner-l">
                                          <%=previous_score2 %>
                                        </div>
                                        <div class="us-lvl-box-inner-txt">
                                          <%=previous_percentage2 %>
                                        </div>
                                       </div>
                                    </div>
                                    <div class="us-lvl-box">
                                      <div class="us-lvl-label">
                                        SEVERITY
                                      </div>
                                       <div class="<%=previous_blockclass3 %>">
                                        <div class="us-lvl-box-inner-l">
                                          <%=previous_score3 %>
                                        </div>
                                        <div class="us-lvl-box-inner-txt">
                                          <%=previous_percentage3 %>
                                        </div>
                                       </div>
                                    </div>
                                  </div>
                                </td>
                              </tr>
                            </table>
                          </td>
                        </tr>
                        <tr>
                            <td>
                            <table cellpadding="0" cellspacing="0">
                              <tbody>
                                <tr>
                                <td>
                                  <div class="clearfix cd-info-box-wrpr cd-info-box-wrpr-1">
                                    <div class="<%=classPS_10_1 %>">
                                      <div class="cd-info-ttl" style="margin-bottom: 12px;">STUDY & WORK GAPS > 3 MONTHS</div>
                                      <div class="cd-info-subttl3"><%=PSbox10_1 %></div>
                                    </div>
                                    <div class="<%=classPS_10_2 %>">
                                      <div class="cd-info-ttl">STARTED A COURSE BUT DID NOT COMPLETE IT</div>
                                      <div class="cd-info-subttl3"><%=PSbox10_2 %></div>
                                    </div>
                                    <div class="<%=classPS_10_3 %>">
                                      <div class="cd-info-ttl" style="margin-bottom: 12px;">PREVIOUSLY EXPELLED OR SUSPENDED</div>
                                      <div class="cd-info-subttl3"><%=PSbox10_3 %></div>
                                    </div>
                                    <div class="<%=classPS_10_4 %>">
                                      <div class="cd-info-ttl">TAKEN >1 ATTEMPTS TO COMPLETE A COURSE </div>
                                      <div class="cd-info-subttl3"><%=PSbox10_4 %></div>
                                    </div>
                                    <div class="<%=classPS_10_5 %>">
                                      <div class="cd-info-ttl">ENROLLED IN A COURSE BUT DID NOT COMPLETE IT</div>
                                      <div class="cd-info-subttl3"><%=PSbox10_5 %></div>
                                    </div>
                                    <div class="<%=classPS_10_6 %>">
                                      <div class="cd-info-ttl">REPORTED LOW OR INCONSISTENCE CLASS ATTENDANCE</div>
                                      <div class="cd-info-subttl3"><%=PSbox10_6 %></div>
                                    </div>
                                    <div class="<%=classPS_10_7 %>">
                                      <div class="cd-info-ttl">ENROLLED IN A COURSE BUT DID NOT COMPLETE IT</div>
                                      <div class="cd-info-subttl3"><%=PSbox10_7 %></div>
                                    </div>
                                  </div>
                                </td>
                              </tr>

                            </tbody>
                          </table>
                          </td>
                        </tr>
                        <tr>
                            <td>
                            <table cellpadding="0" cellspacing="0">
                              <tbody>
                                <tr>
                                <td>
                                  <div class="clearfix cd-info-box-wrpr">
                                    <div class="<%=classPS_10_8 %>">
                                      <div class="cd-info-ttl">DID NOT COMPLETE A COURSE ON TIME POST ENROLMENT</div>
                                      <div class="cd-info-subttl3"><%=PSbox10_8 %></div>
                                    </div>
                                    <div class="<%=classPS_10_9 %>">
                                      <div class="cd-info-ttl">FALSELY REQUESTED A DEFERRAL (PAUSE)</div>
                                      <div class="cd-info-subttl3"><%=PSbox10_9 %></div>
                                    </div>
                                    <div class="<%=classPS_10_10 %>">
                                      <div class="cd-info-ttl">COURSE LEVEL APPLIED IS LOWER THAN PREVIOUS STUDY</div>
                                      <div class="cd-info-subttl3"><%=PSbox10_10 %></div>
                                    </div>
                                    <div class="<%=classPS_10_11 %>">
                                      <div class="cd-info-ttl">COURSE APPLIED IS EQUAL TO PREVIOUS STUDY</div>
                                      <div class="cd-info-subttl3"><%=PSbox10_11 %></div>
                                    </div>
                                    <div class="<%=classPS_10_12 %>">
                                      <div class="cd-info-ttl">BROAD FIELD DIFFERENT THAN PREVIOUS STUDY</div>
                                      <div class="cd-info-subttl3"><%=PSbox10_12 %></div>
                                    </div>
                                    <div class="<%=classPS_10_13 %>">
                                      <div class="cd-info-ttl">NARROW FIELD DIFFERENT THAN PREVIOUS STUDY</div>
                                      <div class="cd-info-subttl3"><%=PSbox10_13 %></div>
                                    </div>
                                    <div class="<%=classPS_10_14 %>">
                                      <div class="cd-info-ttl">DETAILED FIELD DIFFERENT THAN PREVIOUS STUDY</div>
                                      <div class="cd-info-subttl3"><%=PSbox10_14 %></div>
                                    </div>
                                  </div>
                                </td>
                              </tr>

                            </tbody>
                          </table>
                          </td>
                        </tr>
                        <tr>
                          <td class="pb-15">
                            <table cellpadding="0" cellspacing="0" width="100%">
                              <tbody><tr>
                                <td class="va-bottom usr-img-td">
                                  <%=StudentName %> Response to second level Clarification Questions
                                  <img src="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/GTEReport/user-msg.png">
                                </td>
                                <td>
                                  <div class="us-msg-wrpr">
                                    <div class="us-msg-wrpr-q" id="cq1" runat="server" style="display:none;">CQ 1 - <%=CQ_Ques_1 %></div>
                                    <div class="us-msg-wrpr-a" runat="server" id="cqans_1" style="display:none;">CA 1 < <%=CQ_Ans_1 %></div>
                                    <div class="us-msg-wrpr-q" runat="server" id="cq2" style="display:none;">CQ 2 - <%=CQ_Ques_2 %></div>
                                    <div class="us-msg-wrpr-a" runat="server" id="cqans_2" style="display:none;">CA 2 < <%=CQ_Ans_2 %></div>
                                    <div class="us-msg-wrpr-q" runat="server" id="cq4" style="display:none;">CQ 4 - <%=CQ_Ques_4 %></div>
                                    <div class="us-msg-wrpr-a" runat="server" id="cqans_4" style="display:none;">CA 4 < <%=CQ_Ans_4 %></div>
                                    <div class="us-msg-wrpr-q" runat="server" id="cq5" style="display:none;">CQ 5 - <%=CQ_Ques_5 %></div>
                                    <div class="us-msg-wrpr-a" runat="server" id="cqans_5" style="display:none;">CA 5 < <%=CQ_Ans_5 %></div>
                                    <div class="us-msg-wrpr-q" runat="server" id="cq8" style="display:none;">CQ 8 - <%=CQ_Ques_8 %></div>
                                    <div class="us-msg-wrpr-a" runat="server" id="cqans_8" style="display:none;">CA 8 < <%=CQ_Ans_8 %></div>
                                    <div class="us-msg-wrpr-q" runat="server" id="cq36" style="display:none;">CQ 36 - <%=CQ_Ques_36 %></div>
                                    <div class="us-msg-wrpr-a" runat="server" id="cqans_36" style="display:none;">CA 36 < <%=CQ_Ans_36 %></div>
                                    <div class="us-msg-wrpr-q" runat="server" id="cq37" style="display:none;">CQ 37 - <%=CQ_Ques_37%></div>
                                    <div class="us-msg-wrpr-a" runat="server" id="cqans_37" style="display:none;">CA 37 < <%=CQ_Ans_37 %></div>
                                    <div class="us-msg-wrpr-q" runat="server" id="cq38" style="display:none;">CQ 38 - <%=CQ_Ques_38 %></div>
                                    <div class="us-msg-wrpr-a" runat="server" id="cqans_38" style="display:none;">CA 38 < <%=CQ_Ans_38 %></div>
                                  </div>
                                </td>
                              </tr>
                            </tbody></table>
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
      <%--4--%>
    <div class="certificate-wrpr">
        <div class="water-mark"><%=gtereportNo %></div>
        <table class="certificate-table" cellspacing="0" cellpadding="0">
            <tr>
                <td>
                    <table cellspacing="0" cellpadding="0" class="first-row-table">
                        <tr class="first-row">
                            <td class="min-20">
                                <img src="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/GTEReport/logo.png" class="cer-logo">
                            </td>
                            <td class="min-60">
                                <span class="cer-ttl">Assessment Report</span>
                                <span class="cer-sub-ttl">for Australian Genuine Student &</span>
                                <span class="cer-sub-ttl">Genuine Temporary Entrant Criteria</span>
                            </td>
                            <td class="min-20">
                                <div class="cer-flg-wrpr clearfix">
                                    <img src="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/GTEReport/flag.png" class="cer-flag">
                                </div>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <div class="cer-note-wrpr">
                         <span>NOTE:</span> This Assessment Report is privileged and confidential and generated for the exclusive use of <%=instutionname %>. Assessments are made subject to an assumption that: 1) Thecandidate’s responses were: a) truthful and honest b) accurate and correct; and 2. The candidate will be able to submit documentation to support all factual information provided in the assessment. View terms of use <a href="https://www.gtedirect.com/gte-ar-terms-of-use">https://www.gtedirect.com/gte-ar-terms-of-use</a> 
                    </div>
                </td>
            </tr>
            <tr>
                <td class="third-row-table-td">
                    <table class="third-row-table" cellspacing="0" cellpadding="0">
                       <tr>
                            <td class="third-row-label">CANDIDATE NO</td>
                            <td class="third-row-input"><%=candidateno %></td>
                            <td class="third-row-label">REPORT NO</td>
                            <td class="third-row-input"><%=gtereportNo %></td>
                            <td class="third-row-label">INSTITUTION NO</td>
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
                <table cellpadding="0" cellspacing="0">
                  <tr>
                    <td class="lft-ttl">
                       <img src="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/GTEReport/img/VALUE_OF_COURSE.png">
                    </td>
                    <td>
                      <table cellpadding="0" cellspacing="0">
                        <tr>
                          <td>
                            <table cellpadding="0" cellspacing="0">
                              <tr>
                                <td>
                                  <div class="sec-6-img">
                                     <div class="section-ttle">
                                         <img src="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/GTEReport/img/11_EMPLOYMENT_&_VALUE_OF_THE_COURSE.png">
                                     </div> 
                                  </div>
                                  
                                </td>
                                <td>
                                  <div class="clearfix">
                                    <div class="us-lvl-box">
                                      <div class="us-lvl-label">
                                        LEVEL OF RISK
                                      </div>
                                       <div class="<%=employment_blockclass1 %>">
                                        <div class="us-lvl-box-inner-l">
                                          <%=employment_score1 %>
                                        </div>
                                        <div class="us-lvl-box-inner-txt">
                                          <%=employment_percentage1 %>
                                        </div>
                                       </div>
                                    </div>
                                    <div class="us-lvl-box">
                                      <div class="us-lvl-label">
                                        SATISFACTION
                                      </div>
                                       <div class="<%=employment_blockclass2 %>">
                                        <div class="us-lvl-box-inner-l">
                                          <%=employment_score2 %>
                                        </div>
                                        <div class="us-lvl-box-inner-txt">
                                          <%=employment_percentage2 %>
                                        </div>
                                       </div>
                                    </div>
                                    <div class="us-lvl-box">
                                      <div class="us-lvl-label">
                                        SEVERITY
                                      </div>
                                       <div class="<%=employment_blockclass3 %>">
                                        <div class="us-lvl-box-inner-l">
                                          <%=employment_score3 %>
                                        </div>
                                        <div class="us-lvl-box-inner-txt">
                                          <%=employment_percentage3 %>
                                        </div>
                                       </div>
                                    </div>
                                  </div>
                                </td>
                              </tr>
                            </table>
                          </td>
                        </tr>
                        <tr>
                            <td>
                            <table cellpadding="0" cellspacing="0">
                              <tbody>
                                <tr>
                                <td>
                                  <div class="clearfix cd-info-box-wrpr cd-info-box-wrpr-1">
                                    <div class="<%=AnswertoQuestion_16Section2_class %>">
                                      <div class="cd-info-ttl" style="margin-bottom: 12px;">PRIMARY REASON TO STUDY IN AUSTRALIA</div>
                                      <div class="cd-info-subttl34"><%=AnswertoQuestion_16_Section2 %></div>
                                    </div>
                                    <div class="<%=AnswertoQuestion_13Section2_class %>"">
                                      <div class="cd-info-ttl">PRIMARY REASON TO STUDY THE SELECTED COURSE The course I have selected</div>
                                      <div class="cd-info-subttl34"><%=AnswertoQuestion_13_Section2 %></div>
                                    </div>
                                    <div class="<%=AnswertoQuestion_14Section2_class %>">
                                      <div class="cd-info-ttl" style="margin-bottom: 12px;">DURATION OF STUDY IN AUSTRALIA </div>
                                      <div class="cd-info-subttl34"><%=AnswertoQuestion_14_Section2 %></div>
                                    </div>
                                    <div class="<%=AnswertoQuestion_15Section2_class %>">
                                      <div class="cd-info-ttl">PLANS AFTER COMPLETING THE SELECTED COURSE After completing my course I plan to </div>
                                      <div class="cd-info-subttl34"><%=AnswertoQuestion_15_Section2 %></div>
                                    </div>
                                  </div>
                                </td>
                              </tr>

                            </tbody>
                          </table>
                          </td>
                        </tr>
                          <tr>
                            <td>
                            <table cellpadding="0" cellspacing="0">
                              <tbody>
                                <tr>
                                <td>
                                  <div class="clearfix cd-info-box-wrpr">
                                    <div class="<%=AnswertoQuestion_17Section2_class %>">
                                      <div class="cd-info-ttl">PLANS AFTER COMPLETING STUDIES IN AUSTRALIA After I complete my studies in Australia, </div>
                                      <div class="cd-info-subttl34"><%=AnswertoQuestion_18_Section2 %></div>
                                    </div>
                                    <div class="<%=AnswertoQuestion_18Section2_class %>">
                                      <div class="cd-info-ttl">ENGLISH LANGUAGE COMPETENCIES My English language competencies are</div>
                                      <div class="cd-info-subttl34"><%=AnswertoQuestion_17_Section2 %></div>
                                    </div>
                                    <div class="<%=iscurrwrkngclass %>" style="width:107px;">
                                      <div class="cd-info-ttl" style="margin-bottom: 11px;">CURRENTLY EMPLOYED </div>
                                      <div class="cd-info-subttl3"><%=Iscurrentlyemployed %></div>
                                    </div>
                                    <div class="cd-info-box bg-red wid-107" style="width:107px;">
                                      <div class="cd-info-ttl">WORK EXPERIENCE</div>
                                      <div class="cd-info-subttl34"><%=workexpericeyears %></div>
                                    </div>
                                    <div class="<%=IsjobofferedinhomecountryClass %>" style="width:107px;">
                                      <div class="cd-info-ttl">CONFIRMED JOB OFFER IN HOME COUNTRY</div>
                                      <div class="cd-info-subttl3"><%=Isjobofferedinhomecountry %> </div>
                                    </div>
                                  </div>
                                </td>
                              </tr>

                            </tbody>
                          </table>
                          </td>
                        </tr>
                          <tr>
                          <td class="pb-15">
                            <table cellpadding="0" cellspacing="0" width="100%">
                              <tbody><tr>
                                <td class="va-bottom usr-img-td">
                                  A Response to second level Clarification Questions
                                  <img src="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/GTEReport/user-msg.png">
                                </td>
                                <td>
                                  <div class="us-msg-wrpr wid-593" style="    margin-left: 20px;">
                                    <div id="cq12" class="us-msg-wrpr-q" style="display:none;" runat="server">CQ 12 - <%=CQ_Ques_12 %></div>
                                    <div id="cqans_12" class="us-msg-wrpr-a" style="display:none;" runat="server">CA 12 < <%=CQ_Ans_12 %></div>
                                    <div id="cq13" class="us-msg-wrpr-q" style="display:none;" runat="server">CQ 13 - <%=CQ_Ques_13 %></div>
                                    <div id="cqans_13" class="us-msg-wrpr-a" style="display:none;" runat="server">CA 13 < <%=CQ_Ans_13 %></div>
                                    <div id="cq34" class="us-msg-wrpr-q" style="display:none;" runat="server">CQ 34 - <%=CQ_Ques_34 %></div>
                                    <div id="cqans_34" class="us-msg-wrpr-a" style="display:none;" runat="server">CA 34 < <%=CQ_Ans_34 %></div>
                                    <div id="cq35" class="us-msg-wrpr-q" style="display:none;" runat="server">CQ 35 - <%=CQ_Ques_35 %></div>
                                    <div id="cqans_35" class="us-msg-wrpr-a" style="display:none;" runat="server">CA 35 < <%=CQ_Ans_35 %></div>
                                  </div>
                                </td>
                              </tr>
                            </tbody></table>
                          </td>
                        </tr>
                          <tr>
                              <td class="pb-15">
                                  <table cellpadding="0" cellspacing="0" width="100%">
                                      <tbody>
                                          <tr>
                                              <td>
                                                  <div class="us-msg-wrpr us-msg-wrpr-1 potentiaol-cmt-box">
                                                      <div id="RG_13" class="us-msg-wrpr-q"><%=RGcmnt_sec2_13%></div>
                                                      <div id="RG_14" class="us-msg-wrpr-q"><%=RGcmnt_sec2_14%></div>
                                                      <div id="RG_15" class="us-msg-wrpr-q"><%=RGcmnt_sec2_15%></div>
                                                      <div id="RG_16" class="us-msg-wrpr-q"><%=RGcmnt_sec2_16%></div>
                                                      <div id="RG_17" class="us-msg-wrpr-q"><%=RGcmnt_sec2_17%></div>
                                                      <div id="RG_18" class="us-msg-wrpr-q"><%=RGcmnt_sec2_18%></div>
                                                  </div>
                                              </td>
                                              <td class="va-bottom usr-img-td usr-img-td-1">Proctor's Comments
                                  <img src="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/GTEReport/img.png">
                                              </td>
                                          </tr>
                                      </tbody>
                                  </table>
                              </td>
                          </tr>
                      </table>
                    </td>
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
                <table cellpadding="0" cellspacing="0">
                  <tr>
                    <td class="lft-ttl">
                        <img src="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/GTEReport/img/RETENTION_RISK.png">
                    </td>
                    <td>
                      <table cellpadding="0" cellspacing="0">
                        <tr>
                          <td>
                            <table cellpadding="0" cellspacing="0">
                              <tr>
                                <td>
                                  <div class="sec-6-img">
                                    <div class="section-ttle">
                                        <span>13</span>CONVERSION AND RETENTION RISK
                                    </div> 
                                  </div>
                                  
                                </td>
                                <td>
                                  <div class="clearfix">
                                    <div class="us-lvl-box">
                                      <div class="us-lvl-label">
                                        LEVEL OF RISK
                                      </div>
                                       <div class="<%=retentionrisk_blockclass1 %>">
                                        <div class="us-lvl-box-inner-l">
                                          <%=retentionrisk_score1%>
                                        </div>
                                        <div class="us-lvl-box-inner-txt">
                                          <%=retentionrisk_percentage1 %>
                                        </div>
                                       </div>
                                    </div>
                                    <div class="us-lvl-box">
                                      <div class="us-lvl-label">
                                        SATISFACTION
                                      </div>
                                       <div class="<%=retentionrisk_blockclass2 %>">
                                        <div class="us-lvl-box-inner-l">
                                          <%=retentionrisk_score2 %>
                                        </div>
                                        <div class="us-lvl-box-inner-txt">
                                          <%=retentionrisk_percentage2 %>
                                        </div>
                                       </div>
                                    </div>
                                    <div class="us-lvl-box">
                                      <div class="us-lvl-label">
                                        SEVERITY
                                      </div>
                                       <div class="<%=retentionrisk_blockclass3 %>">
                                        <div class="us-lvl-box-inner-l">
                                          <%=retentionrisk_score3 %>
                                        </div>
                                        <div class="us-lvl-box-inner-txt">
                                          <%=retentionrisk_percentage3 %>
                                        </div>
                                       </div>
                                    </div>
                                  </div>
                                </td>
                              </tr>
                            </table>
                          </td>
                        </tr>                        
                        <tr>
                            <td>
                            <table cellpadding="0" cellspacing="0">
                              <tbody>
                                <tr>
                                <td>
                                  <div class="clearfix cd-info-box-wrpr">
                                    <div class="<%=classRR_13_5 %>" style="width:106px;">
                                      <div class="cd-info-ttl font7">CANDIDATE HAS APPLIED TO OTHER EDUCATIONAL INSTITUTIONS</div>
                                      <div class="cd-info-subttl3"><%=RRisk_5 %></div>
                                    </div>
                                    <div class="<%=classRR_13_10 %>"  style="width:106px;">
                                      <div class="cd-info-ttl font7">INTENTION TO DROP OUT OF THE COURSE IF OFFERED FULL-TIME JOB </div>
                                      <div class="cd-info-subttl3"><%=RRisk_10 %></div>
                                    </div>
                                    <div class="<%=classRR_13_11 %>" style="width:106px;">
                                      <div class="cd-info-ttl font7">INTENTION TO STUDY PART-TIME IF OFFERED A FULL TIME JOB </div>
                                      <div class="cd-info-subttl3"><%=RRisk_11 %></div>
                                    </div>
                                    <div class="<%=classRR_13_29 %>" style="width:106px;">
                                      <div class="cd-info-ttl font7">INTENTION TO LOOK FOR CHEAPER OPTIONS POST COMMENCEMENT</div>
                                      <div class="cd-info-subttl3"><%=RRisk_29 %></div>
                                    </div>
                                    <div class="<%=classRR_13_30 %>" style="width:106px;">
                                      <div class="cd-info-ttl font7">INTENTION TO CHANGE INSTITUTION POST GETTING VISA</div>
                                      <div class="cd-info-subttl3"><%=RRisk_30 %></div>
                                    </div>
                                    <div class="<%=classRR_13_49 %>" style="width:106px;">
                                      <div class="cd-info-ttl font7">HAS SOME CONNECTION WITH <%=instutionname %> </div>
                                      <div class="cd-info-subttl3"><%=RRisk_49 %></div>
                                    </div>
                                  </div>
                                </td>
                              </tr>

                            </tbody>
                          </table>
                          </td>
                        </tr>
                        <tr>
                          <td class="pb-15">
                            <table cellpadding="0" cellspacing="0" width="100%">
                              <tbody><tr>
                                <td class="va-bottom usr-img-td">
                                 Clarification Questions
                                  <img src="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/GTEReport/user-msg.png">
                                </td>
                                <td>
                                  <div class="us-msg-wrpr wid-593" style="    margin-left: 20px;">
                                    <div class="us-msg-wrpr-q" id="cq3" runat="server" style="display:none;">CQ 3 - <%=CQ_Ques_3 %></div>
                                    <div class="us-msg-wrpr-a" runat="server" id="cqans_3" style="display:none;" >CA 3 < <%=CQ_Ans_3 %></div>
                                    <div class="us-msg-wrpr-q" runat="server" id="cq46" style="display:none;" >CQ 46 - <%=CQ_Ques_46 %></div>
                                    <div class="us-msg-wrpr-a" runat="server" id="cqans_46" style="display:none;" >CA 46 < <%=CQ_Ans_46 %></div>
                                    <div class="us-msg-wrpr-q" runat="server" id="cq47" style="display:none;" >CQ 47 - <%=CQ_Ques_47 %></div>
                                    <div class="us-msg-wrpr-a" runat="server" id="cqans_47" style="display:none;" >CA 47 < <%=CQ_Ans_47 %></div>                                    
                                  </div>
                                </td>
                              </tr>
                            </tbody></table>
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
      <%--5--%>
    <div class="certificate-wrpr">
        <div class="water-mark"><%=gtereportNo %></div>
        <table class="certificate-table" cellspacing="0" cellpadding="0">
            <tr>
                <td>
                    <table cellspacing="0" cellpadding="0" class="first-row-table">
                        <tr class="first-row">
                            <td class="min-20">
                                <img src="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/GTEReport/logo.png" class="cer-logo">
                            </td>
                            <td class="min-60">
                                <span class="cer-ttl">Assessment Report</span>
                                <span class="cer-sub-ttl">for Australian Genuine Student &</span>
                                <span class="cer-sub-ttl">Genuine Temporary Entrant Criteria</span>
                            </td>
                            <td class="min-20">
                                <div class="cer-flg-wrpr clearfix">
                                    <img src="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/GTEReport/flag.png" class="cer-flag">
                                </div>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <div class="cer-note-wrpr">
                         <span>NOTE:</span> This Assessment Report is privileged and confidential and generated for the exclusive use of <%=instutionname %>. Assessments are made subject to an assumption that: 1) Thecandidate’s responses were: a) truthful and honest b) accurate and correct; and 2. The candidate will be able to submit documentation to support all factual information provided in the assessment. View terms of use <a href="https://www.gtedirect.com/gte-ar-terms-of-use">https://www.gtedirect.com/gte-ar-terms-of-use</a> 
                    </div>
                </td>
            </tr>
            <tr>
                <td class="third-row-table-td">
                    <table class="third-row-table" cellspacing="0" cellpadding="0">
                       <tr>
                            <td class="third-row-label">CANDIDATE NO</td>
                            <td class="third-row-input"><%=candidateno %></td>
                            <td class="third-row-label">REPORT NO</td>
                            <td class="third-row-input"><%=gtereportNo %></td>
                            <td class="third-row-label">INSTITUTION NO</td>
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
                <table cellpadding="0" cellspacing="0">
                  <tr>
                    <td class="lft-ttl">
                       <img src="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/GTEReport/img/SITUATION_IN_THE_HOME_COUNTRY.png">
                    </td>
                    <td>
                      <table cellpadding="0" cellspacing="0">
                        <tr>
                          <td>
                            <table cellpadding="0" cellspacing="0">
                              <tr>
                                <td>
                                  <div class="sec-6-img">
                                    <div class="section-ttle">
                                        <img src="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/GTEReport/img/14_TIES_TO,AND_SITUATIONS_IN,MY_HOME_COUNTRY.png">

                                    </div>
                                  </div>
                                  
                                </td>
                                <td>
                                  <div class="clearfix">
                                    <div class="us-lvl-box">
                                      <div class="us-lvl-label">
                                        LEVEL OF RISK
                                      </div>
                                       <div class="<%=homecountry_blockclass1 %>">
                                        <div class="us-lvl-box-inner-l">
                                          <%=homecountry_score1 %>
                                        </div>
                                        <div class="us-lvl-box-inner-txt">
                                          <%=homecountry_percentage1 %>
                                        </div>
                                       </div>
                                    </div>
                                    <div class="us-lvl-box">
                                      <div class="us-lvl-label">
                                        SATISFACTION
                                      </div>
                                       <div class="<%=homecountry_blockclass2 %>">
                                        <div class="us-lvl-box-inner-l">
                                          <%=homecountry_score2 %>
                                        </div>
                                        <div class="us-lvl-box-inner-txt">
                                          <%=homecountry_percentage2 %>
                                        </div>
                                       </div>
                                    </div>
                                    <div class="us-lvl-box">
                                      <div class="us-lvl-label">
                                        SEVERITY
                                      </div>
                                       <div class="<%=homecountry_blockclass3 %>">
                                        <div class="us-lvl-box-inner-l">
                                          <%=homecountry_score3 %>
                                        </div>
                                        <div class="us-lvl-box-inner-txt">
                                          <%=homecountry_percentage3 %>
                                        </div>
                                       </div>
                                    </div>
                                  </div>
                                </td>
                              </tr>
                            </table>
                          </td>
                        </tr>
                        <tr>
                            <td>
                            <table cellpadding="0" cellspacing="0">
                              <tbody>
                                <tr>
                                <td>
                                  <div class="clearfix cd-info-box-wrpr cd-info-box-wrpr-1">
                                    <div class="<%=AnswertoQuestion_1_Section2_class %>">
                                      <div class="cd-info-ttl">WHY STUDY IN AUSTRALIA</div>
                                      <div class="cd-info-subttl34">I plan to study this course in Australia and not in <%=nationality %> because <%=AnswertoQuestion_1_Section2 %></div>
                                    </div>
                                    <div class="<%=AnswertoQuestion_2_Section2_class %>">
                                      <div class="cd-info-ttl">FAMILY TIES IN HOME COUNTRY</div>
                                      <div class="cd-info-subttl34">My parents, brothers and sisters are <%=AnswertoQuestion_2_Section2 %></div>
                                    </div>
                                   <div class="<%=AnswertoQuestion_3_Section2_class %>">
                                      <div class="cd-info-ttl">MARKET VALUE OF ASSETS IN HOME COUNTRY </div>
                                      <div class="cd-info-subttl34">The current market value of my family's fixed assets Residential / Commercial / Agricultural is <%=AnswertoQuestion_3_Section2 %></div>
                                    </div>
                                    <div class="<%=AnswertoQuestion_4_Section2_class %>">
                                      <div class="cd-info-ttl">SOURCE OF FUNDING </div>
                                      <div class="cd-info-subttl34">The source of funding for my tuition fees and living expenses will <%=AnswertoQuestion_4_Section2 %></div>
                                    </div>
                                  </div>
                                </td>
                              </tr>

                            </tbody>
                          </table>
                          </td>
                        </tr>
                          <tr>
                            <td>
                            <table cellpadding="0" cellspacing="0">
                              <tbody>
                                <tr>
                                <td>
                                  <div class="clearfix cd-info-box-wrpr cd-info-box-wrpr-1">
                                    <div class="<%=AnswertoQuestion_6_Section2_class %>">
                                      <div class="cd-info-ttl">THE SPONSOR </div>
                                      <div class="cd-info-subttl34">My sponsor <%=AnswertoQuestion_6_Section2 %></div>
                                    </div>
                                    <div class="<%=AnswertoQuestion_5_Section2_class %>">
                                      <div class="cd-info-ttl">SPONSOR'S INCOME</div>
                                      <div class="cd-info-subttl34">My sponsor's income in the last calendar year was <%=AnswertoQuestion_5_Section2 %></div>
                                    </div>
                                   <div class="<%=AnswertoQuestion_7_Section2_class %>">
                                      <div class="cd-info-ttl">MILITARY SERVICE</div>
                                      <div class="cd-info-subttl34">In my home country <%=nationality %>,<%=AnswertoQuestion_7_Section2 %></div>
                                    </div>
                                   <div class="<%=AnswertoQuestion_8_Section2_class %>">
                                      <div class="cd-info-ttl">POLITICAL SITUATION IN HOME COUNTRY</div>
                                      <div class="cd-info-subttl34">The political and civil situation in <%=nationality %> my home country<%=AnswertoQuestion_8_Section2 %></div>
                                    </div>
                                  </div>
                                </td>
                              </tr>

                            </tbody>
                          </table>
                          </td>
                        </tr>
                          <tr>
                          <td class="pb-15" style="padding-top: 19px;">
                            <table cellpadding="0" cellspacing="0" width="100%">
                              <tbody><tr>
                                <td class="va-bottom usr-img-td">
                                  Clarification Questions
                                  <img src="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/GTEReport/user-msg.png">
                                </td>
                                <td>
                                  <div class="us-msg-wrpr wid-593" style="margin-left: 20px;">
                                    <div id="cq43" class="us-msg-wrpr-q" style="display:none;" runat="server">CQ 43 - <%=CQ_Ques_43 %></div>
                                    <div id="cqans_43" class="us-msg-wrpr-a" style="display:none;" runat="server">CA 43 < <%=CQ_Ans_43 %></div>
                                    <div id="cq44" class="us-msg-wrpr-q" style="display:none;" runat="server">CQ 44 - <%=CQ_Ques_44 %></div>
                                    <div id="cqans_44" class="us-msg-wrpr-a" style="display:none;" runat="server">CA 44 < <%=CQ_Ans_44 %></div>                                    
                                  </div>
                                </td>
                              </tr>
                            </tbody></table>
                          </td>
                        </tr>
                          <tr>
                              <td class="pb-15">
                                  <table cellpadding="0" cellspacing="0" width="100%">
                                      <tbody>
                                          <tr>

                                              <td>
                                                  <div class="us-msg-wrpr us-msg-wrpr-1 potentiaol-cmt-box">
                                                      <div class="us-msg-wrpr-q"><%=RGcmnt_1 %></div>
                                                      <div class="us-msg-wrpr-q"><%=RGcmnt_2 %></div>
                                                      <div class="us-msg-wrpr-q"><%=RGcmnt_3 %></div>
                                                      <div class="us-msg-wrpr-q"><%=RGcmnt_4 %></div>
                                                      <div class="us-msg-wrpr-q"><%=RGcmnt_5 %></div>
                                                      <div class="us-msg-wrpr-q"><%=RGcmnt_6 %></div>
                                                      <div class="us-msg-wrpr-q"><%=RGcmnt_7 %></div>
                                                      <div class="us-msg-wrpr-q"><%=RGcmnt_8 %></div>
                                                  </div>
                                              </td>
                                              <td class="va-bottom usr-img-td usr-img-td-1">Proctor's Comments
                                                <img src="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/GTEReport/img.png">
                                              </td>
                                          </tr>
                                      </tbody>
                                  </table>
                              </td>
                          </tr>
                      </table>
                    </td>
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
                <table cellpadding="0" cellspacing="0">
                  <tr>
                    <td class="lft-ttl">
                       <img src="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/GTEReport/img/IMMIGRATION_HISTORY.png">
                    </td>
                    <td>
                      <table cellpadding="0" cellspacing="0">
                        <tr>
                          <td>
                            <table cellpadding="0" cellspacing="0">
                              <tr>
                                <td>
                                  <div class="sec-6-img">
                                    <div class="section-ttle">
                                        <img src="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/GTEReport/img/15_IMMIGRATION_HISTORY.png">
                                    </div> 
                                  </div>
                                  
                                </td>
                                <td>
                                  <div class="clearfix">
                                    <div class="us-lvl-box">
                                      <div class="us-lvl-label">
                                        LEVEL OF RISK
                                      </div>
                                       <div class="<%=immihistory_blockclass1 %>">
                                        <div class="us-lvl-box-inner-l">
                                          <%=immihistory_score1 %>
                                        </div>
                                        <div class="us-lvl-box-inner-txt">
                                          <%=immihistory_levelofrisk %>
                                        </div>
                                       </div>
                                    </div>
                                    <div class="us-lvl-box">
                                      <div class="us-lvl-label">
                                        SATISFACTION
                                      </div>
                                       <div class="<%=immihistory_blockclass2 %>">
                                        <div class="us-lvl-box-inner-l">
                                          <%=immihistory_score2 %>
                                        </div>
                                        <div class="us-lvl-box-inner-txt">
                                          <%=immihistory_satisfaction %>
                                        </div>
                                       </div>
                                    </div>
                                    <div class="us-lvl-box">
                                      <div class="us-lvl-label">
                                        SEVERITY
                                      </div>
                                       <div class="<%=immihistory_blockclass3 %>">
                                        <div class="us-lvl-box-inner-l">
                                          <%=immihistory_score3 %>
                                        </div>
                                        <div class="us-lvl-box-inner-txt">
                                          <%=immihistory_severity %>
                                        </div>
                                       </div>
                                    </div>
                                  </div>
                                </td>
                              </tr>
                            </table>
                          </td>
                        </tr>                        
                        <tr>
                            <td>
                            <table cellpadding="0" cellspacing="0">
                              <tbody>
                                <tr>
                                <td>
                                  <div class="clearfix cd-info-box-wrpr">
                                    <div class="<%=classPS_15_1 %>">
                                      <div class="cd-info-ttl mrgbtm">TRAVELLED TO A FOREIGN COUNTRY</div>
                                      <div class="cd-info-subttl3"><%=section3_24 %></div>
                                    </div>
                                    <div class="<%=classPS_15_2 %>">
                                      <div class="cd-info-ttl mrgbtm">PRIOR VISA REFUSAL OR REFECTION </div>
                                      <div class="cd-info-subttl3"><%=section3_21 %></div>
                                    </div>
                                    <div class="<%=classPS_15_3 %>">
                                      <div class="cd-info-ttl mrgbtm">DEPORTED FROM A FOREIGN COUNTRY</div>
                                      <div class="cd-info-subttl3"><%=section3_26 %></div>
                                    </div>
                                    <div class="<%=classPS_15_4 %>">
                                      <div class="cd-info-ttl mrgbtm">ALWAYS COMPLIED WITH VISA CONDITIONS</div>
                                      <div class="cd-info-subttl3"><%=section3_27 %></div>
                                    </div>
                                    <div class="<%=classPS_15_5 %>">
                                      <div class="cd-info-ttl mrgbtm">PREVIOUS VISA CANCELLATION</div>
                                      <div class="cd-info-subttl3"><%=section3_17 %></div>
                                    </div>
                                    <div class="<%=classPS_15_6 %>">
                                      <div class="cd-info-ttl mrgbtm">OVERSTAYED BEYOND VISA EXPIRY DATE </div>
                                      <div class="cd-info-subttl3"><%=section3_43 %></div>
                                    </div>
                                    <div class="<%=classPS_15_7 %>">
                                      <div class="cd-info-ttl mrgbtm">PREVIOUSLY VISA CONSIDERED FOR CANCELLATION  </div>
                                      <div class="cd-info-subttl3"><%=section3_28 %></div>
                                    </div>
                                  </div>
                                </td>
                              </tr>

                            </tbody>
                          </table>
                          </td>
                        </tr>
                        <tr>
                          <td class="pb-15">
                            <table cellpadding="0" cellspacing="0" width="100%">
                              <tbody><tr>                          
                                  <td class="va-bottom usr-img-td usr-img-td-box">
                                      <div class="clearfix cd-info-box-wrpr">
                                          <div class="<%=classPS_15_8 %>">
                                              <div class="cd-info-ttl mrgbtm">Traveled to Australia Before</div>
                                              <div class="cd-info-subttl3"><%=section3_20 %></div>
                                          </div>
                                           <div class="<%=classPS_15_9 %>">
                                              <div class="cd-info-ttl">At the time of applying for the Student Visa I will be in Australia</div>
                                              <div class="cd-info-subttl3"><%=section3_14 %></div>
                                          </div>
                                      </div>
                                 Clarification<br/> Questions
                                  <img src="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/GTEReport/user-msg.png">
                                </td>
                                  <td>
                                  <div class="us-msg-wrpr" style=" width: 471px;">
                                    <div class="us-msg-wrpr-q" runat="server" id="cq7" style="display:none;">CQ 7 - <%=CQ_Ques_7 %></div>
                                    <div class="us-msg-wrpr-a" runat="server" id="cqans_7" style="display:none;" >CA 7 < <%=CQ_Ans_7 %></div>
                                    <div class="us-msg-wrpr-q" runat="server" id="cq10" style="display:none;" >CQ 10 - <%=CQ_Ques_10 %></div>
                                    <div class="us-msg-wrpr-a" runat="server" id="cqans_10" style="display:none;" >CA 10 < <%=CQ_Ans_10 %></div>
                                    <div class="us-msg-wrpr-q" runat="server" id="cq11" style="display:none;" >CQ 11 - <%=CQ_Ques_11 %></div>
                                    <div class="us-msg-wrpr-a" runat="server" id="cqans_11" style="display:none;" >CA 11 < <%=CQ_Ans_11 %></div>
                                    <div class="us-msg-wrpr-q" runat="server" id="cq14" style="display:none;" >CQ 14 - <%=CQ_Ques_14 %></div>
                                    <div class="us-msg-wrpr-a" runat="server" id="cqans_14" style="display:none;" >CA 14 < <%=CQ_Ans_14 %></div>
                                    <div class="us-msg-wrpr-q" runat="server" id="cq15" style="display:none;" >CQ 15 - <%=CQ_Ques_15 %></div>
                                    <div class="us-msg-wrpr-a" runat="server" id="cqans_15" style="display:none;" >CA 15 < <%=CQ_Ans_15 %></div>
                                    <div class="us-msg-wrpr-q" runat="server" id="cq16" style="display:none;" >CQ 16 - <%=CQ_Ques_16 %></div>
                                    <div class="us-msg-wrpr-a" runat="server" id="cqans_16" style="display:none;" >CA 16 < <%=CQ_Ans_16 %></div> 
                                    <div class="us-msg-wrpr-q" runat="server" id="cq31" style="display:none;" >CQ 31 - <%=CQ_Ques_31 %></div>
                                    <div class="us-msg-wrpr-a" runat="server" id="cqans_31" style="display:none;" >CA 31 < <%=CQ_Ans_31 %></div>
                                    <div class="us-msg-wrpr-q" runat="server" id="cq48" style="display:none;" >CQ 48 - <%=CQ_Ques_48 %></div>
                                    <div class="us-msg-wrpr-a" runat="server" id="cqans_48" style="display:none;" >CA 48 < <%=CQ_Ans_48 %></div>
                                  </div>
                                </td>
                              </tr>
                            </tbody></table>
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
      <%--6--%>
    <div class="certificate-wrpr">
        <div class="water-mark"><%=gtereportNo %></div>
          <table class="certificate-table" cellspacing="0" cellpadding="0">
              <tr>
                  <td>
                      <table cellspacing="0" cellpadding="0" class="first-row-table">
                          <tr class="first-row">
                              <td class="min-20">
                                  <img src="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/GTEReport/logo.png" class="cer-logo">
                              </td>
                              <td class="min-60">
                                  <span class="cer-ttl">Assessment Report</span>
                                  <span class="cer-sub-ttl">for Australian Genuine Student &</span>
                                  <span class="cer-sub-ttl">Genuine Temporary Entrant Criteria</span>
                              </td>
                              <td class="min-20">
                                  <div class="cer-flg-wrpr clearfix">
                                      <img src="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/GTEReport/flag.png" class="cer-flag">
                                  </div>
                              </td>
                          </tr>
                      </table>
                  </td>
              </tr>
              <tr>
                  <td>
                      <div class="cer-note-wrpr">
                           <span>NOTE:</span> This Assessment Report is privileged and confidential and generated for the exclusive use of <%=instutionname %>. Assessments are made subject to an assumption that: 1) Thecandidate’s responses were: a) truthful and honest b) accurate and correct; and 2. The candidate will be able to submit documentation to support all factual information provided in the assessment. View terms of use <a href="https://www.gtedirect.com/gte-ar-terms-of-use">https://www.gtedirect.com/gte-ar-terms-of-use</a> 
                      </div>
                  </td>
              </tr>
              <tr>
                  <td class="third-row-table-td">
                      <table class="third-row-table" cellspacing="0" cellpadding="0">
                          <tr>
                              <td class="third-row-label">CANDIDATE NO</td>
                              <td class="third-row-input"><%=candidateno %></td>
                              <td class="third-row-label">REPORT NO</td>
                              <td class="third-row-input"><%=gtereportNo %></td>
                              <td class="third-row-label">INSTITUTION NO</td>
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
                      <table cellpadding="0" cellspacing="0">
                          <tr>
                             <td class="lft-ttl">
                                   <img src="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/GTEReport/img/POTENTIAL_SITUATION_IN_AUSTRALIA.png">
                              </td>
                              <td>
                                  <table cellpadding="0" cellspacing="0">
                                      <tr>
                                          <td>
                                              <table cellpadding="0" cellspacing="0">
                                                  <tr>
                                                      <td>
                                                          <div class="sec-6-img">
                                                            <div class="section-ttle">
                                                                <img src="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/GTEReport/img/16_POTENTIAL_SITUATION_IN_AUSTRALIA.png">
                                                            </div>  
                                                          </div>

                                                      </td>
                                                      <td>
                                                          <div class="clearfix">
                                                              <div class="us-lvl-box">
                                                                  <div class="us-lvl-label">
                                                                      LEVEL OF RISK
                                                                  </div>
                                                                  <div class="<%= potentional_block_cls1 %>">
                                                                      <div class="us-lvl-box-inner-l">
                                                                          <%=potentional_score1 %>
                                                                      </div>
                                                                      <div class="us-lvl-box-inner-txt">
                                                                          <%=potentional_levelodrisk %>
                                                                      </div>
                                                                  </div>
                                                              </div>
                                                              <div class="us-lvl-box">
                                                                  <div class="us-lvl-label">
                                                                      SATISFACTION
                                                                  </div>
                                                                  <div class="<%=potentional_block_cls2 %>">
                                                                      <div class="us-lvl-box-inner-l">
                                                                          <%=potentional_score2 %>
                                                                      </div>
                                                                      <div class="us-lvl-box-inner-txt">
                                                                          <%=potentional_satisfaction %>
                                                                      </div>
                                                                  </div>
                                                              </div>
                                                              <div class="us-lvl-box">
                                                                  <div class="us-lvl-label">
                                                                      SEVERITY
                                                                  </div>
                                                                  <div class="<%=potentional_block_cls3 %>">
                                                                      <div class="us-lvl-box-inner-l">
                                                                          <%=potentional_score3 %>
                                                                      </div>
                                                                      <div class="us-lvl-box-inner-txt">
                                                                          <%= potentional_servity%>
                                                                      </div>
                                                                  </div>
                                                              </div>
                                                          </div>
                                                      </td>
                                                  </tr>
                                              </table>
                                          </td>
                                      </tr>
                                      <tr>
                                          <td>
                                              <table cellpadding="0" cellspacing="0">
                                                  <tbody>
                                                      <tr>
                                                          <td>
                                                              <div class="clearfix cd-info-box-wrpr cd-info-box-wrpr-1">
                                                                  <div class="<%=class16_1 %>">
                                                                      <div class="cd-info-ttl">CAN EXPLAIN WELL REASONS TO STUDY IN AUSTRALIA.</div>
                                                                      <div class="cd-info-subttl3"><%=AnswertoQuestion_18_Section3 %></div>
                                                                  </div>
                                                                  <div class="<%=class16_2 %>">
                                                                      <div class="cd-info-ttl">CAN EXPLAIN WELL REASONS TO STUDY SELECTED COURSE</div>
                                                                      <div class="cd-info-subttl3"><%=AnswertoQuestion_45_Section3 %></div>
                                                                  </div>
                                                                  <div class="<%=class16_3 %>">
                                                                      <div class="cd-info-ttl">CAN EXPLAIN WELL REASONS TO STUDY IN CHOSEN CITY </div>
                                                                      <div class="cd-info-subttl3"><%=AnswertoQuestion_19_Section3 %></div>
                                                                  </div>
                                                                  <div class="<%=class16_4 %>">
                                                                      <div class="cd-info-ttl">STUDIED A COURSE IN AUSTRALIA BEFORE</div>
                                                                      <div class="cd-info-subttl3"><%=AnswertoQuestion_8_Section3 %></div>
                                                                  </div>
                                                                  <div class="<%=class16_5 %>">
                                                                      <div class="cd-info-ttl">PARENTS RESIDE IN AUSTRALIA </div>
                                                                      <div class="cd-info-subttl3"><%=AnswertoQuestion_16_Section3 %></div>
                                                                  </div>
                                                                  <div class="<%=class16_6 %>">
                                                                      <div class="cd-info-ttl">WILL BE > 18 YEARS ON ARRIVAL IN AUSTRALIA </div>
                                                                      <div class="cd-info-subttl3"><%=AnswertoQuestion_3_Section3 %></div>
                                                                  </div>
                                                                  <div class="<%=class16_7 %>">
                                                                      <div class="cd-info-ttl">KNOW PEOPLE IN CITY CHOSEN FOR STUDIES</div>
                                                                      <div class="cd-info-subttl3"><%=AnswertoQuestion_47_Section3 %></div>
                                                                  </div>
                                                              </div>
                                                          </td>
                                                      </tr>

                                                  </tbody>
                                              </table>
                                          </td>
                                      </tr>
                                      <tr>
                                          <td>
                                              <table cellpadding="0" cellspacing="0">
                                                  <tbody>
                                                      <tr>
                                                          <td>
                                                              <div class="clearfix cd-info-box-wrpr">
                                                                  <div class="<%=class16_8 %>">
                                                                      <div class="cd-info-ttl">KNOW PEOPLE ALREADY STUDYING AT CHOSEN INSTITUTION</div>
                                                                      <div class="cd-info-subttl3"><%=AnswertoQuestion_48_Section3 %></div>
                                                                  </div>
                                                                  <div class="<%=class16_9 %>">
                                                                      <div class="cd-info-ttl">KNOW PEOPLE WHO PLAN TO STUDY AT CHOSEN INSTITUTION </div>
                                                                      <div class="cd-info-subttl3"><%=AnswertoQuestion_49_Section3 %></div>
                                                                  </div>
                                                                  <div class="<%=class16_10 %>">
                                                                      <div class="cd-info-ttl font7">REASON FOR SELECTING AUSTRALIA OVER OTHERS </div>
                                                                      <div class="cd-info-subttl34"> I have chosen to study in<%=CountryIamapplyingtoStudy %>  over other destinations because <%=AnswertoQuestion_11_Section2%></div>
                                                                  </div>
                                                                  <div class="<%=class16_11 %>">
                                                                      <div class="cd-info-ttl font7">PRIOR PERSONAL EXPERIENCE WITH AUSTRALIA</div>
                                                                      <div class="cd-info-subttl34"> My personal experience with <%=CountryIamapplyingtoStudy %> <%=AnswertoQuestion_10_Section2%></div>
                                                                  </div>
                                                                  <div class="<%=class16_12 %>">
                                                                      <div class="cd-info-ttl font7">REASON FOR SELECTING <%=instutionname %> </div>
                                                                      <div class="cd-info-subttl34">My decision to study at <%=instutionname %>is based on <%=AnswertoQuestion_12_Section2%></div>
                                                                  </div>
                                                              </div>
                                                          </td>
                                                      </tr>

                                                  </tbody>
                                              </table>
                                          </td>
                                      </tr>
                                      <tr>
                                          <td class="pb-15">
                                              <table cellpadding="0" cellspacing="0" width="100%">
                                                  <tbody>
                                                      <tr>
                                                          <td class="va-bottom usr-img-td pr-cmt-box">Clarification Questions
                                  <img src="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/GTEReport/user-msg.png">
                                                          </td>
                                                          <td>
                                                              <div class="us-msg-wrpr wid-593">
                                                                  <div id="cq9" class="us-msg-wrpr-q" style="display: none;" runat="server">CQ 9 - <%=CQ_Ques_9 %></div>
                                                                  <div id="cqans_9" class="us-msg-wrpr-a" style="display: none;" runat="server">CA 9 < <%=CQ_Ans_9 %></div>
                                                                  <div id="cq39" class="us-msg-wrpr-q" style="display: none;" runat="server">CQ 39 - <%=CQ_Ques_39 %></div>
                                                                  <div id="cqans_39" class="us-msg-wrpr-a" style="display: none;" runat="server">CA 39 < <%=CQ_Ans_39 %></div>
                                                                  <div id="cq40" class="us-msg-wrpr-q" style="display: none;" runat="server">CQ 40 - <%=CQ_Ques_40 %></div>
                                                                  <div id="cqans_40" class="us-msg-wrpr-a" style="display: none;" runat="server">CA 40 < <%=CQ_Ans_40 %></div>
                                                                  <div id="cq41" class="us-msg-wrpr-q" style="display: none;" runat="server">CQ 41 - <%=CQ_Ques_41 %></div>
                                                                  <div id="cqans_41" class="us-msg-wrpr-a" style="display: none;" runat="server">CA 41 < <%=CQ_Ans_41 %></div>
                                                                  <div id="cq42" class="us-msg-wrpr-q" style="display: none;" runat="server">CQ 42 - <%=CQ_Ques_42 %></div>
                                                                  <div id="cqans_42" class="us-msg-wrpr-a" style="display: none;" runat="server">CA 42 < <%=CQ_Ans_42 %></div>
                                                                  <div id="cq45" class="us-msg-wrpr-q" style="display: none;" runat="server">CQ 45 - <%=CQ_Ques_45 %></div>
                                                                  <div id="cqans_45" class="us-msg-wrpr-a" style="display: none;" runat="server">CA 45 < <%=CQ_Ans_45 %></div>
                                                              </div>
                                                          </td>
                                                      </tr>
                                                  </tbody>
                                              </table>
                                          </td>
                                      </tr>
                                      <tr>
                                          <td class="pb-15">
                                              <table cellpadding="0" cellspacing="0" width="100%">
                                                  <tbody>
                                                      <tr>
                                                         
                                                          <td>
                                                              <div class="us-msg-wrpr us-msg-wrpr-1 potentiaol-cmt-box">
                                                                  <div class="us-msg-wrpr-q"><%=RGcmnt_10 %></div>
                                                                  <div class="us-msg-wrpr-q"><%=RGcmnt_11 %></div>
                                                                  <div class="us-msg-wrpr-q"><%=RGcmnt_12 %></div>
                                                                  
                                                              </div>
                                                          </td>
                                                           <td class="va-bottom usr-img-td usr-img-td-1">Proctor's Comments
                                  <img src="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/GTEReport/img.png">
                                                          </td>
                                                      </tr>
                                                  </tbody>
                                              </table>
                                          </td>
                                      </tr>
                                  </table>
                              </td>
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
                      <table cellpadding="0" cellspacing="0">
                          <tbody><tr>
                              <td class="lft-ttl">
                                   <img src="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/GTEReport/img/PROTECTION.png">
                              </td>
                              <td>
                                  <table cellpadding="0" cellspacing="0">
                                      <tbody><tr>
                                          <td>
                                              <table cellpadding="0" cellspacing="0">
                                                  <tbody><tr>
                                                      <td>
                                                          <div class="sec-6-img">
                                                             <div class="section-ttle">
                                                                 <img src="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/GTEReport/img/17_PROTECTION_VISA_FILING_RISK.png">
                                                             </div> 
                                                          </div>

                                                      </td>
                                                      
                                                  </tr>
                                              </tbody></table>
                                          </td>
                                      </tr>
                                      <tr>
                                          <td class="pb-15">
                                              <table cellpadding="0" cellspacing="0" width="100%">
                                                  <tbody>
                                                      <tr>
                                                          <td class="va-bottom usr-img-td">
                                                              <img src="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/GTEReport/user-msg.png"><%=StudentName %>
                                                          </td>
                                                          <td>
                                                              <div class="us-msg-wrpr app-cmt-box">
                                                                  <b>The candidate has stated as <%=sectin3_46 %> the below statement:</b><br />
                                                                  <div>
                                                                      I am unwilling to return and stay in my home country due to a fear of being persecuted because of my race, religion, nationality, membership of a particular social group or political opinion. 
                                                                  </div>
                                                              </div>
                                                          </td>
                                                          <td>
                                                              <div class="<%=sec3_46_class %>">
                                                                  <div class="cd-info-ttl">PROTECTION VISA FILING RISK </div>
                                                                  <div class="cd-info-subttl3"><%=sectin3_46_Y_N%></div>
                                                              </div>
                                                          </td>
                                                      </tr>
                                                  </tbody>
                                              </table>
                                          </td>
                                      </tr>
                                  </tbody></table>
                              </td>
                          </tr>
                      </tbody></table>
                  </td>
            </tr>
              <tr>
                  <td class="cer-sep"><%--cer-sep pt-20--%>
                      <div></div>
                  </td>
              </tr>
              <tr>
                  <td>
                      <table cellpadding="0" cellspacing="0">
                          <tr>
                              <td class="lft-ttl">
                                  <img src="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/GTEReport/img/DOCUMENTS.png">
                                  <%--<div class="left-ttle">
                                      
                                  </div>--%>
                              </td>
                              <td>
                                  <table>

                                      <tr>
                                          <td colspan="2">
                                              <div class="sec-6-img cer-txt">
                                                  <div class="section-ttle"><img src="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/GTEReport/img/18_DOCUMENTS_REQUIRED.png"></div>
                                              </div>

                                          </td>
                                      </tr>
                                      <tr>
                                          <td class="us-msg-1">
                                              <div class="us-msg">
                                                  <b>Documents as evidence of Identity: </b>
                                                  <br />
                                                  <%=evidence_doc %>

                                                  <b>Documents as evidence of Previous Study and Gaps:</b><br />
                                                  <%=previoussttudy_gaps_doclist %>

                                                  <div runat="server" id="doc3">
                                                      <b>Documents as evidence of Value of the course </b>
                                                      <br />
                                                      <%=valude_doclist %>
                                                  </div>
                                              </div>
                                          </td>
                                          <td class="us-msg-2">
                                              <div class="us-msg">
                                                  <b>Documents as evidence of Situations in Home Country:</b><br />
                                                  <%=situationhomecountry_doclist %>

                                                  <div id="doc5" runat="server">
                                                      <b>Documents as evidence of Potential Situation in <%=CountryIamapplyingtoStudy %>: </b>
                                                      <br />
                                                      <%=potentionalsituation_doclist %>
                                                  </div>

                                                  <div id="doc6" runat="server">
                                                      <b>Documents as evidence of Immigration History: </b>
                                                      <br />
                                                      <%=immigration_doclist %>
                                                  </div>

                                                  <div id="doc7" runat="server">
                                                      <b>Documents as evidence of Knowledge of student visa requirements </b>
                                                      <br />
                                                      <%=knowledge_doclist %>
                                                  </div>
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
      </div>


          <div style="margin-left: 45%;">
              <asp:Button runat="server" ID="btnsave" OnClick="btnsave_Click" Text="Save" CssClass="btn btn-success" OnClientClick="return validateForm()"/>
          </div>
           <div style="display: none;" runat="server">
                <div class="modal" id="IELTS-modal" tabindex="-1" role="dialog">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="faq-modal-header modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            </div>
                            <div class="modal-body">
                                <div class=">
                                    <table border="1">
                                        <tr>
                                            <td>*Academic International English Language Testing System (IELTS)</td>
                                            <td>6.0 with no band below 6.0 for Reading and Writing and no band below 5.5 in Speaking and Listening</td>
                                        </tr>
                                        <tr>
                                            <td>*Cambridge Advanced English prior to January 2015 (CAE)</td>
                                            <td>52 with no section less than Borderline</td>
                                        </tr>
                                        <tr>
                                            <td>*Cambridge Advanced English after January 2015 (CAE)</td>
                                            <td>169 with no band below 162</td>
                                        </tr>
                                        <tr>
                                            <td>*Pearson Test of English (PTE)</td>
                                            <td>54 with no band below 46</td>
                                        </tr>
                                        <tr>
                                            <td>*Test of English as a Foreign Language - IBT (TOEFL IBT)</td>
                                            <td>73 with no band less than 16</td>
                                        </tr>
                                        <tr>
                                            <td>* *Test of English as a Foreign Language - Paper Based (TOEFL - Paper Based)</td>
                                            <td>534 (Test of Written English 4.0)</td>
                                        </tr>
                                        <tr>
                                            <td>Occupational English Test (OET)</td>
                                            <td>OET with a minimum of C in the four components</td>
                                        </tr>
                                        <tr>
                                            <td>Special Tertiary Admissions Test (STAT)</td>
                                            <td>Written English Score 140</td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
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
      <script>
             $('#lblClick').click(function () {
                var IELTSModal = $('#IELTS-modal');
                $('body').append(IELTSModal);
                $('#IELTS-modal').modal('show');
          });

           $(document).ready(function () {
           
            new QRCode(document.getElementById("qrcode"), "<%=webURL%>gte_ReportN.aspx?CID=<%=CID%>");
                 
          });
          $(document).ready(function () {
           
            new QRCode(document.getElementById("qrcode1"), "<%=VerificationvideoURL%>");
                 
          });
           
     function validateForm() {          
            var flag = false;
            if ($("#<%=ddlrecommended.ClientID%>").val() == "0")
                alert("Please select recommendation");
            
            else
                flag = true;
            return flag;
     }
      </script>
        </form>
  </body>
</html>