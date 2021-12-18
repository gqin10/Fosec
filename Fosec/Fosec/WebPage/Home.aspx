﻿<%@ Page Title="" Language="C#" MasterPageFile="~/WebPage/Fosec.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Fosec.WebPage.Home" %>

<%@ Import Namespace="Fosec.Utils" %>

<asp:Content ContentPlaceHolderID="PageTitle" runat="server">
    Fosec
</asp:Content>

<asp:Content ContentPlaceHolderID="PageContent" runat="server">
    <div class="container mb-3">
        <div id="tagContainer" class="box-shadow">
            <asp:Button class="btn tag-btn" runat="server" Text='All' OnClick="TagButtonClick" />
            <asp:Repeater ID="tagRepeater" runat="server" DataSourceID="TagDataSource">
                <ItemTemplate>
                    <asp:Button class="btn tag-btn" runat="server" Text='<%# Eval("tagname") %>' OnClick="TagButtonClick" />
                </ItemTemplate>
            </asp:Repeater>
        </div>

        <div class="row">
            <div class="align-right-container">
                <asp:HyperLink ID="createNewThreadBtn" CssClass="text-right btn" Text="Create New Thread" NavigateUrl="/WebPage/CreateThread.aspx" runat="server"></asp:HyperLink>
            </div>
        </div>

        <div class="box-shadow thread-container">
            <div class="sectionTitle p-2">
                <asp:Label Text="All" ID="selectedTagName" class="text-center" runat="server"></asp:Label>
            </div>

            <div id="homeThreadContainer">
                <asp:Repeater ID="threadRepeater" runat="server" DataSourceID="AllThreadDataSource">
                    <ItemTemplate>
                        <div class="threadContainer row">
                            <a class="userInformation link-text-view col-3" href='<%# @"/WebPage/Profile.aspx?userid=" + Eval("userid") %>'>
                                <div class="image-holder mb-3">
                                    <asp:Image CssClass="userProfileImage" runat="server" ImageUrl='<%#ImageUtil.GetBase64PathByByteArray(Eval("profileImage"))%>' />
                                </div>
                                <asp:Label runat="server" Text='<%# Eval("username") %>' />
                            </a>
                            <div class="threadInformation col-9 d-flex flex-column justify-content-between">
                                <a class="threadInformation link-text-view" href='<%# @"/Webpage/Thread.aspx?threadid=" + Eval("threadId") %>'>
                                    <asp:Label CssClass="threadTitle row" runat="server" Text='<%# Eval("title") %>' />
                                    <asp:Label CssClass="threadContent row" runat="server" Text='<%# Eval("content") %>' />
                                </a>
                                <div>
                                    <hr />
                                    <div class="row">
                                        <div class="tagName col-8">
                                            <asp:Button CssClass="btn no-hover tag-in-thread" runat="server" Text='<%# Eval("tagName") %>' OnClick="TagButtonClick"></asp:Button>
                                        </div>
                                        <asp:Label CssClass="threadDate col-4 text-right" runat="server" Text='<%# Eval("date") %>' />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <br />
                    </ItemTemplate>
                </asp:Repeater>

                <%--Data Sources--%>
                <asp:SqlDataSource ID="TagDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Tag]"></asp:SqlDataSource>
                <asp:SqlDataSource ID="AllThreadDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Threads.threadId as threadid, Threads.userId as userid, Threads.title as title, Threads.[content] as content, Threads.threadDate AS date, Tag.tagName as tagname, Users.profileImage as profileimage, Users.username as username
                FROM Threads LEFT OUTER JOIN Tag ON Threads.tagNo = Tag.tagId left outer join users on users.userid=threads.userid
                ORDER BY date DESC"></asp:SqlDataSource>
                <asp:SqlDataSource ID="FilteredThreadDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Threads.threadId as threadid, Threads.userId as userid, Threads.title as title, Threads.[content] as content, Threads.threadDate AS date, Tag.tagName as tagname, Users.profileImage as profileimage, Users.username as username
                FROM Threads LEFT OUTER JOIN Tag ON Threads.tagNo = Tag.tagId left outer join users on users.userid=threads.userid
                WHERE (Tag.tagName = @tagName)
                ORDER BY date DESC">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="selectedTagName" DefaultValue="" Name="tagName" PropertyName="Text" Type="Object" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
        </div>
    </div>
</asp:Content>


