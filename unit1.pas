unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, LazOpenGLContext,
  OpenGLContext, gl;

type

  { TForm1 }

  TForm1 = class(TForm)
    OpenGLControl1: TOpenGLControl;
    procedure FormCreate(Sender: TObject);
    procedure OpenGLControl1Paint(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  OpenGLControl1.MakeCurrent();
  glClearColor(0.1,0.1,0.1,1.0);
end;

procedure TForm1.OpenGLControl1Paint(Sender: TObject);
begin
  OpenGLControl1.MakeCurrent();
  // 设置视口，匹配控件像素大小
  glViewport(0, 0, OpenGLControl1.Width, OpenGLControl1.Height);
  glClear(GL_COLOR_BUFFER_BIT);

  // GPU绘制三角形（固定管线，直接走硬件光栅化）
  glBegin(GL_TRIANGLES);
    glColor3f(1,0,0); glVertex2f( 0.0, 0.8);
    glColor3f(0,1,0); glVertex2f(-0.8,-0.8);
    glColor3f(0,0,1); glVertex2f( 0.8,-0.8);
  glEnd;

  OpenGLControl1.SwapBuffers();
end;

end.

