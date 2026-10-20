media-organizer/
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
├── arquitetura.txt          # Arquitetura do programa (sendo enviada aqui por não ser possível inserir isso no readme.md
├── requisitos.ods           # Instruções venv, PySide6, requests
└── README.md
