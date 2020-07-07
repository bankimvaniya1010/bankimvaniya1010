<%@ Page Language="C#" AutoEventWireup="true" CodeFile="student_details.aspx.cs" Inherits="student_details" MasterPageFile="~/student.master"%>

<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">


    <div class="container-fluid page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">Personal Details</li>
        </ol>
        <h1 class="h2">PERSONAL DETAILS</h1>

    </div>
    <div class="page ">
        <div class="container page__container">
            <div class="row">                
                  <div class="col-md-8">
                    <div class="card">
                        <div class="card-body list-group list-group-fit">
                            <div class="list-group-item" id="Div4" runat="server">
                                <div class="form-group m-0" role="group" aria-labelledby="label-title">
                                    <div class="form-row">
                                        <label runat="server" id="label4" for="title" class="col-md-3 col-form-label form-label">First Name</label>
                                        <div class="col-md-6">                                            
                                            <input  id="txtfirstname" runat="server" type="text" placeholder="School ID No" value="" class="form-control">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="Div5" runat="server">
                                <div class="form-group m-0" role="group" aria-labelledby="label-title">
                                    <div class="form-row">
                                        <label runat="server" id="label5" for="title" class="col-md-3 col-form-label form-label">Middle Name</label>
                                        <div class="col-md-6">                                            
                                            <input  id="txtmiddlename" runat="server" type="text" placeholder="School ID No" value="" class="form-control">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div>
                                <label></label>
                                <img src="">

                            </div>
                            <div class="list-group-item" id="Div6" runat="server">
                                <div class="form-group m-0" role="group" aria-labelledby="label-title">
                                    <div class="form-row">
                                        <label runat="server" id="label6" for="title" class="col-md-3 col-form-label form-label">Last Name</label>
                                        <div class="col-md-6">                                            
                                            <input  id="txtlastname" runat="server" type="text" placeholder="School ID No" value="" class="form-control">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="Div7" runat="server">
                                <div class="form-group m-0" role="group" aria-labelledby="label-title">
                                    <div class="form-row">
                                        <label runat="server" id="label7" for="title" class="col-md-3 col-form-label form-label">Email</label>
                                        <div class="col-md-6">                                            
                                            <input  id="txtemail" runat="server" type="text" placeholder="School ID No" value="" class="form-control">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            </div>
                            <div class="list-group-item" id="Div3" runat="server">
                                <div class="form-group m-0" role="group" aria-labelledby="label-title">
                                    <div class="form-row">
                                        <label runat="server" id="label3" for="title" class="col-md-3 col-form-label form-label">Contact No</label>
                                        <div class="col-md-6">                                            
                                            <input  id="txtcontactno" runat="server" type="text" placeholder="School ID No" value="" class="form-control">
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="list-group-item" id="title" runat="server">
                                <div class="form-group m-0" role="group" aria-labelledby="label-title">
                                    <div class="form-row">
                                        <label runat="server" id="labeltitle" for="title" class="col-md-3 col-form-label form-label">Date of Birth</label>
                                        <div class="col-md-6">                                            
                                            <input  id="txtdob" runat="server" type="text" placeholder="" value="" class="form-control">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="Div1" runat="server">
                                <div class="form-group m-0" role="group" aria-labelledby="label-title">
                                    <div class="form-row">
                                        <label runat="server" id="label1" for="title" class="col-md-3 col-form-label form-label">Upload photo</label>
                                        <div class="col-md-6">                                            
                                            <asp:FileUpload runat="server" ID="fileupload"/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="Div2" runat="server">
                                <div class="form-group m-0" role="group" aria-labelledby="label-title">
                                    <div class="form-row">
                                        <label runat="server" id="label2" for="title" class="col-md-3 col-form-label form-label">Country of citizenship</label>
                                        <div class="col-md-6">                                            
                                           <asp:DropDownList runat="server" class="form-control" ID="ddlcountrycitizenship"></asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                            </div>
                         <div class="list-group-item" id="Div8" runat="server">
                                <div class="form-group m-0" role="group" aria-labelledby="label-title">
                                    <div class="form-row">
                                        <label runat="server" id="label8" for="title" class="col-md-3 col-form-label form-label">Country of Birth</label>
                                        <div class="col-md-6">                                            
                                           <asp:DropDownList runat="server" class="form-control" ID="ddldob"></asp:DropDownList>
                                            
                                        </div>
                                    </div>
                                </div>
                            </div>
                         <div class="list-group-item" id="Div9" runat="server">
                                <div class="form-group m-0" role="group" aria-labelledby="label-title">
                                    <div class="form-row">
                                        <label runat="server" id="label9" for="title" class="col-md-3 col-form-label form-label">Country of Residency</label>
                                        <div class="col-md-6">                                            
                                           <asp:DropDownList runat="server" class="form-control" ID="ddlcountryresidence"></asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                            </div>
                          <div class="list-group-item" id="Div10" runat="server">
                                <div class="form-group m-0" role="group" aria-labelledby="label-title">
                                    <div class="form-row">
                                        <label runat="server" id="label10" for="title" class="col-md-3 col-form-label form-label">ID Proof Type</label>
                                        <div class="col-md-6">                                            
                                           <asp:DropDownList runat="server" class="form-control" ID="ddlidproof"></asp:DropDownList>
                                        <asp:HiddenField runat="server" ID="HidIpProffID"/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                         <div class="list-group-item" id="Div11" runat="server">
                                <div class="form-group m-0" role="group" aria-labelledby="label-title">
                                    <div class="form-row">
                                        <label runat="server" id="label11" for="title" class="col-md-3 col-form-label form-label">ID Proof Number</label>
                                        <div class="col-md-6">                                            
                                          <input type="text" runat="server" id="txtidproofnumber">
                                        </div>
                                    </div>
                                </div>
                            </div>
                         <div class="list-group-item" id="Div12" runat="server">
                                <div class="form-group m-0" role="group" aria-labelledby="label-title">
                                    <div class="form-row">
                                        <label runat="server" id="label12" for="title" class="col-md-3 col-form-label form-label">Upload copy of ID Proof</label>
                                        <div class="col-md-6">                                            
                                           <asp:FileUpload runat="server" ID="fileuploadcopy"/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                         <div class="list-group-item" id="Div13" runat="server">
                                <div class="form-group m-0" role="group" aria-labelledby="label-title">
                                    <div class="form-row">
                                        <label runat="server" id="label13" for="title" class="col-md-3 col-form-label form-label">Institution</label>
                                        <div class="col-md-6">                                            
                                           <asp:DropDownList runat="server" class="form-control" ID="ddlinstitution"></asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        <div class="list-group-item" id="Div14" runat="server">
                                <div class="form-group m-0" role="group" aria-labelledby="label-title">
                                    <div class="form-row">
                                        <label runat="server" id="label14" for="title" class="col-md-3 col-form-label form-label">Campus</label>
                                        <div class="col-md-6">                                            
                                           <asp:DropDownList runat="server" class="form-control" ID="ddlcampus"></asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        <div class="list-group-item" id="Div15" runat="server">
                                <div class="form-group m-0" role="group" aria-labelledby="label-title">
                                    <div class="form-row">
                                        <label runat="server" id="label15" for="title" class="col-md-3 col-form-label form-label">Institution Student ID</label>
                                        <div class="col-md-6">                                            
                                           <input type ="text" runat="server" class="form-control" id="txtstudentid"/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        <div class="list-group-item" id="Div16" runat="server">
                                <div class="form-group m-0" role="group" aria-labelledby="label-title">
                                    <div class="form-row">
                                        <label runat="server" id="label16" for="title" class="col-md-3 col-form-label form-label">Class</label>
                                        <div class="col-md-6">                                            
                                           <asp:DropDownList runat="server" class="form-control" ID="ddlclass"></asp:DropDownList>
                                            <asp:HiddenField runat="server" ID="HidclassID"/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        <div class="list-group-item" id="Div17" runat="server">
                                <div class="form-group m-0" role="group" aria-labelledby="label-title">
                                    <div class="form-row">
                                        <label runat="server" id="label17" for="title" class="col-md-3 col-form-label form-label">Group</label>
                                        <div class="col-md-6">                                            
                                           <asp:DropDownList runat="server" class="form-control" ID="ddlgroup"></asp:DropDownList>
                                            <asp:HiddenField runat="server" ID="HidGroupID"/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                               <div id="mainDiv" runat="server"></div>
                            <div class="list-group-item" id="employerwebsite" runat="server">
                                <div class="form-group m-0" role="group" aria-labelledby="label-employerwebsite">
                                    <div class="form-row justify-content-between">                                        
                                        <asp:Button ID="btn_login" OnClientClick="return validateForm();" runat="server" Text="Save" CssClass="btn btn-success" OnClick="btn_login_Click" />
                                       
                                        <div class="col-md-6">
                                            <asp:Label ID="lblMessage" runat="server" Visible="false"></asp:Label>
                                            <asp:Label ID="lblSaveTime" runat="server" Visible="false"></asp:Label>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>

                         </div>
                    </div>
                 <div class="col-md-4">
                   <%--  <div class="banImg-wrp">
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
                                                <label onclick="showFaqQuestion('<%=allQuestions[q].question%>','<%=allQuestions[q].answer.Replace(Environment.NewLine, "<br />") %>')" >  <%=allQuestions[q].question%> </label>
                                            </div>                                                  
                                    <%} %>
                                </div>
                            </div>      
                                <%} %>  
                                     
                            </div>
                        </div>
                   </div> --%>

                </div>

                <div id="page-nav" class="col-lg-auto page-nav">

                    <div>
                        <span id="tooltip"></span>
                    </div>


                </div>
        </div>


        <div class="container page__container">
            <div class="footer">
            </div>

        </div>
    </div>
      
      <script type="text/javascript">
          
          $(document).ready(function () {
              $('.sidebar-menu-item').removeClass('open');
              $('#profile_list').addClass('open');
              $('.sidebar-menu-item').removeClass('active');
              $('#studedetails').addClass('active');
          });
          $("#<%=ddldob.ClientID%>").change(function () {            

           var countryofbirth = $("#<%=ddldob.ClientID%>").val();
                $.ajax({
                    type: "POST",
                    url: "student_details.aspx/BindAlternateIDProof",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: "{'countryofbirth': '" + countryofbirth + "'}",
                    success: function (response) {
                        if (response.d) {
                            var result = JSON.parse(response.d);
                            if ($("#<%=ddlidproof.ClientID%>").length >= 1) {
                                $("#<%=ddlidproof.ClientID%>").empty();
                                $("#<%=ddlidproof.ClientID%>").append($('<option selected="selected"></option>').val(0).html("Please Select"));
                            }
                            for (var i = 0; i < result.length; i++)
                                $("#<%=ddlidproof.ClientID%>").append($("<option></option>").val(result[i].id).html(result[i].description));
                        }
                    }
              });
              $.ajax({
                    type: "POST",
                    url: "student_details.aspx/Bindclass",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: "{'countryofbirth': '" + countryofbirth + "'}",
                    success: function (response) {
                        if (response.d) {
                            var result = JSON.parse(response.d);
                            if ($("#<%=ddlclass.ClientID%>").length >= 1) {
                                $("#<%=ddlclass.ClientID%>").empty();
                                $("#<%=ddlclass.ClientID%>").append($('<option selected="selected"></option>').val(0).html("Please Select"));
                            }
                            for (var i = 0; i < result.length; i++)
                                $("#<%=ddlclass.ClientID%>").append($("<option></option>").val(result[i].id).html(result[i].description));
                        }
                    }
              });
              $.ajax({
                    type: "POST",
                    url: "student_details.aspx/BindGroup",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: "{'countryofbirth': '" + countryofbirth + "'}",
                    success: function (response) {
                        if (response.d) {
                            var result = JSON.parse(response.d);
                            if ($("#<%=ddlgroup.ClientID%>").length >= 1) {
                                $("#<%=ddlgroup.ClientID%>").empty();
                                $("#<%=ddlgroup.ClientID%>").append($('<option selected="selected"></option>').val(0).html("Please Select"));
                            }
                            for (var i = 0; i < result.length; i++)
                                $("#<%=ddlgroup.ClientID%>").append($("<option></option>").val(result[i].id).html(result[i].description));
                        }
                    }
                });
        });

       $("#<%=ddlidproof.ClientID%>").change(function () {
            $("#<%=HidIpProffID.ClientID%>").val($("#<%=ddlidproof.ClientID%>").val());
        });
        $("#<%=ddlclass.ClientID%>").change(function () {
            $("#<%=HidclassID.ClientID%>").val($("#<%=ddlclass.ClientID%>").val());
        });
        $("#<%=ddlgroup.ClientID%>").change(function () {
            $("#<%=HidGroupID.ClientID%>").val($("#<%=ddlgroup.ClientID%>").val());
        });

          
    </script>


</asp:Content>

