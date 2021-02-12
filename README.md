# WindowsUnity
Die Komposition aus dem Betriebssystem Windows 10 und den **WindowsUnity-Richtliniensatz** verfolgt die Ziele neben der [**Härtung**](https://de.wikipedia.org/wiki/H%C3%A4rten_(Computer)) des Betriebssystems und seiner Anwendungen, praktisch mehr **Geschwindigkeit (Performance)** bei gleichbleibender **Stabilität des Systems** zu führen, sowie eine **bessere Benutzererfahrung** für Endanwender sicherstellen. 

## Anmeldedaten Standardbenutzerkonto
Das administrative Benutzerkonto für die Anmeldung wird von der Datei [AutoUnattend.xml](https://github.com/sale1977/WindowsUnity/blob/main/AutoUnattend.xml) erstellt. Es empfiehlt sich, dass Benutzerkonto und das Passwort nach der Windows-Unity-Bereitstellung zu ändern.
Benutzername | Passwort 
-------- | --------
 `admin` | `demo`

## Treiber bereitstellen

Das Installationsscript [installDrivers.cmd](https://github.com/sale1977/WindowsUnity/blob/main/installDrivers.cmd) kann spezifische Treiber für individuelle Endgeräte automatisiert installieren. Das Script wird als Verknüpfung am Desktop bereits bei der Installation erstellt. Deren Funktion ist im Verzeichnis `%SYSTEMDRIVE%\Drivers` nach den modellspezifischen Ordner (`wmic CSPRODUCT get Name`) zu suchen. Hierin muss die Datei im [Zpaq-gepackten](http://mattmahoney.net/dc/zpaq.html) gepackten Format mit dem Namen *repo.zpaq* vorhanden sein. 

Für die Erstellung von spezifischen Treiberdateien die als Datei *repo.zpaq* gepackt werden müssen, installieren Sie idealerweise auf dem spezifischen Endgerät die herstellerspezifischen Treiber (z. B. von Dell, Lenovo, HP etc.). Der Export der Treiberdateien kann anschließend mit dem Befehl `dism /Online /Export-Driver /Destination:C:\Drivers\Modelname` erfolgen. Als Zielordner wählen Sie den modellspezifischen Pfad C:\Drivers\\*Model*. Der Name des Ordners von *Model* muss exakt den Namen aus dem Befehl `wmic CSPRODUCT get Name` übernehmen.

Sobald die Treiberdateien im Ordner (bsp. C:\Drivers\HP ProBook 450 G3) vorliegen, kann der Inhalt mit dem Zpaq-Tool als repo.zpaq-Datei gepackt werden. Dies erfolgt mit dem Befehl `zpaq a repo.zpaq *.* -m2`.
