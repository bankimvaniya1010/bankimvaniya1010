<%@ Page Language="C#" AutoEventWireup="true" CodeFile="backlog.aspx.cs" Inherits="backlog" MasterPageFile="~/student.master" %>


<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="container-fluid page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">Back Log Details</li>
        </ol>
        <h1 class="h2">Back Log Details</h1>

    </div>
    <div class="page ">

        <div class="container page__container p-0">
            <div class="row m-0">
                <div class="col-lg container-fluid page__container">

                  <div class="card" style="width:650px;">
                        <div class="list-group list-group-fit">
                            <div class="list-group-item">
                                <div class="form-group m-0" role="group" aria-labelledby="label-financial">
                                    <div class="form-row">
                                        <label id="label-financial" for="financial" class="col-md-3 col-form-label form-label"><%=GapStartFrom %></label>
                                        <div class="col-md-9">
                                             <input id="txtGapFrom" runat="server" type="text" class="form-control" placeholder="Gap Start From" data-toggle="flatpickr" value="today">
                                           
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item">
                                <div class="form-group m-0" role="group" aria-labelledby="label-branch">
                                    <div class="form-row">
                                        <label id="label-branch" for="branch" class="col-md-3 col-form-label form-label"><%=GapEndTo %></label>
                                        <div class="col-md-9">
                                             <input id="txtGapEnd" runat="server" type="text" class="form-control" placeholder="Gap End To" data-toggle="flatpickr" value="today">
                                            
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item">
                                <div class="form-group m-0" role="group" aria-labelledby="label-branchphone">
                                    <div class="form-row">
                                        <label id="label-branchphone" for="branchphone" class="col-md-3 col-form-label form-label"><%=Expalnantion %></label>
                                        <div class="col-md-9">
                                            <input id="txtExplanation" runat="server" type="text" placeholder="Explanation" value="" class="form-control">
                                        </div>
                                    </div>
                                </div>
                            </div>
                           
                            <div class="list-group-item">

                                <div class="form-row">

                                    <div class="col-md-9">
                                        <div class="table-responsive" data-toggle="lists" data-lists-values='["name"]'>
                                             <asp:GridView ID="grdGaps" runat="server" CssClass="table" AutoGenerateColumns="false" >
                                                            <Columns>
                                                                <asp:TemplateField ItemStyle-Width="30px" HeaderText="Explanation">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblName" runat="server"
                                                                            Text='<%#Eval("explanation")%>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                               
                                                                <asp:TemplateField HeaderText="Gap From">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblStart" runat="server" Text='<%#Eval("gap_from", "{0:dd/MM/yyyy}") %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                  <asp:TemplateField HeaderText="Gap To">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblStart" runat="server" Text='<%#Eval("gap_To", "{0:dd/MM/yyyy}") %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                            </Columns>
                                                        </asp:GridView>

                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>

                  
                </div>
                <div id="page-nav" class="col-lg-auto page-nav">
                    <div data-perfect-scrollbar>
                        <div class="page-section pt-lg-32pt">
                            <ul class="nav page-nav__menu">
                                <li class="nav-item">
                                    <a href="basicinfo.aspx" class="nav-link ">Basic Information</a>
                                </li>
                                <li class="nav-item">
                                    <a href="educationinfo.aspx" class="nav-link">Education Information</a>
                                </li>
                                <li class="nav-item">
                                    <a href="languageproficiency.aspx" class="nav-link ">Language Proficiency</a>
                                </li>
                                <li class="nav-item">
                                    <a href="backlog.aspx" class="nav-link active">Backlog</a>
                                </li>
                                <li class="nav-item">
                                    <a href="employerinfo.aspx" class="nav-link ">Employers Info</a>
                                </li>
                                <li class="nav-item">
                                    <a href="sponsor.aspx" class="nav-link">Sponsors Info</a>
                                </li>
                                <li class="nav-item">
                                    <a href="financial.aspx" class="nav-link ">Financial Info</a>
                                </li>
                                <li class="nav-item">
                                    <a href="selfassesment.aspx" class="nav-link">Self Assesement</a>
                                </li>
                            </ul>
                            <div class="page-nav__content">
                                 <asp:Button ID="btnGapDetails" runat="server" Text="Save Changes" CssClass="btn btn-success" OnClick="btnGapDetails_Click" />
                               
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
    </div>
     <script>
        $('#ContentPlaceHolder1_txtGapEnd').flatpickr({

            dateFormat: 'Y-m-d'
        });
        $('#ContentPlaceHolder1_txtGapFrom').flatpickr({

            dateFormat: 'Y-m-d'
        });

    </script>
</asp:Content>
