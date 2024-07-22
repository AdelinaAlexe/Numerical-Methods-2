function coef = spline_c2 (x, y)
	% Remember that the indexes in Matlab start from 1, not 0

	% si(x)   = ai + bi(x - xi) + ci(x - xi)^2 + di(x - xi)^3
	% si'(x)  =      bi         + 2ci(x - xi)  + 3di(x - xi)^2
	% si''(x) =                   2ci          + 6di(x - xi)

  % find n = number of intervals
  n = length(x) - 1;

  % differences between consecutive x values
  diff_x = diff(x);

  % initialize multiple arrays
  s = zeros(n, 1);
  arr1 = zeros(n + 1, 1);
  arr2 = zeros(n + 1, 1);
  arr3 = zeros(n + 1, 1);

  % TOOD 1: si(xi) = yi, i = 0 : n - 1
  % TODO 2: s_n-1(xn) = yn

  % compute s array based on the formula
  for i = 2:n
    s(i) = (3 / diff_x(i)) * (y(i + 1) - y(i)) - (3 / diff_x(i - 1)) * (y(i) - y(i - 1));
  endfor

  % set the initial value to 1
  arr1(1) = 1;

  % TODO 3: si(x_i+1) = s_i+1(x_i+1), i = 0 : n - 1
	% TODO 4: si'(x_i+1) = s_i+1'(x_i+1), i = 0 : n - 1
	% TODO 5: si''(x_i+1) = s_i+1''(x_i+1), i = 0 : n - 1

  % compute the rest of the arrays

  for i = 2:n
    arr1(i) = 2 * (x(i + 1) - x(i - 1)) - diff_x(i - 1) * arr2(i - 1);
    arr2(i) = diff_x(i) / arr1(i);
    arr3(i) = (s(i) - diff_x(i - 1) * arr3(i - 1)) / arr1(i);
  endfor

  % TODO 6: s0''(x0) = 0
  % TODO 7: s_n-1''(x_n) = 0

  % set the last values for arr1 and arr2
  arr1(n + 1) = 1;
  arr3(n + 2) = 0;


	% Solve the system of equations

  % initialize arrays for coefficients
  c = zeros(n + 1, 1);
  b = zeros(n, 1);
  d = zeros(n, 1);

  % calculate coefficients using backward iteration
  for j = n:-1:1
    c(j) = arr3(j) - arr2(j) * c(j + 1);
    b(j) = (y(j + 1) - y(j)) / diff_x(j) - diff_x(j) * (c(j + 1) + 2 * c(j)) / 3;
    d(j) = (c(j + 1) - c(j)) / (3 * diff_x(j));
  endfor

  a = y(1:end - 1)';
  b = b';
  c = c(1:end - 1)';
  d = d';

  % convert coefficient arrays into a single array
  coef = zeros(4 * n, 1);

  for i = 0:n - 1
    coef(4 * i + 1) = a(i + 1);
    coef(4 * i + 2) = b(i + 1);
    coef(4 * i + 3) = c(i + 1);
    coef(4 * i + 4) = d(i + 1);
  endfor

end
