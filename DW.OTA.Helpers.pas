unit DW.OTA.Helpers;

{*******************************************************}
{                                                       }
{         TOTAL - Terrific Open Tools API Library       }
{                                                       }
{*******************************************************}

interface

uses
  // RTL
  System.Classes, System.SysUtils,
  // Design
  ToolsAPI, PlatformAPI,
  // VCL
  Vcl.Menus, Vcl.Forms,
  // DW
  DW.OTA.Types;

const
  cFileMenuItemName = 'FileMenu';
  cFileReopenMenuItemName = 'FileClosedFilesItem';
  cToolsMenuItemName = 'ToolsMenu';

type
  TOTAHelper = record
  private
    class function FindComponentRecurse(const AParent: TComponent; const AComponentName: string; out AComponent: TComponent): Boolean; static;
    class function GetSourceEditor(const AModule: IOTAModule): IOTASourceEditor; static;
  public
    /// <summary>
    ///  Set this flag if building for debug
    /// </summary>
    class var IsDebug: Boolean;
    /// <summary>
    ///  Adds an image to the IDEs image list
    /// </summary>
    class function AddImage(const AResName: string): Integer; static;
    /// <summary>
    ///  Adds a message to a group entitled TOTAL Debug
    /// </summary>
    class procedure AddDebugMessage(const AMsg: string); static;
    /// <summary>
    ///  Adds an exception message to a group specified by AGroupName
    /// </summary>
    class procedure AddTitleException(const AException: Exception; const AProcess: string; const AGroupName: string = ''); static;
    /// <summary>
    ///  Adds a message to a group specified by AGroupName
    /// </summary>
    class procedure AddTitleMessage(const AMsg: string; const AGroupName: string = ''); static;
    /// <summary>
    ///  Applies the active theme to the component and children
    /// </summary>
    class procedure ApplyTheme(const AComponent: TComponent); static;
    /// <summary>
    ///  Expands a folder
    /// </summary>
    class function ExpandOutputDir(const ASource: string): string; static;
    /// <summary>
    ///  Expands the paths associated with a project
    /// </summary>
    class procedure ExpandPaths(const APaths: TStrings; const AProject: IOTAProject = nil); static;
    /// <summary>
    ///  Expands the paths associated with the active configuration
    /// </summary>
    class function ExpandProjectActiveConfiguration(const ASource: string; const AProject: IOTAProject): string; static;
    /// <summary>
    ///  Expands the variables contained in ASource
    /// </summary>
    class function ExpandVars(const ASource: string): string; static;
    /// <summary>
    ///  Finds a form with a particular name
    /// </summary>
    class function FindForm(const AFormName: string; out AForm: TComponent): Boolean; static;
    /// <summary>
    ///  Finds a component application-wide
    /// </summary>
    class function FindComponentGlobal(const AComponentName: string; out AComponent: TComponent): Boolean; static;
    /// <summary>
    ///  Finds a menu with a given name from the given parent
    /// </summary>
    class function FindMenu(const AParentItem: TMenuItem; const AMenuName: string; out AMenuItem: TMenuItem): Boolean; static;
    /// <summary>
    ///  Finds the IDEs Tools menu
    /// </summary>
    class function FindToolsMenu(out AMenuItem: TMenuItem): Boolean; static;
    /// <summary>
    ///  Finds a submenu with the given name under Tools
    /// </summary>
    class function FindToolsSubMenu(const AMenuName: string; out AMenuItem: TMenuItem): Boolean; static;
    /// <summary>
    ///  Finds a top-level menu with the given name
    /// </summary>
    class function FindTopMenu(const AMenuName: string; out AMenuItem: TMenuItem): Boolean; static;
    /// <summary>
    ///  Gets the active project, if any
    /// </summary>
    class function GetActiveProject: IOTAProject; static;
    /// <summary>
    ///  Gets the filename for the active project
    /// </summary>
    class function GetActiveProjectFileName: string; static;
    /// <summary>
    ///  Gets the active project options, if any
    /// </summary>
    class function GetActiveProjectOptions: IOTAProjectOptions; static;
    /// <summary>
    ///  Gets the configurations for the active project, if any
    /// </summary>
    class function GetActiveProjectOptionsConfigurations: IOTAProjectOptionsConfigurations; static;
    /// <summary>
    ///  Gets the output folder for the active project
    /// </summary>
    class function GetActiveProjectOutputDir: string; static;
    /// <summary>
    ///  Gets the folder for the active project
    /// </summary>
    class function GetActiveProjectPath: string; static;
    /// <summary>
    ///  Gets the active source edtior
    /// </summary>
    class function GetActiveSourceEditor: IOTASourceEditor; static;
    /// <summary>
    ///  Gets the currently selected project, if any
    /// </summary>
    class function GetCurrentSelectedProject: IOTAProject; static;
    /// <summary>
    ///  Gets the environment options for the IDE
    /// </summary>
    class function GetEnvironmentOptions: IOTAEnvironmentOptions; static;
    /// <summary>
    ///  Gets the main form for the IDE
    /// </summary>
    class function GetMainForm: TComponent; static;
    /// <summary>
    ///  Gets the effective paths for the active project
    /// </summary>
    class procedure GetProjectActiveEffectivePaths(const AProject: IOTAProject; const APaths: TStrings; const ABase: Boolean = False); static;
    /// <summary>
    ///  Gets the projects current connection profile, if any
    /// </summary>
    class function GetProjectBuildFileName(const AProject: IOTAProject; const AFileName: string): string; static;
    /// <summary>
    ///  Gets the projects current connection profile, if any
    /// </summary>
    class function GetProjectCurrentConnectionProfile(const AProject: IOTAProject): string; static;
    /// <summary>
    ///  Gets the projects current mobile device name, if anys
    /// </summary>
    class function GetProjectCurrentMobileDeviceName(const AProject: IOTAProject): string; static;
    /// <summary>
    ///  Gets the current platform for the given project
    /// </summary>
    class function GetProjectCurrentPlatform(const AProject: IOTAProject): TProjectPlatform; static;
    class function GetProjectDeployedFileName(const AProject: IOTAProject): string; static;
    class function GetProjectDeployedPath(const AProject: IOTAProject): string; static;
    /// <summary>
    ///  Gets the current project group, if any
    /// </summary>
    class function GetProjectGroup: IOTAProjectGroup; static;
    /// <summary>
    ///  Gets the options configurations for the given project
    /// </summary>
    class function GetProjectOptionsConfigurations(const AProject: IOTAProject): IOTAProjectOptionsConfigurations; static;
    /// <summary>
    ///  Gets the output folder for the given project
    /// </summary>
    class function GetProjectOutputDir(const AProject: IOTAProject): string; static;
    /// <summary>
    ///  Gets the folder for the given project
    /// </summary>
    class function GetProjectPath(const AProject: IOTAProject): string; static;
    /// <summary>
    ///  Gets the project platform from the string value
    /// </summary>
    class function GetProjectPlatform(const APlatform: string): TProjectPlatform; static;
    /// <summary>
    ///  Gets the base registry key for the IDE
    /// </summary>
    class function GetRegKey: string; static;
    /// <summary>
    ///  Gets all the text in a source editor
    /// </summary>
    class function GetSourceEditorText(const ASourceEditor: IOTASourceEditor): string; static;
    /// <summary>
    ///  Gets a value from version info for the given key
    /// </summary>
    class function GetVerInfoValue(const AVerInfo: string; const AKey: string): string; static;
    /// <summary>
    ///  Indicates whether or not the IDE is closing
    /// </summary>
    class function IsIDEClosing: Boolean; static;
    /// <summary>
    ///  Indicates whether or not the platform is iOS
    /// </summary>
    class function IsIOSPlatform(const APlatform: string): Boolean; static;
    /// <summary>
    ///  Indicates whether or not the platform is Mac/iOS
    /// </summary>
    class function IsMacOSPlatform(const APlatform: string): Boolean; static;
    /// <summary>
    ///  Indicates whether or not a platform matches the profile platform
    /// </summary>
    class function IsMatchingProfilePlatform(const APlatform, AProfilePlatform: string): Boolean; static;
    /// <summary>
    ///  Opens the given file in the IDE, where the file may be a project or a group
    /// </summary>
    class function OpenFile(const AFilename: string): Boolean; static;
    /// <summary>
    ///  Refreshes the project manager tree
    /// </summary>
    class procedure RefreshProjectTree; static;
    /// <summary>
    ///  Shows the message view in the messages window for the given group
    /// </summary>
    class procedure RegisterThemeForms(const AFormClasses: array of TCustomFormClass); static;
    /// <summary>
    ///  Sets the projects SDK version
    /// </summary>
    class procedure SetProjectSDKVersion(const AProject: IOTAProject; const APlatform, ASDKVersion: string); static;
    /// <summary>
    ///  Shows the message view in the messages window for the given group
    /// </summary>
    class procedure ShowMessageView(const AGroupName: string = ''); static;
  end;

