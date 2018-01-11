page 50110 "CompanyInfoWizard"
{
    CaptionML=ENU='Company Information';
    PageType = NavigatePage;
    SourceTable = "Company Information";
    SourceTableTemporary=true;

    layout
    {
        area(content)
        {
            group(Group96)
            {
                CaptionML=ENU='';
                Editable=false;
                Visible=TopBannerVisible AND NOT Step3Visible;
                field(MediaResourcesStandard;MediaResourcesStandard."Media Reference")
                {
                  ApplicationArea=Basic,Suite,Invoicing;
                  Editable=false;
                  ShowCaption=false;
                }
            }
            group(Group98)
            {
                CaptionML=ENU='';
                Editable=false;
                Visible=TopBannerVisible AND Step3Visible;
                field(MediaResourcesDone;MediaResourcesDone."Media Reference")
                {
                  ApplicationArea=Basic,Suite,Invoicing;
                  Editable=false;
                  ShowCaption=false;
                }
            }

            group(Step1)
            {
                Visible=Step1Visible;
                group("CompanyName")
                {
                    CaptionML=ENU='Company Name';
                    InstructionalTextML=ENU='Provide the name of your company';
                    field(Name;Name)
                    {
                        ApplicationArea = Basic;
                    }
                }
            }

            group(Step2)
            {
                Visible=Step2Visible;
                group("Email Address")
                {
                    CaptionML=ENU='Email Address';
                    field("E-Mail";"E-Mail")
                    {
                        ApplicationArea = Basic;
                    }
                }
            }
            

            group(Step3)
            {
                Visible=Step3Visible;
                group("AllDone")
                {
                    CaptionML=ENU='All done';
                    InstructionalTextML=ENU='Thank you! You''re done.';
                    
                }
            }
        }
    }
actions
{
    area(processing)
    {
        action(ActionBack)
        {
            ApplicationArea=All;
            CaptionML=ENU='Back';
            Enabled=BackActionEnabled;
            Image=PreviousRecord;
            InFooterBar=true;
            trigger OnAction();
            begin
                NextStep(TRUE);
            end;
        }
        action(ActionNext)
        {
            ApplicationArea=All;
            CaptionML=ENU='Next';
            Enabled=NextActionEnabled;
            Image=NextRecord;
            InFooterBar=true;
            trigger OnAction();
            begin
                NextStep(FALSE);
            end;
        }      
        action(ActionFinish)
        {
            ApplicationArea=Basic,Suite,Invoicing;
            CaptionML=ENU='Finish';
            Enabled=FinishActionEnabled;
            Image=Approve;
            InFooterBar=true;
            trigger OnAction();
            begin
                FinishAction;
            end;
        }
    }
}
trigger OnInit();
begin
  LoadTopBanners;
end;
trigger OnOpenPage();
var
    RecordVar : Record "Company Information";
begin
    INIT;
    IF RecordVar.GET THEN BEGIN
      TRANSFERFIELDS(RecordVar);
    END;
    INSERT;

    Step := Step::Start;
    EnableControls;
end;
var
    MediaRepositoryStandard : Record 9400;
    MediaRepositoryDone : Record 9400;
    MediaResourcesStandard : Record 2000000182;
    MediaResourcesDone : Record 2000000182;
    Step : Option Start,Step2,Finish;
    TopBannerVisible : Boolean;
    Step1Visible : Boolean;
    Step2Visible : Boolean;
    Step3Visible : Boolean;
    FinishActionEnabled : Boolean;
    BackActionEnabled : Boolean;
    NextActionEnabled : Boolean;
local procedure EnableControls();
begin
  ResetControls;

  CASE Step OF
    Step::Start:
      ShowStep1;
    Step::Step2:
      ShowStep2;
    Step::Finish:
      ShowStep3;
  END;
end;

local procedure StoreRecordVar();
var
    RecordVar : Record "Company Information";
begin
    IF NOT RecordVar.GET THEN BEGIN
        RecordVar.INIT;
        RecordVar.INSERT;
    END;

    RecordVar.TRANSFERFIELDS(Rec,FALSE);
    RecordVar.MODIFY(TRUE);
    COMMIT;
end;


local procedure FinishAction();
begin
  StoreRecordVar;
  CurrPage.CLOSE;
end;

local procedure NextStep(Backwards : Boolean);
begin
  IF Backwards THEN
    Step := Step - 1
  ELSE
    Step := Step + 1;

  EnableControls;
end;

local procedure ShowStep1();
begin
  Step1Visible := TRUE;

  FinishActionEnabled := FALSE;
  BackActionEnabled := FALSE;
end;

local procedure ShowStep2();
begin
  Step2Visible := TRUE;
end;

local procedure ShowStep3();
begin
  Step3Visible := TRUE;

  NextActionEnabled := FALSE;
  FinishActionEnabled := TRUE;
end;

local procedure ResetControls();
begin
  FinishActionEnabled := FALSE;
  BackActionEnabled := TRUE;
  NextActionEnabled := TRUE;

  Step1Visible := FALSE;
  Step2Visible := FALSE;
  Step3Visible := FALSE;
end;

local procedure LoadTopBanners();
begin
  IF MediaRepositoryStandard.GET('AssistedSetup-NoText-400px.png',FORMAT(CURRENTCLIENTTYPE)) AND
     MediaRepositoryDone.GET('AssistedSetupDone-NoText-400px.png',FORMAT(CURRENTCLIENTTYPE))
  THEN
    IF MediaResourcesStandard.GET(MediaRepositoryStandard."Media Resources Ref") AND
       MediaResourcesDone.GET(MediaRepositoryDone."Media Resources Ref")
    THEN
      TopBannerVisible := MediaResourcesDone."Media Reference".HASVALUE;
end;
}