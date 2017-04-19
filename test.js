// CRM Web Resouce for manipulating CRM Form Elements



function ptOnFormSave() {
    var control = Xrm.Page.getControl("IFRAME_PT_CART");
    if (!control) {
        control = Xrm.Page.getControl("IFRAME_PowerTrak");
    }
    if (!control) {
        control = Xrm.Page.getControl("IFRAME_PTCart");
    }
    if (!control) {
        return;
    }
    var src = control.getSrc();
    if (src.endsWith("id=")) {
        var data = Xrm.Page.data;
        if (data) {
            var entity = data.entity;
            if (entity) {
                var id = entity.getId();
                src += id;
            }
        }
        if (src === control.getSrc()) {
            // No id assigned yet, try again in a little bit
            setTimeout(ptOnFormSave, 500);
        } else {
            control.setSrc(src);
        }
    }
}




function setPtGridUrl() {

    try {
        var formtype = Xrm.Page.ui.getFormType();
        if (formtype == 2) { // Existing record
            // Expand the Product Line Items tab
            if (Xrm.Page.ui.tabs.get("tab_3").getDisplayState() == "collapsed") {
                Xrm.Page.ui.tabs.get("tab_3").setDisplayState("expanded");
            }

            var iframe = Xrm.Page.getControl("IFRAME_PT");
            var id = Xrm.Page.data.entity.getId();
            var orgName = Xrm.Page.context.getOrgUniqueName();
            var thisEntity = Xrm.Page.data.entity.getEntityName();

            var ptScreen = "";

            switch (thisEntity) {
                case "opportunity":
                    ptScreen = "WaveOpportunityProducts.aspx";
                    break;
                case "quote":
                    ptScreen = "WaveQuoteProducts.aspx";
                    break;
                case "salesorder":
                    ptScreen = "WaveOrderProducts.aspx";
                    break;
            }


            var ptSite = "";
            var clientUrl = Xrm.Page.context.getClientUrl();

            if (clientUrl == "https://wtxtest.crm.dynamics.com")
                ptSite = "https://wavetronixdev.netprm.com";
            else
                ptSite = "https://wavetronix.netprm.com";




            var url = ptSite + "/CustomPages/" + ptScreen + "?id=" + id + "&orgname=" + orgName;

            iframe.setSrc(url);
            iframe.setVisible(true);


            //Xrm.Page.ui.tabs.get("parts").sections.get("tab_5_section_1").setVisible(true);

        } else {
            //Xrm.Page.ui.tabs.get("parts").sections.get("tab_5_section_1").setVisible(false);
            // Collapse the Product Line Items tab for new record
            if (Xrm.Page.ui.tabs.get("tab_3").getDisplayState() == "expanded") {
                Xrm.Page.ui.tabs.get("tab_3").setDisplayState("collapsed");
            }

        }
    } catch (exception) {
        console.log(exception);
    }


}