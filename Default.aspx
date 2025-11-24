<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="VeeArved._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <main>
        <div>
            <asp:Xml runat="server"
                DocumentSource="~/lugumised.xml"
                TransformSource="~/lugumised.xslt">

            </asp:Xml>
        </div>
    </main>

</asp:Content>
