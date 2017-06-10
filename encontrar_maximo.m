function [maximo] = encontrar_maximo(fx, a, b)
    maximo = subs(fx, a);
    maximo = abs(maximo);
    
    for i = a : b
        temp = subs(fx, i);
        temp = abs(temp);
        if (temp > maximo)
            maximo = temp;
        end
    end
end