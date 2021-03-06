@PUSHD %~DP0
msg * Sequenz %~f0 wird verarbeitet. Bitte haben Sie Geduld bis das Device automatisch neustartet - es werden noch Konfigurationsarbeiten durchgeführt.
:: Wallpaper
reg add "HKCU\Control Panel\Desktop" /v WallPaper /t REG_SZ /d "C:\Windows\Web\Wallpaper\winunity.jpg" /f >NUL 2>&1
sc config lfsvc start= disabled > NUL 2>&1
sc config SSDPSRV start= disabled > NUL 2>&1
sc config upnphost start= disabled > NUL 2>&1
sc config wmpnetworksvc start= disabled > NUL 2>&1
sc config DiagTrack start= disabled > NUL 2>&1
sc config diagnosticshub.standardcollector.service start= disabled > NUL 2>&1
sc config XblAuthManager start= demand > NUL 2>&1
sc config XblGameSave start= demand > NUL 2>&1
sc config XboxNetApiSvc start= demand > NUL 2>&1
sc config XboxGipSvc start= demand > NUL 2>&1

:: Disable Superfetch (A must for SSD drives, but good to do in general)
:: Disabling this service prevents further creation of PF files in C:\Windows\Prefetch.
:: After disabling this service, it is completely safe to delete everything in that folder, except for the ReadyBoot folder.
sc config SysMain start= disabled
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnableSuperfetch" /t REG_DWORD /d 0 /f > nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnablePrefetcher" /t REG_DWORD /d 0 /f > nul 2>&1

:: sc config xbgm start= demand > NUL 2>&1
:: WpnService required for PowerToys
:: sc config WpnService start= disabled 
:: sc config WpnUserService start= disabled 
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v AutoAdminLogon /t REG_SZ /d 0 /f  > NUL 2>&1
:: @powershell -noni -nol -nop -w hidden -ex bypass -co "& {Set-NetAdapterAdvancedProperty -DisplayName 'Send Buffer Size' -DisplayValue 4MB -NoRestart -confirm:$false}"
@powershell -nol -nop -w hidden -ex bypass -co "& {Set-SmbServerConfiguration -EncryptData $false -force;Set-SmbServerConfiguration -RequireSecuritySignature $false -force}" 
:: @powershell -nol -nop -w hidden -ex bypass -co "& {Set-MpPreference -EnableControlledFolderAccess Enabled -Force}" 
@powershell -noni -nol -nop -w hidden -ex bypass -co "& {Get-NetAdapter | Disable-NetAdapterBinding -ComponentID ms_pacer,ms_lldp,ms_rspndr,ms_server,ms_lltdio -ErrorAction SilentlyContinue}" 
:: Windows Defender does not exceed the percentage of CPU usage that you specify. The default value is 50%
@powershell -noni -nol -nop -w hidden -ex bypass -co "& {Set-MpPreference -ScanAvgCPULoadFactor 25}" 
:: Disable System Restore for system drive - Not applicable to Server
@powershell -noni -nol -nop -w hidden -ex bypass -co "& {Disable-ComputerRestore -Drive "$env:SYSTEMDRIVE"}"

schtasks /change /TN "\Microsoft\Windows\Customer Experience Improvement Program\Consolidator" /DISABLE > NUL 2>&1
::  The USB CEIP (Customer Experience Improvement Program) task collects Universal Serial Bus related statistics and information about your machine
schtasks /change /TN "\Microsoft\Windows\Customer Experience Improvement Program\UsbCeip" /DISABLE > NUL 2>&1
schtasks /Change /TN "Microsoft\Windows\AppID\SmartScreenSpecific" /Disable > nul 2>&1
:: Collects program telemetry information if opted-in to the Microsoft Customer Experience Improvement Program.
schtasks /Change /TN "Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" /Disable > nul 2>&1
:: Collects program telemetry information if opted-in to the Microsoft Customer Experience Improvement Program
schtasks /Change /TN "Microsoft\Windows\Application Experience\ProgramDataUpdater" /Disable > nul 2>&1
schtasks /Change /TN "Microsoft\Windows\Application Experience\StartupAppTask" /Disable > nul 2>&1
:: If the user has consented to participate in the Windows Customer Experience Improvement Program, this job collects and sends usage data to Microsoft
schtasks /Change /TN "Microsoft\Windows\Autochk\Proxy" /Disable > nul 2>&1
schtasks /Change /TN "Microsoft\Windows\Customer Experience Improvement Program\KernelCeipTask" /Disable > nul 2>&1
:: The Windows Disk Diagnostic reports general disk and system information to Microsoft for users participating in the Customer Experience Program
schtasks /Change /TN "Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector" /Disable > nul 2>&1
schtasks /Change /TN "Microsoft\Windows\PI\Sqm-Tasks" /Disable > nul 2>&1
schtasks /Change /TN "Microsoft\Windows\Windows Error Reporting\QueueReporting" /Disable > nul 2>&1
schtasks /Change /TN "Microsoft\Windows\Device Setup\Metadata Refresh" /Disable >NUL 2>&1
schtasks /Change /TN "Microsoft\XblGameSave\XblGameSaveTask" /Disable >NUL 2>&1
schtasks /Change /TN "Microsoft\XblGameSave\XblGameSaveTaskLogon" /Disable >NUL 2>&1
schtasks /Change /TN "Microsoft\Windows\PushToInstall\LoginCheck" /disable >NUL 2>&1
schtasks /Change /TN "Microsoft\Windows\PushToInstall\Registration" /disable >NUL 2>&1
schtasks /Change /TN "Microsoft\Windows\Application Experience\AitAgent" /disable >NUL 2>&1
schtasks /Change /TN "Microsoft\Windows\CloudExperienceHost\CreateObjectTask" /disable >NUL 2>&1
schtasks /Change /TN "Microsoft\Windows\Customer Experience Improvement Program\BthSQM" /disable >NUL 2>&1
schtasks /Change /TN "Microsoft\Windows\Customer Experience Improvement Program\Uploader" /disable >NUL 2>&1
schtasks /Change /TN "Microsoft\Windows\Feedback\Siuf\DmClientOnScenarioDownload" /disable >NUL 2>&1
schtasks /Change /TN "Microsoft\Windows\Feedback\Siuf\DmClient" /disable >NUL 2>&1
schtasks /Change /TN "Microsoft\Windows\DiskFootprint\Diagnostics" /disable >NUL 2>&1
schtasks /change /TN "Microsoft\Windows\Device Information\Device" /DISABLE >NUL 2>&1
schtasks /Change /TN "Microsoft\Windows\NetTrace\GatherNetworkInfo" /Disable >NUL 2>&1
schtasks /Change /TN "Microsoft\Windows\Maintenance\WinSAT" /Disable >NUL 2>&1
SCHTASKS /Change /TN "\Microsoft\Windows\Work Folders\Work Folders Maintenance Work" /DISABLE >NUL 2>&1
SCHTASKS /Change /TN "\Microsoft\Windows\Work Folders\Work Folders Logon Synchronization" /DISABLE >NUL 2>&1

