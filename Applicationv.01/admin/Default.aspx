﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="admin_Default" MasterPageFile="~/admin/admin.master" %>

<asp:Content ID="content1" runat="server" ContentPlaceHolderID="head">
</asp:Content>
<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="container-fluid page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">Dashboard</li>
        </ol>
        <h1 class="h2">Dashboard</h1>

        <div class="card">


            <div class="tab-content card-body">
                <div class="tab-pane active" id="first">
                    <div>Welcome To The Application Center.</div>
                    
                  
                  
                   


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
