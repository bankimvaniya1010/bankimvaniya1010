<%@ Page Language="C#" AutoEventWireup="true" CodeFile="manageapplicant.aspx.cs" Inherits="admin_manageapplicant" MasterPageFile="~/admin/admin.master" %>

<asp:Content ID="content1" runat="server" ContentPlaceHolderID="head">
    <link type="text/css" href="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/manage_application/style.css" rel="stylesheet">

    <script>
         function ConfirmOnResend(item) {
            var txt;
            var person = prompt("Please enter your password :", "");
            if (person == "") {
                alert("Please enter password");
                return false;
            }
            else if (person == null)
                return false;
            else {
                txt =  person ;
            }
            $("#<%= Hidpassword.ClientID%>").val(txt).html(txt);
         }
    </script>
</asp:Content>
<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" ID="conten1" runat="server">   
  
    <div class="container page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">Manage Applications</li>
        </ol>       

        <div class="card">
             <asp:HiddenField runat="server" ID="Hidpassword"/>        
            <div class="row">
            <div class="col-lg-6 col-12">
                <div class="pg-title">
                     <asp:Button runat="server" ID="btnback" OnClick="btnback_Click" Text="<< Back to Applicant List" CssClass="btn btn-success pre_btn"/>
                </div>
                <%--<div class="bk-app-list"><img src="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/manage_application/back.png"><span>Back to <br>Applicants List</span></div>    --%>
            </div>
            
            <div class="col-lg-6 col-12 mrgntop">
                <div class="search-bar" style="width:230px">
                    <asp:DropDownList ID="ddlapplicant" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlapplicant_SelectedIndexChanged" CssClass="form-control"></asp:DropDownList>
                    <%--<input type="text">
                    <button><img src="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/manage_application/search-icon.png"></button>--%>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-12">
                <div class="nxt-prv-bnt-wrpr mrgntop">
                    <div class="pre-nxt-btn" id="divPrev" runat="server">
                        <asp:Button runat="server" ID="btnprevious" OnClick="btnprevious_Click" Text="<< Previous" CssClass="btn btn-success pre_btn"/><%-- pre_btn--%>
                    </div>
                    <div class="pre-nxt-btn" runat="server" id="divnext">
                        <asp:Button runat="server" ID="btnnext" OnClick="btnnext_Click" Text="Next >>" CssClass="btn btn-success pre_btn"/>
                    </div>
