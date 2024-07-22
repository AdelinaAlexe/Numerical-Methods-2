function y_interp = P_spline (coef, x, x_interp)
	% si(x)   = ai + bi(x - xi) + ci(x - xi)^2 + di(x - xi)^3, i = 0 : n - 1
	% coef = [a0, b0, c0, d0, a1, b1, c1, d1, ..., an-1, bn-1, cn-1, dn-1]
	% x = [x0, x1, ..., xn]
	% y_interp(i) = P_spline(x_interp(i)), i = 0 : length(x_interp) - 1
	% Be careful! Indexes in Matlab start from 1, not 0

  % TODO: Calculate y_interp using the Spline coefficients

 % find n = number of intervals
 n = length(x);

 % intialize y_interp
 y_interp = zeros(length(x_interp), 1);

 % find the interval in which x_interp belongs

 for i = 1:length(x_interp)
   idx = find(x_interp(i) >= x, 1, 'last');

   if isempty(idx)
     idx = 1;
   elseif idx >= n
     idx = n - 1;
   endif

   diff_x = x_interp(i) - x(idx);

   % evaluate at x_interp(i)
   y_interp(i) = coef((idx - 1) * 4 + 1) + coef((idx - 1) * 4 + 2) * diff_x + ...
          + coef((idx - 1) * 4 + 3) * (diff_x ^ 2) + coef((idx - 1) * 4 + 4) * (diff_x ^ 3);
 endfor
end
