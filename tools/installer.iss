; Установщик Сапёр для Windows (Inno Setup 6), ставится в профиль пользователя.
#define BuildNo GetEnv("BUILD_NO")
#if BuildNo == ""
  #define BuildNo "0"
#endif

[Setup]
AppId={{5614E2F0-AD1C-4A3A-89AB-1F576F0A9991}
AppName=Сапёр
AppVersion=1.0.{#BuildNo}
AppPublisher=Winter Hub
DefaultDirName={localappdata}\Programs\Winter Mines
DefaultGroupName=Сапёр
DisableProgramGroupPage=yes
PrivilegesRequired=lowest
OutputDir=..\dist
OutputBaseFilename=Winter-Mines-Setup
Compression=lzma2
SolidCompression=yes
SetupIconFile=..\windows\runner\resources\app_icon.ico
UninstallDisplayIcon={app}\winter_mines.exe
CloseApplications=force
RestartApplications=no
WizardStyle=modern
ArchitecturesAllowed=x64compatible
ArchitecturesInstallIn64BitMode=x64compatible

[Languages]
Name: "ru"; MessagesFile: "compiler:Languages\Russian.isl"
Name: "en"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"

[Files]
Source: "..\build\windows\x64\runner\Release\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs

[Icons]
Name: "{group}\Сапёр"; Filename: "{app}\winter_mines.exe"
Name: "{group}\{cm:UninstallProgram,Сапёр}"; Filename: "{uninstallexe}"
Name: "{userdesktop}\Сапёр"; Filename: "{app}\winter_mines.exe"; Tasks: desktopicon

[Run]
Filename: "{app}\winter_mines.exe"; Description: "{cm:LaunchProgram,Сапёр}"; Flags: nowait postinstall skipifsilent
Filename: "{app}\winter_mines.exe"; Flags: nowait; Check: WizardSilent
