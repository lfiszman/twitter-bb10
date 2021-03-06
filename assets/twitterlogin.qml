import bb.cascades 1.0

Container {
    id: mainContainer
    layout: DockLayout {}
    ImageView {
        imageSource: "asset:///images/background.png"
        preferredWidth: 768
        preferredHeight: 1280
    }
    Container {
        horizontalAlignment: HorizontalAlignment.Center;
        verticalAlignment: VerticalAlignment.Center
        preferredWidth: 768
        preferredHeight: 1280
	    Button {
	        id: loginButton
	        objectName: "login"
	        text: loginLayout.getLoginButtonText()
	        verticalAlignment: VerticalAlignment.Center
	        horizontalAlignment: HorizontalAlignment.Center;
	        onClicked: {
                 loginLayout.onButtonClicked();
             }
	    }
    }
    attachedObjects: [
            Sheet {
                id: loginView
                Page {
                    titleBar: TitleBar {
                                  title: "Login"
                                  visibility: ChromeVisibility.Visible
                                  
                                  dismissAction: ActionItem {
                                                     title: "Done"
                                                     onTriggered: {
                                                             loginView.close();
                                                         }
                                                 }
                              }
                    Container {
                        WebView {
                            id: webView
                            objectName: "webView"
                            onUrlChanged: {
                                    loginView.open();
                                }
                        }
                    }    
                }
            }
        ]
}