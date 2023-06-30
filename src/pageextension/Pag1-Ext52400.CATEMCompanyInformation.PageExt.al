pageextension 52400 "CATEM Company Information" extends "Company Information" //1
{
    // CAT.001 2023-06-29 CL - new pagext. Add fields for subject.
    layout
    {
        addlast(Communication)
        {
            field("CATEM Email Subject Prefix"; Rec."CATEM Email Subject Prefix")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the text to add to the start of email subject lines.';
            }
            field("CATEM Subj. Prefix All Emails"; Rec."CATEM Subj. Prefix All Emails")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies whether to add the prefix to the subject lines of all emails.';
            }
            field("CATEM Email Subject Suffix"; Rec."CATEM Email Subject Suffix")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the text to add to the end of email subject lines.';
            }
            field("CATEM Subj. Suffix All Emails"; Rec."CATEM Subj. Suffix All Emails")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies whether to add the suffix to the subject lines of all emails.';
            }
        }
    }

    actions
    {

    }
}
