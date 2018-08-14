% *****                  USO GENERAL                             *****
% --------------------------------------------------------------------
% -- Inicializa Ventana, Borra Variables y Habilita men� especifico --
% --------------------------------------------------------------------
function GFinicia(handles,nmenu)
% handles    estructura con punteros a datos de la GUI
% nmenu      codificaci�n indicando los men� a habilitar

% Inicializa Ventana
GFView(handles,0);
% Borra Variables
GFClean();
% Habilita Opciones de Men�
GFEnmenu(nmenu);