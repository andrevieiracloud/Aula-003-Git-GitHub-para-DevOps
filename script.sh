#!/bin/bash

while true; do
    echo "1 - ADICIONAR"
    echo "2 - LISTAR"
    echo "3 - EDITAR"
    echo "4 - EXCLUIR"
    echo "5 - SAIR"

    echo "digite uma opção:"
    read opcao
    case $opcao in
        1) echo "adicionar novo item:"
            echo "digite o nome do novo item:"
            read item 
                echo $item >> meus_produtos.txt 
                echo "o produto $item foi adicionado com sucesso." ;;
        2) echo "listar os itens:"
            echo "seus produtos são:"
                cat meus_produtos.txt ;;
        3) echo "editar os itens" 
            nano meus_produtos.txt
            echo "seus produtos foram editados com sucesos."
            ;;
        4) echo "excluir algum item"
            echo "digite o produto que voce quer excluir:"
            read excluir
                
                if grep $excluir ./meus_produtos.txt; then
                    sed -i "/$excluir/d" meus_produtos.txt
                    echo "o produto $excluir foi deletado com sucesso."
                else 
                    echo "o produto não foi econtrado."
                fi ;;
                
        5) echo "saindo do programa" 
            break ;;
    esac
done

# logs do programa
echo "erros ao passar algum dado" >> error.log


cp -R ./meus_produtos.txt ./backup/meus_produtos-$(date +%F).txt
