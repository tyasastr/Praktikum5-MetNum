% spl - eliminasi gauss

function EliminasiGauss()
  A = [2, 1, -1;
       4, 3, 1;
      -2, 1, 2];
  b = [3; 9; 4];
  [n] = size(A, 1); % mengambil jumlah baris dari matriks A

  % menampilkan matriks awal
  fprintf('Matriks awal (augmented): \n')
  for i = 1:n
    fprintf('[ ');
    for j = 1:n
      fprintf('%6g ', A(i,j));
    end
    fprintf('|%6g ]\n', b(i));
  end

tic

% forward elimination
for i = 1 : n-1
    for h = i+1:n
      m = A(h, i) / A(i, i);
      A(h, :) = A(h, :) - m*A(i, :);
      b(h, :) = b(h, :) - m*b(i, :);
    end
end

% menampilkan hasil forward elim
fprintf('Hasil forward elimination:\n');
for i = 1:n
  fprintf('[ ');

  for j = 1:n
    fprintf('%6g ', A(i,j));
  end
  fprintf('| %6g ]\n', b(i));
end

% himpunan penyelesaian
x = zeros(n, 1);
for i = n:-1:1
    x(i) = (b(i) - A(i, i+1:n)*x(i+1:n)) / A(i,i);
end

% menampilkan solusi akhir
disp('Solusi akhir:')
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
