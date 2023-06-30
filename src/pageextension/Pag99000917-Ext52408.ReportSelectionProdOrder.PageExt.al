pageextension 52408 "Report Selection - Prod. Order" extends "Report Selection - Prod. Order" //99000917
{
    //CAT.001 2023-06-29 CL - new pagext. Add fields for email subject line prefix and suffix.

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
        }
    }

    actions
    {

    }
}
