function [out, freq] = simulator_3000(antenna, show, f1, f2, Nf)

    freq = linspace(f1, f2, Nf);
    
     s = sparameters(antenna, freq, 50);

   
     
        figure;
        rfplot(s)

         out = s.Parameters(:, 1, 1);

end