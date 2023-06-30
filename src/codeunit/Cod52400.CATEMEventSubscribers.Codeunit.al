codeunit 52400 "CATEM Event Subscribers"
{
    //CAT.001 2023-06-29 CL - new codeunit. Add to email subect line.

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Document-Mailing", OnBeforeGetEmailSubject, '', false, false)]
    local procedure OnBeforeGetEmailSubject(PostedDocNo: Code[20]; EmailDocumentName: Text[250]; ReportUsage: Integer; var EmailSubject: Text[250]; var IsHandled: Boolean);
    var
        EmailSubjectCapTxt: Label '%1 - %2 %3', Comment = '%1 = Customer Name. %2 = Document Type %3 = Invoice No.';
        EmailSubjectPluralCapTxt: Label '%1 - %2', Comment = '%1 = Customer Name. %2 = Document Type in plural form';
    begin
        CompanyInformation.GetRecordOnce();
        if PostedDocNo = '' then
            EmailSubject := CopyStr(
                StrSubstNo(EmailSubjectPluralCapTxt, CompanyInformation.Name, EmailDocumentName), 1, MaxStrLen(EmailSubject))
        else
            EmailSubject := CopyStr(
                StrSubstNo(EmailSubjectCapTxt, CompanyInformation.Name, EmailDocumentName, PostedDocNo), 1, MaxStrLen(EmailSubject));

        AddToSubjectFromReportSelections(ReportUsage, EmailSubject);
        IsHandled := true;
    end;

    procedure AddToSubjectFromReportSelections(ReportUsage: Integer; var EmailSubject: Text[250])
    var
        ReportSelections: Record "Report Selections";
        ReportSelectionUsageEnum: Enum "Report Selection Usage";
        EmailSubjectText: Text;
    begin
        CompanyInformation.GetRecordOnce();
        ReportSelectionUsageEnum := "Report Selection Usage".FromInteger(ReportUsage);

        EmailSubjectText := EmailSubject;

        ReportSelections.SetRange(Usage, ReportSelectionUsageEnum);
        //ReportSelections.SetRange("Use for Email Body", true);
        if ReportSelections.FindSet() then
            repeat
                if ReportSelections."CATEM Add. Email Subj. Prefix" > '' then
                    EmailSubjectText := ReportSelections."CATEM Add. Email Subj. Prefix" + ' ' + EmailSubjectText;
                EmailSubjectText := DelChr(EmailSubjectText, '>', ' ');
                if ReportSelections."CATEM Add. Email Subj. Suffix" > '' then begin
                    if EmailSubjectText > '' then
                        EmailSubjectText := EmailSubjectText + ' ' + ReportSelections."CATEM Add. Email Subj. Suffix"
                    else
                        EmailSubjectText := ReportSelections."CATEM Add. Email Subj. Suffix";
                end;
            until ReportSelections.Next() = 0;

        //>>CAT.002
        if (CompanyInformation."CATEM Email Subject Prefix" > '') and not CompanyInformation."CATEM Subj. Prefix All Emails" then //not CompanyInformation."CATEM Subj. Prefix All Emails" because if it is true, it will get done later by OnSendViaEmailModuleOnAfterCreateMessage
            EmailSubjectText := delchr(CompanyInformation."CATEM Email Subject Prefix" + ' ' + EmailSubjectText, '>', ' ');
        if (CompanyInformation."CATEM Email Subject Suffix" > '') and not CompanyInformation."CATEM Subj. Suffix All Emails" then //not CompanyInformation."CATEM Subj. Suffix All Emails" because if it is true, it will get done later by OnSendViaEmailModuleOnAfterCreateMessage
            if EmailSubjectText > '' then
                EmailSubjectText := EmailSubjectText + ' ' + CompanyInformation."CATEM Email Subject Suffix"
            else
                EmailSubjectText := CompanyInformation."CATEM Email Subject Suffix";
        //CAT.002

        EmailSubject := CopyStr(EmailSubjectText, 1, MaxStrLen(EmailSubject));
    end;


    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Mail Management", OnSendViaEmailModuleOnAfterCreateMessage, '', false, false)]
    local procedure cod9520_OnSendViaEmailModuleOnAfterCreateMessage(var Message: Codeunit "Email Message"; var TempEmailItem: Record "Email Item" temporary);
    begin
        PrependSubjectPrefixFromCompanyInfo(Message, TempEmailItem);
        TempEmailItem.Subject := copystr(message.GetSubject(), 1, MaxStrLen(TempEmailItem.Subject));
        AppendSubjectSuffixFromCompanyInfo(Message, TempEmailItem);
    end;

    procedure PrependSubjectPrefixFromCompanyInfo(var EmailMessage: Codeunit "Email Message"; var TempEmailItem: Record "Email Item" temporary)
    begin
        CompanyInformation.GetRecordOnce();
        if (CompanyInformation."CATEM Email Subject Prefix" > '') and (CompanyInformation."CATEM Subj. Prefix All Emails") then
            EmailMessage.SetSubject(delchr(CompanyInformation."CATEM Email Subject Prefix" + ' ' + TempEmailItem.Subject, '>', ' '));
    end;

    procedure AppendSubjectSuffixFromCompanyInfo(var EmailMessage: Codeunit "Email Message"; var TempEmailItem: Record "Email Item" temporary)
    begin
        CompanyInformation.GetRecordOnce();
        if (CompanyInformation."CATEM Email Subject Suffix" > '') and (CompanyInformation."CATEM Subj. Suffix All Emails") then
            if TempEmailItem.Subject > '' then
                EmailMessage.SetSubject(TempEmailItem.Subject + ' ' + CompanyInformation."CATEM Email Subject Suffix")
            else
                EmailMessage.SetSubject(CompanyInformation."CATEM Email Subject Suffix")
    end;


    var
        CompanyInformation: Record "Company Information";
}
