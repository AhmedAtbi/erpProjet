page 50106 "ClassroomCourses List"
{
    PageType = List;

    SourceTable = "Teacher Entries";
    Caption = 'Teacher Entries List';

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {

                field(id_Classroom; Rec.id_Classroom)
                {
                    ApplicationArea = All;
                    trigger OnValidate()

                    begin
                        CurrPage.Update();
                    end;

                }
                field("Classroom Description"; Rec."Classroom Description")
                {
                    ApplicationArea = All;

                }
                field(id_Cours; Rec.id_Cours)
                {
                    ApplicationArea = All;
                    trigger OnValidate()

                    begin
                        CurrPage.Update();
                    end;

                }
                field("Cours Description"; Rec."Cours Description")
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
            action("Mark")
            {
                ApplicationArea = All;
                Caption = 'Mark';
                Promoted = true;
                PromotedCategory = Process;
                Image = AddWatch;

                trigger OnAction()
                var
                    StudentMark: Page "Student Marks List";
                    Student: Record Student;
                begin
                    StudentMark.SetCoursID(Rec.id_Cours);
                    Student.SetRange(Classroom, Rec.id_Classroom);
                    StudentMark.SetTableView(Student);
                    StudentMark.Run();
                end;

            }
        }
    }


}