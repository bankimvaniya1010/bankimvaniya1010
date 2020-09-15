<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="admin_Default" MasterPageFile="~/admin/admin.master" %>

<asp:Content ID="content1" runat="server" ContentPlaceHolderID="head">
</asp:Content>
<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="container-fluid page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">Dashboard</li>
        </ol>
        <h1 class="h2">Dashboard</h1>

          <div class="row">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-header d-flex align-items-center">
                        <div class="h2 mb-0 mr-3 text-primary"></div>
                        <div class="flex">
                           <h2>WELCOME <asp:Label runat="server" ID="isfullservicethenlbl"></asp:Label></h2>
                        </div>
                    </div>
                        <div class="card-body">
                    <br/>
                    <div id="defaultinstructions" runat="server">
                         <div>
                        Welcome to the World’s most versatile online testing and proctoring platform, which is the simplest to set up and use.
                    </div><br/>
                           
                        </div>
                        <div>
                            <b> KEY FEATURES:</b>  
                           <ol>
                                <li>Go digital in 5 minutes: Simply scan and upload your existing exam paper, students can use an online live webpage editor and screen capture tools to complete the exam OR hand write their answers use an dynamic on screen QR code to scan and upload answers using their mobile phone. Teachers use Acrobat DC for checking answer sheets.</li><br>
                                <li>Modular solution: Create Assessment, Schedule Assessment, Assign Assessments, Checker Assignment, Results Publishing, available in modular format.</li><br>
                                <li>Versatile questions bank builder: Beyond the “Go Digital in 5 Minutes” tool, the system offers a versatile eQuestions bank builder allowing for handling of all types of objective and subjective questions.</li><br>
                                <li>Live remote proctoring: Remote live proctoring solution, allows Institutions to set up and assign their own proctors. 100% live recording of sessions with best in class security. </li><br>
                                <li>Integrated checking module: Independent checker assignment module, Checker friendly processes. Auto checking and marking for objective questions.</li><br>
                                <li>Integrated student results view: Automated notifications to students once examiner completes checking and marking. Online results and viewing of checker comments & answer sheets released online on scheduled time.</li><br>
                                </ol>
                        </div>
                    </div>
                   
                </div>
            </div>
           
        </div>
    </div>
    <script>
        $(document).ready(function () {
	        $('.sidebar-menu-item').removeClass('open');
	        $('#dashboard_list').addClass('open');
	        $('.sidebar-menu-item').removeClass('active');
	        $('#dashboard').addClass('active');
	    });
    </script>
</asp:Content>
