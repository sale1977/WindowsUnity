@ECHO OFF
:: Windows Unity - by Scharmer Alexander
:: https://docs.microsoft.com/en-us/windows-hardware/manufacture/desktop/add-a-custom-script-to-windows-setup
:: https://docs.microsoft.com/de-de/windows-server/remote/remote-desktop-services/rds_vdi-recommendations-1909
:: https://docs.microsoft.com/de-at/windows/privacy/manage-connections-from-windows-operating-system-components-to-microsoft-services
:: Load Default User registry hive
reg load HKU\DefaultUser "C:\Users\Default\ntuser.dat" >NUL 2>&1

:: Force Classic Control Panel
reg add "HKU\DefaultUser\Software\Microsoft\Windows\CurrentVersion\Explorer\ControlPanel" /v StartupPage /d 1 /t REG_DWORD /f >NUL 2>&1
reg add "HKU\DefaultUser\Software\Microsoft\Windows\CurrentVersion\Explorer\ControlPanel" /v AllItemsIconView /d 2 /t REG_DWORD /f >NUL 2>&1

:: Show Computer icon on the desktop
REG ADD "HKU\DefaultUser\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{20D04FE0-3AEA-1069-A2D8-08002B30309D}" /t REG_DWORD /d 0 /f >NUL 2>&1
REG ADD "HKU\DefaultUser\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v LaunchTo /t REG_DWORD /d 1 /f >NUL 2>&1
REG ADD "HKU\DefaultUser\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ShowSyncProviderNotifications /t REG_DWORD /d 0 /f >NUL 2>&1
:: REG ADD "HKU\DefaultUser\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v TaskbarSmallIcons /t REG_DWORD /d 1 /f >NUL 2>&1
REG ADD "HKU\DefaultUser\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Start_TrackProgs /t REG_DWORD /d 1 /f >NUL 2>&1
REG ADD "HKU\DefaultUser\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ShowCompColor /t REG_DWORD /d 1 /f >NUL 2>&1
REG ADD "HKU\DefaultUser\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v AutoCheckSelect /t REG_DWORD /d 1 /f >NUL 2>&1
REG ADD "HKU\DefaultUser\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v DontPrettyPath /t REG_DWORD /d 1 /f >NUL 2>&1
REG ADD "HKU\DefaultUser\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v LastActiveClick /t REG_DWORD /d 1 /f >NUL 2>&1
REG ADD "HKU\DefaultUser\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ShowCortanaButton /t REG_DWORD /d 0 /f >NUL 2>&1
REG ADD "HKU\DefaultUser\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ExtendedUIHoverTime /t REG_DWORD /d 100 /f >NUL 2>&1
REG ADD "HKU\DefaultUser\Software\Microsoft\Windows\CurrentVersion\Explorer\AutoComplete" /v "Append Completion" /t REG_SZ /d "yes" /f >NUL 2>&1
REG ADD "HKU\DefaultUser\Software\Microsoft\Windows\CurrentVersion\Explorer\AutoComplete" /v "AutoSuggest" /t REG_SZ /d "yes" /f >NUL 2>&1
REG ADD "HKU\DefaultUser\Software\Microsoft\Windows\CurrentVersion\Explorer\CabinetState" /v FullPath /t REG_DWORD /d 1 /f >NUL 2>&1
:: Always show all icons and notifications on the taskbar / 1 - Hide Inactive Icons
REG ADD "HKU\DefaultUser\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "EnableAutoTray" /t REG_DWORD /d 0 /f >NUL 2>&1
REG ADD "HKU\DefaultUser\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "ShowDriveLettersFirst" /t REG_DWORD /d 4 /f >NUL 2>&1
REG ADD "HKU\DefaultUser\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "NoSaveSettings" /t REG_DWORD /d 0 /f >NUL 2>&1
::  Always open the file transfer dialog box in the compact mode (current user only)
REG ADD "HKU\DefaultUser\Software\Microsoft\Windows\CurrentVersion\Explorer\OperationStatusManager" /v "EnthusiastMode" /t REG_DWORD /d 1 /f >NUL 2>&1
REG ADD "HKU\DefaultUser\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Start_ShowMyGames /t REG_DWORD /d 0 /f >NUL 2>&1
REG ADD "HKU\DefaultUser\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Start_SearchFiles /t REG_DWORD /d 1 /f >NUL 2>&1
REG ADD "HKU\DefaultUser\Software\Microsoft\Windows\CurrentVersion\Explorer" /v StartMenuLogOff /t REG_DWORD /d 1 /f >NUL 2>&1
REG ADD "HKU\DefaultUser\Software\Classes\Local Settings\Software\Microsoft\Windows\Shell\Bags\AllFolders\Shell\{7FDE1A1E-8B31-49A5-93B8-6BE14CFA4943}" /v LogicalViewMode /t REG_DWORD /d 1 /f >NUL 2>&1
REG ADD "HKU\DefaultUser\Software\Classes\Local Settings\Software\Microsoft\Windows\Shell\Bags\AllFolders\Shell\{7FDE1A1E-8B31-49A5-93B8-6BE14CFA4943}" /v Mode /t REG_DWORD /d 4 /f >NUL 2>&1

:: Show color on title bar
reg add "HKU\DefaultUser\Software\Microsoft\Windows\DWM" /v "ColorPrevalence" /t REG_DWORD /d "1" /f >NUL 2>&1
reg add "HKU\DefaultUser\Software\Microsoft\Windows\DWM" /v "AccentColorInactive" /t REG_DWORD /d "0xffc0c0c0" /f >NUL 2>&1
reg add "HKU\DefaultUser\Software\Microsoft\Windows\DWM" /v "AlwaysHiberNateThumbnails" /t REG_DWORD /d "0" /f >NUL 2>&1
:: 1 - Show color on Start, taskbar, and action center
:: reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "ColorPrevalence" /t REG_DWORD /d "1" /f >NUL 2>&1

:: Do not use Sharing Wizard
reg add "HKU\DefaultUser\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "SharingWizardOn" /t REG_DWORD /d "0" /f >NUL 2>&1

:: Attachments Low Risk - Disable Security Warning
:: https://support.microsoft.com/de-at/help/883260/information-about-the-attachment-manager-in-microsoft-windows
REG ADD "HKU\DefaultUser\Software\Microsoft\Windows\CurrentVersion\Policies\Associations" /v DefaultFileTypeRisk /t REG_DWORD /d 6152 /f >NUL 2>&1
REG ADD "HKU\DefaultUser\Software\Microsoft\Windows\CurrentVersion\Policies\Associations" /v LowRiskFileTypes /t REG_SZ /d ".exe;.cmd;.msi" /f >NUL 2>&1
:: Disable Security warning to unblock the downloaded file
reg add "HKU\DefaultUser\Software\Microsoft\Windows\CurrentVersion\Policies\Attachments" /v "y" /t REG_DWORD /d "1" /f >NUL 2>&1

:: Fehler bei der Laufwerksverbindung nicht anzeigen
REG ADD "HKU\DefaultUser\Network" /v RestoreDiskChecked /t REG_DWORD /d 1 /f >NUL 2>&1

:: Disabling Ads Suggestions
:: Show me tips about Windows / Can cause high disc usage via a process System and compressed memory
REG ADD "HKU\DefaultUser\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SoftLandingEnabled /t REG_DWORD /d 0 /f >NUL 2>&1
REG ADD "HKU\DefaultUser\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v FeatureManagementEnabled /t REG_DWORD /d 0 /f >NUL 2>&1
:: Kill "show fun tips, hints and tricks" on the lock screen
REG ADD "HKU\DefaultUser\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v RotatingLockScreenEnabled /t REG_DWORD /d 0 /f >NUL 2>&1
REG ADD "HKU\DefaultUser\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v RotatingLockScreenOverlayEnabled /t REG_DWORD /d 0 /f >NUL 2>&1
REG ADD "HKU\DefaultUser\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SystemPaneSuggestionsEnabled /t REG_DWORD /d 0 /f >NUL 2>&1
:: Turn off "Automatic installation apps"
REG ADD "HKU\DefaultUser\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v ContentDeliveryAllowed /t REG_DWORD /d 0 /f >NUL 2>&1
REG ADD "HKU\DefaultUser\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v PreInstalledAppsEnabled /t REG_DWORD /d 0 /f >NUL 2>&1
REG ADD "HKU\DefaultUser\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v PreInstalledAppsEverEnabled /t REG_DWORD /d 0 /f >NUL 2>&1
REG ADD "HKU\DefaultUser\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SilentInstalledAppsEnabled /t REG_DWORD /d 0 /f >NUL 2>&1
REG ADD "HKU\DefaultUser\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v OemPreInstalledAppsEnabled /t REG_DWORD /d 0 /f >NUL 2>&1
:: Prevent welcome to the best windows ever
:: Turn off "Show me the Windows welcome experience after updates and occasionally when I sign in to highlight what’s new and suggested"
REG ADD "HKU\DefaultUser\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SubscribedContent-310093Enabled  /t REG_DWORD /d 0 /f >NUL 2>&1
REG ADD "HKU\DefaultUser\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SubscribedContent-338387Enabled  /t REG_DWORD /d 0 /f >NUL 2>&1
REG ADD "HKU\DefaultUser\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SubscribedContent-338388Enabled  /t REG_DWORD /d 0 /f >NUL 2>&1
REG ADD "HKU\DefaultUser\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SubscribedContent-338389Enabled  /t REG_DWORD /d 0 /f >NUL 2>&1
REG ADD "HKU\DefaultUser\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SubscribedContent-338393Enabled  /t REG_DWORD /d 0 /f >NUL 2>&1
REG ADD "HKU\DefaultUser\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SubscribedContent-353694Enabled  /t REG_DWORD /d 0 /f >NUL 2>&1
REG ADD "HKU\DefaultUser\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SubscribedContent-353696Enabled  /t REG_DWORD /d 0 /f >NUL 2>&1
REG ADD "HKU\DefaultUser\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SubscribedContent-314563Enabled  /t REG_DWORD /d 0 /f >NUL 2>&1
REG ADD "HKU\DefaultUser\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SubscribedContent-353698Enabled  /t REG_DWORD /d 0 /f >NUL 2>&1
REG ADD "HKU\DefaultUser\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SubscribedContent-314559Enabled  /t REG_DWORD /d 0 /f >NUL 2>&1
:: Do not suggest ways I can finish setting up my device to get the most out of Windows (current user only)
REG ADD "HKU\DefaultUser\SOFTWARE\Microsoft\Windows\CurrentVersion\UserProfileEngagement" /v ScoobeSystemSettingEnabled  /t REG_DWORD /d 0 /f >NUL 2>&1
REG ADD "HKU\DefaultUser\SOFTWARE\Microsoft\GameBar" /v ShowStartupPanel /t REG_DWORD /d 0 /f >NUL 2>&1
REG ADD "HKU\DefaultUser\SOFTWARE\Microsoft\GameBar" /v ShowGameModeNotifications /t REG_DWORD /d 0 /f >NUL 2>&1
REG ADD "HKU\DefaultUser\Software\AdblockPlus" /v suppress_first_run_page /t REG_SZ /d "true" /f >NUL 2>&1
REG ADD "HKU\DefaultUser\Software\Microsoft\Internet Explorer\MINIE" /v ShowStatusBar /t REG_DWORD /d 1 /f >NUL 2>&1
:: Do not show the "New App Installed" indicator - Prevent "how do you want to open this file"
REG ADD "HKU\DefaultUser\SOFTWARE\Policies\Microsoft\Windows\Explorer" /v NoNewAppAlert /t REG_DWORD /d 1 /f >NUL 2>&1
:: Disable Thumbsdb on network drives
REG ADD "HKU\DefaultUser\SOFTWARE\Policies\Microsoft\Windows\Explorer" /v DisableThumbsDBOnNetworkFolders /t REG_DWORD /d 1 /f >NUL 2>&1

:: Logon-Optimization
reg add HKU\DefaultUser\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v EnableFirstLogonAnimation /d 0 /t REG_DWORD /f >NUL 2>&1
reg add HKU\DefaultUser\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer /v AsyncRunOnce /t REG_DWORD /d 1 /f >NUL 2>&1
reg add HKU\DefaultUser\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v DelayedDesktopSwitchTimeout /d 0 /t REG_DWORD /f >NUL 2>&1
reg add HKU\DefaultUser\SOFTWARE\Policies\Microsoft\Windows\CloudContent /v DisableWindowsConsumerFeatures /t REG_DWORD /d 1 /f >NUL 2>&1
reg add HKU\DefaultUser\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Serialize /v StartupDelayInMSec /t REG_DWORD /d 0 /f >NUL 2>&1

:: Disable Fast Startup
reg add "HKU\DefaultUser\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v AllowCortana /t REG_DWORD /d 0 /f >NUL 2>&1
:: Mouse Hover Time in milliseconds before Pop-up Display
reg add "HKU\DefaultUser\Control Panel\Mouse" /v MouseHoverTime /t REG_SZ /d 0 /f >NUL 2>&1
reg add "HKU\DefaultUser\Control Panel\Mouse" /v MouseSpeed /t REG_SZ /d 0 /f >NUL 2>&1
reg add "HKU\DefaultUser\Control Panel\Mouse" /v MouseThreshold1 /t REG_SZ /d 0 /f >NUL 2>&1
reg add "HKU\DefaultUser\Control Panel\Mouse" /v MouseThreshold2 /t REG_SZ /d 0 /f >NUL 2>&1
reg add "HKU\DefaultUser\Control Panel\Mouse" /v MouseSensitivity /t REG_SZ /d 10 /f >NUL 2>&1
reg add "HKU\DefaultUser\Control Panel\Mouse" /v SmoothMouseXCurve /t REG_BINARY /d "0000000000000000c0cc0C0000000000809919000000000040662600000000000033330000000000" /f >NUL 2>&1
reg add "HKU\DefaultUser\Control Panel\Mouse" /v SmoothMouseXCurve /t REG_BINARY /d "0000000000000000000038000000000000007000000000000000A800000000000000E00000000000" /f >NUL 2>&1
reg add "HKU\DefaultUser\Control Panel\International\User Profile" /v HttpAcceptLanguageOptOut /t REG_SZ /d 1 /f >NUL 2>&1
:: Determines how long the System waits for user processes to end after the user attempts to log off or to shut down
reg add "HKU\DefaultUser\Control Panel\Desktop" /v WaitToKillAppTimeOut /t REG_SZ /d 2000 /f >NUL 2>&1
reg add "HKU\DefaultUser\Control Panel\Desktop" /v HungAppTimeout  /t REG_SZ /d 2000 /f >NUL 2>&1
:: Determines whether user processes end automatically when the user either logs off or shuts down / 1 - Processes end automatically
reg add "HKU\DefaultUser\Control Panel\Desktop" /v AutoEndTasks  /t REG_SZ /d 1 /f >NUL 2>&1
reg add "HKU\DefaultUser\Control Panel\Desktop" /v LowLevelHooksTimeout  /t REG_SZ /d 1000 /f >NUL 2>&1
:: Determines in milliseconds the interval from the time the cursor is pointed at a menu until the menu items are displayed
reg add "HKU\DefaultUser\Control Panel\Desktop" /v MenuShowDelay /t REG_SZ /d 0 /f >NUL 2>&1
reg add "HKU\DefaultUser\Control Panel\Desktop" /v ForegroundLockTimeout /t REG_DWORD /d 0 /f >NUL 2>&1
:: Schrift unscharf unter Windows 10 - Skalierung ändern
reg add "HKU\DefaultUser\Control Panel\Desktop" /v Win8DpiScaling /t REG_DWORD /d 1 /f >NUL 2>&1
:: reg add "HKU\DefaultUser\Control Panel\Desktop" /v LogPixels /t REG_DWORD /d 120 /f >NUL 2>&1
reg add "HKU\DefaultUser\Control Panel\Desktop" /v ActiveWndTrackTimeout /t REG_DWORD /d "0000000a" /f >NUL 2>&1
reg add "HKU\DefaultUser\Control Panel\Sound" /v Beep /t REG_SZ /d "no" /f >NUL 2>&1
:: Wallpaper
reg add "HKU\DefaultUser\Control Panel\Desktop" /v WallPaper /t REG_SZ /d "C:\Windows\Web\Wallpaper\winunity.jpg" /f >NUL 2>&1
:: Turn on Num Lock at startup
reg add "HKU\DefaultUser\.DEFAULT\Control Panel\Keyboard" /v InitialKeyboardIndicators /t REG_SZ /d "2147483650" /f >NUL 2>&1
reg add "HKU\DefaultUser\Control Panel\Keyboard" /v "KeyboardSpeed" /t REG_SZ /d "31" /f >nul 2>&1
reg add "HKU\DefaultUser\.DEFAULT\Control Panel\Keyboard" /v "InitialKeyboardIndicators" /t REG_SZ /d "2" /f >nul 2>&1
reg add "HKU\DefaultUser\.DEFAULT\Control Panel\Keyboard" /v "KeyboardDelay" /t REG_SZ /d "0" /f >nul 2>&1
reg add "HKU\DefaultUser\.DEFAULT\Control Panel\Keyboard" /v "KeyboardSpeed" /t REG_SZ /d "31" /f >nul 2>&1

reg add HKU\DefaultUser\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects /v VisualFXSetting /t REG_DWORD /d 3 /f >NUL 2>&1
REG ADD "HKU\DefaultUser\Control Panel\Desktop" /v "UserPreferencesMask" /d "9E1E078012000000" /t REG_BINARY /f >NUL 2>&1
:: Disable Peek
:: https://www.tenforums.com/tutorials/47266-turn-off-peek-desktop-windows-10-a.html
REG ADD "HKU\DefaultUser\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "DisablePreviewDesktop" /d 0 /t REG_DWORD /f >NUL 2>&1
:: Disable Animate windows when minimizing and maximizing
:: https://www.tenforums.com/tutorials/126788-enable-disable-animate-windows-when-minimizing-maximizing.html
REG ADD "HKU\DefaultUser\Control Panel\Desktop\WindowMetrics" /v "MinAnimate" /d 0 /t REG_SZ /f >NUL 2>&1
:: Enable Font Smoothing
:: https://www.tenforums.com/tutorials/126775-enable-disable-font-smoothing-windows.html
REG ADD "HKU\DefaultUser\Control Panel\Desktop" /v "FontSmoothing" /d 2 /t REG_SZ /f >NUL 2>&1
:: Turn On Show window contents while dragging in Windows 10
:: https://www.tenforums.com/tutorials/27449-turn-off-show-window-contents-while-dragging-windows-10-a.html
REG ADD "HKU\DefaultUser\Control Panel\Desktop" /v "DragFullWindows" /d 0 /t REG_SZ /f >NUL 2>&1
::Disable - Show thumbnails instead of icons( Advanced system settings - performance - settngs )
REG ADD "HKU\DefaultUser\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "IconsOnly" /d 1 /t REG_DWORD /f >NUL 2>&1
REG ADD "HKU\DefaultUser\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarAnimations" /d 0 /t REG_DWORD /f >NUL 2>&1

:: Hide Taskbar search / 1 - Show search icon / 2 - Show search box
reg add HKU\DefaultUser\SOFTWARE\Microsoft\Windows\CurrentVersion\Search /v SearchboxTaskbarMode /t REG_DWORD /d 0 /f >NUL 2>&1
reg add HKU\DefaultUser\SOFTWARE\Microsoft\Windows\CurrentVersion\Search /v CortanaConsent /t REG_DWORD /d 0 /f >NUL 2>&1
reg add HKU\DefaultUser\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced /v DesktopLivePreviewHoverTime /t REG_DWORD /d 0 /f >NUL 2>&1
reg add HKU\DefaultUser\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced /v ShowEncryptCompressedColor /t REG_DWORD /d 1 /f >NUL 2>&1
:: Do not hide extensions for known file types
reg add HKU\DefaultUser\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced /v HideFileExt /t REG_DWORD /d 0 /f >NUL 2>&1
reg add HKU\DefaultUser\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced /v NavPaneExpandToCurrentFolder /t REG_DWORD /d 1 /f >NUL 2>&1
reg add HKU\DefaultUser\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced /v EncryptionContextMenu /t REG_DWORD /d 1 /f >NUL 2>&1
reg add HKU\DefaultUser\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced /v FriendlyDates /t REG_DWORD /d 0 /f >NUL 2>&1
reg add HKU\DefaultUser\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced /v FriendlyTree /t REG_DWORD /d 0 /f >NUL 2>&1
reg add HKU\DefaultUser\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced /v LastActiveClick /t REG_DWORD /d 1 /f >NUL 2>&1
reg add HKU\DefaultUser\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced /v LoosenRudeAppCheck /t REG_DWORD /d 1 /f >NUL 2>&1
reg add HKU\DefaultUser\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced /v MMTaskbarEnabled /t REG_DWORD /d 0 /f >NUL 2>&1
reg add HKU\DefaultUser\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced /v MMTaskbarGlomLevel /t REG_DWORD /d 0 /f >NUL 2>&1
reg add HKU\DefaultUser\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced /v MMTaskbarMode /t REG_DWORD /d 2 /f >NUL 2>&1
reg add HKU\DefaultUser\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced /v NoTaskbarSettingsDelay /t REG_DWORD /d 1 /f >NUL 2>&1
reg add HKU\DefaultUser\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced /v ServerAdminUI /t REG_DWORD /d 1 /f >NUL 2>&1
reg add HKU\DefaultUser\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced /v TypeAhead /t REG_DWORD /d 0 /f >NUL 2>&1
:: Do not display or track items in Jump Lists from remote locations
reg add HKU\DefaultUser\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer /v NoRemoteDestinations /t REG_DWORD /d 1 /f >NUL 2>&1
reg add HKU\DefaultUser\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\ExtractionWizard /v ShowFiles /t REG_DWORD /d 0 /f >NUL 2>&1
:: Hide notifications and Sounds while presenting
reg add "HKU\DefaultUser\SOFTWARE\Microsoft\Windows\CurrentVersion\Notifications\Settings" /v "NOC_GLOBAL_SETTING_ALLOW_NOTIFICATION_SOUND" /t REG_DWORD /d 0 /f >NUL 2>&1
reg add "HKU\DefaultUser\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings" /v "NOC_GLOBAL_SETTING_SUPRESS_TOASTS_WHILE_DUPLICATING" /t REG_DWORD /d "0" /f >NUL 2>&1
reg add "HKU\DefaultUser\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings" /v "NOC_GLOBAL_SETTING_TOASTS_ENABLED" /t REG_DWORD /d "0" /f >NUL 2>&1

reg delete HKU\DefaultUser\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{0DB7E03F-FC29-4DC6-9020-FF41B59E513A} /f >NUL 2>&1

