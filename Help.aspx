<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Help.aspx.vb" Inherits="Help" title="Online Scheduling System - Help" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style2
        {
            font-size: medium;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="LeftSide" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Header" Runat="Server">
    <asp:Image ID="Image1" runat="server" ImageUrl="~/images/Help.jpg" />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Content" Runat="Server">
    <h1>Below is the list of Worker's How to:</h1><br />
   <li><span class="style2"><span class="style1">How to book a shift</li></span>: Press “Company’s schedule” from the main menu on the left., make sure that the available shifts radio button is selected in the filter.
Find the week under available shifts that the desired shift is in, by scrolling through the weeks with the arrows (<) & (>). Select the date from the shift booking tool, then choose the desired shift from the dropdown list under the booking calendar. Click on the “Book shift” button and confirm by clicking “ok” when the popup window appears</span>.
   <li><span class="style2"><span class="style1">How to view personal schedule</li></span>: Press  “My schedule” from the main menu on the left. Scrolls through the weeks with the “Prev” and “Next” buttons</span>.
   <li><span class="style2"><span class="style1">How to compose and send a message</li></span>:Press “Messaging” from the main menu on the left, click “compose”, choose recipient from the dropdown list. Fill in the text field with desired text and click send.</span>
   <li><span class="style2"><span class="style1">How to view a message</li></span>:Press “Messaging” from the main menu on the left, click “inbox” and view your messages.
   <li><span class="style1">How to view company’s schedule</li></span>: Press “Company’s schedule” from the main menu on the left. Make sure that the company schedule radio button is selected in the filter on the top. Scroll through the weeks with the arrows.
   <li><span class="style1">How to read announcements</li></span>:Press “Home” from the main menu on the left, announcements are presented.Click on “view” next to the desired announcement.
   <li><span class="style1">How to change password</li></span>:Press “Change password” from the main menu on the left, fill the text fields and click the “change password” button.
   <li><span class="style1">How to recover password</li></span>:On the login page, select “password recovery” from the main menu on the left. Enter your username in the text field and the password will be sent to your e-mail.
       </span>
    <br />
<h1>Below is the list of Manager's How to:</h1><br />
    <li><span class="style2"><span class="style1">How to assign shifts to employees</li></span>
    
        :Press “manage shifts” from the main menu on the left, select the shift 
        assignment tool from the filter on the top. Click the “assign shift” button. In 
        the filter, select if you want to assign to available shifts or to a new shift. 
        - Assign to available shifts: Select a date form the calendar, select a worker 
        form the dropdown list, select the available shift from the second dropdown 
        list. And click assign, confirm with “ok” when the popup window appears. - 
        Assign to a new shift: Select the worker from the dropdown list, enter the shift 
        description in the text field labeled “shift description”. Choose the shift type 
        from the shift type dropdown list. Select a date from the calendar, choose start 
        and end times from the drop down lists below the calendar. Click assign and 
        confirm with “ok” when the popup window appears.
        <li><span class="style1">How to create announcements</li></span>
        :Click “make announcements” from the main menu on the left, enter the 
        title and text of the announcement in the text fields. Click the submit button.
        <li><span class="style1">How to create new user account</li></span>
        :Click “manage users” from the main menu on the left. Select add new user from 
        the filter, enter the required information and click the “Next” button. Fill in 
        the needed text fields and click the “Finnish” button. If successful a message 
        will be shows confirming that you have created a new user account.
        <li><span class="style1">How to edit an account</li></span>: Click “manage users” from the main menu on the left and select edit 
        user from the radio button. choose the user from the dropdownlist and click on 
        &quot;edit&quot; button on the left of the user&#39;s personal number, edit the information 
        and click on &quot;update&quot;
        <li><span class="style1">Delete an account</li></span>: Click “manage users” from the main menu on the left, select delete user 
        from the filter. Choose the personal number of the user account that you wish to 
        delete and click the “Delete user” button. Press “ok” in the popup window that 
        appears to confirm the action.
        <li><span class="style1">How to change the style</li></span>: The is only applied to calendar component in the Company&#39;s Schedule. go 
        to managing tool section and select manage style, then change any attribute that 
        you want to change and click &quot;save&quot;. press &quot;ok&quot; in the popup message.
        <li><span class="style1">How to create Shifts</li></span>: Go to managing tool section, then click on the manage shifts. Select 
        the &quot;Shift management tool&quot; from the radio button.Click on the &quot;Create shift&quot; 
        button. The tool will expand, Fill in the text boxes and click on &quot;create&quot; 
        button. click &quot;ok&quot; when you see the popup window.</span>
   </asp:Content>

