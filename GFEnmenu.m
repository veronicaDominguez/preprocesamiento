% *****                  USO GENERAL                             *****
% --------------------------------------------------------------------
% -- Habilita y desabilita opciones de Menu, dependiendo de la      --
% -- funcionalidad que se ejecute                                   --
% -- Se genera array hab donde                                      --
% -- 10 primeros elementos son menú principal (horizontal)          --
% -- 10 elementos siguientes sub-menu 1, 2 hasta 5 sub-menú         --
% --------------------------------------------------------------------
function GFEnmenu(modo)
% --------------------------------------------------------------------
% modo = número de modo que se utilizará donde se encuentra codificado
%        los menú y sub-menu habilitados o deshabilitados.
% --------------------------------------------------------------------
global MHANDLE;
global IDEBUG;
if IDEBUG; disp('GFEnmenu...'); end;
switch modo
    case 0  % todas las opciones de menu deshabilitadas
        hab=[0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0];
    case 1  % modo menu de inicio, se habilitan opciones iniciales
        hab=[1 0 0 0 0 0 0 0 0 0  1 1 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0];
    case 2  % menu de opciones basicas de apertura y convertir
        hab=[1 1 1 1 1 0 0 0 0 0  1 1 0 0 0 0 0 0 0 0  1 0 0 0 1 1 0 0 0 0  1 1 1 0 0 0 0 0 0 0  1 0 0 0 0 0 0 0 0 0  1 0 0 0 0 0 0 0 0 0];
    case 3  % menu de opciones cuando se encuentre filtrando archivo
        hab=[1 1 0 0 0 0 0 0 0 0  1 1 0 0 0 0 0 0 0 0  1 1 1 1 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0];
    case 4  % menu de opciones cuando se encuentre calculando maximos y minimos
        hab=[1 1 0 0 0 0 0 0 0 0  1 1 0 0 0 0 0 0 0 0  0 0 0 0 0 1 1 1 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0];
    case 5  % menu de opciones cuando se encuentre procesando
        hab=[1 0 0 1 0 0 0 0 0 0  1 1 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  1 1 1 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0];
    case 6  % menu de opciones cuando se encuentre en extras
        hab=[1 0 0 0 1 0 0 0 0 0  1 1 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0];
end


  % MENU PRINCIPAL
  if hab(1)
      set(MHANDLE.File,'Enable','on');
  else
      set(MHANDLE.File,'Enable','off');
  end
  if hab(2)
      set(MHANDLE.Prepro,'Enable','on');
  else
      set(MHANDLE.Prepro,'Enable','off');
  end
  if hab(3)
      set(MHANDLE.Tool,'Enable','on');
  else
      set(MHANDLE.Tool,'Enable','off');
  end
  if hab(4)
      set(MHANDLE.Process,'Enable','on');
  else
      set(MHANDLE.Process,'Enable','off');
  end
  if hab(5)
      set(MHANDLE.EXT_COMP,'Enable','on');
  else
      set(MHANDLE.EXT_COMP,'Enable','off');
  end
  
  % SUB MENU 1
  if hab(11)
      set(MHANDLE.Ddatos,'Enable','on');
  else
      set(MHANDLE.Ddatos,'Enable','off');
  end
  
  if hab(12)
      set(MHANDLE.Ininew,'Enable','on');
  else
      set(MHANDLE.Ininew,'Enable','off');
  end
  
  % SUB MENU 2
  if hab(21)
      set(MHANDLE.Open,'Enable','on');
  else
      set(MHANDLE.Open,'Enable','off');
  end
  
  if hab(22)
      set(MHANDLE.Savetmp,'Enable','on');
  else
      set(MHANDLE.Savetmp,'Enable','off');
  end
  
  if hab(23)
      set(MHANDLE.Save,'Enable','on');
  else
      set(MHANDLE.Save,'Enable','off');
  end
  
  if hab(24)
      set(MHANDLE.FilFileEnd,'Enable','on');
  else
      set(MHANDLE.FilFileEnd,'Enable','off');
  end
  
  if hab(25)
      set(MHANDLE.Cutfile,'Enable','on');
  else
      set(MHANDLE.Cutfile,'Enable','off');
  end
  
  if hab(26)
      set(MHANDLE.Maxmin,'Enable','on');
  else
      set(MHANDLE.Maxmin,'Enable','off');
  end
  
  if hab(27)
      set(MHANDLE.SaveMMU,'Enable','on');
  else
      set(MHANDLE.SaveMMU,'Enable','off');
  end
  
  if hab(28)
      set(MHANDLE.FinMMU,'Enable','on');
  else
      set(MHANDLE.FinMMU,'Enable','off');
  end
  
  % SUB MENU 3
  if hab(31)
      set(MHANDLE.Convert1,'Enable','on');
  else
      set(MHANDLE.Convert1,'Enable','off');
  end
  
  if hab(32)
      set(MHANDLE.Convert2,'Enable','on');
  else
      set(MHANDLE.Convert2,'Enable','off');
  end
  
  if hab(33)
      set(MHANDLE.Compare1,'Enable','on');
  else
      set(MHANDLE.Compare1,'Enable','off');
  end
  
  % SUB MENU 4
  if hab(41)
      set(MHANDLE.CP_Load,'Enable','on');
  else
      set(MHANDLE.CP_Load,'Enable','off');
  end
  
  if hab(42)
      set(MHANDLE.CP_WPAR,'Enable','on');
  else
      set(MHANDLE.CP_WPAR,'Enable','off');
  end
  
  if hab(43)
      set(MHANDLE.CP_QPAR,'Enable','on');
  else
      set(MHANDLE.CP_QPAR,'Enable','off');
  end
  
  % SUB MENU 5
  if hab(51)
      set(MHANDLE.EXT_FilAut,'Enable','on');
  else
      set(MHANDLE.EXT_FilAut,'Enable','off');
  end
  if IDEBUG; disp('...GFEnmenu'); end;
end