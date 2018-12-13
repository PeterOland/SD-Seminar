pageextension 50101 "CSD Resource List Ext" extends "Resource List"
{
    layout
    {
        modify(Type)
        {
            Visible = ShowType;
        }
        addafter(Type)
        {
            field("CSD Resource Type"; "CSD Resource Type")
            {

            }
            field("CSD Maximum Participants"; "CSD Maximum Participants")
            {
                Visible = ShowMax;
            }
        }
    }

    trigger OnOpenPage()
    begin
        ShowType := (GetFilter(Type) = '');
        ShowMax := (GetFilter(Type) = format(Type::Machine));
    end;

    var
        [InDataSet]
        ShowMax: Boolean;
        [InDataSet]
        ShowType: Boolean;
}