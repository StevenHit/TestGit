page 50101 "Book Card"
{
    PageType = Card;
    SourceTable = Book;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; "No.")
                {
                    ApplicationArea = All;
                }
                field(Author; Author)
                {
                    ApplicationArea = All;
                }
                field(Title; Title)
                {
                    ApplicationArea = All;
                }

            }
            group(Details)
            {
                field(Hardcover; Hardcover)
                {
                    ApplicationArea = All;
                }
                field(NumberOfPages; NumberOfPages)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}