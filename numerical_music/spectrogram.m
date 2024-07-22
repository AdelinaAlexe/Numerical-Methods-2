function [S f t] = spectrogram(signal, fs, window_size)
	;S = 0;
  ;f = 0;
  ;t = 0;

  % compute the number of windows
  nr_windows = floor(length(signal) / window_size);

  % initialize spectogram matrix
  S = zeros(window_size, nr_windows);

  % for each window
  for i = 1:nr_windows
    % current window
    window = signal(((i - 1) * window_size + 1):(i * window_size));

    % hann window
    window = window .* hanning(window_size);

    % apply fourrier transform
    window = fft(window, 2 * window_size);

    % discard the conjugate part
    window = window(1:window_size);

    % store the result in spectogram matrix
    S(:, i) = abs(window);

    % time vector
    t(i) = (i - 1) * window_size / fs;
  endfor

  t = t';

  % frequency vector
  f = ((0:window_size - 1) * fs / (window_size * 2))';

endfunction

