tableextension 50100 CustomerExtension extends Customer
{
    fields
    {
        field(50100;FavoriteBook;Code[10])
        {
            CaptionML=ENU='Favorite Book';
            TableRelation=book."No.";
        }
    }
}