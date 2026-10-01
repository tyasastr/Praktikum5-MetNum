% spl - eliminasi gauss jordan

function EliminasiGaussJordan()
  A = [2, 1, -1;
       4, 3, 1;
      -2, 1, 2];
  b = [3; 9; 4];
  [n] = size(A, 1);
  Ab = [A b];

  % menampilkan matriks awal
  fprintf('Matriks awal (augmented): \n');
  for i = 1:n
    fprintf('[ ');
    for j = 1:n
      fprintf('%6d ', A(i,j));
    end
    fprintf('| %6d ]\n', b(i));
  end

  % menampilkan matriks hasil forward elim (di metode gauss)
  fprintf('\nHasil forward elimination:\n');

  Ab = [2, 1, -1, 3;
        0, 1,  3, 3;
        0, 0, -5, 1];

  for i = 1:n
      fprintf('[ ');

      for j = 1:n
          fprintf('%6g ', Ab(i,j));
      end

      fprintf('| %6g ]\n', Ab(i,end));
  end

tic

for i = 1:n
  Ab(i,:) = Ab(i,:) / Ab(i,i);

  for h = 1:n
    if h ~= i
      Ab(h,:) = Ab(h,:) - Ab(h,i)*Ab(i,:);
    end
  end
end

% hasil matriks identitas dan solusi
fprintf('Hasil eliminasi (matriks identitas dan solusi akhir dalam desimal):\n');
for i = 1:n
  fprintf('[ ');
  for j = 1:n
    fprintf('%6d ', Ab(i,j));
  end
  fprintf('| %6d ]\n', Ab(i, end));
end

% menampilkan solusi akhir
x = Ab(:, end);
fprintf('Solusi akhir dalam pecahan: \n');
for i = 1:n
  fprintf('[ %s ]\n', rats(x(i)));
end
