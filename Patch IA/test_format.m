% Exemple d'utilisation
parameters = [2, 3, 4, 5, 1, 2, 0.5, 1.5];
S11_values = rand(1, 100)*100 - 50; % Remplacez par vos valeurs S11
f_values = linspace(1e9, 10e9, 100); % Remplacez par vos valeurs de fréquence
threshold = -0.5;
min_length = 3;
filename = 'intervalle_parametres.csv';

formatator_3000(parameters, S11_values, f_values, threshold, min_length, filename);


% Affichage du graphique S11 en fonction de la fréquence
figure;
plot(f_values, 20*log10(abs(S11_values)), 'b', 'LineWidth', 2);
xlabel('Fréquence (Hz)');
ylabel('|S11| (dB)');
title('Paramètre S11 en fonction de la fréquence');
grid on;