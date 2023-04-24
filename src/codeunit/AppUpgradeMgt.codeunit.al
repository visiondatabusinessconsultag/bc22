codeunit 51001 "VDTMP App Upgrade Mgt."
{
    /// <summary>
    /// logic for App Upgrade
    /// </summary>
    Subtype = Upgrade;
    trigger OnUpgradePerDatabase()
    begin
        AssignAppPermissions();
    end;

    trigger OnUpgradePerCompany()
    begin
        UpdateDataClassification();
    end;

    /// <summary>
    /// Assign App Permissions
    /// </summary>
    procedure AssignAppPermissions()
    var
        User: Record User;
        AccessControl: Record "Access Control";
        BasePermSetLbl: label 'VDTMP Base', locked = true;
    begin
        User.SetRange(State, User.State::Enabled);
        if User.FindSet() then
            repeat
                AccessControl.SetRange("User Security ID", User."User Security ID");
                AccessControl.SetRange("Role ID", BasePermSetLbl);
                if AccessControl.IsEmpty() then begin
                    AccessControl.Init();
                    AccessControl."User Security ID" := User."User Security ID";
                    AccessControl."Role ID" := BasePermSetLbl;
                    AccessControl.Insert();
                end;
            until User.Next() = 0;
    end;

    /// <summary>
    /// Update Data Sensitivity / Privacy Classification
    /// </summary>
    procedure UpdateDataClassification()
    var
        AppInfo: ModuleInfo;
        AllObj: Record AllObj;
        Field: Record Field;
        DataClassificationMgt: Codeunit "Data Classification Mgt.";
    begin
        NavApp.GetCurrentModuleInfo(AppInfo);
        AllObj.SetRange("Object Type", AllObj."Object Type"::Table);
        AllObj.SetRange("App Package ID", AppInfo.PackageId);
        if AllObj.FindSet() then
            repeat
                DataClassificationMgt.SetTableFieldsToNormal(AllObj."Object ID");
            until AllObj.Next() = 0;

        Field.setrange("App Package ID", AppInfo.PackageId);
        if Field.FindSet() then
            repeat
                DataClassificationMgt.SetFieldToNormal(Field.TableNo, Field."No.");
            until Field.Next() = 0;
    end;


}
