# -*- coding: utf-8 -*-
# Part of RebeccaGest. See LICENSE file for full copyright and licensing details.

import odoo


def db_list(force=False, host=None):
    return []

odoo.http.db_list = db_list
