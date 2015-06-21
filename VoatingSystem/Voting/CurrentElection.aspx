<%@ Page Title="" Language="C#" MasterPageFile="~/Voting/Voating.Master" AutoEventWireup="true" CodeBehind="CurrentElection.aspx.cs" Inherits="VoatingSystem.Voting.CurrentElection" %>

<%@ Register Src="~/UserControl/UCSenateElection.ascx" TagPrefix="uc1" TagName="UCSenateElection" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:UCSenateElection runat="server" id="UCSenateElection" />
</asp:Content>
