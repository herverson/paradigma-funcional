defmodule QuestionsFunctional do

  def zipar(_, []), do: []
  def zipar([], _), do: []
  def zipar([a | as], [b | bs]), do: [{a,b} | zipar(as, bs)]

  # def elemento(_, []), do: false
  # def elemento(a, [b | bs]) when a==b, do: true
  # def elemento(a, [b | bs]), do: elemento a, bs
  def elemento(_, []), do: false
  def elemento(a, [b | bs]) do
    if a==b do
      true
    else
      elemento a, bs
    end
  end

  def inicio([]), do: []
  def inicio([_ | []]), do: []
  def inicio([a | as]), do: [a | (inicio as)]

  def cabeca([]), do: raise "Lista vazia"
  def cabeca([a | _]), do: a

  def comprimento([]), do: 0
  def comprimento([_ | as]), do: 1 + comprimento(as)

  def remover(_, []), do: []
  def remover(0, a),  do: a
  def remover(n, [_ | as]),  do: remover (n-1), as

  def pegar(_, []), do: []
  def pegar(0, _), do: []
  def pegar(n, [a | as]) do
    [a | pegar((n-1), as)]
  end

  def inverter([]), do: []
  def inverter([a | as]), do: (inverter as) ++ [a]

  # Questão 2
  def dobrar(l), do: for x <- l, do: 2*x

  def contar(_,[]), do: 0
  def contar(a, [b | bs]) do
    if a==b do
      1 + contar a, bs
    else
      contar a, bs
    end
  end
  def filtraMinusculas(s) do
    for x <- s, elemento(x, ?a..?z |> Enum.to_list), do: x
  end

  # Questão 3
  def fib(1), do: 1
  def fib(2), do: 1
  def fib(n), do: fib(n-1) + fib(n-2)

  def fibList(n), do: for x <- 1..n, do: fib x

  # Questão 4
  def divisores(n), do: for x <- 1..n, rem(n,x) == 0, do: x
  def quantDiv(n), do: comprimento divisores n

  def isPrimo(1), do: true
  def isPrimo(n), do: quantDiv(n) == 2

  def primosAte(n), do: for x <- 1..n, isPrimo(x), do: x

  # Questão 6

  def menores(a, l), do: for x <- l, x < a, do: x
  def maiores(a, l), do: for x <- l, x > a, do: x
  def quicksort([]), do: []
  def quicksort([a | as]), do: (quicksort (menores a, as)) ++ [a] ++ (quicksort (maiores a, as))

  # Questao 8

  def capsLock(a), do: capsLockAux a, ?a..?z |> Enum.to_list, ?A..?Z |> Enum.to_list

  def capsLockAux(a, [], []), do: a
  def capsLockAux(a,[m | ms], [n | ns]) do
    if a==m do
      n
    else
      capsLockAux a, ms, ns
    end
  end

  def capsLockString(s), do: for x <- s, do: capsLock x

  # prova
  ## Questao
  # 1) (1,25 ponto) Escreva uma função em Haskell da forma padraoC n que receba um número
  # inteiro n e retorne uma lista que representa um padrão concêntrico, com o valor n nas bordas e
  # descrescendo até o meio da lista. Exemplo: padraoC 5 = [5,4,3,2,1,2,3,4,5]

  def padraoC(1), do: [1]
  def padraoC(n), do: [n | padraoC(n-1) ++ [n]]

  # 2) (1,25 ponto) Deseja-se fazer um programa de renomeação de arquivos automático onde uma das
  # funcionalidades é anexar uma determinada string ao nome de um conjunto de arquivos. Escreva
  # uma função em Haskell da forma (appendList ext list) que receba uma string ext, uma lista de
  # strings list e retorne a lista de strings com ext anexada ao final de cada string da lista list.
  # Exemplo: appendList “.txt” [“alfa”, “beta”] = [“alfa.txt”, “beta.txt”]
  # para strings
  def appendList(ext, list), do: for x <- list, do: x <> ext
  # para caracteres
  # def appendList(ext, list), do: for x <- list, do: x ++ ext

  # 3) (1,25 ponto) Escreva uma função em Haskell da forma bigLast list que receba uma lista list
  # e reorganize seus elementos deixando o maior elemento por último, mas mantendo a ordem de
  # todos os demais. Exemplo: bigLast [1,8,6,4] = [1,6,4,8]
  def maior([a | []]), do: a
  def maior([a | as]) do
    if a > as do
      a
    else
      maior as
    end
  end
  def bigLast([a | []]), do: [a]
  def bigLast([a | as]) do
    if a > maior as do
      as ++ [a]
    else
      [a | bigLast as]
    end
  end

  # 4) (1,25 ponto) Suponha um função qualquer, em Haskell, com assinatura f::Int->Int. Escreva
  # uma função seq f n que utilize a função f e um número inteiro positivo n para criar uma sequência
  # de pares ordenados (x,y) dos pontos sobre a função f com x variando de 0 até n.
  # Exemplo: seq f 5 = [(0,1),(1,3),(2,5),(3,7),(4,9),(5,11)], onde f x = 2*x+1
  def f(x), do: 2*x+1
  def seq(n), do: for x <- 0..n, do: {x, f(x)}
  # 5)(1,25 ponto) Escreva um predicado split(L,N,L1,L2), em Prolog, que divide a lista L em duas
  # listas L1 e L2, onde o tamanho de L1 é dado por N.
  # Exemplo: ?- split([a,b,c,d,e,f,g,h],3,L1,L2). → L1 = [a,b,c], L2 = [d,e,f,g,h]
  def take(_, []), do: []
  def take(0, _), do: []
  def take(n, [a | as]), do: [a | take(n-1, as)]
  def drop(_, []), do: []
  def drop(0, a ), do: a
  def drop(n, [_ | as]), do: drop n-1, as
  def split(n, list), do: {take(n, list), drop(n, list)}

  #9) (1,5 ponto) Suponha um triângulo de tijolos onde cada linha possui exatamente um tijolo a
  # menos do que a linha inferior. Cada tijolo possui um número associado. Se o tijolo não é da base do
  # triângulo, seu valor é igual a soma dos valores dos dois tijolos inferiores que ele possui contato. Os
  # tijolos da base possuem valores quaisquer. Escreva uma função Haskell ou um predicado Prolog tal
  # que dada uma sequência de valores dos tijolos da base, encontre o valor do tijolo do topo.
  # Exemplo:
  #              [48]
  #            [20][28]
  #          [8 ][12][16]
  #        [3 ][5 ][7 ][9 ]
  #      [1 ][2 ][3 ][4 ][5 ]
  # Haskell: piramide [1,2,3,4,5] = 48
  # Prolog: ?- piramide([1,2,3,4,5],N) → N = 48
  # Dica: Crie uma função (Haskell) ou um predicado (Prolog) auxiliares para calcular uma camada
  # imediatamente superior a outra.
  def sup([_ | []]), do: []
  def sup([a,b | as]), do: [a+b | sup([b|as])]
  def piramide([a | []]), do: a
  def piramide(base), do: piramide(sup base)
  # 9) (1,5 ponto) O mergeSort é um algoritmo de ordenação do
  # tipo dividir-para-conquistar. Sua ideia básica é subdividir a
  # lista de elementos original em duas listas de tamanhos iguais
  # (ou quase, em caso de no impar de elementos), ordenar estas
  # listas recursivamente e então combinar os resultados
  # formando a lista ordenada com todos os elementos. Ao lado
  # mostra-se o exemplo de execução do mergeSort sobre uma
  # lista com 7 elementos.
  def mergeSort([l]), do: [l]
  def mergeSort(list) do
      {l, r} = Enum.split(list, div(length(list), 2))
      :lists.merge(mergeSort(l), mergeSort(r))
  end
  # 1) (1,25 ponto) Uma progressão aritmética é uma sequência numérica em que cada termo, a partir do
  # segundo, é igual a soma do termo anterior com uma constante r. Suponha agora uma variação onde a
  # progressão possui duas razões r1 e r2. Cada elemento é igual ao anterior adicionado de uma das razões
  # alternando-se as razões (Ex: 1, 4, 5, 8, 9, 12, 13, 16, ... com razões 3 e 1 alternando-se),. Escreva uma função
  # em Haskell duplaPA a r1 r2 n que implemente os n primeiros elementos de uma sequência deste tipo
  # recebendo também o elemento inicial a e as razões r1 e r2.
  # Exemplo: duplaPA 1 3 1 8 = [1,4,5,8,9,12,13,16]
  def duplaPA(_, _, _, 0), do: []
  def duplaPA(a, r1, r2, n), do: [a | duplaPA((a+r1), r2, r1, (n-1))]

  # 2) (1,25 ponto) Escreva uma função em Haskell da forma pares::[Int]->[Int] que receba uma lista de
  # inteiros e retorne apenas os números pares presentes na lista.
  # Exemplo: pares [2,5,1,4,6] = [2,4,6]
  def pares(l), do: for x <- l, rem(x,2) == 0, do: x

  # 3) (1,25 ponto) Escreva uma função comprimir::[a]->[a] que elimina todos os elementos duplicados
  # consecutivos de uma lista de elementos.
  # Exemplo: comprimir ['a','a','a','a','b','c','c','a','a','d','e','e','e'] = ['a','b','c','d','e']
  def comprimir([]), do: []
  def comprimir([a | []]), do: [a]
  def comprimir([a | as]), do: [a] ++ (for x <- comprimir(as), x != a, do: x )


  # 4) (1,25ponto)Escreva uma função em Haskell replicar::[a]->Int->[a] que receba uma lista e um
  # inteiro n e replique cada elemento da lista n vezes.
  # Exemplo: replicar [a,b,c] 3 = [a,a,a,b,b,b,c,c,c]
  def repete(_, 0), do: []
  def repete(a, n), do: [a | repete(a, (n-1))]

  def replicar([],_), do: []
  def replicar([a | as], n), do: (repete a, n) ++ (replicar as, n)

  # 8) (1,25 ponto) Escreva um predicado substitui(X,Y,L1,L2), em Prolog. que substitui todas as ocorrências de X em uma lista
  # L1 por Y, resultando em uma nova lista L2.
  # Exemplo: ?- substitui(3,5,[3,3,7,1,6,3,7,3],L2).   L2 = [5,5,7,1,6,5,7,5]

  def substitui(_, _, []), do: []
  def substitui(x, y, [a | as]) do
    if x == a do
      [y | substitui(x, y, as)]
    else
      [a | substitui(x, y, as)]
    end
  end
  #20) Escreva em Prolog uma regra rem(X,L1,L2) em que L2 é igual a lista L1 com o elemento X removido
  # caso ele esteja presente em L1. Dois exemplos de consultas usando a regra rem:
  # ?- rem('c',['a','b','c','d','e'],L).
  # L = ['a','b','d','e']
  # ?- rem('z',['a','b','c','d','e'],L).
  # L = ['a','b','c','d','e']
  def remo(_, []), do: []
  def remo(x, [a | as]) do
    if x == a do
      remo(x, as)
    else
      [a | remo(x, as)]
    end
  end
  # 20) InsertionSort é um algoritmo de ordenação que, dada uma lista com n
  # números, ele vai inserindo os elementos um a um em uma lista,
  # inicialmente vazia, colocando os elementos na ordem correta. A figura ao
  # lado mostra um esboço da ideia: o elemento x é reservado, o restante da
  # lista é ordenado recursivamente, e x é inserido na posição apropriada nesta
  # nova lista ordenada. Implemente esse algoritmo em Haskell.
  def insere(a, []), do: [a]
  def insere(a, [b | bs]) do
    if a < b do
      [a,b | bs]
    else
      [b |insere(a, bs)]
    end
  end
  def insertionSort([]), do: []
  def insertionSort([a | as]), do: insere(a, insertionSort as)
  # Questão 23
  def torre({x,y}), do: (vertical({x,y})) ++ (horizontal({x,y}))
  defp horizontal({x,y}), do: for a <- 1..8 , a != x, do: {a,y}
  defp vertical({x,y}),   do: for b <- 1..8 , b != y, do: {x,b}
  
end
