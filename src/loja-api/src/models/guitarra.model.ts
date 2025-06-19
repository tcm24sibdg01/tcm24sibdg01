import {Entity, model, property, belongsTo} from '@loopback/repository';
import {Venda} from './venda.model';

@model()
export class Guitarra extends Entity {
  @property({
    type: 'string',
    id: true,
    generated: true,
  })
  id?: string;

  @property({
    type: 'string',
    required: true,
  })
  modelo: string;

  @property({
    type: 'string',
    required: true,
  })
  tipo: string;

  @property({
    type: 'string',
    required: true,
  })
  cor: string;

  @property({
    type: 'string',
    required: true,
  })
  acabamento: string;

  @property({
    type: 'number',
    required: true,
  })
  ano: number;

  @property({
    type: 'number',
    required: true,
  })
  preco: number;

  @belongsTo(() => Venda)
  vendaId: number;

  constructor(data?: Partial<Guitarra>) {
    super(data);
  }
}

export interface GuitarraRelations {
  // describe navigational properties here
}

export type GuitarraWithRelations = Guitarra & GuitarraRelations;
