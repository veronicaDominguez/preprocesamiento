% convierte de formato texto antiguo a formato texto usable
function TFConvert1()
global DIR_TRAB;
global FILE_NAMER;
global FILE_NAMEW;
disp('TFConvert1...');
headcnv={};
[FileName Path]=uigetfile({'*.EXP;*.exp'}, 'Archivo a Convertir',DIR_TRAB);
if (FileName ~=0)
    % Fnamer: Nombre de archivo a leer
    Fnamer=strcat(Path,FileName);
    [fir,messager] = fopen(Fnamer, 'r') ;
    if fir ~=-1
        FILE_NAMEW=strcat(Path,'N',FileName);
        nline=0;
        while ~feof(fir) && nline < 7
            tline=fgetl(fir);
            nline=nline+1;
            headcnv(nline)=cellstr(tline);
        end
        fclose(fir);
        if nline==7
            strt1=char(headcnv(1));
            str1=strt1(1:13);
            str2='Patient Name:';
            r1=strcmp(str1,str2);
            strt1=char(headcnv(2));
            str1=strt1(1:9);
            str2='birthday:';
            r2=strcmp(str1,str2);
            strt1=char(headcnv(3));
            str1=strt1(1:12);
            str2='Examination:';
            r3=strcmp(str1,str2);
            strt1=char(headcnv(4));
            str1=strt1(1:14);
            str2='Sampling Rate:';
            r4=strcmp(str1,str2);
            if (r1+r2+r3+r4) == 4
                FILE_NAMER=Fnamer;
                Check_cnv(headcnv);
            else
                warndlg('Formato de archivo NO corresponde','Convertir Archivo');
            end
        else
           warndlg('Formato de archivo NO corresponde','Convertir Archivo');
        end
    else
        warndlg(strcat('Error de apertura ',messager),'Convertir Archivo');
    end
end
disp('...TFConvert1');
end

