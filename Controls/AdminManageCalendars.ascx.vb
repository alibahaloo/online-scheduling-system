'@Author: Ali Bahaloo Hore @This Class is responsible for functios that are handle by the AdminManageCalendars Control.
Partial Class Controls_AdminManageCalendars
    Inherits System.Web.UI.UserControl

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            LoadCalendars()
        End If
    End Sub
    '@Author:Ali Bahaloo Hore @This Function loads all existing calendars and put them in the GridView.
    Private Sub LoadCalendars()
        Dim objCalendars As New clsCalenders

        objCalendars.LoadAll()
        Session("Calendars") = objCalendars

        Me.dvCalendars.DataSource = objCalendars
        Me.dvCalendars.DataBind()
    End Sub
    '@Author: Ali Bahaloo Hore @ GridView Edit Cancelation Function.
    Protected Sub dvCalendars_RowCancelingEdit(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCancelEditEventArgs) Handles dvCalendars.RowCancelingEdit
        Me.dvCalendars.EditIndex = -1
        LoadCalendars()
    End Sub
    '@Author: Ali Bahaloo Hore @Grid View's row data bounding.
    Protected Sub dvCalendars_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles dvCalendars.RowDataBound
        Dim lnkbtn As LinkButton
        If e.Row.RowType <> DataControlRowType.Header And e.Row.RowType <> DataControlRowType.Footer And e.Row.RowType <> DataControlRowType.Pager And e.Row.RowState <> DataControlRowState.Edit And e.Row.RowState <> 5 Then
            lnkbtn = CType(e.Row.Cells(3).Controls(0), LinkButton)
            lnkbtn.Attributes.Add("onclick", "return confirm('Deleting Calender will delete all events for calendar """ & e.Row.Cells(0).Text & """. Are you sure you want to delete calendar """ & e.Row.Cells(0).Text & """?');")
        End If
    End Sub
    '@Author: Ali Bahaloo Hore @GridView's Deleting Row Action.
    Protected Sub dvCalendars_RowDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeleteEventArgs) Handles dvCalendars.RowDeleting
        Dim objCalendars As clsCalenders = Session("Calendars")

        CType(objCalendars(e.RowIndex), clsCalender).Delete()

        LoadCalendars()
    End Sub
    '@Author: Ali Bahaloo Hore @GridView's Row Editting Function.
    Protected Sub dvCalendars_RowEditing(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewEditEventArgs) Handles dvCalendars.RowEditing
        Me.dvCalendars.EditIndex = e.NewEditIndex
        LoadCalendars()
    End Sub
    '@Author: Ali Bahaloo Hore @GridView's Row Updating Action
    Protected Sub dvCalendars_RowUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdateEventArgs) Handles dvCalendars.RowUpdating
        Dim objCalendars As clsCalenders = Session("Calendars")

        CType(objCalendars(e.RowIndex), clsCalender).Save(CType(Me.dvCalendars.Rows(e.RowIndex).Cells(1).Controls(0), System.Web.UI.WebControls.TextBox).Text)
        Me.dvCalendars.EditIndex = -1

        LoadCalendars()
    End Sub
    '@Author: Ali Bahaloo Hore @when the user clicks on the Add Button a new row is added to the GridView.
    Protected Sub butAdd_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles butAdd.Click
        Dim objCalendars As clsCalenders = Session("Calendars")

        objCalendars.Add(New clsCalender(0, "(New Calendar)"))

        Me.dvCalendars.EditIndex = objCalendars.Count - 1

        Me.dvCalendars.DataSource = objCalendars
        Me.dvCalendars.DataBind()
    End Sub
End Class
