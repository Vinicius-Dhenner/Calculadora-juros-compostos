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
    LbRendimentoTotal: TLabel;
    LbTotal: TLabel;
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
    function CalcularTotalInvestido() : String;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

{FUNCOES DIVERSAS}

function TForm1.CalcularTotalInvestido() : String;
var
  tempoOpcao : Integer;
  valorInicial : Double;
  aporteMensal : Double;
  tempo : Integer;
begin

  tempoOpcao := CbTempo.ItemIndex;
  valorInicial := StrToFloat(EditValorInicial.Text);
  aporteMensal := StrToFloat(EditAporteMensal.Text);
  tempo := StrToInt(EditTempoInvestimento.Text);

  if (tempoOpcao = 1) then
  begin
     result := FloatToStr((tempo * aporteMensal) + valorInicial);
  end
  else if (tempoOpcao = 0) then
  begin
    result :=  FloatToStr(((tempo * 12) * aporteMensal) + valorInicial);
  end
  else
  begin
    result := 'erro';
  end;
end;

function TForm1.CalcularTudo() : String;
var
  tempoOpcao : Integer;
  valorInicial : Double;
  aporteMensal : Double;
  tempo : Integer;
  I: Integer;
  resultado : Double;
  porcentagemDeRetorno : Double;
begin

  tempoOpcao := CbTempo.ItemIndex;
  valorInicial := StrToFloat(EditValorInicial.Text);
  aporteMensal := StrToFloat(EditAporteMensal.Text);
  tempo := StrToInt(EditTempoInvestimento.Text);
  porcentagemDeRetorno := StrToFloat(EditJuros.Text);

  if (tempoOpcao = 1) then
  begin
  resultado := resultado + valorInicial;
  porcentagemDeRetorno := porcentagemDeRetorno / 12;
     for I := 0 to tempo do
      begin
        resultado := (resultado + (porcentagemDeRetorno / 100)) + aporteMensal;
      end;
      result := FloatToStr(resultado);
  end;

end;
{========================}


{ FUNCOES QUE SERA EXECUTADA ENQUANTO ESCREVE NOS INPUTS}

procedure TForm1.EditAporteMensalKeyPress(Sender: TObject; var Key: Char);
begin
if not (key in ['0'..'9', #8]) then
begin
  key := #0;
  MessageDlg('DIGITE SOMENTE N�MEROS!' ,mtError, [mbOk], 0);
end;
end;

procedure TForm1.EditTempoInvestimentoKeyPress(Sender: TObject; var Key: Char);
begin
if not (key in ['0'..'9', #8]) then
begin
  key := #0;
  MessageDlg('DIGITE SOMENTE N�MEROS!' ,mtError, [mbOk], 0);
end;
end;

procedure TForm1.EditJurosKeyPress(Sender: TObject; var Key: Char);
begin
if not (key in ['0'..'9', #8]) then
begin
  key := #0;
  MessageDlg('DIGITE SOMENTE N�MEROS!' ,mtError, [mbOk], 0);
end;
end;


procedure TForm1.EditValorInicialKeyPress(Sender: TObject; var Key: Char);
begin
if not (key in ['0'..'9', #8]) then
begin
  key := #0;

  MessageDlg('DIGITE SOMENTE N�MEROS!' ,mtError, [mbOk], 0);
end;

end;

{==========================================}

{ BOTAO DE CONFERIR RESULTADO }
procedure TForm1.Button1Click(Sender: TObject);
begin
  if (CbTempo.ItemIndex <> 0) AND (CbTempo.ItemIndex <> 1) then
  begin
      MessageDlg('SELECIONE UMA OP��O DE TEMPO!' ,mtError, [mbOk], 0);
  end
  else if (EditValorInicial.Text <> '') OR (EditAporteMensal.Text <> '') OR (EditJuros.Text <> '') OR (EditTempoInvestimento.Text <> '') then
  begin
        LbTotalInvestido.Caption := CalcularTotalInvestido();
        LbRendimentoTotal.Caption := CalcularTudo();
        LbTotal.Caption := 'SERA EXIBIDO O VALOR TOTAL';
  end
  else
  begin
        MessageDlg('PREENCHA TODOS OS CAMPOS!' ,mtError, [mbOk], 0);
  end;
end;
{===================================}
end.
