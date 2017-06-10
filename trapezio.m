function [valor, erro_aproximado, erro_percentual] = trapezio(vt, a, b)
    valor = ((subs(vt, a) + subs(vt, b))/2) * (b - a);
    
    segunda_derivada = diff(vt, 2);
    
    maximo = encontrar_maximo(segunda_derivada, a, b);
    
    erro_aproximado = abs((((b - a)^3)/12) * maximo);
    
    erro_percentual = calc_erro_percentual(vt, a, b, valor);
end