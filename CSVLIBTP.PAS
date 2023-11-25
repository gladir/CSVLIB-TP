{ @author: Sylvain Maltais (support@gladir.com)
  @created: 2023
  @website(https://www.gladir.com/CODER/CSVLIB-TP)
  @abstract(Target: Turbo Pascal 7, Free Pascal 3.2)
}

Unit CSVLIBTP;

INTERFACE

Function  AddFieldValueCSV(Var F:Text;FieldValue:String):Boolean;
Function  AddFieldValueIntegerCSV(Var F:Text;FieldValue:Integer):Boolean;
Function  AddFieldValueLongIntCSV(Var F:Text;FieldValue:LongInt):Boolean;
Function  AddFieldValueRealCSV(Var F:Text;FieldValue:Real):Boolean;
Function  AddFieldValueStringCSV(Var F:Text;FieldValue:String):Boolean;
Function  AddRecordCSV(Var F:Text):Boolean;
Function  CloseCSV(Var F:Text):Boolean;
Function  CreateCSV(Var F:Text;FileName:String):Boolean;
Function  CountFieldCSV(Var F:Text):LongInt;
Function  CountRecordCSV(Var F:Text):LongInt;
Function  IsEndOfCSV(Var F:Text):Boolean;
Function  GetQuotedString:Char;
Function  GetSeparatorCSV:Char;
Function  OpenCSV(Var F:Text;FileName:String):Boolean;
Function  ReadFieldCSV(Var F:Text):String;
Function  ReadFirstRecordCSV(Var F:Text):String;
Function  ReadRecordCSV(Var F:Text):String;
Procedure SetSeparatorCSV(NewSeparator:Char);
Procedure SetNoQuotedString;
Procedure SetQuotedString(Quoted:Char);
Function  WriteRecordCSV(Var F:Text;RecStr:String):Boolean;

IMPLEMENTATION

Var
 QuotedStr,Separator:Char;
 FirstField:Boolean;

Function CreateCSV(Var F:Text;FileName:String):Boolean;Begin
 {$I-}Assign(F,FileName);
 Rewrite(F);{$I+}
 CreateCSV:=IOResult=0;
End;

Function OpenCSV(Var F:Text;FileName:String):Boolean;Begin
 {$I-}Assign(F,FileName);
 Reset(F);{$I+}
 OpenCSV:=IOResult=0;
End;

Function CountFieldCSV(Var F:Text):LongInt;
Var
 Count:LongInt;
 C:Char;
Begin
 Reset(F);
 Count:=0;
 While Not EOF(F)do Begin
  Read(F,C);
  If(C=Separator)Then Inc(Count);
  Case C of
   #10,#13:Break;
  End;
 End;
 CountFieldCSV:=Count;
End;

Function CountRecordCSV(Var F:Text):LongInt;
Var
 S:String;
 Count:LongInt;
Begin
 Reset(F);
 Count:=0;
 While Not EOF(F)do Begin
  ReadLn(F,S);
  Inc(Count);
 End;
 Reset(F);
 CountRecordCSV:=Count;
End;

Function AddFieldValueCSV(Var F:Text;FieldValue:String):Boolean;Begin
 If Not(FirstField)Then Write(F,Separator);{$I+}
 {$I-}Write(F,FieldValue);{$I+}
 FirstField:=False;
 AddFieldValueCSV:=IOResult=0;
End;

Function AddFieldValueIntegerCSV(Var F:Text;FieldValue:Integer):Boolean;
Var
 S:String;
Begin
 Str(FieldValue,S);
 AddFieldValueIntegerCSV:=AddFieldValueCSV(F,S);
End;

Function AddFieldValueLongIntCSV(Var F:Text;FieldValue:LongInt):Boolean;
Var
 S:String;
Begin
 Str(FieldValue,S);
 AddFieldValueLongIntCSV:=AddFieldValueCSV(F,S);
End;

Function AddFieldValueRealCSV(Var F:Text;FieldValue:Real):Boolean;
Var
 S:String;
Begin
 Str(FieldValue,S);
 AddFieldValueRealCSV:=AddFieldValueCSV(F,S);
End;

Function AddFieldValueStringCSV(Var F:Text;FieldValue:String):Boolean;Begin
 If QuotedStr=#0 Then Begin
  AddFieldValueStringCSV:=AddFieldValueCSV(F,FieldValue);
 End
  Else
 AddFieldValueStringCSV:=AddFieldValueCSV(F,QuotedStr+FieldValue+QuotedStr);
End;

Function AddRecordCSV(Var F:Text):Boolean;Begin
 FirstField:=True;
 WriteLn(F);
 AddRecordCSV:=IOResult=0;
End;

Function ReadRecordCSV(Var F:Text):String;
Var
 S:String;
Begin
 ReadLn(F,S);
 ReadRecordCSV:=S;
End;

Function ReadFirstRecordCSV(Var F:Text):String;Begin
 Reset(F);
 ReadFirstRecordCSV:=ReadRecordCSV(F);
End;

Function ReadFieldCSV(Var F:Text):String;
Var
 S:String;
 C:Char;
 InStr:Boolean;
Begin
 S:='';
 If QuotedStr=#0 Then Begin
  While Not EOF(F)do Begin
   Read(F,C);
   If(C=Separator)Then Break;
   Case C of
    #13:Begin
     Read(F,C);
     Break;
    End;
    #10:Break;
   End;
   S:=S+C;
  End;
 End
  Else
 Begin
  InStr:=False;
  While Not EOF(F)do Begin
   Read(F,C);
   If Not(InStr)Then Begin
    If(C=Separator)Then Break Else
    If(C=QuotedStr)Then Begin
     InStr:=True;
    End
     Else
    If C=#13 Then Begin
     Read(F,C);
     Break;
    End
     Else
    If C=#10 Then Break
              Else S:=S+C;
   End
    Else
   Begin
    If(C=QuotedStr)Then Begin
     InStr:=False;
    End
     Else
    S:=S+C;
   End;
  End;
 End;
 ReadFieldCSV:=S;
End;

Function IsEndOfCSV(Var F:Text):Boolean;Begin
 IsEndOfCSV:=EOF(F);
End;

Function GetSeparatorCSV:Char;Begin
 GetSeparatorCSV:=Separator;
End;

Procedure SetSeparatorCSV(NewSeparator:Char);Begin
 Separator:=NewSeparator;
End;

Procedure SetNoQuotedString;Begin
 QuotedStr:=#0;
End;

Procedure SetQuotedString(Quoted:Char);Begin
 QuotedStr:=Quoted;
End;

Function GetQuotedString:Char;Begin
 GetQuotedString:=QuotedStr;
End;

Function WriteRecordCSV(Var F:Text;RecStr:String):Boolean;Begin
 WriteLn(F,RecStr);
 WriteRecordCSV:=IOResult=0;
End;

Function CloseCSV(Var F:Text):Boolean;Begin
 Close(F);
 CloseCSV:=IOResult=0;
End;

BEGIN
 Separator:=',';
 QuotedStr:='"';
 FirstField:=True;
END.