<%@ Page Language="C#" AutoEventWireup="true" CodeFile="view_gteapplicantdocuments.aspx.cs" Inherits="admin_view_gteapplicantdocuments" MasterPageFile="~/admin/admin.master" %>

<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">


    <div class="container-fluid page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">View Applicants Documnets 

            </li>
        </ol>
        <table>
            <tr>
                <td><h1 class="h2">View Applicants Documents        </h1></td>
                <td><div style="margin-left: 200%;"><asp:Button id="backNavLink" runat="server" class="btn btn-success" Text="Back to Manage " onclick="backNavLink_Click"/></div></td>
            </tr>
        </table>
    </div>
    <div class="page ">
        <div class="container page__container">
            <div class="row">
                <div class="col-md-12">
                    <div class="">
                        <div class="">
                            <asp:Panel ID="pnl" runat="server">
                                <div class="tab-pane active" id="first" runat="server" style="display:none;">


                                    <h5 class="doch5">Please find attached the following documents as evidence of my <b>Identity</b>:</h5>
                                    <ul>
                                        <li>
                                            <div runat="server" id="question1">
                                                <div class="form-group m-0" role="group" aria-labelledby="label-dob">
                                                    <div class="form-row">
                                                        <asp:HiddenField runat="server" ID="question_1" Value="183" />
                                                       <asp:Label ID="lbl_183" runat="server" Text="NO" CssClass="clslbl" style="color:red;"/>  <label id="Label1" runat="server" for="dateofissue" class="col-md-6 col-form-label form-label" style="margin-left: 18px;" >Copy of the bio page of my passport</label>
                                                        <div class="col-md-5">
                                                            <asp:HiddenField ID="hidDocumentPath_question183" runat="server" />
                                                            <asp:HyperLink runat="server" ID="HyperLink_question183" Target="_blank"></asp:HyperLink>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <br />
                                        </li>
                                        <li>
                                            <div runat="server" id="question2">
                                                <div class="form-group m-0" role="group" aria-labelledby="label-dob">
                                                    <div class="form-row">
                                                        <asp:HiddenField runat="server" ID="question_2" Value="184" />
                                                        <asp:Label ID="lbl_184" runat="server" Text="NO" CssClass="clslbl" style="color:red;"/> <label id="Label2" runat="server" for="dateofissue" class="col-md-6 col-form-label form-label" style="margin-left: 18px;">Certified copy of my birth certificate</label>
                                                        <div class="col-md-5">
                                                            <asp:HiddenField ID="HidDocPath_question184" runat="server" />
                                                            <asp:HyperLink runat="server" ID="HyperLink_question184" Target="_blank"></asp:HyperLink>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <br />
                                        </li>
                                        <li>
                                            <div runat="server" id="question3">
                                                <div class="form-group m-0" role="group" aria-labelledby="label-dob">
                                                    <div class="form-row">
                                                        <asp:HiddenField runat="server" ID="question_3" Value="185" />
                                                        <asp:Label ID="lbl_185" runat="server" Text="NO" CssClass="clslbl" style="color:red;"/> <label id="Label5" runat="server" for="dateofissue" class="col-md-6 col-form-label form-label" style="margin-left: 18px;">Copy of my Drivers Licence</label>
                                                        <div class="col-md-5">
                                                            <asp:HiddenField ID="HidDocPath_question185" runat="server" />
                                                            <asp:HyperLink runat="server" ID="HyperLink_question185" Target="_blank"></asp:HyperLink>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <br />
                                        </li>
                                        <li>
                                            <div runat="server" id="question4">
                                                <div class="form-group m-0" role="group" aria-labelledby="label-dob">
                                                    <div class="form-row">
                                                        <asp:HiddenField runat="server" ID="question_4" Value="186" />
                                                        <asp:Label ID="lbl_186" runat="server" Text="NO" CssClass="clslbl" style="color:red;"/> <label id="Label8" runat="server" for="dateofissue" class="col-md-6 col-form-label form-label" style="margin-left: 18px;">Copy of my National Identity Card</label>
                                                        <div class="col-md-5">
                                                            <asp:HiddenField ID="HidDocPath_question186" runat="server" />
                                                            <asp:HyperLink runat="server" ID="HyperLink_question186" Target="_blank"></asp:HyperLink>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <br />
                                        </li>
                                    </ul>
                                    <h5 class="doch5">Please find attached the following documents as evidence of my <b>Previous Study and Gaps</b>:</h5>
                                    <ul>
                                        <li>
                                            <div runat="server" id="question5">
                                                <div class="form-group m-0" role="group" aria-labelledby="label-dob">
                                                    <div class="form-row">
                                                        <asp:HiddenField runat="server" ID="question_5" Value="188" />
                                                       <asp:Label ID="lbl_188" runat="server" Text="NO" CssClass="clslbl" style="color:red;"/>  <label id="Label11" runat="server" for="dateofissue" class="col-md-6 col-form-label form-label" style="margin-left: 18px;">Copies of my Education Certificate(s) (Degree, Diploma etc.)</label>
                                                        <div class="col-md-5">
                                                            <asp:HiddenField ID="HidDocPath_question188" runat="server" />
                                                            <asp:HyperLink runat="server" ID="HyperLink_question188" Target="_blank"></asp:HyperLink>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <br />
                                        </li>
                                        <li>
                                            <div runat="server" id="question6">
                                                <div class="form-group m-0" role="group" aria-labelledby="label-dob">
                                                    <div class="form-row">
                                                        <asp:HiddenField runat="server" ID="question_6" Value="189" />
                                                        <asp:Label ID="lbl_189" runat="server" Text="NO" CssClass="clslbl" style="color:red;"/> <label id="Label14" runat="server" for="dateofissue" class="col-md-6 col-form-label form-label" style="margin-left: 18px;">Certified copies of my academic transcripts from previous studies</label>
                                                        <div class="col-md-5">
                                                            <asp:HiddenField ID="HidDocPath_question189" runat="server" />
                                                            <asp:HyperLink runat="server" ID="HyperLink_question189" Target="_blank"></asp:HyperLink>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <br />
                                        </li>
                                        <li>
                                            <div runat="server" id="question7">
                                                <div class="form-group m-0" role="group" aria-labelledby="label-dob">
                                                    <div class="form-row">
                                                        <asp:HiddenField runat="server" ID="question_7" Value="190" />
                                                       <asp:Label ID="lbl_190" runat="server" Text="NO" CssClass="clslbl" style="color:red;"/>  <label id="Label17" runat="server" for="dateofissue" class="col-md-6 col-form-label form-label" style="margin-left: 18px;">The most recent copy of my curriculum vitae or resume</label>
                                                        <div class="col-md-5">
                                                            <asp:HiddenField ID="HidDocPath_question190" runat="server" />
                                                            <asp:HyperLink runat="server" ID="HyperLink_question190" Target="_blank"></asp:HyperLink>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <br />
                                        </li>
                                    </ul>
                                    <div id="EmploymentandValueofthecoursetomyfuture" runat="server" style="display: none;">
                                        <h5 class="doch5">Please find attached the following documents as evidence of my <b>Employment and Value of the course to my future</b>:</h5>
                                        <ul>
                                            <li>
                                                <div runat="server" id="question8">
                                                    <div class="form-group m-0" role="group" aria-labelledby="label-dob">
                                                        <div class="form-row">
                                                            <asp:HiddenField runat="server" ID="question_8" Value="193" />
                                                           <asp:Label ID="lbl_193" runat="server" Text="NO" CssClass="clslbl" style="color:red;"/>  <label id="Label20" runat="server" for="dateofissue" class="col-md-6 col-form-label form-label" style="margin-left: 18px;">Proof of Current Employment </label>
                                                            <div class="col-md-5">
                                                                <asp:HiddenField ID="HidDocPath_question193" runat="server" />
                                                                <asp:HyperLink runat="server" ID="HyperLink_question193" Target="_blank"></asp:HyperLink>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <br />
                                            </li>
                                            <li>
                                                <div runat="server" id="question9">
                                                    <div class="form-group m-0" role="group" aria-labelledby="label-dob">
                                                        <div class="form-row">
                                                            <asp:HiddenField runat="server" ID="question_9" Value="194" />
                                                            <asp:Label ID="lbl_194" runat="server" Text="NO" CssClass="clslbl" style="color:red;"/> <label id="Label23" runat="server" for="dateofissue" class="col-md-6 col-form-label form-label" style="margin-left: 18px;">Proof of Future Employment or Employment Opportunities</label>
                                                            <div class="col-md-5">
                                                                <asp:HiddenField ID="HidDocPath_question194" runat="server" />
                                                                <asp:HyperLink runat="server" ID="HyperLink_question194" Target="_blank"></asp:HyperLink>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <br />
                                            </li>
                                        </ul>
                                    </div>
                                    <h5 class="doch5">Please find attached the following documents as evidence of my <b>Ties to & Situations in Home Country or Country of Residence</b>:</h5>
                                    <ul>
                                        <li>
                                            <div runat="server" id="question10">
                                                <div class="form-group m-0" role="group" aria-labelledby="label-dob">
                                                    <div class="form-row">
                                                        <asp:HiddenField runat="server" ID="question_10" Value="196" />
                                                       <asp:Label ID="lbl_196" runat="server" Text="NO" CssClass="clslbl" style="color:red;"/>  <label id="Label26" runat="server" for="dateofissue" class="col-md-6 col-form-label form-label" style="margin-left: 18px;">Evidence that my spouse/parents/sponsor are willing to support me and they have an annual income of at least AUD 73,000  </label>
                                                        <div class="col-md-5">
                                                            <asp:HiddenField ID="HidDocPath_question196" runat="server" />
                                                            <asp:HyperLink runat="server" ID="HyperLink_question196" Target="_blank"></asp:HyperLink>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <br />
                                        </li>
                                        <li>
                                            <div runat="server" id="question11">
                                                <div class="form-group m-0" role="group" aria-labelledby="label-dob">
                                                    <div class="form-row">
                                                        <asp:HiddenField runat="server" ID="question_11" Value="197" />
                                                        <asp:Label ID="lbl_197" runat="server" Text="NO" CssClass="clslbl" style="color:red;"/> <label id="Label29" runat="server" for="dateofissue" class="col-md-6 col-form-label form-label" style="margin-left: 18px;">Bank statement with sufficient funds to cover my travel costs and 12 months of living and tuition fees for me and any accompanying family members and school costs for any school aged dependants</label>
                                                        <div class="col-md-5">
                                                            <asp:HiddenField ID="HiddDocPath_question197" runat="server" />
                                                            <asp:HyperLink runat="server" ID="HyperLink_question197" Target="_blank"></asp:HyperLink>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <br />
                                        </li>

                                        <li>
                                            <div runat="server" id="question12">
                                                <div class="form-group m-0" role="group" aria-labelledby="label-dob">
                                                    <div class="form-row">
                                                        <asp:HiddenField runat="server" ID="question_12" Value="198" />
                                                       <asp:Label ID="lbl_198" runat="server" Text="NO" CssClass="clslbl" style="color:red;"/> <label id="Label32" runat="server" for="dateofissue" class="col-md-6 col-form-label form-label" style="margin-left: 18px;">Evidence of ownership of assets in home country or country of residence</label>
                                                        <div class="col-md-5">
                                                            <asp:HiddenField ID="HidDocPath_question198" runat="server" />
                                                            <asp:HyperLink runat="server" ID="HyperLink_question198" Target="_blank"></asp:HyperLink>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <br />
                                        </li>
                                    </ul>
                                    <div id="PotentialSituation" runat="server" style="display: none;">
                                        <h5 class="doch5">Please find attached the following documents as evidence of my <b>Potential Situation in <%=Country_I_am_applying_to_Study %></b>:</h5>

                                        <div runat="server" id="question13">
                                            <ul>
                                                <li>
                                                    <div class="form-group m-0" role="group" aria-labelledby="label-dob">
                                                        <div class="form-row">
                                                            <asp:HiddenField runat="server" ID="question_13" Value="200" />
                                                           <asp:Label ID="lbl_200" runat="server" Text="NO" CssClass="clslbl" style="color:red;"/>  <label id="Label35" runat="server" for="dateofissue" class="col-md-6 col-form-label form-label" style="margin-left: 18px;">A certified copy of my marriage certificate</label>
                                                            <div class="col-md-5">
                                                                <asp:HiddenField ID="HidDocPath_question200" runat="server" />
                                                                <asp:HyperLink runat="server" ID="HyperLink_question200" Target="_blank"></asp:HyperLink>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </li>
                                            </ul>
                                            <br />
                                        </div>
                                        <div runat="server" id="question14">
                                            <ul>
                                                <li>
                                                    <div class="form-group m-0" role="group" aria-labelledby="label-dob">
                                                        <div class="form-row">
                                                            <asp:HiddenField runat="server" ID="question_14" Value="201" />
                                                            <asp:Label ID="lbl_201" runat="server" Text="NO" CssClass="clslbl" style="color:red;"/>  <label id="Label38" runat="server" for="dateofissue" class="col-md-6 col-form-label form-label" style="margin-left: 18px;">Evidence of my relationship with my de facto partner</label>
                                                            <div class="col-md-5">
                                                                <asp:HiddenField ID="HidDocPath_question201" runat="server" />
                                                                <asp:HyperLink runat="server" ID="HyperLink_question201" Target="_blank"></asp:HyperLink>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </li>
                                            </ul>
                                            <br />
                                        </div>
                                        <div runat="server" id="question15">
                                            <ul>
                                                <li>
                                                    <div class="form-group m-0" role="group" aria-labelledby="label-dob">
                                                        <div class="form-row">
                                                            <asp:HiddenField runat="server" ID="question_15" Value="202" />
                                                            <asp:Label ID="lbl_202" runat="server" Text="NO" CssClass="clslbl" style="color:red;"/> <label id="Label41" runat="server" for="dateofissue" class="col-md-6 col-form-label form-label" style="margin-left: 18px;">Certified copies of the birth certificates of my children</label>
                                                            <div class="col-md-5">
                                                                <asp:HiddenField ID="HidDocPath_question202" runat="server" />
                                                                <asp:HyperLink runat="server" ID="HyperLink_question202" Target="_blank"></asp:HyperLink>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </li>
                                            </ul>
                                            <br />
                                        </div>
                                        <div runat="server" id="question16">
                                            <ul>
                                                <li>
                                                    <div class="form-group m-0" role="group" aria-labelledby="label-dob">
                                                        <div class="form-row">
                                                            <asp:HiddenField runat="server" ID="question_16" Value="203" />
                                                           <asp:Label ID="lbl_203" runat="server" Text="NO" CssClass="clslbl" style="color:red;"/>  <label id="Label44" runat="server" for="dateofissue" class="col-md-6 col-form-label form-label" style="margin-left: 18px;">Proof of address of parents who reside in Australia</label>
                                                            <div class="col-md-5">
                                                                <asp:HiddenField ID="HidDocPath_question203" runat="server" />
                                                                <asp:HyperLink runat="server" ID="HyperLink_question203" Target="_blank"></asp:HyperLink>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </li>
                                            </ul>
                                            <br />
                                        </div>
                                    </div>
                                    <div id="ImmigrationHistory" runat="server" style="display: none;">
                                        <h5 class="doch5">Please find attached the following documents as evidence of my <b>Immigration History</b>:</h5>

                                        <div runat="server" id="question17">
                                            <ul>
                                                <li>
                                                    <div class="form-group m-0" role="group" aria-labelledby="label-dob">
                                                        <div class="form-row">
                                                            <asp:HiddenField runat="server" ID="question_17" Value="205" />
                                                           <asp:Label ID="lbl_205" runat="server" Text="NO" CssClass="clslbl" style="color:red;"/>  <label id="Label47" runat="server" for="dateofissue" class="col-md-6 col-form-label form-label" style="margin-left: 18px;">Evidence of the current visa I have for <%=Country_I_am_applying_to_Study %></label>
                                                            <div class="col-md-5">
                                                                <asp:HiddenField ID="HidDocPath_question205" runat="server" />
                                                                <asp:HyperLink runat="server" ID="HyperLink_question205" Target="_blank"></asp:HyperLink>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </li>
                                            </ul>
                                            <br />
                                        </div>
                                        <div runat="server" id="question18">
                                            <ul>
                                                <li>
                                                    <div class="form-group m-0" role="group" aria-labelledby="label-dob">
                                                        <div class="form-row">
                                                            <asp:HiddenField runat="server" ID="question_18" Value="206" />
                                                            <asp:Label ID="lbl_206" runat="server" Text="NO" CssClass="clslbl" style="color:red;"/> <label id="Label50" runat="server" for="dateofissue" class="col-md-6 col-form-label form-label" style="margin-left: 18px;">Details of Immigration History</label>
                                                            <div class="col-md-5">
                                                                <asp:HiddenField ID="HidDocPath_question206" runat="server" />
                                                                <asp:HyperLink runat="server" ID="HyperLink_question206" Target="_blank"></asp:HyperLink>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </li>
                                            </ul>
                                            <br />
                                        </div>
                                    </div>
                                    <div id="visarequirements" runat="server" style="display: none;">
                                        <h5 class="doch5">Please find attached the following documents as evidence of my <b>Knowledge of student visa requirements and conditions for <%=Country_I_am_applying_to_Study %></b>:</h5>

                                        <div runat="server" id="question19">
                                            <ul>
                                                <li>
                                                    <div class="form-group m-0" role="group" aria-labelledby="label-dob">
                                                        <div class="form-row">                                                            
                                                            <asp:HiddenField runat="server" ID="question_19" Value="208" />
                                                            <asp:Label ID="lbl_208" runat="server" Text="NO" CssClass="clslbl" style="color:red;"/> <label id="Label53" runat="server" for="dateofissue" class="col-md-6 col-form-label form-label" style="margin-left: 18px;"> Copy of the independently verified GTE Certification Test Certificate</label>
                                                            <div class="col-md-5">
                                                                <asp:HiddenField ID="HidDocPath_question208" runat="server" />
                                                                <asp:HyperLink runat="server" ID="HyperLink_question208" Target="_blank"></asp:HyperLink>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </li>
                                            </ul>
                                            <br />
                                        </div>
                                    </div>
                                </div>
                            </asp:Panel>
                             <div class="list-group-item" runat="server" id="doclist" style="display:none;">
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