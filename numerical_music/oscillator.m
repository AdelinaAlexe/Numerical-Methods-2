function x = oscillator(freq, fs, dur, A, D, S, R)
  % x = 0;

  % time vector
  t = (0:1/fs:dur)';
  t = t(1:end - 1);

  % sine wave
  sine_wave = sin(2 * pi * freq * t);

  % envelope samples
  nr_samples = length(t);
  attack_s = floor(A * fs);
  decay_s = floor(D * fs);
  sustain_s = nr_samples - attack_s - decay_s - floor(R * fs);
  release_s = floor(R * fs);

  % generate envelopes
  attack_e = linspace(0, 1, attack_s)';
  decay_e = linspace(1, S, decay_s)';
  sustain_e = S * ones(sustain_s, 1);
  release_e = linspace(S, 0, release_s)';

  % concatenate envelopes
  envelope = [attack_e; decay_e; sustain_e; release_e];

  % apply amplitude modulation
  x = sine_wave .* envelope;

endfunction

