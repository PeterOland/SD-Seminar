pageextension 50100 "CSD Resource Card Ext" extends "Resource Card"
{
    layout
    {
        addlast(General)
        {
            field("CSD Resource Type"; "CSD Resource Type")
            {

            }
            field("CSD Quantity per day"; "CSD Quantity per day")
            {

            }
        }
        addafter("Personal Data")
        {
            group("Room")
            {
                Caption = 'Room';
                Visible = ShowMax;
                field("CSD Maximum Participants"; "CSD Maximum Participants")
                {

                }
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }
    trigger OnAfterGetRecord()
    begin
        ShowMax := (Type = Type::Machine);
        ShowRoom := (Type = Type::Machine);
        CurrPage.Update(false);
    end;

    var
        [InDataSet]
        ShowRoom: Boolean;
        ShowMax: Boolean;
}