:: Hardening
REG ADD "HKU\DefaultUser\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" /v "GlobalUserDisabled" /d "1" /t REG_DWORD /f >NUL 2>&1
reg add "HKU\DefaultUser\Software\Microsoft\Windows\CurrentVersion\Search" /v BackgroundAppGlobalToggle /t REG_DWORD /d 0 /f >NUL 2>&1
:: reg add HKU\DefaultUser\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /v ClearRecentDocsOnExit /t REG_DWORD /d 1 /f >NUL 2>&1
:: Prevents the system from conducting a comprehensive search of the target drive to resolve a shortcut.
reg add HKU\DefaultUser\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoResolveSearch /t REG_DWORD /d 1 /f >NUL 2>&1
reg add HKU\DefaultUser\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoResolveTrack /t REG_DWORD /d 1 /f >NUL 2>&1
reg add HKU\DefaultUser\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /v LinkResolveIgnoreLinkInfo /t REG_DWORD /d 1 /f >NUL 2>&1
reg add HKU\DefaultUser\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoInternetOpenWith /t REG_DWORD /d 1 /f >NUL 2>&1
reg add HKU\DefaultUser\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoLowDiskSpaceChecks /t REG_DWORD /d 1 /f >NUL 2>&1
reg add HKU\DefaultUser\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoSearchInternetInStartMenu /t REG_DWORD /d 1 /f >NUL 2>&1
reg add HKU\DefaultUser\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoAutoTrayNotify /t REG_DWORD /d 0 /f >NUL 2>&1
:: Turn off User Tracking - Recent Run
:: reg add HKU\DefaultUser\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoInstrumentation /t REG_DWORD /d 1 /f >NUL 2>&1
reg add HKU\DefaultUser\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /v TurnOffSPIAnimations /t REG_DWORD /d 1 /f >NUL 2>&1
:: Turn off all balloon notifications
reg add HKU\DefaultUser\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /v TaskbarNoNotification /t REG_DWORD /d 1 /f >NUL 2>&1
reg add HKU\DefaultUser\Software\Policies\Microsoft\WindowsStore /v AutoDownload /t REG_DWORD /d 2 /f >NUL 2>&1
reg add "HKU\DefaultUser\Software\Policies\Microsoft\Control Panel\International" /v TurnOffOfferTextPredictions /t REG_DWORD /d 1 /f >NUL 2>&1
reg add HKU\DefaultUser\SOFTWARE\Microsoft\Windows\CurrentVersion\Search /v CortanaEnabled /t REG_DWORD /d 0 /f >NUL 2>&1
REG ADD "HKU\DefaultUser\Software\Microsoft\Windows\CurrentVersion\Search" /v "RestrictImplicitTextCollection" /d 1 /t REG_DWORD /f >NUL 2>&1
REG ADD "HKU\DefaultUser\Software\Microsoft\Windows\CurrentVersion\Search" /v "RestrictImplicitInkCollection" /d 1 /t REG_DWORD /f >NUL 2>&1
reg add "HKU\DefaultUser\Software\Microsoft\Windows\CurrentVersion\Search" /v "HasAboveLockTips" /t REG_DWORD /d 0 /f > NUL 2>&1
REG ADD HKU\DefaultUser\Software\Microsoft\Personalization\Settings /v "AcceptedPrivacyPolicy" /d "0" /t REG_DWORD /f >NUL 2>&1
:: On Screen Keyboard  - Disable first and next repeat delay.
REG ADD HKU\DefaultUser\SOFTWARE\Microsoft\Osk /v "FirstRepeatDelay" /d "0" /t REG_DWORD /f >NUL 2>&1
REG ADD HKU\DefaultUser\SOFTWARE\Microsoft\Osk /v "NextRepeatDelay" /d "0" /t REG_DWORD /f >NUL 2>&1
:: Disable Bing Search
reg add HKU\DefaultUser\SOFTWARE\Microsoft\Windows\CurrentVersion\Search /v BingSearchEnabled /t REG_DWORD /d 0 /f >NUL 2>&1
reg add HKU\DefaultUser\SOFTWARE\Microsoft\Windows\CurrentVersion\Search /v DisableSearchBoxSuggestions /t REG_DWORD /d 0 /f >NUL 2>&1
reg add HKU\DefaultUser\SOFTWARE\Microsoft\Windows\CurrentVersion\Search /v DeviceHistoryEnabled /t REG_DWORD /d 0 /f >NUL 2>&1
:: Do not offer tailored experiences based on the diagnostic data setting (current user only)
reg add HKU\DefaultUser\SOFTWARE\Microsoft\Windows\CurrentVersion\Privacy /v TailoredExperiencesWithDiagnosticDataEnabled /t REG_DWORD /d 0 /f >NUL 2>&1
reg add HKU\DefaultUser\SOFTWARE\Policies\Microsoft\Windows\CloudContent /v DisableWindowsSpotlightWindowsWelcomeExperience /t REG_DWORD /d 1 /f >NUL 2>&1
reg add HKU\DefaultUser\SOFTWARE\Policies\Microsoft\Windows\CloudContent /v DisableWindowsSpotlightFeatures /t REG_DWORD /d 1 /f >NUL 2>&1
reg add HKU\DefaultUser\SOFTWARE\Policies\Microsoft\Windows\CloudContent /v DisableWindowsSpotlightOnSettings /t REG_DWORD /d 1 /f >NUL 2>&1
reg add HKU\DefaultUser\SOFTWARE\Policies\Microsoft\Windows\CloudContent /v DisableWindowsSpotlightOnActionCenter /t REG_DWORD /d 1 /f >NUL 2>&1
reg add HKU\DefaultUser\SOFTWARE\Policies\Microsoft\Windows\CloudContent /v DisableTailoredExperiencesWithDiagnosticData /t REG_DWORD /d 1 /f >NUL 2>&1
reg add HKU\DefaultUser\SOFTWARE\Policies\Microsoft\Windows\CloudContent /v ConfigureWindowsSpotlight /t REG_DWORD /d 2 /f >NUL 2>&1
:: Do not show app Notifications
reg add HKU\DefaultUser\SOFTWARE\Microsoft\Windows\CurrentVersion\PushNotifications /v ToastEnabled /t REG_DWORD /d 0 /f >NUL 2>&1
reg add "HKU\DefaultUser\SOFTWARE\Policies\Microsoft\Internet Explorer\Restrictions" /v NoHelpItemSendFeedback /t REG_DWORD /d 1 /f >NUL 2>&1
reg add "HKU\DefaultUser\Software\Policies\Microsoft\Internet Explorer\Geolocation" /v "PolicyDisableGeolocation" /t REG_DWORD /d 1 /f >NUL 2>&1
:: Turn off (set to Never) "Feedback Frequency"
reg add HKU\DefaultUser\SOFTWARE\Microsoft\Siuf\Rules /v "NumberOfSIUFInPeriod" /t REG_DWORD /d 0 /f > nul
reg add HKU\DefaultUser\SOFTWARE\Microsoft\Siuf\Rules /v "PeriodInNanoSeconds" /t REG_DWORD /d 0 /f > nul
reg add HKU\DefaultUser\SOFTWARE\Policies\Microsoft\Assistance\Client\1.0 /v "NoExplicitFeedback" /t REG_DWORD /d 1 /f > nul
reg add HKU\DefaultUser\SOFTWARE\Microsoft\Input\TIPC /v "Enabled" /t REG_DWORD /d 0 /f > nul
:: https://docs.microsoft.com/en-us/deployoffice/compat/manage-the-privacy-of-data-monitored-by-telemetry-in-office
reg add HKU\DefaultUser\SOFTWARE\Policies\Microsoft\Office\16.0\Common /v NoHelpItemSendFeedback /t REG_DWORD /d 1 /f >NUL 2>&1
reg add HKU\DefaultUser\SOFTWARE\Policies\Microsoft\Office\16.0\Common\General /v DisableBootToOfficeStart /t REG_DWORD /d 1 /f >NUL 2>&1
:: Disables online Fax services
reg add HKU\DefaultUser\SOFTWARE\Policies\Microsoft\Office\16.0\Common\services\fax /v nofax /t REG_DWORD /d 1 /f >NUL 2>&1
:: Disable data collection for the agent - https://github.com/MicrosoftDocs/OfficeDocs-DeployOffice/blob/live/DeployOffice/compat/manage-the-privacy-of-data-monitored-by-telemetry-in-office.md
reg add HKU\DefaultUser\SOFTWARE\Policies\Microsoft\Office\16.0\osm /v "EnableLogging" /t REG_DWORD /d 0 /f > nul
reg add HKU\DefaultUser\SOFTWARE\Policies\Microsoft\Office\16.0\osm /v "EnableUpload" /t REG_DWORD /d 0 /f > nul
reg add HKU\DefaultUser\SOFTWARE\Policies\Microsoft\Office\16.0\osm /v "EnableFileObfuscation" /t REG_DWORD /d 1 /f > nul
reg add HKU\DefaultUser\Software\Microsoft\Office\16.0\Common /v PrivacyNoticeShown /t REG_DWORD /d 2 /f >NUL 2>&1
reg add HKU\DefaultUser\Software\Microsoft\Office\16.0\Registration /v AcceptAllEulas /t REG_DWORD /d 1 /f >NUL 2>&1
reg add HKU\DefaultUser\Software\Microsoft\Office\16.0\Registration /v AcceptAllEulas /t REG_DWORD /d 1 /f /REG:64 >NUL 2>&1
:: Microsoft Office 365 Telemetrie
reg add HKU\DefaultUser\Software\Policies\Microsoft\office\common\clienttelemetry /v "DisableTelemetry" /t REG_DWORD /d "1" /f >nul 2>&1
reg add HKU\DefaultUser\Software\Microsoft\Office\Common\ClientTelemetry /v DisableTelemetry /t REG_DWORD /d 1 /f >NUL 2>&1
reg add HKU\DefaultUser\Software\Microsoft\Office\Common\ClientTelemetry /v VerboseLogging /t REG_DWORD /d 0 /f >NUL 2>&1
reg add HKU\DefaultUser\Software\Microsoft\Office\16.0\Common\ClientTelemetry /v DisableTelemetry /t REG_DWORD /d 1 /f >NUL 2>&1
reg add HKU\DefaultUser\Software\Microsoft\Office\16.0\Common\ClientTelemetry /v VerboseLogging /t REG_DWORD /d 0 /f >NUL 2>&1

reg add HKU\DefaultUser\System\GameConfigStore /v "GameDVR_Enabled" /t REG_DWORD /d 0 /f >NUL 2>&1
reg add HKU\DefaultUser\System\GameConfigStore /v "GameDVR_FSEBehaviorMode" /t REG_DWORD /d 2 /f >NUL 2>&1
reg add HKU\DefaultUser\System\GameConfigStore /v "GameDVR_HonorUserFSEBehaviorMode" /t REG_DWORD /d 0 /f >NUL 2>&1
reg add HKU\DefaultUser\System\GameConfigStore /v "GameDVR_DXGIHonorFSEWindowsCompatible" /t REG_DWORD /d 0 /f >NUL 2>&1
reg add HKU\DefaultUser\System\GameConfigStore /v "GameDVR_EFSEFeatureFlags" /t REG_DWORD /d 0 /f >NUL 2>&1

reg add HKU\DefaultUser\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\PushNotifications /v "NoTileApplicationNotification" /t REG_DWORD /d 1 /f >NUL 2>&1
reg add HKU\DefaultUser\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\PushNotifications /v "NoToastApplicationNotification" /t REG_DWORD /d 1 /f >NUL 2>&1
reg add HKU\DefaultUser\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\PushNotifications /v "NoCloudApplicationNotification" /t REG_DWORD /d 1 /f >NUL 2>&1
:: do not send Windows Media Player statistics 
reg add HKU\DefaultUser\SOFTWARE\Microsoft\MediaPlayer\Preferences /v "UsageTracking" /t REG_DWORD /d 0 /f >NUL 2>&1
:: Launch folder windows in a separate process
reg add HKU\DefaultUser\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced /v "SeparateProcess" /t REG_DWORD /d 1 /f >NUL 2>&1
reg add "HKU\DefaultUser\Control Panel\Desktop" /v "AutoEndTasks" /t REG_SZ /d "1" /f >NUL 2>&1
reg add "HKU\DefaultUser\Control Panel\Desktop" /v "JPEGImportQuality" /t REG_DWORD /d 256 /f >NUL 2>&1
:: reg add "HKU\DefaultUser\Control Panel\Desktop" /v "EnablePerProcessSystemDPI" /t REG_DWORD /d 1 /f >NUL 2>&1
reg add "HKU\DefaultUser\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\OperationStatusManager" /v "ConfirmationCheckBoxDoForAll" /t REG_DWORD /d 1 /f >NUL 2>&1
reg add "HKU\DefaultUser\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings" /v "AutoDetect" /t REG_DWORD /d 0 /f >NUL 2>&1
SET keyvalueoff="460000009c59000001000000140000006973612e706f77656c6c732e636f6d3a38303830070000003c6c6f63616c3e0000000001000000000000005052fd5dd65fc5010400000000010006c0a82864c0a8ee01c0a84001000000000000000000000000" > nul
reg add "HKU\DefaultUser\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Connections" /v SavedLegacySettings /t REG_BINARY /d %keyvalueoff% /f >NUL 2>&1
reg add "HKU\DefaultUser\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Connections" /v DefaultConnectionSettings /t REG_BINARY /d %keyvalueoff% /f >NUL 2>&1
reg add "HKU\DefaultUser\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Connections\Wpad" /v WpadOverride /t REG_DWORD /d 1 /f >NUL 2>&1
reg add "HKU\DefaultUser\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Wpad" /v WpadOverride /t REG_DWORD /d 1 /f >NUL 2>&1
:: 0 = Der Internet Explorer überprüft nicht, ob Serverzertifikate gesperrt wurden.
REG ADD "HKU\DefaultUser\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings" /v "CertificateRevocation" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKU\DefaultUser\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings" /v "PreventIgnoreCertErrors" /t REG_DWORD /d "1" /f >NUL 2>&1
REG ADD "HKU\DefaultUser\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings" /v "DisablePasswordCaching" /t REG_DWORD /d "1" /f >NUL 2>&1
REG ADD "HKU\DefaultUser\SOFTWARE\Microsoft\Internet Explorer\Download" /v "CheckExeSignatures" /t REG_SZ /d "no" /f >NUL 2>&1
REG ADD "HKU\DefaultUser\Software\Microsoft\Windows\CurrentVersion\WinTrust\Trust Providers\Software Publishing" /v "State" /t REG_DWORD /d "146944" /F >NUL 2>&1
reg add "HKU\DefaultUser\Software\Microsoft\Internet Explorer\Main" /v "Start Page" /t REG_SZ /d "about:blank" /f >NUL 2>&1
reg add "HKU\DefaultUser\Software\Microsoft\Internet Explorer\Main" /v "Default_Page_URL" /t REG_SZ /d "about:blank" /f >NUL 2>&1
reg add "HKU\DefaultUser\Software\Microsoft\Internet Explorer\TabbedBrowsing" /v "NewTabPageShow" /t REG_SZ /d "0" /f >NUL 2>&1
reg add "HKU\DefaultUser\Software\Microsoft\Internet Explorer\Main" /v "Search Page" /t REG_SZ /d "about:blank" /f >NUL 2>&1
reg add "HKU\DefaultUser\Software\Microsoft\Internet Explorer\Main" /v "Start Page Redirect Cache" /t REG_SZ /d "http://www.google.at" /f > nul 2>&1
reg add "HKU\DefaultUser\Software\Microsoft\Internet Explorer\Main" /v "DoNotTrack" /t REG_DWORD /d 1 /f >NUL 2>&1
reg add "HKU\DefaultUser\Software\Microsoft\Internet Explorer\Main" /v "DisableFirstRunCustomize" /t REG_DWORD /d 1 /f > nul
reg add "HKU\DefaultUser\Software\Microsoft\Internet Explorer\Main" /v "RunOnceHasShown" /t REG_DWORD /d 1 /f >NUL 2>&1
reg add "HKU\DefaultUser\Software\Microsoft\Internet Explorer\Main" /v "RunOnceComplete" /t REG_DWORD /d 1 /f >NUL 2>&1
reg add "HKU\DefaultUser\Software\Microsoft\Internet Explorer\Main" /v "PlaySounds" /t REG_DWORD /d 1 /f >NUL 2>&1
reg add "HKU\DefaultUser\Software\Microsoft\Internet Explorer\Main" /v "Isolation" /t REG_SZ /d "PMEM" /f >NUL 2>&1
reg add "HKU\DefaultUser\Software\Microsoft\Internet Explorer\Main" /v "Isolation64Bit" /t REG_DWORD /d 1 /f >NUL 2>&1
reg add "HKU\DefaultUser\Software\Microsoft\Internet Explorer\Main" /v "DNSPreresolution" /t REG_DWORD /d 8 /f >NUL 2>&1
reg add "HKU\DefaultUser\Software\Microsoft\Internet Explorer\Main" /v "Use_Async_DNS" /t REG_SZ /d "yes" /f >NUL 2>&1
reg add "HKU\DefaultUser\Software\Microsoft\Internet Explorer\Main" /v "EnablePreBinding" /t REG_DWORD /d 0 /f >NUL 2>&1
reg add "HKU\DefaultUser\Software\Microsoft\Internet Explorer\Main" /v "Check_Associations" /t REG_SZ /d "no" /f >NUL 2>&1
reg add "HKU\DefaultUser\Software\Microsoft\Internet Explorer\Main\TabbedBrowsing" /v "UseMRUSwitching" /t REG_SZ /d "yes" /f >NUL 2>&1
reg add "HKU\DefaultUser\Software\Microsoft\Internet Explorer\TabbedBrowsing" /v "WarnOnClose" /t REG_DWORD /d 0 /f >NUL 2>&1
reg add "HKU\DefaultUser\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Ranges\Range1" /v "*" /t REG_DWORD /d 1 /f >NUL 2>&1
reg add "HKU\DefaultUser\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Ranges\Range1" /v ":Range" /t REG_SZ /d "10.77.0.*" /f >NUL 2>&1
reg add "HKU\DefaultUser\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Domains\scharmer.lab" /v "*" /t REG_DWORD /d 1 /f >NUL 2>&1
reg add "HKU\DefaultUser\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Domains\test.lab" /v "*" /t REG_DWORD /d 1 /f >NUL 2>&1
:: turning off the Security Check Settings
reg add "HKU\DefaultUser\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v "1806" /t REG_DWORD /d 0 /f >NUL 2>&1
reg add "HKU\DefaultUser\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v "DnsCacheEnabled" /t REG_DWORD /d 1 /f >NUL 2>&1
reg add "HKU\DefaultUser\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v "DnsCacheEntries" /t REG_DWORD /d 200 /f >NUL 2>&1
reg add "HKU\DefaultUser\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v "DnsCacheTimeout" /t REG_DWORD /d 15180 /f >NUL 2>&1
reg add "HKU\DefaultUser\Software\Microsoft\Internet Explorer\FlipAhead" /v "FPEnabled" /t REG_DWORD /d 0 /f >NUL 2>&1
reg add "HKU\DefaultUser\Software\Microsoft\Internet Explorer\Suggested Sites" /v "Enabled" /t REG_DWORD /d 0 /f >NUL 2>&1
reg add "HKU\DefaultUser\Software\Microsoft\Internet Explorer\Suggested Sites" /v "DataStreamEnabledState" /t REG_DWORD /d 0 /f >NUL 2>&1
reg add "HKU\DefaultUser\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\FlipAhead" /v "FPEnabled" /t REG_DWORD /d 0 /f >NUL 2>&1
reg add "HKU\DefaultUser\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\Main /v "DoNotTrack" /t REG_DWORD /d 0 /f >NUL 2>&1
:: reg add "HKU\DefaultUser\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\Main /v "ShowSearchSuggestionsGlobal" /t REG_DWORD /d 0 /f >NUL 2>&1
reg add "HKU\DefaultUser\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\Main /v "IE10TourShown" /t REG_DWORD /d 1 /f >NUL 2>&1
reg add "HKU\DefaultUser\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\Main /v "DisallowDefaultBrowserPrompt" /t REG_DWORD /d 1 /f >NUL 2>&1
reg add "HKU\DefaultUser\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\Main /v "LastFirstRunVersionDelivered" /t REG_DWORD /d 1 /f >NUL 2>&1
reg add "HKU\DefaultUser\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\Main /v "EnableCortana" /t REG_DWORD /d 0 /f >NUL 2>&1
:: Add Google as search provider for IE11, and make it the default
reg add "HKU\DefaultUser\SOFTWARE\Microsoft\Internet Explorer\SearchScopes\{89418666-DF74-4CAC-A2BD-B69FB4A0228A}" /f  > nul 2>&1
reg add "HKU\DefaultUser\SOFTWARE\Microsoft\Internet Explorer\SearchScopes\{89418666-DF74-4CAC-A2BD-B69FB4A0228A}" /v "DisplayName" /t REG_SZ /d "Google" /f > nul 2>&1
reg add "HKU\DefaultUser\SOFTWARE\Microsoft\Internet Explorer\SearchScopes\{89418666-DF74-4CAC-A2BD-B69FB4A0228A}" /v "FaviconURL" /t REG_SZ /d "http://www.google.com/favicon.ico" /f > nul 2>&1
reg add "HKU\DefaultUser\SOFTWARE\Microsoft\Internet Explorer\SearchScopes\{89418666-DF74-4CAC-A2BD-B69FB4A0228A}" /v "FaviconURLFallback" /t REG_SZ /d "http://www.google.com/favicon.ico" /f > nul 2>&1
reg add "HKU\DefaultUser\SOFTWARE\Microsoft\Internet Explorer\SearchScopes\{89418666-DF74-4CAC-A2BD-B69FB4A0228A}" /v "OSDFileURL" /t REG_SZ /d "http://www.iegallery.com/en-us/AddOns/DownloadAddOn?resourceId=813" /f > nul 2>&1
reg add "HKU\DefaultUser\SOFTWARE\Microsoft\Internet Explorer\SearchScopes\{89418666-DF74-4CAC-A2BD-B69FB4A0228A}" /v "ShowSearchSuggestions" /t REG_DWORD /d 1 /f > nul 2>&1
reg add "HKU\DefaultUser\SOFTWARE\Microsoft\Internet Explorer\SearchScopes\{89418666-DF74-4CAC-A2BD-B69FB4A0228A}" /v "SuggestionsURL" /t REG_SZ /d "http://clients5.google.com/complete/search?q={searchTerms}&client=ie8&mw={ie:maxWidth}&sh={ie:sectionHeight}&rh={ie:rowHeight}&inputencoding={inputEncoding}&outputencoding={outputEncoding}" /f > nul 2>&1
reg add "HKU\DefaultUser\SOFTWARE\Microsoft\Internet Explorer\SearchScopes\{89418666-DF74-4CAC-A2BD-B69FB4A0228A}" /v "SuggestionsURLFallback" /t REG_SZ /d "http://clients5.google.com/complete/search?hl={language}&q={searchTerms}&client=ie8&inputencoding={inputEncoding}&outputencoding={outputEncoding}" /f > nul 2>&1
reg add "HKU\DefaultUser\SOFTWARE\Microsoft\Internet Explorer\SearchScopes\{89418666-DF74-4CAC-A2BD-B69FB4A0228A}" /v "TopResultURLFallback" /t REG_SZ /d "" /f > nul 2>&1
reg add "HKU\DefaultUser\SOFTWARE\Microsoft\Internet Explorer\SearchScopes\{89418666-DF74-4CAC-A2BD-B69FB4A0228A}" /v "URL" /t REG_SZ /d "http://www.google.com/search?q={searchTerms}&sourceid=ie7&rls=com.microsoft:{language}:{referrer:source}&ie={inputEncoding?}&oe={outputEncoding?}" /f > nul 2>&1
reg add "HKU\DefaultUser\SOFTWARE\Microsoft\Internet Explorer\SearchScopes" /v "DefaultScope" /t REG_SZ /d "{89418666-DF74-4CAC-A2BD-B69FB4A0228A}" /f > nul 2>&1

:: reg add "HKU\DefaultUser\SOFTWARE\Policies\Microsoft\Windows\DriverSearching" /v DontSearchWindowsUpdate /t REG_DWORD /d 1 /f >NUL 2>&1
:: Enable this policy, set Number of objects returned to 5000.
reg add "HKU\DefaultUser\SOFTWARE\Policies\Microsoft\Windows\Directory UI" /v QueryLimit /t REG_DWORD /d 5000 /f >NUL 2>&1
reg add "HKU\DefaultUser\SOFTWARE\Microsoft\Office\16.0\Common\General" /v ShownFileFmtPrompt /t REG_DWORD /d 1 /f >NUL 2>&1
reg add "HKU\DefaultUser\SOFTWARE\Microsoft\Office\16.0\FirstRun" /v BootedRTM /t REG_DWORD /d 1 /f >NUL 2>&1
reg add "HKU\DefaultUser\SOFTWARE\Microsoft\Office\16.0\FirstRun" /v disablemovie /t REG_DWORD /d 1 /f >NUL 2>&1
reg add "HKU\DefaultUser\software\policies\microsoft\office\16.0\common\security\filevalidation" /v disablereporting /t REG_DWORD /d 1 /f >NUL 2>&1
reg add "HKU\DefaultUser\SOFTWARE\Microsoft\Office\16.0\Common" /v DisableHyperlinkWarning /t REG_DWORD /d 0 /f >NUL 2>&1
reg add "HKU\DefaultUser\SOFTWARE\Microsoft\Office\16.0\Common\General" /v shownfirstrunoptin /t REG_DWORD /d 0 /f >NUL 2>&1
reg add "HKU\DefaultUser\software\policies\microsoft\office\16.0\common\general" /v shownfirstrunoptin /t REG_DWORD /d 0 /f >NUL 2>&1
reg add "HKU\DefaultUser\software\policies\microsoft\office\16.0\common\graphics" /v disableanimations /t REG_DWORD /d 1 /f >NUL 2>&1
reg add "HKU\DefaultUser\SOFTWARE\Microsoft\Office\16.0\Common\General" /v optindisable /t REG_DWORD /d 1 /f >NUL 2>&1
reg add "HKU\DefaultUser\SOFTWARE\Microsoft\Office\16.0\Common\General" /v optindisable /t REG_DWORD /d 1 /f /REG:64 >NUL 2>&1
reg add "HKU\DefaultUser\SOFTWARE\Microsoft\Office\16.0\Common\General" /v PreferCloudSaveLocations /t REG_DWORD /d 0 /f >NUL 2>&1
REG ADD "HKU\DefaultUser\Software\Microsoft\Office\16.0\Common\General" /v "AlertIfNotDefault" /d 0 /t REG_DWORD /f >NUL 2>&1
reg add "HKU\DefaultUser\SOFTWARE\Microsoft\Office\16.0\Common\Feedback" /v Enabled /t REG_DWORD /d 0 /f >NUL 2>&1
reg add "HKU\DefaultUser\SOFTWARE\Microsoft\Office\16.0\Common\Feedback" /v includescreenshot /t REG_DWORD /d 0 /f >NUL 2>&1
reg add "HKU\DefaultUser\SOFTWARE\Microsoft\Office\16.0\Common\alters" /v noalertreporting /t REG_DWORD /d 1 /f >NUL 2>&1
reg add "HKU\DefaultUser\software\policies\microsoft\office\16.0\common\alerts" /v noalertreporting /t REG_DWORD /d 1 /f >NUL 2>&1
reg add "HKU\DefaultUser\software\policies\microsoft\office\16.0\common\shipasserts" /v disableshipasserts /t REG_DWORD /d 1 /f >NUL 2>&1
reg add "HKU\DefaultUser\SOFTWARE\Microsoft\Office\16.0\Common\General" /v disablemovie /t REG_DWORD /d 1 /f >NUL 2>&1
reg add "HKU\DefaultUser\SOFTWARE\Microsoft\Office\16.0\Common\General" /v notrack /t REG_DWORD /d 1 /f >NUL 2>&1
reg add "HKU\DefaultUser\SOFTWARE\Microsoft\Office\16.0\Common\PTWatson" /v PTWOptIn /t REG_DWORD /d 0 /f >NUL 2>&1
reg add "HKU\DefaultUser\SOFTWARE\Microsoft\Office\16.0\Common" /v qmenable /t REG_DWORD /d 0 /f >NUL 2>&1
reg add "HKU\DefaultUser\Software\policies\microsoft\office\16.0\common" /v qmenable /t REG_DWORD /d 0 /f >NUL 2>&1
reg add "HKU\DefaultUser\SOFTWARE\Microsoft\Office\16.0\Common" /v sendcustomerdata /t REG_DWORD /d 0 /f >NUL 2>&1
reg add "HKU\DefaultUser\Software\policies\microsoft\office\16.0\common" /v sendcustomerdata /t REG_DWORD /d 0 /f >NUL 2>&1
reg add "HKU\DefaultUser\SOFTWARE\Microsoft\Office\16.0\Common" /v updatereliabilitydata /t REG_DWORD /d 0 /f >NUL 2>&1
reg add "HKU\DefaultUser\Software\policies\microsoft\office\16.0\common" /v updatereliabilitydata /t REG_DWORD /d 0 /f >NUL 2>&1
reg add "HKU\DefaultUser\SOFTWARE\Microsoft\Office\16.0\Common\clienttelemetry" /v SendTelemetry /t REG_DWORD /d 3 /f >NUL 2>&1
:: https://docs.microsoft.com/en-us/deployoffice/privacy/manage-privacy-controls
reg add "HKU\DefaultUser\Software\Policies\Microsoft\office\common\clienttelemetry" /v SendTelemetry /t REG_DWORD /d 3 /f >NUL 2>&1
reg add "HKU\DefaultUser\Software\Policies\Microsoft\office\16.0\common\privacy" /v disconnectedstate /t REG_DWORD /d 2 /f >NUL 2>&1
reg add "HKU\DefaultUser\Software\Policies\Microsoft\office\16.0\common\privacy" /v usercontentdisabled /t REG_DWORD /d 2 /f >NUL 2>&1
reg add "HKU\DefaultUser\Software\Policies\Microsoft\office\16.0\common\privacy" /v downloadcontentdisabled /t REG_DWORD /d 2 /f >NUL 2>&1
reg add "HKU\DefaultUser\Software\Policies\Microsoft\office\16.0\common\privacy" /v controllerconnectedservicesenabled /t REG_DWORD /d 2 /f >NUL 2>&1
reg add "HKU\DefaultUser\software\policies\microsoft\office\16.0\common\feedback" /v enabled /t REG_DWORD /d 0 /f >NUL 2>&1
reg add "HKU\DefaultUser\software\policies\microsoft\office\16.0\common\feedback" /v includeemail /t REG_DWORD /d 0 /f >NUL 2>&1
reg add "HKU\DefaultUser\software\policies\microsoft\office\16.0\common\feedback" /v includescreenshot /t REG_DWORD /d 0 /f >NUL 2>&1
reg add "HKU\DefaultUser\software\policies\microsoft\office\16.0\common\feedback" /v msoridsurveyenabled /t REG_DWORD /d 0 /f >NUL 2>&1
:: Keine Onlineverbindung von Office erlauben - bricht Outlook-Verbindung!
:: reg add "HKU\DefaultUser\Software\Policies\Microsoft\office\16.0\common\internet" /v useonlinecontent /t REG_DWORD /d 0 /f >NUL 2>&1
reg add "HKU\DefaultUser\SOFTWARE\Microsoft\Office\16.0\Common" /v linkedin /t REG_DWORD /d 0 /f >NUL 2>&1
reg add "HKU\DefaultUser\SOFTWARE\Microsoft\Office\16.0\Common\LinkedIn" /v OfficeLinkedIn /t REG_DWORD /d 0 /f >NUL 2>&1
:: https://docs.microsoft.com/de-de/office365/troubleshoot/access-management/office-prompt-for-credentials
reg add "HKU\DefaultUser\software\microsoft\office\16.0\common\identity" /v NoDomainUser /t REG_DWORD /d 1 /f >NUL 2>&1
reg add "HKU\DefaultUser\software\microsoft\office\16.0\common\identity" /v EnableAuthInOfflineMode /t REG_DWORD /d 1 /f >NUL 2>&1
reg add "HKU\DefaultUser\Software\Microsoft\Office\16.0\Excel\Security" /v blockcontentexecutionfrominternet /t REG_DWORD /d 1 /f >NUL 2>&1
reg add "HKU\DefaultUser\Software\Policies\Microsoft\Office\16.0\Excel\Security" /v automationsecurity /t REG_DWORD /d 3 /f >NUL 2>&1
reg add "HKU\DefaultUser\Software\Policies\Microsoft\Office\16.0\Excel\Security" /v VBAwarnings /t REG_DWORD /d 2 /f >NUL 2>&1
reg add "HKU\DefaultUser\Software\Policies\Microsoft\Office\16.0\Excel" /v dontshowwhatsnew /t REG_DWORD /d 1 /f >NUL 2>&1
reg add "HKU\DefaultUser\Software\Policies\Microsoft\Office\16.0\Excel\options" /v ExcelHighQualityModeForGraphics /t REG_DWORD /d 1 /f >NUL 2>&1
:: Harden all version of MS Office itself against DDE malspam attacks
reg add "HKU\DefaultUser\Software\Policies\Microsoft\Office\16.0\Excel\options" /v DontUpdateLinks /t REG_DWORD /d 1 /f >NUL 2>&1
reg add "HKU\DefaultUser\Software\Policies\Microsoft\Office\16.0\Excel\options" /v DDEAllowed /t REG_DWORD /d 0 /f >NUL 2>&1
reg add "HKU\DefaultUser\Software\Policies\Microsoft\Office\16.0\Excel\options" /v DDECleaned /t REG_DWORD /d 1 /f >NUL 2>&1
reg add "HKU\DefaultUser\Software\Microsoft\Office\16.0\Excel\Security" /v DataConnectionWarnings /t REG_DWORD /d 2 /f >NUL 2>&1
reg add "HKU\DefaultUser\Software\Microsoft\Office\16.0\Excel\Security" /v RichDataConnectionWarnings /t REG_DWORD /d 2 /f >NUL 2>&1
reg add "HKU\DefaultUser\Software\Microsoft\Office\16.0\Excel\Security" /v WorkbookLinkWarnings /t REG_DWORD /d 2 /f >NUL 2>&1
:: 2: When you use this value, packager objects are blocked from running. You may want to use this value if you want to prevent all packager objects from running in the organization.
reg add "HKU\DefaultUser\Software\Microsoft\Office\16.0\Excel\Security" /v PackagerPrompt /t REG_DWORD /d 2 /f >NUL 2>&1
reg add "HKU\DefaultUser\Software\Microsoft\Office\16.0\Word\Security" /v blockcontentexecutionfrominternet /t REG_DWORD /d 1 /f >NUL 2>&1
reg add "HKU\DefaultUser\Software\Policies\Microsoft\Office\16.0\Word\Security" /v automationsecurity /t REG_DWORD /d 3 /f >NUL 2>&1
reg add "HKU\DefaultUser\Software\Policies\Microsoft\Office\16.0\Word\Security" /v VBAwarnings /t REG_DWORD /d 2 /f >NUL 2>&1
reg add "HKU\DefaultUser\Software\Policies\Microsoft\Office\16.0\Word" /v dontshowwhatsnew /t REG_DWORD /d 1 /f >NUL 2>&1
reg add "HKU\DefaultUser\Software\Microsoft\Office\16.0\Word\Options" /v MakeLocalCopy /t REG_DWORD /d 1 /f >NUL 2>&1
REG ADD "HKU\DefaultUser\Software\Microsoft\Office\16.0\Word\Options" /v "DefaultFormat" /d "" /t REG_SZ /f >NUL 2>&1
reg add "HKU\DefaultUser\Software\Microsoft\Office\16.0\Word\Security" /v AllowDDE /t REG_DWORD /d 0 /f >NUL 2>&1
reg add "HKU\DefaultUser\Software\Microsoft\Office\16.0\Word\Security" /v PackagerPrompt /t REG_DWORD /d 2 /f >NUL 2>&1
reg add "HKU\DefaultUser\Software\Microsoft\Office\16.0\Word\Options" /v DontUpdateLinks /t REG_DWORD /d 1 /f >NUL 2>&1
reg add "HKU\DefaultUser\Software\Microsoft\Office\16.0\Word\Options\WordMail" /v DontUpdateLinks /t REG_DWORD /d 1 /f >NUL 2>&1
reg add "HKU\DefaultUser\Software\Microsoft\Office\16.0\Word\Options" /v linkedinresumeassistant /t REG_DWORD /d 0 /f >NUL 2>&1
reg add "HKU\DefaultUser\Software\Microsoft\Office\16.0\PowerPoint\Security" /v blockcontentexecutionfrominternet /t REG_DWORD /d 1 /f >NUL 2>&1
reg add "HKU\DefaultUser\Software\Policies\Microsoft\Office\16.0\PowerPoint\Security" /v automationsecurity /t REG_DWORD /d 3 /f >NUL 2>&1
reg add "HKU\DefaultUser\Software\Microsoft\Office\16.0\PowerPoint\Security" /v PackagerPrompt /t REG_DWORD /d 2 /f >NUL 2>&1
reg add "HKU\DefaultUser\SOFTWARE\Microsoft\Office\16.0\Outlook\Options\General" /v DisablePreviewPlace /t REG_DWORD /d 1 /f >NUL 2>&1
reg add "HKU\DefaultUser\SOFTWARE\Microsoft\Office\16.0\Outlook\Options\General" /v WarnDelete /t REG_DWORD /d 0 /f >NUL 2>&1
reg add "HKU\DefaultUser\SOFTWARE\Microsoft\Office\16.0\Outlook\Options\General" /v GroupExpandAnimations /t REG_DWORD /d 0 /f >NUL 2>&1
reg add "HKU\DefaultUser\SOFTWARE\Microsoft\Office\16.0\Outlook\Options\General" /v DisablePreviewPlace /t REG_DWORD /d 1 /f >NUL 2>&1
reg add "HKU\DefaultUser\SOFTWARE\Microsoft\Office\16.0\Outlook\Options\Reminders" /v PlaySound /t REG_DWORD /d 0 /f >NUL 2>&1
reg add "HKU\DefaultUser\SOFTWARE\Microsoft\Office\16.0\Outlook\Preferences" /v NewmailDesktopAlerts /t REG_DWORD /d 0 /f >NUL 2>&1
reg add "HKU\DefaultUser\SOFTWARE\Microsoft\Office\16.0\Outlook\Preferences" /v PlaySound /t REG_DWORD /d 0 /f >NUL 2>&1
reg add "HKU\DefaultUser\SOFTWARE\Microsoft\Office\16.0\Outlook\Preferences" /v ShowEnvelope /t REG_DWORD /d 0 /f >NUL 2>&1
reg add "HKU\DefaultUser\SOFTWARE\Microsoft\Office\16.0\Outlook\Preferences" /v CtrlEnterSends /t REG_DWORD /d 1 /f >NUL 2>&1
:: Disable Office OLE - https://adsecurity.org/?p=3299
reg add "HKU\DefaultUser\SOFTWARE\Microsoft\Office\16.0\Outlook\Security" /v ShowOLEPackageObj /t REG_DWORD /d 0 /f >NUL 2>&1
:: Disable Microsoft Office Telemetry
reg add "HKU\DefaultUser\SOFTWARE\Microsoft\Office\16.0\Outlook\Options\Mail" /v EnableLogging /t REG_DWORD /d 0 /f >NUL 2>&1
reg add "HKU\DefaultUser\SOFTWARE\Microsoft\Office\16.0\Outlook\Options\Calendar" /v EnableCalendarLogging /t REG_DWORD /d 0 /f >NUL 2>&1
reg add "HKU\DefaultUser\SOFTWARE\Microsoft\Office\16.0\Word\Options" /v EnableLogging /t REG_DWORD /d 0 /f >NUL 2>&1

