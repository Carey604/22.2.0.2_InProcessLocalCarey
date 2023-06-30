tableextension 52401 "CATEM Report Selections" extends "Report Selections" //77
{
    // CAT.001 2023-06-29 CL - new tab ext. Add subject line functionality.
    // CAT.002 2023-06-30 CL - add fields to indicate whether the prefix and suffix from companyinfo should be used.
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
        //>>CAT.002
        field(52406; "CATEM Use C.Inf.Eml.Subj.Pref."; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Use Company Information Email Subject Prefix';
        }
        field(52407; "CATEM Use C.Inf.Eml.Subj.Suff."; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Use Company Information Email Subject Suffix';
        }
        //<<CAT.002
    }
}
