<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="FirstApplication.Dashboard" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        img.student-img {
            height: 50px;
            width: 50px;
            object-fit: cover;
            border-radius: 50%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">

        <div class="container mt-5">
            <div class="card shadow p-4">
                <div class="d-flex justify-content-between align-items-center mb-3">
                    <h3 class="text-primary">Welcome to Dashboard</h3>
                    <asp:Button ID="Button1" runat="server" CssClass="btn btn-danger" Text="Logout" OnClick="Button1_Click" />
                </div>

                <asp:Label ID="lblInfo" runat="server" CssClass="text-success mb-3 d-block" />

                <asp:GridView ID="gvUser" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered">
                    <Columns>
                        <asp:BoundField DataField="Id" HeaderText="ID" />
                        <asp:BoundField DataField="Name" HeaderText="Name" />
                        <asp:BoundField DataField="Email" HeaderText="Email" />
                        <asp:BoundField DataField="Department" HeaderText="Department" />
                        <asp:BoundField DataField="Phone" HeaderText="Phone" />
                        <asp:BoundField DataField="Gender" HeaderText="Gender" />
                        <asp:BoundField DataField="DOB" HeaderText="DOB" />
                        <asp:TemplateField HeaderText="Image">
                            <ItemTemplate>
                                <asp:Image ID="imgStudent" runat="server" ImageUrl='<%# Eval("Image") != DBNull.Value ? "data:image/png;base64," + Convert.ToBase64String((byte[])Eval("Image")) : "" %>' CssClass="student-img" />
                            </ItemTemplate>
                        </asp:TemplateField>

                    </Columns>
                </asp:GridView>

            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    </form>
</body>
</html>
