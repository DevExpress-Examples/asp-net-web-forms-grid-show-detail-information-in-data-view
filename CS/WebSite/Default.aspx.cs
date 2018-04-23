using System;
using System.Web.UI;
using DevExpress.Web.ASPxDataView;

public partial class _Default : System.Web.UI.Page {
    protected void ASPxDataView1_Load(object sender, EventArgs e) {
        if (Session["CategoryID"] == null) return;
        AccessDataSource1.SelectParameters["CategoryID"].DefaultValue = Session["CategoryID"].ToString();
        (sender as ASPxDataView).DataBind();
    }
    protected void ASPxDataView1_CustomCallback(object sender, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e) {
        Session["CategoryID"] = e.Parameter;
        AccessDataSource1.SelectParameters["CategoryID"].DefaultValue = e.Parameter;
        (sender as ASPxDataView).DataBind();
    }
}