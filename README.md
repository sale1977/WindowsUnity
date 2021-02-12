# WindowsUnity
Intetgral Mix between a practical Performance, Stability and Safety (Trustworthy) Desktop-Computing in a modern World.

## Anmeldedaten Standardbenutzerkonto
Das administrative Benutzerkonto für die Anmeldung wird von der Datei [AutoUnattend.xml](https://github.com/sale1977/WindowsUnity/blob/main/AutoUnattend.xml) erstellt. Es empfiehlt sich, dass Benutzerkonto und das Passwort nach der Windows-Unity-Bereitstellung zu ändern.
Benutzername | Passwort 
-------- | --------
 `admin` | `demo`

## Treiber bereitstellen

Das Installationsscript [installDrivers.cmd](https://github.com/sale1977/WindowsUnity/blob/main/installDrivers.cmd) kann spezifische Treiber für individuelle Endgeräte automatisiert installieren. Das Script wird als Verknüpfung am Desktop bereits bei der Installation erstellt. Deren Funktion ist im Verzeichnis `%SYSTEMDRIVE%\Drivers` nach den modellspezifischen Ordner (`wmic CSPRODUCT get Name`) zu suchen. Hierin muss die Datei im [Zpaq-gepackten](http://mattmahoney.net/dc/zpaq.html) gepackten Format mit dem Namen *repo.zpaq* vorhanden sein. 

Für die Erstellung ihrer Endgeräte-Treiber in Form der Datei *repo.zpaq* installieren Sie idealerweise auf einer Referenzmaschine die herstellerspezifischen Treiber (z. B. von Dell, Lenovo, HP etc.) exportieren. Der Export von Treiberdateien kann mit dem Befehl `dism /Online /Export-Driver /Destination:C:\Drivers\Modelname` erfolgen. Als Zielordner wählen Sie den modellspezifischen Pfad C:\Drivers\\*Model*. Bei dem Namen des Ordners von *Model* muss exakt der Namen aus dem Befehl `wmic CSPRODUCT get Name` übernommen werden.

Sobald die Treiberdateien im Ordner (bsp. C:\Drivers\HP ProBook 450 G3) vorliegen, kann der Inhalt mit dem Zpaq-Tool als repo.zpaq-Datei gepackt werden. Dies erfolgt mit dem Befehl `zpaq a repo.zpaq *.* -m2`.

## Listing Folders within $OEM$ on Installation-Source
```
C:\SETUPDEPLOYMENT\BUILD\MEDIA\SOURCES\$OEM$
|   
+---$$
|   |   Bginfo64.exe
|   |   CPAU.exe
|   |   cports.cfg
|   |   cports.exe
|   |   devcon.exe
|   |   diskspd.exe
|   |   DNSQuerySniffer.cfg
|   |   DNSQuerySniffer.exe
|   |   ipnetinfo.exe
|   |   MouseSC.exe
|   |   MouseSC_x64.exe
|   |   NetworkUsageView.cfg
|   |   NetworkUsageView.exe
|   |   nircmd.exe
|   |   nircmdc.exe
|   |   paexec.exe
|   |   perfc
|   |   perfc.dat
|   |   perfc.dll
|   |   procexp64.exe
|   |   Procmon64.exe
|   |   PsExec64.exe
|   |   RuckZuck.exe
|   |   rufus-3.13.exe
|   |   RZGet.exe
|   |   sdelete64.exe
|   |   ShellRunas.exe
|   |   signtool.exe
|   |   Sysmon64.exe
|   |   Tcpview.exe
|   |   UninstallView.cfg
|   |   UninstallView.exe
|   |   watchexec.exe
|   |   zpaq.exe
|   |   
|   +---OEM
|   |       TaskbarLayoutModification.xml
|   |       
|   +---Resources
|   |   \---Themes
|   |           Dark_SALE.theme
|   |           
|   +---Setup
|   |   \---Scripts
|   |           SetupComplete.cmd
|   |           
|   +---System32
|   |   |   Backup.ps1
|   |   |   ffmpeg.exe
|   |   |   ffplay.exe
|   |   |   ffprobe.exe
|   |   |   libcrypto-1_1-x64.dll
|   |   |   libssl-1_1-x64.dll
|   |   |   msvcp120.dll
|   |   |   OEMDefaultAssociations.xml
|   |   |   openssl.exe
|   |   |   SetACL.exe
|   |   |   vcruntime140.dll
|   |   |   
|   |   \---WindowsPowerShell
|   |       \---v1.0
|   |               Microsoft.PowerShell_profile.ps1.ori
|   |               
|   +---SysWOW64
|   |       OneDriveSetup.exe
|   |       
|   +---web
|   |   \---wallpaper
|   |           aurora.jpg
|   |           winunity.jpg
|   |           
|   \---WinSxS
|       \---wow64_microsoft-windows-onedrive-setup_31bf3856ad364e35_10.0.18362.1_none_01f25b79d7a97c4b
|               OneDriveSetup.exe
|               
+---$1
|   +---Assets
|   |   |   Desktop.ini
|   |   |   
|   |   +---7-Zip
|   |   |       7z1900-x64.exe
|   |   |       install.cmd
|   |   |       
|   |   +---Adobe
|   |   |       AcroRdrDC.exe
|   |   |       Download.url
|   |   |       install.cmd
|   |   |       
|   |   +---BCUninstaller
|   |   |       BCUninstaller_4.16_setup.exe
|   |   |       
|   |   +---Benchmarks
|   |   |       novabench.msi
|   |   |       
|   |   +---ChoEazyCopy
|   |   |       ChoEazyCopy.exe
|   |   |       ChoEazyCopy.exe.Config
|   |   |       Cinchoo.Core.dll
|   |   |       
|   |   +---Chrome
|   |   |       Chrome Browser Deployment Guide.pdf
|   |   |       Download Chrome Browser for Your Business - Chrome Enterprise.url
|   |   |       Google Omaha Tutorial- How the Chrome updater works.url
|   |   |       GoogleChromeStandaloneEnterprise64.msi
|   |   |       install.cmd
|   |   |       Richtlinienliste und -verwaltung für Chrome Enterprise  -  Dokumentation.url
|   |   |       
|   |   +---Cleanmgr
|   |   |   |   Cleanmgr+.exe
|   |   |   |   
|   |   |   +---bin
|   |   |   |   |   cleanmgr+.ini
|   |   |   |   |   windata.ini
|   |   |   |   |   
|   |   |   |   \---packages
|   |   |   |       |   cmp-app.ico
|   |   |   |       |   cmp-refresh-dark.png
|   |   |   |       |   cmp-refresh.png
|   |   |   |       |   locale.ini
|   |   |   |       |   ui.ini
|   |   |   |       |   
|   |   |   |       \---cleanmgr
|   |   |   |           |   Burnbytes.exe
|   |   |   |           |   
|   |   |   |           \---de
|   |   |   |                   Burnbytes.resources.dll
|   |   |   |                   
|   |   |   \---scripts
|   |   |           #Rules.txt
|   |   |           Google Chrome Cache.csc
|   |   |           Google Chrome History.csc
|   |   |           Microsoft Edge Cache (New).csc
|   |   |           Microsoft Edge Cache (Old).csc
|   |   |           Microsoft Edge Cache.csc
|   |   |           Mozilla Firefox Cache.csc
|   |   |           Opera Cache.csc
|   |   |           Vivaldi Cache.csc
|   |   |           Waterfox Cache.csc
|   |   |           Windows Defender.csc
|   |   |           Windows Downloads.csc
|   |   |           Windows Error Reporting.csc
|   |   |           Windows Event Viewer Logs.csc
|   |   |           Windows Font Cache.csc
|   |   |           Windows Icon Cache.csc
|   |   |           Windows Installer Cache.csc
|   |   |           Windows Logs.csc
|   |   |           Windows MUICache.csc
|   |   |           Windows Remote Desktop Cache.csc
|   |   |           Windows Shadow Copies.csc
|   |   |           Windows Sidebar Cache.csc
|   |   |           Windows Update Logs.csc
|   |   |           
|   |   +---cmd-here-windows-10
|   |   |       cmd-here-windows-10.reg
|   |   |       Eingabeaufforderung-PowerShell-Kontextmenue.zip
|   |   |       undo.reg
|   |   |       
|   |   +---CodeSign
|   |   |       CodeSign.ps1
|   |   |       InstallCodeSign.SED
|   |   |       signtool.exe
|   |   |       
|   |   +---Computername
|   |   |       ComputerName.reg
|   |   |       install.cmd
|   |   |       SetACL.exe
|   |   |       
|   |   +---ContextMenu
|   |   |       ContextMenu.reg
|   |   |       rundllinfo.txt
|   |   |       
|   |   +---DirectX9
|   |   |       Apr2005_d3dx9_25_x64.cab
|   |   |       Apr2005_d3dx9_25_x86.cab
|   |   |       Apr2006_d3dx9_30_x64.cab
|   |   |       Apr2006_d3dx9_30_x86.cab
|   |   |       Apr2006_MDX1_x86.cab
|   |   |       Apr2006_MDX1_x86_Archive.cab
|   |   |       Apr2006_XACT_x64.cab
|   |   |       Apr2006_XACT_x86.cab
|   |   |       Apr2006_xinput_x64.cab
|   |   |       Apr2006_xinput_x86.cab
|   |   |       APR2007_d3dx10_33_x64.cab
|   |   |       APR2007_d3dx10_33_x86.cab
|   |   |       APR2007_d3dx9_33_x64.cab
|   |   |       APR2007_d3dx9_33_x86.cab
|   |   |       APR2007_XACT_x64.cab
|   |   |       APR2007_XACT_x86.cab
|   |   |       APR2007_xinput_x64.cab
|   |   |       APR2007_xinput_x86.cab
|   |   |       Aug2005_d3dx9_27_x64.cab
|   |   |       Aug2005_d3dx9_27_x86.cab
|   |   |       AUG2006_XACT_x64.cab
|   |   |       AUG2006_XACT_x86.cab
|   |   |       AUG2006_xinput_x64.cab
|   |   |       AUG2006_xinput_x86.cab
|   |   |       AUG2007_d3dx10_35_x64.cab
|   |   |       AUG2007_d3dx10_35_x86.cab
|   |   |       AUG2007_d3dx9_35_x64.cab
|   |   |       AUG2007_d3dx9_35_x86.cab
|   |   |       AUG2007_XACT_x64.cab
|   |   |       AUG2007_XACT_x86.cab
|   |   |       Aug2008_d3dx10_39_x64.cab
|   |   |       Aug2008_d3dx10_39_x86.cab
|   |   |       Aug2008_d3dx9_39_x64.cab
|   |   |       Aug2008_d3dx9_39_x86.cab
|   |   |       Aug2008_XACT_x64.cab
|   |   |       Aug2008_XACT_x86.cab
|   |   |       Aug2008_XAudio_x64.cab
|   |   |       Aug2008_XAudio_x86.cab
|   |   |       Aug2009_D3DCompiler_42_x64.cab
|   |   |       Aug2009_D3DCompiler_42_x86.cab
|   |   |       Aug2009_d3dcsx_42_x64.cab
|   |   |       Aug2009_d3dcsx_42_x86.cab
|   |   |       Aug2009_d3dx10_42_x64.cab
|   |   |       Aug2009_d3dx10_42_x86.cab
|   |   |       Aug2009_d3dx11_42_x64.cab
|   |   |       Aug2009_d3dx11_42_x86.cab
|   |   |       Aug2009_d3dx9_42_x64.cab
|   |   |       Aug2009_d3dx9_42_x86.cab
|   |   |       Aug2009_XACT_x64.cab
|   |   |       Aug2009_XACT_x86.cab
|   |   |       Aug2009_XAudio_x64.cab
|   |   |       Aug2009_XAudio_x86.cab
|   |   |       Dec2005_d3dx9_28_x64.cab
|   |   |       Dec2005_d3dx9_28_x86.cab
|   |   |       DEC2006_d3dx10_00_x64.cab
|   |   |       DEC2006_d3dx10_00_x86.cab
|   |   |       DEC2006_d3dx9_32_x64.cab
|   |   |       DEC2006_d3dx9_32_x86.cab
|   |   |       DEC2006_XACT_x64.cab
|   |   |       DEC2006_XACT_x86.cab
|   |   |       DSETUP.dll
|   |   |       dsetup32.dll
|   |   |       dxdllreg_x86.cab
|   |   |       DXSETUP.exe
|   |   |       dxupdate.cab
|   |   |       Feb2005_d3dx9_24_x64.cab
|   |   |       Feb2005_d3dx9_24_x86.cab
|   |   |       Feb2006_d3dx9_29_x64.cab
|   |   |       Feb2006_d3dx9_29_x86.cab
|   |   |       Feb2006_XACT_x64.cab
|   |   |       Feb2006_XACT_x86.cab
|   |   |       FEB2007_XACT_x64.cab
|   |   |       FEB2007_XACT_x86.cab
|   |   |       Feb2010_X3DAudio_x64.cab
|   |   |       Feb2010_X3DAudio_x86.cab
|   |   |       Feb2010_XACT_x64.cab
|   |   |       Feb2010_XACT_x86.cab
|   |   |       Feb2010_XAudio_x64.cab
|   |   |       Feb2010_XAudio_x86.cab
|   |   |       Jun2005_d3dx9_26_x64.cab
|   |   |       Jun2005_d3dx9_26_x86.cab
|   |   |       JUN2006_XACT_x64.cab
|   |   |       JUN2006_XACT_x86.cab
|   |   |       JUN2007_d3dx10_34_x64.cab
|   |   |       JUN2007_d3dx10_34_x86.cab
|   |   |       JUN2007_d3dx9_34_x64.cab
|   |   |       JUN2007_d3dx9_34_x86.cab
|   |   |       JUN2007_XACT_x64.cab
|   |   |       JUN2007_XACT_x86.cab
|   |   |       JUN2008_d3dx10_38_x64.cab
|   |   |       JUN2008_d3dx10_38_x86.cab
|   |   |       JUN2008_d3dx9_38_x64.cab
|   |   |       JUN2008_d3dx9_38_x86.cab
|   |   |       JUN2008_X3DAudio_x64.cab
|   |   |       JUN2008_X3DAudio_x86.cab
|   |   |       JUN2008_XACT_x64.cab
|   |   |       JUN2008_XACT_x86.cab
|   |   |       JUN2008_XAudio_x64.cab
|   |   |       JUN2008_XAudio_x86.cab
|   |   |       Jun2010_D3DCompiler_43_x64.cab
|   |   |       Jun2010_D3DCompiler_43_x86.cab
|   |   |       Jun2010_d3dcsx_43_x64.cab
|   |   |       Jun2010_d3dcsx_43_x86.cab
|   |   |       Jun2010_d3dx10_43_x64.cab
|   |   |       Jun2010_d3dx10_43_x86.cab
|   |   |       Jun2010_d3dx11_43_x64.cab
|   |   |       Jun2010_d3dx11_43_x86.cab
|   |   |       Jun2010_d3dx9_43_x64.cab
|   |   |       Jun2010_d3dx9_43_x86.cab
|   |   |       Jun2010_XACT_x64.cab
|   |   |       Jun2010_XACT_x86.cab
|   |   |       Jun2010_XAudio_x64.cab
|   |   |       Jun2010_XAudio_x86.cab
|   |   |       Mar2008_d3dx10_37_x64.cab
|   |   |       Mar2008_d3dx10_37_x86.cab
|   |   |       Mar2008_d3dx9_37_x64.cab
|   |   |       Mar2008_d3dx9_37_x86.cab
|   |   |       Mar2008_X3DAudio_x64.cab
|   |   |       Mar2008_X3DAudio_x86.cab
|   |   |       Mar2008_XACT_x64.cab
|   |   |       Mar2008_XACT_x86.cab
|   |   |       Mar2008_XAudio_x64.cab
|   |   |       Mar2008_XAudio_x86.cab
|   |   |       Mar2009_d3dx10_41_x64.cab
|   |   |       Mar2009_d3dx10_41_x86.cab
|   |   |       Mar2009_d3dx9_41_x64.cab
|   |   |       Mar2009_d3dx9_41_x86.cab
|   |   |       Mar2009_X3DAudio_x64.cab
|   |   |       Mar2009_X3DAudio_x86.cab
|   |   |       Mar2009_XACT_x64.cab
|   |   |       Mar2009_XACT_x86.cab
|   |   |       Mar2009_XAudio_x64.cab
|   |   |       Mar2009_XAudio_x86.cab
|   |   |       Nov2007_d3dx10_36_x64.cab
|   |   |       Nov2007_d3dx10_36_x86.cab
|   |   |       Nov2007_d3dx9_36_x64.cab
|   |   |       Nov2007_d3dx9_36_x86.cab
|   |   |       NOV2007_X3DAudio_x64.cab
|   |   |       NOV2007_X3DAudio_x86.cab
|   |   |       NOV2007_XACT_x64.cab
|   |   |       NOV2007_XACT_x86.cab
|   |   |       Nov2008_d3dx10_40_x64.cab
|   |   |       Nov2008_d3dx10_40_x86.cab
|   |   |       Nov2008_d3dx9_40_x64.cab
|   |   |       Nov2008_d3dx9_40_x86.cab
|   |   |       Nov2008_X3DAudio_x64.cab
|   |   |       Nov2008_X3DAudio_x86.cab
|   |   |       Nov2008_XACT_x64.cab
|   |   |       Nov2008_XACT_x86.cab
|   |   |       Nov2008_XAudio_x64.cab
|   |   |       Nov2008_XAudio_x86.cab
|   |   |       Oct2005_xinput_x64.cab
|   |   |       Oct2005_xinput_x86.cab
|   |   |       OCT2006_d3dx9_31_x64.cab
|   |   |       OCT2006_d3dx9_31_x86.cab
|   |   |       OCT2006_XACT_x64.cab
|   |   |       OCT2006_XACT_x86.cab
|   |   |       
|   |   +---DriverStoreExplorer
|   |   |       DriverStoreExplorer.v0.11.64.zip
|   |   |       
|   |   +---Edge
|   |   |       Microsoft Edge für Unternehmen herunterladen - Microsoft.url
|   |   |       MicrosoftEdgeEnterpriseX64.msi
|   |   |       
|   |   +---EdgeDev
|   |   |       defAssoc.txt
|   |   |       OEMDefaultAssociations.xml
|   |   |       
|   |   +---FlashKiller
|   |   |       Flash - aahaa - Savior of the Universe - oder auch nicht. - Gruppenrichtlinien.url
|   |   |       uninstall_flash_player.exe
|   |   |       windows10.0-kb4577586-x64_c9bb49df325c20ddc147137b3f769fa44d800dde.msu
|   |   |       
|   |   +---Greenshot
|   |   |       Greenshot.exe
|   |   |       install.cmd
|   |   |       
|   |   +---IrfanView
|   |   |       Download.url
|   |   |       install.cmd
|   |   |       iview457_plugins_x64_setup.exe
|   |   |       iview457_x64_setup.exe
|   |   |       
|   |   +---Java
|   |   |       install.cmd
|   |   |       Java-Downloads für alle Betriebssysteme.url
|   |   |       java.settings.cfg
|   |   |       jre-8u281-windows-i586.exe
|   |   |       jre-8u281-windows-x64.exe
|   |   |       
|   |   +---Notepad++
|   |   |   |   ConfigNotepad++.zip
|   |   |   |   install.cmd
|   |   |   |   npp.exe
|   |   |   |   
|   |   |   \---config
|   |   |           config.xml
|   |   |           session.xml
|   |   |           stylers.xml
|   |   |           
|   |   +---NV Updater
|   |   |       nv_updater_setup_0.6.1.4.exe
|   |   |       
|   |   +---Office
|   |   |   |   Configuration-Office2019-SALE.xml
|   |   |   |   configuration-Office2019Enterprise.xml
|   |   |   |   configuration-Office365-x64.xml
|   |   |   |   configuration-Office365-x86.xml
|   |   |   |   download.cmd
|   |   |   |   install.cmd
|   |   |   |   setup.exe
|   |   |   |   
|   |   |   \---Office
|   |   |       \---Data
|   |   |           |   v32.cab
|   |   |           |   v32_16.0.10370.20052.cab
|   |   |           |   
|   |   |           \---16.0.10370.20052
|   |   |                   i320.cab
|   |   |                   i321031.cab
|   |   |                   i321033.cab
|   |   |                   i640.cab
|   |   |                   i641031.cab
|   |   |                   i641033.cab
|   |   |                   s320.cab
|   |   |                   s321031.cab
|   |   |                   s321033.cab
|   |   |                   stream.x86.de-de.dat
|   |   |                   stream.x86.en-us.dat
|   |   |                   stream.x86.x-none.dat
|   |   |                   
|   |   +---OneDrive
|   |   |       OneDriveSetup.exe
|   |   |       
|   |   +---ookla-speedtest
|   |   |       speedtest.exe
|   |   |       speedtest.md
|   |   |       speedtestbyookla_x64.msi
|   |   |       
|   |   +---Parsec
|   |   |       parsec-windows.exe
|   |   |       ViGEmBusSetup_x64.msi
|   |   |       
|   |   +---pdf24
|   |   |       install.cmd
|   |   |       PDF24 Creator - Download - 100% kostenlos - PDF24 Tools.url
|   |   |       pdf24-creator.msi
|   |   |       pdf24_HKLM.reg
|   |   |       settings.txt
|   |   |       Silent Install.lnk
|   |   |       
|   |   +---PowerToys
|   |   |       PowerToysSetup-0.29.3-x64.exe
|   |   |       
|   |   +---Privacy
|   |   |       OOSU10.exe
|   |   |       
|   |   +---RDP Wrapper
|   |   |   |   autoupdate.bat
|   |   |   |   install.bat
|   |   |   |   RDPCheck.exe
|   |   |   |   RDPConf.exe
|   |   |   |   RDPWInst-v1.6.2.msi
|   |   |   |   RDPWInst.exe
|   |   |   |   rdpwrap-binary-download.md at master · asmtron-rdpwrap.url
|   |   |   |   uninstall.bat
|   |   |   |   update.bat
|   |   |   |   
|   |   |   \---helper
|   |   |           autoupdate__disable_autorun_on_startup.bat
|   |   |           autoupdate__enable_autorun_on_startup.bat
|   |   |           autoupdate__info.txt
|   |   |           
|   |   +---RDPManager
|   |   |       RDP-Manager.exe
|   |   |       
|   |   +---RSAT
|   |   |       install.cmd
|   |   |       
|   |   +---Runtime
|   |   |       install.cmd
|   |   |       readme.txt
|   |   |       windowsdesktop-runtime-win-x64.exe
|   |   |       
|   |   +---SamsungMagician
|   |   |       Samsung_Magician_installer.exe
|   |   |       
|   |   +---Scripts
|   |   |       Autoinstall_Updates.ps1
|   |   |       Autorun.cmd
|   |   |       background.cmd
|   |   |       cleanup.cmd
|   |   |       Disable-Services-final-v2.ps1
|   |   |       InstallChocoChrome.cmd
|   |   |       setNetworkPrivate.ps1
|   |   |       tune.cmd
|   |   |       UnpinTaskbar.ps1
|   |   |       
|   |   +---SMTPSend
|   |   |       SMTPSend.exe
|   |   |       smtpsend.txt
|   |   |       
|   |   +---Sysinternals
|   |   |       disk2vhd.exe
|   |   |       
|   |   +---SystemExplorer
|   |   |       SystemExplorerSetup.exe
|   |   |       
|   |   +---Teams
|   |   |       install.cmd
|   |   |       Teams_windows_x64.msi
|   |   |       
|   |   +---uBlock
|   |   |       Filter.txt
|   |   |       
|   |   +---Veeam
|   |   |       install.cmd
|   |   |       VeeamAgentWindows.exe
|   |   |       
|   |   +---VisualC
|   |   |       install.cmd
|   |   |       vcredist2005_x64.exe
|   |   |       vcredist2005_x86.exe
|   |   |       vcredist2008_x64.exe
|   |   |       vcredist2008_x86.exe
|   |   |       vcredist2010_x64.exe
|   |   |       vcredist2010_x86.exe
|   |   |       vcredist2012_x64.exe
|   |   |       vcredist2012_x86.exe
|   |   |       vcredist2013_x64.exe
|   |   |       vcredist2013_x86.exe
|   |   |       VC_redist.x64.exe
|   |   |       VC_redist.x86.exe
|   |   |       
|   |   +---VLC
|   |   |       download.url
|   |   |       install.cmd
|   |   |       vlc.msi
|   |   |       vlcrc
|   |   |       
|   |   +---WebCam
|   |   |       ShowVideoDialoge.cmd
|   |   |       
|   |   +---WinGet
|   |   |       install.cmd
|   |   |       installapps.cmd
|   |   |       Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.appxbundle
|   |   |       Microsoft.VCLibs.x64.14.00.Desktop.appx
|   |   |       
|   |   +---WinUpdates
|   |   |   |   install.cmd
|   |   |   |   
|   |   |   +---KB4537572
|   |   |   |       windows10.0-kb4537572-x64-ndp48_3a5beca9ff3bd1e1c72b7afa13beed94d6974ee9.msu
|   |   |   |       
|   |   |   +---KB4537759
|   |   |   |       windows10.0-kb4537759-x64_ea293539b86301f3c89abbae0d4cc70060d00848.msu
|   |   |   |       
|   |   |   +---KB4552931
|   |   |   |       windows10.0-kb4552931-x64_2db4f6d9a62833406875986aae69351f82f3ca2b.msu
|   |   |   |       
|   |   |   \---KB890830
|   |   |           Windows-KB890830-x64-V5.81.exe
|   |   |           
|   |   \---Wireshark
|   |           Wireshark-win64-3.4.3.exe
|   |           
|   +---Program Files (x86)
|   |   \---Google
|   |       \---Chrome
|   |           \---Application
|   |                   master_preferences
|   |                   
|   +---ProgramData
|   |   \---Microsoft
|   |       \---User Account Pictures
|   \---Users
|       \---Default
|           \---AppData
|               +---Local
|               |   \---Microsoft
|               |       \---Windows
|               |           \---Shell
|               |                   LayoutModification.xml
|               |                   
|               \---Roaming
|                   +---Notepad++
|                   |       config.xml
|                   |       stylers.xml
|                   |       
|                   +---vlc
|                   |       vlcrc
|                   |       
|                   \---Wireshark
|                           decode_as_entries
|                           language
|                           preferences
|                           recent
|                           recent_common
|                           
\---$Progs
    +---Google
    |   \---Chrome
    |       \---Application
    |               master_preferences
    |               
    +---Greenshot
    |       greenshot-fixed.ini
    |       
    \---RDP Wrapper
        |   autoupdate.bat
        |   install.bat
        |   RDPCheck.exe
        |   RDPConf.exe
        |   RDPWInst-v1.6.2.msi
        |   RDPWInst.exe
        |   rdpwrap-binary-download.md at master · asmtron-rdpwrap.url
        |   uninstall.bat
        |   update.bat
        |   
        \---helper
                autoupdate__disable_autorun_on_startup.bat
                autoupdate__enable_autorun_on_startup.bat
                autoupdate__info.txt
```
