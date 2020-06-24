<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Employee1.aspx.cs" Inherits="EmpMgt.Employee1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            员工管理-SqlDataSource及ListView<br /><hr />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [员工] WHERE [编号] = @编号" InsertCommand="INSERT INTO [员工] ([编号], [姓名], [工资], [电话]) VALUES (@编号, @姓名, @工资, @电话)" SelectCommand="SELECT * FROM [员工]" UpdateCommand="UPDATE [员工] SET [姓名] = @姓名, [工资] = @工资, [电话] = @电话 WHERE [编号] = @编号">
                <DeleteParameters>
                    <asp:Parameter Name="编号" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="编号" Type="String" />
                    <asp:Parameter Name="姓名" Type="String" />
                    <asp:Parameter Name="工资" Type="Decimal" />
                    <asp:Parameter Name="电话" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="姓名" Type="String" />
                    <asp:Parameter Name="工资" Type="Decimal" />
                    <asp:Parameter Name="电话" Type="String" />
                    <asp:Parameter Name="编号" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:ListView ID="ListView1" runat="server" DataKeyNames="编号" DataSourceID="SqlDataSource1" InsertItemPosition="LastItem">
                <AlternatingItemTemplate>
                    <tr style="background-color: #FAFAD2;color: #284775;">
                        <td>
                            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="删除" />
                            <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="编辑" />
                        </td>
                        <td>
                            <asp:Label ID="编号Label" runat="server" Text='<%# Eval("编号") %>' />
                        </td>
                        <td>
                            <asp:Label ID="姓名Label" runat="server" Text='<%# Eval("姓名") %>' />
                        </td>
                        <td>
                            <asp:Label ID="工资Label" runat="server" Text='<%# Eval("工资") %>' />
                        </td>
                        <td>
                            <asp:Label ID="电话Label" runat="server" Text='<%# Eval("电话") %>' />
                        </td>
                    </tr>
                </AlternatingItemTemplate>
                <EditItemTemplate>
                    <tr style="background-color: #FFCC66;color: #000080;">
                        <td>
                            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="更新" />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="取消" />
                        </td>
                        <td>
                            <asp:Label ID="编号Label1" runat="server" Text='<%# Eval("编号") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="姓名TextBox" runat="server" Text='<%# Bind("姓名") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="工资TextBox" runat="server" Text='<%# Bind("工资") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="电话TextBox" runat="server" Text='<%# Bind("电话") %>' />
                        </td>
                    </tr>
                </EditItemTemplate>
                <EmptyDataTemplate>
                    <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                        <tr>
                            <td>未返回数据。</td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
                <InsertItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="插入" />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="清除" />
                        </td>
                        <td>
                            <asp:TextBox ID="编号TextBox" runat="server" Text='<%# Bind("编号") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="姓名TextBox" runat="server" Text='<%# Bind("姓名") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="工资TextBox" runat="server" Text='<%# Bind("工资") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="电话TextBox" runat="server" Text='<%# Bind("电话") %>' />
                        </td>
                    </tr>
                </InsertItemTemplate>
                <ItemTemplate>
                    <tr style="background-color: #FFFBD6;color: #333333;">
                        <td>
                            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="删除" />
                            <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="编辑" />
                        </td>
                        <td>
                            <asp:Label ID="编号Label" runat="server" Text='<%# Eval("编号") %>' />
                        </td>
                        <td>
                            <asp:Label ID="姓名Label" runat="server" Text='<%# Eval("姓名") %>' />
                        </td>
                        <td>
                            <asp:Label ID="工资Label" runat="server" Text='<%# Eval("工资") %>' />
                        </td>
                        <td>
                            <asp:Label ID="电话Label" runat="server" Text='<%# Eval("电话") %>' />
                        </td>
                    </tr>
                </ItemTemplate>
                <LayoutTemplate>
                    <table runat="server">
                        <tr runat="server">
                            <td runat="server">
                                <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                    <tr runat="server" style="background-color: #FFFBD6;color: #333333;">
                                        <th runat="server"></th>
                                        <th runat="server">编号</th>
                                        <th runat="server">姓名</th>
                                        <th runat="server">工资</th>
                                        <th runat="server">电话</th>
                                    </tr>
                                    <tr id="itemPlaceholder" runat="server">
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr runat="server">
                            <td runat="server" style="text-align: center;background-color: #FFCC66;font-family: Verdana, Arial, Helvetica, sans-serif;color: #333333;">
                                <asp:DataPager ID="DataPager1" runat="server">
                                    <Fields>
                                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                                    </Fields>
                                </asp:DataPager>
                            </td>
                        </tr>
                    </table>
                </LayoutTemplate>
                <SelectedItemTemplate>
                    <tr style="background-color: #FFCC66;font-weight: bold;color: #000080;">
                        <td>
                            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="删除" />
                            <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="编辑" />
                        </td>
                        <td>
                            <asp:Label ID="编号Label" runat="server" Text='<%# Eval("编号") %>' />
                        </td>
                        <td>
                            <asp:Label ID="姓名Label" runat="server" Text='<%# Eval("姓名") %>' />
                        </td>
                        <td>
                            <asp:Label ID="工资Label" runat="server" Text='<%# Eval("工资") %>' />
                        </td>
                        <td>
                            <asp:Label ID="电话Label" runat="server" Text='<%# Eval("电话") %>' />
                        </td>
                    </tr>
                </SelectedItemTemplate>
            </asp:ListView>
        </div>
    </form>
</body>
</html>