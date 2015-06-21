<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ForgetPassword.aspx.cs" Inherits="VoatingSystem.Authenticate.ForgetPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <title>Electo | Log in</title>
    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport' />
    <!-- Bootstrap 3.3.2 -->
    <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <!-- Font Awesome Icons -->
    <link href="../bootstrap/css/font-awesome-min.css" rel="stylesheet" type="text/css" />
    <!-- Ionicons 2.0.0 -->
    <link href="../bootstrap/css/ionicons.min.css" rel="stylesheet" type="text/css" />
    <!-- Theme style -->
    <link href="../dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css" />
    <!-- iCheck -->
    <link href="../plugins/iCheck/square/blue.css" rel="stylesheet" type="text/css" />

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
</head>
<body class="login-page">
    <%--<form id="form1" runat="server">--%>
    <div class="login-box">
        <div class="login-logo">
            <a href="login.html"><b>Admin</b> ELECTO</a>
        </div>
        <!-- /.login-logo -->

        <!-- /.login-box -->
        <div class="login-box-body">
            <p class="login-box-msg">Forget Password</p>
            <%-- <form action="login.html" method="post">--%>
            <form id="form1" runat="server">
                <div class="form-group has-feedback">
                    <asp:DropDownList ID="ddl_ClassSection" runat="server" class="form-control"></asp:DropDownList>
                    <%--<select name="class-section" class="form-control">
                        <option value="0">Select Class</option>
                        <option value="1">1st</option>
                    </select>--%>
                </div>
                <div class="form-group has-feedback">
                    <asp:TextBox ID="txt_CandidateId" runat="server" class="form-control" placeholder="Eneter Candidate ID"></asp:TextBox>
                    <%--<input type="text" class="form-control" name="c_id" placeholder="Eneter Candidate ID" />--%>
                </div>
                <div class="form-group has-feedback">
                    <asp:TextBox ID="txt_DOB" runat="server" class="form-control" placeholder="Date of Birth"></asp:TextBox>
                    <%--<input type="date" class="form-control" placeholder="Date of Birth" />--%>
                </div>
                <div class="form-group has-feedback">
                    <asp:TextBox ID="txt_Password" runat="server" TextMode="Password" class="form-control" placeholder="Password"></asp:TextBox>
                    <%--<input type="password" class="form-control" placeholder="Password" />--%>
                </div>
                <div class="form-group has-feedback">
                    <asp:TextBox ID="txt_ConfirmPassword" runat="server" TextMode="Password" class="form-control" placeholder="Confirm Password"></asp:TextBox>
                    <%--<input type="password" class="form-control" placeholder="Confirm Password" />--%>
                </div>
                <div class="row">
                    <div class="col-xs-8">
                        <div class="checkbox icheck">
                            <label>
                                <asp:CheckBox ID="chk_Terms" runat="server" />
                                <%--<input type="checkbox" />--%>
                                I agree to the <a href="#">terms</a>
                            </label>
                        </div>
                    </div>
                    <!-- /.col -->
                    <div class="col-xs-4">
                        <asp:Button ID="btn_Submit" runat="server" Text="Sign In" class="btn btn-primary btn-block btn-flat" />
                        <%--<button type="submit" class="btn btn-primary btn-block btn-flat">Sign In</button>--%>
                    </div>
                    <!-- /.col -->
                </div>
            </form>
            <br />
            <a href="Login.aspx" class="text-center">Already Registered?</a><br />
        </div>
    </div>
    <!-- /.login-box-body -->
    <%--</form>--%>
</body>
</html>
<!-- jQuery 2.1.3 -->
<script src="../plugins/jQuery/jQuery-2.1.3.min.js"></script>
<!-- Bootstrap 3.3.2 JS -->
<script src="../bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<!-- iCheck -->
<script src="../plugins/iCheck/icheck.min.js" type="text/javascript"></script>
<script>
    $(function () {
        $('input').iCheck({
            checkboxClass: 'icheckbox_square-blue',
            radioClass: 'iradio_square-blue',
            increaseArea: '20%' // optional
        });
    });
</script>