function ExpandPath(const ABaseDir, ARelativeDir: string): string;

// Really only here for debugging purposes
function GetEnvironmentVars(const Vars: TStrings; Expand: Boolean): Boolean;

implementation

uses
  System.IOUtils,
  XML.XMLIntf,
  DCCStrs,
  Winapi.Windows, Winapi.ShLwApi,
  Vcl.Graphics, Vcl.Controls,
  DW.OSLog,
  DW.OTA.Consts;

// Tweaked version of David Heffernan's answer, here:
//   https://stackoverflow.com/questions/5329472/conversion-between-absolute-and-relative-paths-in-delphi
function ExpandPath(const ABaseDir, ARelativeDir: string): string;
var
  LBuffer: array [0..MAX_PATH - 1] of Char;
begin
  if PathIsRelative(PChar(ARelativeDir)) then
    Result := IncludeTrailingPathDelimiter(ABaseDir) + ARelativeDir
  else
    Result := ARelativeDir;
  if PathCanonicalize(@LBuffer[0], PChar(Result)) then
    Result := LBuffer;
end;

// "Borrowed" a couple of methods from JVCL for processing of environment variables
procedure MultiSzToStrings(const Dest: TStrings; const Source: PChar);
var
  P: PChar;
begin
  Dest.BeginUpdate;
  try
    Dest.Clear;
    if Source <> nil then
    begin
      P := Source;
      while P^ <> #0 do
      begin
        Dest.Add(P);
        P := StrEnd(P);
        Inc(P);
      end;
    end;
  finally
    Dest.EndUpdate;
  end;
