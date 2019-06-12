<%@ Page Language="C#" AutoEventWireup="true" CodeFile="edituniversitygrouping.aspx.cs" Inherits="admin_edituniversitygrouping" MasterPageFile="~/admin/admin.master" %>

<asp:Content ID="content1" runat="server" ContentPlaceHolderID="head">
</asp:Content>
<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="container page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">Edit University Grouping</li>
        </ol>

        <h1 class="h2">Edit University Grouping</h1>

        <div class="card">
            <div class="tab-content card-body">
                <div class="tab-pane active" id="first">
                    
                    <div class="form-group row">
                         <label for="groupheadUniversity" class="col-sm-3 col-form-label form-label">Group Head University</label>
                            <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <asp:DropDownList ID="ddlUniversity" runat="server" class="form-control"></asp:DropDownList>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-sm-8">
                        <div class="row">
                            <asp:CheckBoxList ID="checkBoxList" runat="server"></asp:CheckBoxList>
                        </div>
                    </div>

                    <div class="form-group row">
                        <div class="col-sm-8 offset-sm-3">
                            <div class="media align-items-center">
                                <div class="media-left">
                                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-primary btn-block" OnClick="btnSubmit_Click" OnClientClick="return validateForm()"/>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript">
        $(document).ready(function () {
            $("#<%=ddlUniversity.ClientID%>").change(function () {
                $("#<%=checkBoxList.ClientID%>").empty();
                var universityValue = $('#<%=ddlUniversity.ClientID%>').val();
                $('#<%=ddlUniversity.ClientID%> option').each(function (index, option) {
                    if (index != 0 && option.attributes.value.value != universityValue) {
                        var id = $(this).val();
                        var value = $(this).val();
                        var text = option.innerText;
                        $('<label />', { 'for': 'cb' + id, id:'label'+id }).appendTo("#<%=checkBoxList.ClientID%>");
                        $('<input />', { type: 'checkbox', id: 'cb' + id, value: value, name: 'university' }).appendTo('#label' + id);
                        $('#label' + id).append(text);
                    }
                });
            });

        });
        function validateForm() {
            var universityValue = $('#<%=ddlUniversity.ClientID%>').val();
            var count = 0;
            $('#<%=checkBoxList.ClientID%> input:checked').each(function () {
                count++;
            });

            if (universityValue == 0 || isNaN(parseInt(universityValue))) {
                alert("Please select University");
                return false;
            }
            else if (count == 0) {
                alert("Please check university for mapping");
                return false;
            }

            return true;
            
        }
    </script>

</asp:Content>