del "C:\Users\Public\Desktop\Microsoft Edge.lnk" /Q NUL 2>&1
attrib -r %WINDIR%\SYSTEM32\backup.ps1 >NUL 2>&1
attrib +I -r C:\Assets\*.* /D /S >NUL 2>&1
attrib +I -r C:\Drivers\*.* /D /S >NUL 2>&1
attrib -r C:\Users\Default\AppData\Roaming\Wireshark\*.* /D /S >NUL 2>&1
attrib -r C:\Users\Default\AppData\Roaming\Notepad++\*.* /D /S >NUL 2>&1
attrib -r C:\Users\Default\AppData\Roaming\vlc\*.* /D /S >NUL 2>&1
attrib -r C:\Program Files (x86)\Google\Chrome\Application\master_preferences /D /S >NUL 2>&1
attrib +s C:\Assets >NUL 2>&1
attrib +s C:\Drivers >NUL 2>&1
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Active Setup\Installed Components\{401C381F-E0DE-4B85-8BD8-4F3F14FBDA57}" /f > NUL 2>&1
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Active Setup\Installed Components\{401C381F-E0DE-4B85-8BD8-4F3F14FBDA57}" /f /reg:32 > NUL 2>&1

:: Firwall Loggin and Whitelisting
netsh advfirewall set privateprofile logging filename %systemroot%\system32\LogFiles\Firewall\privat_pfirewall.log >NUL 2>&1
netsh advfirewall set publicprofile logging filename %systemroot%\system32\LogFiles\Firewall\public_pfirewall.log >NUL 2>&1
netsh advfirewall set domainprofile logging filename %systemroot%\system32\LogFiles\Firewall\domain_pfirewall.log >NUL 2>&1
netsh advfirewall set privateprofile logging maxfilesize 4096 >NUL 2>&1
:: netsh advfirewall set privateprofile logging droppedconnections enable >NUL 2>&1
:: netsh advfirewall set domainprofile logging droppedconnections enable >NUL 2>&1
:: netsh advfirewall set publicprofile logging droppedconnections enable >NUL 2>&1
:: netsh advfirewall set privateprofile logging allowedconnections enable >NUL 2>&1
netsh advfirewall firewall add rule name="10000__PERMI__TCP__9833" dir=in action=allow protocol=TCP localport=9833 remoteip=localsubnet >NUL 2>&1
netsh advfirewall firewall add rule name="10001__PERMI__APP__Explorer" dir=out action=allow localip=any remoteip=localsubnet program="%WINDIR%\Explorer.exe" >NUL 2>&1
netsh advfirewall firewall add rule name="10000__PERMI__SVC__DNS" dir=out action=allow protocol=UDP localport=any remoteport=53 service="Dnscache" >NUL 2>&1
netsh advfirewall firewall add rule name="10000__PERMI__SVC__DHCP" dir=out action=allow protocol=UDP localport=any remoteport=67,68 service="Dhcp" >NUL 2>&1
netsh advfirewall firewall add rule name="10000__PERMI__SVC__TIME" dir=out action=allow protocol=UDP localport=any remoteport=123 service="W32Time" >NUL 2>&1
netsh advfirewall firewall add rule name="10002__PERMI__ICMP_PRIV" protocol=icmpv4:any,any dir=in action=allow profile=private,domain remoteip=localsubnet >NUL 2>&1
netsh advfirewall firewall add rule name="10003__PERMI__APP__Teams-TCP" dir=out action=allow protocol=TCP localip=any remoteip=any program="%localappdata%\microsoft\Teams\current\teams.exe" >NUL 2>&1
netsh advfirewall firewall add rule name="10003__PERMI__APP__Teams-UDP" dir=out action=allow protocol=UDP localip=any remoteip=any program="%localappdata%\microsoft\Teams\current\teams.exe" >NUL 2>&1
netsh advfirewall firewall add rule name="10004__PERMI__APP__TouchPortal" dir=in action=allow protocol=any localip=any remoteip=any program="C:\Program Files (x86)\Touch Portal\TouchPortal.exe" >NUL 2>&1
netsh advfirewall firewall add rule name="00000__BLOCK__APP__Cortana" dir=out action=block localip=any remoteip=any interface=any program="%WINDIR%\systemapps\Microsoft.Windows.Cortana._cw5n1h2txyewy\SearchUI.exe" >NUL 2>&1
netsh advfirewall firewall add rule name="00000__BLOCK__APP__CERTUTIL" dir=out action=block localip=any remoteip=any interface=any program="%WINDIR%\System32\certutil.exe" >NUL 2>&1
netsh advfirewall firewall add rule name="00001__BLOCK__APP__SystemSettings" dir=out action=block localip=any remoteip=any interface=any program="%WINDIR%\ImmersiveControlPanel\SystemSettings.exe" >NUL 2>&1
netsh advfirewall firewall add rule name="00010__BLOCK__APP__Greenshot" dir=out action=block localip=any remoteip=any program="%ProgramFiles%\Greenshot\Greenshot.exe" >NUL 2>&1
netsh advfirewall firewall add rule name="00011__BLOCK__APP__PowerToys" dir=out action=block localip=any remoteip=any program="%ProgramFiles%\PowerToys\PowerToys.exe" >NUL 2>&1
netsh advfirewall firewall set rule group="Netzwerkerkennung" new enable=no >NUL 2>&1
netsh advfirewall firewall set rule group="Remoteunterstützung" new enable=no >NUL 2>&1
netsh advfirewall firewall set rule group="Remotedesktop" new enable=no >NUL 2>&1
netsh advfirewall firewall set rule group='"Wiedergabe auf Gerät"-Funktionalität' new enable=no >NUL 2>&1
netsh advfirewall firewall set rule group="Windows Search" new enable=no >NUL 2>&1
netsh advfirewall firewall set rule name="Benutzererfahrung und Telemetrie im verbundenen Modus" new action=block >NUL 2>&1
netsh advfirewall firewall set rule group="Hilfe anfordern" new enable=no >NUL 2>&1
netsh advfirewall firewall set rule group="Windows Media Player-Netzwerkfreigabedienst" new enable=no >NUL 2>&1
netsh advfirewall firewall set rule dir=in name="Datei- und Druckerfreigabe (SMB eingehend)" new enable=no >NUL 2>&1
netsh advfirewall firewall add rule name="telemetry_vortex.data.microsoft.com" dir=out action=block remoteip=191.232.139.254 enable=yes >nul 2>&1
netsh advfirewall firewall add rule name="telemetry_telecommand.telemetry.microsoft.com" dir=out action=block remoteip=65.55.252.92 enable=yes >nul 2>&1
netsh advfirewall firewall add rule name="telemetry_oca.telemetry.microsoft.com" dir=out action=block remoteip=65.55.252.63 enable=yes >nul 2>&1
netsh advfirewall firewall add rule name="telemetry_sqm.telemetry.microsoft.com" dir=out action=block remoteip=65.55.252.93 enable=yes >nul 2>&1
netsh advfirewall firewall add rule name="telemetry_watson.telemetry.microsoft.com" dir=out action=block remoteip=65.55.252.43,65.52.108.29 enable=yes >nul 2>&1
netsh advfirewall firewall add rule name="telemetry_redir.metaservices.microsoft.com" dir=out action=block remoteip=194.44.4.200,194.44.4.208 enable=yes >nul 2>&1
netsh advfirewall firewall add rule name="telemetry_choice.microsoft.com" dir=out action=block remoteip=157.56.91.77 enable=yes >nul 2>&1
netsh advfirewall firewall add rule name="telemetry_df.telemetry.microsoft.com" dir=out action=block remoteip=65.52.100.7 enable=yes >nul 2>&1
netsh advfirewall firewall add rule name="telemetry_reports.wes.df.telemetry.microsoft.com" dir=out action=block remoteip=65.52.100.91 enable=yes >nul 2>&1
netsh advfirewall firewall add rule name="telemetry_wes.df.telemetry.microsoft.com" dir=out action=block remoteip=65.52.100.93 enable=yes >nul 2>&1
netsh advfirewall firewall add rule name="telemetry_services.wes.df.telemetry.microsoft.com" dir=out action=block remoteip=65.52.100.92 enable=yes >nul 2>&1
netsh advfirewall firewall add rule name="telemetry_sqm.df.telemetry.microsoft.com" dir=out action=block remoteip=65.52.100.94 enable=yes >nul 2>&1
netsh advfirewall firewall add rule name="telemetry_telemetry.microsoft.com" dir=out action=block remoteip=65.52.100.9 enable=yes >nul 2>&1
netsh advfirewall firewall add rule name="telemetry_watson.ppe.telemetry.microsoft.com" dir=out action=block remoteip=65.52.100.11 enable=yes >nul 2>&1
netsh advfirewall firewall add rule name="telemetry_telemetry.appex.bing.net" dir=out action=block remoteip=168.63.108.233 enable=yes >nul 2>&1
netsh advfirewall firewall add rule name="telemetry_telemetry.urs.microsoft.com" dir=out action=block remoteip=157.56.74.250 enable=yes >nul 2>&1
netsh advfirewall firewall add rule name="telemetry_settings-sandbox.data.microsoft.com" dir=out action=block remoteip=111.221.29.177 enable=yes >nul 2>&1
netsh advfirewall firewall add rule name="telemetry_vortex-sandbox.data.microsoft.com" dir=out action=block remoteip=64.4.54.32 enable=yes >nul 2>&1
netsh advfirewall firewall add rule name="telemetry_survey.watson.microsoft.com" dir=out action=block remoteip=207.68.166.254 enable=yes >nul 2>&1
netsh advfirewall firewall add rule name="telemetry_watson.live.com" dir=out action=block remoteip=207.46.223.94 enable=yes >nul 2>&1
netsh advfirewall firewall add rule name="telemetry_watson.microsoft.com" dir=out action=block remoteip=65.55.252.71 enable=yes >nul 2>&1
netsh advfirewall firewall add rule name="telemetry_statsfe2.ws.microsoft.com" dir=out action=block remoteip=64.4.54.22 enable=yes >nul 2>&1
netsh advfirewall firewall add rule name="telemetry_corpext.msitadfs.glbdns2.microsoft.com" dir=out action=block remoteip=131.107.113.238 enable=yes >nul 2>&1
netsh advfirewall firewall add rule name="telemetry_compatexchange.cloudapp.net" dir=out action=block remoteip=23.99.10.11 enable=yes >nul 2>&1
netsh advfirewall firewall add rule name="telemetry_cs1.wpc.v0cdn.net" dir=out action=block remoteip=68.232.34.200 enable=no >nul 2>&1
netsh advfirewall firewall add rule name="telemetry_a-0001.a-msedge.net" dir=out action=block remoteip=204.79.197.200 enable=yes >nul 2>&1
netsh advfirewall firewall add rule name="telemetry_statsfe2.update.microsoft.com.akadns.net" dir=out action=block remoteip=64.4.54.22 enable=yes >nul 2>&1
netsh advfirewall firewall add rule name="telemetry_sls.update.microsoft.com.akadns.net" dir=out action=block remoteip=157.56.77.139 enable=yes >nul 2>&1
netsh advfirewall firewall add rule name="telemetry_fe2.update.microsoft.com.akadns.net" dir=out action=block remoteip=134.170.58.121,134.170.58.123,134.170.53.29,66.119.144.190,134.170.58.189,134.170.58.118,134.170.53.30,134.170.51.190 enable=yes >nul 2>&1
netsh advfirewall firewall add rule name="telemetry_diagnostics.support.microsoft.com" dir=out action=block remoteip=157.56.121.89 enable=yes >nul 2>&1
netsh advfirewall firewall add rule name="telemetry_corp.sts.microsoft.com" dir=out action=block remoteip=131.107.113.238 enable=yes >nul 2>&1
netsh advfirewall firewall add rule name="telemetry_statsfe1.ws.microsoft.com" dir=out action=block remoteip=134.170.115.60 enable=yes >nul 2>&1
netsh advfirewall firewall add rule name="telemetry_pre.footprintpredict.com" dir=out action=block remoteip=204.79.197.200 enable=yes >nul 2>&1
netsh advfirewall firewall add rule name="telemetry_i1.services.social.microsoft.com" dir=out action=block remoteip=104.82.22.249 enable=yes >nul 2>&1
netsh advfirewall firewall add rule name="telemetry_feedback.windows.com" dir=out action=block remoteip=134.170.185.70 enable=yes >nul 2>&1
netsh advfirewall firewall add rule name="telemetry_feedback.microsoft-hohm.com" dir=out action=block remoteip=64.4.6.100,65.55.39.10 enable=yes >nul 2>&1
netsh advfirewall firewall add rule name="telemetry_feedback.search.microsoft.com" dir=out action=block remoteip=157.55.129.21 enable=yes >nul 2>&1
netsh advfirewall firewall add rule name="telemetry_rad.msn.com" dir=out action=block remoteip=207.46.194.25 enable=yes >nul 2>&1
netsh advfirewall firewall add rule name="telemetry_preview.msn.com" dir=out action=block remoteip=23.102.21.4 enable=yes >nul 2>&1
netsh advfirewall firewall add rule name="telemetry_dart.l.doubleclick.net" dir=out action=block remoteip=173.194.113.220,173.194.113.219,216.58.209.166 enable=yes >nul 2>&1
netsh advfirewall firewall add rule name="telemetry_ads.msn.com" dir=out action=block remoteip=157.56.91.82,157.56.23.91,104.82.14.146,207.123.56.252,185.13.160.61,8.254.209.254 enable=yes >nul 2>&1
netsh advfirewall firewall add rule name="telemetry_a.ads1.msn.com" dir=out action=block remoteip=198.78.208.254,185.13.160.61 enable=yes >nul 2>&1
netsh advfirewall firewall add rule name="telemetry_global.msads.net.c.footprint.net" dir=out action=block remoteip=185.13.160.61,8.254.209.254,207.123.56.252 enable=yes >nul 2>&1
netsh advfirewall firewall add rule name="telemetry_az361816.vo.msecnd.net" dir=out action=block remoteip=68.232.34.200 enable=no >nul 2>&1
netsh advfirewall firewall add rule name="telemetry_oca.telemetry.microsoft.com.nsatc.net" dir=out action=block remoteip=65.55.252.63 enable=yes >nul 2>&1
netsh advfirewall firewall add rule name="telemetry_reports.wes.df.telemetry.microsoft.com" dir=out action=block remoteip=65.52.100.91 enable=yes >nul 2>&1
netsh advfirewall firewall add rule name="telemetry_df.telemetry.microsoft.com" dir=out action=block remoteip=65.52.100.7 enable=yes >nul 2>&1
netsh advfirewall firewall add rule name="telemetry_cs1.wpc.v0cdn.net" dir=out action=block remoteip=68.232.34.200 enable=no >nul 2>&1
netsh advfirewall firewall add rule name="telemetry_vortex-sandbox.data.microsoft.com" dir=out action=block remoteip=64.4.54.32 enable=yes >nul 2>&1
netsh advfirewall firewall add rule name="telemetry_pre.footprintpredict.com" dir=out action=block remoteip=204.79.197.200 enable=yes >nul 2>&1
netsh advfirewall firewall add rule name="telemetry_i1.services.social.microsoft.com" dir=out action=block remoteip=104.82.22.249 enable=yes >nul 2>&1
netsh advfirewall firewall add rule name="telemetry_ssw.live.com" dir=out action=block remoteip=207.46.101.29 enable=yes >nul 2>&1
netsh advfirewall firewall add rule name="telemetry_statsfe1.ws.microsoft.com" dir=out action=block remoteip=134.170.115.60 enable=yes >nul 2>&1
netsh advfirewall firewall add rule name="telemetry_msnbot-65-55-108-23.search.msn.com" dir=out action=block remoteip=65.55.108.23 enable=yes >nul 2>&1
netsh advfirewall firewall add rule name="telemetry_a23-218-212-69.deploy.static.akamaitechnologies.com" dir=out action=block remoteip=23.218.212.69 enable=yes >nul 2>&1
:: netsh advfirewall firewall add rule name="StopYoutubeCDNBrake" dir=in action=block remoteip=173.194.55.0/24,206.111.0.0/16 enable=yes >NUL 2>&1
:: Netsh.exe advfirewall firewall add rule name="Block Notepad.exe netconns" program="%systemroot%\system32\notepad.exe" protocol=tcp dir=out enable=yes action=block profile=any
:: Netsh.exe advfirewall firewall add rule name="Block regsvr32.exe netconns" program="%systemroot%\system32\regsvr32.exe" protocol=tcp dir=out enable=yes action=block profile=any
:: Netsh.exe advfirewall firewall add rule name="Block calc.exe netconns" program="%systemroot%\system32\calc.exe" protocol=tcp dir=out enable=yes action=block profile=any
:: Netsh.exe advfirewall firewall add rule name="Block mshta.exe netconns" program="%systemroot%\system32\mshta.exe" protocol=tcp dir=out enable=yes action=block profile=any
:: Netsh.exe advfirewall firewall add rule name="Block wscript.exe netconns" program="%systemroot%\system32\wscript.exe" protocol=tcp dir=out enable=yes action=block profile=any
:: Netsh.exe advfirewall firewall add rule name="Block cscript.exe netconns" program="%systemroot%\system32\cscript.exe" protocol=tcp dir=out enable=yes action=block profile=any
:: Netsh.exe advfirewall firewall add rule name="Block runscripthelper.exe netconns" program="%systemroot%\system32\runscripthelper.exe" protocol=tcp dir=out enable=yes action=block profile=any
:: Netsh.exe advfirewall firewall add rule name="Block hh.exe netconns" program="%systemroot%\system32\hh.exe" protocol=tcp dir=out enable=yes action=block profile=any
:: Netsh.exe advfirewall firewall add rule name="Block rundll32 netconns" program="%systemroot%\system32\rundll32.exe" protocol=tcp dir=out enable=yes action=block profile=any
netsh advfirewall firewall add rule name="YoutubeBufferTrick" dir=in action=block remoteip=173.194.55.0/24,206.111.0.0/16 >NUL 2>&1
:: Adding DoH entries for AdGuard
netsh dns add encryption server=94.140.14.14 dohtemplate=https://dns.adguard.com/dns-query >NUL 2>&1
netsh dns add encryption server=94.140.15.15 dohtemplate=https://dns.adguard.com/dns-query >NUL 2>&1
netsh dns add encryption server=2a10:50c0::ad1:ff dohtemplate=https://dns.adguard.com/dns-query >NUL 2>&1
netsh dns add encryption server=2a10:50c0::ad2:ff dohtemplate=https://dns.adguard.com/dns-query >NUL 2>&1
netsh dns add encryption server=94.140.14.15 dohtemplate=https://dns-family.adguard.com/dns-query >NUL 2>&1
netsh dns add encryption server=94.140.15.16 dohtemplate=https://dns-family.adguard.com/dns-query >NUL 2>&1
netsh dns add encryption server=2a10:50c0::bad1:ff dohtemplate=https://dns-family.adguard.com/dns-query >NUL 2>&1
netsh dns add encryption server=2a10:50c0::bad2:ff dohtemplate=https://dns-family.adguard.com/dns-query >NUL 2>&1
netsh dns add encryption server=94.140.14.140 dohtemplate=https://dns-unfiltered.adguard.com/dns-query >NUL 2>&1
netsh dns add encryption server=94.140.14.141 dohtemplate=https://dns-unfiltered.adguard.com/dns-query >NUL 2>&1
netsh dns add encryption server=2a10:50c0::1:ff dohtemplate=https://dns-unfiltered.adguard.com/dns-query >NUL 2>&1
netsh dns add encryption server=2a10:50c0::2:ff dohtemplate=https://dns-unfiltered.adguard.com/dns-query >NUL 2>&1

