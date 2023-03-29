unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    LbTitulo: TLabel;
    EditValorInicial: TEdit;
    Label1: TLabel;
    EditAporteMensal: TEdit;
    LbAporteMensal: TLabel;
    EditJuros: TEdit;
    Label2: TLabel;
    EditTempoInvestimento: TEdit;
    LbTempo: TLabel;
    CbTempo: TComboBox;
    Button1: TButton;
    LbTotalInvestido: TLabel;
    LbJuros: TLabel;
    LbValorTotal: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    procedure EditValorInicialKeyPress(Sender: TObject; var Key: Char);
    procedure EditAporteMensalKeyPress(Sender: TObject; var Key: Char);
    procedure EditJurosKeyPress(Sender: TObject; var Key: Char);
    procedure EditTempoInvestimentoKeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    function CalcularTudo() : String;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

{FUNCOES DIVERSAS}
function TForm1.CalcularTudo() : String;
begin
  result := 'FUNCAO CHAMADA';
end;
{========================}


{ FUNCOES QUE SERA EXECUTADA ENQUANTO ESCREVE NOS INPUTS}

procedure TForm1.EditAporteMensalKeyPress(Sender: TObject; var Key: Char);
begin
  if ((Ord (key) < ord ('0')) or (Ord (key) > ord('9')))then
begin
	key := chr(0);
	ShowMessage('Digite somente n�meros!');
end;
end;

procedure TForm1.EditTempoInvestimentoKeyPress(Sender: TObject; var Key: Char);
begin
  if ((Ord (key) < ord ('0')) or (Ord (key) > ord('9')))then
begin
	key := chr(0);
	ShowMessage('Digite somente n�meros!');
end;
end;

procedure TForm1.EditJurosKeyPress(Sender: TObject; var Key: Char);
begin
  if ((Ord (key) < ord ('0')) or (Ord (key) > ord('9')))then
begin
	key := chr(0);
	ShowMessage('Digite somente n�meros!');
end;
end;


procedure TForm1.EditValorInicialKeyPress(Sender: TObject; var Key: Char);
begin
if not (key in ['0'..'9', #8]) then // Adiciona o #8 (Backspace) ao conjunto de caracteres permitidos
begin
  key := #0; // Define a tecla pressionada como nula para impedir que o caractere digitado apare�a no campo
  ShowMessage('Digite somente n�meros!'); // Exibe uma mensagem de erro ao usu�rio
end;

end;

{==========================================}

{ BOTAO DE CONFERIR RESULTADO }
procedure TForm1.Button1Click(Sender: TObject);
begin
  if (EditValorInicial.Text <> '') OR (EditAporteMensal.Text <> '') OR (EditJuros.Text <> '') OR (EditTempoInvestimento.Text <> '') then
  begin
        ShowMessage(CalcularTudo());
  end
  else
  begin
        MessageDlg('PREENCHA TODOS OS CAMPOS' ,mtInformation, [mbOk], 0);
  end;
end;
{===================================}
end.
