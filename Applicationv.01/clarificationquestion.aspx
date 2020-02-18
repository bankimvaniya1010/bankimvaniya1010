<%@ Page Language="C#" AutoEventWireup="true" CodeFile="clarificationquestion.aspx.cs" Inherits="clarificationquestion" MasterPageFile="~/student.master" %>

<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">


    <div class="container-fluid page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">CLARIFICATION QUESTION(S)</li>
        </ol>
        <h1 class="h2">CLARIFICATION QUESTION(S)

        </h1>

    </div>
    <div class="page ">
        <div class="container page__container">
            <div class="row">
                <div class="col-md-8">

                    <div class="card">
                        <div class="card-body list-group list-group-fit">
                            <div class="list-group-item" id="secondaryHighSchoolGap" runat="server" style="display: none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-secondhighgap">
                                    <div class="form-row">
                                        <label id="lblSecondHighGap" runat="server" for="secondhighgap" class="col-md-3 col-form-label form-label">There seems to be gap between your High School & Secondary School, please provide reasons for this</label>
                                        <div class="col-md-6">
                                            <input id="txtSecondHighGapReason" runat="server" type="text" class="form-control" placeholder="Education gap reason">
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="list-group-item" id="highereduSecondarySchoolGap" runat="server" style="display: none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-highersecondarygap">
                                    <div class="form-row">
                                        <label id="lblHigherSecondaryGap" runat="server" for="highersecondarygap" class="col-md-3 col-form-label form-label">There seems to be gap between your senior secondary school and higher studies, please provide reasons for this.</label>
                                        <div class="col-md-6">
                                            <input id="txtHigherSecondaryGap" runat="server" type="text" class="form-control" placeholder="Education gap reason">
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="list-group-item" id="motivationReason" runat="server" style="display: none">
                                <div class="form-group m-0" role="group" runat="server" aria-labelledby="label-motivation">
                                    <div class="form-row">
                                        <label id="lblMotivationReason" runat="server" for="motivation" class="col-md-3 col-form-label form-label">What is the key motivations for your continuing education at this stage ?</label>
                                        <div class="col-md-6">
                                            <input id="txtMotivationReason" runat="server" type="text" class="form-control" placeholder="Motivation Reason" />
                                        </div>
                                    </div>
                                </div>
                            </div>


                            <div id="mainDiv" runat="server"></div>
                            <div class="list-group-item" id="employerwebsite">
                                <div class="form-group m-0" role="group" aria-labelledby="label-employerwebsite">
                                    <div class="form-row">
                                        <asp:Button ID="btn_login" runat="server" Text="Save Changes" CssClass="btn btn-success" OnClick="btn_login_Click" OnClientClick="return validateForm()" Visible="false"/>
                                        
                                        <div class="col-md-6">
                                             <asp:Label ID="LabelMessage" runat="server" text=""></asp:Label>      
                                            <asp:Label ID="lblMessage" runat="server" Visible="false"></asp:Label>
                                            <asp:Label ID="lblSaveTime" runat="server"></asp:Label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="">
                                <div class="form-group m-0">
                                    <div class="form-row">
                                        <asp:Button ID="gotoNextPage" runat="server" Text="Go to Documents Upload" CssClass="btn btn-success" OnClick="gotoNextPage_Click" OnClientClick="return validateForm()"/>
                                        <div class="col-md-6">
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
                                    <h5>Frequently Asked Questions (FAQs)</h5>
                                    <div class="">
                                    <%for (int q = 0; q < allQuestions.Count; q++)
                                        {%>  <div class="star-list">                                                             
                                                <label onclick="showFaqQuestion('<%=allQuestions[q].question%>','<%=allQuestions[q].answer.Replace(Environment.NewLine, "<br />") %>')"> <%=allQuestions[q].question%> </label>
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

        function validateForm() {
            var flag = false;
            if (!$("#<%=txtSecondHighGapReason.ClientID%>").is(':hidden') && $("#<%=txtSecondHighGapReason.ClientID%>").val() == "")
                alert("Please fill gap reason");
            else if ((!$("#<%=txtHigherSecondaryGap.ClientID%>").is(':hidden')) && $("#<%=txtHigherSecondaryGap.ClientID%>").val() == "")
                alert("Please fill gap reason");
            else if (!$("#<%=txtMotivationReason.ClientID%>").is(':hidden') && $("#<%=txtMotivationReason.ClientID%>").val() == "")
                alert("Please fill motivation reason");
            else
                flag = true;

            return flag;
        }
        $(document).ready(function () {
            $('.sidebar-menu-item').removeClass('open');
            $('#personal_menu_list').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#clarificationquestion').addClass('active');
        });
    </script>
</asp:Content>