Media Shell

  O Media Shell (placeholder) tem como propósito ajudar na preservação de mídias (filmes/séries) antigas que foram portadas
para o ambiente virtual, oferecendo uma forma prática de organizar e facilitar o acesso e reprodução das mesmas. 
  Isto é feito através da conexão com a API do The Movie Database que permite com que as informações dos filmes e séries sejam 
expostos automaticamente ao adicionar um filme ao programa.

  Arquitetura:
organizador/
├── docs/                      # Documentação
│   ├── diagramas/             # Diagramas, Fluxogramas
│   └── prototipo/             # Protótipo desenvolvido no penpot
├── src/
│   ├── data/                  # Banco de dados e script SQL
│   │   ├── database.py        # Conexão SQLite e queries principais
│   │   └── script.sql         # Script SQLite
│   ├── api/                   # Integração com serviços externos
│   │   └── tmdb_service.py    # Conexão e buscas na API do TMDB
│   ├── presenters/            # Lógica de apresentação (MVP)
│   │   └── main_presenter.py  # Conecta a View com a Data e a API
│   ├── views/                 # Interfaces gráficas (PySide6)
│   │   └── main_window.py     # Janela principal baseada no protótipo do Penpot
│   ├── paths.py               # Utilitário para achar caminhos de arquivos/pastas
│   └── main.py                # Ponto de entrada da aplicação
├── .gitignore
├── requisitos.txt           # Instruções venv, PySide6, requests
└── README.md
