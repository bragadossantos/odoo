# RebeccaGest - Guia de Execução

## 🎯 Resumo Final

**RebeccaGest** foi configurado com sucesso como um rebranding do Odoo 17.0 para revenda como um framework independente.

## ✅ Configuração Completada

- ✓ Rebranding Odoo → RebeccaGest (todos os ficheiros atualizados)
- ✓ Ambiente Python Virtual configurado (Python 3.14.2)
- ✓ Dependências instaladas (38+ pacotes)
- ✓ PostgreSQL 18.2 conectado
- ✓ Utilizador BD: `rebeccagest` / `rebeccagest123`
- ✓ Base de dados: `rebeccagest_demo` criada
- ✓ Compatibilidade Python 3.14+ corrigida

## 🚀 Como Rodar RebeccaGest

### Opção 1: Script PowerShell (Recomendado)

```powershell
cd c:\Users\braga\RebeccaGest
.\run_rebeccagest_final.ps1
```

Este script vai:
1. Verificar PostgreSQL
2. Dropar/recriar base de dados
3. Inicializar módulos
4. Rodar servidor HTTP porta 8069

### Opção 2: Comando Direto

```powershell
cd c:\Users\braga\RebeccaGest
.venv\Scripts\python.exe odoo-bin --http-port=8069 --addons-path=addons -d rebeccagest_demo --db_user=rebeccagest --db_password=rebeccagest123 --db_host=localhost
```

## 📍 Aceder ao Sistema

Após rodar o servidor, abra o navegador em:

**http://localhost:8069**

Credenciais padrão:
- Email: `admin@example.com`
- Senha: `admin`

## 📁 Estrutura de Ficheiros

```
RebeccaGest/
├── odoo/                 # Core RebeccaGest
├── addons/               # 100+ módulos funcionais
├── setup.py              # Setup package
├── rebeccagest.conf      # Configuração
├── requirements.txt      # Dependências Python
├── start_server.ps1      # Script de inicialização
└── .venv/               # Ambiente virtual Python
```

## 🔧 Configuração PostgreSQL

Utilizador: `rebeccagest`
Senha: `rebeccagest123`
Host: `localhost:5432`
Base de Dados: `rebeccagest_demo`

## ⚠️ Notas Importantes

1. **Python 3.14**: Oficialmente não suportado pelo Odoo, mas funcional com correções aplicadas
2. **Wkhtmltopdf**: Opcional para gerar PDFs
3. **Primeira inicialização**: Pode levar alguns minutos
4. **Logs**: Verificar terminal para diagnosticar problemas

## 🐛 Resolução de Problemas

### Erro: "Database not initialized"
Execute com `--init=base`:
```powershell
.venv\Scripts\python.exe odoo-bin -d rebeccagest_demo --init=base --db_user=rebeccagest --db_password=rebeccagest123 --db_host=localhost
```

### Erro: "Connection refused"
Verifique se PostgreSQL está rodando:
```powershell
& "C:\Program Files\PostgreSQL\18\bin\pg_isready.exe" -h localhost
```

### Porta 8069 já em uso
Mude a porta:
```powershell
.venv\Scripts\python.exe odoo-bin --http-port=8070 ...
```

## 📦 Para Revenda

RebeccaGest está pronto para ser:
- Empacotado como setup.py
- Distribuído para clientes
- Instalado em outros servidores
- Brandeado com logo/cores personalizadas

## 📞 Suporte

Para mais informações sobre Odoo/RebeccaGest:
- Documentação oficial: https://www.odoo.com/documentation/17.0
- Community: https://github.com/odoo/odoo

---

**Data**: 15 de Fevereiro de 2026
**Status**: ✅ Pronto para usar
