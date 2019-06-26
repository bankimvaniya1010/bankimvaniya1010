<%@ Page Language="C#" AutoEventWireup="true" CodeFile="default.aspx.cs" Inherits="_Default" MasterPageFile="~/student.master" %>



<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

     <div class="col-lg container-fluid page__container">
           <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="student-dashboard.html">Home</a></li>
            <li class="breadcrumb-item active">Dashboard</li>
        </ol>
        <h1 class="h2">Dashboard</h1>
    <%--<div class="card">
        <div class="progress" style="height: 20px">
            <div id="profile" runat="server" class="progress-bar bg-danger " role="progressbar" style="width: 25%" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100">Profile</div>
            <div id="question" runat="server" class="progress-bar bg-danger" role="progressbar" style="width: 25%" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100">Question</div>
            <div id="Video" runat="server" class="progress-bar bg-danger" role="progressbar" style="width: 25%" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">Video</div>
            <div id="document" runat="server" class="progress-bar bg-danger" role="progressbar" style="width: 25%" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">Documents</div>
        </div>
    </div>--%>


    <div class="row">
        <div class="col-lg-7">

            <div class="card">
                <div class="card-header d-flex align-items-center">
                    <div class="h2 mb-0 mr-3 text-primary"></div>
                    <div class="flex">
                        <h4 class="card-title">Instructions</h4>

                    </div>

                </div>
                <div class="card-body">
                    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Cumque necessitatibus distinctio adipisci eius, unde dignissimos maxime doloribus quisquam non harum?
                </div>
                <div class="card-body">
                    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Cumque necessitatibus distinctio adipisci eius, unde dignissimos maxime doloribus quisquam non harum?
                </div>
                <div class="card-body">
                    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Cumque necessitatibus distinctio adipisci eius, unde dignissimos maxime doloribus quisquam non harum?
                </div>
                <div class="card-body">
                    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Cumque necessitatibus distinctio adipisci eius, unde dignissimos maxime doloribus quisquam non harum?
                </div>
                <div class="card-body">
                    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Cumque necessitatibus distinctio adipisci eius, unde dignissimos maxime doloribus quisquam non harum?
                </div>
            </div>


        </div>
        <div class="col-lg-5">

            <div class="card">
                <div class="card-header d-flex align-items-center">
                    <div class="h2 mb-0 mr-3 text-primary"></div>
                    <div class="flex">
                        <h4 class="card-title">Settings</h4>
                    </div>

                </div>
                <div class="card-body">
                    Select Secondary Language 
                </div>
                <div class="card-body">
                    <asp:RadioButtonList ID="rblLanguage" AutoPostBack="true" runat="server" OnSelectedIndexChanged="SetSecondaryLanguage">
                       
                    </asp:RadioButtonList>
                </div>
            </div>




        </div>
    </div></div>
</asp:Content>