:: disables reporting for all solution and application types - https://github.com/MicrosoftDocs/OfficeDocs-DeployOffice/blob/live/DeployOffice/compat/manage-the-privacy-of-data-monitored-by-telemetry-in-office.md
reg add "HKU\DefaultUser\Software\Policies\microsoft\office\16.0\osm\preventedapplications" /v accesssolution /t REG_DWORD /d 1 /f >NUL 2>&1
reg add "HKU\DefaultUser\Software\Policies\microsoft\office\16.0\osm\preventedapplications" /v olksolution /t REG_DWORD /d 1 /f >NUL 2>&1
reg add "HKU\DefaultUser\Software\Policies\microsoft\office\16.0\osm\preventedapplications" /v onenotesolution /t REG_DWORD /d 1 /f >NUL 2>&1
reg add "HKU\DefaultUser\Software\Policies\microsoft\office\16.0\osm\preventedapplications" /v pptsolution /t REG_DWORD /d 1 /f >NUL 2>&1
reg add "HKU\DefaultUser\Software\Policies\microsoft\office\16.0\osm\preventedapplications" /v projectsolution /t REG_DWORD /d 1 /f >NUL 2>&1
reg add "HKU\DefaultUser\Software\Policies\microsoft\office\16.0\osm\preventedapplications" /v publishersolution /t REG_DWORD /d 1 /f >NUL 2>&1
reg add "HKU\DefaultUser\Software\Policies\microsoft\office\16.0\osm\preventedapplications" /v visiosolution /t REG_DWORD /d 1 /f >NUL 2>&1
reg add "HKU\DefaultUser\Software\Policies\microsoft\office\16.0\osm\preventedapplications" /v wdsolution /t REG_DWORD /d 1 /f >NUL 2>&1
reg add "HKU\DefaultUser\Software\Policies\microsoft\office\16.0\osm\preventedapplications" /v xlsolution /t REG_DWORD /d 1 /f >NUL 2>&1
reg add "HKU\DefaultUser\Software\Policies\microsoft\office\16.0\osm\preventedsolutiontypes" /v agave /t REG_DWORD /d 1 /f >NUL 2>&1
reg add "HKU\DefaultUser\Software\Policies\microsoft\office\16.0\osm\preventedsolutiontypes" /v appaddins /t REG_DWORD /d 1 /f >NUL 2>&1
reg add "HKU\DefaultUser\Software\Policies\microsoft\office\16.0\osm\preventedsolutiontypes" /v comaddins /t REG_DWORD /d 1 /f >NUL 2>&1
reg add "HKU\DefaultUser\Software\Policies\microsoft\office\16.0\osm\preventedsolutiontypes" /v documentfiles /t REG_DWORD /d 1 /f >NUL 2>&1
reg add "HKU\DefaultUser\Software\Policies\microsoft\office\16.0\osm\preventedsolutiontypes" /v templatefiles /t REG_DWORD /d 1 /f >NUL 2>&1

:: How to suppress the AutoDiscover redirect warning in Outlook
reg add "HKU\DefaultUser\SOFTWARE\Microsoft\Office\16.0\Outlook\AutoDiscover\RedirectServers" /v scharmer.lab /t REG_SZ /d "" /f >NUL 2>&1
reg add "HKU\DefaultUser\software\policies\microsoft\office\16.0\teams" /v preventfirstlaunchafterinstall /t REG_DWORD /d 1 /f >NUL 2>&1
reg add "HKU\DefaultUser\Software\Policies\Microsoft\office\16.0\outlook\options\mail" /v junkmailenablelinks /t REG_DWORD /d 0 /f >NUL 2>&1
reg add "HKU\DefaultUser\Software\Policies\Microsoft\office\16.0\outlook\options\mail" /v blockextcontent /t REG_DWORD /d 1 /f >NUL 2>&1
reg add "HKU\DefaultUser\SOFTWARE\Microsoft\OneDrive" /v "EnableFasterRingUpdate" /t REG_DWORD /d 1 /f >NUL 2>&1
reg add "HKU\DefaultUser\SOFTWARE\Microsoft\OneDrive" /v "DisableReportProblemDialog" /t REG_DWORD /d 1 /f >NUL 2>&1
:: Adobe Suppress the notification message to make Adobe Acrobat Reader DC the default PDF application
reg add "HKU\DefaultUser\Software\Adobe\Acrobat Reader\DC\AVAlert\cCheckbox" /v "iAppDoNotTakePDFOwnershipAtLaunchWin10" /t REG_DWORD /d 1 /f >NUL 2>&1
reg add "HKU\DefaultUser\Software\Adobe\Acrobat Reader\DC\AVAlert\cCheckbox" /v "iAppDoNotTakePDFOwnershipAtLaunch" /t REG_DWORD /d 1 /f >NUL 2>&1
reg add "HKU\DefaultUser\Software\Adobe\Acrobat Reader\DC\FTEDialog" /v "bWelcomeCard_RdrInstall" /t REG_DWORD /d 1 /f >NUL 2>&1
reg add "HKU\DefaultUser\Software\Adobe\Acrobat Reader\DC\UsageMeasurement" /v "bHeadlightsNoticeShown" /t REG_DWORD /d 1 /f >NUL 2>&1
reg add "HKU\DefaultUser\Software\Adobe\Acrobat Reader\DC\FTEDialog" /v "iFTEVersion" /t REG_DWORD /d 10 /f >NUL 2>&1
reg add "HKU\DefaultUser\Software\Adobe\Acrobat Reader\DC\FTEDialog" /v "iLastCardShown" /t REG_DWORD /d 0 /f >NUL 2>&1
:: reg add "HKU\DefaultUser\Software\Adobe\Acrobat Reader\DC\Originals" /v "bUsePageCache" /t REG_DWORD /d 0 /f >NUL 2>&1
:: reg add "HKU\DefaultUser\Software\Adobe\Acrobat Reader\11.0\Originals" /v "bUsePageCache" /t REG_DWORD /d 0 /f >NUL 2>&1
reg add "HKU\DefaultUser\Software\Adobe\CommonFiles\Usage\Reader DC" /v "OptIn" /t REG_DWORD /d 0 /f >NUL 2>&1
reg add "HKU\DefaultUser\Software\Adobe\Acrobat Reader\DC\AdobeViewer" /v "EULA" /t REG_DWORD /d 1 /f >NUL 2>&1
reg add "HKU\DefaultUser\Software\Adobe\Acrobat Reader\DC\AVGeneral" /v "bSDIMode" /t REG_DWORD /d 1 /f >NUL 2>&1
reg add "HKU\DefaultUser\Software\Adobe\Acrobat Reader\DC\AVGeneral" /v "bisFirstLaunch" /t REG_DWORD /d 0 /f >NUL 2>&1
reg add "HKU\DefaultUser\Software\Adobe\Acrobat Reader\DC\IPM" /v "bShowMsgAtLaunch" /t REG_DWORD /d 0 /f >NUL 2>&1
reg add "HKU\DefaultUser\Software\Adobe\Adobe Acrobat\DC\AVGeneral" /v "bSDIMode" /t REG_DWORD /d 1 /f >NUL 2>&1
reg add "HKU\DefaultUser\Software\Adobe\Acrobat Reader\2017\FeatureLockDown\cWelcomeScreen" /v "bShowWelcomeScreen" /t REG_DWORD /d 0 /f >NUL 2>&1
reg add "HKU\DefaultUser\Software\Adobe\Acrobat Reader\2017\FeatureLockDown" /v "iFileAttachmentPerms " /t REG_DWORD /d 1 /f >NUL 2>&1
reg add "HKU\DefaultUser\SOFTWARE\Adobe\Acrobat Reader\DC\AVGeneral" /v "bRHPSticky" /t REG_DWORD /d 1 /f >NUL 2>&1
reg add "HKU\DefaultUser\SOFTWARE\Adobe\Acrobat Reader\DC\AVDisplay" /v "bUse2DGPUf" /t REG_DWORD /d 0 /f >NUL 2>&1
:: reg add "HKU\DefaultUser\SOFTWARE\Adobe\Acrobat Reader\DC\AVDisplay" /v "bSmoothZooming" /t REG_DWORD /d 0 /f >NUL 2>&1
reg add "HKU\DefaultUser\SOFTWARE\Adobe\Acrobat Reader\DC\IPM" /v "bDontShowMsgWhenViewingDoc" /t REG_DWORD /d 1 /f >NUL 2>&1
reg add "HKU\DefaultUser\SOFTWARE\Adobe\Acrobat Reader\DC\Originals" /v "bSkipDeleteWarnings" /t REG_DWORD /d 1 /f >NUL 2>&1
reg add "HKU\DefaultUser\SOFTWARE\Adobe\Acrobat Reader\DC\Originals" /v "iDefaultZoomType" /t REG_DWORD /d 1 /f >NUL 2>&1
reg add "HKU\DefaultUser\SOFTWARE\Adobe\Acrobat Reader\DC\Originals" /v "iPageViewLayoutMode" /t REG_DWORD /d 1 /f >NUL 2>&1

:: Do not let Windows manage your Printer
REG ADD "HKU\DefaultUser\Software\Microsoft\Windows NT\CurrentVersion\Windows" /v "LegacyDefaultPrinterMode" /t REG_DWORD /d 1 /f >NUL 2>&1
REG ADD "HKU\DefaultUser\Software\Microsoft\TabletTip\1.7" /v "EnableAutocorrection" /t REG_DWORD /d 0 /f >NUL 2>&1
REG ADD "HKU\DefaultUser\Software\Microsoft\Input\Settings" /v "InsightsEnabled" /t REG_DWORD /d 0 /f >NUL 2>&1
REG ADD "HKU\DefaultUser\Software\Microsoft\InputPersonalization" /v "RestrictImplicitTextCollection" /t REG_DWORD /d 1 /f >NUL 2>&1
REG ADD "HKU\DefaultUser\Software\Microsoft\InputPersonalization" /v "RestrictImplicitInkCollection" /t REG_DWORD /d 1 /f >NUL 2>&1
reg add "HKU\DefaultUser\SOFTWARE\Microsoft\InputPersonalization\TrainedDataStore" /v "HarvestContacts" /t REG_DWORD /d 0 /f > nul 2>&1
:: Disable Autoplay for all media and devices / 0 - Enable
reg add "HKU\DefaultUser\Software\Microsoft\Windows\CurrentVersion\Explorer\AutoplayHandlers" /v DisableAutoplay /d 1 /t REG_DWORD /f >NUL 2>&1
REG ADD "HKU\DefaultUser\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SilentInstalledAppsEnabled" /d 0 /t REG_DWORD /f >NUL 2>&1
reg add "HKU\DefaultUser\Software\Policies\Microsoft\WindowsMediaPlayer" /v PreventCDDVDMetadataRetrieval /t REG_DWORD /d 1 /f >NUL 2>&1
reg add "HKU\DefaultUser\Software\Policies\Microsoft\WindowsMediaPlayer" /v PreventMusicFileMetadataRetrieval /t REG_DWORD /d 1 /f >NUL 2>&1
reg add "HKU\DefaultUser\Software\Policies\Microsoft\WindowsMediaPlayer" /v PreventRadioPresetsRetrieval /t REG_DWORD /d 0 /f >NUL 2>&1
reg add "HKU\DefaultUser\Software\Policies\Microsoft\WindowsMediaPlayer" /v PreventLibrarySharing /t REG_DWORD /d 1 /f >NUL 2>&1
:: REG ADD "HKU\DefaultUser\Software\Policies\Microsoft\WindowsMediaPlayer" /v PreventCodecDownload /t REG_DWORD /d 1 /f >NUL 2>&1

:: disable smartscreen microsoft edge browser and windows apps
:: REG ADD "HKU\DefaultUser\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\PhishingFilter" /v "EnabledV9" /d 0 /t REG_DWORD /f >NUL 2>&1
:: REG ADD "HKU\DefaultUser\Software\Microsoft\Internet Explorer\PhishingFilter" /v "EnabledV9" /d 0 /t REG_DWORD /f >NUL 2>&1
:: Disable Windows SmartScreen for Windows Store Apps / 0 - Enable
REG ADD "HKU\DefaultUser\Software\Microsoft\Windows\CurrentVersion\AppHost" /v "EnableWebContentEvaluation" /d 0 /t REG_DWORD /f >NUL 2>&1
REG ADD "HKU\DefaultUser\Software\Microsoft\Windows\CurrentVersion\AppHost" /v "ContentEvaluation" /d 0 /t REG_DWORD /f >NUL 2>&1
:: REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "EnableSmartScreen" /t REG_DWORD /d 0 /f >NUL 2>&1
:: https://docs.microsoft.com/en-us/windows/security/threat-protection/windows-defender-security-center/wdsc-hide-notifications
:: REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender Security Center\Notifications" /v "DisableNotifications" /t REG_DWORD /d 1 /f >NUL 2>&1
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender Security Center\Notifications" /v "DisableEnhancedNotifications" /t REG_DWORD /d 1 /f >NUL 2>&1
:: Disable Windows SmartScreen / On - Enable Windows SmartScreen 
:: reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "SmartScreenEnabled" /t REG_DWORD /d "Off" /f >NUL 2>&1

:: Treiberupdate verhindern 
:: reg add "HKU\DefaultUser\SOFTWARE\Policies\Microsoft\Windows\DriverSearching" /v DontSearchWindowsUpdate /t REG_DWORD /d 1 /f >NUL 2>&1
:: reg add "HKU\DefaultUser\SOFTWARE\Policies\Microsoft\Windows\DriverSearching" /v DontPromptForWindowsUpdate /t REG_DWORD /d 1 /f >NUL 2>&1
:: reg add "HKU\DefaultUser\SOFTWARE\Policies\Microsoft\Windows\DriverSearching" /v SearchOrderConfig /t REG_DWORD /d 0 /f >NUL 2>&1
:: reg add "HKU\DefaultUser\SOFTWARE\Policies\Microsoft\Windows\DriverSearching" /v DriverUpdateWizardWuSearchEnabled /t REG_DWORD /d 0 /f >NUL 2>&1

:: Delete Windows Sounds (Permanently)
reg delete "HKU\DefaultUser\AppEvents\Schemes\Apps" /f >NUL 2>&1

:: Disable "Restore previous folder windows at logon" 
REG delete "HKU\DefaultUser\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "PersistBrowsers" /f /f >NUL 2>&1

:: Taskmanager Tab Performance
reg add "HKU\DefaultUser\Software\Microsoft\Windows\CurrentVersion\TaskManager" /v StartUpTab /t REG_DWORD /d 1 /f >NUL 2>&1

:: Realtek high-pitch sound crackling fix
reg add HKU\DefaultUser\Software\Realtek\Audio\RtkNGUI64\PowerMgnt /v Enabled /t REG_DWORD /d 1 /f >NUL 2>&1
reg add HKU\DefaultUser\Software\Realtek\Audio\RtkNGUI64\PowerMgnt /v DelayTime /t REG_DWORD /d 3 /f >NUL 2>&1
reg add HKU\DefaultUser\Software\Realtek\Audio\RtkNGUI64\PowerMgnt /v OnlyBattery /t REG_DWORD /d 0 /f >NUL 2>&1
reg add HKU\DefaultUser\Software\Realtek\Audio\RtkNGUI64\PowerMgnt /v PowerState /t REG_DWORD /d 0 /f >NUL 2>&1
:: When windows detects communicarions activity / 0 - Mute all other sounds / 1 - Reduce all other by 80% / 2 - Reduce all other by 50% / 3 - Do nothing
reg add HKU\DefaultUser\SOFTWARE\Microsoft\Multimedia\Audio /v UserDuckingPreference /t REG_DWORD /d 3 /f >NUL 2>&1

:: Disable Windows App tracking to improve Start and Search Results
reg add HKU\DefaultUser\Software\Policies\Microsoft\Windows\EdgeUI /v DisableMFUTracking /t REG_DWORD /d 1 /f >NUL 2>&1
reg add HKU\DefaultUser\Software\Policies\Microsoft\Windows\EdgeUI /v DisableHelpSticker /t REG_DWORD /d 1 /f >NUL 2>&1
reg add HKU\DefaultUser\Software\Policies\Microsoft\Windows\EdgeUI /v DisableRecentApps /t REG_DWORD /d 1 /f >NUL 2>&1
reg add HKU\DefaultUser\Software\Policies\Microsoft\Windows\EdgeUI /v TurnOffBackstack /t REG_DWORD /d 1 /f >NUL 2>&1

:: Hide Account Protection warning in Defender about not using a Microsoft account and disabled Smartscreen for Microsoft Edge
reg add "HKU\DefaultUser\Software\Microsoft\Windows Security Health\State" /v "AccountProtection_MicrosoftAccount_Disconnected" /t REG_DWORD /d 1 /f >NUL 2>&1
reg add "HKU\DefaultUser\Software\Microsoft\Windows Security Health\State" /v "AppAndBrowser_StoreAppsSmartScreenOff" /t REG_DWORD /d 0 /f >NUL 2>&1
reg add "HKU\DefaultUser\Software\Microsoft\Windows Security Health\State" /v "AppAndBrowser_EdgeSmartScreenOff" /t REG_DWORD /d 0 /f >NUL 2>&1
reg add "HKU\DefaultUser\Software\Microsoft\Windows\CurrentVersion\Explorer\FeatureUsage\AppSwitched" /v "Microsoft.Windows.SecHealthUI_cw5n1h2txyewy!SecHealthUI" /t REG_DWORD /d 1 /f >NUL 2>&1

:: Background
REG ADD "HKU\DefaultUser\Control Panel\Colors" /v Background /t REG_SZ /d "50 50 100" /f >NUL 2>&1

:: Taskband 
REG DELETE HKU\DefaultUser\Software\Microsoft\Windows\CurrentVersion\Explorer\Taskband /F >NUL 2>&1

:: Turn off auto-hide scrollbars
REG ADD "HKU\DefaultUser\Control Panel\Accessibility" /v DynamicScrollbars /t REG_SZ /d "0" /f >NUL 2>&1
:: Enable Sticky Keys prompt
REG ADD "HKU\DefaultUser\Control Panel\Accessibility\StickyKeys" /v Flags /t REG_SZ /d "510" /f >NUL 2>&1

:: 
reg add "HKU\DefaultUser\SOFTWARE\Microsoft\Games" /v FpsAll /t REG_DWORD /d "1" /f >NUL 2>&1
reg add "HKU\DefaultUser\SOFTWARE\Microsoft\Games" /v GameFluidity /t REG_DWORD /d "1" /f >NUL 2>&1
reg add "HKU\DefaultUser\SOFTWARE\Microsoft\Games" /v FpsStatusGames /t REG_DWORD /d "10" /f >NUL 2>&1
reg add "HKU\DefaultUser\SOFTWARE\Microsoft\Games" /v FpsStatusGamesAll /t REG_DWORD /d "4" /f >NUL 2>&1

:: No advertising banner in Snipping Tool
reg add "HKU\DefaultUser\Software\Microsoft\Windows\TabletPC\Snipping Tool" /v "IsScreenSketchBannerExpanded" /t REG_DWORD /d "0" /f >nul 2>&1

:: Patch NVIDIA telemetry leaks
reg add "HKU\DefaultUser\Software\NVIDIA Corporation\NVControlPanel2\Client" /v "OptInOrOutPreference" /t REG_DWORD /d "0" /f >nul 2>&1 

:: Remove People icon from system tray
REG ADD "HKU\DefaultUser\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People" /v "PeopleBand" /d 0 /t REG_DWORD /f >nul 2>&1 

::Disable creation of Thumbs.db thumbnail cache files
:: IF these keys are left in the registry regardless of the values, windows display thunbnail view will not work
:: Thumbs cache is located here -> C:\Users\%username%\AppData\Local\Microsoft\Windows\Explorer
REG ADD "HKU\DefaultUser\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "DisableThumbnails" /d "1" /t REG_DWORD /f >nul 2>&1 
REG ADD "HKU\DefaultUser\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "DisableThumbnailsOnNetworkFolders" /d "1" /t REG_DWORD /f >nul 2>&1 
REG ADD "HKU\DefaultUser\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "ClearRecentProgForNewUserInStartMenu" /d "1" /t REG_DWORD /f >nul 2>&1 

