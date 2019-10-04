function H_b = binary_entropy (x)
if (x == 0 || x == 1)
    H_b = 0 ;
else
    H_b = -(x * log2(x) + (1 - x) * log2(1 - x)) ;
end
end