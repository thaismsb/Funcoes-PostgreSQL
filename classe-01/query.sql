--Faça uma query que retorna a quantidade de registros da tabela `usuarios`.
SELECT COUNT(*) FROM usuarios;

--1 - Faça uma query que retorna a quantidade de medicamentos da tabela `farmacia`.
SELECT count(medicamento) FROM farmacia;

--2 - Faça uma query que retorna apenas a idade do usuario mais novo cadastrado na tabela `usuarios`.
SELECT idade FROM usuarios ORDER BY idade ASC LIMIT 1;
SELECT min(idade) FROM  usuarios;

--3 - Faça uma query que retorna apenas a idade do usuario mais velho cadastrado na tabela `usuarios`.
SELECT idade FROM usuarios ORDER BY idade DESC LIMIT 1;
SELECT max(idade) FROM  usuarios;

--4 - Faça uma query que retorna a média de idade entre os usuários cadastrados na tabela `usuarios` com idade maior ou igual a 18 anos.
SELECT round(avg(idade),2) FROM  usuarios WHERE idade >= 18;

--5 - Faça uma query que retorna a soma total do estoque de todos os medicamentos das categorias `blue` e `black` na tabela `farmacia`.
SELECT sum(estoque) FROM farmacia WHERE categoria ='blue' OR categoria ='black';

--6 - Faça uma query que retorna todas as categorias não nulas e a soma do estoque de todos os medicamentos de cada categoria na tabela `farmacia`.
SELECT categoria,sum(estoque) FROM farmacia WHERE categoria IS NOT NULL GROUP BY categoria;

--7 - Faça uma query que retorna a soma do estoque disponível dos medicamentos sem categoria na tabela `farmacia`.
SELECT  sum(estoque) FROM farmacia WHERE categoria IS NULL;

--8 - Faça uma query que retorna a quantidade de medicamentos sem categoria na tabela `farmacia`.
SELECT  count(medicamento) FROM farmacia WHERE categoria IS NULL;

--9 - Faça uma query que retorna uma única coluna com a junção do nome do medicamento e a categoria entre parenteses de todos os registros em que a categoria não seja nula da tabela `farmacia`. Ex.: `Endocet (green)`.
SELECT medicamento || '(' ||categoria || ')' FROM farmacia;
SELECT concat(medicamento,'(',categoria,')') FROM farmacia;

--10 - Faça uma query que retorna uma única coluna com a junção do identificador e o nome do medicamento separado por um hífen e a categoria entre parenteses de todos os registros da tabela `farmacia`. Quando a categoria for nula, substituir por `(sem categoria)`. Ex.: `1 - Endocet (green)` ou `1 - Endocet (sem categoria)`.
SELECT concat(id,'-  ',medicamento,'  (',COALESCE(categoria,'sem categoria'),')') FROM farmacia;

--11 - Faça uma query que retorna o nome, a idade e a data de cadastro no formato `AAAA-MM-DD` de todos os cadastros que aconteceram no ano de 2020, na tabela `usuarios`.
SELECT nome,idade, CAST(cadastro AS date) FROM usuarios WHERE CAST(cadastro AS date) BETWEEN ('2020-01-01') AND ('2020-12-31');

--12 - Faça uma query que retorna o nome, a idade, o email e o tempo que cada usuario menor de 18 anos possui cadastrado na tabela `usuarios`. O tempo precisa ser uma coluna que retorne a quantidade de anos, meses, dias, horas, minutos e segundos em um objeto. Ex.: `{"years":2,"months":2,"days":19,"hours":8,"minutes":22,"seconds":19}`.
SELECT nome,idade,email,AGE(CAST(cadastro AS timestamp)) FROM usuarios WHERE idade <18;

--13 - Faça uma query que retorna o nome, a idade, o email e o tempo que cada usuario, maior ou igual a 60 anos, possui cadastrado na tabela `usuarios`. O tempo precisa ser uma coluna que retorne apenas a quantidade de anos, meses, dias em um objeto. Ex.: `{"years":2,"months":2,"days":19}`.
SELECT nome,idade,email,AGE(CAST(cadastro AS timestamp)) AS tempo FROM usuarios WHERE idade >=60;

--14 - Faça uma query que retorna a categoria e a quantidade de produtos de cada categoria que não seja nula da tabela `farmacia`.
SELECT categoria, count(*) as quantidade FROM farmacia WHERE categoria IS NOT NULL GROUP BY categoria ;

--15 - Faça uma query que retorna a idade e a quantidade de registros de cada idade, onde a idade seja maior ou igual a 18 anos, na tabela `usuarios`.
SELECT idade, count(*) as registros FROM usuarios WHERE idade>=18 GROUP BY idade;

--16 - Faça uma query que retorna as três categorias e a soma do estoque de todos os medicamentos de cada categoria, na tabela `farmacia`.
SELECT categoria,sum(estoque) FROM farmacia GROUP BY categoria;