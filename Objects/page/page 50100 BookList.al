page 50100 "Book List"
{
    PageType = List;
    SourceTable = Book;
    CardPageId= "Book Card";
    UsageCategory=Lists;

    layout
    {
        area(content)
        {
            repeater(Books)
            {
                field("No.";"No.") {
                    ApplicationArea=All;
                }
                field(Author;Author) {
                    ApplicationArea=All;
                }
                field(Title;Title) {
                    ApplicationArea=All;
                }
                field(Hardcover;Hardcover) {
                    ApplicationArea=All;
                }
                field(NumberOfPages;NumberOfPages) {
                    ApplicationArea=All;
                }
            }
        }
    }
}