:: netsh int tcp set global autotuninglevel=normal >NUL 2>&1
:: netsh winsock set autotuning on >NUL 2>&1
:: 6to4 state can cause high CPU!
netsh int ipv6 6to4 set state disabled >NUL 2>&1
netsh interface teredo set state disabled >NUL 2>&1
netsh interface isatap set state disabled >NUL 2>&1
:: netsh interface ipv4 set global mldlevel=none >NUL 2>&1
:: Disable Memory Pressure Protection (DDOS) - https://www.itprotoday.com/compute-engines/understand-memory-pressure-protection
netsh int tcp set security mpp=disabled >NUL 2>&1
netsh int tcp set security profiles=disabled >NUL 2>&1
:: Arp Cache erhöhen
:: netsh interface ip set global neighborcachelimit=4096 >NUL 2>&1

:: Precedence von IPv6 herunterstufen
netsh interface ipv6 set prefix ::/96 60 3 >NUL 2>&1
netsh interface ipv6 set prefix ::ffff:0:0/96 55 4 >NUL 2>&1

:: #PORT FORWARDING
:: #to reset or delete a portforwarding
:: netsh interface portproxy delete v4tov4 listenport=80 listenaddress=192.168.1.0
:: netsh interface portproxy reset
:: netsh interface portproxy delete
:: #show all forwardings 
:: netsh interface portproxy show all
:: #forward local port 
:: netsh interface portproxy add v4tov4 listenaddress=* listenport=80 connectaddress=10.0.10.22 connectport=8080

