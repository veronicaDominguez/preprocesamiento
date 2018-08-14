% *****                  USO GENERAL                             *****
% --------------------------------------------------------------------
% -- Inicializa Ventana, Borra Variables y Habilita mení especifico --
% --------------------------------------------------------------------
function GFinicia(handles,nmenu)
% handles    estructura con punteros a datos de la GUI
% nmenu      codificación indicando los menú a habilitar

% Inicializa Ventana
GFView(handles,0);
% Borra Variables
GFClean();
% Habilita Opciones de Menú
GFEnmenu(nmenu);