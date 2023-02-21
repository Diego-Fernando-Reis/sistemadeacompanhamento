# sistemadeacompanhamento
Existem outras entidades além dessas três?
Sim. Além de cursos, turmas e alunos, podemos adicionar módulos, projetos, facilitadores, materiais.



Quais são os principais campos e tipos?

Campos alunos- nome(VARCHAR), email(VARCHAR), turma(FOREIGN KEY)

Campos cursos - Nome(VARCHAR), requisitos(VARCHAR)

Campos turmas - nome(VARCHAR), curso1(FOREIGN KEY), curso2 (FOREIGN KEY), facilitador1(FOREIGN KEY), facilitador2(FOREIGN KEY).

Campos módulos - nome(VARCHAR), curso(FOREIGN KEY).

Campos projetos - tipo de projeto(VARCHAR), modulo(FOREIGN KEY), nome(VARCHAR).

Campos facilitadores - nome(VARCHAR), email(VARCHAR).




Como essas entidades estão relacionadas?

A entidade alunos se relaciona com turmas, decidi colocar a chave estrangeira turma dentro de alunos pois, cada aluno tem somente
uma turma, enquanto as turmas tem mais de 1 aluno.

A entidade turmas receberá o cursos tirando a necessidade de aluno receber também o curso e cada turma se relaciona com somente 
2 cursos, enquanto cada curso pode se relacionar com muito mais turmas.

A entidade cursos não recebe chave estrangeira, pois já está em bastante relações.

A entidade módulos recebe curso, pois cada módulo só pode estar em apenas 1 curso.

A entidade projetos recebe módulos, pois cada projeto tem seu respectivo módulo e o módulo tem mais de 1 projeto.

A entidade facilitadores recebe apenas cursos, enquanto o curso pode ter mais de um facilitador.