end;

procedure StrResetLength(var S: string);
begin
  SetLength(S, StrLen(PChar(S)));
end;

function ExpandEnvironmentVar(var Value: string): Boolean;
var
  R: Integer;
  Expanded: string;
begin
  SetLength(Expanded, 1);
  R := ExpandEnvironmentStrings(PChar(Value), PChar(Expanded), 0);
  SetLength(Expanded, R);
  Result := ExpandEnvironmentStrings(PChar(Value), PChar(Expanded), R) <> 0;
  if Result then
  begin
    StrResetLength(Expanded);
    Value := Expanded;
  end;
end;

function GetEnvironmentVars(const Vars: TStrings; Expand: Boolean): Boolean;
var
  Raw: PChar;
  Expanded: string;
  I: Integer;
begin
  Vars.BeginUpdate;
  try
    Vars.Clear;
    Raw := GetEnvironmentStrings;
    try
      MultiSzToStrings(Vars, Raw);
      Result := True;
    finally
      FreeEnvironmentStrings(Raw);
    end;
    if Expand then
    begin
      for I := 0 to Vars.Count - 1 do
      begin
        Expanded := Vars[I];
        if ExpandEnvironmentVar(Expanded) then
          Vars[I] := Expanded;
      end;
    end;
  finally
    Vars.EndUpdate;
  end;
end;

class function TOTAHelper.AddImage(const AResName: string): Integer;
var
  LBitmap: TBitmap;
begin
  Result := -1;
  if FindResource(HInstance, PChar(AResName), RT_BITMAP) = 0 then
    Exit; // <======
  LBitmap := TBitmap.Create;
  try
    LBitmap.LoadFromResourceName(HInstance, AResName);
    Result := (BorlandIDEServices as INTAServices).AddMasked(LBitmap, LBitmap.Canvas.Pixels[0, LBitmap.Height - 1]);
  finally
    LBitmap.Free;
  end;
end;

class procedure TOTAHelper.AddDebugMessage(const AMsg: string);
begin
  if IsDebug then
    AddTitleMessage(AMsg, 'TOTAL Debug');
