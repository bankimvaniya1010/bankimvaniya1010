<%@ Page Language="C#" AutoEventWireup="true" CodeFile="applicantscholarships.aspx.cs" Inherits="applicantscholarships" MasterPageFile="~/student.master" %>

<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">


    <div class="container-fluid page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">Your Scholarships</li>
        </ol>
        <h1 class="h2">Scholarships and Funding</h1>

    </div>
    <div class="page ">

        <div class="container page__container">
            <div class="row">
               <div class="col-md-8">
                   <div class="list-group-fit">
                       <h3>INSTRUCTIONS FOR SCHOLARSHIPS & FUNDING</h3>
                       <div class="list-group list-group-fit" runat="server" id="universityInstruction">
                       </div>
                   </div>
                <div class="card padR0" id="scholarships" runat="server">
                    <asp:DataList ID="scholarshipList" runat="server" OnItemCommand="scholarshipList_ItemCommand" CssClass="scholtble">
                        <ItemTemplate>
                            <asp:Panel ID="options" runat="server">
                                <div class="card-body">
                                    <div style="display: none;">
                                        <asp:Label ID="lblScholarshipId" runat="server" Text='<%# Eval("id") %>'></asp:Label>
                                    </div>
                                    <div class="form-group">
                                        <label for="scholarshipName" class="col-form-label form-label">Name of Scholarship: </label>
                                        <asp:Label ID="lblScholarshipName" runat="server" Text='<%# Eval("name") %>'></asp:Label>
                                    </div>
                                    <div class="form-group">
                                        <label for="scholarshipDescription" class="col-form-label form-label">Description: </label>
                                        <asp:Label ID="lblScholarshipDescription" runat="server" Text='<%# Eval("description") %>'></asp:Label>
                                    </div>
                                    <div class="form-group">
                                        <label for="scholarshipEligibility" class="col-form-label form-label">Eligibility: </label>
                                        <asp:Label ID="lblScholarshipEligibility" runat="server" Text='<%# Eval("eligibility") %>'></asp:Label>
                                    </div>
                                    <div class="form-group">
                                        <label for="scholarshipAmount" class="ccol-form-label form-label">Award Amount: </label>
                                        <asp:Label ID="lblScholarshipAmount" runat="server" Text='<%# Eval("award_amount") %>'></asp:Label>
                                    </div>
                                    <div class="form-group">
                                        <label for="scholarshipAwardedBy" class="col-form-label form-label">Awarded By: </label>
                                        <asp:Label ID="lblScholarshipAwardedBy" runat="server" Text='<%# Eval("awarded_by") %>'></asp:Label>
                                    </div>
                                    <div class="form-group">
                                        <label for="scholarshipDeadline" class="col-form-label form-label">Application Deadline: </label>
                                        <asp:Label ID="lblScholarshipDeadline" runat="server" Text='<%# Eval("application_deadline") %>'></asp:Label>
                                    </div>
                                    <div class="form-group">
                                        <asp:LinkButton ID="lnkDownloadBtn" runat="server" CommandName="Download" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "id")%>'>Download Application Form</asp:LinkButton>
                                    </div>
                                    <div class="form-group">
                                        <label for="scholarshipForm" class="col-form-label form-label">Upload Completed Application Form </label>
                                        <div class="col-md-6">
                                            <asp:FileUpload ID="completedApplicationForm" runat="server" CssClass="custom-file-input" />
                                            <label for="completedApplicationForm" runat="server" id="fileName" class="custom-file-label">Choose application file</label>
                                        </div>
                                    </div>
                                    <div class="form-group option">
                                        <asp:CheckBox ID="chkApply" runat="server" Text="Apply Scholarship" />
                                    </div>

                                </div>
                            </asp:Panel>
                        </ItemTemplate>
                    </asp:DataList>
                    <div class="card-footer" id="button" runat="server">

                        <asp:Button ID="btnsubmit" runat="server" CssClass="btn btn-success" Text="Submit" OnClientClick="return validateForm()" OnClick="btnsubmit_Click" />

                    </div>
                </div>
                
                <div class="" id="emptyScholarshipDiv" runat="server" style="display: none;">
                    <div>
                        <asp:Label ID="lblEmptyList" runat="server" Text=""></asp:Label>
                    </div>
                </div>
               </div>
                <div class="col-md-4">
                    <div class="banImg-wrp">
                        <img src="/assets/images/Banner1.jpg" class="img-fluid">
                    </div>
                <div class="card faq-qwrp" id="Div1" runat="server">
                    <div class="card-body">
                        <%  if (allfaqQuestion.Count > 0)
                            { %>
                        <div id="question" runat="server">
                            <h5>FAQ's</h5>
                            <div class="">
                                <%for (int q = 0; q < allfaqQuestion.Count; q++)
                                    {%>
                                <div>
                                    <label onclick="showFaqQuestion('<%=allfaqQuestion[q].question%>','<%=allfaqQuestion[q].answer%>')">* <%=allfaqQuestion[q].question%> </label>
                                </div>
                                <%} %>
                            </div>
                        </div>
                        <%} %>
                    </div>
                </div>
                </div>
            </div>
            
         </div>
        </div>

        <div class="container page__container">
            <div class="footer">
            </div>

        </div>
    <script>
        function openLink(url) {
            $('body').append('<div class="modal" id="video-modal" tabindex="-1" role="dialog"><div class="modal-dialog" role="document"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button></div><div class="modal-body"><div class="">Ans:' + url + '</div></div></div></div></div>');
            $('#video-modal').modal('show');
            $('#video-modal').on('hidden.bs.modal', function () {
                $('#video-modal').remove();
            });
        }
        function validateForm() {
            var scholarshipSelected = false;
            var scholarshipsCount = <%=applicantscholarships.scholarshipCount%>;
            for (var i = 0; i < scholarshipsCount; i++) {
                var chckApply = $("#ContentPlaceHolder1_scholarshipList_chkApply_" + i);

                if (chckApply.is(':checked')) {
                    scholarshipSelected = true;
                    // Check for file uploaded or not and then raise alert
                    uploadedfile = $("#ContentPlaceHolder1_scholarshipList_completedApplicationForm_" + i); // File Upload control
                    if (uploadedfile.get(0).files.length == 0) {
                        alert("Please upload application form for scholarship no: " + (i + 1));
                        return false;
                    }
                    var ext = uploadedfile.val().split('.').pop();
                    if (!(ext.toLowerCase() == "pdf" || ext.toLowerCase() == "word")) {
                        alert("Please upload application form in either pdf or word format for scholarship no: " + (i + 1));
                        return false;
                    }
                    var fileSize = Math.round((uploadedfile.get(0).files[0].size / 1024) / 1024);
                    if (fileSize > 16) {
                        alert("Please upload application form size less than 16MB for scholarship no: " + (i + 1));
                        return false;
                    }
                }
            }

            if (!scholarshipSelected) {
                alert("No scholarship selected to apply. Please select applicable scholarships");
                return false;
            }

            return true;
        }

        $(document).ready(function () {
            $('.sidebar-menu-item').removeClass('open');
            $('#studentapplication_finances').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#applicantscholarship').addClass('active');

            var count = $('input[type="file"]');
            for (var i = 0; i < count.length; i++) {
                $("#ContentPlaceHolder1_scholarshipList_completedApplicationForm_" + i).change(function (event) {
                    var path = $(this).val();
                    var id =  event.target.id.replace("ContentPlaceHolder1_scholarshipList_completedApplicationForm_", "");
                    if (path != '' && path != null) {
                        var q = path.substring(path.lastIndexOf('\\') + 1);
                        $("#ContentPlaceHolder1_scholarshipList_fileName_" + id).text(q);
                    }
                });
            }
        });
    </script>

</asp:Content>
