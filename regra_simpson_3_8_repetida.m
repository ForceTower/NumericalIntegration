function [valor, erro_aproximado, erro_percentual] = regra_simpson_3_8_repetida(vt, a, b, n)
    m = 3 * n;
    h = (b - a)/m;
    
    somatorio_0 = 0;
    somatorio_1 = 0;
    for i = 1 : m-1
        if (mod(i, 3))
            somatorio_1 = somatorio_1 + subs(vt, a + h * i);
        else
            somatorio_0 = somatorio_0 + subs(vt, a + h * i);
        end
    end
    
    valor = (h*(3/8)) * (subs(vt, a) + subs(vt, b) + 2 * somatorio_0 + 3 * somatorio_1);
    
    quarta_derivada = diff(vt, 4);
    maximo = encontrar_maximo(quarta_derivada, a, b);
    
    erro_aproximado = ((h^5)/(80 * (m^4))) * maximo;
    
    erro_percentual = calc_erro_percentual(vt, a, b, valor);
end