:: Specifies how the System responds when a user tries to install device driver files that are not digitally signed / 00 - Ignore / 01 - Warn / 02 - Block
reg add "HKLM\Software\Microsoft\Driver Signing" /v "Policy" /t REG_BINARY /d "01" /f >NUL 2>&1
:: Remove Music folder from This PC on
reg delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{3dfdf296-dbec-4fb4-81d1-6a3438bcf4de}" /f
reg delete "HKLM\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{3dfdf296-dbec-4fb4-81d1-6a3438bcf4de}" /f
:: Remove Pictures folder from This PC
reg delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{24ad3ad4-a569-4530-98e1-ab02f9417aa8}" /f
reg delete "HKLM\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{24ad3ad4-a569-4530-98e1-ab02f9417aa8}" /f
:: Remove Videos folder from This PC
reg delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{f86fa3ab-70d2-4fc7-9c99-fcbf05467f3a}" /f
reg delete "HKLM\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{f86fa3ab-70d2-4fc7-9c99-fcbf05467f3a}" /f
:: Disable Background disk defragmentation / y - EnableHow long in milliseconds you want to have for a startup delay time for desktop apps that run at startup to load
reg add "HKLM\Software\Microsoft\Dfrg\BootOptimizeFunction" /v "Enable" /t REG_SZ /d "n" /f >NUL 2>&1
:: Disable Background auto-layout / Disable Optimize Hard Disk when idle
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\OptimalLayout" /v "EnableAutoLayout" /t REG_DWORD /d "0" /f >NUL 2>&1
:: Restart notification allows user to initiate the restart or postpone restart. This notification does not have a countdown timer. The user must initiate the system restart.
reg add "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "AlwaysAutoRebootAtScheduledTime" /t REG_DWORD /d "0" /f >NUL 2>&1
reg add "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "NoAutoRebootWithLoggedOnUsers" /t REG_DWORD /d "1" /f >NUL 2>&1
reg add "HKLM\Software\Policies\Microsoft\Windows\Psched" /v "NonBestEffortLimit" /t REG_DWORD /d "0" /f >NUL 2>&1
Reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\CompatTelRunner.exe" /v Debugger /t REG_SZ /d "C:\Windows\System32\taskkill.exe" /f >NUL 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\DeviceCensus.exe" /v Debugger /t REG_SZ /d "%windir%\System32\taskkill.exe" /f >NUL 2>&1

