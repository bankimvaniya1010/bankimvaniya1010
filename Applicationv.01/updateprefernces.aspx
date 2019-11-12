<%@ Page Language="C#" AutoEventWireup="true" CodeFile="updateprefernces.aspx.cs" Inherits="updateprefernces" MasterPageFile="~/student.master" %>

<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">


    <div class="container-fluid page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active"></li>
        </ol>
        <h1 class="h2">UPDATE PREFERENCES

        </h1>

    </div>
    <div class="page ">
        <div class="container page__container">
            <div class="row">
                <div class="col-md-8">

                    <div class="card">
                        <div class="card-body list-group list-group-fit">




                            <div class="list-group-item">
                                <label class="form-group m-0" for="enrollmentyear" aria-labelledby="label-password"></label>
                                <div class="form-row">
                                    <label id="lblEnrol" for="exsistingpassword" class="col-md-3 col-form-label form-label">When you want to enrol</label>
                                    <div class="col-md-6">
                                        <div class="form-check-inline">
                                            <div class="form-check-label"><asp:RadioButton ID="rblYear1" runat="server" GroupName="enrollmentyear" /></div>
                                        </div>
                                        <div class="form-check-inline">
                                            <div class="form-check-label"><asp:RadioButton ID="rblYear2" runat="server" GroupName="enrollmentyear" /></div>
                                        </div>
                                        <div class="form-check-inline">
                                            <div class="form-check-label"><asp:RadioButton ID="rblYear3" runat="server" GroupName="enrollmentyear" /></div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                            <div class="list-group-item">
                                <label class="form-group m-0" for="enrollmentyear" aria-labelledby="label-password"></label>
                                <div class="form-row">
                                    <label id="lblStudyLevel" for="exsistingpassword" class="col-md-3 col-form-label form-label">Study Level</label>

                                    <div class="col-md-9 updt-prftbl">
                                        <asp:RadioButtonList ID="rblstudyLevel" runat="server"></asp:RadioButtonList>
                                    </div>

                                </div>
                            </div>
                            <div class="list-group-item">
                                <label class="form-group m-0" for="enrollmentyear" aria-labelledby="label-password"></label>
                                <div class="form-row">
                                    <label id="lblCourse" for="exsistingpassword" class="col-md-3 col-form-label form-label">Course</label>

                                    <div class="col-md-6">
                                        <asp:ListBox ID="lstCourse" SelectionMode="Multiple" CssClass="form-control" runat="server"></asp:ListBox>
                                    </div>

                                </div>

                                <div class="list-group-item">
                                    <label class="form-group m-0" for="enrollmentyear" aria-labelledby="label-password"></label>
                                    <div class="form-row">
                                        <asp:Button ID="btnupdatepreferences" runat="server" Text="Update Preferences " CssClass="btn btn-success" OnClick="btnupdatepreferences_Click" />
                                        <div class="col-md-6">
                                            <asp:Label ID="lblMessage" runat="server" Visible="false"></asp:Label>
                                            <asp:Label ID="lblErrorMessage" runat="server" Visible="false"></asp:Label>
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
                    <div id="page-nav" class="col-lg-auto page-nav">
                        <div>
                            <span id="tooltip"></span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container page__container">
                <div class="footer">
                </div>

            </div>
        </div>
   
    <script>
        $(function () {
            $('#btnupdatepreferences').click(function () {
                var summary = "";

                summary += isvalidenrollmentyear();
                summary += isvalidStudyLevel();
                summary += isvalidCourse();
                summary += isvalidterms();
                if (summary != "") {
                    alert(summary);
                    return false;
                }
                else {
                    return true;
                }
            })
        })



        function isvalidenrollmentyear() {
            if ($('input[name="enrollmentyear"]:checked').length > 0) {
                // if ($('#enrollmentyear :radio:checked').length > 0) {
                return "";
            }
            else {
                return ("Please select enrollment year" + "\n");

            }
        }
        function isvalidStudyLevel() {
            if ($('#rblstudyLevel :radio:checked').length > 0) {
                return "";
            }
            else {
                return ("Please select study level" + "\n");

            }

        }
        function isvalidCourse() {

            if ($('#lstCourse').val().length == 0) {
                return ("Please select course" + "\n");
            }
            else {
                return "";
            }
        }




        $(document).ready(function () {
            $('.sidebar-menu-item').removeClass('open');
            $('#profile_list').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#updatepreferences').addClass('active');
        });

    </script>

</asp:Content>
