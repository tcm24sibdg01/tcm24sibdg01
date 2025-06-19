import {Entity, model, property, belongsTo} from '@loopback/repository';
import {Cliente} from './cliente.model';
import {Utilizador} from './utilizador.model';

@model()
export class Venda extends Entity {
  @property({
    type: 'number',
    id: true,
    generated: true,
  })
  id?: number;

  @property({
    type: 'string',
    required: true,
  })
  data: string;

  @property({
    type: 'number',
    required: true,
  })
  valor: number;

  @property({
    type: 'string',
    required: true,
  })
  metodo_pagamento: string;
  @belongsTo(() => Cliente)
  clienteId: number;

  @belongsTo(() => Utilizador)
  utilizadorId: number;

  constructor(data?: Partial<Venda>) {
    super(data);
  }
}

export interface VendaRelations {
  // describe navigational properties here
}

export type VendaWithRelations = Venda & VendaRelations;
