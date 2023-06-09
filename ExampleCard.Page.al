page 50125 "Example Card"
{
    PageType = Card;
    UsageCategory = None;
    SourceTable = Example;
    Caption = 'Example Card';
    
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
                        if Rec.AssistEdit(xRec) then
                            CurrPage.Update();                        
                    end;
                    
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field("Example Type Code"; Rec."Example Type Code")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}