end;

class procedure TOTAHelper.AddTitleException(const AException: Exception; const AProcess: string; const AGroupName: string = '');
begin
  AddTitleMessage(Format('%s - %s: %s', [AProcess, AException.ClassName, AException.Message]), AGroupName);
end;

class procedure TOTAHelper.AddTitleMessage(const AMsg: string; const AGroupName: string = '');
var
  LServices: IOTAMessageServices;
  LGroup: IOTAMessageGroup;
begin
  LServices := BorlandIDEServices as IOTAMessageServices;
  if not AGroupName.IsEmpty then
  begin
    LGroup := LServices.GetGroup(AGroupName);
    if LGroup = nil then
      LGroup := LServices.AddMessageGroup(AGroupName);
    LServices.AddTitleMessage(AMsg, LGroup);
    LServices.ShowMessageView(LGroup);
  end
  else
    AddTitleMessage(AMsg);
end;

class procedure TOTAHelper.ShowMessageView(const AGroupName: string = '');
var
  LServices: IOTAMessageServices;
  LGroup: IOTAMessageGroup;
begin
  LServices := BorlandIDEServices as IOTAMessageServices;
  if not AGroupName.IsEmpty then
  begin
    LGroup := LServices.GetGroup(AGroupName);
    if LGroup <> nil then
      LServices.ShowMessageView(LGroup);
  end
  else
    LServices.ShowMessageView(nil);
end;

class function TOTAHelper.FindForm(const AFormName: string; out AForm: TComponent): Boolean;
var
  I: Integer;
begin
  Result := False;
  for I := 0 to Screen.FormCount - 1 do
  begin
    if Screen.Forms[I].Name = AFormName then
    begin
      AForm := Screen.Forms[I];
      Exit(True); // <=======
    end;
  end;
end;

class function TOTAHelper.FindComponentGlobal(const AComponentName: string; out AComponent: TComponent): Boolean;
var
  I: Integer;
begin
  Result := False;
  for I := 0 to Screen.FormCount - 1 do
  begin
    if FindComponentRecurse(Screen.Forms[I], AComponentName, AComponent) then
      Exit(True); // <======
  end;
  for I := 0 to Screen.DataModuleCount - 1 do
  begin
    if FindComponentRecurse(Screen.DataModules[I], AComponentName, AComponent) then
      Exit(True); // <======
  end;
end;

class function TOTAHelper.FindComponentRecurse(const AParent: TComponent; const AComponentName: string; out AComponent: TComponent): Boolean;
var
  I: Integer;
begin
  AComponent := AParent.FindComponent(AComponentName);
  Result := AComponent <> nil;
  if not Result then
  begin
    for I := 0 to AParent.ComponentCount - 1 do
    begin
      if FindComponentRecurse(AParent.Components[I], AComponentName, AComponent) then
        Exit(True); // <=======
    end;
  end
  else
end;

class function TOTAHelper.FindMenu(const AParentItem: TMenuItem; const AMenuName: string; out AMenuItem: TMenuItem): Boolean;
var
  I: Integer;
begin
  Result := False;
  for I := 0 to AParentItem.Count - 1 do
  begin
    if CompareText(AParentItem[I].Name, AMenuName) = 0 then
    begin
      AMenuItem := AParentItem[I];
      Result := True;
      Break;
    end;
  end;
end;

class function TOTAHelper.FindToolsMenu(out AMenuItem: TMenuItem): Boolean;
begin
  Result := FindTopMenu(cToolsMenuItemName, AMenuItem);
end;

class function TOTAHelper.FindToolsSubMenu(const AMenuName: string; out AMenuItem: TMenuItem): Boolean;
var
  LToolsMenuItem: TMenuItem;
begin
  Result := False;
  if FindToolsMenu(LToolsMenuItem) then
    Result := FindMenu(LToolsMenuItem, AMenuName, AMenuItem);
end;

class function TOTAHelper.FindTopMenu(const AMenuName: string; out AMenuItem: TMenuItem): Boolean;
var
  LNTAServices: INTAServices;