setx /m devmgr_show_nonpresent_devices "1"
:: setx /m __PSLockDownPolicy "4"

:: Windows Defender in der Sandbox aktivieren
setx /M MP_FORCE_USE_SANDBOX 1 >NUL 2>&1

:: Disable NET Core CLI telemetry
setx DOTNET_CLI_TELEMETRY_OPTOUT 1 >NUL 2>&1
:: Disable PowerShell 7+ telemetry
setx POWERSHELL_TELEMETRY_OPTOUT 1 >NUL 2>&1

:: Sysmon64.exe -i -h sha1,md5,sha256,imphash -n -accepteula

nircmdc shortcut "%WINDIR%\nircmdc.exe" "~$folder.desktop$" "Installation Treiber" "elevate C:\Drivers\installDrivers.cmd" "C:\windows\system32\shell32.dll" 12 > NUL 2>&1
:: nircmdc shortcut "%WINDIR%\nircmdc.exe" "~$folder.desktop$" "Aktivierung Lizenz Windows" "elevate C:\Assets\Scripts\Windows_Activation.cmd" "C:\windows\system32\shell32.dll" 271 > NUL 2>&1
:: nircmdc shortcut "%WINDIR%\nircmdc.exe" "~$folder.desktop$" "Installation Office" "elevate C:\Assets\Office\install.cmd" "C:\windows\system32\shell32.dll" 271 > NUL 2>&1
nircmdc shortcut "C:\Windows\System32\cmd.exe" "~$folder.desktop$" "Installation Veeam Backup" "/c C:\Assets\Veeam\install.cmd" "C:\windows\system32\shell32.dll" 271 > NUL 2>&1
:: nircmdc shortcut "wmic.exe" "~$folder.desktop$" "Profile entfernen" " path win32_UserProfile where 'Special!='True' And Not LocalPath Like '%%\\admin'' Delete" "C:\windows\system32\shell32.dll" 250 > NUL 2>&1
:: nircmdc shortcut "%WINDIR%\nircmdc.exe" "~$folder.desktop$" "Profile entfernen" "elevate wmic.exe path win32_UserProfile where 'Special!='True' And Not LocalPath Like '%%\\admin'' Delete" "C:\windows\system32\shell32.dll" 250 > NUL 2>&1
nircmdc shortcut "C:\windows\system32\shutdown.exe" "~$folder.desktop$" "Abmelden" "-l -f" "C:\windows\system32\shell32.dll" 26 "" "" "CTRL+Shift+L" > NUL 2>&1
:: nircmdc shortcut "C:\windows\system32\shutdown.exe" "~$folder.desktop$" "Herunterfahren" "-s -t 0 -f" "C:\windows\system32\shell32.dll" 28 > NUL 2>&1
:: Disable System Recovery and Factory reset
:: reagentc /disable >NUL 2>&1
:: openfiles /Local ON > NUL 2>&1
:: For /r C:\ %%f in (*.log) do compact.exe /c /a /i /q "%%f" > NUL 2>&1

:: Disk turn on write caching and disable cache flush
For /f "Delims=" %%k in ('Reg.exe Query hklm\SYSTEM\CurrentControlSet\Enum /f "Disk" /k /s^|Findstr "Parameters\Disk"') do (
	Reg add "%%k" /v UserWriteCacheSetting /t reg_dword /d 1 /f > NUL 2>&1
	Reg add "%%k" /v CacheIsPowerProtected /t reg_dword /d 1 /f > NUL 2>&1
)

:: Adobe Flash Kill
regsvr32 /u %systemroot%\System32\Macromed\Flash\Flash.ocx /s > NUL 2>&1
takeown /f %systemroot%\System32\Macromed /r > NUL 2>&1
icacls %systemroot%\System32\Macromed /grant Benutzer:(OI)(CI)F /inheritance:r /T > NUL 2>&1
rd %systemroot%\system32\macromed /S /Q > NUL 2>&1
:: dergleiche Ablauf für SysWOW64
regsvr32 /u %systemroot%\SysWOW64\Macromed\Flash\Flash.ocx /s > NUL 2>&1
takeown /f %systemroot%\SysWOW64\Macromed /r > NUL 2>&1
icacls %systemroot%\SysWOW64\macromed /grant Benutzer:(OI)(CI)F /inheritance:r /T > NUL 2>&1
rd %systemroot%\SysWOW64\macromed /S /Q > NUL 2>&1
wusa C:\Assets\FlashKiller\windows10.0-kb4577586-x64_c9bb49df325c20ddc147137b3f769fa44d800dde.msu /quiet /norestart > NUL 2>&1

