unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, ComObj, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Excel_TLB,
  VBIDE_TLB,
  Math, Graph_TLB;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Edit6: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label6: TLabel;
    Button1: TButton;
    Button2: TButton;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Edit6Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  AChart: _Chart;
  mchart: ExcelChart;
  mshape: Shape;
  CellName: String;
  oChart: ExcelChart;
  Col: Char;
  defaultLCID: Cardinal;
  Row: Integer;
  mAxis: Axis;
  GridPrevFile: string;
  MyDisp: IDispatch;
  ExcelApp: ExcelApplication;
  v: variant;
  Sheet: ExcelWorksheet;
  y1, y2, y3, x, xb, xe, a1, a2, a3, st: Extended;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  ExcelApp := CreateOleObject('Excel.Application') as ExcelApplication;

  ExcelApp.Visible[0] := True;

  ExcelApp.Workbooks.Add(xlWBatWorkSheet, 0);

  Sheet := ExcelApp.Workbooks[1].WorkSheets[1] as ExcelWorksheet;

  ExcelApp.Application.ReferenceStyle[0] := xlA1;

end;

procedure TForm1.Button2Click(Sender: TObject);
begin

  xb := StrToFloat(Edit1.Text);
  xe := StrToFloat(Edit2.Text);
  st := StrToFloat(Edit6.Text);

  Col := 'A';
  x := xb;
  Sheet.Range[Col + '1', Col + '1'].Value[xlRangeValueDefault] := 'x';
  Row := 2;
  while ((x <= xe) and (x >= xb)) do
  begin
    Sheet.Range[Col + IntToStr(Row), Col + IntToStr(Row)
      ].Value[xlRangeValueDefault] := x;
    x := x + st;
    Row := Row + 1;
  end;

  Col := 'B';
  x := xb;
  Sheet.Range[Col + '1', Col + '1'].Value[xlRangeValueDefault] := 'y1';
  Row := 2;
  while ((x <= xe) and (x >= xb)) do
  begin
    if x <= 0 then
      y1 := sqr(cos(x));
    if x >= 1 then
      y1 := sqr(sin(x));
    if (x >= 0) and (x <= 1) then
      y1 := 1;
    Sheet.Range[Col + IntToStr(Row), Col + IntToStr(Row)
      ].Value[xlRangeValueDefault] := y1;
    x := x + st;
    Row := Row + 1;
  end;

  Sheet.Range['A2', 'B' + IntToStr(Row)].Select;
  mshape := Sheet.Shapes.AddChart(xlXYScatterSmoothNoMarkers, 250, 1, 800, 800);
  mchart := (mshape.Chart as ExcelChart).Location(xlLocationAsNewSheet,
    EmptyParam);
  ExcelApp.Application.ActiveWorkbook.ActiveChart.SetElement(1);
  ExcelApp.Application.ActiveWorkbook.ActiveChart.ChartTitle[0].Text :=
    '√рафик кусочной функции';
  MyDisp := mchart.Axes(xlValue, xlPrimary, 0);

  mAxis := Axis(MyDisp);

  mAxis.HasTitle := True;
  mAxis.AxisTitle.Caption := 'Y';

  ExcelApp.Application.ActiveWorkbook.ActiveChart.HasLegend[0] := FALSE;
  { удаление легенды }

  MyDisp := mchart.Axes(xlCategory, xlPrimary, 0);

  mAxis := Axis(MyDisp);

  mAxis.HasTitle := True;
  mAxis.AxisTitle.Caption := 'X';

  ExcelApp.Application.ActiveWorkbook.ActiveChart.SetElement(500);

end;

procedure TForm1.Edit6Change(Sender: TObject);
begin
  if (strtoint(Edit6.Text)) > 0.5 then
    ShowMessage('¬ведите меньший шаг');
end;

end.
