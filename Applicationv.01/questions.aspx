<%@ Page Language="C#" AutoEventWireup="true" CodeFile="questions.aspx.cs" Inherits="questions" MasterPageFile="~/student.master" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" ID="Content1" runat="server">
    <div class="container-fluid page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">Questions </li>
        </ol>
        <h1 class="h2">Questions</h1>

    </div>
    <div class="page ">

        <div class="container page__container p-0">
            <div class="row m-0">
                <div class="col-lg container-fluid page__container">
                    <div class="card" style="width: 650px;">

                        <asp:DataList ID="questionList" runat="server"  RepeatColumns="1" OnItemDataBound="questionList_ItemDataBound" >
                            <ItemTemplate>
                                <asp:Panel ID="options" runat="server">
                                    <div class="card-header">
                                         <div style="display: none;">
                                                <asp:Label ID="lblno" runat="server" Text='<%# Eval("answerid") %>'></asp:Label>
                                            </div>
                                        <div class="media align-items-center">
                                           
                                            <div class="media-left">
                                                <h4 class="mb-0"><strong># 
                                                <asp:Label ID="lblSrNo" runat="server" Text='<%# Eval("srNo") %>'></asp:Label></strong></h4>
                                            </div>
                                            <div class="media-body">
                                                <h4 class="card-title">
                                                    <asp:Label ID="lblPrimary" runat="server" Text='<%# Eval("answerdescription") %>'></asp:Label>?
                                                </h4>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card-body">
                                        <%-- <div class="form-group">

                                            <input id="customCheck01" type="checkbox" class="custom-control-input">
                                            <label for="customCheck01" class="custom-control-label">
                                                <asp:Label ID="lblquestion" runat="server" Text='<%# Eval("answerdescription") %>'></asp:Label></label>

                                        </div>--%>

                                        <div class="form-group">
                                            <asp:RadioButton ID="rdoans1" runat="server" GroupName="A" Text='<%# Eval("Answer1") %>' />
                                        </div>
                                        <div class="form-group">
                                            <asp:RadioButton ID="rdoans2" runat="server" GroupName="A" Text='<%# Eval("Answer2") %>' />
                                        </div>
                                        <div class="form-group">
                                            <asp:RadioButton ID="rdoans3" runat="server" GroupName="A" Text='<%# Eval("Answer3") %>' />
                                        </div>
                                        <div class="form-group">
                                            <asp:RadioButton ID="rdoans4" runat="server" GroupName="A" Text='<%# Eval("Answer4") %>' />
                                        </div>
                                        <div class="form-group">
                                            <asp:RadioButton ID="rdoans5" runat="server" GroupName="A" Text='<%# Eval("Answer5") %>' />
                                        </div>
                                    </div>
                                </asp:Panel>
                            </ItemTemplate>
                        </asp:DataList>
                        <div class="card-footer" id="button" runat="server">
                            <asp:Button ID="btnPrev" runat="server" CssClass="btn btn-success" Text="Prev" OnClick="btnPrev_Click" />
                            <asp:Button ID="btnsubmit" runat="server" CssClass="btn btn-success" Text="Next" OnClick="btnsubmit_Click" OnClientClick="return CheckDouble();" />
                            
                            <%-- <a href="#" class="btn btn-white">Skip</a>
                        <a href="#" class="btn btn-success float-right">Submit <i class="material-icons btn__icon--right">send</i></a>--%>
                        </div>
                         <div class="card-footer" id="message" runat="server">
                                 <p> Back end team is setting questions for you.</p>
                            <%-- <a href="#" class="btn btn-white">Skip</a>
                        <a href="#" class="btn btn-success float-right">Submit <i class="material-icons btn__icon--right">send</i></a>--%>
                        </div>

                    </div>



                </div>
            </div>
            <div id="page-nav" class="col-lg-auto page-nav">
                <div class="sidebar-p-y" id="timer" runat="server">
                    <div class="sidebar-heading">Time left</div>
                    <div class="countdown sidebar-p-x" data-value="4" data-unit="hour">
                        <p class="pl-1 pr-1"><span class="h5 text-primary">03</span> hrs <span class="h5 text-primary">55</span> min <span class="h5 text-primary">39</span> sec</p>
                    </div>



                </div>

            </div>
        </div>



    </div>




    <div class="container page__container">
        <div class="footer">
        </div>
    </div>


</asp:Content>