:: Explorer: Mehr als 15 Dateien gleichen Typs drucken
reg add "HKU\DefaultUser\Software\Microsoft\Windows\CurrentVersion\Explorer" /v MultipleInvokePromptMinimum /d 256 /t REG_DWORD /f >NUL 2>&1

:: Disable Shake to Minimize in Windows 10 - https://www.maketecheasier.com/disable-shake-to-minimize-windows-10/
reg add "HKU\DefaultUser\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v DisallowShaking /d 1 /t REG_DWORD /f >NUL 2>&1

:: Ausführung aktiver Inhalte in Dateien auf dem lokalen Computer zulassen - inetcpl.cpl
reg add "HKU\DefaultUser\SOFTWARE\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_LOCALMACHINE_LOCKDOWN" /v iexplore.exe /d 0 /t REG_DWORD /f >NUL 2>&1

:: Block Google Chrome Software Reporter Tool
reg add "HKU\DefaultUser\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "DisallowRun" /t REG_DWORD /d 1 /f
reg add "HKU\DefaultUser\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun" /v 1 /t REG_SZ /d software_reporter_tool.exe /f

:: Disable Skype telemetry
REG ADD "HKU\DefaultUser\SOFTWARE\Microsoft\Tracing\WPPMediaPerApp\Skype\ETW" /v "TraceLevelThreshold" /t REG_DWORD /d 0 /f >NUL 2>&1
REG ADD "HKU\DefaultUser\SOFTWARE\Microsoft\Tracing\WPPMediaPerApp\Skype" /v "EnableTracing" /t REG_DWORD /d 0 /f >NUL 2>&1
REG ADD "HKU\DefaultUser\SOFTWARE\Microsoft\Tracing\WPPMediaPerApp\Skype\ETW" /v "EnableTracing" /t REG_DWORD /d 0 /f >NUL 2>&1
REG ADD "HKU\DefaultUser\SOFTWARE\Microsoft\Tracing\WPPMediaPerApp\Skype" /v "WPPFilePath" /t REG_SZ /d "%%SYSTEMDRIVE%%\TEMP\Tracing\WPPMedia" /f >NUL 2>&1
REG ADD "HKU\DefaultUser\SOFTWARE\Microsoft\Tracing\WPPMediaPerApp\Skype\ETW" /v "WPPFilePath" /t REG_SZ /d "%%SYSTEMDRIVE%%\TEMP\WPPMedia" /f >NUL 2>&1

:: Console Font Size
REG ADD "HKU\DefaultUser\Console" /v "FontSize" /t REG_DWORD /d 1310720 /f >NUL 2>&1

:: OneDrive User Policies
REG ADD "HKU\DefaultUser\SOFTWARE\Policies\Microsoft\OneDrive" /v DisablePauseOnBatterySaver /t REG_DWORD /d 1 /f >NUL 2>&1
REG ADD "HKU\DefaultUser\SOFTWARE\Policies\Microsoft\OneDrive" /v DisablePauseOnMeteredNetwork /t REG_DWORD /d 1 /f >NUL 2>&1
REG ADD "HKU\DefaultUser\SOFTWARE\Policies\Microsoft\OneDrive" /v DisableTutorial /t REG_DWORD /d 1 /f >NUL 2>&1

:: RSS Feeds - Disable
REG ADD "HKU\DefaultUser\Software\Microsoft\Feeds" /v SyncStatus /t REG_DWORD /d 0 /f >NUL 2>&1

:: disable ads in Skypes chat window
reg add "HKU\DefaultUser\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Domains\skype.com\apps" /v "https" /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKU\DefaultUser\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Domains\skype.com\apps" /v "http" /t REG_DWORD /d "4" /f >nul 2>&1

:: Apps running in the background
 reg add "HKU\DefaultUser\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications\Microsoft.Windows.Photos_8wekyb3d8bbwe" /v Disabled /t REG_DWORD /d 1 /f >nul 2>&1
 reg add "HKU\DefaultUser\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications\Microsoft.Windows.Photos_8wekyb3d8bbwe" /v DisabledByUser /t REG_DWORD /d 1 /f >nul 2>&1
 reg add "HKU\DefaultUser\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications\Microsoft.SkypeApp_kzf8qxf38zg5c" /v Disabled /t REG_DWORD /d 1 /f >nul 2>&1
 reg add "HKU\DefaultUser\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications\Microsoft.SkypeApp_kzf8qxf38zg5c" /v DisabledByUser /t REG_DWORD /d 1 /f >nul 2>&1
 reg add "HKU\DefaultUser\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications\Microsoft.YourPhone_8wekyb3d8bbwe" /v Disabled /t REG_DWORD /d 1 /f >nul 2>&1
 reg add "HKU\DefaultUser\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications\Microsoft.YourPhone_8wekyb3d8bbwe" /v DisabledByUser /t REG_DWORD /d 1 /f >nul 2>&1

:: Disable Show Cloud Content in Search Results in Windows 10
REG ADD "HKU\DefaultUser\SOFTWARE\Microsoft\Windows\CurrentVersion\SearchSettings" /v IsMSACloudSearchEnabled /t REG_DWORD /d 0 /f >NUL 2>&1
REG ADD "HKU\DefaultUser\SOFTWARE\Microsoft\Windows\CurrentVersion\SearchSettings" /v IsAADCloudSearchEnabled /t REG_DWORD /d 0 /f >NUL 2>&1

reg add "HKU\DefaultUser\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Attachments" /v SaveZoneInformation /t REG_DWORD /d 1 /f > NUL 2>&1

:: Unload Default User registry hive
reg unload HKU\DefaultUser

:: Global Settings HKLM
:: reg add HKLM\SOFTWARE\Policies\Microsoft\Windows\System /v NoLocalPasswordResetQuestions /t REG_DWORD /d 1 /f >NUL 2>&1
:: Admin Approval Mode for the built-in Administrator account / 0 (Default) - Disabled / 1 - Enabled
:: reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v FilterAdministratorToken /t REG_DWORD /d 0 /f >NUL 2>&1
::  Disable Administrative Shares
:: reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\system /v LocalAccountTokenFilterPolicy /t REG_DWORD /d 1 /f >NUL 2>&1
:: https://docs.microsoft.com/en-us/windows/security/identity-protection/user-account-control/user-account-control-group-policy-and-registry-key-settings#user-account-control-admin-approval-mode-for-the-built-in-administrator-account
:: Run all administrators in Admin Approval Mode / 0 - Disabled (UAC) / 1 - Enabled (UAC)
reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v EnableLUA /t REG_DWORD /d 0 /f >NUL 2>&1
:: Elevate without prompting / 1 - Prompt for credentials on the secure desktop / 2 - Prompt for consent on the secure desktop / 3 - Prompt for credentials / 4 - Prompt for consent / 5 (Default) - Prompt for consent for non-Windows binaries
reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v ConsentPromptBehaviorAdmin /t REG_DWORD /d 0 /f >NUL 2>&1
:: Automatically deny elevation requests / 1 - Prompt for credentials on the secure desktop / 3 (Default) - Prompt for credentials
reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v ConsentPromptBehaviorUser /t REG_DWORD /d 1 /f >NUL 2>&1
reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v PromptOnSecureDesktop /t REG_DWORD /d 0 /f >NUL 2>&1

:: Detect application installations and prompt for elevation / 1 - Enabled (default for home) / 0 - Disabled (default for enterprise)
reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v EnableInstallerDetection /t REG_DWORD /d 0 /f >NUL 2>&1
reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v VerboseStatus /t REG_DWORD /d 1 /f >NUL 2>&1
reg add HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Policies\System /v VerboseStatus /t REG_DWORD /d 1 /f >NUL 2>&1
reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v SafeModeBlockNonAdmins /t REG_DWORD /d 1 /f >NUL 2>&1
reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\ /v LayoutXMLPath /d C:\Windows\OEM\TaskbarLayoutModification.xml /f >NUL 2>&1
reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer /v DisableEdgeDesktopShortcutCreation /d 1 /t REG_DWORD /f >NUL 2>&1
:: reg add HKLM\SOFTWARE\Policies\Microsoft\Windows\DeviceInstall\Restrictions /v AllowAdminInstall /d 1 /t REG_DWORD /f >NUL 2>&1
:: reg add HKLM\SOFTWARE\Policies\Microsoft\Windows\DeviceInstall\Restrictions /v DenyDeviceClasses /d 1 /t REG_DWORD /f >NUL 2>&1
:: reg add HKLM\SOFTWARE\Policies\Microsoft\Windows\DeviceInstall\Restrictions /v DenyDeviceClassesRetroactive /d 0 /t REG_DWORD /f >NUL 2>&1
:: reg add HKLM\SOFTWARE\Policies\Microsoft\Windows\DeviceInstall\Restrictions\DenyDeviceClasses /v "1" /d "{4d36e96b-e325-11ce-bfc1-08002be10318}" /t REG_SZ /f >NUL 2>&1
reg add HKLM\SOFTWARE\Policies\Microsoft\Windows\DeviceInstall\Settings /v DisableSendGenericDriverNotFoundToWER /d 1 /t REG_DWORD /f >NUL 2>&1
reg add HKLM\SOFTWARE\Policies\Microsoft\Windows\DeviceInstall\Settings /v DisableSendRequestAdditionalSoftwareToWER /d 1 /t REG_DWORD /f >NUL 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Internet Connection Wizard" /v ExitOnMSICW /d 1 /t REG_DWORD /f >NUL 2>&1
:: 18.5.8.1 (L1) Ensure 'Enable insecure guest logons' is set to 'Disabled'
reg add HKLM\SOFTWARE\Policies\Microsoft\Windows\LanmanWorkstation /v AllowInsecureGuestAuth /d 0 /t REG_DWORD /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters" /v AllowInsecureGuestAuth /d 0 /t REG_DWORD /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters" /v DisableLargeMtu /d 0 /t REG_DWORD /f >NUL 2>&1
:: Such- und Websitevorschläge mit den eingegebenen Zeichen anzeigen
:: reg add HKLM\SOFTWARE\Policies\Microsoft\Edge\Recommended /v SearchSuggestEnabled /d 0 /t REG_DWORD /f >NUL 2>&1
reg add HKLM\SOFTWARE\Policies\Microsoft\Edge /v AlwaysOpenPdfExternally /d 1 /t REG_DWORD /f >NUL 2>&1
reg add HKLM\SOFTWARE\Policies\Microsoft\Edge /v ForceGoogleSafeSearch /d 1 /t REG_DWORD /f >NUL 2>&1
reg add HKLM\SOFTWARE\Policies\Microsoft\Edge /v WPADQuickCheckEnabled /d 1 /t REG_DWORD /f >NUL 2>&1
reg add HKLM\SOFTWARE\Policies\Microsoft\Edge /v SpellcheckEnabled /d 0 /t REG_DWORD /f >NUL 2>&1
reg add HKLM\SOFTWARE\Policies\Microsoft\Edge /v SuppressUnsupportedOSWarning /d 1 /t REG_DWORD /f >NUL 2>&1
reg add HKLM\SOFTWARE\Policies\Microsoft\Edge /v UserFeedbackAllowed /d 0 /t REG_DWORD /f >NUL 2>&1
reg add HKLM\SOFTWARE\Policies\Microsoft\Edge /v DefaultGeolocationSetting /d 2 /t REG_DWORD /f >NUL 2>&1
reg add HKLM\SOFTWARE\Policies\Microsoft\Edge /v DNSInterceptionChecksEnabled /d 0 /t REG_DWORD /f >NUL 2>&1
:: reg add HKLM\SOFTWARE\Policies\Microsoft\Edge /v BuiltInDnsClientEnabled /d 1 /t REG_DWORD /f >NUL 2>&1
reg add HKLM\SOFTWARE\Policies\Microsoft\Edge /v DefaultBrowserSettingEnabled /d 0 /t REG_DWORD /f >NUL 2>&1
reg add HKLM\SOFTWARE\Policies\Microsoft\Edge /v ConfigureShare /d 1 /t REG_DWORD /f >NUL 2>&1
reg add HKLM\SOFTWARE\Policies\Microsoft\Edge /v AddressBarMicrosoftSearchInBingProviderEnabled /d 0 /t REG_DWORD /f >NUL 2>&1
reg add HKLM\SOFTWARE\Policies\Microsoft\Edge\Recommended /v PrintPreviewUseSystemDefaultPrinter /d 1 /t REG_DWORD /f >NUL 2>&1
reg add HKLM\SOFTWARE\Policies\Microsoft\Edge /v AutoImportAtFirstRun /d 4 /t REG_DWORD /f >NUL 2>&1
reg add HKLM\SOFTWARE\Policies\Microsoft\EdgeUpdate /v CreateDesktopShortcutDefault /d 0 /t REG_DWORD /f >NUL 2>&1

