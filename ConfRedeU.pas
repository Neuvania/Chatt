unit ConfRedeU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TConfRede = class(TForm)
    gbConfiguracao: TGroupBox;
    rbServidor: TRadioButton;
    rbCliente: TRadioButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Porta: TEdit;
    Endereco: TEdit;
    nomee: TEdit;
    Ativar: TButton;
    Conectar: TButton;
    procedure rbServidorClick(Sender: TObject);
    procedure rbClienteClick(Sender: TObject);
    procedure ConectarClick(Sender: TObject);
    procedure AtivarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ConfRede: TConfRede;

implementation
      uses PrincipalU;
{$R *.dfm}

procedure TConfRede.rbServidorClick(Sender: TObject);
begin
    if rbServidor.Checked = true then begin
	Endereco.ReadOnly := true;
	Conectar.Hide;
	Ativar.Show;


     Principal.Servidor.Active := false;
     Principal.Cliente.Active := false;
    end;
end;

procedure TConfRede.rbClienteClick(Sender: TObject);
begin
     if rbCliente.Checked = true then begin
     Endereco.ReadOnly := false;
     Conectar.Show;
     Ativar.Hide;

     Principal.Servidor.Active := false;
     Principal.Cliente.Active := false;
    end;
end;

procedure TConfRede.ConectarClick(Sender: TObject);
begin
    with Principal do begin
    if Cliente.Active = false then begin
    Cliente.Port := StrToInt(Porta.Text);
    Cliente.Address := Endereco.Text;
    Nome := nomee.Text;

    Cliente.Active := true;
    Conectar.Caption := 'Desconectar';
    end
    else begin
    Cliente.Active := false;
    Conectar.Caption := 'Conectar';
      end;
    end;
  end;
procedure TConfRede.AtivarClick(Sender: TObject);
begin
 with Principal do begin
    if  Servidor.Active = false then begin
    Servidor.Port := StrToInt(Porta.Text);
    Nome := nomee.Text;

    Servidor.Active := true;
    Ativar.Caption := 'Desativar';
    end
    else begin
    Servidor.Active := false;
    Ativar.Caption := 'Ativar';
      end;
    end;
end;

end.
