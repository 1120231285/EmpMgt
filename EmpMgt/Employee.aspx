<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Employee.aspx.cs" Inherits="EmpMgt.Employee" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        员工管理-Command及GridView<br /><hr />
        编号：<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <br />
        姓名：<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        <br />
        工资：<asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
        <br />
        电话：<asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
        <br />
        <asp:Button ID="btnInsert_Click" runat="server" OnClick="btnInsert_Click_Click" Text="插入" />
        <asp:Button ID="btnUpdate_Click" runat="server" OnClick="btnUpdate_Click_Click" Text="修改" />
        <asp:Button ID="btnDelete_Click" runat="server" OnClick="btnDelete_Click_Click" Text="删除" />
        <br />
        <asp:Label ID="Label1" runat="server"></asp:Label>
        <br />
        <asp:GridView ID="GridView1" runat="server">
        </asp:GridView>
    </form>
</body>
</html>