:: Edge Chromium Ublock Extension - https://www.cisa.gov/sites/default/files/publications/Capacity_Enhancement_Guide-Securing_Web_Browsers_and_Defending_Against_Malvertising_for_Federal_Agencies.pdf
reg add HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallForcelist /v 1 /d "odfafepnkmbhccpbejgmiehpchacaeak" /t REG_SZ /f >NUL 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge\3rdparty\extensions\odfafepnkmbhccpbejgmiehpchacaeak\policy" /v adminSettings /t REG_SZ /d "{\"userSettings\":{\"advancedUserEnabled\":true,\"alwaysDetachLogger\":true,\"autoUpdate\":true,\"cloudStorageEnabled\":false,\"collapseBlocked\":true,\"colorBlindFriendly\":false,\"contextMenuEnabled\":true,\"dynamicFilteringEnabled\":false,\"externalLists\":\"\",\"firewallPaneMinimized\":true,\"hyperlinkAuditingDisabled\":true,\"ignoreGenericCosmeticFilters\":false,\"largeMediaSize\":50,\"parseAllABPHideFilters\":true,\"popupPanelSections\":31,\"prefetchingDisabled\":true,\"requestLogMaxEntries\":1000,\"showIconBadge\":true,\"tooltipsDisabled\":true,\"webrtcIPAddressHidden\":true},\"selectedFilterLists\":[\"user-filters\",\"ublock-filters\",\"ublock-badware\",\"ublock-privacy\",\"ublock-abuse\",\"ublock-unbreak\",\"adguard-generic\",\"adguard-mobile\",\"easylist\",\"adguard-spyware\",\"easyprivacy\",\"fanboy-enhanced\",\"urlhaus-1\",\"spam404-0\",\"adguard-annoyance\",\"adguard-social\",\"fanboy-thirdparty_social\",\"fanboy-cookiemonster\",\"fanboy-annoyance\",\"fanboy-social\",\"ublock-annoyances\",\"dpollock-0\",\"mvps-0\",\"plowe-0\",\"DEU-0\",\"RUS-0\"],\"hiddenSettings\":{},\"whitelist\":[\"about-scheme\",\"chrome-scheme\",\"edge-scheme\",\"moz-extension-scheme\",\"opera-scheme\",\"vivaldi-scheme\",\"wyciwyg-scheme\"],\"netWhitelist\":\"about-scheme\\nchrome-scheme\\nedge-scheme\\nmoz-extension-scheme\\nopera-scheme\\nvivaldi-scheme\\nwyciwyg-scheme\",\"dynamicFilteringString\":\"behind-the-scene * * noop\\nbehind-the-scene * inline-script noop\\nbehind-the-scene * 1p-script noop\\nbehind-the-scene * 3p-script noop\\nbehind-the-scene * 3p-frame noop\\nbehind-the-scene * image noop\\nbehind-the-scene * 3p noop\",\"urlFilteringString\":\"\",\"hostnameSwitchesString\":\"no-large-media: behind-the-scene false\\nno-csp-reports: * true\",\"userFilters\":\"\"}" /f >NUL 2>&1
:: reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge\3rdparty\extensions\odfafepnkmbhccpbejgmiehpchacaeak\policy" /v adminSettings /t REG_SZ /d "{\"userSettings\":{\"advancedUserEnabled\":true,\"alwaysDetachLogger\":true,\"autoUpdate\":true,\"cloudStorageEnabled\":false,\"collapseBlocked\":true,\"colorBlindFriendly\":false,\"contextMenuEnabled\":true,\"dynamicFilteringEnabled\":true,\"externalLists\":\"\",\"firewallPaneMinimized\":true,\"hyperlinkAuditingDisabled\":true,\"ignoreGenericCosmeticFilters\":false,\"largeMediaSize\":50,\"parseAllABPHideFilters\":true,\"prefetchingDisabled\":true,\"requestLogMaxEntries\":1000,\"showIconBadge\":true,\"tooltipsDisabled\":true,\"webrtcIPAddressHidden\":true},\"selectedFilterLists\":[\"user-filters\",\"ublock-filters\",\"ublock-badware\",\"ublock-privacy\",\"ublock-abuse\",\"ublock-unbreak\",\"adguard-generic\",\"adguard-mobile\",\"easylist\",\"adguard-spyware\",\"easyprivacy\",\"fanboy-enhanced\",\"disconnect-malvertising\",\"malware-0\",\"malware-1\",\"spam404-0\",\"adguard-annoyance\",\"adguard-social\",\"fanboy-thirdparty_social\",\"fanboy-cookiemonster\",\"fanboy-annoyance\",\"fanboy-social\",\"ublock-annoyances\",\"dpollock-0\",\"hphosts\",\"mvps-0\",\"plowe-0\",\"DEU-0\"],\"hiddenSettings\":{\"allowGenericProceduralFilters\":false,\"assetFetchTimeout\":30,\"autoCommentFilterTemplate\":\"{{date}} {{origin}}\",\"autoUpdateAssetFetchPeriod\":120,\"autoUpdateDelayAfterLaunch\":180,\"autoUpdatePeriod\":7,\"blockingProfiles\":\"11111/#F00 11011/#C0F 11001/#00F 00001\",\"cacheStorageAPI\":\"unset\",\"cacheStorageCompression\":true,\"cacheControlForFirefox1376932\":\"no-cache, no-store, must-revalidate\",\"consoleLogLevel\":\"unset\",\"debugScriptlets\":false,\"debugScriptletInjector\":false,\"disableWebAssembly\":false,\"extensionUpdateForceReload\":false,\"ignoreRedirectFilters\":false,\"ignoreScriptInjectFilters\":false,\"filterAuthorMode\":false,\"loggerPopupType\":\"popup\",\"manualUpdateAssetFetchPeriod\":500,\"popupFontSize\":\"unset\",\"requestJournalProcessPeriod\":1000,\"selfieAfter\":3,\"strictBlockingBypassDuration\":120,\"suspendTabsUntilReady\":\"unset\",\"updateAssetBypassBrowserCache\":false,\"userResourcesLocation\":\"unset\"},\"whitelist\":[\"about-scheme\",\"chrome-extension-scheme\",\"chrome-scheme\",\"moz-extension-scheme\",\"opera-scheme\",\"vivaldi-scheme\",\"wyciwyg-scheme\"],\"netWhitelist\":\"about-scheme\\nchrome-extension-scheme\\nchrome-scheme\\nmoz-extension-scheme\\nopera-scheme\\nvivaldi-scheme\\nwyciwyg-scheme\",\"dynamicFilteringString\":\"behind-the-scene * * noop\\nbehind-the-scene * inline-script noop\\nbehind-the-scene * 1p-script noop\\nbehind-the-scene * 3p-script noop\\nbehind-the-scene * 3p-frame noop\\nbehind-the-scene * image noop\\nbehind-the-scene * 3p noop\",\"urlFilteringString\":\"\",\"hostnameSwitchesString\":\"no-large-media: behind-the-scene false\\nno-csp-reports: * true\",\"userFilters\":\"\"}" /f >NUL 2>&1
:: Bitwarden
reg add HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallForcelist /v 2 /d "jbkfoedolllekgbhcbcoahefnbanhhlh" /t REG_SZ /f >NUL 2>&1
:: Privacy Badger Edge
reg add HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallForcelist /v 3 /d "mkejgcgkdlddbggjhhflekkondicpnop" /t REG_SZ /f >NUL 2>&1

:: Google Chrome Extensions
:: Ublock Origin Chrome
reg add HKLM\Software\Policies\Google\Chrome\ExtensionInstallForcelist  /v 1 /d "cjpalhdlnbpafiamejdnhcphjbkeiagm" /t REG_SZ /f >NUL 2>&1
reg add "HKLM\SOFTWARE\Policies\Google\Chrome\3rdparty\extensions\cjpalhdlnbpafiamejdnhcphjbkeiagm\policy" /v adminSettings /t REG_SZ /d "{\"userSettings\":{\"advancedUserEnabled\":true,\"alwaysDetachLogger\":true,\"autoUpdate\":true,\"cloudStorageEnabled\":false,\"collapseBlocked\":true,\"colorBlindFriendly\":false,\"contextMenuEnabled\":true,\"dynamicFilteringEnabled\":false,\"externalLists\":\"\",\"firewallPaneMinimized\":true,\"hyperlinkAuditingDisabled\":true,\"ignoreGenericCosmeticFilters\":false,\"largeMediaSize\":50,\"parseAllABPHideFilters\":true,\"popupPanelSections\":31,\"prefetchingDisabled\":true,\"requestLogMaxEntries\":1000,\"showIconBadge\":true,\"tooltipsDisabled\":true,\"webrtcIPAddressHidden\":true},\"selectedFilterLists\":[\"user-filters\",\"ublock-filters\",\"ublock-badware\",\"ublock-privacy\",\"ublock-abuse\",\"ublock-unbreak\",\"adguard-generic\",\"adguard-mobile\",\"easylist\",\"adguard-spyware\",\"easyprivacy\",\"fanboy-enhanced\",\"urlhaus-1\",\"spam404-0\",\"adguard-annoyance\",\"adguard-social\",\"fanboy-thirdparty_social\",\"fanboy-cookiemonster\",\"fanboy-annoyance\",\"fanboy-social\",\"ublock-annoyances\",\"dpollock-0\",\"mvps-0\",\"plowe-0\",\"DEU-0\",\"RUS-0\"],\"hiddenSettings\":{},\"whitelist\":[\"about-scheme\",\"chrome-scheme\",\"edge-scheme\",\"moz-extension-scheme\",\"opera-scheme\",\"vivaldi-scheme\",\"wyciwyg-scheme\"],\"netWhitelist\":\"about-scheme\\nchrome-scheme\\nedge-scheme\\nmoz-extension-scheme\\nopera-scheme\\nvivaldi-scheme\\nwyciwyg-scheme\",\"dynamicFilteringString\":\"\",\"urlFilteringString\":\"\",\"hostnameSwitchesString\":\"\",\"userFilters\":\"youtube.com##+js(set, ytInitialPlayerResponse.adPlacements, undefined)\nyoutube.com##+js(json-prune, [].playerResponse.adPlacements [].playerResponse.playerAds playerResponse.adPlacements playerResponse.playerAds adPlacements playerAds)\n\"}" /f >NUL 2>&1
:: Privacy Badger Chrome
reg add HKLM\Software\Policies\Google\Chrome\ExtensionInstallForcelist  /v 2 /d "pkehgijcmpdhfbdbbnkijodmdjhbjlgp" /t REG_SZ /f >NUL 2>&1
:: Bitwarden Password-Manager Chrome
reg add HKLM\Software\Policies\Google\Chrome\ExtensionInstallForcelist  /v 3 /d "nngceckbapebfimnlniiiahkandclblb" /t REG_SZ /f >NUL 2>&1
:: Block Browser-Extension Adobe Plugin
:: reg add "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /v "1" /d "efaidnbmnnnibpcajpcglclefindmkaj" /f >NUL 2>&1

reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\msedge.exe" /V UseLargePages /t REG_DWORD /d "00000001" /f > NUL 2>&1
reg add "HKLM\Software\Policies\Microsoft\Windows NT\Printers" /v DisableHTTPPrinting /d 1 /t REG_DWORD /f >NUL 2>&1
reg add "HKLM\Software\Policies\Microsoft\Windows NT\Printers\PointAndPrint" /v Restricted /d 0 /t REG_DWORD /f >NUL 2>&1
reg add "HKLM\Software\Policies\Microsoft\Windows NT\Printers\PointAndPrint" /v TrustedServers /d 0 /t REG_DWORD /f >NUL 2>&1
reg add "HKLM\Software\Policies\Microsoft\Windows NT\Printers\PointAndPrint" /v InForest /d 0 /t REG_DWORD /f >NUL 2>&1
reg add "HKLM\Software\Policies\Microsoft\Windows NT\Printers\PointAndPrint" /v NoWarningNoElevationOnInstall /d 1 /t REG_DWORD /f >NUL 2>&1
reg add "HKLM\Software\Policies\Microsoft\Windows NT\Printers\PointAndPrint" /v UpdatePromptSettings /d 2 /t REG_DWORD /f >NUL 2>&1
reg add HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoWebServices /d 0 /f >NUL 2>&1
reg add HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoOnlinePrintsWizard /d 1 /f >NUL 2>&1
reg add HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoPublishingWizard /d 1 /f >NUL 2>&1
reg add HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoWelcomeScreen /d 1 /f >NUL 2>&1
reg add HKLM\Software\Policies\Microsoft\Messenger\Client /v CEIP /d 2 /f >NUL 2>&1
reg add HKLM\SOFTWARE\Policies\Microsoft\Messenger\Client /v PreventRun /d 1 /f >NUL 2>&1
:: Disable Windows Error Reporting (WER)
reg add "HKLM\Software\Policies\Microsoft\Windows\Windows Error Reporting" /v Disabled /d 1 /f >NUL 2>&1
reg add "HKLM\Software\Microsoft\Windows\Windows Error Reporting" /v "Disabled" /t REG_DWORD /d "1" /f >NUL 2>&1
:: Disable WER sending second-level data
reg add "HKLM\Software\Microsoft\Windows\Windows Error Reporting" /v "DontSendAdditionalData" /t REG_DWORD /d "1" /f >NUL 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting" /v "DontSendAdditionalData" /t REG_DWORD /d "1" /f >NUL 2>&1
:: Disable WER crash dialogs, popups
reg add "HKLM\Software\Microsoft\Windows\Windows Error Reporting" /v "DontShowUI" /t REG_DWORD /d "1" /f >NUL 2>&1
:: Disable WER logging
reg add "HKLM\Software\Microsoft\Windows\Windows Error Reporting" /v "LoggingDisabled" /t REG_DWORD /d "1" /f >NUL 2>&1
reg add "HKLM\Software\Policies\Microsoft\Windows\Windows Error Reporting" /v DoReport /d 0 /f >NUL 2>&1
:: Stop automatically sending memory dumps for OS-generated error reports
reg add "HKLM\Software\Policies\Microsoft\Windows\Windows Error Reporting" /v AutoApproveOSDumps /d 0 /f >NUL 2>&1
reg add "HKLM\Software\Policies\Microsoft\Windows\Registration Wizard Control" /v NoRegistration /d 0 /f >NUL 2>&1
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config" /v DODownloadMode /d 0 /t REG_DWORD /f >NUL 2>&1
reg add "HKLM\Software\Policies\Microsoft\Windows\DeliveryOptimization" /v DODownloadMode /d 0 /t REG_DWORD /f >NUL 2>&1
reg add HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection /v DisableDiagnosticDataViewer /t REG_DWORD /d 1 /f >NUL 2>&1
:: Disable organizations to send Microsoft a specific set of diagnostic data via Windows Analytics services
reg add HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection /v LimitEnhancedDiagnosticDataWindowsAnalytics /t REG_DWORD /d 0 /f >NUL 2>&1
:: 18.9.16.2 (L2) Ensure 'Configure Authenticated Proxy usage for the Connected User Experience and Telemetry service' is set to 'Enabled: Disable Authenticated Proxy usage'
reg add HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection /v DisableEnterpriseAuthProxy /t REG_DWORD /d 1 /f >NUL 2>&1
reg add HKLM\SOFTWARE\Policies\Microsoft\FVE /v EncryptionMethod /t REG_DWORD /d 7 /f >NUL 2>&1
:: Disables Windows Connect Now wizard
reg add HKLM\SOFTWARE\Policies\Microsoft\Windows\WCN\UI /v DisableWcnUi /t REG_DWORD /d 1 /f >NUL 2>&1
reg add HKLM\SOFTWARE\Policies\Microsoft\Windows\WCN\Registrars /v DisableFlashConfigRegistrar /t REG_DWORD /d 0 /f >NUL 2>&1
reg add HKLM\SOFTWARE\Policies\Microsoft\FVE /v EnableBDEWithNoTPM /t REG_DWORD /d 1 /f >NUL 2>&1
reg add HKLM\SOFTWARE\Policies\Microsoft\FVE /v UseAdvancedStartup /t REG_DWORD /d 1 /f >NUL 2>&1
reg add HKLM\SOFTWARE\Policies\Microsoft\FVE /v UseTPM /t REG_DWORD /d 2 /f >NUL 2>&1
reg add HKLM\SOFTWARE\Policies\Microsoft\FVE /v UseTPMKEY /t REG_DWORD /d 2 /f >NUL 2>&1
reg add HKLM\SOFTWARE\Policies\Microsoft\FVE /v UseTPMKeyPIN /t REG_DWORD /d 2 /f >NUL 2>&1
reg add HKLM\SOFTWARE\Policies\Microsoft\FVE /v UseTPMPIN /t REG_DWORD /d 2 /f >NUL 2>&1
reg add HKLM\SOFTWARE\Policies\Microsoft\FVE /v EncryptionMethodWithXtsOs /t REG_DWORD /d 7 /f >NUL 2>&1
reg add HKLM\SOFTWARE\Policies\Microsoft\FVE /v EncryptionMethodWithXtsFdv /t REG_DWORD /d 7 /f >NUL 2>&1
reg add HKLM\SOFTWARE\Policies\Microsoft\FVE /v EncryptionMethodWithXtsRdv /t REG_DWORD /d 7 /f >NUL 2>&1
:: Reg add "HKLM\SOFTWARE\Microsoft\Windows Embedded\EmbeddedLogon" /v HideAutoLogonUI  /t REG_DWORD /d 1 >NUL 2>&1
::Disable The Lock Screen
reg add HKLM\SOFTWARE\Policies\Microsoft\Windows\Personalization /v NoLockScreen /t REG_DWORD /d 1 /f >NUL 2>&1
:: Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Authentication\LogonUI" /v AnimationDisabled /t REG_DWORD /d 1 >NUL 2>&1
:: Reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v  UIVerbosityLevel  /t REG_DWORD /d 1 >NUL 2>&1
reg add HKLM\SOFTWARE\Policies\Microsoft\Windows\OOBE /v DisablePrivacyExperience /t REG_DWORD /d 1 /f >NUL 2>&1
:: reg add HKLM\SOFTWARE\Policies\Microsoft\Windows\System /v EnableCdp /t REG_DWORD /d 0 /f >NUL 2>&1
:: https://www.thewindowsclub.com/enable-or-disable-intel-tsx-capability
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Kernel" /v DisableTsx /t REG_DWORD /d 0 /f >NUL 2>&1
::  Disable Fast Startup for a Full Shutdown / 1 - Enable Fast Startup (Hybrid Boot) for a Hybrid Shutdown
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /v HiberbootEnabled /t REG_DWORD /d 0 /f >NUL 2>&1
reg add "HKLM\SYSTEM\ControlSet001\Control\Session Manager\Power" /v "HiberbootEnabled" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\ControlSet002\Control\Session Manager\Power" /v "HiberbootEnabled" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /v "HiberbootEnabled" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /v WaitToKillServiceTimeout /t REG_SZ /d 2000 /f >NUL 2>&1
reg add "HKLM\SYSTEM\ControlSet001\Control" /v "WaitToKillServiceTimeout" /t REG_SZ /d "1000" /f >nul 2>&1
reg add "HKLM\SYSTEM\ControlSet002\Control" /v "WaitToKillServiceTimeout" /t REG_SZ /d "1000" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control" /v "WaitToKillServiceTimeout" /t REG_SZ /d "1000" /f >nul 2>&1
reg add "HKLM\SYSTEM\ControlSet001\Control\Power" /v "HibernateEnabled" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\ControlSet002\Control\Power" /v "HibernateEnabled" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "HibernateEnabled" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling" /v PowerThrottlingOff /t REG_DWORD /d 1 /f >NUL 2>&1
reg add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerThrottling" /v "PowerThrottlingOff" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SYSTEM\ControlSet002\Control\Power\PowerThrottling" /v "PowerThrottlingOff" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling" /v "PowerThrottlingOff" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Remote Assistance" /v fAllowToGetHelp /t REG_DWORD /d 0 /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Remote Assistance" /v fAllowFullControl /t REG_DWORD /d 0 /f > NUL 2>&1
reg add HKLM\SOFTWARE\Policies\Microsoft\Windows\System /v DisableLogonBackgroundImage /t REG_DWORD /d 1 /f >NUL 2>&1
:: https://stigviewer.com/stig/windows_10/2015-11-30/finding/V-63631
reg add HKLM\SOFTWARE\Policies\Microsoft\Windows\System /v DontEnumerateConnectedUsers /t REG_DWORD /d 1 /f >NUL 2>&1
:: 18.9.64.2 (L2) Ensure 'Allow Cloud Search' is set to 'Enabled: Disable Cloud Search'
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v AllowCloudSearch /t REG_DWORD /d 0 /f >NUL 2>&1
reg add HKLM\SYSTEM\CurrentControlSet\Control\FileSystem /v LongPathsEnabled /t REG_DWORD /d 1 /f >NUL 2>&1
reg add "HKLM\SYSTEM\ControlSet001\Control\FileSystem" /v "LongPathsEnabled" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SYSTEM\ControlSet002\Control\FileSystem" /v "LongPathsEnabled" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\FileSystem" /v "LongPathsEnabled" /t REG_DWORD /d "1" /f >nul 2>&1
:: This will clear credentials of logged off users after 30 seconds (mimicking the behavior of Windows 8.1+)
:: https://support.microsoft.com/en-us/topic/microsoft-security-advisory-update-to-improve-credentials-protection-and-management-may-13-2014-93434251-04ac-b7f3-52aa-9f951c14b649
reg add HKLM\SYSTEM\CurrentControlSet\Control\Lsa /v TokenLeakDetectDelaySecs /t REG_DWORD /d 30 /f >nul 2>&1
reg add HKLM\SYSTEM\CurrentControlSet\Control\Lsa /v RestrictAnonymous /t REG_DWORD /d 1 /f >NUL 2>&1
reg add HKLM\SYSTEM\CurrentControlSet\Control\Lsa /v RestrictAnonymousSAM  /t REG_DWORD /d 1 /f >NUL 2>&1
reg add HKLM\SYSTEM\CurrentControlSet\Control\Lsa /v RestrictRemoteSAM /t REG_SZ /d "O:BAG:BAD:(A;;RC;;;BA)" /f >NUL 2>&1
reg add HKLM\SYSTEM\CurrentControlSet\Control\Lsa /v LmCompatibilityLevel /t REG_DWORD /d 5 /f >NUL 2>&1
:: Limit use of blank passwords
reg add HKLM\SYSTEM\CurrentControlSet\Control\Lsa /v LimitBlankPasswordUse /t REG_DWORD /d 1 /f >NUL 2>&1
:: https://www.stigviewer.com/stig/windows_7/2014-04-02/finding/V-21951 - Machine ID for NTLM
reg add HKLM\SYSTEM\CurrentControlSet\Control\Lsa /v UseMachineId /t REG_DWORD /d 1 /f >NUL 2>&1
:: https://www.stigviewer.com/stig/windows_8/2013-02-15/finding/V-3344
reg add HKLM\SYSTEM\CurrentControlSet\Control\Lsa /v LimitBlankPasswordUse /t REG_DWORD /d 1 /f >NUL 2>&1
:: Enable LSA protection - https://docs.microsoft.com/en-us/windows-server/security/credentials-protection-and-management/configuring-additional-lsa-protection
reg add HKLM\SYSTEM\CurrentControlSet\Control\Lsa /v RunAsPPL /t REG_DWORD /d 1 /f >NUL 2>&1
reg add HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\WDigest /v UseLogonCredential /t REG_DWORD /d 0 /f >NUL 2>&1
reg add HKLM\SOFTWARE\Policies\Microsoft\Windows\CredentialsDelegation /v AllowProtectedCreds /t REG_DWORD /d 1 /f >NUL 2>&1
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\Explorer" /v NoNewAppAlert  /t REG_DWORD /d 1 /f >NUL 2>&1
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\Explorer" /v NoAutoplayfornonVolume  /t REG_DWORD /d 1 /f >NUL 2>&1
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\Explorer" /v NoAutorun  /t REG_DWORD /d 1 /f >NUL 2>&1
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\Explorer" /v NoPinningStoreToTaskbar  /t REG_DWORD /d 1 /f >NUL 2>&1
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\Explorer" /v HidePeopleBar  /t REG_DWORD /d 1 /f >NUL 2>&1
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\Explorer" /v NoBalloonFeatureAdvertisements  /t REG_DWORD /d 1 /f >NUL 2>&1
:: REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\Explorer" /v DisableNotificationCenter  /t REG_DWORD /d 1 /f >NUL 2>&1
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Peernet" /v Disabled  /t REG_DWORD /d 1 /f >NUL 2>&1
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\PCHealth\ErrorReporting" /v DoReport  /t REG_DWORD /d 0 /f >NUL 2>&1
:: https://docs.microsoft.com/en-us/windows/privacy/manage-connections-from-windows-operating-system-components-to-microsoft-services
REG ADD "HKLM\Software\Policies\Microsoft\MicrosoftEdge\ServiceUI" /v AllowWebContentOnNewTabPage  /t REG_DWORD /d 0 /f >NUL 2>&1
REG ADD "HKLM\Software\Policies\Microsoft\MicrosoftEdge\Internet Settings" /v ConfigureOpenEdgeWith  /t REG_DWORD /d 1 /f >NUL 2>&1
REG ADD "HKLM\Software\Policies\Microsoft\MicrosoftEdge\Internet Settings" /v DisableLockdownOfStartPages  /t REG_DWORD /d 1 /f >NUL 2>&1
reg add "HKLM\Software\Policies\Microsoft\MicrosoftEdge\Internet Settings" /v ProvisionedHomePages /t REG_SZ /d "https://www.google.at/" /f >NUL 2>&1
reg add "HKLM\Software\Policies\Microsoft\MicrosoftEdge\Internet Settings" /v NewTabPageURL /t REG_SZ /d "https://www.google.at/" /f >NUL 2>&1
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Main" /v PreventFirstRunPage  /t REG_DWORD /d 1 /f >NUL 2>&1
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Main" /v PreventLiveTileDataCollection  /t REG_DWORD /d 1 /f >NUL 2>&1
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Main" /v AllowPrelaunch /t REG_DWORD /d 0 /f >NUL 2>&1
:: 18.9.45.13 (L2) Ensure 'Prevent using Localhost IP address for WebRTC' is set to 'Enabled'
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Main" /v HideLocalHostIP /t REG_DWORD /d 1 /f >NUL 2>&1
:: REG ADD "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\TabPreloader" /v AllowTabPreloading /t REG_DWORD /d 0 /f >NUL 2>&1
REG ADD "HKLM\SOFTWARE\Microsoft\Edge" /v HideFirstRunExperience  /t REG_DWORD /d 1 /f >NUL 2>&1
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v HideFirstRunExperience  /t REG_DWORD /d 1 /f >NUL 2>&1
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v HideInternetExplorerRedirectUXForIncompatibleSitesEnabled  /t REG_DWORD /d 1 /f >NUL 2>&1
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v BingAdsSuppression  /t REG_DWORD /d 1 /f >NUL 2>&1
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v PersonalizationReportingEnabled  /t REG_DWORD /d 0 /f >NUL 2>&1
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v TrackingPrevention  /t REG_DWORD /d 3 /f >NUL 2>&1
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v BrowserNetworkTimeQueriesEnabled  /t REG_DWORD /d 0 /f >NUL 2>&1
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v ShowRecommendationsEnabled  /t REG_DWORD /d 0 /f >NUL 2>&1
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v BasicAuthOverHttpEnabled  /t REG_DWORD /d 0 /f >NUL 2>&1
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v AddressBarMicrosoftSearchInBingProviderEnabled  /t REG_DWORD /d 0 /f >NUL 2>&1
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v PromptForDownloadLocation  /t REG_DWORD /d 0 /f >NUL 2>&1
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\Recommended" /v NewTabPagePrerenderEnabled  /t REG_DWORD /d 1 /f >NUL 2>&1
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\Recommended" /v SleepingTabsEnabled  /t REG_DWORD /d 1 /f >NUL 2>&1
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\Recommended" /v StartupBoostEnabled  /t REG_DWORD /d 0 /f >NUL 2>&1
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\Recommended" /v PasswordManagerEnabled  /t REG_DWORD /d 0 /f >NUL 2>&1
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\Recommended" /v PasswordMonitorAllowed  /t REG_DWORD /d 0 /f >NUL 2>&1
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\Recommended" /v TranslateEnabled  /t REG_DWORD /d 0 /f >NUL 2>&1
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\Recommended" /v BlockThirdPartyCookies  /t REG_DWORD /d 1 /f >NUL 2>&1
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\Recommended" /v BackgroundModeEnabled  /t REG_DWORD /d 0 /f >NUL 2>&1
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\Recommended" /v HomepageLocation  /t REG_DWORD /d "https://www.google.at/" /f >NUL 2>&1
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\Recommended" /v ShowHomeButton  /t REG_DWORD /d 1 /f >NUL 2>&1
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\Recommended" /v RestoreOnStartup  /t REG_DWORD /d 4 /f >NUL 2>&1
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\Recommended\RestoreOnStartupURLs" /v 1  /t REG_SZ /d "https://www.google.at/" /f >NUL 2>&1
:: REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\Recommended" /v SmartScreenEnabled  /t REG_DWORD /d 0 /f >NUL 2>&1
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\Recommended" /v DefaultSearchProviderEnabled  /t REG_DWORD /d 1 /f >NUL 2>&1
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\Recommended" /v DefaultSearchProviderName  /t REG_SZ /d "Google" /f >NUL 2>&1
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\Recommended" /v DefaultSearchProviderSearchURL  /t REG_SZ /d "{google:baseURL}search?q={searchTerms}&{google:RLZ}{google:originalQueryForSuggestion}{google:assistedQueryStats}{google:searchFieldtrialParameter}{google:searchClient}{google:sourceId}ie={inputEncoding}" /f >NUL 2>&1
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\Recommended" /v DefaultSearchProviderSuggestURL  /t REG_SZ /d "{google:baseURL}complete/search?output=chrome&q={searchTerms}" /f >NUL 2>&1
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\Recommended" /v DefaultSearchProviderImageURL  /t REG_SZ /d "{google:baseURL}searchbyimage/upload" /f >NUL 2>&1
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\Recommended" /v DefaultSearchProviderImageURLPostParams  /t REG_SZ /d "encoded_image={google:imageThumbnail},image_url={google:imageURL},sbisrc={google:imageSearchSource},original_width={google:imageOriginalWidth},original_height={google:imageOriginalHeight}" /f >NUL 2>&1
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\Recommended" /v ImportPaymentInfo  /t REG_DWORD /d 0 /f >NUL 2>&1
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\Recommended" /v ImportHistory  /t REG_DWORD /d 0 /f >NUL 2>&1
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\Recommended" /v ImportSavedPasswords  /t REG_DWORD /d 0 /f >NUL 2>&1
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\Recommended" /v ImportOpenTabs  /t REG_DWORD /d 0 /f >NUL 2>&1
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\Recommended" /v ImportAutofillFormData  /t REG_DWORD /d 0 /f >NUL 2>&1
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\Recommended" /v ImportBrowserSettings  /t REG_DWORD /d 0 /f >NUL 2>&1
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\Recommended" /v ImportCookies  /t REG_DWORD /d 0 /f >NUL 2>&1
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\Recommended" /v ImportExtensions  /t REG_DWORD /d 0 /f >NUL 2>&1
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\Recommended" /v ImportFavorites  /t REG_DWORD /d 0 /f >NUL 2>&1
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\Recommended" /v ImportSearchEngine  /t REG_DWORD /d 0 /f >NUL 2>&1
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\Recommended" /v ImportShortcuts  /t REG_DWORD /d 0 /f >NUL 2>&1
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\Recommended" /v FavoritesBarEnabled  /t REG_DWORD /d 1 /f >NUL 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v ManagedFavorites /t REG_SZ /d "[{\"toplevel_name\": \"Vordefinierte Favoriten\"}, {\"name\": \"Google\", \"url\": \"google.at\"}, {\"name\": \"DuckDuckGo\", \"url\": \"duckduckgo.com\"}, {\"name\": \"YouTube\", \"url\": \"youtube.com\"}, {\"children\": [{\"name\": \"ORF.at\", \"url\": \"orf.at\"}, {\"name\": \"DerStandard.at\", \"url\": \"derstandard.at\"}], \"name\": \"Nachrichten\"},{\"children\": [{\"name\": \"Computerbase.de\", \"url\": \"computerbase.de\"}, {\"name\": \"Golem.de\", \"url\": \"golem.de\"}, {\"name\": \"WindowsPro\", \"url\": \"windowspro.de\"}], \"name\": \"Magazine\"}]" /f >NUL 2>&1
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\Recommended" /v SmartScreenForTrustedDownloadsEnabled  /t REG_DWORD /d 0 /f >NUL 2>&1
:: REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v BackgroundModeEnabled  /t REG_DWORD /d 0 /f >NUL 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d 0 /f > nul 2>&1
reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f > NUL 2>&1

:: Do not allow Edge sending intranet or internet history
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v "MicrosoftEdgeDataOptIn" /t REG_DWORD /d 0 /f > nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\TextInput" /v "AllowLinguisticDataCollection" /t REG_DWORD /d 0 /f > nul 2>&1
:: Diagnosedaten Erfassung deaktivieren
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d 0 /f > nul 2>&1
reg add "HKLM\SOFTWARE\Wow6432Node\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d "0" /f > nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\ClientTelemetry" /v "IsCensusDisabled" /t REG_DWORD /d 1 /f > NUL 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\ClientTelemetry" /v "DontRetryOnError" /t REG_DWORD /d 1 /f > NUL 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\ClientTelemetry" /v "TaskEnableRun" /t REG_DWORD /d 1 /f > NUL 2>&1
:: Diagnostic and usage data / 0 - Never / 1 - Basic / 2 - Enhanced / 3 - Full
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\WINEVT\Channels\Microsoft-Windows-Application-Experience/Program-Telemetry" /v "Enabled" /t REG_DWORD /d "0" /f >NUL 2>&1
:: Diagnosedaten senden deaktivieren
REG ADD "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\Diagtrack-Listener" /v "Start" /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\AutoLogger\SQMLogger" /v "Start" /t REG_DWORD /d 0 /f > nul 2>&1
REG add "HKLM\SYSTEM\ControlSet001\Services\DiagTrack" /v "Start" /t REG_DWORD /d 4 /f > nul 2>&1
REG add "HKLM\SYSTEM\CurrentControlSet\Services\dmwappushsvc" /v "Start" /t REG_DWORD /d 4 /f > nul 2>&1
REG add "HKLM\SYSTEM\ControlSet001\Services\dmwappushsvc" /v "Start" /t REG_DWORD /d 4 /f > nul 2>&1
REG ADD "HKLM\SYSTEM\CurrentControlSet\Services\DiagTrack" /v "Start" /t REG_DWORD /d 4 /f > nul 2>&1
REG ADD "HKLM\SYSTEM\CurrentControlSet\Services\dmwappushservice" /v "Start" /t REG_DWORD /d 4 /f > nul 2>&1
REG ADD "HKLM\SYSTEM\CurrentControlSet\Services\diagnosticshub.standardcollector.service" /v "Start" /t REG_DWORD /d 4 /f > nul 2>&1
:: https://docs.microsoft.com/en-us/windows-server/administration/performance-tuning/role/file-server/
REG ADD "HKLM\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters" /v "DisableBandwidthThrottling" /t REG_DWORD /d 1 /f > nul 2>&1
REG ADD "HKLM\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters" /v "FileInfoCacheEntriesMax" /t REG_DWORD /d 32768 /f > nul 2>&1
REG ADD "HKLM\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters" /v "DirectoryCacheEntriesMax" /t REG_DWORD /d 4096 /f > nul 2>&1
REG ADD "HKLM\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters" /v "FileNotFoundCacheEntriesMax" /t REG_DWORD /d 32768 /f > nul 2>&1
REG ADD "HKLM\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters" /v "MaxCmds" /t REG_DWORD /d 32768 /f > nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" /v DisableLeasing /t REG_DWORD /d 1 /f > nul 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\Lanmanserver\Parameters" /v "Hidden" /t REG_DWORD /d 1 /f > nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" /v RestrictNullSessAccess /t REG_DWORD /d 1 /f > nul 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\Tcpip\Parameters" /v "DisableIPSourceRouting" /t REG_DWORD /d 2 /f > nul 2>&1
REG ADD "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip6\Parameters" /v "DisableIPSourceRouting" /t REG_DWORD /d 2 /f > nul 2>&1
reg ADD "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v EnableICMPRedirect /t REG_DWORD /d 0 /f > nul 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\Tcpip\Parameters" /v "SynAttackProtect" /t REG_DWORD /d 1 /f > nul 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\Tcpip\Parameters" /v "QualifyingDestinationThreshold" /t REG_DWORD /d 3 /f > nul 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\Tcpip\Parameters" /v "Tcp1323Opts" /t REG_DWORD /d 1 /f > nul 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\Tcpip\Parameters" /v "MaxUserPort" /t REG_DWORD /d 0000fffe /f > nul 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\Tcpip\Parameters" /v "KeepAliveTime" /t REG_DWORD /d 006ddd00 /f > nul 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\Tcpip\Parameters" /v "EnableConnectionRateLimiting" /t REG_DWORD /d 0 /f > nul 2>&1
:: 18.4.11 (L2) Ensure 'MSS: (TcpMaxDataRetransmissions IPv6) How many times unacknowledged data is retransmitted' is set to 'Enabled: 3'
REG ADD "HKLM\System\CurrentControlSet\Services\Tcpip\Parameters" /v "TcpMaxDataRetransmissions" /t REG_DWORD /d 3 /f > nul 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\Tcpip6\Parameters" /v "TcpMaxDataRetransmissions" /t REG_DWORD /d 3 /f > nul 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\Tcpip\Parameters" /v "TcpCreateAndConnectTcbRateLimitDepth" /t REG_DWORD /d 0 /f > nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v IPAutoconfigurationEnable /t REG_DWORD /d 0 /f >NUL 2>&1
REG ADD "HKLM\SYSTEM\CurrentControlSet\Services\RasMan\Parameters" /v "DisableSavePassword" /t REG_DWORD /d 1 /f > nul 2>&1
:: Disable LMHOSTS Lookup on all adapters / 1 - Enable
REG ADD "HKLM\SYSTEM\CurrentControlSet\Services\NetBT\Parameters" /v "EnableLMHOSTS" /t REG_DWORD /d 0 /f > nul 2>&1
REG ADD "HKLM\SYSTEM\CurrentControlSet\Services\NetBT\Parameters" /v "NodeType" /t REG_DWORD /d 2 /f > nul 2>&1
:: https://www.stigviewer.com/stig/windows_server_2008_r2_member_server/2014-04-02/finding/V-4116
:: 18.4.7 (L1) Ensure 'MSS: (NoNameReleaseOnDemand) Allow the computer to ignore NetBIOS name release requests except from WINS servers' is set to 'Enabled'
reg ADD "HKLM\SYSTEM\CurrentControlSet\Services\Netbt\Parameters" /v NoNameReleaseOnDemand /t REG_DWORD /d 1 /f > nul 2>&1
REG ADD "HKLM\SYSTEM\CurrentControlSet\Services\Eventlog\Application" /v "MaxSize" /t REG_DWORD /d 0x10000 /f > nul 2>&1
REG ADD "HKLM\SYSTEM\CurrentControlSet\Services\Eventlog\Security" /v "MaxSize" /t REG_DWORD /d 0x10000 /f > nul 2>&1
REG ADD "HKLM\SYSTEM\CurrentControlSet\Services\Eventlog\Application" /v "System" /t REG_DWORD /d 0x10000 /f > nul 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\Tcpip\ServiceProvider" /v "LocalPriority" /t REG_DWORD /d 4 /f > nul 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\Tcpip\ServiceProvider" /v "HostsPriority" /t REG_DWORD /d 5 /f > nul 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\Tcpip\ServiceProvider" /v "DnsPriority" /t REG_DWORD /d 6 /f > nul 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\Tcpip\ServiceProvider" /v "NetbtPriority" /t REG_DWORD /d 7 /f > nul 2>&1
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "DoNotShowFeedbackNotifications" /t REG_DWORD /d 1 /f > nul 2>&1
REG ADD "HKLM\Software\Policies\Microsoft\WindowsInkWorkspace" /v "AllowSuggestedAppsInWindowsInkWorkspace" /t REG_DWORD /d 0 /f > nul 2>&1
:: Disable Game DVR and Game Bar / Disable the message "Press Win + G to open Game bar" / "Press Win + G to record a clip"
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\GameDVR" /v "AllowGameDVR" /t REG_DWORD /d 0 /f > nul 2>&1
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\GameDVR" /v "AppCaptureEnabled" /t REG_DWORD /d 0 /f > nul 2>&1
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\GameDVR" /v "HistoricalCaptureEnabled" /t REG_DWORD /d 0 /f > nul 2>&1
REG ADD "HKLM\SOFTWARE\Microsoft\WindowsRuntime\ActivatableClassId\Windows.Gaming.GameBar.PresenceServer.Internal.PresenceWriter" /v "ActivationType" /t REG_DWORD /d 1 /f > nul 2>&1
REG ADD "HKLM\SOFTWARE\Microsoft\WindowsRuntime\ActivatableClassId\Windows.Gaming.GameBar.PresenceServer.Internal.PresenceWriter" /v "CLSID" /t REG_SZ /d "{cbfd414c-5037-3c98-a85e-a5e7ca509cfc}" /f > nul 2>&1
REG ADD "HKLM\SOFTWARE\Microsoft\WindowsRuntime\ActivatableClassId\Windows.Gaming.GameBar.PresenceServer.Internal.PresenceWriter" /v "Server" /t REG_SZ /d "Windows.Gaming.GameBar.Internal.PresenceWriterServer" /f > nul 2>&1
REG ADD "HKLM\SOFTWARE\Microsoft\WindowsRuntime\ActivatableClassId\Windows.Gaming.GameBar.PresenceServer.Internal.PresenceWriter" /v "TrustLevel" /t REG_DWORD /d 0 /f > nul 2>&1

:: Disable Customer Experience Improvement (CEIP/SQM - Software Quality Management)
reg add "HKLM\SOFTWARE\Policies\Microsoft\SQMClient\Windows" /v "CEIPEnable" /t REG_DWORD /d 0 /f > nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\SQMClient" /v "CEIPEnable" /t REG_DWORD /d 0 /f > nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\SQMClient" /v "CorporateSQMURL" /t REG_SZ /d "0.0.0.0" /f > nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\SQMClient\IE" /v "CEIPEnable" /t REG_DWORD /d "0" /f >nul 2>&1
:: Disables CEIP for apps and generally
reg add "HKLM\SOFTWARE\Policies\Microsoft\AppV\CEIP" /v "CEIPEnable" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\SQMClient\IE" /v "SqmLoggerRunning" /t REG_DWORD /d "0" /f >nul 2>&1
:: Disable Application Impact Telemetry (AIT)
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "AITEnable" /t REG_DWORD /d 0 /f > nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "DisablePCA" /t REG_DWORD /d 1 /f > nul 2>&1
:: Disable Steps Recorder (Steps Recorder keeps a record of steps taken by the user, the data includes user actions such as keyboard input and mouse input user interface data and screen shots)
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "DisableUAR" /t REG_DWORD /d 1 /f > nul 2>&1
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\WINEVT\Channels\Microsoft-Windows-Application-Experience/Steps-Recorder" /v "Enabled" /t REG_DWORD /d "0" /f > nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "DisableInventory" /t REG_DWORD /d 1 /f > nul 2>&1
:: Do not allow apps to use advertising ID
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v "Enabled" /t REG_DWORD /d 0 /f > nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v "Id" /t REG_SZ /d "null" /f >nul 2>&1
:: Disable AD customization
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AdvertisingInfo" /v "DisabledByGroupPolicy" /t REG_DWORD /d 1 /f > nul 2>&1
::  18.8.22.1.3 (L2) Ensure 'Turn off handwriting personalization data sharing' is set to 'Enabled'
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\TabletPC" /v "PreventHandwritingDataSharing" /t REG_DWORD /d 1 /f > nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\HandwritingErrorReports" /v "PreventHandwritingErrorReports" /t REG_DWORD /d 1 /f > nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\InputPersonalization" /v AllowInputPersonalization /t REG_DWORD /d 0 /f >NUL 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" /t REG_DWORD /d 0 /f > nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" /t REG_DWORD /d 0 /f /REG:64 > nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortanaAboveLock" /t REG_DWORD /d 0 /f > nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "PreventIndexingUncachedExchangeFolders" /t REG_DWORD /d 1 /f > nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "PreventIndexingOfflineFiles" /t REG_DWORD /d 1 /f > nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowSearchToUseLocation" /t REG_DWORD /d 0 /f > nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "ConnectedSearchPrivacy" /t REG_DWORD /d 3 /f > nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "ConnectedSearchUseWeb" /t REG_DWORD /d 0 /f > nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "ConnectedSearchUseWeb" /t REG_DWORD /d 0 /f /reg:32 > nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "ConnectedSearchUseWebOverMeteredConnections" /t REG_DWORD /d 0 /f > nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "DisableWebSearch" /t REG_DWORD /d 1 /f > nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "PreventIndexOnBattery" /t REG_DWORD /d 1 /f > nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "PreventRemoteQueries" /t REG_DWORD /d 1 /f > nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "DisableRemovableDriveIndexing" /t REG_DWORD /d 1 /f > nul 2>&1
:: 18.9.64.5 (L1) Ensure 'Allow indexing of encrypted files' is set to 'Disabled'
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowIndexingEncryptedStoresOrItems" /t REG_DWORD /d 0 /f > nul 2>&1
:: Limite hard drive space for indexing
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "PreventIndexingLowDiskSpaceMB" /t REG_DWORD /d 500 /f > nul 2>&1
:: Disable Cortana in Taskbar search
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v "CortanaEnabled" /t REG_DWORD /d 0 /f > nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v "DisableSoftLanding" /t REG_DWORD /d 1 /f > nul 2>&1
:: 18.9.13.1 (L1) Ensure 'Turn off Microsoft consumer experiences' is set to 'Enabled'
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v "DisableWindowsConsumerFeatures" /t REG_DWORD /d 1 /f > nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v "DisableThirdPartySuggestions" /t REG_DWORD /d 1 /f > nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v "IncludeEnterpriseSpotlight" /t REG_DWORD /d 0 /f > nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Assistance\Client\1.0" /v "NoActiveHelp" /t REG_DWORD /d 1 /f > nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Assistance\Client\1.0" /v "NoImplicitFeedback" /t REG_DWORD /d 1 /f > nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Assistance\Client\1.0" /v "ImplicitFeedback" /t REG_DWORD /d 0 /f > nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Assistance\Client\1.0\Settings" /v "NoImplicitFeedback" /t REG_DWORD /d 1 /f > nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Assistance\Client\1.0\Settings" /v "ImplicitFeedback" /t REG_DWORD /d 0 /f > nul 2>&1
:: Disable Windows Defender Cloud
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" /v "SubmitSamplesConsent" /t REG_DWORD /d 2 /f > nul 2>&1
:: 18.9.45.3.2 (L2) Ensure 'Join Microsoft MAPS' is set to 'Disabled'
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" /v "SpyNetReporting" /t REG_DWORD /d 0 /f > nul 2>&1
:: 18.9.45.3.1 (L1) Ensure 'Configure local setting override for reporting to Microsoft MAPS' is set to 'Disabled'
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" /v "LocalSettingOverrideSpynetReporting" /t REG_DWORD /d 0 /f > nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" /v "DisableBlockAtFirstSeen" /t REG_DWORD /d 1 /f > nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" /v "DisableGenericReports" /t REG_DWORD /d 1 /f > nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Reporting" /v "DisableGenericReports" /t REG_DWORD /d 1 /f > nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" /v "DisableBehaviorMonitoring" /t REG_DWORD /d 1 /f > nul 2>&1
reg add "HKLM\SYSTEM\ControlSet001\Control\WMI\AutoLogger\AutoLogger-Diagtrack-Listener" /v "Start" /t REG_DWORD /d 0 /f > nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\AutoLogger\AutoLogger-Diagtrack-Listener" /v "Start" /t REG_DWORD /d 0 /f > nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\AutoLogger\SQMLogger" /v "Start" /t REG_DWORD /d 0 /f > nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Input\TIPC" /v "Enabled" /t REG_DWORD /d 0 /f > nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoDriveTypeAutoRun" /t REG_DWORD /d 255 /f > nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoAutorun" /t REG_DWORD /d 1 /f > nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "HideSCAHealth" /t REG_DWORD /d 1 /f > nul 2>&1
:: Display confirmation dialog when deleting files
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "ConfirmFileDelete" /t REG_DWORD /d 1 /f > nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoDetailsThumbnailOnNetwork" /t REG_DWORD /d 1 /f > nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoRecentDocsNetHood" /t REG_DWORD /d 1 /f > nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoRemoteChangeNotify" /t REG_DWORD /d 0 /f > nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoRemoteRecursiveEvents" /t REG_DWORD /d 1 /f > nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "StartRunNoHOMEPATH" /t REG_DWORD /d 1 /f > nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "UseDesktopIniCache" /t REG_DWORD /d 1 /f > nul 2>&1
:: Fix Slow-Loading Windows Icons by Increasing the Icon Cache
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "Max Cached Icons" /t REG_SZ /d 16384 /f > NUL 2>&1
reg add "HKLM\SOFTWARE\Microsoft\PolicyManager\default\Update\ExcludeWUDriversInQualityUpdates" /v "Value" /t REG_DWORD /d 0 /f > NUL 2>&1
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "AllowOnlineTips" /t REG_DWORD /d 0 /f > NUL 2>&1
:: https://www.stigviewer.com/stig/microsoft_internet_explorer_11/2015-06-30/finding/V-46989 
reg add "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer" /v "AllowServicePoweredQSA" /t REG_DWORD /d 0 /f > NUL 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\DomainSuggestion" /v "Enabled" /t REG_DWORD /d 0 /f > NUL 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\SQM" /v "DisableCustomerImprovementProgram" /t REG_DWORD /d 0 /f > NUL 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\SearchScopes" /v "TopResult" /t REG_DWORD /d 0 /f > NUL 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Suggested Sites" /v "Enabled" /t REG_DWORD /d 0 /f > NUL 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Main" /v "AutoSearch" /t REG_DWORD /d 0 /f > NUL 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Main" /v "TabProcGrowth" /t REG_SZ /d "Low" /f > NUL 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\ContinuousBrowsing" /v "Enabled" /t REG_DWORD /d 0 /f > NUL 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Restrictions" /v "NoCrashDetection" /t REG_DWORD /d 1 /f > NUL 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Main\WindowsSearch" /v "EnabledScopes" /t REG_DWORD /d 0 /f > NUL 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\FlipAhead" /v "Enabled" /t REG_DWORD /d 0 /f > nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Feeds" /v "BackgroundSyncStatus" /t REG_DWORD /d 0 /f > nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Feed Discovery" /v "Enabled" /t REG_DWORD /d 0 /f > nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Infodelivery\Restrictions" /v "NoUpdateCheck" /t REG_DWORD /d 1 /f > nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Infodelivery\Restrictions" /v "NoSplash" /t REG_DWORD /d 1 /f > nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer" /v "DisableFlashInIE" /t REG_DWORD /d 1 /f > nul 2>&1
:: 18.9.48.2 (L2) Ensure 'Allow Adobe Flash' is set to 'Disabled'
reg add "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Addons" /v "FlashPlayerEnabled" /t REG_DWORD /d 0 /f > nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\BooksLibrary" /v "AllowConfigurationUpdateForBooksLibrary" /t REG_DWORD /d 0 /f > nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\BooksLibrary" /v "EnableExtendedBooksTelemetry" /t REG_DWORD /d 0 /f > nul 2>&1
reg add "HKLM\SOFTWARE\WOW6432Node\Policies\Microsoft\MicrosoftEdge\BooksLibrary" /v "EnableExtendedBooksTelemetry" /t REG_DWORD /d 0 /f > nul 2>&1
:: Microsoft-provided website lists are not active
reg add "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\BrowserEmulation" /v "MSCompatibilityMode" /t REG_DWORD /d 0 /f > nul 2>&1
:: Turn off Search Companion content file updates - https://www.stigviewer.com/stig/windows_7/2014-04-02/finding/V-14258
reg add "HKLM\SOFTWARE\Policies\Microsoft\SearchCompanion" /v "DisableContentFileUpdates" /t REG_DWORD /d 0 /f > nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Internet Explorer\MAIN\FeatureControl\FEATURE_MAXCONNECTIONSPER1_0SERVER" /v explorer.exe /t REG_DWORD /d "8" /f > NUL 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Internet Explorer\MAIN\FeatureControl\FEATURE_MAXCONNECTIONSPERSERVER" /v explorer.exe /t REG_DWORD /d "8" /f > NUL 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Internet Explorer\MAIN\FeatureControl\FEATURE_MAXCONNECTIONSPER1_0SERVER" /v iexplore.exe /t REG_DWORD /d "8" /f > NUL 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Internet Explorer\MAIN\FeatureControl\FEATURE_MAXCONNECTIONSPERSERVER" /v iexplore.exe /t REG_DWORD /d "8" /f > NUL 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_LOCALMACHINE_LOCKDOWN" /v iexplore.exe /t REG_DWORD /d "0" /f > NUL 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Internet Explorer\MAIN" /V DNSPreresolution /t REG_DWORD /d "8" /f > NUL 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Internet Explorer\MAIN" /V Use_Async_DNS /t REG_SZ /d "yes" /f > NUL 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Ext" /v "IgnoreFrameApprovalCheck" /t REG_DWORD /d 1 /f > nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Ext" /V DisableAddonLoadTimePerformanceNotifications /t REG_DWORD /d "1" /f > NUL 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Ext" /V NoFirsttimeprompt /t REG_DWORD /d "1" /f > NUL 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Internet Explorer\Safety\PrivacIE" /V DisableInPrivateBlocking /t REG_DWORD /d "00000000" /f > NUL 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Internet Explorer\Safety\PrivacIE" /V DisableLogging /t REG_DWORD /d "00000000" /f > NUL 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Internet Explorer\Safety\PrivacIE" /V StartMode /t REG_DWORD /d "00000001" /f > NUL 2>&1
reg add HKLM\SOFTWARE\Policies\Microsoft\Windows\Maps /v AllowUntriggeredNetworkTrafficOnSettingsPage /t REG_DWORD /d 0 /f >NUL 2>&1
reg add HKLM\SOFTWARE\Policies\Microsoft\Windows\Maps /v AutoDownloadAndUpdateMapData /t REG_DWORD /d 0 /f >NUL 2>&1
reg add HKLM\SOFTWARE\SYSTEM\Maps /v AutoUpdateEnabled /t REG_DWORD /d 0 /f >NUL 2>&1
reg add HKLM\SOFTWARE\Policies\Microsoft\Windows\Messaging /v AllowMessageSync /t REG_DWORD /d 0 /f >NUL 2>&1

:: Treiberupdate verhindern
:: reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DriverSearching" /v SearchOrderConfig /t REG_DWORD /d 0 /f >NUL 2>&1
:: reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Device Metadata" /v PreventDeviceMetadataFromNetwork /t REG_DWORD /d 1 /f >NUL 2>&1

reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Speech" /v AllowSpeechModelUpdate /t REG_DWORD /d 0 /f >NUL 2>&1
:: Disable thumbnail cache removal
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Thumbnail Cache" /v Autorun /t REG_DWORD /d 0 /f >NUL 2>&1
reg add "HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Thumbnail Cache" /v Autorun /t REG_DWORD /d 0 /f >NUL 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v UseDefaultTile /t REG_DWORD /d 1 /f >NUL 2>&1
:: Disable Network Location Wizard prompts
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Network\NewNetworkWindowOff" /f >NUL 2>&1
::  Do not restart this device as soon as possible when a restart is required to install an update
reg add "HKLM\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /v IsExpedited /t REG_DWORD /d 0 /f >NUL 2>&1
REG DELETE HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{0DB7E03F-FC29-4DC6-9020-FF41B59E513A} /f >NUL 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\StorageSense" /v AllowStorageSenseGlobal /t REG_DWORD /d 1 /f >NUL 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\StorageSense" /v ConfigStorageSenseGlobalCadence /t REG_DWORD /d 7 /f >NUL 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\StorageSense" /v ConfigStorageSenseRecycleBinCleanupThreshold /t REG_DWORD /d 180 /f >NUL 2>&1
reg add "HKLM\Software\Policies\Microsoft\Windows\StorageHealth" /v AllowDiskHealthModelUpdates /t REG_DWORD /d 0 /f >NUL 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Explorer" /v NoUseStoreOpenWith /t REG_DWORD /d 1 /f >NUL 2>&1
reg add "HKLM\Software\Policies\Microsoft\Windows NT\CurrentVersion\Software Protection Platform" /v NoGenTicket /t REG_DWORD /d 1 /f >NUL 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v SystemResponsiveness /t REG_DWORD /d 0 /f >NUL 2>&1
Reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v NetworkThrottlingIndex /t REG_DWORD /d 4294967295 /f >NUL 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\LSASS.exe" /v AuditLevel /t REG_DWORD /d 8 /f >NUL 2>&1
:: reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\RunOnce" /v "!Run_PS01" /t REG_SZ /d "powershell -ex bypass -w hidden -file C:\Assets\Scripts\setNetworkPrivate.ps1" /f >NUL 2>&1
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\RunOnce" /v "!Install_OneDrive" /t REG_SZ /d "C:\Assets\OneDrive\OneDriveSetup.exe /allusers" /f >NUL 2>&1
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\RunOnce" /v "!Install_MSEdge" /t REG_SZ /d "msiexec /i C:\Assets\Edge\MicrosoftEdgeEnterpriseX64.msi" /f >NUL 2>&1
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\RunOnce" /v "!Install_CoreRuntime" /t REG_SZ /d "C:\Assets\Runtime\install.cmd" /f >NUL 2>&1
:: reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\RunOnce" /v "!Install_PowerToys" /t REG_SZ /d "msiexec /i C:\Assets\PowerToys\PowerToysSetup.msi /qb ALLUSERS=1" /f >NUL 2>&1
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\RunOnce" /v "!Install_PDF24" /t REG_SZ /d "C:\Assets\pdf24\install.cmd" /f >NUL 2>&1
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\RunOnce" /v "!Install_Adobe" /t REG_SZ /d "C:\Assets\Adobe\install.cmd" /f >NUL 2>&1
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\RunOnce" /v "!Install_JavaRuntime" /t REG_SZ /d "C:\Assets\Java\install.cmd" /f >NUL 2>&1
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\RunOnce" /v "!Install_7-Zip" /t REG_SZ /d "C:\Assets\7-Zip\install.cmd" /f >NUL 2>&1
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\RunOnce" /v "!Install_Greenshot" /t REG_SZ /d "C:\Assets\Greenshot\install.cmd" /f >NUL 2>&1
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\RunOnce" /v "!Install_Notepad++" /t REG_SZ /d "C:\Assets\Notepad++\install.cmd" /f >NUL 2>&1
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\RunOnce" /v "!Install_VisualC++" /t REG_SZ /d "C:\Assets\VisualC\install.cmd" /f >NUL 2>&1
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\RunOnce" /v "!Install_Vlc" /t REG_SZ /d "C:\Assets\VLC\install.cmd" /f >NUL 2>&1
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\RunOnce" /v "!Install_IrfanView" /t REG_SZ /d "C:\Assets\IrfanView\install.cmd" /f >NUL 2>&1
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\RunOnce" /v "!Install_Activation" /t REG_SZ /d "C:\Assets\Scripts\Windows_Activation.cmd" /f >NUL 2>&1
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\RunOnce" /v "!Install_Office" /t REG_SZ /d "C:\Assets\Office\install.cmd" /f >NUL 2>&1
:: reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\RunOnce" /v "!Install_WinUpdates" /t REG_SZ /d "C:\Assets\WinUpdates\install.cmd" /f >NUL 2>&1
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\RunOnce" /v "!Install_Computername" /t REG_SZ /d "C:\Assets\Computername\install.cmd" /f >NUL 2>&1
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\RunOnce" /v "!Install_WinGet" /t REG_SZ /d "C:\Assets\WinGet\install.cmd" /f >NUL 2>&1
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\RunOnce" /v "!Install_Teams" /t REG_SZ /d "C:\Assets\Teams\install.cmd" /f >NUL 2>&1
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\RunOnce" /v "!Install_Chrome" /t REG_SZ /d "C:\Assets\Chrome\install.cmd" /f >NUL 2>&1
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\RunOnce" /v "!Install_RegKiss" /t REG_SZ /d "cmd /c reg add \"HKCU\Control Panel\Desktop\WindowMetrics\" /v MinAnimate /t REG_SZ /d 0 /f" /f >NUL 2>&1
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\RunOnce" /v "!Install_Cleanup" /t REG_SZ /d "C:\Assets\Scripts\cleanup.cmd" /f >NUL 2>&1
reg delete "HKLM\SOFTWARE\Microsoft\Active Setup\Installed Components\{22d6f312-b0f6-11d0-94ab-0080c74c7e95}" /f >NUL 2>&1
reg delete "HKLM\SOFTWARE\Microsoft\Active Setup\Installed Components\{22d6f312-b0f6-11d0-94ab-0080c74c7e95}" /f /reg:32 >NUL 2>&1
reg delete "HKLM\SOFTWARE\Microsoft\Active Setup\Installed Components\{6BF52A52-394A-11d3-B153-00C04F79FAA6}" /f >NUL 2>&1
reg delete "HKLM\SOFTWARE\Microsoft\Active Setup\Installed Components\{6BF52A52-394A-11d3-B153-00C04F79FAA6}" /f /reg:32 >NUL 2>&1
reg delete "HKLM\SOFTWARE\Microsoft\Active Setup\Installed Components\{45ea75a0-a269-11d1-b5bf-0000f8051515}" /f >NUL 2>&1
reg delete "HKLM\SOFTWARE\Microsoft\Active Setup\Installed Components\{45ea75a0-a269-11d1-b5bf-0000f8051515}" /f /reg:32 >NUL 2>&1
reg delete "HKLM\SOFTWARE\Microsoft\Active Setup\Installed Components\{3af36230-a269-11d1-b5bf-0000f8051515}" /f >NUL 2>&1
reg delete "HKLM\SOFTWARE\Microsoft\Active Setup\Installed Components\{3af36230-a269-11d1-b5bf-0000f8051515}" /f /reg:32 >NUL 2>&1
reg delete "HKLM\SOFTWARE\Microsoft\Active Setup\Installed Components\{630b1da0-b465-11d1-9948-00c04f98bbc9}" /f >NUL 2>&1
reg delete "HKLM\SOFTWARE\Microsoft\Active Setup\Installed Components\{630b1da0-b465-11d1-9948-00c04f98bbc9}" /f /reg:32 >NUL 2>&1
:: Remove DOTNETFRAMEWORKS setup from Personalized Settings. Optimize this item will shorten new user first login time.
reg delete "HKLM\SOFTWARE\Microsoft\Active Setup\Installed Components\{89B4C1CD-B018-4511-B0A1-5476DBF70820}" /v StubPath /f >NUL 2>&1
reg delete "HKLM\SOFTWARE\Microsoft\Active Setup\Installed Components\{89B4C1CD-B018-4511-B0A1-5476DBF70820}" /v StubPath /f /reg:32 >NUL 2>&1
:: Remove Microsoft Internet Explorer ClearIconCache setup from Personlized Settings. Optimize this item will shorten new user first login time.
reg delete "HKLM\SOFTWARE\Microsoft\Active Setup\Installed Components\{2D46B6DC-2207-486B-B523-A557E6D54B47}" /v StubPath /f >NUL 2>&1
reg delete "HKLM\SOFTWARE\Microsoft\Active Setup\Installed Components\{2D46B6DC-2207-486B-B523-A557E6D54B47}" /v StubPath /f /reg:32 >NUL 2>&1
:: Remove Microsoft Internet Explorer Initializer setup from Personalized Settings. Optimize this item will shorten new user first login time.
reg delete "HKLM\SOFTWARE\Microsoft\Active Setup\Installed Components\{89820200-ECBD-11cf-8B85-00AA005B4383}" /v StubPath /f >NUL 2>&1
reg delete "HKLM\SOFTWARE\Microsoft\Active Setup\Installed Components\{89820200-ECBD-11cf-8B85-00AA005B4383}" /v StubPath /f /reg:32 >NUL 2>&1
:: Remove Microsoft Outlook MailNews Express setup from Personalized Settings. Optimize this item will shorten new user first login time.
reg delete "HKLM\SOFTWARE\Microsoft\Active Setup\Installed Components\{44BBA840-CC51-11CF-AAFA-00AA00B6015C}" /v StubPath /f >NUL 2>&1
reg delete "HKLM\SOFTWARE\Microsoft\Active Setup\Installed Components\{44BBA840-CC51-11CF-AAFA-00AA00B6015C}" /v StubPath /f /reg:32 >NUL 2>&1
:: Remove Themes setup from Personlized Settings. Optimize this item will shorten new user first login time.
reg delete "HKLM\SOFTWARE\Microsoft\Active Setup\Installed Components\{2C7339CF-2B09-4501-B3F3-F3508C9228ED}" /v StubPath /f >NUL 2>&1
reg delete "HKLM\SOFTWARE\Microsoft\Active Setup\Installed Components\{2C7339CF-2B09-4501-B3F3-F3508C9228ED}" /v StubPath /f /reg:32 >NUL 2>&1
:: Remove Windows Desktop Update setup from Personalized Settings. Optimize this item will shorten new user first login time.
reg delete "HKLM\SOFTWARE\Microsoft\Active Setup\Installed Components\{89820200-ECBD-11cf-8B85-00AA005B4340}" /v StubPath /f >NUL 2>&1
reg delete "HKLM\SOFTWARE\Microsoft\Active Setup\Installed Components\{89820200-ECBD-11cf-8B85-00AA005B4340}" /v StubPath /f /reg:32 >NUL 2>&1
:: Google Chrome Hardening
reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v DnsOverHttpsMode /t REG_SZ /d "automatic" /f >NUL 2>&1
reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v BackgroundModeEnabled /t REG_DWORD /d 0 /f >NUL 2>&1
reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v ImportSavedPasswords /t REG_DWORD /d 0 /f >NUL 2>&1
reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v MetricsReportingEnabled /t REG_DWORD /d 0 /f >NUL 2>&1
reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v SitePerProcess /t REG_DWORD /d 1 /f >NUL 2>&1
reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v ChromeCleanupEnabled /t REG_DWORD /d 0 /f >NUL 2>&1
reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v ChromeCleanupReportingEnabled /t REG_DWORD /d 0 /f >NUL 2>&1
reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v MetricsReportingEnabled /t REG_DWORD /d 0 /f >NUL 2>&1
reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v AdsSettingForIntrusiveAdsSites /t REG_DWORD /d 2 /f >NUL 2>&1
:: reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v BuiltInDnsClientEnabled /t REG_DWORD /d 0 /f >NUL 2>&1
reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v DownloadRestrictions /t REG_DWORD /d 0 /f >NUL 2>&1
reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v ShowCastIconInToolbar /t REG_DWORD /d 1 /f >NUL 2>&1
reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v SpellCheckServiceEnabled /t REG_DWORD /d 0 /f >NUL 2>&1
reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v TranslateEnabled /t REG_DWORD /d 0 /f >NUL 2>&1
reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v SafeBrowsingExtendedReportingEnabled /t REG_DWORD /d 0 /f >NUL 2>&1
reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v CloudReportingEnabled /t REG_DWORD /d 0 /f >NUL 2>&1
reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v NTPCardsVisible /t REG_DWORD /d 1 /f >NUL 2>&1
reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v NativeWindowOcclusionEnabled /t REG_DWORD /d 0 /f >NUL 2>&1
reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v NetworkPredictionOptions /t REG_DWORD /d 1 /f >NUL 2>&1
reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v SafeBrowsingForTrustedSourcesEnabled /t REG_DWORD /d 0 /f >NUL 2>&1
reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v SpellcheckEnabled /t REG_DWORD /d 0 /f >NUL 2>&1
reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v UserFeedbackAllowed /t REG_DWORD /d 0 /f >NUL 2>&1
reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v WPADQuickCheckEnabled /t REG_DWORD /d 1 /f >NUL 2>&1
reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v PasswordLeakDetectionEnabled /t REG_DWORD /d 1 /f >NUL 2>&1
reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v BlockThirdPartyCookies /t REG_DWORD /d 1 /f >NUL 2>&1
reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v UrlKeyedAnonymizedDataCollectionEnabled /t REG_DWORD /d 0 /f >NUL 2>&1
reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v DNSInterceptionChecksEnabled /t REG_DWORD /d 0 /f >NUL 2>&1
reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v PromotionalTabsEnabled /t REG_DWORD /d 0 /f >NUL 2>&1
reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v AllowDeletingBrowserHistory /t REG_DWORD /d 1 /f >NUL 2>&1
reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v PrintPreviewUseSystemDefaultPrinter /t REG_DWORD /d 1 /f >NUL 2>&1
reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v AbusiveExperienceInterventionEnforce /t REG_DWORD /d 1 /f >NUL 2>&1
reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v SafeBrowsingEnabled /t REG_DWORD /d 1 /f >NUL 2>&1
reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v DefaultCookiesSetting /t REG_DWORD /d 4 /f >NUL 2>&1
:: reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v ForceEphemeralProfiles /t REG_DWORD /d 1 /f >NUL 2>&1
reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v DefaultBrowserSettingEnabled /t REG_DWORD /d 0 /f >NUL 2>&1
reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v ProxyServerMode /t REG_DWORD /d 0 /f >NUL 2>&1
reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v ForceGoogleSafeSearch /t REG_DWORD /d 1 /f >NUL 2>&1
reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v SSLVersionMin /t REG_SZrvirr /d "tls1" /f >NUL 2>&1

reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\chrome.exe" /V UseLargePages /t REG_DWORD /d "00000001" /f > NUL 2>&1
REG add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\software_reporter_tool.exe" /v Debugger /t REG_SZ /d "C:\Windows\System32\taskkill.exe" /f >NUL 2>&1
reg add "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /v DisableTelemetry /t REG_DWORD /d 1 /f >NUL 2>&1
reg add "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /v DisableDefaultBrowserAgent /t REG_DWORD /d 1 /f >NUL 2>&1
:: Nvidia Fix for Low Latency (if it is not showing up in nvcp):
REG ADD "HKLM\\SYSTEM\CurrentControlSet\Services\nvlddmkm\FTS" /v EnableRID73779  /t REG_DWORD /d 1 /f >NUL 2>&1
REG ADD "HKLM\\SYSTEM\CurrentControlSet\Services\nvlddmkm\FTS" /v EnableRID73780  /t REG_DWORD /d 1 /f >NUL 2>&1
REG ADD "HKLM\\SYSTEM\CurrentControlSet\Services\nvlddmkm\FTS" /v EnableRID74361  /t REG_DWORD /d 1 /f >NUL 2>&1

REG ADD "HKLM\SOFTWARE\NVIDIA Corporation\Global\FTS" /v EnableRID44231  /t REG_DWORD /d 0 /f >NUL 2>&1
REG ADD "HKLM\SOFTWARE\NVIDIA Corporation\Global\FTS" /v EnableRID64640  /t REG_DWORD /d 0 /f >NUL 2>&1
REG ADD "HKLM\SOFTWARE\NVIDIA Corporation\Global\FTS" /v EnableRID66610  /t REG_DWORD /d 0 /f >NUL 2>&1
REG ADD "HKLM\SOFTWARE\NVIDIA Corporation\NvControlPanel2\Client" /v OptInOrOutPreference /t REG_DWORD /d 0 /f >NUL 2>&1
REG ADD "HKLM\SYSTEM\CurrentControlSet\services\NvTelemetryContainer" /v Start /t REG_DWORD /d 4 /f >NUL 2>&1
REG ADD "HKLM\SOFTWARE\NVIDIA Corporation\Global\Startup\SendTelemetryData" /v @ /t REG_DWORD /d 0 /f >NUL 2>&1
:: 18.5.4.1 (L1) Ensure 'Turn off multicast name resolution' is set to 'Enabled'
REG ADD "HKLM\Software\policies\Microsoft\Windows NT\DNSClient" /v "EnableMulticast" /t REG_DWORD /d "0" /f >NUL 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows NT\DNSClient" /v DisableSmartNameResolution /t REG_DWORD /d 1 /f >NUL 2>&1
REG ADD "HKLM\SYSTEM\CurrentControlSet\Control\NetworkProvider" /v "RestoreConnection" /t REG_DWORD /d "1" /f >NUL 2>&1
REG ADD "HKLM\SOFTWARE\Microsoft\Cryptography\Defaults\Provider\Microsoft Base Smart Card Crypto Provider" /v "AllowPrivateExchangeKeyImport" /t REG_DWORD /d 1 /f >NUL 2>&1
REG ADD "HKLM\SOFTWARE\Microsoft\Cryptography\Defaults\Provider\Microsoft Base Smart Card Crypto Provider" /v "AllowPrivateSignatureKeyImport" /t REG_DWORD /d 1 /f >NUL 2>&1
:: Disable Administrative Shares / 1 - Enable
REG ADD "HKLM\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" /v "AutoShareWks" /t REG_DWORD /d 0 /f >NUL 2>&1
:: REG ADD "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp" /v "PortNumber" /t REG_DWORD /d "9833" /f >NUL 2>&1
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\DateTime\Servers" /v "1" /t REG_SZ /d "at.pool.ntp.org" /f >NUL 2>&1
REG ADD "HKLM\SYSTEM\CurrentControlSet\Services\W32Time\Parameters" /v "NtpServer" /t REG_SZ /d "at.pool.ntp.org,0x8" /f >NUL 2>&1
:: REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\microphone" /v "Value" /t REG_SZ /d "Deny" /f >NUL 2>&1
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v EnableLinkedConnections /t REG_DWORD /d 1 /f >NUL 2>&1
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v EnableVirtualization /t REG_DWORD /d 1 /f >NUL 2>&1
REG ADD "HKLM\SYSTEM\CurrentControlSet\Services\Beep" /v Start /t REG_DWORD /d 4 /f >NUL 2>&1
:: Hide User - https://www.windowscentral.com/how-hide-specific-user-accounts-sign-screen-windows-10
reg ADD "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\SpecialAccounts\UserList" /v "backup" /d 0 /t REG_DWORD /f >NUL 2>&1
:: Users do not need to press Ctl-Alt-Delete to log into the system
reg ADD "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "disablecad" /d 1 /t REG_DWORD /f >NUL 2>&1
reg ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "disablecad" /d 1 /t REG_DWORD /f >NUL 2>&1
reg ADD "HKLM\SYSTEM\CurrentControlSet\Control\Print" /v "PortThreadPriority" /d 1 /t REG_DWORD /f >NUL 2>&1
reg ADD "HKLM\SYSTEM\CurrentControlSet\Control\Print" /v "NetPrinterDecayPeriode" /d 600000 /t REG_DWORD /f >NUL 2>&1
:: Disable Timeline
:: REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "EnableActivityFeed" /d "0" /t REG_DWORD /f >NUL 2>&1
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "PublishUserActivities" /d "1" /t REG_DWORD /f >NUL 2>&1
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "UploadUserActivities" /d "0" /t REG_DWORD /f >NUL 2>&1
:: Local users on domain-joined computers must not be enumerated - https://www.stigviewer.com/stig/windows_8/2013-10-01/finding/V-36684
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "EnumerateLocalUsers" /d "0" /t REG_DWORD /f >NUL 2>&1
:: Connected users on domain-joined computers must not be enumerated - https://www.stigviewer.com/stig/windows_8/2013-07-03/finding/V-36683
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "DontEnumerateConnectedUsers" /d "0" /t REG_DWORD /f >NUL 2>&1

:: App access turn off camera
:: REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\webcam" /v "Value" /d "Deny" /t REG_SZ /f >NUL 2>&1
:: Disable app diag info about your other apps
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\appDiagnostics" /v "Value" /d "Deny" /t REG_SZ /f >NUL 2>&1
:: do not allow apps to access your file system
:: REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\broadFileSystemAccess" /v "Value" /d "Deny" /t REG_SZ /f >NUL 2>&1
:: do not allow apps to access your contacts
:: REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\contacts" /v "Value" /d "Deny" /t REG_SZ /f >NUL 2>&1
:: Do not allow apps to access microphone
:: REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\microphone" /v "Value" /d "Deny" /t REG_SZ /f >NUL 2>&1
:: Do not allow apps to access Notifications
:: REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userNotificationListener" /v "Value" /d "Deny" /t REG_SZ /f >NUL 2>&1
:: Do not allow apps to access Account Information
:: REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userAccountInformation" /v "Value" /d "Deny" /t REG_SZ /f >NUL 2>&1
:: Do not allow apps to access calendar
:: REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\appointments" /v "Value" /d "Deny" /t REG_SZ /f >NUL 2>&1
:: Do not allow apps to access call history
:: REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\phoneCallHistory" /v "Value" /d "Deny" /t REG_SZ /f >NUL 2>&1
:: Do not Allow apps to access email 
:: REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\email" /v "Value" /d "Deny" /t REG_SZ /f >NUL 2>&1
:: Do not allow apps to access tasks
:: REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userDataTasks" /v "Value" /d "Deny" /t REG_SZ /f >NUL 2>&1
:: Do not allow apps to access messaging
:: REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\chat" /v "Value" /d "Deny" /t REG_SZ /f >NUL 2>&1
:: Do Not allow apps to access radio
:: REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\radios" /v "Value" /d "Deny" /t REG_SZ /f >NUL 2>&1
:: do not allow apps to access other devices
:: REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\bluetoothSync" /v "Value" /d "Deny" /t REG_SZ /f >NUL 2>&1
:: do not allow apps to access Documents
:: REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\documentsLibrary" /v "Value" /d "Deny" /t REG_SZ /f >NUL 2>&1
:: do not allow apps to access Pictures
:: REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\picturesLibrary" /v "Value" /d "Deny" /t REG_SZ /f >NUL 2>&1
:: do not allow apps to access Videos
:: REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\videosLibrary" /v "Value" /d "Deny" /t REG_SZ /f >NUL 2>&1

:: Run for all user once at logon
:: https://helgeklein.com/blog/2010/04/active-setup-explained/
REG ADD "HKLM\SOFTWARE\Microsoft\Active Setup\Installed Components\{e0b0c0a5-cad6-40d5-8275-18d6cce7a5d4}" /v "Version" /d "1,0" /t REG_SZ /f >NUL 2>&1
REG ADD "HKLM\SOFTWARE\Microsoft\Active Setup\Installed Components\{e0b0c0a5-cad6-40d5-8275-18d6cce7a5d4}" /v "StubPath" /d "cmd /c reg add \"HKCU\Control Panel\Desktop\WindowMetrics\" /v MinAnimate /t REG_SZ /d 0 /f" /t REG_EXPAND_SZ /f >NUL 2>&1
REG ADD "HKLM\SOFTWARE\Wow6432Node\Microsoft\Active Setup\Installed Components\{e0b0c0a5-cad6-40d5-8275-18d6cce7a5d4}" /v "Version" /d "1,0" /t REG_SZ /f >NUL 2>&1
REG ADD "HKLM\SOFTWARE\Wow6432Node\Microsoft\Active Setup\Installed Components\{e0b0c0a5-cad6-40d5-8275-18d6cce7a5d4}" /v "StubPath" /d "cmd /c reg add \"HKCU\Control Panel\Desktop\WindowMetrics\" /v MinAnimate /t REG_SZ /d 0 /f" /t REG_EXPAND_SZ /f >NUL 2>&1

:: Computer Description
REG ADD "HKLM\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" /v "srvcomment" /d "W10 - Hardening by iT.SALE" /t REG_SZ /f >NUL 2>&1

:: Office Security
reg add "HKLM\Software\Microsoft\Office\16.0\Common\COM Compatibility" /v "ActivationFilterOverride" /t REG_DWORD /d 0 /f >NUL 2>&1
reg add "HKLM\Software\Microsoft\Office\16.0\Common\COM Compatibility" /v "Compatibility Flags" /t REG_DWORD /d 1024 /f >NUL 2>&1

:: Disable Windows Admin Center Notification 
reg add HKLM\SOFTWARE\Microsoft\ServerManager /v DoNotPopWACConsoleAtSMLaunch /d 1 /t REG_DWORD /f >NUL 2>&1

:: Extend Windows file path support from 260 to to 1024 characters
reg add HKLM\SYSTEM\CurrentControlSet\Control\FileSystem /v LongPathsEnabled /d 1 /t REG_DWORD /f >NUL 2>&1
reg add HKLM\SYSTEM\CurrentControlSet\Control\FileSystem /v NtfsAllowExtendedCharacter8dot3Rename /d 0 /t REG_DWORD /f >NUL 2>&1
reg add HKLM\SYSTEM\CurrentControlSet\Control\FileSystem /v NtfsBugcheckOnCorrupt /d 0 /t REG_DWORD /f >NUL 2>&1
reg add HKLM\SYSTEM\CurrentControlSet\Control\FileSystem /v NtfsDisableCompression /d 0 /t REG_DWORD /f >NUL 2>&1
reg add HKLM\SYSTEM\CurrentControlSet\Control\FileSystem /v NtfsEncryptPagingFile /d 0 /t REG_DWORD /f >NUL 2>&1
reg add HKLM\SYSTEM\CurrentControlSet\Control\FileSystem /v NtfsMemoryUsage /d 0 /t REG_DWORD /f >NUL 2>&1
reg add HKLM\SYSTEM\CurrentControlSet\Control\FileSystem /v NtfsMftZoneReservation /d 4 /t REG_DWORD /f >NUL 2>&1
reg add HKLM\SYSTEM\CurrentControlSet\Control\FileSystem /v RefsDisableLastAccessUpdate /d 1 /t REG_DWORD /f >NUL 2>&1
reg add HKLM\SYSTEM\CurrentControlSet\Control\FileSystem /v UdfsSoftwareDefectManagement /d 0 /t REG_DWORD /f >NUL 2>&1
reg add HKLM\SYSTEM\CurrentControlSet\Control\FileSystem /v Win31FileSystem /d 0 /t REG_DWORD /f >NUL 2>&1
reg add HKLM\SYSTEM\CurrentControlSet\Control\FileSystem /v FileNameCache /d 400 /t REG_DWORD /f >NUL 2>&1
reg add HKLM\SYSTEM\CurrentControlSet\Control\FileSystem /v PathCache /d 80 /t REG_DWORD /f >NUL 2>&1
:: 1 - NTFS does not create short file names
reg add HKLM\SYSTEM\CurrentControlSet\Control\FileSystem /v NtfsDisable8dot3NameCreation /d 1 /t REG_DWORD /f >NUL 2>&1
:: 1 - When listing directories, NTFS does not update the last-access timestamp, and it does not record time stamp updates in the NTFS log
reg add HKLM\SYSTEM\CurrentControlSet\Control\FileSystem /v NTFSDisableLastAccessUpdate /d 1 /t REG_DWORD /f >NUL 2>&1
reg add HKLM\SYSTEM\CurrentControlSet\Control\FileSystem /v ContigFileAllocSize /d 600 /t REG_DWORD /f >NUL 2>&1

:: Media Player Updates - Prevent Windows Media DRM Internet Access
reg add HKLM\SOFTWARE\Policies\Microsoft\WMDRM /v DisableOnline /d 1 /t REG_DWORD /f >NUL 2>&1

:: File in use solution
reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\ShellTaskScheduler /v MaxWorkerThreadsPerScheduler /d 255 /t REG_DWORD /f >NUL 2>&1

:: Systemcode im RAM behalten (kein Auslagern)
:: Drivers and the kernel can be paged to disk as needed / 1 - Drivers and the kernel must remain in physical memory
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v DisablePagingExecutive /d 1 /t REG_DWORD /f >NUL 2>&1
reg add "HKLM\SYSTEM\ControlSet001\Control\Session Manager\Memory Management" /v "DisablePagingExecutive" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SYSTEM\ControlSet002\Control\Session Manager\Memory Management" /v "DisablePagingExecutive" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v MapAllocationFragment /d 20000 /t REG_DWORD /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v NonPagedPoolSize /d 192 /t REG_DWORD /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v PagedPoolSize /d 192 /t REG_DWORD /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v NonPagedPoolQuota /d 0 /t REG_DWORD /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v PagedPoolQuota /d 0 /t REG_DWORD /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v PhysicalAddressExtension /d 1 /t REG_DWORD /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v SessionPoolSize /d 48 /t REG_DWORD /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v SessionViewSize /d 96 /t REG_DWORD /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v SystemPages /d 0 /t REG_DWORD /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v PoolUsageMaximum /d 60 /t REG_DWORD /f >NUL 2>&1
::  Establishes a standard size file-system cache of approximately 8 MB / 1 - Establishes a large system cache working set that can expand to physical memory, minus 4 MB, if needed
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v LargeSystemCache /d 0 /t REG_DWORD /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v ClearPageFileAtShutdown /d 0 /t REG_DWORD /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v IoPageLockLimit /d 8000000 /t REG_DWORD /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v EnableBoottrace /d 0 /t REG_DWORD /f >NUL 2>&1
:: Disable Prefetch / 1 - Enable Prefetch when the application starts / 2 - Enable Prefetch when the device starts up / 3 - Enable Prefetch when the application or device starts up
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v EnablePrefetcher /d 0 /t REG_DWORD /f >NUL 2>&1
:: Disable SuperFetch / 1 - Enable SuperFetch when the application starts up / 2 - Enable SuperFetch when the device starts up / 3 - Enable SuperFetch when the application or device starts up
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v EnableSuperfetch /d 0 /t REG_DWORD /f >NUL 2>&1

:: AV Ausnahmen
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Exclusions\Paths" /v "C:\Assets" /d 0 /t REG_SZ /f >NUL 2>&1
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Exclusions\Paths" /v "C:\Drivers" /d 0 /t REG_SZ /f >NUL 2>&1
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Exclusions\Paths" /v "%ProgramFiles%\RDP Wrapper /d 0 /t REG_SZ /f >NUL 2>&1
:: Dont report Infections to Microsoft
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\MRT" /v "DontReportInfectionInformation" /d 1 /t REG_DWORD /f >NUL 2>&1
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\MRT" /v "DontOfferThroughWUAU" /d 1 /t REG_DWORD /f >NUL 2>&1

:: Write only Errors in Spooler Warning Events
REG ADD "HKLM\System\CurrentControlSet\Control\Print\Providers" /v "EventLog" /d 1 /t REG_SZ /f >NUL 2>&1

:: UDP Improve Performance
reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "DoNotHoldNICBuffers" /t REG_DWORD /d 1 /f > nul
reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "DynamicSendBufferDisable" /t REG_DWORD /d 0 /f > nul
reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "FastSendDatagramThreshold" /t REG_DWORD /d 1500 /f > nul
reg add "hklm\system\currentcontrolset\services\AFD\parameters" /v "fastcopyreceivethreshold" /t reg_dword /d "1500" /f > nul
reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "MaxActiveTransmitFileCount" /t REG_DWORD /d 0 /f > nul
reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "MaxFastCopyTransmit" /t REG_DWORD /d 256 /f > nul
reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "PriorityBoost" /t REG_DWORD /d 0 /f > nul
reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "TransmitWorker" /t REG_DWORD /d 20 /f > nul
reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "DefaultReceiveWindow" /t REG_DWORD /d 200000 /f > nul
reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "DefaultSendWindow" /t REG_DWORD /d 200000 /f > nul

:: Thread priority tuning parameters for the print spooler service
reg add HKLM\SYSTEM\CurrentControlSet\Control\Print /v SNMPLegacy /d 1 /t REG_DWORD /f >NUL 2>&1
reg add HKLM\SYSTEM\CurrentControlSet\Control\Print /v SpoolerPriority /d 40 /t REG_DWORD /f >NUL 2>&1
reg add HKLM\SYSTEM\CurrentControlSet\Control\Print /v RouterCacheSize /d 20 /t REG_DWORD /f >NUL 2>&1

:: Turn off System Maintenance
reg add HKLM\SOFTWARE\Microsoft\Windows\ScheduledDiagnostics /v EnabledExecution /d 0 /t REG_DWORD /f >NUL 2>&1

:: Windows Media Player Skip EULA + First Time usage dialog
reg add HKLM\SOFTWARE\Microsoft\MediaPlayer\Preferences /v AcceptedEULA /d 1 /t REG_DWORD /f >NUL 2>&1
reg add HKLM\SOFTWARE\Microsoft\MediaPlayer\Preferences /v FirstTime /d 1 /t REG_DWORD /f >NUL 2>&1
reg add HKLM\SOFTWARE\Policies\Microsoft\WindowsMediaPlayer /v GroupPrivacyAcceptance /d 1 /t REG_DWORD /f >NUL 2>&1

:: Prevent toast notifications from appearing on lock screen
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\PushNotifications" /v NoToastApplicationNotificationOnLockScreen /t REG_DWORD /d 1 /f >NUL 2>&1

:: Record command line data in process creation events eventid 4688
:: reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\Audit" /v ProcessCreationIncludeCmdLine_Enabled /t REG_DWORD /d 1 /f >NUL 2>&1
:: Enable events auditing generated when a process is created or starts
:: auditpol /set /subcategory:"{0CCE922B-69AE-11D9-BED3-505054503030}" /success:enable /failure:enable >NUL 2>&1

:: Priority Games
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Affinity" /t REG_DWORD /d 0 /f >NUL 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Clock Rate" /t REG_DWORD /d 2710 /f >NUL 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v Priority /t REG_DWORD /d 6 /f >NUL 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "GPU Priority" /t REG_DWORD /d 8 /f >NUL 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Background Only" /t REG_SZ /d "False" /f >NUL 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Scheduling Category" /t REG_SZ /d "High" /f >NUL 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "SFIO Priority" /t REG_SZ /d "High" /f >NUL 2>&1

:: Intel CPU: Deaktivieren Sie Risikominderungen für CVE-2017-5715 (Spectre Variante 2) und CVE-2017-5754 (Meltdown) - https://support.microsoft.com/de-de/help/4072698/windows-server-speculative-execution-side-channel-vulnerabilities
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v FeatureSettingsOverride /t REG_DWORD /d 3 /f >NUL 2>&1
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v FeatureSettingsOverrideMask /t REG_DWORD /d 3 /f >NUL 2>&1

:: Default value is 100 decimal.
:: Basically "Core parking" means that the OS can use less CPU cores when they are not needed, and saving power.
:: This, however, can somewhat hamper performance, so advanced users prefer to disable this feature.
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\0cc5b647-c1df-4637-891a-dec35c318583" /v "ValueMax" /t REG_DWORD /d 0 /f  > nul 2>&1

:: Priority
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\PriorityControl" /v IRQ8Priority /t REG_DWORD /d 1 /f >NUL 2>&1
:: Win32PrioritySeparation Default = 2 https://www.howto-connect.com/how-to-tweak-win32priorityseparation-in-windows-10/
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\PriorityControl" /v Win32PrioritySeparation /t REG_DWORD /d 38 /f >NUL 2>&1

:: Cursor Update
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Input\Settings\ControllerProcessor\CursorSpeed" /v CursorUpdateInterval /t REG_DWORD /d 1 /f >NUL 2>&1

:: Enabled Advanced Settings
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Lsa" /v SCENoApplyLegacyAuditPolicy /t REG_DWORD /d 1 /f >NUL 2>&1
Auditpol /set /subcategory:"Logoff" /success:enable /failure:disable >NUL 2>&1
Auditpol /set /subcategory:"Logon" /success:enable /failure:enable >NUL 2>&1

:: https://gist.github.com/ricardojba/ecdfe30dadbdab6c514a530bc5d51ef6

:: VM Time Sync deaktivieren
:: reg add HKLM\SYSTEM\CurrentControlSet\Services\W32Time\TimeProviders\VMICTimeProvider /v Enabled /t reg_dword /d 0 /f >NUL 2>&1
reg add HKLM\SYSTEM\CurrentControlSet\Services\W32Time\TimeProviders\NtpClient /v SpecialPollInterval /t REG_DWORD /d 1 /f >NUL 2>&1

:: no QoS
reg add HKLM\SOFTWARE\Policies\Microsoft\Windows\Psched /v NonBestEffortLimit /d 0 /t REG_DWORD /f >NUL 2>&1
reg add "HKLM\System\CurrentControlSet\Services\Tcpip\QoS" /v "Do not use NLA" /t REG_SZ /d "1" /f >NUL 2>&1

:: HDD Activity off
reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Reliability /v TimeStampInterval /t REG_DWORD /d 0 /f >NUL 2>&1

:: Disable Bluetooth ads
reg add "HKLM\SOFTWARE\Microsoft\PolicyManager\current\device\Bluetooth" /v "AllowAdvertising" /t REG_DWORD /d "0" /f >nul 2>&1

:: Disable Experiments
reg add "HKLM\SOFTWARE\Microsoft\PolicyManager\current\device\System" /v "AllowExperimentation" /t REG_DWORD /d "0" /f >nul 2>&1

:: Disable address bar drop-down list to minimize connections from Microsoft Edge to Microsoft services
reg add "HKLM\SOFTWARE\Microsoft\PolicyManager\current\device\Browser" /v "AllowAddressBarDropdown" /t REG_DWORD /d "0" /f >nul 2>&1

:: Patch Windows MRT data leaks
reg add "HKLM\SOFTWARE\Microsoft\RemovalTools\MpGears" /v "HeartbeatTrackingIndex" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\RemovalTools\MpGears" /v "SpyNetReportingLocation" /t REG_SZ /d "0" /f >nul 2>&1

:: Ordner unter Dieser PC entfernen Neue Variante unter Windows 10
:: 3D-Objekte Hide/Show
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{0ddd015d-b06c-45d5-8c4c-f59713854639}\PropertyBag" /v "ThisPCPolicy" /t REG_SZ /d "Hide" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{0ddd015d-b06c-45d5-8c4c-f59713854639}\PropertyBag" /v "ThisPCPolicy" /t REG_SZ /d "Hide" /f >nul 2>&1

:: Enable RDP
REG ADD "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server" /v "fDenyTSConnections" /d 0 /t REG_DWORD /f >nul 2>&1
REG ADD "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp" /v "fEnableWinStation" /d 1 /t REG_DWORD /f >nul 2>&1
REG ADD "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp" /v "UserAuthentication" /d 1 /t REG_DWORD /f >nul 2>&1
:: REG ADD "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp" /v "SecurityLayer" /d 2 /t REG_DWORD /f >nul 2>&1
netsh advfirewall firewall add rule name="Remote Desktop" dir=in localport=3389 protocol=TCP action=allow >nul 2>&1

:: Disable update and restart
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "NoAutoRebootWithLoggedOnUsers" /d 1 /t REG_DWORD /f >nul 2>&1

:: Patch Link-local Multicast Name Resolution
reg add "HKLM\SYSTEM\ControlSet001\Services\Dnscache\Parameters" /v "DisableParallelAandAAAA" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SYSTEM\ControlSet002\Services\Dnscache\Parameters" /v "DisableParallelAandAAAA" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters" /v "DisableParallelAandAAAA" /t REG_DWORD /d "1" /f >nul 2>&1

:: Disable NDU = Network Diagnostic Usage
reg add "HKLM\SYSTEM\ControlSet001\Services\Ndu" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1

:: UDP IP Tweak
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters" /v "NegativeCacheTime" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters" /v "NegativeSOACacheTime" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters" /v "NetFailureCacheTime" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters" /v "MaximumUdpPacketSize" /t REG_DWORD /d "00001300" /f >nul 2>&1

:: Patch IGMP
:: reg add "HKLM\SYSTEM\ControlSet001\Services\Tcpip\Parameters" /v "IGMPLevel" /t REG_DWORD /d "0" /f >nul 2>&1
:: reg add "HKLM\SYSTEM\ControlSet002\Services\Tcpip\Parameters" /v "IGMPLevel" /t REG_DWORD /d "0" /f >nul 2>&1
:: reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "IGMPLevel" /t REG_DWORD /d "0" /f >nul 2>&1

:: Patch Web Proxy Auto Discovery
netsh winhttp reset proxy >nul 2>&1
reg add "HKLM\SYSTEM\ControlSet001\Services\Tcpip\Parameters" /v "UseDomainNameDevolution" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\ControlSet002\Services\Tcpip\Parameters" /v "UseDomainNameDevolution" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "UseDomainNameDevolution" /t REG_DWORD /d "0" /f >nul 2>&1

:: Disable Teredo/IPv6 tunneling
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\TCPIP\v6Transition" /v "Teredo_State" /t REG_SZ /d "Disabled" /f >nul 2>&1
netsh int teredo set state disabled >nul 2>&1

:: Disable Remote Assistance
reg add "HKLM\SYSTEM\ControlSet001\Control\Remote Assistance" /v "fAllowToGetHelp" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\ControlSet002\Control\Remote Assistance" /v "fAllowToGetHelp" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Remote Assistance" /v "fAllowToGetHelp" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\ControlSet001\Control\Remote Assistance" /v "fAllowFullControl" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\ControlSet002\Control\Remote Assistance" /v "fAllowFullControl" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Remote Assistance" /v "fAllowFullControl" /t REG_DWORD /d "0" /f >nul 2>&1

:: Patch Contacts leaks from personalization settings
reg add "HKLM\SOFTWARE\Microsoft\Input\Settings" /v "HarvestContacts" /t REG_DWORD /d "0" /f >nul 2>&1

:: Cancel the Disk Check when Windows starts
reg add "HKLM\SYSTEM\ControlSet001\Control\Session Manager" /v "BootExecute" /t REG_MULTI_SZ /d "\0" /f >nul 2>&1
reg add "HKLM\SYSTEM\ControlSet002\Control\Session Manager" /v "BootExecute" /t REG_MULTI_SZ /d "\0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager" /v "BootExecute" /t REG_MULTI_SZ /d "\0" /f >nul 2>&1

:: Optimized RDP-Settings - https://techcommunity.microsoft.com/t5/ask-the-performance-team/terminal-services-and-graphically-intensive-applications/ba-p/373856
reg add "HKLM\Software\Microsoft\Terminal Server Client" /v "Min Send Interval" /t REG_DWORD /d 1 /f >NUL 2>&1
reg add "HKLM\Software\Microsoft\Terminal Server Client" /v "Keep Alive Interval" /t REG_DWORD /d 1 /f >NUL 2>&1
reg add "HKLM\Software\Microsoft\Terminal Server Client" /v "BitmapCacheSize" /t REG_DWORD /d 65535 /f >NUL 2>&1
reg add "HKLM\Software\Microsoft\Terminal Server Client" /v "Order Draw Threshold" /t REG_DWORD /d 1 /f >NUL 2>&1

:: Startupdelay - https://www.maketecheasier.com/disable-startup-delay-in-windows/
:: How long in milliseconds you want to have for a startup delay time for desktop apps that run at startup to load
reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Serialize /v StartupDelayInMSec /t REG_DWORD /d 0 /f >NUL 2>&1

:: Kernisolierung deaktivieren - Probleme mit Gerätertreiber und Virtualbox
reg add HKLM\SYSTEM\CurrentControlSet\Control\DeviceGuard\Scenarios\HypervisorEnforcedCodeIntegrity /v Enabled /t REG_DWORD /d 0 /f >NUL 2>&1

:: Turns off Windows blocking installation of files downloaded from the internet
:: Disable Security warning to unblock the downloaded file
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Attachments" /v SaveZoneInformation /t REG_DWORD /d 1 /f > NUL 2>&1

:: Abrufen von Gerätemetadaten aus dem Internet verhindern - https://www.stigviewer.com/stig/windows_server_2012_member_server/2014-01-07/finding/V-21964
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Device Metadata" /v PreventDeviceMetadataFromNetwork /t REG_DWORD /d 1 /f > NUL 2>&1

:: Stündliche Festplattenchecks deaktivieren - Hard disk keeps waking up every 65 Minutes
reg add "HKLM\SYSTEM\CurrentControlSet\Control\StorPort" /v TelemetryPerformanceEnabled /t REG_DWORD /d 0 /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\StorPort" /v TelemetryErrorDataEnabled /t REG_DWORD /d 0 /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\StorPort" /v TelemetryDeviceHealthEnabled /t REG_DWORD /d 0 /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\StorPort" /v LogControlEnable /t REG_DWORD /d 0 /f >NUL 2>&1

:: Autorun CMD DOS-Fenster modifizieren
reg add "HKLM\SOFTWARE\Microsoft\Command Processor" /v Autorun /t REG_SZ /d "C:\Assets\Scripts\Autorun.cmd /f >NUL 2>&1

:: Treiberverzeichnis erweitern - https://docs.microsoft.com/en-us/windows-hardware/drivers/install/how-windows-selects-a-driver-for-a-device
REG ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion /V DevicePath /T REG_MULTI_SZ /S ! /D "%SystemRoot%\inf;%Systemdrive%\Drivers" /f >NUL 2>&1

:: DefaultTTL von 128 auf 64 ändern
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v DefaultTTL /t REG_DWORD /d 64 /f >NUL 2>&1
:: Enable TCP/IP Task Offload
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v DisableTaskOffload /t REG_DWORD /d 0 /f >NUL 2>&1

:: https://github.com/rticommunity/rtiperftest/blob/master/srcDoc/tuning_os.rst
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v MaximumReassemblyHeaders /t REG_DWORD /d 65535 /f >NUL 2>&1

:: LastActiveClick - https://www.windows-faq.de/2018/02/05/lastactiveclick-immer-auf-zuletzt-geoeffneten-tab-der-taskleiste-zurueckwechseln/
REG ADD "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v LastActiveClick /t REG_DWORD /d 1 /f >NUL 2>&1

:: turning off the Security Check Settings
REG ADD "HKLM\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /V "1806" /t REG_DWORD /d "0" /F >NUL 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Security" /v "DisableSecuritySettingsCheck" /t REG_DWORD /d 1 /f > nul 2>&1

:: Disable IPv6 correctly - https://www.gruppenrichtlinien.de/artikel/ipv6-deaktivieren-das-protokoll-nicht-die-bindung
:: 18.5.19.2.1 (L2) Disable IPv6 (Ensure TCPIP6 Parameter 'DisabledComponents' is set to '0xff (255)')
REG ADD "HKLM\SYSTEM\CurrentControlSet\services\TCPIP6\Parameters" /v "EnableICSIPv6" /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip6\Parameters" /v "DisabledComponents" /t REG_DWORD /d "255" /f >nul 2>&1

:: Fake MDM-Enrollment - Key 1 of 2 - let a Win10 v1809, v1903, v1909, v2004 Machine "feel" MDM-Managed
reg add "HKLM\SOFTWARE\Microsoft\Enrollments\FFFFFFFF-FFFF-FFFF-FFFF-FFFFFFFFFFFF" /v "EnrollmentState" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Enrollments\FFFFFFFF-FFFF-FFFF-FFFF-FFFFFFFFFFFF" /v "EnrollmentType" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Enrollments\FFFFFFFF-FFFF-FFFF-FFFF-FFFFFFFFFFFF" /v "IsFederated" /t REG_DWORD /d "0" /f >nul 2>&1
:: Fake MDM-Enrollment - Key 2 of 2 - let a Win10 v1809, v1903, v1909, v2004 Machine "feel" MDM-Managed
reg add "HKLM\SOFTWARE\Microsoft\Provisioning\OMADM\Accounts\FFFFFFFF-FFFF-FFFF-FFFF-FFFFFFFFFFFF" /v "Flags" /t REG_DWORD /d "00d6fb7f" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Provisioning\OMADM\Accounts\FFFFFFFF-FFFF-FFFF-FFFF-FFFFFFFFFFFF" /v "RoamingCount" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Provisioning\OMADM\Accounts\FFFFFFFF-FFFF-FFFF-FFFF-FFFFFFFFFFFF" /v "AcctUId" /t REG_SZ /d "0" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Provisioning\OMADM\Accounts\FFFFFFFF-FFFF-FFFF-FFFF-FFFFFFFFFFFF" /v "SslClientCertReference" /t REG_SZ /d "MY;User;0000000000000000000000000000000000000000" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Provisioning\OMADM\Accounts\FFFFFFFF-FFFF-FFFF-FFFF-FFFFFFFFFFFF" /v "ProtoVer" /t REG_SZ /d "1.2" /f >nul 2>&1

:: Enable hardware-accelerated GPU scheduling using Registry
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v HwSchMode /d 2 /t REG_DWORD /f >nul 2>&1

:: To prevent WD using too much CPU, add this file to the exclusion list:
reg add "HKLM\Software\Microsoft\Windows Defender\Exclusions\Paths" /v "C:\Program Files\Windows Defender\MsMpEng.exe" /t REG_DWORD /d "0" /f >nul 2>&1

:: By default, Windows will check your license every time you turn on your PC, this will prevent it.
reg add "HKLM\Software\Microsoft\WindowsNT\CurrentVersion\SoftwareProtectionPlatform\Activation" /v Manual /t REG_DWORD /d 1 /f >nul 2>&1

:: Disable Background disk defragmentation / y - EnableHow long in milliseconds you want to have for a startup delay time for desktop apps that run at startup to load
reg add "HKLM\Software\Microsoft\Dfrg\BootOptimizeFunction" /v "Enable" /t REG_SZ /d "N" /f >nul 2>&1
:: Disable Background auto-layout / Disable Optimize Hard Disk when idle
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\OptimalLayout" /v "EnableAutoLayout" /t REG_DWORD /d "0" /f >nul 2>&1

:: Adobe Reader DC STIG
reg add "HKLM\Software\Adobe\Acrobat Reader\DC\Installer" /v "DisableMaintenance" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\Software\Wow6432Node\Adobe\Acrobat Reader\DC\Installer" /v "DisableMaintenance" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\Software\Policies\Adobe\Acrobat Reader\DC\FeatureLockDown" /v "bAcroSuppressUpsell" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\Software\Policies\Adobe\Acrobat Reader\DC\FeatureLockDown" /v "bDisablePDFHandlerSwitching" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\Software\Policies\Adobe\Acrobat Reader\DC\FeatureLockDown" /v "bDisableTrustedFolders" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\Software\Policies\Adobe\Acrobat Reader\DC\FeatureLockDown" /v "bDisableTrustedSites" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\Software\Policies\Adobe\Acrobat Reader\DC\FeatureLockDown" /v "bEnableFlash" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\Software\Policies\Adobe\Acrobat Reader\DC\FeatureLockDown" /v "bEnhancedSecurityInBrowser" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\Software\Policies\Adobe\Acrobat Reader\DC\FeatureLockDown" /v "bEnhancedSecurityStandalone" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\Software\Policies\Adobe\Acrobat Reader\DC\FeatureLockDown" /v "bProtectedMode" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\Software\Policies\Adobe\Acrobat Reader\DC\FeatureLockDown" /v "iFileAttachmentPerms" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\Software\Policies\Adobe\Acrobat Reader\DC\FeatureLockDown" /v "iProtectedView" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\Software\Policies\Adobe\Acrobat Reader\DC\FeatureLockDown\cCloud" /v "bAdobeSendPluginToggle" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\Software\Policies\Adobe\Acrobat Reader\DC\FeatureLockDown\cDefaultLaunchURLPerms" /v "iURLPerms" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\Software\Policies\Adobe\Acrobat Reader\DC\FeatureLockDown\cDefaultLaunchURLPerms" /v "iUnknownURLPerms" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\Software\Policies\Adobe\Acrobat Reader\DC\FeatureLockDown\cServices" /v "bToggleAdobeDocumentServices" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\Software\Policies\Adobe\Acrobat Reader\DC\FeatureLockDown\cServices" /v "bToggleAdobeSign" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\Software\Policies\Adobe\Acrobat Reader\DC\FeatureLockDown\cServices" /v "bTogglePrefsSync" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\Software\Policies\Adobe\Acrobat Reader\DC\FeatureLockDown\cServices" /v "bToggleWebConnectors" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\Software\Policies\Adobe\Acrobat Reader\DC\FeatureLockDown\cServices" /v "bUpdater" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\Software\Policies\Adobe\Acrobat Reader\DC\FeatureLockDown\cSharePoint" /v "bDisableSharePointFeatures" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\Software\Software\Policies\Adobe\Acrobat Reader\DC\FeatureLockDown\cWebmailProfiles" /v "bDisableWebmail" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\Software\Policies\Adobe\Acrobat Reader\DC\FeatureLockDown\cWelcomeScreen" /v "bShowWelcomeScreen" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\Software\Policies\Adobe\Acrobat Reader\DC\FeatureLockdown\cIPM" /v "bShowMsgAtLaunch" /t REG_DWORD /d 0 /f >NUL 2>&1
reg add "HKLM\Software\Policies\Adobe\Acrobat Reader\DC\FeatureLockdown\cIPM" /v "bDontShowMsgWhenViewingDoc" /t REG_DWORD /d 1 /f >NUL 2>&1
reg add "HKLM\SOFTWARE\Adobe\Adobe ARM\1.0\ARM" /v "iCheck" /t REG_DWORD /d 0 /f >NUL 2>&1

:: starke Verschlüsselung .NET-Framework erzwingen
reg add HKLM\SOFTWARE\Microsoft\.NETFramework\v4.0.30319 /V SchUseStrongCrypto /T REG_DWORD /D 1 /f >NUL 2>&1

:: Allow UNC paths at command prompt
REG ADD "HKLM\Software\Microsoft\Command Processor" /v DisableUNCCheck /t REG_DWORD /d 1 /f >NUL 2>&1

:: https://www.reddit.com/r/Windows10/comments/dgcg87/gamebarpresencewriteexe_keeps_running_on_my_pc/
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsRuntime\ActivatableClassId\Windows.Gaming.GameBar.PresenceServer.Internal.PresenceWriter" /v "ActivationType" /t REG_DWORD /d 0 /f >NUL 2>&1

:: Disable Windows Startup Sound
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Authentication\LogonUI\BootAnimation" /v DisableStartupSound /t REG_DWORD /d 1 /f >NUL 2>&1
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v DisableStartupSound /t REG_DWORD /d 1 /f >NUL 2>&1

:: Disable deployment operations in special profiles
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\Appx" /v AllowDeploymentInSpecialProfiles /t REG_DWORD /d 1 /f >NUL 2>&1

:: Turns off Windows Network Isolations automatic discovery - https://support.citrix.com/article/CTX232313
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\NetworkIsolation" /v DSubnetsAuthoritive /t REG_DWORD /d 1 /f >NUL 2>&1

:: Disable logon script delay
:: REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v EnableLogonScriptDelay /t REG_DWORD /d 1 /f >NUL 2>&1
:: REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v AsyncScriptDelay /t REG_DWORD /d 0 /f >NUL 2>&1

:: Do not check for user ownership of Roaming Profile Folders
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v CompatibleRUPSecurity /t REG_DWORD /d 1 /f >NUL 2>&1
:: Do not display network selection UI
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v DontDisplayNetworkSelectionUI /t REG_DWORD /d 1 /f >NUL 2>&1

:: Shorten wait time of folder redirection
reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer /v FolderRedirectionWait /d 0 /t REG_DWORD /f >NUL 2>&1

:: Disable sending alert for the Crash Control
reg add HKLM\SYSTEM\CurrentControlSet\Control\CrashControl /v SendAlert /d 0 /t REG_DWORD /f >NUL 2>&1
reg add HKLM\SYSTEM\CurrentControlSet\Control\CrashControl /v CrashDumpEnabled /d 0 /t REG_DWORD /f >NUL 2>&1

:: How long the OS will wait for a disk write or read to take place on the SAN without throwing an error
reg add "HKLM\SYSTEM\CurrentControlSet\services\Disk" /v TimeOutValue /d 60 /t REG_DWORD /f >NUL 2>&1

:: SSD Tweaks
reg add "HKLM\SYSTEM\CurrentControlSet\services\iaStor\Parameters\Port0" /v "LPM" /d 0 /t REG_DWORD /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\services\iaStor\Parameters\Port0" /v "LPMDSTATE" /d 0 /t REG_DWORD /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\services\iaStor\Parameters\Port0" /v "DIPM" /d 0 /t REG_DWORD /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\services\iaStor\Parameters\Port1" /v "LPM" /d 0 /t REG_DWORD /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\services\iaStor\Parameters\Port1" /v "LPMDSTATE" /d 0 /t REG_DWORD /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\services\iaStor\Parameters\Port1" /v "DIPM" /d 0 /t REG_DWORD /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\services\iaStor\Parameters\Port2" /v "LPM" /d 0 /t REG_DWORD /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\services\iaStor\Parameters\Port2" /v "LPMDSTATE" /d 0 /t REG_DWORD /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\services\iaStor\Parameters\Port2" /v "DIPM" /d 0 /t REG_DWORD /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\services\iaStor\Parameters\Port3" /v "LPM" /d 0 /t REG_DWORD /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\services\iaStor\Parameters\Port3" /v "LPMDSTATE" /d 0 /t REG_DWORD /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\services\iaStor\Parameters\Port3" /v "DIPM" /d 0 /t REG_DWORD /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\services\iaStor\Parameters\Port4" /v "LPM" /d 0 /t REG_DWORD /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\services\iaStor\Parameters\Port4" /v "LPMDSTATE" /d 0 /t REG_DWORD /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\services\iaStor\Parameters\Port4" /v "DIPM" /d 0 /t REG_DWORD /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\services\iaStor\Parameters\Port5" /v "LPM" /d 0 /t REG_DWORD /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\services\iaStor\Parameters\Port5" /v "LPMDSTATE" /d 0 /t REG_DWORD /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\services\iaStor\Parameters\Port5" /v "DIPM" /d 0 /t REG_DWORD /f >NUL 2>&1

:: Do not show the 'local access only' Network Icon
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Network Connections" /v NC_DoNotShowLocalOnlyIcon /d 1 /t REG_DWORD /f >NUL 2>&1

:: Ein Domänenbenutzer kann sich mit Hilfe einer PIN am System anmelden.
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v AllowDomainPINLogon /t REG_DWORD /d 0 /f >NUL 2>&1

:: Runas-Admin
REG ADD "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v "C:\Windows\DNSQuerySniffer.exe" /t REG_SZ /d "~ RUNASADMIN" /f >NUL 2>&1

:: Allow OneDrive to disable Windows permission inheritance in folders synced read-only - improves the performance of the sync app - https://docs.microsoft.com/en-us/onedrive/use-group-policy#computer-configuration-policies
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\OneDrive" /v PermitDisablePermissionInheritance /t REG_DWORD /d 1 /f >NUL 2>&1
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\OneDrive" /v EnableAutomaticUploadBandwidthManagement /t REG_DWORD /d 1 /f >NUL 2>&1
:: REG ADD "HKLM\SOFTWARE\Policies\Microsoft\OneDrive" /v PreventNetworkTrafficPreUserSignIn /t REG_DWORD /d 1 /f >NUL 2>&1
:: Set the sync app update ring - 4 for Insider, 5 for Production, or 0 for Deferred
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\OneDrive" /v GPOSetUpdateRing /t REG_DWORD /d 4 /f >NUL 2>&1
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\OneDrive" /v FilesOnDemandEnabled /t REG_DWORD /d 1 /f >NUL 2>&1

:: Disable Systemestore
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows NT\SystemRestore" /v DisableConfig /d 1 /t REG_DWORD /f >NUL 2>&1

:: DisableErrorReporting
reg add "HKLM\SYSTEM\CurrentControlSet\Services\WerSvc" /v Start /d 4 /t REG_DWORD /f >NUL 2>&1

powercfg.exe -s 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c >NUL 2>&1
powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61 >NUL 2>&1
:: Disable display and sleep mode timeouts
powercfg -change -monitor-timeout-ac 0 >NUL 2>&1
powercfg /X monitor-timeout-ac 45 >NUL 2>&1
powercfg /X monitor-timeout-dc 45 >NUL 2>&1
powercfg /X standby-timeout-ac 0 >NUL 2>&1
powercfg /X standby-timeout-dc 0 >NUL 2>&1

fsutil behavior set disable8dot3 1 >NUL 2>&1
fsutil behavior set disablelastaccess 1 >NUL 2>&1
fsutil behavior set memoryusage 2 >NUL 2>&1
:: Trim aktivieren
fsutil behavior set DisableDeleteNotify 0 >NUL

net accounts /MaxPWAge:unlimited >NUL 2>&1

:: Disable NetBIOS over TCP/IP on all currently installed network interfaces
reg add "HKLM\SYSTEM\CurrentControlSet\services\NetBT\Parameters\Interfaces\Tcpip*" /v NetbiosOptions /d 2 /t REG_DWORD /f >NUL 2>&1
wmic /interactive:off nicconfig where (TcpipNetbiosOptions=0 OR TcpipNetbiosOptions=1) call SetTcpipNetbios 2 >NUL 2>&1

attrib -r "%WINDIR%\system32\drivers\etc\hosts" > nul 2>&1
find /C /I "wpad" %WINDIR%\system32\drivers\etc\hosts	
if %ERRORLEVEL% NEQ 0 echo ^0.0.0.0 wpad>>%WINDIR%\system32\drivers\etc\hosts
find /C /I "wpad." %WINDIR%\system32\drivers\etc\hosts	
if %ERRORLEVEL% NEQ 0 echo ^0.0.0.0 wpad.>>%WINDIR%\system32\drivers\etc\hosts
find /C /I "choice.microsoft.com" %WINDIR%\system32\drivers\etc\hosts	
if %ERRORLEVEL% NEQ 0 echo ^0.0.0.0 choice.microsoft.com>>%WINDIR%\system32\drivers\etc\hosts
find /C /I "choice.microsoft.com.nsatc.net" %WINDIR%\system32\drivers\etc\hosts	
if %ERRORLEVEL% NEQ 0 echo ^0.0.0.0 choice.microsoft.com.nsatc.net>>%WINDIR%\system32\drivers\etc\hosts
find /C /I "df.telemetry.microsoft.com" %WINDIR%\system32\drivers\etc\hosts	
if %ERRORLEVEL% NEQ 0 echo ^0.0.0.0 df.telemetry.microsoft.com>>%WINDIR%\system32\drivers\etc\hosts
find /C /I "oca.telemetry.microsoft.com" %WINDIR%\system32\drivers\etc\hosts	
if %ERRORLEVEL% NEQ 0 echo ^0.0.0.0 oca.telemetry.microsoft.com>>%WINDIR%\system32\drivers\etc\hosts
find /C /I "oca.telemetry.microsoft.com.nsatc.net" %WINDIR%\system32\drivers\etc\hosts	
if %ERRORLEVEL% NEQ 0 echo ^0.0.0.0 oca.telemetry.microsoft.com.nsatc.net>>%WINDIR%\system32\drivers\etc\hosts
find /C /I "redir.metaservices.microsoft.com" %WINDIR%\system32\drivers\etc\hosts	
if %ERRORLEVEL% NEQ 0 echo ^0.0.0.0 redir.metaservices.microsoft.com>>%WINDIR%\system32\drivers\etc\hosts
find /C /I "reports.wes.df.telemetry.microsoft.com" %WINDIR%\system32\drivers\etc\hosts	
if %ERRORLEVEL% NEQ 0 echo ^0.0.0.0 reports.wes.df.telemetry.microsoft.com>>%WINDIR%\system32\drivers\etc\hosts
find /C /I "services.wes.df.telemetry.microsoft.com" %WINDIR%\system32\drivers\etc\hosts	
if %ERRORLEVEL% NEQ 0 echo ^0.0.0.0 services.wes.df.telemetry.microsoft.com>>%WINDIR%\system32\drivers\etc\hosts
find /C /I "settings-sandbox.data.microsoft.com" %WINDIR%\system32\drivers\etc\hosts	
if %ERRORLEVEL% NEQ 0 echo ^0.0.0.0 settings-sandbox.data.microsoft.com>>%WINDIR%\system32\drivers\etc\hosts
find /C /I "sqm.df.telemetry.microsoft.com" %WINDIR%\system32\drivers\etc\hosts	
if %ERRORLEVEL% NEQ 0 echo ^0.0.0.0 sqm.df.telemetry.microsoft.com>>%WINDIR%\system32\drivers\etc\hosts
find /C /I "sqm.telemetry.microsoft.com" %WINDIR%\system32\drivers\etc\hosts	
if %ERRORLEVEL% NEQ 0 echo ^0.0.0.0 sqm.telemetry.microsoft.com>>%WINDIR%\system32\drivers\etc\hosts
find /C /I "sqm.telemetry.microsoft.com.nsatc.net" %WINDIR%\system32\drivers\etc\hosts	
if %ERRORLEVEL% NEQ 0 echo ^0.0.0.0 sqm.telemetry.microsoft.com.nsatc.net>>%WINDIR%\system32\drivers\etc\hosts
find /C /I "telecommand.telemetry.microsoft.com" %WINDIR%\system32\drivers\etc\hosts	
if %ERRORLEVEL% NEQ 0 echo ^0.0.0.0 telecommand.telemetry.microsoft.com>>%WINDIR%\system32\drivers\etc\hosts
find /C /I "telecommand.telemetry.microsoft.com.nsatc.net" %WINDIR%\system32\drivers\etc\hosts	
if %ERRORLEVEL% NEQ 0 echo ^0.0.0.0 telecommand.telemetry.microsoft.com.nsatc.net>>%WINDIR%\system32\drivers\etc\hosts
find /C /I "telemetry.appex.bing.net" %WINDIR%\system32\drivers\etc\hosts	
if %ERRORLEVEL% NEQ 0 echo ^0.0.0.0 telemetry.appex.bing.net>>%WINDIR%\system32\drivers\etc\hosts
find /C /I "telemetry.appex.bing.net:443" %WINDIR%\system32\drivers\etc\hosts	
if %ERRORLEVEL% NEQ 0 echo ^0.0.0.0 telemetry.appex.bing.net:443>>%WINDIR%\system32\drivers\etc\hosts
find /C /I "telemetry.microsoft.com" %WINDIR%\system32\drivers\etc\hosts	
if %ERRORLEVEL% NEQ 0 echo ^0.0.0.0 telemetry.microsoft.com>>%WINDIR%\system32\drivers\etc\hosts
find /C /I "telemetry.urs.microsoft.com" %WINDIR%\system32\drivers\etc\hosts	
if %ERRORLEVEL% NEQ 0 echo ^0.0.0.0 telemetry.urs.microsoft.com>>%WINDIR%\system32\drivers\etc\hosts
find /C /I "vortex.data.microsoft.com" %WINDIR%\system32\drivers\etc\hosts	
if %ERRORLEVEL% NEQ 0 echo ^0.0.0.0 vortex.data.microsoft.com>>%WINDIR%\system32\drivers\etc\hosts
find /C /I "vortex-sandbox.data.microsoft.com" %WINDIR%\system32\drivers\etc\hosts	
if %ERRORLEVEL% NEQ 0 echo ^0.0.0.0 vortex-sandbox.data.microsoft.com>>%WINDIR%\system32\drivers\etc\hosts
find /C /I "vortex-win.data.microsoft.com" %WINDIR%\system32\drivers\etc\hosts	
if %ERRORLEVEL% NEQ 0 echo ^0.0.0.0 vortex-win.data.microsoft.com>>%WINDIR%\system32\drivers\etc\hosts
find /C /I "watson.ppe.telemetry.microsoft.com" %WINDIR%\system32\drivers\etc\hosts	
if %ERRORLEVEL% NEQ 0 echo ^0.0.0.0 watson.ppe.telemetry.microsoft.com>>%WINDIR%\system32\drivers\etc\hosts
find /C /I "watson.telemetry.microsoft.com" %WINDIR%\system32\drivers\etc\hosts	
if %ERRORLEVEL% NEQ 0 echo ^0.0.0.0 watson.telemetry.microsoft.com>>%WINDIR%\system32\drivers\etc\hosts
find /C /I "watson.telemetry.microsoft.com.nsatc.net" %WINDIR%\system32\drivers\etc\hosts	
if %ERRORLEVEL% NEQ 0 echo ^0.0.0.0 watson.telemetry.microsoft.com.nsatc.net>>%WINDIR%\system32\drivers\etc\hosts
find /C /I "wes.df.telemetry.microsoft.com" %WINDIR%\system32\drivers\etc\hosts	
if %ERRORLEVEL% NEQ 0 echo ^0.0.0.0 wes.df.telemetry.microsoft.com>>%WINDIR%\system32\drivers\etc\hosts
attrib +r "%WINDIR%\system32\drivers\etc\hosts" > nul 2>&1

:: Virtuelle Smartcard erzeugen - TMP-Chipset required!
:: tpmvscmgr create /name VirtSmartCard /pin default /adminkey random /puk default /generate