% Verifica el archivo leido y genera ventana de conversión
function Check_cnv(hc)
global HCONV1;
global DAT_EXP;
global LDAT;
    str1=char(hc(1));
    l1=length(str1);
    ns=str1(14:l1);
    str1=char(hc(2));
    l1=length(str1);
    fn=str1(10:l1);
    str1=char(hc(3));
    l1=length(str1);
    fm=str1(13:l1);
    str1=char(hc(4));
    l1=length(str1);
    st=str1(15:l1);
    
    str1=char(hc(5));
    l1=length(str1);
    
    opcs={};
    nopcs=0;
    old1=1;
    for i=1:l1
        if str1(i)==9
            nopcs=nopcs+1;
            opcs(nopcs)=cellstr(str1(old1:i-1));
            old1=i+1;
        end
    end
    nopcs=nopcs+1;
    opcs(nopcs)=cellstr(str1(old1:l1));
    DAT_EXP=opcs;
    LDAT=opcs;
    
    HCONV1(1) = figure('Visible','off','Name','Convertir archivos de Texto','Position',[50,350,700,335],'NumberTitle','off','MenuBar','none');
    set(HCONV1(1),'WindowStyle','normal');
    set(HCONV1(1),'Resize','off');
    set(HCONV1(1),'CloseRequestFcn',@TFConvert1_POP0_Cl);
    HCONV1(10) = uicontrol(HCONV1(1),'Style','Text','Units','pixels','String','Nombre Sujeto   :','Position',[10 300 100 18],'HorizontalAlignment','left');
    HCONV1(11) = uicontrol(HCONV1(1),'Style','Text','Units','pixels','String','Fecha Nac.      :','Position',[10 280 100 18],'HorizontalAlignment','left');
    HCONV1(12) = uicontrol(HCONV1(1),'Style','Text','Units','pixels','String','Fecha Exam.     :','Position',[10 260 100 18],'HorizontalAlignment','left');
    HCONV1(13) = uicontrol(HCONV1(1),'Style','Text','Units','pixels','String','Veloc. Muestra  :','Position',[10 240 100 18],'HorizontalAlignment','left');
    
    HCONV1(14) = uicontrol(HCONV1(1),'Style','Text','Units','pixels','String','Time   :','Position',[10 200 50 18],'HorizontalAlignment','left');
    HCONV1(15) = uicontrol(HCONV1(1),'Style','Text','Units','pixels','String','Sample :','Position',[10 180 50 18],'HorizontalAlignment','left');
    HCONV1(16) = uicontrol(HCONV1(1),'Style','Text','Units','pixels','String','VFSCI  :','Position',[10 160 50 18],'HorizontalAlignment','left');
    HCONV1(17) = uicontrol(HCONV1(1),'Style','Text','Units','pixels','String','VFSCD  :','Position',[10 140 50 18],'HorizontalAlignment','left');
    HCONV1(18) = uicontrol(HCONV1(1),'Style','Text','Units','pixels','String','PSA    :','Position',[10 120 50 18],'HorizontalAlignment','left');
    HCONV1(19) = uicontrol(HCONV1(1),'Style','Text','Units','pixels','String','CO2    :','Position',[10 100 50 18],'HorizontalAlignment','left');
    HCONV1(20) = uicontrol(HCONV1(1),'Style','Text','Units','pixels','String','ECG    :','Position',[10  80 50 18],'HorizontalAlignment','left');
    HCONV1(21) = uicontrol(HCONV1(1),'Style','Text','Units','pixels','String','ADIC   :','Position',[10  60 50 18],'HorizontalAlignment','left');
    
    HCONV1(22) = uicontrol(HCONV1(1),'Style','Text','Units','pixels','String',ns,'Position',[100 300 100 18],'HorizontalAlignment','left','BackgroundColor',[1 1 1]);
    HCONV1(23) = uicontrol(HCONV1(1),'Style','Text','Units','pixels','String',fn,'Position',[100 280 100 18],'HorizontalAlignment','left','BackgroundColor',[1 1 1]);
    HCONV1(24) = uicontrol(HCONV1(1),'Style','Text','Units','pixels','String',fm,'Position',[100 260 100 18],'HorizontalAlignment','left','BackgroundColor',[1 1 1]);
    HCONV1(25) = uicontrol(HCONV1(1),'Style','Text','Units','pixels','String',st,'Position',[100 240 100 18],'HorizontalAlignment','left','BackgroundColor',[1 1 1]);
    
    HCONV1(26) = uicontrol(HCONV1(1),'Style','Pushbutton','Units','pixels','String','','Position',[70 200 200 18],'BackgroundColor',[1 1 1],'Callback',@TFConvert1PB01);
    HCONV1(27) = uicontrol(HCONV1(1),'Style','Pushbutton','Units','pixels','String','','Position',[70 180 200 18],'BackgroundColor',[1 1 1],'Callback',@TFConvert1PB02);
    HCONV1(28) = uicontrol(HCONV1(1),'Style','Pushbutton','Units','pixels','String','','Position',[70 160 200 18],'BackgroundColor',[1 1 1],'Callback',@TFConvert1PB03);
    HCONV1(29) = uicontrol(HCONV1(1),'Style','Pushbutton','Units','pixels','String','','Position',[70 140 200 18],'BackgroundColor',[1 1 1],'Callback',@TFConvert1PB04);
    HCONV1(30) = uicontrol(HCONV1(1),'Style','Pushbutton','Units','pixels','String','','Position',[70 120 200 18],'BackgroundColor',[1 1 1],'Callback',@TFConvert1PB05);
    HCONV1(31) = uicontrol(HCONV1(1),'Style','Pushbutton','Units','pixels','String','','Position',[70 100 200 18],'BackgroundColor',[1 1 1],'Callback',@TFConvert1PB06);
    HCONV1(32) = uicontrol(HCONV1(1),'Style','Pushbutton','Units','pixels','String','','Position',[70  80 200 18],'BackgroundColor',[1 1 1],'Callback',@TFConvert1PB07);
    HCONV1(33) = uicontrol(HCONV1(1),'Style','Pushbutton','Units','pixels','String','','Position',[70  60 200 18],'BackgroundColor',[1 1 1],'Callback',@TFConvert1PB08);
    
    HCONV1(34) = uicontrol(HCONV1(1),'Style','Text','Units','pixels','String','Factor :','Position',[300 160 50 18],'HorizontalAlignment','left');
    HCONV1(35) = uicontrol(HCONV1(1),'Style','Text','Units','pixels','String','Factor :','Position',[300 140 50 18],'HorizontalAlignment','left');
    HCONV1(36) = uicontrol(HCONV1(1),'Style','Text','Units','pixels','String','Factor :','Position',[300 120 50 18],'HorizontalAlignment','left');
    HCONV1(37) = uicontrol(HCONV1(1),'Style','Text','Units','pixels','String','Factor :','Position',[300 100 50 18],'HorizontalAlignment','left');
    HCONV1(38) = uicontrol(HCONV1(1),'Style','Text','Units','pixels','String','Factor :','Position',[300  80 50 18],'HorizontalAlignment','left');
    HCONV1(39) = uicontrol(HCONV1(1),'Style','Text','Units','pixels','String','Factor :','Position',[300  60 50 18],'HorizontalAlignment','left');
    
    HCONV1(40) = uicontrol(HCONV1(1),'Style','Text','Units','pixels','String','Offset :','Position',[500 160 50 18],'HorizontalAlignment','left');
    HCONV1(41) = uicontrol(HCONV1(1),'Style','Text','Units','pixels','String','Offset :','Position',[500 140 50 18],'HorizontalAlignment','left');
    HCONV1(42) = uicontrol(HCONV1(1),'Style','Text','Units','pixels','String','Offset :','Position',[500 120 50 18],'HorizontalAlignment','left');
    HCONV1(43) = uicontrol(HCONV1(1),'Style','Text','Units','pixels','String','Offset :','Position',[500 100 50 18],'HorizontalAlignment','left');
    HCONV1(44) = uicontrol(HCONV1(1),'Style','Text','Units','pixels','String','Offset :','Position',[500  80 50 18],'HorizontalAlignment','left');
    HCONV1(45) = uicontrol(HCONV1(1),'Style','Text','Units','pixels','String','Offset :','Position',[500  60 50 18],'HorizontalAlignment','left');
    
    
    HCONV1(46) = uicontrol(HCONV1(1),'Style','Edit','Units','pixels','String',' 1.0','Position',[380 160 50 18],'HorizontalAlignment','left','BackgroundColor',[1 1 1]);
    HCONV1(47) = uicontrol(HCONV1(1),'Style','Edit','Units','pixels','String',' 1.0','Position',[380 140 50 18],'HorizontalAlignment','left','BackgroundColor',[1 1 1]);
    HCONV1(48) = uicontrol(HCONV1(1),'Style','Edit','Units','pixels','String',' 1.0','Position',[380 120 50 18],'HorizontalAlignment','left','BackgroundColor',[1 1 1]);
    HCONV1(49) = uicontrol(HCONV1(1),'Style','Edit','Units','pixels','String',' 1.0','Position',[380 100 50 18],'HorizontalAlignment','left','BackgroundColor',[1 1 1]);
    HCONV1(50) = uicontrol(HCONV1(1),'Style','Edit','Units','pixels','String',' 1.0','Position',[380  80 50 18],'HorizontalAlignment','left','BackgroundColor',[1 1 1]);
    HCONV1(51) = uicontrol(HCONV1(1),'Style','Edit','Units','pixels','String',' 1.0','Position',[380  60 50 18],'HorizontalAlignment','left','BackgroundColor',[1 1 1]);
    
    HCONV1(52) = uicontrol(HCONV1(1),'Style','Edit','Units','pixels','String',' 0.0','Position',[580 160 50 18],'HorizontalAlignment','left','BackgroundColor',[1 1 1]);
    HCONV1(53) = uicontrol(HCONV1(1),'Style','Edit','Units','pixels','String',' 0.0','Position',[580 140 50 18],'HorizontalAlignment','left','BackgroundColor',[1 1 1]);
    HCONV1(54) = uicontrol(HCONV1(1),'Style','Edit','Units','pixels','String',' 0.0','Position',[580 120 50 18],'HorizontalAlignment','left','BackgroundColor',[1 1 1]);
    HCONV1(55) = uicontrol(HCONV1(1),'Style','Edit','Units','pixels','String',' 0.0','Position',[580 100 50 18],'HorizontalAlignment','left','BackgroundColor',[1 1 1]);
    HCONV1(56) = uicontrol(HCONV1(1),'Style','Edit','Units','pixels','String',' 0.0','Position',[580  80 50 18],'HorizontalAlignment','left','BackgroundColor',[1 1 1]);
    HCONV1(57) = uicontrol(HCONV1(1),'Style','Edit','Units','pixels','String',' 0.0','Position',[580  60 50 18],'HorizontalAlignment','left','BackgroundColor',[1 1 1]);
    
    HCONV1(58) = uicontrol(HCONV1(1),'Style','PushButton','Units','Pixels','String','Convertir','Position',[30  10 80 20],'Callback',@TFConvert1_POP0_B1);
    HCONV1(59) = uicontrol(HCONV1(1),'Style','PushButton','Units','Pixels','String','Cancelar','Position',[130 10 80 20],'Callback',@TFConvert1_POP0_Cl);
    
    set(HCONV1(1),'Visible','on');
    GFEnmenu(0);
