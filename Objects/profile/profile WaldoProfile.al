profile WaldoProfile 
{
    Description = 'Waldo''s profile';
    RoleCenter = "Sales Manager Role Center";
    Customizations = CustomerListCustomization;
}

pagecustomization CustomerListCustomization customizes "Customer List"
{
    layout
    {
        // Add changes to page layout here
        modify(Name) {
            Visible=false;
        }
    }
}