table 50127 "Example Header"
{
    DataClassification = CustomerContent;
    Caption = 'Example Header';
    LookupPageId = "Example Header List";
    DrillDownPageId = "Example Header List";
    
    fields
    {
        field(1;"No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'No.';
        }
        field(2; "Document Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Document Date';
        }
        field(3; "No. Series"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'No. Series';
        }
        field(10; "Posting Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Posting Date';
        }
        field(13; "No. Printed"; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'No. Printed';
            Editable = false;
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
        ExampleHeader: Record "Example Header";
        ExampleLine: Record "Example Line";    
    trigger OnInsert();
    begin
        if "No." = '' then begin
            ExampleSetup.Get();
            ExampleSetup.TestField("Document Nos.");
            NoSeriesManagement.InitSeries(ExampleSetup."Document Nos.",
                                        xRec."No. Series",
                                        0D,
                                        "No.",
                                        "No. Series");
        end;
        InitRecord();
    end;
    procedure AssistEdit(OldExampleHeader: Record "Example Header"): Boolean
    var
        ExampleHeader: Record "Example Header";
    begin
        ExampleHeader := Rec;
        ExampleSetup.Get();
        ExampleSetup.TestField("Document Nos.");
        if NoSeriesManagement.SelectSeries(ExampleSetup."Document Nos.",
                                        OldExampleHeader."No. Series",
                                        ExampleHeader."No. Series") then begin
            NoSeriesManagement.SetSeries(ExampleHeader."No.");
            Rec := ExampleHeader;
            exit(true);
        end;

    end;
    procedure InitRecord()
    begin
        if "Posting Date" = 0D then
            "Posting Date" := WorkDate();
        "Document Date" := WorkDate();
    end;
}