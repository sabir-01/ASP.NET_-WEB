<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditUser.aspx.cs" Inherits="FirstApplication.EditUser" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Edit User</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body class="bg-light">
    <form id="form1" runat="server" class="container mt-5">
        <div class="card shadow p-4">
            <h2 class="mb-4 text-center text-primary">Edit User</h2>

            <div class="mb-3">
                <label class="form-label">Name:</label>
                <asp:TextBox ID="txtName" runat="server" CssClass="form-control"></asp:TextBox>
            </div>

            <div class="mb-3">
                <label class="form-label">Email:</label>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"></asp:TextBox>
            </div>

            <div class="mb-3">
                <label class="form-label">Password:</label>
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
            </div>

            <div class="mb-3">
                <label class="form-label">Phone:</label>
                <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control"></asp:TextBox>
            </div>

            <div class="mb-3">
                <label class="form-label d-block">Gender:</label>
                <div class="form-check form-check-inline">
                    <asp:RadioButton ID="rdoMale" runat="server" GroupName="Gender" Text="Male" CssClass="form-check-input" />
                    <label class="form-check-label" for="rdoMale">Male</label>
                </div>
                <div class="form-check form-check-inline">
                    <asp:RadioButton ID="rdoFemale" runat="server" GroupName="Gender" Text="Female" CssClass="form-check-input" />
                    <label class="form-check-label" for="rdoFemale">Female</label>
                </div>
            </div>

            <div class="mb-3">
                <label class="form-label">Date of Birth:</label>
                <asp:TextBox ID="txtDOB" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
            </div>

            <div class="mb-4">
                <label class="form-label">Department:</label>
                <asp:DropDownList ID="ddlDepartment" runat="server" CssClass="form-select">
                    <asp:ListItem Text="Select Department" Value="" />
                    <asp:ListItem Text="IT" Value="IT" />
                    <asp:ListItem Text="HR" Value="HR" />
                    <asp:ListItem Text="Finance" Value="Finance" />
                    <asp:ListItem Text="Marketing" Value="Marketing" />
                </asp:DropDownList>
            </div>

            <div class="text-center">
                <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" CssClass="btn btn-primary px-4" />
            </div>
        </div>
    </form>

    <!-- Bootstrap JS (optional) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
