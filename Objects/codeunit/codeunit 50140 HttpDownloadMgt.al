codeunit 50140 HttpDownloadMgt
{
    trigger OnRun();
    begin
    end;
    
    procedure DownloadPicture(Url:Text;var TempBlob:Record TempBlob temporary);
    var
        Client: HttpClient;
        Response: HttpResponseMessage;
        InStr: InStream;
        OutStr: OutStream;
    begin
        //Steven's commentaar
        Client.Get(Url,Response);
        Response.Content.ReadAs(InStr);
        TempBlob.Blob.CreateOutStream(OutStr);
        CopyStream(OutStr,InStr);    
    end;
}

