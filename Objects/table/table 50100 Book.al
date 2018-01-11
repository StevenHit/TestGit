table 50100 Book
{
    LookupPageId = "Book List";
    
    fields
    {
        field(1;"No.";Code[10]) {
            CaptionML=ENU='No.';
        }
        field(2;Title;Text[50]) {
            CaptionML=ENU='Title';   
        }
        field(3;Author;Text[50]) {
            CaptionML=ENU='Author';
        }
        field(4;Hardcover;Boolean) {
            CaptionML=ENU='Hardcover';    
        }
        field(5;NumberOfPages;Integer) {
            CaptionML=ENU='No. of Pages';
        }
    }

    keys
    {
        key(PK;"No.")
        {
            Clustered = true;
        }
    }
}