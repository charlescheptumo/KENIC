#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69185 "Training Needs Requests"
{

    fields
    {
        field(1; "Entry No."; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2; Description; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(3; Source; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Appraisal,Government Directive,Other,Career Development';
            OptionMembers = Appraisal,"Government Directive",Other,"Career Development";
        }
        field(4; Comments; Text[200])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "No. of Linked Objectives"; Integer)
        {
        }
        field(6; "Training Header No."; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Course ID"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Training Courses Setup".Code;

            trigger OnValidate()
            begin
                TrainingCoursesSetup.Reset;
                TrainingCoursesSetup.SetRange(Code, "Course ID");
                if TrainingCoursesSetup.FindSet then begin
                    // "Name of Course" := TrainingCoursesSetup."Name of Course";
                    Description := TrainingCoursesSetup.Descritpion;
                    Institution := TrainingCoursesSetup.Institution;
                    Rec.Validate(Institution);
                end;

                // EmpTrainingAttended.Reset();
                // EmpTrainingAttended.SetRange(Course, "Course ID");
                // if EmpTrainingAttended.FindSet then begin
                //     repeat
                //         EmpTrainingAttended."Course Name" := "Name of Course";
                //         EmpTrainingAttended.Institution := Institution;
                //         EmpTrainingAttended.Modify;
                //     until EmpTrainingAttended.next = 0;
                // end else begin
                //     repeat
                //         EmpTrainingAttended.Init;
                //         EmpTrainingAttended.Course := "Course ID";
                //         EmpTrainingAttended."Course Name" := "Name of Course";
                //         EmpTrainingAttended.Institution := Institution;
                //         EmpTrainingAttended.Insert;
                //     until EmpTrainingAttended.next = 0;
                // end;
            end;
        }
        field(8; "Name of Course"; Text[1050])
        {
            DataClassification = ToBeClassified;
        }
        field(9; Institution; Code[1000])
        {
            TableRelation = Vendor;

            trigger OnValidate()
            var
                Vendor: Record Vendor;
            begin
                Vendor.Reset();
                Vendor.SetRange("No.", Institution);
                if Vendor.Find('-') then begin
                    "Institution Name" := Vendor.Name;
                end
            end;
        }
        field(10; "Planned Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Institution Name"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
         field(12;"Cost";Decimal)
        {
            DataClassification = ToBeClassified;
        }
         field(13;"Trainer";Text[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = Vendor where(Trainer = const(true));
        }
        field(14;"Venue";Text[50])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Entry No.", "Training Header No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        HRSetup: Record "Human Resources Setup";
        NoSeriesMgt: Codeunit "No. Series";
        TrainingCoursesSetup: Record "Training Courses Setup";
        EmpTrainingAttended: Record EmpTrainingAttended;
}
