<%@ Page Language="C#" AutoEventWireup="true" CodeFile="default.aspx.cs" Inherits="_Default" MasterPageFile="~/student.master" %>

<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <div class="col-lg container-fluid page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="default.aspx">Home</a></li>
            <li class="breadcrumb-item active">Dashboard</li>
        </ol>
        <h1 class="h2">WELCOME TO THE APPLICATION CENTER</h1>
        <div id="domesticDiv" runat="server" class="form-group" style="display: none">
            <div class="col-lg-8 list-group-item">
                <label class="form-label" for="password">Are you an Australian citizen, an Australian Permanent Residency Visa holder or a citizen of New Zealand ?</label>
                <div class="input-group input-group-merge">
                    <asp:RadioButton ID="rblYes" runat="server" CssClass="form-control frm-cntrl-rdo" GroupName="residency" Text="Yes" />
                    <asp:RadioButton ID="rblNo" runat="server" CssClass="form-control frm-cntrl-rdo" GroupName="residency" Text="No" />
                </div>
                <br/>
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
            </div>
        </div>

        <div class="row">
            <div class="col-lg-8">
                <div class="card">
                    <div class="card-header d-flex align-items-center">
                        <div class="h2 mb-0 mr-3 text-primary"></div>
                        <div class="flex">
                            <h4 class="card-title">Instructions</h4>
                        </div>
                    </div>
                    <div class="card-body">
                        Welcome to the Application Center. In this Application Center portal, you will be able to:
                    </div>
                    <div>
                        <ol>
                            <li>Start, complete and submit a course application</li><br>
                            <li>Check the status of your course application</li><br>
                            <li>Complete a Genuine Temporary Entrant (GTE) and Genuine Student (GS) assessment</li><br>
                            <li>Start, complete and submit a visa application</li><br>
                            <li>Check the status of your visa application</li><br>
                            <li>Upload supporting documents</li><br>
                            <li>Access your messages, offer letters and other documentation relevant to your applications</li><br>
                            <li>Respond to your offers</li><br>
                            <li>Make payments; and</li><br>
                            <li>Access other relevant information and support services that will be useful as you prepare to commence your studies with <%=_Default.universityName %>.</li>
                        </ol>
                    </div>
                </div>
            </div>
            <div class="col-lg-4">

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
                                    {%>
                                <div class="star-list">
                                    <label onclick="showFaqQuestion('<%=allQuestions[q].question%>','<%=allQuestions[q].answer%>')"><%=allQuestions[q].question%> </label>
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
</asp:Content>
