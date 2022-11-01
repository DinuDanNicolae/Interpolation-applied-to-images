function out = proximal_resize_RGB(img, p, q)
    % =========================================================================
    % Redimensioneaza imaginea img astfel încât aceasta save fie de dimensiune p x q.
    % Imaginea img este colorata.
    % =========================================================================

    % TODO: Extrage canalul rosu al imaginii.
    
    R = img(:,:,1);
    
    % TODO: Extrage canalul verde al imaginii.
    
    G = img(:,:,2);
    
    % TODO: Extrage canalul albastru al imaginii.
    
    B = img(:,:,3);
    
    % TODO: Aplica functia proximal pe cele 3 canale ale imaginii.
    
    Br = proximal_resize(B,p,q);
    Gr = proximal_resize(G,p,q);
    Rr = proximal_resize(R,p,q);
    
    % TODO: Formeaza imaginea finala concatenând cele 3 canale de culori.

    out(:,:,1) = Rr;
    out(:,:,2) = Gr;
    out(:,:,3) = Br;
    
endfunction
