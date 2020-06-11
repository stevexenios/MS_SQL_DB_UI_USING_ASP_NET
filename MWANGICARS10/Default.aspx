<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="Mwangi_Cars_Version_5._Default" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>
        <strong>MWANGI CARS</strong></h2>
    <p>
        <strong>Please Select Location ID:
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
            DataSourceID="LocationSqlDataSource" DataTextField="LocationID" 
            DataValueField="LocationID">
        </asp:DropDownList>
        </strong>
        <asp:SqlDataSource ID="LocationSqlDataSource" runat="server" 
            ConnectionString="<%$ ConnectionStrings:mwangi_steve_dbConnectionString %>" 
            SelectCommand="SELECT * FROM [LOCATION]"></asp:SqlDataSource>
    </p>
<p>
        <strong>Available Sale Lots in Selected Location</strong></p>
<p>
        <asp:DetailsView ID="DetailsView1" runat="server" CellPadding="4" 
            DataSourceID="BuyLotsSqlDataSource" ForeColor="#333333" GridLines="None" 
            Height="50px" Width="125px">
            <AlternatingRowStyle BackColor="White" />
            <CommandRowStyle BackColor="#FFFFC0" Font-Bold="True" />
            <FieldHeaderStyle BackColor="#FFFF99" Font-Bold="True" />
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
        </asp:DetailsView>
        <asp:SqlDataSource ID="BuyLotsSqlDataSource" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            SelectCommand="SELECT * FROM [SALELOT] WHERE ([LocationID] = @LocationID)">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" DefaultValue="NULL" 
                    Name="LocationID" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
    <p>
        <strong>Available Rental Lots in Selected Location</strong></p>
    <p>
        <asp:DetailsView ID="DetailsView2" runat="server" CellPadding="4" 
            DataSourceID="RentalSqlDataSource" ForeColor="#333333" GridLines="None" 
            Height="50px" Width="125px">
            <AlternatingRowStyle BackColor="White" />
            <CommandRowStyle BackColor="#FFFFC0" Font-Bold="True" />
            <FieldHeaderStyle BackColor="#FFFF99" Font-Bold="True" />
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
        </asp:DetailsView>
        <asp:SqlDataSource ID="RentalSqlDataSource" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            SelectCommand="SELECT * FROM [RENTALLOT] WHERE ([LocationID] = @LocationID)">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" DefaultValue="NULL" 
                    Name="LocationID" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
    <p>
        <strong></strong>
    </p>
    <p>
        <strong>AVAILABLE VEHICLES WHERE LOCATION IS </strong>
    </p>
    <p>
        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" CellPadding="4" 
            DataSourceID="VehicleToBuySqlDataSource" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <SortedAscendingCellStyle BackColor="#FDF5AC" />
            <SortedAscendingHeaderStyle BackColor="#4D0000" />
            <SortedDescendingCellStyle BackColor="#FCF6C0" />
            <SortedDescendingHeaderStyle BackColor="#820000" />
        </asp:GridView>
        <asp:SqlDataSource ID="VehicleToBuySqlDataSource" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            SelectCommand="SELECT * FROM [VEHICLE] WHERE ([LocationID] = @LocationID)">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" DefaultValue="NULL" 
                    Name="LocationID" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
    <p>
        <strong>VEHICLES (Sort Enable)</strong></p>
    <p>
        <strong>
        <asp:GridView ID="GridView2" runat="server" AllowSorting="True" 
            AutoGenerateColumns="False" CellPadding="4" DataKeyNames="VIN,LocationID" 
            DataSourceID="SaleSqlDataSource" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="VIN" HeaderText="VIN" ReadOnly="True" 
                    SortExpression="VIN" />
                <asp:BoundField DataField="LocationID" HeaderText="LocationID" ReadOnly="True" 
                    SortExpression="LocationID" />
                <asp:BoundField DataField="VehicleType" HeaderText="VehicleType" 
                    SortExpression="VehicleType" />
                <asp:CheckBoxField DataField="VehicleAvailability" 
                    HeaderText="VehicleAvailability" SortExpression="VehicleAvailability" />
                <asp:BoundField DataField="PlateNumber" HeaderText="PlateNumber" 
                    SortExpression="PlateNumber" />
                <asp:BoundField DataField="Make" HeaderText="Make" SortExpression="Make" />
                <asp:BoundField DataField="Model" HeaderText="Model" SortExpression="Model" />
                <asp:BoundField DataField="SalePrice" HeaderText="SalePrice" 
                    SortExpression="SalePrice" />
                <asp:BoundField DataField="SaleDownpayment" HeaderText="SaleDownpayment" 
                    SortExpression="SaleDownpayment" />
                <asp:BoundField DataField="FuelType" HeaderText="FuelType" 
                    SortExpression="FuelType" />
                <asp:BoundField DataField="DriveType" HeaderText="DriveType" 
                    SortExpression="DriveType" />
            </Columns>
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <SortedAscendingCellStyle BackColor="#FDF5AC" />
            <SortedAscendingHeaderStyle BackColor="#4D0000" />
            <SortedDescendingCellStyle BackColor="#FCF6C0" />
            <SortedDescendingHeaderStyle BackColor="#820000" />
        </asp:GridView>
        </strong>
        <asp:SqlDataSource ID="SaleSqlDataSource" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            SelectCommand="SELECT * FROM [VEHICLE] ORDER BY [SalePrice], [SaleDownpayment], [VehicleAvailability]">
        </asp:SqlDataSource>
    </p>
    <p>
        <strong>(QUERRIED WHERE) SELECTED ABOVE VEHICLE DETAILS</strong></p>
    <p>
        <strong>
        <asp:DetailsView ID="DetailsView3" runat="server" AutoGenerateRows="False" 
            CellPadding="4" DataKeyNames="VIN,LocationID" 
            DataSourceID="SaleGridSqlDataSource" ForeColor="#333333" GridLines="None" 
            Height="50px" Width="125px">
            <AlternatingRowStyle BackColor="White" />
            <CommandRowStyle BackColor="#FFFFC0" Font-Bold="True" />
            <FieldHeaderStyle BackColor="#FFFF99" Font-Bold="True" />
            <Fields>
                <asp:BoundField DataField="VIN" HeaderText="VIN" ReadOnly="True" 
                    SortExpression="VIN" />
                <asp:BoundField DataField="LocationID" HeaderText="LocationID" ReadOnly="True" 
                    SortExpression="LocationID" />
                <asp:BoundField DataField="VehicleType" HeaderText="VehicleType" 
                    SortExpression="VehicleType" />
                <asp:CheckBoxField DataField="VehicleAvailability" 
                    HeaderText="VehicleAvailability" SortExpression="VehicleAvailability" />
                <asp:BoundField DataField="PlateNumber" HeaderText="PlateNumber" 
                    SortExpression="PlateNumber" />
                <asp:BoundField DataField="Make" HeaderText="Make" SortExpression="Make" />
                <asp:BoundField DataField="Model" HeaderText="Model" SortExpression="Model" />
                <asp:BoundField DataField="SalePrice" HeaderText="SalePrice" 
                    SortExpression="SalePrice" />
                <asp:BoundField DataField="SaleDownpayment" HeaderText="SaleDownpayment" 
                    SortExpression="SaleDownpayment" />
                <asp:BoundField DataField="FuelType" HeaderText="FuelType" 
                    SortExpression="FuelType" />
                <asp:BoundField DataField="DriveType" HeaderText="DriveType" 
                    SortExpression="DriveType" />
            </Fields>
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
        </asp:DetailsView>
        </strong>
        <asp:SqlDataSource ID="SaleGridSqlDataSource" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            SelectCommand="SELECT * FROM [VEHICLE] WHERE ([VIN] = @VIN)">
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView2" DefaultValue="NULL" Name="VIN" 
                    PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
    <p>
        <strong>CUSTOMERS</strong></p>
    <p>
        <strong>
        <asp:GridView ID="CustomerListGrid" runat="server" AllowSorting="True" 
            AutoGenerateColumns="False" CellPadding="4" DataKeyNames="CustomerID" 
            DataSourceID="CustomerSqlDataSource" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" ReadOnly="True" 
                    SortExpression="CustomerID" />
                <asp:BoundField DataField="FirstName" HeaderText="FirstName" 
                    SortExpression="FirstName" />
                <asp:BoundField DataField="MiddleName" HeaderText="MiddleName" 
                    SortExpression="MiddleName" />
                <asp:BoundField DataField="LastName" HeaderText="LastName" 
                    SortExpression="LastName" />
                <asp:BoundField DataField="CustomerAddress" HeaderText="CustomerAddress" 
                    SortExpression="CustomerAddress" />
                <asp:BoundField DataField="CustomerDOB" HeaderText="CustomerDOB" 
                    SortExpression="CustomerDOB" />
                <asp:BoundField DataField="Points" HeaderText="Points" 
                    SortExpression="Points" />
            </Columns>
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <SortedAscendingCellStyle BackColor="#FDF5AC" />
            <SortedAscendingHeaderStyle BackColor="#4D0000" />
            <SortedDescendingCellStyle BackColor="#FCF6C0" />
            <SortedDescendingHeaderStyle BackColor="#820000" />
        </asp:GridView>
        </strong>
        <asp:SqlDataSource ID="CustomerSqlDataSource" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            SelectCommand="SELECT * FROM [CUSTOMER]"></asp:SqlDataSource>
    </p>
    <p>
        <asp:DetailsView ID="DetailsView4" runat="server" AutoGenerateRows="False" 
            CellPadding="4" DataKeyNames="CustomerPhoneNumber" 
            DataSourceID="PhoneSqlDataSource" ForeColor="#333333" GridLines="None" 
            Height="50px" Width="125px">
            <AlternatingRowStyle BackColor="White" />
            <CommandRowStyle BackColor="#FFFFC0" Font-Bold="True" />
            <FieldHeaderStyle BackColor="#FFFF99" Font-Bold="True" />
            <Fields>
                <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" 
                    SortExpression="CustomerID" />
                <asp:BoundField DataField="CustomerPhoneNumber" 
                    HeaderText="CustomerPhoneNumber" ReadOnly="True" 
                    SortExpression="CustomerPhoneNumber" />
            </Fields>
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
        </asp:DetailsView>
        <asp:SqlDataSource ID="PhoneSqlDataSource" runat="server" 
            ConnectionString="<%$ ConnectionStrings:mwangi_steve_db_2ConnectionString %>" 
            SelectCommand="SELECT * FROM [CUSTOMER_PHONES] WHERE ([CustomerID] = @CustomerID)">
            <SelectParameters>
                <asp:ControlParameter ControlID="CustomerListGrid" Name="CustomerID" 
                    PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        <strong>RUNTIME QUERRIES </strong>
    </p>
    <p>
        &nbsp;</p>
    <p>
        <strong></strong>
    </p>
    <p>
        <strong>You can also find </strong> <a href="http://go.microsoft.com/fwlink/?LinkID=152368&amp;clcid=0x409"
            title="MSDN ASP.NET Docs"><strong>documentation on ASP.NET at MSDN</strong></a><strong>.
        </strong>
    </p>
</asp:Content>
