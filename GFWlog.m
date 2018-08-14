% *****                  USO GENERAL                             *****
% --------------------------------------------------------------------
% -- Graba un registro en el archivo especificado                   --
% --------------------------------------------------------------------
function GFWlog(tfile,tstring)
% tfile      nombre del archivo a agregar el registro
% tstring    linea de registro a guardar en archivo
global DIR_TRAB;
global IDEBUG;
if IDEBUG; disp('GFWlog...'); end;
  nfile=strcat(DIR_TRAB,'\',tfile);
  [fir,messagew] = fopen(char(nfile), 'a');
  if fir ~= -1
      fprintf(fir,'%s\r\n',tstring);
      fclose(fir);
  end
if IDEBUG; disp('...GFWlog'); end;
end