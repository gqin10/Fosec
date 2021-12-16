﻿<%@ Page Title="" Language="C#" MasterPageFile="~/WebPage/Fosec.Master" AutoEventWireup="true" CodeBehind="SignupAndLogin.aspx.cs" Inherits="Fosec.WebPage.SignupAndLogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ContentPlaceHolderID="PageContent" runat="server">
    <div class="row">
        <div class="col-lg-6 col-sm-12" id="background-container">
        </div>
        <div class="col-lg-6 col-sm-12" id="login-signup-container">
            
            <div class="form-container">
                <div class="mb-3" id="login-or-signup">
                    <ul class="nav nav-pills col-8 ml-auto mr-auto" id="pills-tab" role="tablist">
                        <li class="nav-item form-nav" role="presentation"><a class="nav-link form-nav-link active" id="pills-signup-tab" data-bs-toggle="pill" data-bs-target="#pills-signup" role="tab" aria-controls="pills-signup" aria-selected="false">Sign Up</a></li>
                        <li class="nav-item form-nav" role="presentation"><a class="nav-link form-nav-link" id="pills-login-tab" data-bs-toggle="pill" data-bs-target="#pills-login" role="tab" aria-controls="pills-login" aria-selected="true">Log In</a></li>
                    </ul>
                </div>
                <div class="tab-content" id="pills-tabContent">
                    <div class="tab-pane fade" id="pills-login" role="tabpanel" aria-labelledby="pills-login-tab">
                        <div class="mt-3 mb-2">
                            <label for="loginUname" class="form-label">Username</label>
                            <asp:TextBox ID="loginUname" CssClass="form-control" type="text" placeholder="Your username" runat="server"></asp:TextBox>
                        </div>
                        <div class="mb-3">
                            <label for="loginPwd" class="form-label">Password</label>
                            <asp:TextBox ID="loginPwd" CssClass="form-control" type="password" placeholder="Your password" runat="server"></asp:TextBox>
                        </div>
                        <asp:Button ID="loginBtn" CssClass="btn btn-primary mb-3" runat="server" Text="Login" OnClick="LoginBtn_Click" />
                     </div>
                     <div class="tab-pane fade show active" id="pills-signup" role="tabpanel" aria-labelledby="pills-signup-tab">
                        <div class="mb-2">
                            <label for="signupEmail" class="form-label">Email</label>
                            <asp:TextBox ID="signupEmail" CssClass="form-control" type="text" placeholder="Email" runat="server"></asp:TextBox>
                        </div>
                        <div class="mb-2">
                            <label for="signupUname" class="form-label">Username</label>
                            <asp:TextBox ID="signupUname" CssClass="form-control" type="text" placeholder="Username" runat="server"></asp:TextBox>
                        </div>
                        <div class="mb-2">
                            <label for="signupPwd" class="form-label">Password</label>
                            <asp:TextBox ID="signupPwd" CssClass="form-control" type="password" placeholder="Password" runat="server"></asp:TextBox>
                        </div>
                        <div class="mb-3">
                            <label for="signupConfirmPwd" class="form-label">Confirm Password</label>
                            <asp:TextBox ID="signupConfirmPwd" CssClass="form-control" type="password" placeholder="Re-enter password" runat="server"></asp:TextBox>
                        </div>
                        <asp:Button CssClass="btn btn-primary mb-3" ID="signupBtn" runat="server" Text="Sign Up" OnClick="SignupBtn_Click" />
                        </div>
                    </div>
            </div>
        </div>
    </div>
</asp:Content>