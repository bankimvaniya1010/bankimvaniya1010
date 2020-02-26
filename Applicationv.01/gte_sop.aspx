<%@ Page Language="C#" AutoEventWireup="true" CodeFile="gte_sop.aspx.cs" Inherits="gte_sop" MasterPageFile="~/student.master" %>

<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <div class="container-fluid page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">Statement Of Purpose</li>
        </ol>
        <h1 class="h2">STATEMENT OF PURPOSE

        </h1>
    </div>

    <div class="page ">
        <div class="container page__container">
         <div class="row">
           <div class="col-md-8">
             <div class="card" runat="server" id="sop_section">
              <div class="card-body list-group-fit">
                <div class="list-group list-group-fit">
                    <div runat="server">
                        <asp:TextBox ID="txtPara1" runat="server" TextMode="MultiLine" Width="100%" Height="300px" Font-Size="Medium"></asp:TextBox>
                    </div>
                </div>

                <div class="list-group list-group-fit">
                    <div runat="server">
                        <asp:TextBox ID="txtPara2" runat="server" TextMode="MultiLine" Width="100%" Height="300px" Font-Size="Medium"></asp:TextBox>
                    </div>
                </div>

                <div class="list-group list-group-fit">
                    <div runat="server">
                        <asp:TextBox ID="txtPara3" runat="server" TextMode="MultiLine" Width="100%" Height="300px" Font-Size="Medium"></asp:TextBox>                    
                    </div>            
                </div>

                <div class="list-group list-group-fit">
                    <div runat="server">
                        <asp:TextBox ID="txtPara4" runat="server" TextMode="MultiLine" Width="100%" Height="300px" Font-Size="Medium"></asp:TextBox>
                    </div>
                </div>

                <div class="list-group list-group-fit">
                    <div runat="server">
                        <asp:TextBox ID="txtPara5" runat="server" TextMode="MultiLine" Width="100%" Height="300px" Font-Size="Medium"></asp:TextBox>
                    </div>
                </div>

                <div class="form-group m-0" role="group">
                    <div class="">
                        <input id="btnEdit" type="button" runat="server" class="btn btn-success" value="Edit" />
                        <asp:Button ID="btnSave" runat="server" CssClass="btn btn-success" Text="Save" OnClick="btnSave_Click" style="margin-left:65px" />
                        <asp:Button ID="btnsubmit" runat="server" CssClass="btn btn-success" Text="Submit" OnClick="btnsubmit_Click" style="margin-left:20px"/>
                    </div>
                </div>

            </div>
          </div>

               <div id="completedDiv" runat="server" style="display: none;">
                   <asp:Label ID="lblCompleted" runat="server" Text=""></asp:Label>
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
                                        <label onclick="showFaqQuestion('<%=allQuestions[q].question%>','<%=allQuestions[q].answer.Replace(Environment.NewLine, "<br />") %>')">  <%=allQuestions[q].question%> </label>
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

            $("#<%=txtPara1.ClientID%>").attr('readonly', true);
            $("#<%=txtPara2.ClientID%>").attr('readonly', true);
            $("#<%=txtPara3.ClientID%>").attr('readonly', true);
            $("#<%=txtPara4.ClientID%>").attr('readonly', true);
            $("#<%=txtPara5.ClientID%>").attr('readonly', true);

            $("#<%=btnEdit.ClientID%>").click(function () {
                var btnEdit = this;
                btnEdit.style.display = "none";

                $("#<%=btnsubmit.ClientID%>").hide();
                $("#<%=btnSave.ClientID%>").show();

                $("#<%=txtPara1.ClientID%>").attr('readonly', false);
                $("#<%=txtPara2.ClientID%>").attr('readonly', false);
                $("#<%=txtPara3.ClientID%>").attr('readonly', false);
                $("#<%=txtPara4.ClientID%>").attr('readonly', false);
                $("#<%=txtPara5.ClientID%>").attr('readonly', false);

            });

        });
     
        $(document).ready(function () {
            $('.sidebar-menu-item').removeClass('open');
            $('#Gte_list').addClass('open');
            $('#gte_questions_menu').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#gtestudent_sop').addClass('active');
        });
    </script>
</asp:Content>
