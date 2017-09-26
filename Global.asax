<%@ Application Language="C#" %>

<script runat="server">


void Application_BeginRequest(object sender, EventArgs e) {
// Response.Redirect("http://fuse.corp.fc.local/fjportal/index.php");
}

    void Application_Start(Object sender, EventArgs e) {
        // Code that runs on application startup
        Application.Add("userCount", 0);
    }
    
    void Application_End(Object sender, EventArgs e) {
        //  Code that runs on application shutdown

    }
        
    void Application_Error(Object sender, EventArgs e) { 
        // Code that runs when an unhandled error occurs

    }

    void Session_Start(Object sender, EventArgs e) {
        // Code that runs when a new session is started
        int userCount = int.Parse(Application.Get("userCount").ToString());
        userCount++;

        Application.Set("userCount", userCount);
        
    }

    void Session_End(Object sender, EventArgs e) {
        // Code that runs when a session ends. 
        // Note: The Session_End event is raised only when the sessionstate mode
        // is set to InProc in the Web.config file. If session mode is set to StateServer 
        // or SQLServer, the event is not raised.
        int userCount = int.Parse(Application.Get("userCount").ToString());
        userCount--;
        Application.Set("userCount", userCount);
        
    }
       
</script>
