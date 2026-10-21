; MPFever installer (Inno Setup 6). Built by .github/workflows/release.yml after build.bat:
;   iscc /DAppVersion=<version> installer\MPFever.iss
; It installs release\dist\MPFever for the current user only (no administrator rights): MPFever.exe updates itself in its own
; folder (see launcher/Updater.cs), which therefore has to be writable by the player.

#ifndef AppVersion
  #define AppVersion "0.0.0"
#endif

[Setup]
AppId={{F7893117-415C-445F-8B89-EF07F3D10003}
AppName=MPFever
AppVersion={#AppVersion}
AppVerName=MPFever {#AppVersion}
AppPublisher=dev-andrei-v (fork of dkdknight's MPFever)
AppPublisherURL=https://github.com/dev-andrei-v/MPFever
AppSupportURL=https://github.com/dev-andrei-v/MPFever/issues
AppUpdatesURL=https://github.com/dev-andrei-v/MPFever/releases
DefaultDirName={localappdata}\Programs\MPFever
DefaultGroupName=MPFever
DisableProgramGroupPage=yes
PrivilegesRequired=lowest
OutputDir=..\release
OutputBaseFilename=MPFever-Setup-{#AppVersion}
SetupIconFile=..\launcher\app.ico
UninstallDisplayIcon={app}\MPFever.exe
LicenseFile=..\LICENSE
Compression=lzma2
SolidCompression=yes
WizardStyle=modern
ArchitecturesAllowed=x64compatible
ArchitecturesInstallIn64BitMode=x64compatible
; the player's settings, logs and reports are kept on uninstall and on a new installation
CloseApplications=yes

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"
Name: "french"; MessagesFile: "compiler:Languages\French.isl"
Name: "german"; MessagesFile: "compiler:Languages\German.isl"
Name: "spanish"; MessagesFile: "compiler:Languages\Spanish.isl"
Name: "italian"; MessagesFile: "compiler:Languages\Italian.isl"
Name: "dutch"; MessagesFile: "compiler:Languages\Dutch.isl"
Name: "polish"; MessagesFile: "compiler:Languages\Polish.isl"
Name: "brazilianportuguese"; MessagesFile: "compiler:Languages\BrazilianPortuguese.isl"
Name: "russian"; MessagesFile: "compiler:Languages\Russian.isl"
Name: "japanese"; MessagesFile: "compiler:Languages\Japanese.isl"
Name: "korean"; MessagesFile: "compiler:Languages\Korean.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"

[Files]
Source: "..\release\dist\MPFever\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs

[Icons]
Name: "{group}\MPFever"; Filename: "{app}\MPFever.exe"
Name: "{group}\{cm:UninstallProgram,MPFever}"; Filename: "{uninstallexe}"
Name: "{userdesktop}\MPFever"; Filename: "{app}\MPFever.exe"; Tasks: desktopicon

[Run]
Filename: "{app}\MPFever.exe"; Description: "{cm:LaunchProgram,MPFever}"; Flags: nowait postinstall skipifsilent

[UninstallDelete]
; what the launcher writes next to itself while it runs (the player's mpfever_settings.txt is kept)
Type: filesandordirs; Name: "{app}\.update_old"
