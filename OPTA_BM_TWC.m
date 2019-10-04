function SDR = OPTA_BM_TWC (p , rate , epsilon_1 , epsilon_2 , LEN)
clc ;
D = zeros(LEN , 2) ; 
for i = 1 : LEN
    
    alpha = gamrnd(1,1 , [4 , 1]);
    alpha_4 = alpha(1) ./ sum(alpha) ; 
    alpha_1 = alpha(2) ./ sum(alpha) ; 
    alpha_2 = alpha(3) ./ sum(alpha) ; 
    alpha_3 = alpha(4) ./ sum(alpha) ; 
    
    
    
    beta_1 = (1 - epsilon_1) * (alpha_1 / (alpha_1 + alpha_3)) + epsilon_1 * (alpha_3 / (alpha_1 + alpha_3)) ; 
    beta_2 = (1 - epsilon_2) * (alpha_2 / (alpha_2 + alpha_3)) + epsilon_2 * (alpha_3 / (alpha_2 + alpha_3)) ; 
    
    I_X_1_Y_2_given_X_2 = (alpha_2 + alpha_3) *(binary_entropy(beta_2) - binary_entropy(epsilon_2)) ; 
    I_X_2_Y_1_given_X_1 = (alpha_1 + alpha_3) *(binary_entropy(beta_1) - binary_entropy(epsilon_1)) ; 
    D(i , :) = [(1 - p^2) / (2 ^ (2 * rate * I_X_1_Y_2_given_X_2)) , (1 - p^2) / (2^(2 * rate * I_X_2_Y_1_given_X_1)) ];  

    
end
total_D = D(: , 1) + D(: , 2) ; 
D_t = min(total_D) ; 
SDR = 10 * log10(2 / D_t) ; 
end
