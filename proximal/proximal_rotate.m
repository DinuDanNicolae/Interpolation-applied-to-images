function R = proximal_rotate(I, rotation_angle)
    % =========================================================================
    % Roteste imaginea alb-negru I de dimensiune m x n cu unghiul rotation_angle,
    % aplic�nd Interpolare Proximala.
    % rotation_angle este exprimat �n radiani.
    % =========================================================================
    [m n nr_colors] = size(I);
    
    % Se converteste imaginea de intrare la alb-negru, daca este cazul.
    if nr_colors > 1
        R = -1;
        return
    endif

    % Obs:
    % Atunci c�nd se aplica o scalare, punctul (0, 0) al imaginii nu se va deplasa.
    % �n Octave, pixelii imaginilor sunt indexati de la 1 la n.
    % Daca se lucreaza �n indici de la 1 la n si se inmultesc x si y cu s_x respectiv s_y,
    % atunci originea imaginii se va deplasa de la (1, 1) la (sx, sy)!
    % De aceea, trebuie lucrat cu indici �n intervalul [0, n - 1].

    % TODO: Calculeaza cosinus si sinus de rotation_angle.
    
    sinus = sin(rotation_angle);
    cosinus = cos(rotation_angle);
    
    % TODO: Initializeaza matricea finala.

    R = zeros(m,n);
    
    % TODO: Calculeaza matricea de transformare.
    
    Trans = zeros(2,2);
    Trans(1,1) = cosinus;
    Trans(1,2) = -sinus;
    Trans(2,1) = sinus;
    Trans(2,2) = cosinus;
    
    % TODO: Inverseaza matricea de transformare, FOLOSIND doar functii predefinite!
    
    inv_Trans = inv(Trans);
    
    % Se parcurge fiecare pixel din imagine.
    for y = 0 : m - 1
        for x = 0 : n - 1
            % TODO: Aplica transformarea inversa asupra (x, y) si calculeaza x_p si y_p
            % din spatiul imaginii initiale.
            
            aux = inv_Trans * [x; y];
            x_p = aux(1);
            y_p = aux(2);
            
            % TODO: Trece (xp, yp) din sistemul de coordonate [0, n - 1] �n
            % sistemul de coordonate [1, n] pentru a aplica interpolarea.
            
            x_p = x_p + 1;
            y_p = y_p + 1;
            
            % TODO: Daca xp sau yp se afla �n exteriorul imaginii,
            % se pune un pixel negru si se trece mai departe.
            
            if x_p < 1 || x_p > n || y_p < 1 || y_p > m
              R(y+1, x+1) = 0;
              continue;
            endif
            
            % TODO: Afla punctele ce �nconjoara(xp, yp).

            x1 = floor(x_p);
            y1 = floor(y_p);
            x2 = floor(x_p)+1;
            y2 = floor(y_p)+1;
            
            % TODO: Calculeaza coeficientii de interpolare notati cu a
            % Obs: Se poate folosi o functie auxiliara �n care sau se calculeze coeficientii,
            % conform formulei.
            
            a = proximal_coef(I,y1,x1,y2,x2);

            % TODO: Calculeaza valoarea interpolata a pixelului (x, y).
            
            R(y+1, x+1) = a(1) + a(3) * x_p + a(2) * y_p + a(4) * y_p * x_p;
            
        endfor
    endfor

    R = uint8(R);
    
    % TODO: Transforma matricea rezultata �n uint8 pentru a fi o imagine valida.
    
endfunction