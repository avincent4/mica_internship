function formatator_3000(parameters, S11_values, f_values, threshold, min_length, filename)
    % Paramètres
    Lgnd = parameters(1);
    Wgnd = parameters(2);
    La = parameters(3);
    Wa = parameters(4);
    Wf = parameters(5);
    Wi = parameters(6);
    Li = parameters(7);
    H = parameters(8);
    
    % Détection des intervalles
    indices_below_threshold = find(S11_values < threshold);
    
    % Vérifier si des intervalles ont été détectés
    if isempty(indices_below_threshold)
        disp('Aucun intervalle détecté.');
        
        % Création d'un enregistrement pour les dimensions même en l'absence d'intervalle
        no_interval_record = [Lgnd, Wgnd, La, Wa, Wf, Wi, Li, H, NaN, NaN];
        
        % Écriture de l'enregistrement dans un fichier CSV
        csvwrite(filename, no_interval_record);
        
        disp(['Dimensions enregistrées dans le fichier ', filename]);
        
        return;
    end
    
    interval_start = [indices_below_threshold(1)];
    interval_end = [];
    
    for i = 2:length(indices_below_threshold)
        if indices_below_threshold(i) ~= indices_below_threshold(i - 1) + 1
            interval_end = [interval_end, indices_below_threshold(i - 1)];
            interval_start = [interval_start, indices_below_threshold(i)];
        end
    end
    
    interval_end = [interval_end, indices_below_threshold(end)];
    
    % Filtrage des intervalles selon la longueur minimale
    interval_indices_to_remove = [];
    for i = 1:length(interval_start)
        if interval_end(i) - interval_start(i) + 1 < min_length
            interval_indices_to_remove = [interval_indices_to_remove, i];
        end
    end
    
    interval_start(interval_indices_to_remove) = [];
    interval_end(interval_indices_to_remove) = [];
    
    % Création de la matrice pour stocker les intervalles et les paramètres
    interval_parameter_matrix = [];
    
    % Remplissage de la matrice avec les intervalles détectés et les paramètres
    for i = 1:length(interval_start)
        interval = [Lgnd, Wgnd, La, Wa, Wf, Wi, Li, H, f_values(interval_start(i)), f_values(interval_end(i))];
        interval_parameter_matrix = [interval_parameter_matrix; interval];
    end
    
    % Écriture de la matrice dans un fichier CSV
    csvwrite(filename, interval_parameter_matrix);
    
    disp(['Intervalles et paramètres enregistrés dans le fichier ', filename]);
end
