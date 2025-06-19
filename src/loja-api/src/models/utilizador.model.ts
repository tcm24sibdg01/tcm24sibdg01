import {Entity, model, property} from '@loopback/repository';

@model()
export class Utilizador extends Entity {
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
  nome: string;

  @property({
    type: 'string',
    required: true,
  })
  username: string;

  @property({
    type: 'string',
    required: true,
  })
  tipo_perfil: string;


  constructor(data?: Partial<Utilizador>) {
    super(data);
  }
}

export interface UtilizadorRelations {
  // describe navigational properties here
}

export type UtilizadorWithRelations = Utilizador & UtilizadorRelations;
