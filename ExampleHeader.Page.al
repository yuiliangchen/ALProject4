page 50128 "Example Header"
{
    PageType = Document;
    UsageCategory = None;
    SourceTable = "Example Header";
    Caption = 'Example';

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    trigger OnAssistEdit()
                    begin
                        if Rec.AssistEdit(xRec) then
                            CurrPage.Update(); 
                    end;

                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = All;
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = All;
                }
                field("No. Printed"; Rec."No. Printed")
                {
                    ApplicationArea = All;
                }
            }
            part(ExampleLines; "Example Line Subform")
            {
                SubPageLink = "Document No." = field("No.");
            }
        }
    }
}