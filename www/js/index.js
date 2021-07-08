/*
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */

// Wait for the deviceready event before using any of Cordova's device APIs.
// See https://cordova.apache.org/docs/en/latest/cordova/events/events.html#deviceready
document.addEventListener('deviceready', onDeviceReady, false);
req = xhttp = new XMLHttpRequest();
function onDeviceReady() {
    // Cordova is now initialized. Have fun!

    console.log('Running cordova-' + cordova.platformId + '@' + cordova.version);
    document.getElementById('deviceready').classList.add('ready');
}


document.getElementById("b2").onclick = function (){
    var title = document.getElementById("name").value;
    var date = document.getElementById("Datum").value;
    var beginAt = document.getElementById("beginAt").value;
    var endAt = document.getElementById("endAt").value;
    var eventLocation = document.getElementById("link").value;
    var beschreibung = document.getElementById("beschreibung").value;

    var startTime = new Date(date + " " + beginAt); 
    var endTime = new Date(date + " " + endAt);

    var success = function(message) { alert("Success: " + JSON.stringify(message)); };
    var error = function(message) { alert("Error: " + message); };
    
    window.plugins.calendar.createEventInteractively(title,eventLocation,beschreibung,startTime,endTime,success,error);
}





document.getElementById("b1").onclick = function (){
    
    var title = document.getElementById("name").value;
    var teilnehmeranzahl = document.getElementById("anzahl").value;
    var beginAt = document.getElementById("beginAt").value;
    var endAt = document.getElementById("endAt").value;
    var datum = document.getElementById("Datum").value;
    var stufe = document.getElementById("grad").value;
    var beschreibung = document.getElementById("beschreibung").value;
    var zoomlink = document.getElementById("link").value;
    var ziel = document.getElementById("ziel").value;
    var benutzerId = "52257ef3-a9d8-464f-afd8-1f2d0d484ff6";
    console.log(benutzerId);
    
    var url ='http://10.0.2.2:8081/Weblexikon_Server/VeranstaltungAnlegen?' +
                'benutzerId=' + benutzerId +
                '&titel=' +title +
                '&teilnehmeranzahl=' + teilnehmeranzahl +
                '&uhrzeit=' + beginAt + "-" + endAt +
                '&datum=' +datum +
                '&stufe=' + stufe +
                '&beschreibung=' + beschreibung +
                '&ziel=' + ziel +
                '&zoom_link=' + zoomlink;
    console.log(url);
    req.open('GET',url,true);
    req.send(null);
    req.onreadystatechange = () => {
        if(req.readyState == 4 && req.status == 200)
        {
            alert("Success")
        }else if(req.readyState == 4 && req.status!=200)
        {
            alert("Not Success");
        }
    }

   
    
}

