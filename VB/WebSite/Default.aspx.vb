Imports Microsoft.VisualBasic
Imports System
Imports System.Web.UI
Imports DevExpress.Web

Partial Public Class _Default
	Inherits System.Web.UI.Page
	Protected Sub ASPxDataView1_Load(ByVal sender As Object, ByVal e As EventArgs)
		If Session("CategoryID") Is Nothing Then
			Return
		End If
		AccessDataSource1.SelectParameters("CategoryID").DefaultValue = Session("CategoryID").ToString()
        TryCast(sender, ASPxDataView).DataBind()
	End Sub
	Protected Sub ASPxDataView1_CustomCallback(ByVal sender As Object, ByVal e As DevExpress.Web.CallbackEventArgsBase)
		Session("CategoryID") = e.Parameter
		AccessDataSource1.SelectParameters("CategoryID").DefaultValue = e.Parameter
        TryCast(sender, ASPxDataView).DataBind()
	End Sub
End Class