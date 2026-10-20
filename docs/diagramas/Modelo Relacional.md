Midia {id_midia, id_tmdb, caminho_capa, titulo, titulo_original, sinopse, nota, idioma_original, data_lancamento, tipo}
    id_midia - chave primária 
    tipo - 1: Filme, 2: Série

Filme {id_midia, duracao}
    id_midia - chave estrangeira referenciando Midia

Serie {id_midia, n_episodios, n_temporadas}
    id_midia - chave estrangeira referenciando Midia

Genero {id_genero, nome}
    id_genero - chave primária
   
Diretorio {id_diretorio, nome}
    id_diretorio - chave primária

Possuir {id_genero, id_midia}
    id_genero - chave estrangeira referenciando Genero
    id_midia - chave estrangeira referenciando Midia

Conter {id_diretorio, id_midia, data_adicao}
    id_diretorio - chave estrangeira referenciando diretorio
    id_midia - chave estrangeira referenciando midia

  
