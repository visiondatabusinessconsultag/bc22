codeunit 51000 "VDTMP App Install Mgt."
{
    /// <summary>
    /// logic for App Installation
    /// </summary>
    Subtype = Install;

    var
        AppUgradeMgt: Codeunit "VDTMP App Upgrade Mgt.";

    trigger OnInstallAppPerCompany()
    begin
        AppUgradeMgt.UpdateDataClassification();
    end;

    trigger OnInstallAppPerDatabase()
    begin
        AppUgradeMgt.AssignAppPermissions();
    end;


}