end

function TFConvert1PB01(hObject, eventdata, handles)
    TFConvert1PB00(1)
end
function TFConvert1PB02(hObject, eventdata, handles)
    TFConvert1PB00(2)
end
function TFConvert1PB03(hObject, eventdata, handles)
    TFConvert1PB00(3)
end
function TFConvert1PB04(hObject, eventdata, handles)
    TFConvert1PB00(4)
end
function TFConvert1PB05(hObject, eventdata, handles)
    TFConvert1PB00(5)
end
function TFConvert1PB06(hObject, eventdata, handles)
    TFConvert1PB00(6)
end
function TFConvert1PB07(hObject, eventdata, handles)
    TFConvert1PB00(7)
end
function TFConvert1PB08(hObject, eventdata, handles)
    TFConvert1PB00(8)
end

function TFConvert1PB00(npos)
  global HCONV1;
  global DAT_EXP;
  global TFCONVERP;
  l=length(DAT_EXP);
  if l > 0
      TFCONVERP=npos;
      HCONV1(60)=uicontrol(HCONV1(1),'Style','listbox','Units','pixels','String',DAT_EXP,'Position',[112 (160-npos*20) 200 60],'BackgroundColor',[1 1 1],'Callback',@TFConvert1PB0A); %'KeyPressFcn',@TFConvert1PB0B);
  end
