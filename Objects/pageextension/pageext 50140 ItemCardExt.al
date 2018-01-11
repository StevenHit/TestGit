pageextension 50140 ItemCardExt extends "Item Card"
{
    actions
    {
        addfirst(Item)
        {
            action(DownloadPicture) 
            {
                CaptionML=ENU='Download Picture';
                Image=Picture;

                trigger OnAction()
                var
                    DownLoadMgt: Codeunit HttpDownloadMgt;
                    TempBlob: Record TempBlob temporary;
                    InStr: InStream;
                begin
                    DownLoadMgt.DownloadPicture(
                        'http://vjeko.com/demo/bicycle.jpg',TempBlob);
                    TempBlob.Blob.CreateInStream(InStr);
                    rec.Picture.ImportStream(InStr,'Default image');
                    CurrPage.Update(true);
                end;
            }
        }
    }
}