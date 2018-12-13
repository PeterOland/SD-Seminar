page 50101 "CSD Seminar Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "CSD Seminar";
    Caption = 'Seminar';

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("No."; "No.")
                {
                    ApplicationArea = All;

                }
                field(Name; Name)
                {
                    ApplicationArea = All;

                }
                field("Search Name"; "Search Name")
                {
                    ApplicationArea = All;

                }
                field("Seminar duration"; "Seminar duration")
                {
                    ApplicationArea = All;

                }
                field("Minimum participants"; "Minimum participants")
                {
                    ApplicationArea = All;

                }
                field("Maximum participants"; "Maximum participants")
                {
                    ApplicationArea = All;

                }
                field(Blocked; Blocked)
                {
                    ApplicationArea = All;

                }
                field("Last Date Modified"; "Last Date Modified")
                {
                    ApplicationArea = All;

                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;
}