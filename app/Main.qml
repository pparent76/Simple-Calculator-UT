/*
 * Copyright (C) 2025 Pierre Parent
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License 3 as published by
 * the Free Software Foundation.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program. If not, see http://www.gnu.org/licenses/.
 */

import QtQuick 2.9
import Ubuntu.Components 1.3
import QtQuick.Window 2.2
import Morph.Web 0.1
import QtWebEngine 1.9
import Qt.labs.settings 1.0
import QtSystemInfo 5.5


MainView {
  id: mainView
  
  property var appID: "simplecalculator.pparent";
  property var hook: "simplecalculator";  
  property var localStorage: "/home/phablet/.cache/simplecalculator.pparent/QtWebEngine";  
  
  
  property int lastUnreadCount: -1;
  property var lastNotifyTimestamp: 0;  
  property var importPage
  property var requestedUrl: "";


  objectName: "mainView"
  //theme.name: "Ubuntu.Components.Themes.SuruDark"
  applicationName: "simplecalculator.pparent"
  backgroundColor : "transparent"


 // property list<ContentItem> importItems

  
 
  PageStack {
    id: mainPageStack
    anchors.fill: parent
    
    Component.onCompleted: 
    {mainPageStack.push(pageMain)
    }


    Page {
      id: pageMain
      anchors.fill: parent
      
      //Webview-----------------------------------------------------------------------------------------------------
      WebEngineView {
        id: webview
        anchors{ fill: parent }
        focus: true
        settings.pluginsEnabled: true
       
        anchors {
          fill:parent
        }
        
        onLoadingChanged: {
              webview.runJavaScript( `document.body.style.scrollbarWidth = 'none'; const style = document.createElement('style'); style.innerHTML = '::-webkit-scrollbar { width:0px; height:0px; }'; document.head.appendChild(style);` );
        }
        url: Qt.resolvedUrl(".")+"/js/index.html"

      } //End webview--------------------------------------------------------------------------------------------
      
    }
    

  }
   
}