begin
  Result := False;
  LNTAServices := BorlandIDEServices as INTAServices;
  if (LNTAServices = nil) or (LNTAServices.MainMenu = nil) then
    Exit; // <======
  Result := FindMenu(LNTAServices.MainMenu.Items, AMenuName, AMenuItem);
end;

class function TOTAHelper.GetProjectGroup: IOTAProjectGroup;
var
  LModuleServices: IOTAModuleServices;
  I: integer;
begin
  Result := nil;
  LModuleServices := BorlandIDEServices as IOTAModuleServices;
  for I := 0 To LModuleServices.ModuleCount - 1 do
  begin
    if LModuleServices.Modules[I].QueryInterface(IOTAProjectGroup, Result) = S_OK Then
      Break;
  end;
end;

(*
procedure SetActiveMobileDeviceToLocal(const Project: IOTAModule;
const NodeName, ProfileName, PlatformName, ActiveMobileDevice: string);
const
  cNoProfile = 'NoProfile';
var
  tempProfileName: string;
  localNode, localNodeChild: IXMLNode;
  auxStr: string;
begin
  localNode := (BorlandIDEServices as IOTAProjectFileStorage).AddNewSection(Project, NodeName, True);

  if ProfileName.IsEmpty then
    tempProfileName := cNoProfile
  else tempProfileName := ValidateXMLTag(ProfileName);

  localNodeChild := LocalNode.ChildNodes.FindNode(tempProfileName);
  if localNodeChild = nil then
    localNodeChild := LocalNode.AddChild(tempProfileName);
  auxStr := ActiveMobileDevice;
  localNodeChild.Attributes[PlatformName] := AuxStr.Replace('%','_');
end;
*)

class function TOTAHelper.GetProjectCurrentMobileDeviceName(const AProject: IOTAProject): string;
var
  LProfileName, LPlatform: string;
  LNode: IXMLNode;
//  I: Integer;
begin
  Result := '';
  if AProject <> nil then
  begin
    LProfileName := GetProjectCurrentConnectionProfile(AProject);
    LPlatform := AProject.CurrentPlatform;
    if not LProfileName.IsEmpty then
    begin
      LNode := (BorlandIDEServices as IOTAProjectFileStorage).GetProjectStorageNode(AProject, 'ActiveMobileDevice', True);
      if LNode <> nil then
      begin
//        TOSLog.d('ActiveMobileDevice node exists');
//        if LNode.ChildNodes.Count = 0 then
//          TOSLog.d('No child nodes');
//        for I := 0 to LNode.ChildNodes.Count - 1 do
//          TOSLog.d(LNode.ChildNodes.Get(I).NodeName);
        LNode := LNode.ChildNodes.FindNode('P'+ LProfileName);
//        if LNode = nil then
//          TOSLog.d('No child node for ' + LProfileName)
//        else if not LNode.HasAttribute(LPlatform) then
//          TOSLog.d('No attribute named ' + LPlatform);
        if (LNode <> nil) and LNode.HasAttribute(LPlatform) then
          Result := LNode.Attributes[LPlatform];
      end
      else
        TOSLog.d('No node for ActiveMobileDevice');
    end;
  end;
end;

class function TOTAHelper.GetActiveProject: IOTAProject;
var
  LGroup: IOTAProjectGroup;
begin
  Result := nil;
  LGroup := TOTAHelper.GetProjectGroup;
  if LGroup <> nil then
    Result := LGroup.ActiveProject;
end;

class function TOTAHelper.GetActiveProjectFileName: string;
var
  LProject: IOTAProject;
begin
  Result := '';
  LProject := TOTAHelper.GetActiveProject;
  if LProject <> nil then
    Result := LProject.FileName;
end;

class function TOTAHelper.GetProjectCurrentConnectionProfile(const AProject: IOTAProject): string;
var
  LPlatforms: IOTAProjectPlatforms;
begin
  Result := '';
  if Supports(AProject, IOTAProjectPlatforms, LPlatforms) then
    Result := LPlatforms.GetProfile(AProject.CurrentPlatform);
end;

class procedure TOTAHelper.SetProjectSDKVersion(const AProject: IOTAProject; const APlatform, ASDKVersion: string);
var
  LPlatforms: IOTAProjectPlatforms;