end

function TFConvert1PB0B(hObject, eventdata, handles)
% hObject    handle to listbox5 (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
  disp('hola');
end

function TFConvert1PB0A(hObject, eventdata, handles)
global TFCONVERP;
TFConvert1PB01X(TFCONVERP);
end

function TFConvert1PB01X(npos)
  global HCONV1;
  global DAT_EXP;
  pos=get(HCONV1(60),'Value');
  strp=char(DAT_EXP(pos));
  l=length(DAT_EXP);
  if l>1
      if pos == 1
          DAT_EXP=DAT_EXP(2:l);
      else
          if pos==l
              DAT_EXP=DAT_EXP(1:l-1);
          else
              DAT_EXP=[DAT_EXP(1:pos-1) DAT_EXP(pos+1:l)];
          end
      end
  else
      DAT_EXP={};
  end

  set(HCONV1(25+npos),'String',strp);
  
  delete(HCONV1(60));
end

function TFConvert1_POP0_B1(hObject, eventdata, handles)
global FILE_NAMER;
global FILE_NAMEW;
global HCONV1;
global LDAT;
global HEADLIN;
global LTIME;
global GCV;
global HCURVAS;
global PCURVAS;
posd=zeros(8);
tfact=zeros(8);
tofst=zeros(8);
HEADLIN={[] []};
   Fnamer=FILE_NAMER;
   [fir,messager] = fopen(Fnamer, 'r') ;
   if fir ~=-1
       % s : caracteristicas del archivo a leer
       s = dir(Fnamer);
           nline=0;
           hbar = waitbar(0,'Por Favor Espere...');
           while ~feof(fir) && nline < 4
               tline = fgetl(fir);
               nline=nline+1;
               lline=length(tline);
               switch nline
                   case 1
                       HEADLIN(1,1)=cellstr(tline(14:lline));
                   case 2
                       HEADLIN(2,1)=cellstr(tline(10:lline));
                   case 3
                       HEADLIN(3,1)=cellstr(tline(13:lline));
                   case 4
                       HEADLIN(4,1)=cellstr(tline(15:lline));
               end
           end
           while ~feof(fir) && nline < 6
               fgetl(fir);
               nline=nline+1;       
           end
           strleer='%s';
           ndat=length(LDAT);
           for k=2:ndat
               strleer=strcat(strleer,'\t%f');
           end
           for k=1:8
               txta=get(HCONV1(25+k),'String');
               tpos=0;
               for j=1:ndat
                   if strcmp(txta,LDAT(j))
                       tpos=j;
                   end
               end
               posd(k)=tpos;
               tfact(k)=1;
               tofst(k)=0;
           end
           for k=1:6
               txta=get(HCONV1(45+k),'String');
               tfact(k+2)=str2double(txta);
               txta=get(HCONV1(51+k),'String');
               tofst(k+2)=str2double(txta);
           end
           
           nc1=GCV(1,11);
           nc2=GCV(2,11);
           nc3=GCV(3,11);
           nc4=GCV(4,11);
           nc5=GCV(5,11);
           nc6=GCV(6,11);
           

           ncolum=0;
           if posd(2) > 0; ncolum=ncolum+1; end;
           if posd(3) > 0; ncolum=ncolum+1;HCURVAS(GCV(1,1))=1; else HCURVAS(GCV(1,1))=0; end;
           if posd(4) > 0; ncolum=ncolum+1;HCURVAS(GCV(2,1))=1; else HCURVAS(GCV(2,1))=0; end;
           if posd(5) > 0; ncolum=ncolum+1;HCURVAS(GCV(3,1))=1; else HCURVAS(GCV(3,1))=0; end;
           if posd(6) > 0; ncolum=ncolum+1;HCURVAS(GCV(4,1))=1; else HCURVAS(GCV(4,1))=0; end;
           if posd(7) > 0; ncolum=ncolum+1;HCURVAS(GCV(5,1))=1; else HCURVAS(GCV(5,1))=0; end;
           if posd(8) > 0; ncolum=ncolum+1;HCURVAS(GCV(6,1))=1; else HCURVAS(GCV(6,1))=0; end;
           ndiv=11+ncolum*2;
           ndatos=round((s.bytes/ndiv));
           
           LTIME={'00:00:00:00' '00:00:00:00'};
           PCURVAS(nc1,1:ndatos)=zeros(1,ndatos,'double');
           PCURVAS(nc2,1:ndatos)=zeros(1,ndatos,'double');
           PCURVAS(nc3,1:ndatos)=zeros(1,ndatos,'double');
           PCURVAS(nc4,1:ndatos)=zeros(1,ndatos,'double');
           PCURVAS(nc5,1:ndatos)=zeros(1,ndatos,'double');
           PCURVAS(nc6,1:ndatos)=zeros(1,ndatos,'double');
        
           conta=0;
           while ~feof(fir)
               conta=conta+1;
               tline = fgetl(fir);
               A= sscanf(tline,strleer);
               hora=strcat( char(A(1)),char(A(2)),char(A(3)),char(A(4)),char(A(5)),char(A(6)),char(A(7)),char(A(8)),char(A(9)),char(A(10)),char(A(11)) );
            
               if posd(2) > 0; num1=A(10+posd(2)); else num1=0; end;
               if posd(3) > 0; num2=A(10+posd(3));num2=num2*tfact(3)+tofst(3); else num2=0; end;
               if posd(4) > 0; num3=A(10+posd(4));num3=num3*tfact(4)+tofst(4); else num3=0; end;
               if posd(5) > 0; num4=A(10+posd(5));num4=num4*tfact(5)+tofst(5); else num4=0; end;
               if posd(6) > 0; num5=A(10+posd(6));num5=num5*tfact(6)+tofst(6); else num5=0; end;
               if posd(7) > 0; num6=A(10+posd(7));num6=num6*tfact(7)+tofst(7); else num6=0; end;
               if posd(8) > 0; num7=A(10+posd(8));num7=num7*tfact(8)+tofst(8); else num7=0; end;

               LTIME(conta)=cellstr(hora);
               PCURVAS(nc2,conta)=num2;
               PCURVAS(nc3,conta)=num3;
               PCURVAS(nc1,conta)=num4;
               PCURVAS(nc4,conta)=num5;
               PCURVAS(nc5,conta)=num6;
               PCURVAS(nc6,conta)=num7;
               nline=nline+1;
               lbar=(nline*36)/s.bytes;
               if lbar > 1; lbar=1; end;
               waitbar(lbar);
           end
           HCURVAS(17)=conta;
           HCURVAS(16)=1;
       fclose(fir);
       close(hbar);
       GFWFile(FILE_NAMEW,1,2);
       TFConvert1_POP0_Cl();
   else
       warndlg(strcat('Error de apertura ',messager),'Convertir Archivo');
   end
end

% funcion que se llama al cerrar ventana popup de manejo de curvas 1
function TFConvert1_POP0_Cl(hObject, eventdata, handles)
global HCONV1;
disp('TFConvert1_POP0_Cl...');
delete(HCONV1(1));
clear('HCONV1');
GFEnmenu(2);
disp('...TFConvert1_POP0_Cl');
end