:: Disable Hibernation / Disable Fast Startup (Hybrid Boot)
Dir /ah C:\hiberfil.sys && PowerCfg.exe -H OFF && Del /F /Q C:\hiberfil.sys > nul
RD /S /Q %TEMP% > NUL 2>&1
RD /S /Q %WINDIR%\TEMP > NUL 2>&1

:: Firewall rules to prevent the startmenu from talking
reg add "HKLM\SYSTEM\ControlSet001\Services\SharedAccess\Parameters\FirewallPolicy\FirewallRules" /v "Block Search SearchApp.exe" /t REG_SZ /d "v2.30|Action=Block|Active=TRUE|Dir=Out|RA42=IntErnet|RA62=IntErnet|App=C:\Windows\SystemApps\Microsoft.Windows.Search_cw5n1h2txyewy\SearchApp.exe|Name=Block Search SearchUI.exe|Desc=Block Cortana Outbound UDP/TCP Traffic|"/f > NUL 2>&1

:: Disable Windows Error Reporting Service
reg add "HKLM\SYSTEM\CurrentControlSet\Services\WerSvc" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1

:: DEL /F /S /Q /A "%AppData%\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar\*" >NUL 2>&1

:: HPET (High Precision Event Timer) deaktivieren
bcdedit /set tscsyncpolicy enhanced > NUL 2>&1
bcdedit /set pae alwayson > NUL 2>&1
bcdedit /deletevalue useplatformclock > NUL 2>&1
:: bcdedit /set useplatformclock true > NUL 2>&1
bcdedit /set disabledynamictick yes > NUL 2>&1

:: Enable Features
Dism.exe /Online /Enable-Feature /NoRestart /featurename:DirectPlay /all /Quiet >nul 2>&1

:: Enabling Group Policy Editor if not already present
IF NOT EXIST "%SystemRoot%\System32\gpedit.msc" (
	dir /b %SystemRoot%\servicing\Packages\Microsoft-Windows-GroupPolicy-ClientExtensions-Package~3*.mum >List.txt
	dir /b %SystemRoot%\servicing\Packages\Microsoft-Windows-GroupPolicy-ClientTools-Package~3*.mum >>List.txt 
	for /f %%i in ('findstr /i . List.txt 2^>nul') do dism /online /norestart /add-package:"%SystemRoot%\servicing\Packages\%%i"
)

:: Disable Features
Dism /Online /Disable-Feature /FeatureName:Printing-XPSServices-Features /Quiet /NoRestart >nul 2>&1
dism /Online /norestart /disable-feature /featurename:WindowsMediaPlayer >nul 2>&1
dism /Online /norestart /disable-feature /featurename:Printing-XPSServices-Features >nul 2>&1
Dism /Online /Disable-Feature /FeatureName:MicrosoftWindowsPowerShellV2 /Quiet /NoRestart >nul 2>&1
Dism /Online /Disable-Feature /FeatureName:MicrosoftWindowsPowerShellV2Root /Quiet /NoRestart >nul 2>&1

:: Removing useless windows components
EventCreate.exe /L SYSTEM  /T INFORMATION /ID 999 /D "Removing useless windows components."
powershell -command " get-appxpackage -allusers *Microsoft.WindowsFeedback* | remove-appxpackage " >nul 2>&1
:: powershell -command " get-appxpackage -allusers 'Microsoft.WindowsFeedbackHub' | remove-appxpackage " >nul 2>&1
powershell -command " get-appxpackage -allusers 'Microsoft.GetHelp' | remove-appxpackage " >nul 2>&1
powershell -command " get-appxpackage -allusers 'Microsoft.SkypeApp' | remove-appxpackage " >nul 2>&1
powershell -command " get-AppxPackage *Microsoft.MicrosoftOfficeHub* -AllUsers | Remove-AppxPackage" >nul 2>&1
:: powershell Disable-WindowsOptionalFeature -Online -FeatureName MicrosoftWindowsPowerShellV2 -norestart >nul 2>&1
:: powershell Disable-WindowsOptionalFeature -Online -FeatureName MicrosoftWindowsPowerShellV2Root -norestart >nul 2>&1

:: start C:\Drivers\installDrivers.cmd

:: Windows Remote aktivieren - fuer (Core-)Server Administration
:: winrm quickconfig -q -force >nul 2>&1
:: winrm set winrm/config/client @{TrustedHosts="*"} >nul 2>&1
:: cmdkey /add:vsrv01 /user:test\administrator /pass:Password1!

:: Change NTP (time) server to pool.ntp.org
:: w32tm /config /syncfromflags:manual /manualpeerlist:"0.pool.ntp.org 1.pool.ntp.org 2.pool.ntp.org 3.pool.ntp.org" >nul 2>&1
:: w32tm /config /update >nul 2>&1
:: w32tm /resync >nul 2>&1

:: Set Network-Zone private
:: powershell -ex bypass -nop -file C:\Assets\Scripts\setNetworkPrivate.ps1 >NUL 2>&1

:: Remove Fax
EventCreate.exe /L SYSTEM  /T INFORMATION /ID 999 /D "Remove Fax."
dism /online /norestart /remove-capability /CapabilityName:Print.Fax.Scan~~~~0.0.1.0 >nul 2>&1
cscript "C:\Windows\System32\Printing_Admin_Scripts\de-de\prnmngr.vbs" -d -p "FAX" >nul 2>&1
cscript "C:\Windows\System32\Printing_Admin_Scripts\de-de\prndrvr.vbs" -d -m "Microsoft Shared Fax Driver" -v 3 -e "Windows x64" >nul 2>&1
:: printui /dl /n "Send To OneNote 2016" 
:: cscript "C:\Windows\System32\Printing_Admin_Scripts\de-de\prndrvr.vbs" -d -m "Send to Microsoft OneNote 16 Driver" -v 4 -e "Windows x64" 2>&1

:: MS Teams Firewall rules
@powershell -noni -nol -nop -w hidden -ex bypass -co "& { new-netfirewallRule -name ${env:UserName}-Teams.exe-tcp -Displayname ${UserName}-Teams.exe-tcp -enabled:true -Profile Any -Direction Inbound -Action Allow -program ${LocalAppData}\microsoft\teams\current\teams.exe -protocol TCP -ErrorAction SilentlyContinue }" >nul 2>&1
@powershell -noni -nol -nop -w hidden -ex bypass -co "& { new-netfirewallRule -name ${env:UserName}-Teams.exe-udp -Displayname ${UserName}-Teams.exe-udp -enabled:true -Profile Any -Direction Inbound -Action Allow -program ${LocalAppData}\microsoft\teams\current\teams.exe -protocol UDP -ErrorAction SilentlyContinue }" >nul 2>&1

:: Mehr Details im Löschen-Dialog
reg add "HKCR\AllFilesystemObjects" /v "FileOperationPrompt" /t REG_SZ /d "prop:System.PropGroup.FileSystem;System.ItemNameDisplay;System.ItemTypeText;System.ItemFolderPathDisplay;System.Size;System.DateCreated;System.DateModified;System.FileAttributes;System.OfflineAvailability;System.OfflineStatus;System.SharedWith;System.FileOwner;System.ComputerName" /f >nul 2>&1

