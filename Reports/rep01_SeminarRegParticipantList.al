report 50101 "CSD SeminarRegParticipantList"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    RDLCLayout='./Layouts/SeminarRegParticipantList.rdl';
    
    dataset
    {
        dataitem(SeminarRegistrationHeader; "CSD Seminar Reg. Header")
        {
            DataItemTableView=sorting("No.");
            RequestFilterFields="No.","Seminar No.";
            column(No_; "No.")
            {
                IncludeCaption=True;
            }
            column(Seminar_No_; "Seminar No.")
            {
                IncludeCaption=True;
            }
            column(Seminar_Name;"Seminar Name")
            {
                IncludeCaption=True;
            }
            column(Starting_Date; "Starting Date")
            {
                IncludeCaption=True;
            }
            column(Duration; Duration)
            {
                IncludeCaption=True;
            }
            column(Instructor_Name;"Instructor Name")
            {
                IncludeCaption=True;
            }
            column(Room_Name;"Room Name")
            {
                IncludeCaption=True;
            }
            dataitem("CSD Seminar Registration Line";"CSD Seminar Registration Line")
            {
                DataItemTableView=sorting("Document No.","Line No.");
                DataItemLink="Document No."=field("No.");
                column(Bill_to_Customer_No_;"Bill-to Customer No.")
                {
                    IncludeCaption=True;
                }
                column(Participant_Contact_No_;"Participant Contact No.")
                {
                    IncludeCaption=true;
                }
                column(Participant_Name;"Participant Name")
                {
                    IncludeCaption=true;
                }
            }
        }
        dataitem("Company Information";"Company Information")
        {
            column(Company_Name;Name)
        }
    }
    
    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                    field(Name; SourceExpression)
                    {
                        ApplicationArea = All;
                        
                    }
                }
            }
        }
    
        actions
        {
            area(processing)
            {
                action(ActionName)
                {
                    ApplicationArea = All;
                    
                }
            }
        }
    }
    
    var
        myInt: Integer;
}