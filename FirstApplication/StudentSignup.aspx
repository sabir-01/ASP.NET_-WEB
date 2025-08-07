<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentSignup.aspx.cs" Inherits="FirstApplication.StudentSignup" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Student Signup</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body class="bg-light">
    <form id="form1" runat="server" enctype="multipart/form-data">
        <div class="container mt-5">
            <div class="row justify-content-center">
                <div class="col-md-8">
                    <div class="card shadow p-4">
                        <h3 class="text-center text-primary">Student Registration</h3>
                        <hr />
                        <asp:Label ID="lblMessage" runat="server" CssClass="text-danger"></asp:Label>

                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label class="form-label">Full Name</label>
                                <asp:TextBox ID="txtName" runat="server" CssClass="form-control" />
                            </div>
                            <div class="col-md-6 mb-3">
                                <label class="form-label">Email</label>
                                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email" />
                            </div>
                            <div class="col-md-6 mb-3">
                                <label class="form-label">Password</label>
                                <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" />
                            </div>
                            <div class="col-md-6 mb-3">
                                <label class="form-label">Phone</label>
                                <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" />
                            </div>
                            <div class="col-md-6 mb-3">
                                <label class="form-label">Gender</label><br />
                                <asp:RadioButton ID="rdoMale" runat="server" GroupName="Gender" Text="Male" />
                                <asp:RadioButton ID="rdoFemale" runat="server" GroupName="Gender" Text="Female" />
                            </div>
                            <div class="col-md-6 mb-3">
                                <label class="form-label">Date of Birth</label>
                                <asp:TextBox ID="txtDOB" runat="server" CssClass="form-control" TextMode="Date" />
                            </div>
                            <div class="col-md-6 mb-3">
                                <label class="form-label">Department</label>
                                <asp:DropDownList ID="ddlDepartment" runat="server" CssClass="form-select">
                                    <asp:ListItem Text="Select Department" Value="" />
                                    <asp:ListItem Text="Computer Science" Value="CS" />
                                    <asp:ListItem Text="Engineering" Value="Engineering" />
                                    <asp:ListItem Text="Business" Value="Business" />
                                    <asp:ListItem Text="Medical" Value="Medical" />
                                </asp:DropDownList>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label class="form-label">Upload Profile Picture</label>
                                <asp:FileUpload ID="fuImage" runat="server" CssClass="form-control" />
                            </div>
                        </div>

                        <asp:Button ID="btnSignup" runat="server" Text="Register" CssClass="btn btn-primary w-100" Height="50px" Width="1244px" OnClick="btnSignup_Click" />

                        <div class="mt-3 text-center">
                            If already Account <a href="Default.aspx">Login up here</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>

