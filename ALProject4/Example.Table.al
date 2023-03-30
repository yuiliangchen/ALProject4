table 50125 Example
{
    DataClassification = CustomerContent;
    Caption = 'Example';

    fields
    {
        field(1;"No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'No.';
        }
        field(2; Description; Text[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Description';
        }
        field(3; "Example Type Code"; Code[10])
        {
            DataClassification = CustomerContent;
            Caption = 'Example Type';
            TableRelation = "Example Type";
        }
        field(4; "No. Series"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'No. Series';
        }
    }
    
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }
    var
        NoSeriesManagement: Codeunit NoSeriesManagement;
        ExampleSetup: Record "Example Setup";
    trigger OnInsert();
    begin
        if "No." = '' then begin
            ExampleSetup.Get();
            ExampleSetup.TestField("Example Nos.");
            NoSeriesManagement.InitSeries(ExampleSetup."Example Nos.",
                                        xRec."No. Series",
                                        0D,
                                        "No.",
                                        "No. Series");
        end;
    end;
    procedure AssistEdit(OldExample: Record Example): Boolean
    var
        Example: Record Example;
    begin
        with Example do begin
            Example := Rec;
            ExampleSetup.Get();
            ExampleSetup.TestField("Example Nos.");
            if NoSeriesManagement.SelectSeries(ExampleSetup."Example Nos.", 
                                            OldExample."No. Series", 
                                            "No. Series") then begin
                NoSeriesManagement.SetSeries("No.");
                Rec := Example;
                exit(true);
            end;
        end;
    end;
}