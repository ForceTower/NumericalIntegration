function [valor, erro_aproximado, erro_percentual] = regra_simpson_1_3_repetida(vt, a, b, n)
    m = 2 * n;
    h = (b - a)/m;
    
    somatorio_par = 0;
    somatorio_impar = 0;
    for i = 1 : m-1
        if (mod(i, 2))
            somatorio_impar = somatorio_impar + subs(vt, a + h * i);
        else
            somatorio_par = somatorio_par + subs(vt, a + h * i);
        end
    end
    
    valor = (h/3) * (subs(vt, a) + subs(vt, b) + 2 * somatorio_par + 4 * somatorio_impar);
    
    quarta_derivada = diff(vt, 4);
    maximo = encontrar_maximo(quarta_derivada, a, b);
    
    erro_aproximado = n * ((h^5)/90) * maximo;
    
    erro_percentual = calc_erro_percentual(vt, a, b, valor);
end