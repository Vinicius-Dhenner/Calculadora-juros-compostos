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
    function CalcularTudo() : Currency;
    function CalcularTotalInvestido() : Currency;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

{FUNCOES DIVERSAS}

function TForm1.CalcularTotalInvestido() : Currency;
var
  tempoOpcao : Integer;
  valorInicial : Currency;
  aporteMensal : Currency;
  tempo : Integer;
begin

  tempoOpcao := CbTempo.ItemIndex;
  valorInicial := StrToCurr(EditValorInicial.Text);
  aporteMensal := StrToCurr(EditAporteMensal.Text);
  tempo := StrToInt(EditTempoInvestimento.Text);

  if (tempoOpcao = 1) then
  begin
     result := (tempo * aporteMensal) + valorInicial;
  end
  else if (tempoOpcao = 0) then
  begin
    result :=  ((tempo * aporteMensal) * 12) + valorInicial;
  end
  else
  begin
    result := 0;
  end;
end;

function TForm1.CalcularTudo() : Currency;
var
  tempoOpcao : Integer;
  valorInicial : Currency;
  aporteMensal : Currency;
  tempo : Integer;
  I: Integer;
  resultado : Currency;
  porcentagemDeRetorno : Currency;
begin

  tempoOpcao := CbTempo.ItemIndex;
  valorInicial := StrToCurr(EditValorInicial.Text);
  aporteMensal := StrToCurr(EditAporteMensal.Text);
  tempo := StrToInt(EditTempoInvestimento.Text);
  porcentagemDeRetorno := StrToCurr(EditJuros.Text);
  resultado := 0;
  resultado := resultado + valorInicial;
  porcentagemDeRetorno := porcentagemDeRetorno / 12;

  if (tempoOpcao = 1) then
  begin
     for I := 0 to tempo do
      begin
        resultado := (resultado + aporteMensal) + (resultado * (porcentagemDeRetorno / 100)) ;
      end;
      result :=  resultado;
      i :=0;
  end
  else if (tempoOpcao = 0) then
  begin
    for I := 0 to (tempo * 12) do
      begin
        resultado := (resultado +aporteMensal) + (resultado * (porcentagemDeRetorno / 100)) ;
      end;
      result := resultado;
  end
  else
  begin
    result := 0;
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
var
  juros : Currency;
begin
  if (EditValorInicial.Text <> '') OR (EditAporteMensal.Text <> '') OR (EditJuros.Text <> '') OR (EditTempoInvestimento.Text <> '') OR (CbTempo.ItemIndex <> 0) OR (CbTempo.ItemIndex <> 1) then
  begin
        juros := CalcularTudo() - CalcularTotalInvestido();

        LbTotalInvestido.Caption := FormatCurr('R$ #,##0.00', CalcularTotalInvestido());
        LbRendimentoTotal.Caption := FormatCurr('R$ #,##0.00', juros);
        LbTotal.Caption := FormatCurr('R$ #,##0.00',CalcularTudo());
  end
  else
  begin
        MessageDlg('PREENCHA TODOS OS CAMPOS!' ,mtError, [mbOk], 0);
  end;
end;
{===================================}
end.
