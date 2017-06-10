% variaveis
m = 68.1;
g = 9.81;
c = 0.25;

%limites
a = 0;
b = 6;

%funcao
syms t;
vt = sqrt(g*m/c) * tanh(sqrt(g*c/m) * t);

real = int(vt, a, b);
fprintf('Valor real da funcao no intervalo de %.2f ate %.2f eh %.16f\n', a, b, real); 


[valor, erro_aproximado, erro_percentual] = trapezio(vt, a, b);
fprintf('\nRegra do Trapezio\n');
fprintf('Valor: %.16f \t Erro Aproximado: %.16f \t Erro Percentual: %.4f%%\n', valor, erro_aproximado, erro_percentual);


[valor, erro_aproximado, erro_percentual] = trapezio_composto(vt, a, b, 5);
fprintf('\nRegra do Trapezio com Multiplas Aplicacoes\n');
fprintf('Valor: %.16f \t Erro Aproximado: %.16f \t Erro Percentual: %.4f%%\n', valor, erro_aproximado, erro_percentual);


[valor, erro_aproximado, erro_percentual] = regra_simpson_1_3(vt, a, b);
fprintf('\nRegra de Simpson 1/3\n');
fprintf('Valor: %.16f \t Erro Aproximado: %.16f \t Erro Percentual: %.4f%%\n', valor, erro_aproximado, erro_percentual);

[valor, erro_aproximado, erro_percentual] = regra_simpson_1_3_repetida(vt, a, b, 9);
fprintf('\nRegra de Simpson 1/3 com Multiplas Aplicacoes\n');
fprintf('Valor: %.16f \t Erro Aproximado: %.16f \t Erro Percentual: %.4f%%\n', valor, erro_aproximado, erro_percentual);


[valor, erro_aproximado, erro_percentual] = regra_simpson_3_8_repetida(vt, a, b, 1);
fprintf('\nRegra de Simpson 3/8\n');
fprintf('Valor: %.16f \t Erro Aproximado: %.16f \t Erro Percentual: %.4f%%\n', valor, erro_aproximado, erro_percentual);


[valor, erro_aproximado, erro_percentual] = regra_simpson_3_8_repetida(vt, a, b, 13);
fprintf('\nRegra de Simpson 3/8 com Multiplas Aplicacoes\n');
fprintf('Valor: %.16f \t Erro Aproximado: %.16f \t Erro Percentual: %.4f%%\n', valor, erro_aproximado, erro_percentual);

[valor, erro_aproximado, erro_percentual] = regra_boole(vt, a, b);
fprintf('\nRegra de Boole\n');
fprintf('Valor: %.16f \t Erro Aproximado: %.16f \t Erro Percentual: %.4f%%\n', valor, erro_aproximado, erro_percentual);

