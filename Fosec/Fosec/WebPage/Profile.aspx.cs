﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Fosec.SessionManager;

namespace Fosec.WebPage
{
    public partial class Profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //TODO get session username from SessionManager
            Session["uname"] = "testuser";
        }
    }
}