page 50126 "Example List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Example;
    Caption = 'Example List';
    Editable = false;
    CardPageId = "Example Card";
    
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;                    
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