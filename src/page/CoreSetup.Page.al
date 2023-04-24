page 51000 "VDTMP Core Setup"
{
    Caption = 'Customer Core Setup', Comment = 'DEU="Customer Core Einrichtung",ENU="Customer Core Setup"';
    PageType = Card;
    SourceTable = "VDTMP Core Setup";
    InsertAllowed = false;
    ApplicationArea = All;
    UsageCategory = Administration;
    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General', Comment = 'DEU="Allgemein",ENU="General"';
                field(AppVersion; Format(AppInfo.AppVersion()))
                {
                    Caption = 'App Version', Comment = 'DEU="App Version",ENU="App Version"';
                    ToolTip = 'Shows current app version', Comment = 'DEU="App Version",ENU="Shows current app version"';
                    ApplicationArea = All;
                    Importance = Additional;
                    Editable = false;
                }
            }
        }
    }

    var
        AppInfo: ModuleInfo;

    trigger OnOpenPage()
    begin
        if not Rec.Get() then begin
            Rec.Init();
            Rec.Insert();
        end;

        NavApp.GetCurrentModuleInfo(AppInfo);
    end;

}
