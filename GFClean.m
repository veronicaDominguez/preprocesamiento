% *****                  USO GENERAL                             *****
% --------------------------------------------------------------------
% -- Elimina todos los punteros a estructuras de curva y            --
% -- estructuras de ventana.                                        --
% -- Se utiliza para inicializar las variables                      --
% --------------------------------------------------------------------
function GFClean()
global GCV;
global IDEBUG;
if IDEBUG; disp('GFClean...'); end;
  for k=1:6
      GFBorra_Hand(GCV(k,2),1);
      GFBorra_Hand(GCV(k,3),1);
      GFBorra_Hand(GCV(k,4),1);
      GFBorra_Hand(GCV(k,5),1);
      GFBorra_Hand(GCV(k,6),1);
  end
  for k=1:20
      GFBorra_Hand(k,2);
  end
  GFBorra_Hand(60,1);
  GFBorra_Hand(61,1);
if IDEBUG; disp('...GFClean'); end;
end