begin
  if Supports(AProject, IOTAProjectPlatforms, LPlatforms) then
  begin
    TOSLog.d('Current SDKVersion for %s is %s, changing to %s', [APlatform, LPlatforms.GetSDKVersion(APlatform), ASDKVersion]);
    LPlatforms.SetSDKVersion(APlatform, ASDKVersion);
  end;
end;

class function TOTAHelper.GetProjectDeployedFileName(const AProject: IOTAProject): string;
var
  LFileName: string;
begin
  Result := '';
  LFileName := AProject.ProjectOptions.TargetName;
  case GetProjectCurrentPlatform(AProject) of
    TProjectPlatform.macOS32, TProjectPlatform.macOS64:
      Result := TPath.GetFileName(LFileName + '.app');
    TProjectPlatform.iOSDevice32, TProjectPlatform.iOSDevice64:
      Result := TPath.GetFileName(LFileName + '.ipa');
  end;
end;

class function TOTAHelper.GetProjectDeployedPath(const AProject: IOTAProject): string;
var
  LFileName: string;
begin
  LFileName := AProject.ProjectOptions.TargetName;
  Result := LFileName.Substring(0, LFileName.LastIndexOf('\'));
end;

class function TOTAHelper.GetActiveProjectOptions: IOTAProjectOptions;
var
  LProject: IOTAProject;
begin
  Result := nil;
  LProject := TOTAHelper.GetActiveProject;
  if LProject <> nil then
    Result := LProject.ProjectOptions;
end;

class function TOTAHelper.GetProjectOptionsConfigurations(const AProject: IOTAProject): IOTAProjectOptionsConfigurations;
var
  LProjectOptions: IOTAProjectOptions;
begin
  Result := nil;
  LProjectOptions := AProject.ProjectOptions;
  if LProjectOptions <> nil then
    Supports(LProjectOptions, IOTAProjectOptionsConfigurations, Result);
end;

class function TOTAHelper.GetActiveProjectOptionsConfigurations: IOTAProjectOptionsConfigurations;
begin
  Result := GetProjectOptionsConfigurations(TOTAHelper.GetActiveProject);
end;

class function TOTAHelper.ExpandProjectActiveConfiguration(const ASource: string; const AProject: IOTAProject): string;
var
  LConfigs: IOTAProjectOptionsConfigurations;
begin
  Result := ASource;
  LConfigs := TOTAHelper.GetProjectOptionsConfigurations(AProject);
  if (LConfigs <> nil) and (LConfigs.ActiveConfiguration <> nil) then
  begin
    Result := StringReplace(Result, '$(Platform)', LConfigs.ActiveConfiguration.Platform, [rfReplaceAll, rfIgnoreCase]);
    Result := StringReplace(Result, '$(Config)', LConfigs.ActiveConfiguration.Name, [rfReplaceAll, rfIgnoreCase]);
  end;
end;

class function TOTAHelper.ExpandOutputDir(const ASource: string): string;
begin
  Result := ExpandProjectActiveConfiguration(ExpandVars(ASource), GetActiveProject);
end;

class procedure TOTAHelper.ExpandPaths(const APaths: TStrings; const AProject: IOTAProject = nil);
var
  LExpanded, LProjectPath: string;
  I: Integer;
begin
  LExpanded := ExpandVars(APaths.Text);
  if AProject <> nil then
    LExpanded := ExpandProjectActiveConfiguration(LExpanded, AProject);
  APaths.Text := LExpanded;
  LProjectPath := TPath.GetDirectoryName(AProject.FileName);
  for I := 0 to APaths.Count - 1 do
    APaths[I] := ExpandPath(LProjectPath, APaths[I]);
end;

class function TOTAHelper.ExpandVars(const ASource: string): string;
var
  LVars: TStrings;
  I: Integer;
begin
  Result := ASource;
  LVars := TStringList.Create;
  try
    GetEnvironmentVars(LVars, True);
    for I := 0 to LVars.Count - 1 do
      Result := StringReplace(Result, '$(' + LVars.Names[i] + ')', LVars.Values[LVars.Names[i]], [rfReplaceAll, rfIgnoreCase]);
  finally
    LVars.Free;
  end;
end;

class function TOTAHelper.GetProjectPath(const AProject: IOTAProject): string;
begin
  Result := TPath.GetDirectoryName(AProject.FileName);
end;

class function TOTAHelper.GetProjectOutputDir(const AProject: IOTAProject): string;
var
  LOptions: IOTAProjectOptions;
  LOutputDir: string;
begin
  Result := GetProjectPath(AProject);
  LOptions := AProject.ProjectOptions;
  if LOptions <> nil then
  begin
    LOutputDir := LOptions.Values[cProjectOptionOutputDir];
    Result := TOTAHelper.ExpandOutputDir(ExpandPath(Result, LOutputDir));
  end;
end;

class function TOTAHelper.GetRegKey: string;
begin
  Result := (BorlandIDEServices as IOTAServices).GetBaseRegistryKey;
end;

class function TOTAHelper.IsIDEClosing: Boolean;
var
  LMainForm: TComponent;
begin
  LMainForm := GetMainForm;
  Result := Application.Terminated or (LMainForm = nil) or not TForm(LMainForm).Visible or (csDestroying in LMainForm.ComponentState);
end;

class function TOTAHelper.IsIOSPlatform(const APlatform: string): Boolean;
begin
  Result := APlatform.Equals(ciOSDevice32Platform) or APlatform.Equals(ciOSDevice64Platform) or APlatform.Equals(ciOSSimulator32Platform);
end;

class function TOTAHelper.IsMacOSPlatform(const APlatform: string): Boolean;
begin
  Result := APlatform.Equals(ciOSDevice32Platform) or APlatform.Equals(ciOSDevice64Platform) or APlatform.Equals(ciOSSimulator32Platform)
    or APlatform.Equals(cOSX32Platform) or APlatform.Equals(cOSX64Platform);
end;

class function TOTAHelper.IsMatchingProfilePlatform(const APlatform, AProfilePlatform: string): Boolean;
begin
  Result := False;
  if AProfilePlatform.Equals(cOSX32Platform) or AProfilePlatform.Equals(cOSX64Platform) then
  begin
    Result := APlatform.Equals(ciOSDevice32Platform) or APlatform.Equals(ciOSDevice64Platform) or APlatform.Equals(ciOSSimulator32Platform)
      or APlatform.Equals(cOSX32Platform) or APlatform.Equals(cOSX64Platform)
  end
  else if AProfilePlatform.Equals(cLinux64Platform) then
    Result := APlatform.Equals(cLinux64Platform);
end;

class function TOTAHelper.OpenFile(const AFilename: string): Boolean;
var
  LActionServices: IOTAActionServices;
begin
  LActionServices := BorlandIDEServices as IOTAActionServices;
  if AFilename.EndsWith('.dproj') then
    Result := LActionServices.OpenProject(AFilename, True)
  else
    Result := LActionServices.OpenFile(AFilename);
end;

class procedure TOTAHelper.ApplyTheme(const AComponent: TComponent);
begin
  (BorlandIDEServices as IOTAIDEThemingServices).ApplyTheme(AComponent);
end;

class procedure TOTAHelper.RefreshProjectTree;
var
  LForm: TComponent;
  LControl: TControl;
begin
  if FindForm('ProjectManagerForm', LForm) then
  begin
    LControl := TControl(LForm.FindComponent('ProjectTree2'));
    if LControl <> nil then
      LControl.Invalidate;
  end;
end;

class procedure TOTAHelper.RegisterThemeForms(const AFormClasses: array of TCustomFormClass);
var
  LFormClass: TCustomFormClass;
begin
  for LFormClass in AFormClasses do
  begin
    {$IF CompilerVersion < 34}
    (BorlandIDEServices as IOTAIDEThemingServices250).RegisterFormClass(LFormClass);
    {$ELSE}
    (BorlandIDEServices as IOTAIDEThemingServices).RegisterFormClass(LFormClass);
    {$ENDIF}
  end;
end;

class function TOTAHelper.GetActiveProjectOutputDir: string;
var
  LProject: IOTAProject;
begin
  Result := '';
  LProject := TOTAHelper.GetActiveProject;
  if LProject <> nil then
    Result := TOTAHelper.GetProjectOutputDir(LProject);
end;

class function TOTAHelper.GetActiveProjectPath: string;
var
  LProject: IOTAProject;
begin
  Result := '';
  LProject := TOTAHelper.GetActiveProject;
  if LProject <> nil then
    Result := TOTAHelper.GetProjectPath(LProject);
end;

class function TOTAHelper.GetActiveSourceEditor: IOTASourceEditor;
begin
  Result := GetSourceEditor((BorlandIDEServices as IOTAModuleServices).CurrentModule);
end;

class function TOTAHelper.GetCurrentSelectedProject: IOTAProject;
var
  LIdent: string;
begin
  Result := (BorlandIDEServices as IOTAProjectManager).GetCurrentSelection(LIdent);
end;

class function TOTAHelper.GetSourceEditor(const AModule: IOTAModule): IOTASourceEditor;
var
  I: Integer;
begin
  Result := nil;
  if AModule <> nil then
  begin
    for I := 0 To AModule.GetModuleFileCount - 1 do
    begin
      if AModule.GetModuleFileEditor(I).QueryInterface(IOTASourceEditor, Result) = S_OK then
        Break;
    end;
  end;
end;

class function TOTAHelper.GetSourceEditorText(const ASourceEditor: IOTASourceEditor): string;
const
  cBufferSize = 1024;
var
  LReader: IOTAEditReader;
  LPosition, LRead: Integer;
  LBuffer: AnsiString;
begin
  if ASourceEditor = nil then
    Exit(''); //<======
  LReader := ASourceEditor.CreateReader;
  try
    LPosition := 0;
    repeat
      SetLength(LBuffer, cBufferSize);
      LRead := LReader.GetText(LPosition, PAnsiChar(LBuffer), cBufferSize);
      SetLength(LBuffer, LRead);
      Result := Result + string(LBuffer);
      Inc(LPosition, LRead);
    until LRead < cBufferSize;
  finally
    LReader := nil;
  end;
end;

class function TOTAHelper.GetVerInfoValue(const AVerInfo, AKey: string): string;
var
  LPair: TArray<string>;
  LString: string;
begin
  Result := '';
  for LString in AVerInfo.Split([';']) do
  begin
    LPair := LString.Split(['=']);
    if (Length(LPair) = 2) and SameText(AKey, LPair[0]) then
      Exit(LPair[1]);
  end;
end;

class function TOTAHelper.GetProjectPlatform(const APlatform: string): TProjectPlatform;
var
  LPlatform: TProjectPlatform;
begin
  Result := TProjectPlatform(-1);
  for LPlatform := Low(TProjectPlatform) to High(TProjectPlatform) do
  begin
    if SameText(APlatform, cProjectPlatforms[LPlatform]) then
      Exit(LPlatform); // <======
  end;
  if SameText(APlatform, 'Android') then
    Result := TProjectPlatform.Android32;
end;

class function TOTAHelper.GetProjectCurrentPlatform(const AProject: IOTAProject): TProjectPlatform;
begin
  Result := TProjectPlatform(-1);
  if AProject <> nil then
    Result := GetProjectPlatform(AProject.CurrentPlatform);
end;

class procedure TOTAHelper.GetProjectActiveEffectivePaths(const AProject: IOTAProject; const APaths: TStrings; const ABase: Boolean = False);
var
  LProjectOptionsConfigs: IOTAProjectOptionsConfigurations;
  LBuildConfig: IOTABuildConfiguration;
begin
  LProjectOptionsConfigs := GetProjectOptionsConfigurations(AProject);
  if ABase then
    LBuildConfig := LProjectOptionsConfigs.BaseConfiguration
  else
    LBuildConfig := LProjectOptionsConfigs.ActiveConfiguration;
  LBuildConfig.GetValues(sUnitSearchPath, APaths, True);
  APaths.Insert(0, TPath.GetDirectoryName(AProject.FileName));
end;

class function TOTAHelper.GetProjectBuildFileName(const AProject: IOTAProject; const AFileName: string): string;
begin
  Result := TPath.Combine(GetProjectPath(AProject), AFileName);
end;

class function TOTAHelper.GetEnvironmentOptions: IOTAEnvironmentOptions;
begin
  Result := (BorlandIDEServices as IOTAServices).GetEnvironmentOptions;
end;

class function TOTAHelper.GetMainForm: TComponent;
begin
  Result := Application.FindComponent('AppBuilder');
end;

end.
