<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>
<%@ Register Assembly="DevExpress.Web.v15.1, Version=15.1.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <script type="text/javascript" language="javascript">
        function FocusedRowChanged(s, e) {
            dataview.PerformCallback(s.GetRowKey(s.GetFocusedRowIndex()));
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="AccessDataSource2"
                KeyFieldName="CategoryID" ClientInstanceName="grid">
                <SettingsBehavior AllowFocusedRow="True" />
                <ClientSideEvents FocusedRowChanged="FocusedRowChanged" />
                <Columns>
                    <dx:GridViewDataTextColumn FieldName="CategoryID" ReadOnly="True" VisibleIndex="0">
                        <EditFormSettings Visible="False" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="CategoryName" VisibleIndex="1">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Description" VisibleIndex="2">
                    </dx:GridViewDataTextColumn>
                </Columns>
            </dx:ASPxGridView>
            <asp:AccessDataSource ID="AccessDataSource2" runat="server" DataFile="~/App_Data/nwind.mdb"
                SelectCommand="SELECT [CategoryID], [CategoryName], [Description], [Picture] FROM [Categories]">
            </asp:AccessDataSource>
        </div>
        <dx:ASPxDataView ID="ASPxDataView1" runat="server" ColumnCount="1" DataSourceID="AccessDataSource1"
            RowPerPage="1" ClientInstanceName="dataview" OnCustomCallback="ASPxDataView1_CustomCallback"
            OnLoad="ASPxDataView1_Load">
            <ItemTemplate>
                <b>ProductID</b>:
                <asp:Label ID="ProductIDLabel" runat="server" Text='<%# Eval("ProductID") %>' />
                <br />
                <b>ProductName</b>:
                <asp:Label ID="ProductNameLabel" runat="server" Text='<%# Eval("ProductName") %>' />
                <br />
                <b>CategoryID</b>:
                <asp:Label ID="CategoryIDLabel" runat="server" Text='<%# Eval("CategoryID") %>' />
                <br />
            </ItemTemplate>
        </dx:ASPxDataView>
        <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/nwind.mdb"
            SelectCommand="SELECT [ProductID], [ProductName], [CategoryID] FROM [Products] WHERE ([CategoryID] = @CategoryID)">
            <SelectParameters>
                <asp:Parameter DefaultValue="1" Name="CategoryID" Type="Int32" />
            </SelectParameters>
        </asp:AccessDataSource>
    </form>
</body>
</html>