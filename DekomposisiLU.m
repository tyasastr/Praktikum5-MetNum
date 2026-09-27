% spl - dekomposisi lu (doolittle)

function DekomposisiLU()
  A = [2, 1, -1;
       4, 3, 1;
      -2, 1, 2];
  b = [3; 9; 4];
  Ab = [A b];
  [n, m] = size(Ab);
  L = eye(n);
  U = zeros(n);

  % menampilkan matriks awal
  fprintf('Matriks awal (augmented): \n');
  for i = 1:n
    fprintf('[ ');
    for j = 1:n
      fprintf('%6d ', A(i,j));
    end
    fprintf('] = [%6d ]\n', b(i));
  end

  tic
  for i = 1:n
    % elemen matriks U
    for k = i:n
      U(i, k) = A(i, k) - L(i,1:i-1)*U(1:i-1,k);
    end
    % elemen matriks L
    for k = i+1:n
      L(k, i) = (A(k, i) - L(k,1:i-1)*U(1:i-1,i)) / U(i, i);
    end
  end

  fprintf('Matriks L:\n');
  for i = 1:n
    fprintf( '[ ');
    for j = 1:n
      fprintf('%6d ', L(i,j));
    end
    fprintf(']\n');
  end

  fprintf('Matriks U:\n')
  for i = 1:n
    fprintf( '[ ');
    for j = 1:n
      fprintf('%6d  ', U(i,j));
    end
    fprintf(']\n');
  end

  % forward subs (Ly = b)
  y = zeros(n,1);
  for i = 1:n
    y(i) = b(i) - L(i, 1:i-1)*y(1:i-1);
  end

  % backward suba (Ux = y)
  x = zeros(n,1);
  for i = n:-1:1
    x(i) = (y(i) - U(i,i+1:n)*x(i+1:n)) / U(i,i);
  end

  disp('Solusi akhir: ')
  fprintf('Solusi akhir dalam pecahan: \n');
  for i = 1:n
    fprintf('[ %s ]\n', rats(x(i)));
  end

  fprintf('Solusi akhir dalam desimal: \n');
  for i = 1:n
    fprintf('[ %6g ]\n', (x(i)));
  end

  toc
end
