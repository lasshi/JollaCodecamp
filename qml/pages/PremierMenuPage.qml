/*
  Copyright (C) 2013 Jolla Ltd.
  Contact: Thomas Perl <thomas.perl@jollamobile.com>
  All rights reserved.

  You may use this file under the terms of BSD license as follows:

  Redistribution and use in source and binary forms, with or without
  modification, are permitted provided that the following conditions are met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.
    * Neither the name of the Jolla Ltd nor the
      names of its contributors may be used to endorse or promote products
      derived from this software without specific prior written permission.

  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
  ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
  WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
  DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDERS OR CONTRIBUTORS BE LIABLE FOR
  ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
  (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
  LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
  ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
  SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    SilicaListView {
        id: mainMenuView
        height: 500
        width: parent.width
        header: PageHeader {
            title: "Premier League"
        }

        model: ListModel {
            ListElement {
                name: "Ladder"
                page:"PremierLadderPage"
            }

            ListElement {
                name: "Upcoming games"
                page:"PremierUpcomingPage"
            }

            ListElement {
                name: "Past games"
                page:"PremierPastPage"
            }
       }
       delegate: BackgroundItem {
           width: ListView.view.width
           //height: Theme.itemSizeSmall
           Row{
               x: Theme.paddingLarge
               Label {text: name }
           }
           onClicked: pageStack.push(Qt.resolvedUrl(page+".qml"))
       }
       VerticalScrollDecorator { flickable: listView }
    }

    Label{
        x: Theme.paddingLarge
        y: 500
        color: Theme.secondaryColor
        text: "Next game at "+barclaysUpcoming.next20games[0][0]
    }
    Label{
        x: Theme.paddingLarge
        font.pixelSize: Theme.fontSizeSmall
        y: 540
        color: Theme.secondaryColor
        text: barclaysUpcoming.next20games[0][1] +" vs "+ barclaysUpcoming.next20games[0][2]
    }

    Label{
        x: Theme.paddingLarge
        y: 600
        color: Theme.secondaryColor
        text: "Previous game at "+premierModel.parseData[0][1]
    }
    Label{
        x: Theme.paddingLarge
        font.pixelSize: Theme.fontSizeSmall
        y: 640
        color: Theme.secondaryColor
        text: premierModel.parseData[0][2] +" vs "+ premierModel.parseData[0][3]
    }
}
