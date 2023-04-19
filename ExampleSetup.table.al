table 50124 "Example Setup"
{
    Caption = 'Example Setup';
    DataClassification = CustomerContent;
    DrillDownPageId = "Example Setup";
    LookupPageId = "Example Setup";
    
    fields
    {
        field(1;"Primary Key"; Code[10])
        {
        }
        field(2; "Example Nos."; Code[20])
        {
            TableRelation = "No. Series";
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