<%@ Page Language="C#" AutoEventWireup="true" CodeFile="counselling_center.aspx.cs" Inherits="counselling_center" MasterPageFile="~/student.master"%>

<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">


    <div class="container-fluid page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">My Dashboard</a></li>
            <li class="breadcrumb-item active">Counselling Center

            </li>
        </ol>
        <h1 class="h2">Counselling Center</h1>
    </div>
    <div class="page">
        <div class="container page__container">
            <div class="row m-0">
                <div class="col-md-8">
                    <% if (universityId == 7)
                        {  %>
                    <!-- ScheduleOnce embed START -->
                            <div id="SOIDIV_CanningCollege-CounsellingCenter" data-so-page="CanningCollege-CounsellingCenter" data-height="550" data-style="border: 1px solid #d8d8d8; min-width: 290px; max-width: 900px;" data-psz="10"></div>
                            <script type="text/javascript" src="https://cdn.oncehub.com/mergedjs/so.js"></script>
                    <!-- ScheduleOnce embed END -->
                    <%}
                        else if (universityId == 9)
                        {%>
                    <!-- ScheduleOnce embed START -->
                    <div id="SOIDIV_AIWT-CounsellingCenter" data-so-page="AIWT-CounsellingCenter" data-height="550" data-style="border: 1px solid #d8d8d8; min-width: 290px; max-width: 900px;" data-psz="10"></div>
                    <script type="text/javascript" src="https://cdn.oncehub.com/mergedjs/so.js"></script>
                    <!-- ScheduleOnce embed END -->
                    <%}
                        else if (universityId == 11)
                        {%>
                    <!-- ScheduleOnce embed START -->
                    <div id="SOIDIV_StanleyCollege-Counselling" data-so-page="StanleyCollege-Counselling" data-height="550" data-style="border: 1px solid #d8d8d8; min-width: 290px; max-width: 900px;" data-psz="10"></div>
                    <script type="text/javascript" src="https://cdn.oncehub.com/mergedjs/so.js"></script>
                    <!-- ScheduleOnce embed END -->
                    <%}
                      else if (universityId == 37)
                        {%>
                    <!-- ScheduleOnce embed START -->
                    <div id="SOIDIV_Counselling_Centre" data-so-page="Counselling_Centre" data-height="550" data-style="border: 1px solid #d8d8d8; min-width: 290px; max-width: 900px;" data-psz="00"></div>
                    <script type="text/javascript" src="https://cdn.oncehub.com/mergedjs/so.js"></script>
                    <!-- ScheduleOnce embed END -->

                    <%} %>
                    <%else
                        {%>
                    <label> Not Set By Institution</label>

                        <%}
                            %>
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
            $('#counsellingcenter_list').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#counselling_center').addClass('active');
        });
    </script>
</asp:Content>
