pageextension 52408 "Report Selection - Prod. Order" extends "Report Selection - Prod. Order" //99000917
{
    // CAT.001 2023-06-29 CL - new pagext. Add fields for email subject line prefix and suffix.
    // CAT.002 2023-06-30 CL - add fields to indicate whether the prefix and suffix from companyinfo should be used.

    layout
    {
        addlast(Control1)
        {
            field("CATEM Add. Email Subj. Prefix"; Rec."CATEM Add. Email Subj. Prefix")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the text to prepend to email subject lines for this report selection.';
            }
            field("CATEM Add. Email Subj. Suffix"; Rec."CATEM Add. Email Subj. Suffix")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the text to append to email subject lines for this report selection.';
            }
            //>>CAT.002
            field("CATEM Use C.Inf.Eml.Subj.Pref."; Rec."CATEM Use C.Inf.Eml.Subj.Pref.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies whether to use the prefix defined in Company Information for this report selection, even if the field Subject Prefix All Emails is not set to true.';
            }
            field("CATEM Use C.Inf.Eml.Subj.Suff."; Rec."CATEM Use C.Inf.Eml.Subj.Suff.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies whether to use the suffix defined in Company Information for this report selection, even if the field Subject Suffix All Emails is not set to true.';
            }
            //<<CAT.002
        }
    }

    actions
    {

    }
}
