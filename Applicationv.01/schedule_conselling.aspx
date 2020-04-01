<%@ Page Language="C#" AutoEventWireup="true" CodeFile="schedule_conselling.aspx.cs" Inherits="schedule_conselling" MasterPageFile="~/student.master"%>

<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">


    <div class="container-fluid page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">Schedule COUNSELLING

            </li>
        </ol>
        <h1 class="h2">Schedule your Proctor based GTE Assessment</h1>
    </div>
    <div class="page">
        <div class="container page__container">
            <div class="row m-0">
                <div class="col-md-8">
                    <!-- ScheduleOnce embed START -->

                    <div id="SOIDIV_ecu-gte" data-so-page="ecu-gte" data-height="550" data-style="border: 1px solid #d8d8d8; min-width: 290px; max-width: 900px;" data-psz="10"></div>

                    <script type="text/javascript" src="https://cdn.oncehub.com/mergedjs/so.js"></script>

                    <!-- ScheduleOnce embed END -->

                    <%--<!-- ScheduleOnce embed START -->

                    <div id="SOIDIV_FreeCounselling" data-so-page="FreeCounselling" data-height="550" data-style="border: 1px solid #d8d8d8; min-width: 290px; max-width: 900px;" data-psz="10">
                    </div>

                    <script type="text/javascript" src="https://cdn.oncehub.com/mergedjs/so.js"></script>

                    <!-- ScheduleOnce embed END -->--%>
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
                                <h5>Frequently Asked Questions (FAQs)</h5>
                                <div class="">
                                    <%for (int q = 0; q < allfaqQuestion.Count; q++)
                                        {%>
                                    <div class="star-list">
                                        <label onclick="showFaqQuestion('<%=allfaqQuestion[q].question%>','<%=allfaqQuestion[q].answer.Replace(Environment.NewLine, "<br />") %>')"><%=allfaqQuestion[q].question%> </label>
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
    <script>

        $(document).ready(function () {
            $('.sidebar-menu-item').removeClass('open');
            $('#schedulecounselling').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#schedule').addClass('active');
        });
    </script>
</asp:Content>
