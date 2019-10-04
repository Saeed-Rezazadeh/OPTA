function SDR = OPTA_BA_TWC(p , rate , epsilon_1 , epsilon_2 , noise_delta)
D (1) = (1 - p ^ 2) / 2 ^ (2 * rate * (1 - (1 - epsilon_2) * binary_entropy(epsilon_2 / (1 + noise_delta)) - epsilon_2 * binary_entropy((1 - epsilon_2) / (1 + noise_delta)))) ;
D (2) = (1 - p ^ 2) / 2 ^ (2 * rate * (1 - (1 - epsilon_1) * binary_entropy(epsilon_1 / (1 + noise_delta)) - epsilon_1 * binary_entropy((1 - epsilon_1) / (1 + noise_delta)))) ;
Distortion = sum(D) ; 
SDR = 10 * log10(2 / Distortion) ;
end