function mat = read_mat(path)
  # TODO: Parse the .csv file and return the matrix of values (without row and column headers).

  % read the .csv file
  mat = csvread(path);

  % remove headers
  mat = mat(2:end, 2:end);

  end
