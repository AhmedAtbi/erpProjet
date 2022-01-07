page 50108 "Student Marks List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    Caption = 'Students Marks List';
    SourceTable = "Student";
    InsertAllowed = true;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = All;
                    Caption = 'First Name';

                }
                field("Last name"; Rec."Last Name")
                {
                    ApplicationArea = All;
                    Caption = 'Last name';

                }
                field(Mark; Note)
                {
                    ApplicationArea = All;
                    Caption = 'Mark';
                    trigger OnValidate()
                    var
                        Difference: Decimal;
                    begin
                        StudentEntry.Reset();
                        StudentEntry.SetRange(id_Student, Rec.CIN);
                        StudentEntry.SetRange("Classroom ID", Rec.Classroom);
                        StudentEntry.SetRange(id_Cours, IDCours);
                        if Not StudentEntry.IsEmpty then begin
                            StudentEntry.CalcSums(Mark);
                            Difference := Note - StudentEntry.Mark;
                            StudentEntry.Init();
                            StudentEntry.Validate(id_Student, Rec.CIN);
                            StudentEntry.Validate("Classroom ID", Rec.Classroom);
                            StudentEntry.Validate(id_Cours, IDCours);
                            StudentEntry.Validate(Mark, Difference);
                            StudentEntry.Insert();
                        end else begin
                            StudentEntry.Init();
                            StudentEntry.Validate(id_Student, Rec.CIN);
                            StudentEntry.Validate("Classroom ID", Rec.Classroom);
                            StudentEntry.Validate(id_Cours, IDCours);
                            StudentEntry.Validate(Mark, Note);
                            StudentEntry.Insert();
                        end;



                    end;

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
    var
        Note: Decimal;

        StudentEntry: Record "Student Entries Table";
        IDCours: Code[20];

    trigger OnAfterGetRecord()
    var

    begin
        StudentEntry.Reset();
        StudentEntry.SetRange(id_Student, Rec.CIN);
        StudentEntry.SetRange("Classroom ID", Rec.Classroom);
        StudentEntry.SetRange(id_Cours, IDCours);
        if StudentEntry.FindSet() then begin
            StudentEntry.CalcSums(Mark);
            Note := StudentEntry.Mark;
        end

    end;


    procedure SetCoursID(CoursID: Code[20])
    begin
        IDCours := CoursID;
    end;
}