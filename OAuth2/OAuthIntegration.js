var w;
var invertvalID;

Microsoft.Dynamics.NAV.InvokeExtensibilityMethod("ControlAddInReady");

function StartAuthorization(url) {
  w = window.open(url, "_blank", "width=972,height=904,location=no");
  // w.addEventListener("load", () => {
  //   console.log(w.document.body.innerHTML);
  // });
  invertvalID = window.setInterval(TimerTic, 10000);
  // invertvalID = window.setInterval(() => {
  //   var urlParams = new URLSearchParams(w.location.search);
  //   if (urlParams.has("code")) {
  //     window.clearInterval(invertvalID);
  //     Microsoft.Dynamics.NAV.InvokeExtensibilityMethod(
  //       "AuthorizationCodeRetrieved",
  //       [urlParams.get("code"), urlParams.get("state")]
  //     );
  //     window.close();
  //   }
  // }, 20000);
}

function TimerTic() {
  var urlParams = new URLSearchParams(w.location.search);
  if (urlParams.has("code")) {
    window.clearInterval(invertvalID);
    Microsoft.Dynamics.NAV.InvokeExtensibilityMethod(
      "AuthorizationCodeRetrieved",
      [urlParams.get("code"), urlParams.get("state")]
    );
    window.close();
  }
}
function StartAuthorization(authUrl) {
  const popupWindow = window.open(
    authUrl,
    "_blank",
    "width=972,height=904,location=no"
  );

  if (!popupWindow) {
    console.error(
      "Popup window could not be opened. Please allow popups in your browser."
    );
    return;
  }

  // Poll for the authorization code stored in localStorage
  const authPollingInterval = setInterval(() => {
    try {
      const authStatus = localStorage.getItem("NavOauthStatus");
      if (authStatus) {
        clearInterval(authPollingInterval);
        const statusObj = JSON.parse(authStatus);

        if (statusObj.code) {
          console.log("Authorization Code:", statusObj.code);

          // Send the authorization code to the AL extension
          Microsoft.Dynamics.NAV.InvokeExtensibilityMethod(
            "AuthorizationCodeRetrieved",
            [statusObj.code]
          );

          // Clean up localStorage
          localStorage.removeItem("NavOauthStatus");
        } else if (statusObj.error) {
          console.error(
            "Error:",
            statusObj.error,
            "Description:",
            statusObj.desc
          );
        }

        // Close the popup
        if (!popupWindow.closed) {
          popupWindow.close();
        }
      }
    } catch (error) {
      console.error("Error polling auth status:", error);
    }
  }, 1000);
}

function pollAuthStatus() {
  const AuthStatusKey = "NavOauthStatus";

  // Check for the authorization code in localStorage
  const authStatus = localStorage.getItem(AuthStatusKey);

  if (authStatus) {
    const statusObj = JSON.parse(authStatus);

    if (statusObj.code) {
      console.log("Authorization Code:", statusObj.code);

      // Send the authorization code to the AL extension
      Microsoft.Dynamics.NAV.InvokeExtensibilityMethod(
        "AuthorizationCodeRetrieved",
        [statusObj.code]
      );

      // Clean up localStorage to avoid reusing the code
      localStorage.removeItem(AuthStatusKey);
    } else if (statusObj.error) {
      console.error("Error:", statusObj.error, "Description:", statusObj.desc);
    }
  }
}
