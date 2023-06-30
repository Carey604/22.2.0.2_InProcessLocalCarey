tableextension 52400 "CATEM Company Information" extends "Company Information" //79
{
    // CAT.001 2023-06-29 CL - add fields.
    fields
    {
        field(52400; "CATEM Email Subject Prefix"; Text[100])
        {
            DataClassification = CustomerContent;
            Caption = 'Email Subject Prefix';
        }
        field(52401; "CATEM Subj. Prefix All Emails"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Subject Prefix All Emails';
        }
        field(52405; "CATEM Email Subject Suffix"; Text[100])
        {
            DataClassification = CustomerContent;
            Caption = 'Email Subject Suffix';
        }
        field(52406; "CATEM Subj. Suffix All Emails"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Subject Suffix All Emails';
        }
    }
}
