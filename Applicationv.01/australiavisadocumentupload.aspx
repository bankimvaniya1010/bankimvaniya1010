<%@ Page Language="C#" AutoEventWireup="true" CodeFile="australiavisadocumentupload.aspx.cs" Inherits="australiavisadocumentupload" MasterPageFile="~/student.master"%>

<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">


     <div class="container-fluid page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">Upload Document</li>
        </ol>
        <h1 class="h2">UPLOAD DOCUMENT</h1>
    </div>

     <div class="page ">
        <div class="container page__container">
            <div class="row">
                <div class="col-md-8">

                     <div class="card">
                        <ul class="nav nav-tabs nav-tabs-card" style="background:#fff;border-bottom:0;">
                            <li class="nav-item" style="font-weight:bold">
                                <a class="nav-link active" href="#first" data-toggle="tab">Visa - Documentary Evidence List</a>
                            </li>
                        </ul>
                        <div class="tab-content card-body">
                            <div class="tab-pane active" id="first">
                                                     
                                <div class="form-group row" id="identitydoc" runat="server">
                                    <label for="identitydoc" id="lblidentitydoc" runat="server" class="col-sm-12"><b>1)</b> Attach a copy of Evidence of your identity</label>
                                    <div class="col-sm-12">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <asp:DropDownList runat="server" ID="ddlidentity">
                                                    <asp:ListItem Value="0" Selected="True">Please select</asp:ListItem>
                                                    <asp:ListItem Value="Passport">Passport</asp:ListItem>
                                                    <asp:ListItem Value="birth Certificate">Certified copy of birth Certificate</asp:ListItem>
                                                    <asp:ListItem Value="Drivers Licence">National identity card, or Drivers Licence </asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                            <div class="col-md-12 file-updbtnwrp">                                                
                                                <asp:Label ID="lbluploadidentitydoc" runat="server" />
                                                <asp:FileUpload ID="identitydocupload" runat="server" /> 
                                                <input type="hidden" id="hididentitydocPath" runat="server" />
                                                <asp:HyperLink runat="server" ID="identitydocuploadedFile" Target="_blank"></asp:HyperLink>
                                            </div>
                                        </div>
                                    </div>                                     
                                </div>  
                                 <div class="form-group row" id="Welfaredoc" runat="server">
                                    <label for="Welfaredoc" id="lblWelfaredoc" runat="server" class="col-sm-12"><b>2)</b> Welfare arrangements for under 18 year old student</label>
                                    <div class="col-sm-12">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <asp:DropDownList runat="server" ID="ddlWelfaredoc">
                                                    <asp:ListItem Value="0" Selected="True">Please select</asp:ListItem>
                                                    <asp:ListItem Value="Form 157N">Form 157N</asp:ListItem>
                                                    <asp:ListItem Value="appropriate accommodation">confirmation of appropriate accommodation </asp:ListItem>                                                   
                                                </asp:DropDownList>
                                            </div>
                                            <div class="col-md-12 file-updbtnwrp">                                                
                                                <asp:Label ID="lbluploadWelfaredoc" runat="server" />
                                                <asp:FileUpload ID="WelfaredocFileUpload" runat="server" /> 
                                                <input type="hidden" id="HidWelfaredocPath" runat="server" />
                                                <asp:HyperLink runat="server" ID="Welfaredocuploadedfile" Target="_blank"></asp:HyperLink>
                                            </div>
                                        </div>
                                    </div>                                     
                                </div>  
                                <div class="form-group row" id="GTERdoc" runat="server">
                                    <label for="GTERdoc" id="lblGTERdoc" runat="server" class="col-sm-12"><b>3)</b> Genuine Temporary Entrant requirement</label>
                                    <div class="col-sm-12">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <asp:DropDownList runat="server" ID="ddlGTERdoc">
                                                    <asp:ListItem Value="0" Selected="True">Please select</asp:ListItem>
                                                    <asp:ListItem Value="employment  Proof">Proof of employment </asp:ListItem>
                                                    <asp:ListItem Value="academic transcripts">certified copy of your academic transcripts </asp:ListItem>    
                                                    <asp:ListItem Value="academic transcripts in Australia">certified copy of your academic transcripts in Australia</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                            <div class="col-md-12 file-updbtnwrp">                                                
                                                <asp:Label ID="lbluploadGTERdoc" runat="server" />
                                                <asp:FileUpload ID="GTERdocFileUpload" runat="server" /> 
                                                <input type="hidden" id="HidGTERdocPath" runat="server" />
                                                <asp:HyperLink runat="server" ID="GTERdocfileLink" Target="_blank"></asp:HyperLink>
                                            </div>
                                        </div>
                                    </div>                                     
                                </div> 
                                 <div class="form-group row" id="employmenthistory" runat="server">
                                    <label for="acadamicdoc" id="lblemploymenthistory" runat="server" class="col-sm-12"><b>4)</b> Evidence of current or most recent employment                                               

                                    </label>
                                    <div class="col-sm-12">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <asp:DropDownList runat="server" ID="ddlemploymenthistory">
                                                    <asp:ListItem Value="0" Selected="True">Please select</asp:ListItem>
                                                    <asp:ListItem Value="employment payslips">recent employment payslips </asp:ListItem>
                                                    <asp:ListItem Value="resume">resume </asp:ListItem>  
                                                </asp:DropDownList>
                                            </div>
                                            <div class="col-md-12 file-updbtnwrp">                                                
                                                <asp:Label ID="lbluploademploymenthistory" runat="server" />
                                                <asp:FileUpload ID="employmenthistoryFileUpload" runat="server" /> 
                                                <input type="hidden" id="HidemploymenthistoryPath" runat="server" />
                                                <asp:HyperLink runat="server" ID="employmenthistoryfileLink" Target="_blank"></asp:HyperLink>
                                            </div>
                                        </div>
                                    </div>                                     
                                </div> 
                                <div class="form-group row" id="relationshipEvidence" runat="server">
                                    <label for="relationshipEvidence" id="lblrelationshipEvidence" runat="server" class="col-sm-12"><b>5)</b> Relationship - spouse, de facto partner  
                                    </label>
                                    <div class="col-sm-12">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <asp:DropDownList runat="server" ID="ddlrelationshipEvidence">
                                                    <asp:ListItem Value="0" Selected="True">Please select</asp:ListItem>
                                                    <asp:ListItem Value="marriage certificate">marriage certificate</asp:ListItem>
                                                    <asp:ListItem Value="Household Booklet">Family/Household Booklet </asp:ListItem>  
                                                </asp:DropDownList>
                                            </div>
                                            <div class="col-md-12 file-updbtnwrp">                                                
                                                <asp:Label ID="lbluploadrelationshipEvidence" runat="server" />
                                                <asp:FileUpload ID="relationshipEvidenceFileUpload" runat="server" /> 
                                                <input type="hidden" id="HidrelationshipEvidencePath" runat="server" />
                                                <asp:HyperLink runat="server" ID="relationshipEvidencefileLink" Target="_blank"></asp:HyperLink>
                                            </div>
                                        </div>
                                    </div>                                     
                                </div>
                                 <div class="form-group row" id="namechangeevidence" runat="server">
                                    <label for="namechangeevidence" id="lblnamechangeevidence" runat="server" class="col-sm-12"><b>6)</b> Change of name
                                    </label>
                                    <div class="col-sm-12">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <asp:DropDownList runat="server" ID="ddlnamechangeevidence">
                                                    <asp:ListItem Value="0" Selected="True">Please select</asp:ListItem>
                                                    <asp:ListItem Value="marriage certificate">marriage certificate</asp:ListItem>
                                                    <asp:ListItem Value="deed poll certificate">deed poll certificate </asp:ListItem>  
                                                    <asp:ListItem Value="evidence ofName change">certified copy of evidence of the name change</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                            <div class="col-md-12 file-updbtnwrp">                                                
                                                <asp:Label ID="lbluploadnamechangeevidence" runat="server" />
                                                <asp:FileUpload ID="namechangeevidenceFileUpload" runat="server" /> 
                                                <input type="hidden" id="HidnamechangeevidencePath" runat="server" />
                                                <asp:HyperLink runat="server" ID="namechangeevidenceLink" Target="_blank"></asp:HyperLink>
                                            </div>
                                        </div>
                                    </div>                                     
                                </div>
                               
                               
                                 <div class="form-group row">
                                    <div class="col-sm-8 offset-sm-3">
                                        <div class="media align-items-center">
                                            <div class="media-left">
                                                <asp:Button ID="uploadbtn" runat="server" Text="Upload Documents" CssClass="btn btn-success" OnClientClick="return validateUploadedFile()" OnClick="uploadbtn_Click"/>
                                            </div>
                                        </div>
                                    </div>
                                </div>                               
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="banImg-wrp">
                        <img src="/assets/images/Banner1.jpg" class="img-fluid">
                    </div>
                    <div class="card faq-qwrp" id="questions" runat="server">
                            <div class="card-body">
                            <%  if (allQuestions.Count > 0)
                                { %>
                            <div id="question" runat="server">
                                    <h5>FAQ's</h5>
                                    <div class="">
                                    <%for (int q = 0; q < allQuestions.Count; q++)
                                        {%>  <div class="star-list">                                                             
                                                <label onclick="showFaqQuestion('<%=allQuestions[q].question%>','<%=allQuestions[q].answer%>')">  <%=allQuestions[q].question%> </label>
                                            </div>                                                  
                                    <%} %>
                                </div>
                            </div>      
                                <%} %>  
                                     
                            </div>
                        </div>
                    </div>
                    <div class="container page__container">
                        <div class="footer">
                        </div>
                    </div>
                </div>                     
        </div>
    </div>
    <script>
        function validateUploadedFile() {
            if ($("#<%=ddlidentity.ClientID%>").val() == "0") {
                alert("Please select document type from dropdown of option 1");
                return false;
            }
            if (!validfileExtention($("#<%=identitydocupload.ClientID%>").val(), $("#<%=hididentitydocPath.ClientID%>").val())) {
                alert("Please Upload Valid Identity Proof");
                return false;
            }
            if ($("#<%=ddlWelfaredoc.ClientID%>").val() == "0") {
                alert("Please select document type from dropdown of option 2");
                return false;
            }
            if (!validfileExtention($("#<%=WelfaredocFileUpload.ClientID%>").val(), $("#<%=HidWelfaredocPath.ClientID%>").val())) {
                alert("please upload valid Welfare arrangements for under 18 year old student");
                return false;
            }            
            if ($("#<%=ddlGTERdoc.ClientID%>").val() == "0") {
                alert("Please select document type from dropdown of option 3");
                return false;
            }
            if (!validfileExtention($("#<%=GTERdocFileUpload.ClientID%>").val(), $("#<%=HidGTERdocPath.ClientID%>").val())) {
                alert("please upload valid Genuine Temporary Entrant requirement");
                return false;
            }                        
            if ($("#<%=ddlemploymenthistory.ClientID%>").val() == "0") {
                alert("Please select document type from dropdown of option 4");
                return false;
            }
            if (!validfileExtention($("#<%=employmenthistoryFileUpload.ClientID%>").val(), $("#<%=HidemploymenthistoryPath.ClientID%>").val())) {
                alert("please upload valid Evidence of current or most recent employment");
                return false;
            }            
            if ($("#<%=ddlrelationshipEvidence.ClientID%>").val() == "0") {
                alert("Please select document type from dropdown of option 5)");
                return false;
            }
            if (!validfileExtention($("#<%=relationshipEvidenceFileUpload.ClientID%>").val(), $("#<%=HidrelationshipEvidencePath.ClientID%>").val())) {
                alert("please upload valid Relationship - spouse, de facto partner");
                return false;
            }
            return true;
        }        
       function validfileExtention(filepath , hidDocumentPath) {
            if (filepath == "")
            {
               filepath = hidDocumentPath;
            }
            if (filepath == "")
                return false;
            var fileExtension = filepath.substring(filepath.lastIndexOf(".") + 1).toString().toLowerCase();
            if (filepath != "")
            {  
                if (fileExtension != "pdf" && fileExtension != "jpg")                          
                    return false;                                   
            }
            return true;
        }
         $(document).ready(function () {
            $('.sidebar-menu-item').removeClass('open');
            $('#visaapplication_list').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#visadocumentupload').addClass('active');
        });
                
    </script>
</asp:Content>
