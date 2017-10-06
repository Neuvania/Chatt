unit PrincipalU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, ExtCtrls, ComCtrls, ScktComp, WinSkinData;

type
  TPrincipal = class(TForm)
    Rodape: TStatusBar;
    Panel1: TPanel;
    butonEnviar: TButton;
    Mensagem: TMemo;
    Menu: TMainMenu;
    Arquivos1: TMenuItem;
    Conversas: TMemo;
    Sair1: TMenuItem;
    Configuraesderede1: TMenuItem;
    Cliente: TClientSocket;
    Servidor: TServerSocket;
    SkinData1: TSkinData;
    procedure Sair1Click(Sender: TObject);
    procedure Configuraesderede1Click(Sender: TObject);
    procedure ServidorListen(Sender: TObject; Socket: TCustomWinSocket);
    procedure ServidorClientConnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ServidorClientDisconnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ServidorClientError(Sender: TObject;
      Socket: TCustomWinSocket; ErrorEvent: TErrorEvent;
      var ErrorCode: Integer);
    procedure ClienteConnect(Sender: TObject; Socket: TCustomWinSocket);
    procedure ClienteConnecting(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ClienteDisconnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ClienteError(Sender: TObject; Socket: TCustomWinSocket;
      ErrorEvent: TErrorEvent; var ErrorCode: Integer);
    procedure butonEnviarClick(Sender: TObject);
    procedure ServidorClientRead(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ClienteRead(Sender: TObject; Socket: TCustomWinSocket);
    procedure MensagemKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    Nome : String;
  end;

var
  Principal: TPrincipal;

implementation
  uses ConfRedeU;

{$R *.dfm}

procedure TPrincipal.Sair1Click(Sender: TObject);
begin
    Principal.Close;
end;

procedure TPrincipal.Configuraesderede1Click(Sender: TObject);
begin
      ConfRede.Show;
end;

procedure TPrincipal.ServidorListen(Sender: TObject;
  Socket: TCustomWinSocket);
begin
      Rodape.Panels[1].Text := 'Servidor - Esperando Conexão.';
end;

procedure TPrincipal.ServidorClientConnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
    Rodape.Panels[1].Text := 'Servidor - Cliente Conectado.';
end;

procedure TPrincipal.ServidorClientDisconnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
    Rodape.Panels[1].Text := 'Servidor - Cliente Desconectado';
end;

procedure TPrincipal.ServidorClientError(Sender: TObject;
  Socket: TCustomWinSocket; ErrorEvent: TErrorEvent;
  var ErrorCode: Integer);
begin
   MessageBox(application.Handle, pChar('Erro no Servidor:' +IntToStr(ErrorCode)), pChar('Erro ns conexão'), MB_OK+MB_ICONERROR);
   ErrorCode := 0;
end;

procedure TPrincipal.ClienteConnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  Rodape.Panels[1].Text := 'Cliente - Conectado ao servidor';
end;

procedure TPrincipal.ClienteConnecting(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  Rodape.Panels[1].Text := 'Cliente - Procurando Servidor!';
end;

procedure TPrincipal.ClienteDisconnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  Rodape.Panels[1].Text := 'Cliente - Desconectado do servidor';
end;

procedure TPrincipal.ClienteError(Sender: TObject;
  Socket: TCustomWinSocket; ErrorEvent: TErrorEvent;
  var ErrorCode: Integer);
begin
  MessageBox(application.Handle, pChar('Erro com a conexão:' + IntToStr(ErrorCode)), pChar('Erro com a conexão'), MB_OK+MB_ICONERROR);
  ErrorCode := 0;
end;

procedure TPrincipal.butonEnviarClick(Sender: TObject);
begin
  if Servidor.Active = true then begin
  //Se servidor estiver ativado, transmite via servidor
  Servidor.Socket.Connections[0].SendText('msg:'+Nome+': ' +Mensagem.Lines.Text);
  Conversas.Lines.Add('VOCÊ: '+Mensagem.Lines.Text);
  //Servidor.Socket.Connections[0].SendText('atn:');
  Mensagem.Clear;

  end
  else begin
  if Cliente.Active = true then begin
    //Se Cliente estiver ativado, transmite via Cliente
    Cliente.Socket.SendText('msg:'+Nome+': ' +Mensagem.Lines.Text);
  Conversas.Lines.Add('VOCÊ: '+Mensagem.Lines.Text);
    //csCliente.Socket.SendText('atn:');
    Mensagem.Clear;
  end
    else begin
       MessageBox(application.Handle, pChar('Sem transmissão, ative o servidor'),
      pChar('Erro na transmissão'), MB_Ok+MB_ICONERROR);
     end;
   end;
end;
procedure TPrincipal.ServidorClientRead(Sender: TObject;
  Socket: TCustomWinSocket);
  var
  comando : String;
  dados : String;
begin
  dados := socket.ReceiveText;
  comando := copy(dados, 0, 4); //pega apenas o codigo criado no protocolo de aplicação
  dados := copy(dados, 5, strlen(PAnsiChar(dados)) - 4); //separa apenas os dados transmitidos (remove o codigo ou comando executado)


  if comando = 'msg:' then begin
     Conversas.Lines.Add(dados);
  end;

end;

procedure TPrincipal.ClienteRead(Sender: TObject;
  Socket: TCustomWinSocket);
 var
  comando : String;
  dados : String;
begin
  //Recebendo todo o texto em dados
  dados := socket.ReceiveText;
  comando := copy(dados, 0, 4); //pega apenas o codigo criado em nosso protocolo de aplicação
  dados := copy(dados, 5, strlen(PAnsiChar(dados)) - 4); //separa apenas os dados transmitidos (remove o codigo ou comando executado)
  //showmessage('comando: ' +comando);
  //showmessage('dados: ' +dados);

  if comando = 'msg:' then begin
     Conversas.Lines.Add(dados);
  end;

end;

procedure TPrincipal.MensagemKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = 13 then
butonEnviar.Click;
end;
end.