<%--                    <div class="pre-nxt-btn"><img src="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/manage_application/previous.png"></div>
                    <div class="pre-nxt-btn"><img src="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/manage_application/next.png"></div>--%>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-6 col-12">
                <div class="app-id-wrpr">
                    <div class="app-id-txt">Applicant ID</div>
                    <div class="app-id-no"><%=ApplicantID %></div>
                </div>
                <div class="stp-icon-wrpr">
                    <img src="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/manage_application/stp.png">
                    <div class="clearfix">
                        <div class="stp-date"><%=RegisteredDate %></div>
                        <div class="stp-date"><%=assessment_date %></div>
                        <div class="stp-date"><%=report_date %></div>
                    </div>
                </div>
            </div>
            <div class="col-lg-6 col-12">
                <div class="clearfix text-center">
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
                    <div class="recm-caaut-wrpr" id="recommDiv" runat="server">
                      <img src="<%=recommendedwithcaution%>">
                      <div class="recm-caaut-txt">
                        <%=recommendtionText%>
                      </div>
                    </div>
                  </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-7 col-12">
                <table cellpadding="0" cellspacing="0" class="frm-tab-cer">
                    <tbody><tr>
                       <td>
                           <table cellpadding="0" cellspacing="0" class="frm-tab-cer-inner frm-tab-cer-inner-1">
                               <tbody><tr>
                                   <td class="third-row-label">FAMILY NAME</td>
                                   <td class="third-row-input">
                                    <input type="text" name="" disabled="disabled" value=" <%=familyname %>">
                                      
                                   </td>
                               </tr>
                           </tbody></table>
                       </td>
                    </tr>
                    <tr>
                       <td>
                           <table cellpadding="0" cellspacing="0" class="frm-tab-cer-inner frm-tab-cer-inner-1">
                               <tbody><tr>
                                   <td class="third-row-label">FIRST NAME</td>
                                   <td class="third-row-input">
                                    <input type="text" name="" disabled="disabled" value=" <%=firstname %>">
                                      
                                   </td>
                               </tr>
                           </tbody></table>
                       </td>
                    </tr>
                    <tr>
                       <td>
                           <table cellpadding="0" cellspacing="0" class="frm-tab-cer-inner frm-tab-cer-inner-1">
                               <tbody><tr>
                                   <td class="third-row-label">MIDDLE NAME/S</td>
                                   <td class="third-row-input">
                                    <input type="text" name="" disabled="disabled" value=" <%=middlename %>">
                                      
                                   </td>
                               </tr>
                           </tbody></table>
                       </td>
                    </tr>
                    <tr>
                       <td>
                           <table cellpadding="0" cellspacing="0" class="frm-tab-cer-inner frm-tab-cer-inner-2">
                               <tbody><tr>
                                   <td class="third-row-label">DATE OF BIRTH</td>
                                   <td class="third-row-input">
                                    <input type="text" name="" disabled="disabled" value="<%=dateofbirth %>">
                                       
                                   </td>
                                   <td class="third-row-label third-row-label-g">GENDER</td>
                                   <td class="third-row-input">
                                    <input type="text" name="" disabled="disabled" value="<%=gender %>">
                                       
                                   </td>
                               </tr>
                           </tbody></table>
                       </td>
                    </tr>
                    <tr>
                       <td>
                           <table cellpadding="0" cellspacing="0" class="frm-tab-cer-inner frm-tab-cer-inner-1">
                               <tbody><tr>
                                   <td class="third-row-label">COUNTRY OF RESIDENCE</td>
                                   <td class="third-row-input">
                                    <input type="text" name="" disabled="disabled" value="<%=countryofresidence %>">
                                   </td>
                               </tr>
                           </tbody></table>
                       </td>
                    </tr>
                    <tr>
                       <td>
                           <table cellpadding="0" cellspacing="0" class="frm-tab-cer-inner frm-tab-cer-inner-1">
                               <tbody><tr>
                                   <td class="third-row-label">PASSPORT NO.</td>
                                   <td class="third-row-input">
                                    <input type="text" name="" disabled="disabled" value="<%=passportno %>">
                                     
                                   </td>
                               </tr>
                           </tbody></table>
                       </td>
                    </tr>
                    <tr>
                       <td>
                           <table cellpadding="0" cellspacing="0" class="frm-tab-cer-inner frm-tab-cer-inner-1">
                               <tbody><tr>
                                   <td class="third-row-label">NATIONALITY</td>
                                   <td class="third-row-input">
                                    <input type="text" name="" disabled="disabled" value="<%=nationality %>">
                                     
                                   </td>
                               </tr>
                           </tbody></table>
                       </td>
                    </tr>
                    <tr>
                       <td>
                           <table cellpadding="0" cellspacing="0" class="frm-tab-cer-inner frm-tab-cer-inner-1">
                               <tbody><tr>
                                   <td class="third-row-label">INSTITUTION APPLIED</td>
                                   <td class="third-row-input">
                                    <input type="text" name="" disabled="disabled" value="<%=institutionapplied %>">
                                       
                                   </td>
                               </tr>
                           </tbody></table>
                       </td>
                    </tr>
                    <tr> 
                       <td>
                           <table cellpadding="0" cellspacing="0" class="frm-tab-cer-inner frm-tab-cer-inner-1">
                               <tbody><tr>
                                   <td class="third-row-label">COURSE APPLIED</td>
                                   <td class="third-row-input">
                                    <input type="text" name="" disabled="disabled" value="<%=courseapplied %>">
                                  
                                   </td>
                               </tr>
                           </tbody></table>
                       </td>
                    </tr>
                    <tr> 
                       <td>
                           <table cellpadding="0" cellspacing="0" class="frm-tab-cer-inner frm-tab-cer-inner-1">
                               <tbody><tr>
                                   <td class="third-row-label">PACKAGE APPLIED</td>
                                   <td class="third-row-input">
                                    <input type="text" name="" disabled="disabled" value="<%=packagapplied %>">
                                       
                                   </td>
                               </tr>
                           </tbody></table>
                       </td>
                    </tr>
                  <%--  <tr> 
                       <td>
                           <table cellpadding="0" cellspacing="0" class="frm-tab-cer-inner frm-tab-cer-inner-1">
                               <tbody><tr>
                                   <td class="third-row-label">FACILITATING AGENT</td>
                                   <td class="third-row-input">
                                    <input type="text" name="" disabled="disabled" value="<%=facilitingagent %>">
                                       
                                   </td>
                               </tr>
                           </tbody></table>
                       </td>
                    </tr>--%>
                </tbody>
            </table>
            </div>
            <div class="col-lg-5 col-12">
                <div class="row ul-img-wrpr">
                    <div class="col-lg-5 col-12" id="divProfile" runat="server">
                        <img src="<%= profileURL%>" class="img-fluid">
                    </div>
                    <div class="col-lg-7 col-12">
                        <div class="app-id-no text-center"><%=gtereportNo %></div>

                        <div class="rgt-btn-wrpr rgt-btn-wrpr-icon">
                            <img src="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/manage_application/ml-us-icon.png"><a href="<%=feedbackURL %>" style="color: black">GTE REPORT
                                <br>
                                FEEDBACK</a>
                        </div>      
                         <div class="rgt-btn-wrpr" id="divCounsellor1" runat="server" style="display:block;">
                            <asp:Button runat="server" CssClass="managepg_btn" ID="btncounsellor" OnClick="btncounsellor_Click" Text="Counsellor Report" />
                        </div>
                        <div class="rgt-btn-wrpr" id="div2" runat="server">
                            <asp:Button runat="server" CssClass="managepg_btn" ID="Button1" OnClick="btndocreminder_Click" Text="Documents reminder" />
                        </div>
                        <div class="rgt-btn-wrpr" id="div3" runat="server">
                            <asp:Button runat="server" CssClass="managepg_btn" ID="btnfinalreport" OnClick="btnfinalreport_Click" Text="Send Final Report" />
                        </div>
                        <div class="rgt-btn-wrpr">
                            <div class="managepg_btn" id="Label7" runat="server" visible="false">Reset Done</div>
                        </div>
                        <div class="rgt-btn-wrpr" id="btnresendotpDiv" runat="server">
                            <asp:Button runat="server" CssClass="managepg_btn" ID="btnresendotp" OnClick="btnresendotp_Click" Text="Resend OTP to Applicant" OnClientClick="return ConfirmOnResend()" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
           
        <div class="row btm-info-img-row">
            <div class="col-12">                
               <div class="btm-info-img-wrpr">                   
                   <a href="<%=personaldetailLink %>" target="_blank"><img src="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/manage_application/pr-dt.png"></a>
               </div>
               <div class="btm-info-img-wrpr" id="certificateLinkDiv" runat="server">
                   <asp:Button runat="server" ID="btncertificate" OnClick="btncertificate_Click" Text="Certificate" Visible="false"/>
                  <a href="<%=certificateLink %>" target="_blank"><img src="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/manage_application/cr-ud.png"></a>
               </div>
               <div class="btm-info-img-wrpr" id="sopDiv" runat="server">
                   <asp:Button runat="server" ID="btnsop" OnClick="btnsop_Click" Text="SOP" Visible="false"/>
                   <a href="<%=sopReportLink %>" target="_blank"><img src="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/manage_application/st-pr.png"></a>
               </div> 
               <div class="btm-info-img-wrpr" id="certificateDiv" runat="server">
                   <asp:Button runat="server" ID="btngte" OnClick="btngte_Click" Text="GTE REport" Visible="false"/>
                   <a href="<%=gtereportLink %>" target="_blank"><img src="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/manage_application/fn-sg.png"></a>
               </div>
                 <div class="btm-info-img-wrpr" id="DivCounsellor" runat="server" visible="false">
                   <a href="<%=counsellorLink %>" target="_blank"><img src="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/manage_application/st-pr.png"></a>
               </div> 
               <div class="btm-info-img-wrpr">
                   <a href="<%=verificationLink %>" target="_blank"><img src="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/manage_application/pro-rep.png"></a>
               </div>
               <div class="btm-info-img-wrpr">
                  <a href="<%=applicantdocLink %>" target="_blank"> <img src="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/manage_application/app-doc.png"></a>
               </div>
                <div class="btm-info-img-wrpr" id="decalarationDiv" runat="server">
                  <a href="<%=applicantdeclarationLink %>" target="_blank"> <img src="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/manage_application/AD.png"></a>
               </div>
            </div>
        </div>
        <div class="row" style="display:none;">
            <div class="col-12">
                <div class="apll-doc-txt">Applicant Documents</div>
                <div class="app-qus-anw-wrpr">
                    <div class="app-qus-anw-ttl">DOCUMENTS REQUESTED</div>
                    <div class="app-qus-anw-q">Documents as evidence of Identity:</div>
                    <div class="app-qus-anw-a"><span class="app-qus-anw-yes">YES</span>Copy of the bio page of passport</div>
                    <div class="app-qus-anw-a"><span class="app-qus-anw-yes">YES</span>Certified copy of birth certificate</div>
                    <div class="app-qus-anw-a"><span class="app-qus-anw-no">NO</span>Copy of Drivers Licence</div>
                    <div class="app-qus-anw-a"><span class="app-qus-anw-no">NO</span>Copy of National Identity Card</div>
                </div>
            </div>
        </div>
        </div>
    </div>
    <script>
        $(document).ready(function () {
            $('.sidebar-menu-item').removeClass('open');
            $('#managetooltips_list').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#admintooltipslisting').addClass('active');
        });
    </script>
</asp:Content>