:: PowerCM
Reg add "HKCR\DesktopBackground\Shell\Power" /v "MUIVerb" /t REG_SZ /d "Power" /f >nul 2>&1
Reg add "HKCR\DesktopBackground\Shell\Power" /v "SubCommands" /t REG_SZ /d "Lock;SwitchUser;SignOut;Sleep;Hibernate;HybridShutdown;ShutDown;Restart;BootOptions" /f >nul 2>&1
Reg add "HKCR\DesktopBackground\Shell\Power" /v "icon" /t REG_SZ /d "shell32.dll,-221" /f >nul 2>&1
Reg add "HKCR\DesktopBackground\Shell\Power" /v "Position" /t REG_SZ /d "bottom" /f >nul 2>&1

Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\Lock" /ve /t REG_SZ /d "Host sperren" /f >nul 2>&1
Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\Lock" /v "icon" /t REG_SZ /d "shell32.dll,-48" /f >nul 2>&1
Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\Lock\command" /ve /t REG_SZ /d "rundll32 user32.dll, LockWorkStation" /f >nul 2>&1

Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\SwitchUser" /ve /t REG_SZ /d "Switch User" /f >nul 2>&1
Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\SwitchUser" /v "icon" /t REG_SZ /d "imageres.dll,-88" /f >nul 2>&1
Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\SwitchUser\command" /ve /t REG_SZ /d "tsdiscon" /f >nul 2>&1

Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\SignOut" /ve /t REG_SZ /d "Sign out" /f >nul 2>&1
Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\SignOut" /v "icon" /t REG_SZ /d "shell32.dll,-45" /f >nul 2>&1
Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\SignOut\command" /ve /t REG_SZ /d "shutdown -L" /f >nul 2>&1

Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\ShutDown" /ve /t REG_SZ /d "Full Shut down" /f >nul 2>&1
Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\ShutDown" /v "icon" /t REG_SZ /d "shell32.dll,-28" /f >nul 2>&1
Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\ShutDown\command" /ve /t REG_SZ /d "shutdown -s -f -t 00" /f >nul 2>&1

Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\HybridShutdown" /ve /t REG_SZ /d "Hybrid Shut down" /f >nul 2>&1
Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\HybridShutdown" /v "icon" /t REG_SZ /d "shell32.dll,-28" /f >nul 2>&1
Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\HybridShutdown\command" /ve /t REG_SZ /d "Shutdown -s -f -hybrid -t 00" /f >nul 2>&1

Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\Restart" /ve /t REG_SZ /d "Restart" /f >nul 2>&1
Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\Restart" /v "icon" /t REG_SZ /d "shell32.dll,-290" /f >nul 2>&1
Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\Restart\command" /ve /t REG_SZ /d "shutdown -r -f -t 00" /f >nul 2>&1

Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\sleep" /ve /t REG_SZ /d "Sleep" /f >nul 2>&1
Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\sleep" /v "icon" /t REG_SZ /d "powercpl.dll,-514" /f >nul 2>&1
Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\sleep\command" /ve /t REG_SZ /d "rundll32 powrprof.dll,SetSuspendState Sleep" /f >nul 2>&1

Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\hibernate" /ve /t REG_SZ /d "Hibernate" /f >nul 2>&1
Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\hibernate" /v "icon" /t REG_SZ /d "imageres.dll,-101" /f >nul 2>&1
Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\hibernate\command" /ve /t REG_SZ /d "Shutdown -h" /f >nul 2>&1

Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\BootOptions" /ve /t REG_SZ /d "Restart SafeBoot Options" /f >nul 2>&1
Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\BootOptions" /v "icon" /t REG_SZ /d "RelPost" /f >nul 2>&1
Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\BootOptions\command" /ve /t REG_SZ /d "Shutdown -r -o -f -t 00" /f >nul 2>&1

:: Anwendungsblockade "ClickOnce Trust aktivieren" .NET-Framework aufheben - Ihre Sicherheitseinstellungen lassen die Installation dieser Anwendung auf Ihrem Computer nicht zu.
:: this only partially mitigates the risk of malicious ClickOnce Appps - the ability to run the manifest is disabled, but hash retrieval is still possible
reg add "HKLM\SOFTWARE\Microsoft\.NETFramework\Security\TrustManager\PromptingLevel" /v "Internet" /t REG_SZ /d "Enabled" /f > nul 2>&1
reg add "HKLM\SOFTWARE\MICROSOFT\.NETFramework\Security\TrustManager\PromptingLevel" /v MyComputer /t REG_SZ /d "Enabled" /f > nul 2>&1
reg add "HKLM\SOFTWARE\MICROSOFT\.NETFramework\Security\TrustManager\PromptingLevel" /v LocalIntranet /t REG_SZ /d "Enabled" /f > nul 2>&1
reg add "HKLM\SOFTWARE\MICROSOFT\.NETFramework\Security\TrustManager\PromptingLevel" /v Internet /t REG_SZ /d "Enabled" /f > nul 2>&1
reg add "HKLM\SOFTWARE\MICROSOFT\.NETFramework\Security\TrustManager\PromptingLevel" /v TrustedSites /t REG_SZ /d "Enabled" /f > nul 2>&1
reg add "HKLM\SOFTWARE\MICROSOFT\.NETFramework\Security\TrustManager\PromptingLevel" /v UntrustedSites /t REG_SZ /d "Enabled" /f > nul 2>&1

:: Disable-Lockscreen
Ren Microsoft.LockApp_cw5n1h2txyewy Microsoft.LockApp_cw5n1h2txyewy.backup >nul 2>&1

:: Install Fira-Fonts
@powershell -noni -nol -nop -w hidden -ex bypass -file "C:\Assets\Fonts\installfonts.ps1" >nul 2>&1

:: Cleanup Taskbar
powershell -noni -nol -nop -ex bypass -file "C:\Assets\Scripts\UnpinTaskbar.ps1" >nul 2>&1

:: XBOX Gamebar deaktivieren
takeown /f "%WinDir%\System32\GameBarPresenceWriter.exe" /a >nul 2>&1
icacls "%WinDir%\System32\GameBarPresenceWriter.exe" /grant:r Administratoren:F /c >nul 2>&1
taskkill /im GameBarPresenceWriter.exe /f >nul 2>&1
move "C:\Windows\System32\GameBarPresenceWriter.exe" "C:\Windows\System32\GameBarPresenceWriter.OLD" >nul 2>&1

:: Kontextmenue Eingabeaufforderung erweitern (shift-key)
regedit /S "C:\Assets\cmd-here-windows-10\cmd_ps_ab_hier.reg" >nul 2>&1

:: Autologon default user
autologon64 admin winunity demo /accepteula

wevtutil cl system && wevtutil cl application && wevtutil cl security  > NUL 2>&1
:: msg /TIME:3 * Gute Neuigkeiten: Optimiertes Windows erfolgreich ausgerollt!
EventCreate.exe /L SYSTEM  /T INFORMATION /ID 999 /D "Running Script cleanup completed."
shutdown -r -t 180 -f -c "Cleanup-Script-Sequenz startet Computer in 3 Minuten neu."

