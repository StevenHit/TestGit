codeunit 50101 CompanyINfoAssistedSetup
{
    [EventSubscriber(ObjectType::Table,1808,'OnRegisterAssistedSetup','',false,false)]
    local procedure "AggregatedAssistedSetup.OnRegisterAssistedSetup"(var TempAggregatedAssistedSetup : Record 1808 TEMPORARY)
    var
        CompanyInformation : Record 79;
    begin
        TempAggregatedAssistedSetup.AddExtensionAssistedSetup(Page::CompanyInfoWizard,
            'Setup Company Information',
            true,
            CompanyInformation.RecordId,
            0,
            '')
    end;
}