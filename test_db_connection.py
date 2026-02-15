#!/usr/bin/env python
# Script para testar e criar base de dados RebeccaGest

import sys
import os
sys.path.insert(0, os.path.abspath('.'))

import odoo
from odoo.sql_db import db_connect
from odoo.tools import config

# Configurar variaveis
config['db_host'] = 'localhost'
config['db_port'] = 5432
config['db_user'] = 'postgres'
config['db_password'] = ''  # Tenta sem password primeira
config['db_template'] = 'template1'

print("Testando conexão ao PostgreSQL...")
try:
    conn = db_connect(
        host='localhost',
        port=5432,
        user='postgres',
        password='',
        database='postgres'
    )
    print("✓ Conexão bem-sucedida (sem password)")
except Exception as e:
    print(f"✗ Erro: {e}")
    # Tentar com host local
    print("\nTentando com socket local...")
    try:
        conn = db_connect(
            user='postgres',
            database='postgres'
        )
        print("✓ Conexão via socket bem-sucedida")
    except Exception as e2:
        print(f"✗ Erro: {e2}")

print("\nDone!")
