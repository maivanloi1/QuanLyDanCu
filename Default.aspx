      <%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="QuanLyDanCu.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Quản Lý Dân Cư</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
    <script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h3 style="text-align:center" >Quản Lý Dân Cư</h3></div>
        <a id="login" style="position:relative; left: 1350px;" href="Login.aspx">Login</a>
        <%-- GridView --%>
        <div class="row" style="margin-top:20px;">
            <div class="col-sm-2"></div>
            <div class="col-sm-8">
                <asp:GridView ID="gvCongDan" runat="server" AutoGenerateColumns="False" AllowSorting="True"
    DataKeyNames="ID"
    CssClass="table table-striped table-bordered table-condensed" BorderColor="Silver"
    OnRowDeleting="gvCongDan_RowDeleting" 
    OnRowCommand="gvCongDan_RowCommand"
    EmptyDataText="Không Có Dữ Liệu">
    <Columns>
        <asp:TemplateField>
            <ItemTemplate>
                <%# Container.DataItemIndex + 1 %>
            </ItemTemplate>
            <HeaderStyle HorizontalAlign="Left" Width="25px" />
            <ItemStyle HorizontalAlign="Right" Font-Bold="true" />
        </asp:TemplateField>
        
        <asp:BoundField DataField="HoTen" HeaderText="Họ Và Tên">
            <HeaderStyle HorizontalAlign="Left"/>
            <ItemStyle HorizontalAlign="Left"/>
        </asp:BoundField>
        <asp:BoundField DataField="DiaChi" HeaderText="Địa Chỉ">
            <HeaderStyle HorizontalAlign="Left"/>
            <ItemStyle HorizontalAlign="Left"/>
        </asp:BoundField>
    

    <%--Delete CongDan--%>
    <asp:TemplateField>
        <ItemTemplate>
            <asp:LinkButton ID="lbDelCongDan" Text="Delete" runat="server" 
                OnClientClick="return confirm('Bạn có muốn xoá công dân này?');" CommandName="Delete"/>
        </ItemTemplate>
        <HeaderStyle HorizontalAlign="Left" />
        <ItemStyle HorizontalAlign="Center" Width="50px"/>
    </asp:TemplateField>

    <%--Update CongDan--%>
    <asp:TemplateField HeaderText="">
        <ItemTemplate>
            <asp:LinkButton ID="lbUpCongDan" Text="Update" runat="server"
                 CommandName="UpdCongDan" CausesValidation="false" CommandArgument='<%# Container.DataItemIndex + 1 %>'>
            </asp:LinkButton>
        </ItemTemplate>
        <ItemStyle HorizontalAlign="Center" Width="80px"/>
    </asp:TemplateField>
    </Columns>
</asp:GridView>
            </div>
        </div>
    </form>
</body>
</html>
