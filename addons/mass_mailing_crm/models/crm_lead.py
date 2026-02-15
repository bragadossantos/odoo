# -*- coding: utf-8 -*-
# Part of RebeccaGest. See LICENSE file for full copyright and licensing details.

from odoo import models


class CrmLead(models.Model):
    _inherit = 'crm.lead'
    _mailing_enabled = True
