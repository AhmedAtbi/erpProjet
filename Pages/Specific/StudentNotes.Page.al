page 50107 "Student Notes List"
{
    PageType = ListPart;
    Caption = 'Students Notes List';
    SourceTable = "Student Entries Table";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(Cours; Rec."Cours Description")
                {
                    ApplicationArea = All;
                    Caption = 'Cours';

                }
                field(Mark; Rec.Mark)
                {
                    ApplicationArea = All;
                    Caption = 'Mark';

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

                trigger OnAction();
                begin

                end;
            }
        }
    }
}