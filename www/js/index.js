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

function onDeviceReady() {
    // Cordova is now initialized. Have fun!

    console.log('Running cordova-' + cordova.platformId + '@' + cordova.version);
    document.getElementById('deviceready').classList.add('ready');
}


document.getElementById("b2").onclick = function (){
    var date = document.getElementById("Datum").value + " " + document.getElementById("time").value;
   
    
    var year = date.substring(0,4);
    var month = date.substring(5,7);
    var month2 = month-1;
    var day = date.substring(8,10);
    var time1 = date.substring(11,13);
    var time2 =  date.substring(14,16); 
    
    
  var startDate = new Date(year,month2,day,time1,time2,0,0,0); // beware: month 0 = january, 11 = december
  var title = document.getElementById("name").value;
  var endDate = new Date(2015,2,15,19,30,0,0,0);
  var success = function(message) { alert("Success: " + JSON.stringify(message)); };
  var error = function(message) { alert("Error: " + message); };
  var eventLocation = "";
  var notes = "Some notes about this event.";

 window.plugins.calendar.createEventInteractively(title,eventLocation,notes,startDate,endDate,success,error);
}





document.getElementById("b1").onclick = function (){
    
var title = document.getElementById("name").value;
var teilnehmeranzahl = document.getElementById("anzahl").value;
var uhrzeit = document.getElementById("time").value;
var datum = document.getElementById("Datum").value;
var stufe = document.getElementById("grad").value;
var beschreibung = document.getElementById("beschreibung").value;
var zoomlink = document.getElementById("link").value;
var ziel = "null";
var benutzerId = "52257ef3-a9d8-464f-afd8-1f2d0d484ff6";
              
    $.ajax({
        type: 'POST',
  		url: 'localhost:8081/Weblexikon_Server/VeranstaltungAnlegen',
  		data: {'benutzerId': benutzerId, 'title': title, 'teilnehmeranzahl':teilnehmeranzahl, 'uhrzeit':uhrzeit, 'datum': datum, 'stufe': stufe, 'beschreibung': beschreibung, 'ziel': null, 'zoom_link': zoomlink},
  		success: function(data) {
   			alert(data);
  			}
			
    });
    
}

