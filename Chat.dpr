program Chat;

uses
  Forms,
  PrincipalU in 'PrincipalU.pas' {Principal},
  ConfRedeU in 'ConfRedeU.pas' {ConfRede: TFrame};

//ConfRedeU in 'ConfRedeU.pas' {frmConfRede};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TPrincipal, Principal);
  Application.CreateForm(TConfRede, ConfRede);
  Application.Run;
end.
