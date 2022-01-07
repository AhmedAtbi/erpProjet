table 50104 "Teacher Entries"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; id_Teacher; Code[10])
        {
            DataClassification = CustomerContent;
            TableRelation = Teacher;
            Caption = 'ID Teacher';

        }
        field(2; id_Classroom; Code[10])
        {
            DataClassification = CustomerContent;
            TableRelation = Classroom;
            Caption = 'ID Classroom';

        }
        field(3; id_Cours; Code[10])
        {
            DataClassification = CustomerContent;
            TableRelation = Course;
            Caption = 'ID Course';

        }
        field(4; "Classroom Description"; Text[100])
        {

            FieldClass = FlowField;
            CalcFormula = lookup(Classroom.Description where("Short Description" = field(id_Classroom)));
            Caption = 'Classroom Description';

        }
        field(5; "Cours Description"; Text[100])
        {

            FieldClass = FlowField;
            CalcFormula = lookup(Course.Description where(Id = field(id_Cours)));
            Caption = 'Cours Description';

        }
    }

    keys
    {
        key(PK3; id_Teacher, id_Classroom, id_Cours)
        {
            Clustered = true;
        }
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}