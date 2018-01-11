pageextension 50100 "Customer Card Extension" extends "Customer Card"
{
    layout
    {
        
        addlast(General){
            field(FavoriteBook;FavoriteBook)
            {
                ApplicationArea=All;
            }
        }
    }
}