permissionset 51000 "VDTMP Base"
{
    Assignable = true;
    Caption = 'Core Base', Comment = 'DEU="Core Basis",ENU="Core Base"', MaxLength = 30;
    Permissions =
        table "VDTMP Core Setup" = X,

        tabledata "VDTMP Core Setup" = RMID,

        codeunit "VDTMP App Upgrade Mgt." = X,
        codeunit "VDTMP App Install Mgt." = X,

        page "VDTMP Core Setup" = X,
        page "VDTMP Role Center" = X;
}
