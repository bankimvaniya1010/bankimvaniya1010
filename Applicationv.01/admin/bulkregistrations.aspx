<%@ Page Language="C#" AutoEventWireup="true" CodeFile="bulkregistrations.aspx.cs" Inherits="admin_bulkregistrations" MasterPageFile="~/admin/admin.master" %>

<asp:Content ID="content1" runat="server" ContentPlaceHolderID="head">
    <title></title>   
</asp:Content>
<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="container page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">Bulk Registrations</li>
        </ol>
        <h1 class="h2">Bulk Registrations</h1>

        <div class="card">            
            <div class="tab-content card-body">
               
                <div class="tab-pane active" id="first">
                 
                    <div class="" id="applicantlist" runat="server">
                           <div class="list-group-item" id="Div4" runat="server">
                                <div class="form-group m-0" role="group" aria-labelledby="label-title">
                                    <div class="form-row">
                                        <label runat="server" id="label4" for="title" class="col-md-3 col-form-label form-label">Instructions: </label>
                                        <div class="col-md-8">                                            
                                            <label runat="server" id="lbltotal"> For bulk registrations you could simply upload a .csv file with the name and email address. Please download the sample .csv file format. <b>Do not delete or edit the headers</b>. Simply populate the names, email addresses, Class and Group .save the file and upload.</label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                           <div class="list-group-item" id="Div1" runat="server">
                                <div class="form-group m-0" role="group" aria-labelledby="label-title">
                                    <div class="form-row">
                                        <label runat="server" id="label1" for="title" class="col-md-3 col-form-label form-label">download sample file</label>
                                        <div class="col-md-6">                                            
                                             <a href='<%=demolink %>' target="_blank">View</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                           <div class="list-group-item" id="Div2" runat="server">
                                <div class="form-group m-0" role="group" aria-labelledby="label-title">
                                    <div class="form-row">
                                        <label runat="server" id="label2" for="title" class="col-md-3 col-form-label form-label">upload data</label>
                                        <div class="col-md-6">    
                                            <asp:FileUpload runat="server" ID="postedFile"/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        <div class="" id="Div6" runat="server">
                                <div class="form-group m-0" role="group" aria-labelledby="label-title">
                                    <div class="form-row">
                                        <label runat="server" id="label6" for="title" class="col-md-3 col-form-label form-label"></label>
                                        <div class="col-md-6">
                                            <div style="position: relative; width: 202px; margin-bottom: 15px; height: 25px; display: block; margin-left: 100px;">
                                                <div id="progress" class="hide" style="background: #f0f0f0; height: 25px; width: 0; color: #fff;margin-top: 13%;">
                                                    <div class="status" style="margin-left: 10px;"></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                      
                         <div class="" id="Div7" runat="server">
                                <div class="form-group m-0" role="group" aria-labelledby="label-title">
                                    <div class="form-row">
                                        <label runat="server" id="label3" for="title" class="col-md-3 col-form-label form-label"></label>
                                        <div class="col-md-6">                                            
                                           <asp:button runat="server" class="btn btn-success" Text="Upload" ID="btnupload" OnClientClick="return validateUploadedFile()"></asp:button>
                                        </div>
                                    </div>
                                </div>
                            </div>


                         <%if (employees.Count > 0)
                                        {%>
                        <div class="list-group-item" id="Div3" runat="server" style="display:none">
                           <table class="table" border="1" id="ContentPlaceHolder1_grd10" style="border-collapse:collapse;">
		                        <tbody>                                                       
                                    <tr>
			                            <th scope="col">Applicant ID</th>
                                        <th scope="col">User Name</th>
                                        <th scope="col">Email</th>   
		                            </tr>
                                       
                                           <% for (var i = 0; i < employees.Count; i++)
                                            { %>
                                    <tr id="grade_tr_<%=employees[i].studentid %>">
                                        <td><%=employees[i].studentid %></td>
                                        <td style="width: 30px;">
                                            <span><%=employees[i].username %></span>
                                        </td>
                                        <td style="width: 30px;">
                                            <span><%=employees[i].email%></span>
                                        </td>                                                       
                                    </tr>

                                    <% }
                                     %>
                                                    

		                        </tbody>
                            </table>
                        </div>
                    <%} %>
                        <div class="list-group-item" id="noofapplicantsaveDiv" runat="server" style="display:none">                             
                            <label runat="server"><b> <%= noofapplicantsave %> Registrations Added Successfully .</b></label>                                            
                           
                        </div>
                        <div class="list-group-item" id="unregisteredapplicantlistDiv" runat="server" style="display:none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-title">
                                    <div class="form-row">
                                        <label runat="server" id="label5" for="title" class="col-md-3 col-form-label form-label">Un Registered List</label>
                                        <div class="col-md-6">                                            
                                             <a href='<%=unregisteredapplicantlistLink %>' target="_blank">View</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                         <%if (invalidlist.Count > 0)
                                        {%>
                        <div class="list-group-item" id="Div5" runat="server" style="display:none">
                           <table class="table" border="1" id="tblinvalid" style="border-collapse:collapse;">
		                        <tbody>                                                       
                                    <tr>
			                            
                                        <th scope="col">UserName</th>
                                        <th scope="col">Email</th>   
                                         <th scope="col"></th>   
		                            </tr>
                                        <% for (var i = 0; i < invalidlist.Count; i++)
                                            { %>
                                    <tr>
                                       
                                        <td style="width: 30px;">
                                            <span><%=invalidlist[i].firstname %></span>
                                        </td>
                                        <td style="width: 30px;">
                                            <span><%=invalidlist[i].email%></span>
                                        </td>  
                                        <td style="width: 30px;">
                                            <span><%=invalidlist[i].invalidreason%></span>
                                        </td>  
                                    </tr>

                                    <% 
                                    } %>
                                                    

		                        </tbody>
                            </table>
                            
                            <asp:GridView runat="server" ID="GridView2" Visible="false">

                            </asp:GridView>
                            <asp:HyperLink ID="HyperLink1" runat="server" Visible="False">HyperLink</asp:HyperLink>
                        </div>
                          <% 
                                    } %>
                </div>
            </div>
        </div>
    </div>
 </div>
    <script>
        function validfileExtention(filepath) {
            if (filepath == "")            
                return false;
            var fileExtension = filepath.substring(filepath.lastIndexOf(".") + 1).toString().toLowerCase();
            if (fileExtension != "csv")
               return false;            
            return true;
        }
         function validateUploadedFile() {                    
            var flag = false;
            if (!validfileExtention($("#<%=postedFile.ClientID%>").val()))
                alert("Please upload valid document");            
            else
                flag = true;
             if (flag) {
                $("#ContentPlaceHolder1_btnupload").attr("disabled", "true")
                $("#progress").removeClass("hide");
                var progressEle = $("#progress");
                progressEle.css("background-color", "blue");

                var formData = new FormData();
                var data = $("#ContentPlaceHolder1_postedFile")[0].files[0];

                formData.append("files", data);

                var dummyProgress = 1;
                var intervalId = -1;
                var req = new XMLHttpRequest();

                req.upload.addEventListener("progress", function (event) {

                    var percent = (event.loaded / event.total) * 90;
                    var progress = Math.round((event.loaded / event.total) * 90);
                    console.log("progress:" + progress);
                    if (progress < 90) {
                        $(".status").html(progress + "%");
                        progressEle.width(progress + "%");
                    }
                    else {
                        progress = progress + dummyProgress;
                        if (progress <= 99) {
                            $(".status").html(progress + "%");
                            progressEle.width(progress + "%");
                        }
                        if (intervalId == -1) {
                            intervalId = setInterval(function () {
                                progress = progress + dummyProgress;
                                dummyProgress++;
                                if (progress <= 99) {
                                    $(".status").html(progress + "%");
                                    progressEle.width(progress + "%");
                                }
                                else
                                    clearInterval(intervalId);
                            }, 2500);
                        }
                    }
                });

                req.onreadystatechange = function () {
				<%--var hostName = "<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>";--%>
                    if (req.status && req.status == 200 && (req.readyState == 4)) {
                        $("#ContentPlaceHolder1_btnupload").removeAttr("disabled");
                        alert("Uploaded successfully");
                        location.reload();
                    }
                }

                req.open("POST", 'bulkregistrations.aspx/uploadDoc', true);
                req.send(formData);
            }
            return false;
        }
        
		$(document).ready(function () {
	            $('.sidebar-menu-item').removeClass('open');
	            $('#manageregistration_list').addClass('open');
	            $('.sidebar-menu-item').removeClass('active');
	            $('#bulkregistrations').addClass('active');
	        });
	</script>

</asp:Content>