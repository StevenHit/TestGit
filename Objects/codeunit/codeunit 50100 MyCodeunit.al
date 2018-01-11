codeunit 50100 MyCodeunit
{
    [EventSubscriber(ObjectType::Table, 18, 'OnAfterInsertEvent', '', true, true)]
    local procedure DisplayMessageOnInsertCustomer();
    begin
        Message('Foo');
    end;
}