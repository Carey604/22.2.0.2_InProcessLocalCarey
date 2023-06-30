tableextension 52401 "CATEM Report Selections" extends "Report Selections" //77
{
    // CAT.001 2023-06-29 CL - new tab ext. Add subject line functionality.
    fields
    {
        field(52400; "CATEM Add. Email Subj. Prefix"; Text[100])
        {
            DataClassification = CustomerContent;
            Caption = 'Additional Email Subject Prefix';
        }
        field(52405; "CATEM Add. Email Subj. Suffix"; Text[100])
        {
            DataClassification = CustomerContent;
            Caption = 'Additional Email Subject Suffix';
        }
    }
}
