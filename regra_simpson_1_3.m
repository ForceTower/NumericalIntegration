function [valor, erro_aproximado, erro_percentual] = regra_simpson_1_3(vt, a, b)
    x0 = a;
    x1 = (a + b)/2;
    x2 = b;
    h = (b - a)/2;
    
    valor = (h/3) * (subs(vt, x0) + 4 * subs(vt, x1) + subs(vt, x2));
    
    quarta_derivada = diff(vt, 4);
    erro_aproximado = ((h^5)/90) * encontrar_maximo(quarta_derivada, a, b);
    
    erro_percentual = calc_erro_percentual(vt, a, b, valor);
end