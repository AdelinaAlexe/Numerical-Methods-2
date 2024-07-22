function recoms = recommendations(path, liked_theme, num_recoms, min_reviews, num_features)
  # TODO: Get the best `num_recoms` recommandations similar with 'liked_theme'.

  % read the matrix from the csv file
  mat = read_mat(path);

  % preprocess the matrix
  mat = preprocess(mat, min_reviews);

  % reduced svd
  [~, ~, V] = svds(mat, num_features);
  V = V';

  % liked theme vector
  vector = V(:, liked_theme);

  % cosine similarity between liked theme vector and the rest of vectors
  n = size(V, 2);
  cos_sim = zeros(n, 1);

  for i = 1:n
    cos_sim(i) = cosine_similarity(vector, V(:, i));
  endfor

  % sort themes by similarity
  [~, recoms] = sort(cos_sim, 'descend');

  % get the final recommandations
  recoms = recoms(2: num_recoms + 1);

  recoms = recoms';
end
