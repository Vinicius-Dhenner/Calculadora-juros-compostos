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
    LbResultado: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

end.
