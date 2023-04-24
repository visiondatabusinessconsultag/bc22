table 51000 "VDTMP Core Setup"
{
    Caption = 'VDTMP Core Setup';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key', Comment = 'DEU="Primärschlüssel",ENU="Primary Key"';
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }
}
