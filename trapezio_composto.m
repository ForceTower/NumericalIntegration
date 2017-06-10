function [valor, erro_aproximado, erro_percentual] = trapezio_composto(vt, a, b, n)
    h = (b - a)/n;
    
    somatorio = 0;
    for i = 1 : n - 1
        somatorio = somatorio + subs(vt, a + i * h);
    end
    
    valor = (h/2) * (subs(vt, a) + subs(vt, b) + 2 * somatorio);
    
    segunda_derivada = diff(vt, 2);
    
    maximo = encontrar_maximo(segunda_derivada, a, b);
    
    erro_aproximado = abs( ((b - a)^3)/(12*(n^2)) * maximo );
    
    erro_percentual = calc_erro_percentual(vt, a, b, valor);
end