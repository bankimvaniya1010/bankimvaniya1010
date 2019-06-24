<%@ Page Language="C#" AutoEventWireup="true" CodeFile="clarificationquestion.aspx.cs" Inherits="clarificationquestion" MasterPageFile="~/student.master" %>

<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">


    <div class="container-fluid page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">Clarification Question</li>
        </ol>
        <h1 class="h2">Clarification Question

        </h1>

    </div>
    <div class="page ">
        <div class="container page__container p-0">
            <div class="row m-0">
                <div class="col-lg container-fluid page__container">

                    <div class="card" style="width: 650px;">
                        <div class="list-group list-group-fit">
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
                                        <asp:Button ID="btn_login" runat="server" Text="Save Changes" CssClass="btn btn-success" OnClick="btn_login_Click" OnClientClick="return validateForm()" />
                                        <div class="col-md-6">
                                            <asp:Label ID="lblMessage" runat="server" Visible="false"></asp:Label>
                                            <asp:Label ID="lblSaveTime" runat="server"></asp:Label>
                                        </div>
                                    </div>
                                </div>
                            </div>

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
    </script>
</asp:Content>