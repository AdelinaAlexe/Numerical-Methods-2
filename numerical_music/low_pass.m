function signal = low_pass(signal, fs, cutoff_freq)
  % signal = 0;

  % compute fourier transform of the signal
  x = fft(signal);

  % all possible frequencies
  n = length(signal);
  f = (0:n - 1) * (fs / n);

  % create mask for low-pass filter
  mask = f < cutoff_freq;

  % hadamard product between fourier transform and mask
  x = x .* mask';

  % compute inverse fourier transform to get filtered signal
  signal = ifft(x);

  % normalize filtered signal
  signal = signal / max(abs(signal));
endfunction

