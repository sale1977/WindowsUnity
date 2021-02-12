# WindowsUnity
Die Komposition aus dem Betriebssystem Windows 10 und den **WindowsUnity-Richtliniensatz** verfolgt mehrere Ziele:
- [x] Neben der rascheren **unbeaufsichtigten Desktop-Bereitstellung** die [**Härtung**](https://de.wikipedia.org/wiki/H%C3%A4rten_(Computer)) / [**Systemhärtung**](https://www.fb-pro.com/was-ist-systemhaertung-welche-massnahmen-gibt-es/) des Betriebssystems und seiner Anwendungen gegenüber typischen Angriffsvektoren auszuliefern, 
- [x] durch praktische Parametrierungen mehr **Geschwindigkeit (Performance)** bei gleichbleibender **Stabilität** aus dem Betriebssystem zu gewinnen, 
- [x] sowie letztlich eine **bessere Benutzererfahrung** und **Privacy** für die Endanwender sicherzustellen - durch Reduzierung von oftmals "irreführenden" Dialogen und Einschränkung bei der Übertragung von Telemtriedaten an Microsoft. 

Bei den umgesetzten Richtlinien zur Härtung orientiert sich *Windows Unity* unter anderem an folgende Richtlinien:
- https://techcommunity.microsoft.com/t5/microsoft-security-baselines/bg-p/Microsoft-Security-Baselines
- https://www.teletrust.de/publikationen/broschueren/stand-der-technik/
- https://www.bsi.bund.de/DE/Themen/Unternehmen-und-Organisationen/Standards-und-Zertifizierung/IT-Grundschutz/IT-Grundschutz-Kompendium/it-grundschutz-kompendium_node.html
- https://www.stigviewer.com/stig/windows_10/
- https://www.cisecurity.org/benchmark/microsoft_windows_desktop/

// Möglicherweise werden auch Sie **Windows Unity** beim täglichen Einsatz so lieben wie wir :cupid: //

## Anmeldedaten Standardbenutzerkonto
Das administrative Benutzerkonto für die Anmeldung wird von der Datei [AutoUnattend.xml](https://github.com/sale1977/WindowsUnity/blob/main/AutoUnattend.xml) erstellt. Es empfiehlt sich, dass Benutzerkonto und das Passwort nach der Windows-Unity-Bereitstellung zu ändern.
Benutzername | Passwort 
-------- | --------
 `admin` | `demo`

## Treiber bereitstellen

Das Installationsscript [installDrivers.cmd](https://github.com/sale1977/WindowsUnity/blob/main/installDrivers.cmd) kann spezifische Treiber für individuelle Endgeräte automatisiert installieren. Das Script wird als Verknüpfung am Desktop bereits bei der Installation erstellt. Deren Funktion ist im Verzeichnis `%SYSTEMDRIVE%\Drivers` nach den modellspezifischen Ordner (`wmic CSPRODUCT get Name`) zu suchen. Hierin muss die Datei im [Zpaq-gepackten](http://mattmahoney.net/dc/zpaq.html) gepackten Format mit dem Namen *repo.zpaq* vorhanden sein. 

Für die Erstellung von spezifischen Treiberdateien die als Datei *repo.zpaq* gepackt werden müssen, installieren Sie idealerweise auf dem spezifischen Endgerät die herstellerspezifischen Treiber (z. B. von Dell, Lenovo, HP etc.). Der Export der Treiberdateien kann anschließend mit dem Befehl `dism /Online /Export-Driver /Destination:C:\Drivers\Modelname` erfolgen. Als Zielordner wählen Sie den modellspezifischen Pfad C:\Drivers\\*Model*. Der Name des Ordners von *Model* muss exakt den Namen aus dem Befehl `wmic CSPRODUCT get Name` übernehmen.

Sobald die Treiberdateien im Ordner (bsp. C:\Drivers\HP ProBook 450 G3) vorliegen, kann der Inhalt mit dem Zpaq-Tool als repo.zpaq-Datei gepackt werden. Dies erfolgt mit dem Befehl `zpaq a repo.zpaq *.* -m2`.
