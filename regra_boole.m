function [valor, erro_aproximado, erro_percentual] = regra_boole(vt, a, b)
    h = (b - a)/4;
    
    x0 = a;
    x1 = a + h;
    x2 = a + (2 * h);
    x3 = a + (3 * h);
    x4 = b;
    
    v_x0 = subs(vt, x0);
    v_x1 = subs(vt, x1);
    v_x2 = subs(vt, x2);
    v_x3 = subs(vt, x3);
    v_x4 = subs(vt, x4);
    
    valor = ((2 * h)/45) * ( (7 * v_x0) + (32 * v_x1) + (12 * v_x2) + (32 * v_x3) + (7 * v_x4) );
    
    sexta_derivada = diff(vt, 6);
    maximo = encontrar_maximo(sexta_derivada, a, b);
    erro_aproximado = (8/945) * (h^7) * maximo;
    
    erro_percentual = calc_erro_percentual(vt, a, b, valor);
    
end