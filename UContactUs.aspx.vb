
Partial Class UContactUs
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub Back_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Response.Redirect("UserLogin.aspx")
    End Sub
End Class
