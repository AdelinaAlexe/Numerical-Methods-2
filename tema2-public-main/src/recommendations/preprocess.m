function reduced_mat = preprocess(mat, min_reviews)
  # TODO: Remove all user rows from `mat` that have strictly less then `min_reviews` reviews.

  % number of reviews per client
  reviews = sum(mat ~= 0, 2);

  % indices of clients with not enough reviews
  idx = find(reviews >= min_reviews);

  % extract corresponding rows
  reduced_mat = mat(idx, :);
  end
