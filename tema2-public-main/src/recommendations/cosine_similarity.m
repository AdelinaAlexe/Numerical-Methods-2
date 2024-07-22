function similarity = cosine_similarity(A, B)
  # TODO: Compute the cosine similarity between two column vectors.

  % normalize vectors
  A = A / max(abs(A));
  B = B / max(abs(B));

  similarity = (B' * A) / (norm(A) * norm(B));
end
