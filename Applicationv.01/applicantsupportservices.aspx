<%@ Page Language="C#" AutoEventWireup="true" CodeFile="applicantsupportservices.aspx.cs" Inherits="applicantsupportservices" MasterPageFile="~/student.master"%>

<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <div class="container-fluid page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">Your Support Services</li>
        </ol>
        <h1 class="h2">YOUR SUPPORT SERVICES</h1>

    </div>
    <div class="page ">

        <div class="container page__container">
            <div class="row">
               <div class="col-md-8">
                   <div class="list-group-fit list-group-item">
                       <h3>INSTRUCTIONS</h3>
                       <div class="list-group list-group-fit list-group-item" runat="server" id="universityInstruction">
                       </div>
                   </div>
                <br/>
                <div class="card" id="services" runat="server">
                         <asp:DataList ID="servicesList" runat="server" OnItemCommand="servicesList_ItemCommand">
                        <ItemTemplate>
                            <asp:Panel ID="options" runat="server">
                                <div class="card-body">    
                                    <div class="list-group-item">
                                        <div class="form-group m-0">
                                            <div class="form-row">
                                                <div class="col-md-3 col-form-label form-label">
                                                    <div style="display: none;">
                                                        <asp:Label ID="lblservieId" runat="server" Text='<%# Eval("serviceID") %>'></asp:Label>
                                                    </div>
                                                    <div">                                        
                                                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("image")%>' CssClass="img-fluid"/>
                                                    </div>
                                                    <div class="col-md-9">
                                                         <div>
                                                            <label for="universityName" class="col-form-label form-label">Service Type: </label>
                                                            <asp:Label ID="lblservicetype" runat="server" Text='<%# Eval("servicetype") %>'></asp:Label>
                                                        </div>
                                                        <div>
                                                            <label for="universityCampus" class="col-form-label form-label">Service Provider: </label>
                                                            <asp:Label ID="lblprovidername" runat="server" Text='<%# Eval("providername") %>'></asp:Label>
                                                        </div>
                                                        <div>
                                                            <label for="universityCourse" class="col-form-label form-label">Service Description : </label>
                                                            <asp:Label ID="lbldescription" runat="server" Text='<%# Eval("description") %>'></asp:Label>
                                                        </div>
                                                        <br/>
                                                        <div>
                                                            <div runat="server" style="text-align:center">
                                                                <asp:Button ID="btnSendEmail" runat="server" Text="SEND AN ENQUIRY" CommandName="SendEmail" CommandArgument='<%# Eval("serviceID") + "," + Eval("provideremail") + "," + Eval("providername") +","+ Eval("servicetype") %>' />
                                                            </div>
                                                        </div>
                                                    </div>                                                    
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                   
                                   
                                    
                                </div>
                            </asp:Panel>
                        </ItemTemplate>
                    </asp:DataList>
                </div>
                <div id="emptyServicesDiv" runat="server" style="display: none;">
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
                                <div class="star-list">
                                    <label onclick="showFaqQuestion('<%=allfaqQuestion[q].question%>','<%=allfaqQuestion[q].answer%>')"> <%=allfaqQuestion[q].question%> </label>
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
    $(document).ready(function () {
        $('.sidebar-menu-item').removeClass('open');
        $('#supportservice_list').addClass('open');
        $('.sidebar-menu-item').removeClass('active');
        $('#supportservices').addClass('active');
    });
</script>
</asp:Content>