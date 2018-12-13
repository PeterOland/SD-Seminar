tableextension 50100 "CSD Resource Ext" extends Resource
{
    fields
    {
        modify("Profit %")
        {
            trigger OnAfterValidate()
            begin
                rec.TestField("Unit Cost");
            end;
        }
        modify(Type)
        {
            OptionCaption = 'Instructor,Room';
        }
        field(50101; "CSD Resource Type"; Option)
        {
            DataClassification = CustomerContent;
            Caption = 'Resource Type';
            OptionMembers = Internal,External;
            OptionCaption = 'Internal,External';
        }
        field(50102; "CSD Maximum Participants"; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Maximum participants';
        }
        field(50103; "CSD Quantity per day"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Quantity per day';
        }
    }

}