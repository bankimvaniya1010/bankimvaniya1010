<%@ Page Language="C#" AutoEventWireup="true" CodeFile="visaDates.aspx.cs" Inherits="admin_visaDates" MasterPageFile="~/admin/admin.master"%>


<asp:Content ID="content1" runat="server" ContentPlaceHolderID="head">
</asp:Content>
<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="container page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active"></li>
        </ol>

        <h1 class="h2">Add Visa Dates</h1>

        <div class="card">
            <div class="tab-content card-body">
                <div class="tab-pane active" id="first">
                    
                    <div class="form-group row">
                         <label for="country" class="col-sm-3 col-form-label form-label">APPLICATION VERIFIED BY VISA STAFF</label>
                            <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                   <input id="txtverifedbystaff" runat="server" type="text" class="form-control" placeholder="Select Date" value="" readonly="readonly">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                         <label for="country" class="col-sm-3 col-form-label form-label">APPLICATION SUBMITTED TO DEPARTMENT</label>
                            <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                   <input id="txtsubmittedtodept" runat="server" type="text" class="form-control" placeholder="Select Date" value="" readonly="readonly">
                                </div>
                            </div>
                        </div>
                    </div>
                   <div class="form-group row">
                         <label for="country" class="col-sm-3 col-form-label form-label">VISA DECISION RECEIVED </label>
                            <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                   <input id="txtvisadecisionreceived" runat="server" type="text" class="form-control" placeholder="Select Date" value="" readonly="readonly">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                         <label for="country" class="col-sm-3 col-form-label form-label">Visa Granted</label>
                            <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-2">
                                   <input type="radio" class="form-check-input" name="visagranted" runat="server" id="rbYes">Yes
                                    
                                </div>
                                <div class="col-md-3">
                                    <input type="radio" class="form-check-input" name="visagranted" runat="server" id="rbNo">No
                                </div>
                            </div>
                        </div>
                    </div>
                     <div class="form-group row">
                         <label for="country" class="col-sm-3 col-form-label form-label">VISA DECISION RECEIVED </label>
                            <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">                                    
                                   <input id="txtremarks" runat="server" type="text" class="form-control" placeholder="Add Visa Remarks" value="">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-sm-8 offset-sm-3">
                            <div class="media align-items-center">
                                <div class="media-left">
                                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-primary btn-block" OnClick="btnSubmit_Click" />
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>

    <script>
        
        $(document).ready(function () {
            $('.sidebar-menu-item').removeClass('open');
            $('#manageapplicantions_list').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#applicantlist').addClass('active');


            $('#ContentPlaceHolder1_txtverifedbystaff').datepicker({dateFormat: 'dd-mm-yy' });
            $('#ContentPlaceHolder1_txtsubmittedtodept').datepicker({dateFormat: 'dd-mm-yy' });
            $('#ContentPlaceHolder1_txtvisadecisionreceived').datepicker({dateFormat: 'dd-mm-yy' });
        });
    </script>

</asp:Content>