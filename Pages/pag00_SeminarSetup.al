page 50100 "CSD Seminar Setup"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "CSD Seminar Setup";
    Caption = 'Seminar setup';
    InsertAllowed = false;
    DeleteAllowed = false;

    layout
    {
        area(Content)
        {
            group(Numbering)
            {
                field("Seminar Nos."; "Seminar Nos.")
                {
                    ApplicationArea = All;
                    Caption = 'Seminar Nos.';
                }
                field("Seminar Registration Nos."; "Seminar Registration Nos.")
                {
                    ApplicationArea = All;
                    Caption = 'Seminar registration Nos.';
                }
                field("Posted Seminar Reg. Nos."; "Posted Seminar Reg. Nos.")
                {
                    ApplicationArea = All;
                    Caption = 'Posted seminar reg. Nos.';
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        if not get then begin
            init;
            insert;
        end;
    end;
}