:: Null-routing bad hosts - Tron script - https://github.com/bmrf/tron/blob/master/resources/stage_4_repair/disable_windows_telemetry/purge_windows_10_telemetry.bat
:: Run this command to clear persistent routes only, takes effect at reboot. This will undo all the below changes
:: REG delete HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\PersistentRoutes /va /f
::route -f
:: a-0001.a-msedge.net
route -p add 204.79.197.200/32 0.0.0.0 >NUL 2>&1 >NUL 2>&1
:: a23-218-212-69.deploy.static.akamaitechnologies.com
route -p add 23.218.212.69/32 0.0.0.0 >NUL 2>&1
:: a.ads1.msn.com
route -p add 204.160.124.125/32 0.0.0.0 >NUL 2>&1
route -p add 8.253.14.126/32 0.0.0.0 >NUL 2>&1
route -p add 8.254.25.126/32 0.0.0.0 >NUL 2>&1
:: a.ads2.msads.net
route -p add 93.184.215.200/32 0.0.0.0 >NUL 2>&1
:: a.ads2.msn.com
route -p add 198.78.194.252/32 0.0.0.0 >NUL 2>&1
route -p add 198.78.209.253/32 0.0.0.0 >NUL 2>&1
route -p add 8.254.23.254/32 0.0.0.0 >NUL 2>&1
:: ac3.msn.com
route -p add 131.253.14.76/32 0.0.0.0 >NUL 2>&1
:: ads1.msads.net
route -p add 23.201.58.73/32 0.0.0.0 >NUL 2>&1
:: ads1.msn.com
route -p add 204.160.124.125/32 0.0.0.0 >NUL 2>&1
route -p add 8.253.14.126/32 0.0.0.0 >NUL 2>&1
route -p add 8.254.25.126/32 0.0.0.0 >NUL 2>&1
:: adsmockarc.azurewebsites.net
route -p add 191.236.16.12/32 0.0.0.0 >NUL 2>&1
:: ads.msn.com
route -p add 157.56.91.82/32 0.0.0.0 >NUL 2>&1
:: auth.gfx.ms
route -p add 23.61.72.70/32 0.0.0.0 >NUL 2>&1
:: b.ads1.msn.com
route -p add 204.160.124.125/32 0.0.0.0 >NUL 2>&1
route -p add 8.253.14.126/32 0.0.0.0 >NUL 2>&1
route -p add 8.254.25.126/32 0.0.0.0 >NUL 2>&1
:: b.ads2.msads.net
route -p add 93.184.215.200/32 0.0.0.0 >NUL 2>&1
:: df.telemetry.microsoft.com
route -p add 65.52.100.7/32 0.0.0.0 >NUL 2>&1
:: help.bingads.microsoft.com
route -p add 207.46.202.114/32 0.0.0.0 >NUL 2>&1
:: oca.telemetry.microsoft.com
route -p add 65.55.252.63/32 0.0.0.0 >NUL 2>&1
:: oca.telemetry.microsoft.com.nsatc.net
route -p add 65.55.252.63/32 0.0.0.0 >NUL 2>&1
:: pre.footprintpredict.com
route -p add 204.79.197.200/32 0.0.0.0 >NUL 2>&1
:: reports.wes.df.telemetry.microsoft.com
route -p add 65.52.100.91/32 0.0.0.0 >NUL 2>&1
:: sb.scorecardresearch.com
route -p add 104.79.156.195/32 0.0.0.0 >NUL 2>&1
:: services.wes.df.telemetry.microsoft.com
route -p add 65.52.100.92/32 0.0.0.0 >NUL 2>&1
:: settings-win.data.microsoft.com
route -p add 65.55.44.108/32 0.0.0.0 >NUL 2>&1
:: s.gateway.messenger.live.com
route -p add 157.56.106.210/32 0.0.0.0 >NUL 2>&1
:: sgmetrics.cloudapp.net
route -p add 168.62.11.145/32 0.0.0.0 >NUL 2>&1
:: spynet2.microsoft.com
route -p add 23.96.212.225/32 0.0.0.0 >NUL 2>&1
:: spynetalt.microsoft.com
route -p add 23.96.212.225/32 0.0.0.0 >NUL 2>&1
:: sqm.df.telemetry.microsoft.com
route -p add 65.52.100.94/32 0.0.0.0 >NUL 2>&1
:: sqm.telemetry.microsoft.com
route -p add 65.55.252.93/32 0.0.0.0 >NUL 2>&1
:: sqm.telemetry.microsoft.com.nsatc.net
route -p add 65.55.252.93/32 0.0.0.0 >NUL 2>&1
:: statsfe1.ws.microsoft.com
route -p add 134.170.115.60/32 0.0.0.0 >NUL 2>&1
route -p add 207.46.114.61/32 0.0.0.0 >NUL 2>&1
:: statsfe2.update.microsoft.com.akadns.net
route -p add 65.52.108.153/32 0.0.0.0 >NUL 2>&1
:: statsfe2.ws.microsoft.com
route -p add 64.4.54.22/32 0.0.0.0 >NUL 2>&1
:: storeedgefd.dsx.mp.microsoft.com // Disabled for Tron, required for the Microsoft App Store to connect
:: route -p add 104.79.153.53/32 0.0.0.0 >NUL 2>&1
:: telecommand.telemetry.microsoft.com
route -p add 65.55.252.92/32 0.0.0.0 >NUL 2>&1
:: telecommand.telemetry.microsoft.com.nsatc.net
route -p add 65.55.252.92/32 0.0.0.0 >NUL 2>&1
:: telemetry.appex.bing.net
route -p add 168.62.187.13/32 0.0.0.0 >NUL 2>&1
:: telemetry.microsoft.com
route -p add 65.52.100.9/32 0.0.0.0 >NUL 2>&1
:: telemetry.urs.microsoft.com
route -p add 131.253.40.37/32 0.0.0.0 >NUL 2>&1
:: vortex.data.microsoft.com
route -p add 64.4.54.254/32 0.0.0.0 >NUL 2>&1
:: vortex-sandbox.data.microsoft.com
route -p add 64.4.54.32/32 0.0.0.0 >NUL 2>&1
:: vortex-win.data.microsoft.com
route -p add 64.4.54.254/32 0.0.0.0 >NUL 2>&1
:: watson.live.com
route -p add 207.46.223.94/32 0.0.0.0 >NUL 2>&1
:: watson.microsoft.com
route -p add 65.55.252.71/32 0.0.0.0 >NUL 2>&1
:: watson.ppe.telemetry.microsoft.com
route -p add 65.52.100.11/32 0.0.0.0 >NUL 2>&1
:: watson.telemetry.microsoft.com
route -p add 65.52.108.29/32 0.0.0.0 >NUL 2>&1
:: watson.telemetry.microsoft.com.nsatc.net
route -p add 65.52.108.29/32 0.0.0.0 >NUL 2>&1
:: wes.df.telemetry.microsoft.com
route -p add 65.52.100.93/32 0.0.0.0 >NUL 2>&1
:: Blacklists - https://raw.githubusercontent.com/stamparm/ipsum/master/ipsum.txt
route -p add 185.220.102.250/32 0.0.0.0 >NUL 2>&1