table 50105 "Student Entries Table"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; id_Student; Code[10])
        {
            DataClassification = CustomerContent;
            Caption = 'Id Student';
            TableRelation = Student;

        }

        field(2; id_Cours; Code[10])
        {
            DataClassification = CustomerContent;
            Caption = 'Id Cours';
            TableRelation = Course;

        }

        field(3; "Cours Description"; Text[100])
        {

            FieldClass = FlowField;
            Caption = 'Cours description';
            CalcFormula = lookup(Course.Description where(Id = field(id_Cours)));

        }

        field(4; Mark; Decimal)
        {
            MinValue = 0;
            MaxValue = 20;
            Caption = 'Mark subject';
        }

        field(5; "Classroom ID"; Code[10])
        {
            DataClassification = CustomerContent;
            TableRelation = Classroom;

        }
    }

    keys
    {
        key(PK4; id_Student, id_Cours, "Classroom ID", Mark)
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