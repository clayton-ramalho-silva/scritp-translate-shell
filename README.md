Script Desenvilvido em shell script para tradução do valor de uma array associativo.

O Problema: 
O arquivo de linguagem de uma aplicação continha uma array associativo(chave:valor). Onde a chave era utilizada para localizar frase e o valor era a frase utilizada. 

Ex.:

<?php

return [
        // chave                                // valor(a ser traduzido)
    'alert_restaurant_out_from_campaign'=> 'You want your restaurant out from this campaign?,
    'alert_restaurant_join_campaign' => 'You want join this campaign?',
    'about_us' => 'About us',
    ... 1000 linhas
]

?>

Solução para Automatizar o Processo:

1) Instalar utilitário de linha de comando chamado Translate Shell - é um google tradutor de linha de comando. 
Segue tutorial:
https://terminalroot.com.br/2019/10/traduza-rapidamente-textos-via-linha-de-comando.html

2) Criar um Script para abrir o arquivo ler linha por linha, ler e traduzir o valor do array e depois gravar em outro arquivo no seguinte formato:

'alert_restaurant_out_from_campaign'=> 'Você quer seu restaurante fora desta campanha?',
'alert_restaurant_join_campaign' => 'Você quer participar desta campanha?',
'about_us' => 'Sobre nós',

3) Preparar arquivo:
Tirei:
"""
<?php

return [
...

]

?>
"""
Deixei conforme abaixo. Asssim fica linha a linha padronizado.

'alert_restaurant_out_from_campaign'=> 'You want your restaurant out from this campaign?,
'alert_restaurant_join_campaign' => 'You want join this campaign?',
'about_us' => 'About us',


Script:
- criar arquivo traducao.sh com o conteudo abaixo - nao esquecer de dar permissão de execução.

#!/bin/bash
arquivo="$1"

while IFS= read -r linha; do
parte1=`echo "$linha" | cut -d ">" -f1`
parte2=`echo "$linha" | cut -d ">" -f2`

parte2_trad=`trans -b "$parte2"`
echo "${parte1}> ${parte2_trad}" >> messages_pt_br.txt
done < "$arquivo"



Rápida explicação: 
1- Script recebe uma arquivo ./traducao.sh arquivo.txt.  
2- Lê linha a linha e separa dois campos: parte1(chave do array) e parte2(valor do array).
3- Faz tradução da parte2
4- Junta parte1 e parte2_trad e grava em outro arquivo.


Conclusão:

Após a tradução pegar o conteudo e colocar no conteudo do array original.


