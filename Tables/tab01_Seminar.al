table 50101 "CSD Seminar"
{
    DataClassification = CustomerContent;

    fields
    {
        field(10; "No."; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'No.';
            trigger OnValidate()
            begin
                if "No." <> xRec."No." then begin
                    SeminarSetup.Get;
                    NoSeriesMgt.TestManual(SeminarSetup."Seminar Nos.");
                    "No. Series" := '';
                end;
            end;
        }
        field(20; "Name"; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Name';
            trigger OnValidate()
            begin
                if ("Search Name" = UpperCase(xRec.Name)) or
                   ("Search Name" = '') then
                    "Search Name" := Name;
            end;
        }
        field(30; "Seminar duration"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Seminar duration';
            DecimalPlaces = 0 : 1;
        }
        field(40; "Minimum participants"; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'Min. participants';
        }
        field(50; "Maximum participants"; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'Max. participants';
        }
        field(60; "Search Name"; Code[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Search name';
        }
        field(70; "Blocked"; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Blocked';
        }
        field(80; "Last Date Modified"; Date)
        {
            DataClassification = ToBeClassified;
            Caption = 'Last date modified';
            Editable = false;
        }
        field(90; "Comment"; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Comment';
            Editable = false;
        }
        field(100; "Seminar Price"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Seminar price';
            AutoFormatType = 1;
        }
        field(110; "Gen. Prod. Posting Group"; Code[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'Gen. prod. posting grp.';
            TableRelation = "Gen. Product Posting Group";
            trigger OnValidate()
            begin
                if (xRec."Gen. Prod. Posting Group" <> "Gen. Prod. Posting Group") then begin
                    if GenProdPostingGroup.ValidateVatProdPostingGroup(GenProdPostingGroup, "Gen. Prod. Posting Group") then Validate("VAT Prod. Posting Group", GenProdPostingGroup."Def. VAT Prod. Posting Group");
                end;
            end;
        }
        field(120; "VAT Prod. Posting Group"; Code[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'VAT prod. posting grp.';
            TableRelation = "VAT Product Posting Group";
        }
        field(130; "No. Series"; Code[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'No. series';
            TableRelation = "No. Series";
            Editable = false;
        }
    }

    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
        key(Search; "Search Name")
        {
        }
    }

    var
        SeminarSetup: Record "CSD Seminar Setup";
        Seminar: Record "CSD Seminar";
        GenProdPostingGroup: Record "Gen. Product Posting Group";
        NoSeriesMgt: Codeunit NoSeriesManagement;

    trigger OnInsert()
    begin
        If "No." = '' then begin
            SeminarSetup.Get;
            SeminarSetup.TestField("Seminar Nos.");
            NoSeriesMgt.InitSeries(SeminarSetup."Seminar Nos.", xRec."No. Series", 0D, "No.", "No. Series");
        end;
    end;

    trigger OnModify()
    begin
        "Last Date Modified" := Today();
    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin
        "Last Date Modified" := Today();
    end;

    procedure AssistEdit(): Boolean
    begin
        with Seminar do begin
            Seminar := Rec;
            SeminarSetup.get;
            SeminarSetup.TestField("Seminar Nos.");
            if NoSeriesMgt.SelectSeries(SeminarSetup."Seminar Nos.", xRec."No. Series", "No. Series") then begin
                NoSeriesMgt.SetSeries("No.");
                Rec := Seminar;
                exit(true);
            end;
        end;
    end;
}