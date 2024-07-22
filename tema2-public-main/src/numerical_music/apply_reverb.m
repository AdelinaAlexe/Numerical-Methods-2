function signal = apply_reverb(signal, impulse_response)
  % signal = 0;

  % convert to mono
  impulse_response = stereo_to_mono(impulse_response);

  % convolution between signal and impulse_response
  signal = fftconv(signal, impulse_response);

  % normalize
  signal = signal / max(abs(signal));
endfunction

