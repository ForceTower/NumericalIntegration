function [erro_percentual] = calc_erro_percentual(vt, a, b, valor)
    real = int(vt, a, b);
    erro_percentual = ( abs((real - valor)) * 100)/real;
end