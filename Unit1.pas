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
    Edit1: TEdit;
    LbAporteMensal: TLabel;
    EditJuros: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
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
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure EditJurosKeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

{ FUNCOES QUE SERA EXECUTADA ENQUANTO ESCREVE NOS INPUTS}

procedure TForm1.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if ((Ord (key) < ord ('0')) or (Ord (key) > ord('9')))then
begin
	key := chr(0);
	ShowMessage('Digite somente n�meros!');
end;
end;

procedure TForm1.Edit2KeyPress(Sender: TObject; var Key: Char);
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
  if ((Ord (key) < ord ('0')) or (Ord (key) > ord('9')))then
begin
	key := chr(0);
	ShowMessage('Digite somente n�meros!');
end;
end;
{==========================================}

{ BOTAO DE CONFERIR RESULTADO }
procedure TForm1.Button1Click(Sender: TObject);
begin
   ShowMessage ('DEU CERTO');
end;
end.
