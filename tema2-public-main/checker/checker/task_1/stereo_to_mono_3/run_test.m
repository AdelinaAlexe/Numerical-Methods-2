function run_test()
    "task-1";
    tol = 1e-4;

    fout = fopen("out", "w");

    load("../../input/task_1/in_stereo_to_mono_3.mat");
    in_sig = impulse_response;
    clear impulse_response;

    load("../../input/task_1/ref_stereo_to_mono_3.mat");
    ref_sig = sig;
    clear sig;

    sig = stereo_to_mono(in_sig);
    save "output.mat" sig;

    dsig = abs(sig - ref_sig);

    is_sig_good = mean(dsig) < tol

    fprintf(fout, "%d", is_sig_good);

    fclose(fout);
endfunction

